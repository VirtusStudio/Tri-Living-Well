///***********************************************************
///Author Name: Netsmartz
///Creation Date: 22 Dec, 2010
///File Name:   wucEditCompanyDetails.aspx.cs			Component Used: 
///Called From: Presentation layer 
///Description: This page will edit the company details
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

public partial class Controls_wucEditCompanyDetails : System.Web.UI.UserControl
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
            if (AppLib.GetCurrentUserType().ToLower().ToString().Equals("c"))
            {
                trStatus.Visible = false;
                trApprovedStatus.Visible = false;
                lnkBtnBack.Visible = false;
            }

            objBackofficeClass = new BackofficeClass(objSqlConnClass.OpenConnection());
            if (!IsPostBack)
            {
                BindCountry();
                BindCompanyDetails();
            }
        }
        catch { }
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        objSqlConnClass.CloseConnection();
    }
    private void fillState()
    {
        if (ddlCountry.SelectedItem.Text == "USA" || ddlCountry.SelectedItem.Text == "Canada")
        {
            txtStateText.Style.Add("display", "none");
            ddlState.Style.Remove("display");
            //ddlState.SelectedIndex = 0;
        }
        else
        {
            txtStateText.Style.Remove("display");
            ddlState.Style.Add("display", "none");
            ddlState.SelectedIndex = 1;
        }
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
        }
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
    /**************************/
    //Function Name: BindCountry
    //Descirption: function used to bind the countries
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
    protected void lnkBtnBack_Click(object sender, EventArgs e)
    {

        Response.Redirect(AppConfig.GetBaseSiteUrl() + "BackOffice/ManageCompany/ManageCompanies.aspx", true);
    }
    protected void lnkBtnSubmit_Click(object sender, EventArgs e)
    {
        oCompanyInfo = new Entity.CompanyInfo();
        oCompanyInfo.IntCompanyId = Convert.ToInt32(Request.QueryString["id"]);
        oCompanyInfo.StrCompanyName = txtCompanyName.Text.Trim();
        oCompanyInfo.StrCompanyPhone = txtPhone.Text.Trim();
        oCompanyInfo.StrCompanyFax = txtFax.Text.Trim();
        oCompanyInfo.IntCountryId = Convert.ToInt32(ddlCountry.SelectedValue);
        oCompanyInfo.StrStateName = txtStateText.Text.Trim();

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

        oCompanyInfo.StrCity = txtCity.Text.Trim();
        oCompanyInfo.StrCompanyAddress = txtAddress.Text.Trim();

        oCompanyInfo.ChrIsActive = Convert.ToChar(rblStatus.SelectedValue);
        oCompanyInfo.ChrIsApproved = Convert.ToChar(rblApproved.SelectedValue);
        oCompanyInfo.DtModifiedDate = DateTime.Now;


        oCompanyManager = new BLL.CompanyManager();
        if (oCompanyManager.UpdateCompanyDetails(oCompanyInfo) > 0)
        {
            oCompanyInfo = null;
            oCompanyManager = null;

            if (AppLib.GetCurrentUserType().ToLower().ToString().Equals("c"))
            {
                lblError.Text = "Information has been updated successfully.";
            }
            else
            {
                Response.Redirect(AppConfig.GetBaseSiteUrl() + "BackOffice/ManageCompany/ManageCompanies.aspx?m=up", true);
            }
        }
        else
        {
            lblError.Text = "Company Email already exists.";

            return;
        }
    }
    private void ClearControls()
    {
        txtCompanyName.Text = string.Empty;
        txtPhone.Text = string.Empty;
        txtFax.Text = string.Empty;
        ddlCountry.SelectedIndex = 0;
        ddlState.SelectedIndex = 0;
        txtCity.Text = string.Empty;
        txtAddress.Text = string.Empty;
    }

    private void BindCompanyDetails()
    {
        oCompanyInfo = new Entity.CompanyInfo();
        oCompanyManager = new BLL.CompanyManager();
        oCompanyInfo = oCompanyManager.GetCompanyDetailsById(Convert.ToInt32(Request.QueryString["id"]));
        if (oCompanyInfo != null)
        {
            rblStatus.SelectedValue = oCompanyInfo.ChrIsActive.ToString();
            txtAddress.Text = oCompanyInfo.StrCompanyAddress.Trim();
            txtCity.Text = oCompanyInfo.StrCity.Trim();
            lblEmailId.Text = oCompanyInfo.StrCompanyEmail.Trim();
            txtCompanyName.Text = oCompanyInfo.StrCompanyName.Trim();
            txtFax.Text = oCompanyInfo.StrCompanyFax.Trim();
            txtPhone.Text = oCompanyInfo.StrCompanyPhone.Trim();

            ddlCountry.SelectedIndex = ddlCountry.Items.IndexOf(ddlCountry.Items.FindByValue(oCompanyInfo.IntCountryId.ToString()));
            ddlState.SelectedIndex = ddlState.Items.IndexOf(ddlState.Items.FindByValue(oCompanyInfo.IntStateId.ToString()));
            txtStateText.Text = oCompanyInfo.StrStateName;
            fillState();
            // ddlState.SelectedIndex = ddlState.Items.IndexOf(ddlState.Items.FindByValue(oCompanyInfo.IntStateId.ToString()));
            rblApproved.SelectedValue = oCompanyInfo.ChrIsApproved.ToString();
        }


        oCompanyInfo = null;
        oCompanyManager = null;
    }
}