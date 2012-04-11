///***********************************************************
///Author Name: Netsmartz
///Creation Date: 21 Dec, 2010
///File Name:   wucCompanyRegistration.aspx.cs			Component Used: 
///Called From: Presentation layer 
///Description: This page will add the company details
///Tables Accessed: 
///Program specs: TLW
///UTP doc:
///Tested By: 
///***********************************************************************
///Modification History:
///Change No.   Changed By	    Date	    Version	    Raised By/SRS No	    Description
///
/// 
///***********************************************************************
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using aspNetEmail;
/*using Telerik.WebControls;*/
/*Commented by Netsmartz for resolving compile time issues*/
using Telerik.Web.UI;
using System.IO;
public partial class Controls_wucCompanyRegistration : System.Web.UI.UserControl
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    BackofficeClass objBackofficeClass;
    BLL.CompanyManager oCompanyManager;
    Entity.CompanyInfo oCompanyInfo;
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";
        try
        {
            trControls.Visible = true;
            objBackofficeClass = new BackofficeClass(objSqlConnClass.OpenConnection());
            if (!IsPostBack)
            {
                BindCountry();
            }
        }
        catch { }
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        objSqlConnClass.CloseConnection();
    }

    private void BindDropDownList(DropDownList DDL, DataSet DS)
    {
        try
        {
            DDL.DataSource = DS;
            DDL.DataValueField = "Item_ID";
            DDL.DataTextField = "Item_Text";
            DDL.DataBind();
        }
        catch (Exception ex)
        {
            //Response.Write("err: " + ex.Message.ToString());
        }
    }

    private void BindCountry()
    {
        try
        {
            DataSet StateDS = objBackofficeClass.GET_Items_AnyItemTable("State", "List_StateCountry");
            DataSet CountryDS = objBackofficeClass.GET_Items_AnyItemTable("Country", "List_StateCountry");

            BindDropDownList(ddlState, StateDS);
            BindDropDownList(ddlCountry, CountryDS);
        }
        catch
        {
        }
        finally
        {
            objSqlConnClass.CloseConnection();//this line is added by Netsmartz (line is used to close the sql server connection)
        }

    }
    protected void lnkBtnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            oCompanyInfo = new Entity.CompanyInfo();
            oCompanyInfo.StrCompanyEmail = txtCompanyEmail.Text.Trim();
            oCompanyInfo.StrPassword = txtPassword.Text.Trim();
            oCompanyInfo.StrCompanyName = txtCompanyName.Text.Trim();
            oCompanyInfo.StrCompanyPhone = txtPhone.Text.Trim();
            oCompanyInfo.StrCompanyFax = txtFax.Text.Trim();
//DKB 04/09/12
//Remove country from company reg page. I am adding in a hidden field for usa so the stored procs don't have to change
//for country.
            oCompanyInfo.IntCountryId = Convert.ToInt32(hiddenCountry.Value);

/*
David K Bowers 04/09/12
USA only so only display states
for country.
            if (ddlCountry.SelectedValue == "1" || ddlCountry.SelectedValue == "2")//USA || Canada
            {
                oCompanyInfo.IntStateId = Convert.ToInt32(ddlState.SelectedValue);
                oCompanyInfo.StrStateName = ddlState.SelectedItem.Text;
            }
            else
            {
                oCompanyInfo.IntStateId = 0;
                oCompanyInfo.StrStateName = txtStateText.Text.Trim();
            }
*/

            oCompanyInfo.IntStateId = Convert.ToInt32(ddlState.SelectedValue);
            oCompanyInfo.StrStateName = ddlState.SelectedItem.Text;

// David K. Bowers 04/10/12 added in zip code
            oCompanyInfo.StrZipCode = txtZipCode.Text.Trim();

            oCompanyInfo.StrCity = txtCity.Text.Trim();
            oCompanyInfo.StrCompanyAddress = txtAddress.Text.Trim();
// David K. Bowers 04/10/12 changed default values of ChrIsPaid and ChrIsApproved from Y to N
            oCompanyInfo.ChrIsPaid = 'N';
            oCompanyInfo.ChrIsActive = 'N';
            oCompanyInfo.ChrIsApproved = 'N';

            oCompanyInfo.DtCreatedDate = DateTime.Now;
            oCompanyInfo.DtModifiedDate = oCompanyInfo.DtCreatedDate;
            oCompanyInfo.ChrIsDeleted = 'N';
            oCompanyInfo.ChrCreatedBy = 'C';

            oCompanyManager = new BLL.CompanyManager();


            MembershipUser objUser = Membership.CreateUser(oCompanyInfo.StrCompanyEmail, oCompanyInfo.StrPassword, oCompanyInfo.StrCompanyEmail);
            int intRetVal = oCompanyManager.SaveCompanyDetails(oCompanyInfo);
            if (intRetVal > 0)
            {
                sendOutConfirmationEmail();
                string strpath = Request.PhysicalApplicationPath + AppConfig.GetCompanyRequestExcelUploadPath() + intRetVal.ToString();
                DirectoryInfo drInfo = new DirectoryInfo(strpath);
                if (!drInfo.Exists)
                {
                    drInfo.Create();
                }

                oCompanyManager = null;
                oCompanyInfo = null;
                if (Request.QueryString["src"] == null)
                {
                    lblError.Text = "<br /><br /><br /><br />Thanks for your information, TLW will contact you soon.<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />";
                    trControls.Visible = false;
                    ClearControls();
                }
                else
                {
                    Response.Redirect(AppConfig.GetBaseSiteUrl() + "BackOffice/ManageCompany/ManageCompanies.aspx?m=ins", true);
                }
            }
            else
            {
                trControls.Visible = true;
                lblError.Text = "Company Email Id already exists.";
                return;
            }
        }
        catch
        {

            lblError.Text = "Company Email Id already exists.";
            // return;
        }

        oCompanyManager = null;
        oCompanyInfo = null;
    }
    private void sendOutConfirmationEmail()
    {
        try
        {
            string strContent = string.Empty;

            BLL.TemplateLib oTemplateLib = new BLL.TemplateLib();
         
            strContent = oTemplateLib.GetTemplateDetailsByTemplateTemplateName("CompanyRegistrationEmail").TextAreaHTML;
            strContent = strContent.Replace("[CompanyName]", txtCompanyName.Text.Trim());
            strContent = strContent.Replace("[UI_USERNAME]", txtCompanyEmail.Text.Trim());
            strContent = strContent.Replace("[UI_PASSWORD]", txtPassword.Text.Trim());
            strContent = strContent.Replace("[WC_EMAIL_PROJECT_NAME]", AppConfig.GetSiteName());
            strContent = strContent.Replace("[SiteUrl]", AppConfig.GetBaseSiteUrl());
            strContent = strContent.Replace("[SiteName]", AppConfig.GetSiteName());
            strContent = strContent.Replace("[SitePhone]", AppConfig.GetSITEPHONE());
            strContent = strContent.Replace("[Status]", "Deactive");

            AppLib.SendMailToUser(txtCompanyEmail.Text.Trim(), "Registration Request from Tri Living Well", strContent, AppConfig.GetAdminEmail());
            oTemplateLib = null;
        }
        catch { }

    }

    private void ClearControls()
    {
        txtCompanyEmail.Text = string.Empty;
        txtPassword.Text = string.Empty;
        txtCompanyName.Text = string.Empty;
        txtPhone.Text = string.Empty;
        txtFax.Text = string.Empty;
        ddlCountry.SelectedIndex = 0;
        ddlState.SelectedIndex = 0;
        txtCity.Text = string.Empty;
        txtAddress.Text = string.Empty;
    }
    protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlCountry.SelectedItem.Text == "USA" || ddlCountry.SelectedItem.Text == "Canada")
        {
            txtStateText.Style.Add("display", "none");
            ddlState.Style.Remove("display");
          
        }
        else
        {
            txtStateText.Style.Remove("display");
            ddlState.Style.Add("display", "none");
            //ddlStateRequired1.ValidationGroup = "na";
            //ddlStateRequired2.ValidationGroup = "na";
        }

    }

}