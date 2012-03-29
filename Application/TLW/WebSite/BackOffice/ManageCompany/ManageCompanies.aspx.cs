using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_ManageCompany_ManageCompanies : System.Web.UI.Page
{
    BLL.CompanyManager oCompanyManager;
    Entity.CompanyInfo oCompanyInfo;

    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("Manage Companies");

            #endregion
        }
        else
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/Main_Frame.aspx", true);


        lblResultMsg.Text = string.Empty;
        lblResultMsg.CssClass = "required";
        lblMsg.Text = string.Empty;
        
        if (this.Page.IsPostBack.Equals(false))
        {
            BindControls();
            BindCompanies('N');

            if (Request.QueryString["m"] != null)
            {
                if (Request.QueryString["m"].ToString().Equals("up"))
                {
                    lblMsg.Text = "Company Details has been updated successfully.";
                }
                else if (Request.QueryString["m"].ToString().Equals("ins"))
                {
                    lblMsg.Text = "New Company Details has been added successfully.";
                }
            }
        }
    }

    protected void lnkBtnSearch_Click(object sender, EventArgs e)
    {
        BindCompanies('Y');
    }

    protected void lnkBtnDisapprove_Click(object sender, EventArgs e)
    {
        List<Entity.CompanyInfo> _objListCompanyInfo = new List<Entity.CompanyInfo>();
        foreach (GridViewRow gvRows in GVCompany.Rows)
        {
            CheckBox chkSelect = (CheckBox)gvRows.FindControl("chkSelect");
            if (chkSelect.Checked)
            {
                lblMsg.Text = string.Empty;
                Label lblCompanyId = (Label)gvRows.FindControl("lblCompanyId");
                if (lblCompanyId != null)
                {
                    oCompanyInfo = new Entity.CompanyInfo();
                    oCompanyInfo.IntCompanyId = Convert.ToInt32(lblCompanyId.Text);
                    oCompanyInfo.ChrIsApproved = 'N';
                    _objListCompanyInfo.Add(oCompanyInfo);
                    oCompanyInfo = null;
                }
            }

        }

        if (_objListCompanyInfo.Count > 0)
        {
            oCompanyManager = new BLL.CompanyManager();
            oCompanyManager.UpdateCompanyApprovedStatus(_objListCompanyInfo);
            oCompanyManager = null;

            lblMsg.Text = "Company(ies) has been disapproved successfully.";
            BindCompanies('Y');
        }
        else
        {
            lblMsg.Text = "Please select atleast one company for disapprove.";
        }
        //BindCompanies('Y');
    }
    /// Function Header*******************************************************
    /// Function Name: GVCompany_RowCommand
    /// Function Type: Event
    /// Functionality: Fired on when the user click on the linkbtns of grid
    /// wizard
    /// Input: 
    /// Output: 
    /// Return Value:
    /// Note: 
    protected void GVCompany_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.ToLower().Equals("statuschanged"))
        {
            oCompanyManager = new BLL.CompanyManager();
            oCompanyManager.UpdateCompanyActiveStatus(Convert.ToInt32(e.CommandArgument), DateTime.Now);
            sendOutConfirmationEmail(Convert.ToInt32(e.CommandArgument));
            lblMsg.Text = "Status has been updated successfully.";
            BindCompanies('Y');

        }
    }
    private void sendOutConfirmationEmail(int intCompanyId)
    {
        try
        {
            oCompanyInfo = new Entity.CompanyInfo();
            oCompanyManager = new BLL.CompanyManager();
            oCompanyInfo = oCompanyManager.GetCompanyDetailsById(intCompanyId);
            if (oCompanyInfo != null)
            {
                string strContent = string.Empty;
                BLL.TemplateLib oTemplateLib = new BLL.TemplateLib();
             
                strContent = oTemplateLib.GetTemplateDetailsByTemplateTemplateName("CompanyStatusChangedEmail").TextAreaHTML;
            
                string strToEmail = oCompanyInfo.StrCompanyEmail;
                strContent = strContent.Replace("[CompanyName]", oCompanyInfo.StrCompanyName);
                strContent = strContent.Replace("[UI_USERNAME]", oCompanyInfo.StrCompanyEmail);
                strContent = strContent.Replace("[WC_EMAIL_PROJECT_NAME]", AppConfig.GetSiteName());
                strContent = strContent.Replace("[SiteUrl]", AppConfig.GetBaseSiteUrl());
                strContent = strContent.Replace("[SiteName]", AppConfig.GetSiteName());
                strContent = strContent.Replace("[SitePhone]", AppConfig.GetSITEPHONE());
                strContent = strContent.Replace("[Status]", oCompanyInfo.ChrIsActive.Equals('Y') ? "Active" : "Deactive");

                AppLib.SendMailToUser(strToEmail, "Registration Request Status Changed From Tri Living Well", strContent, AppConfig.GetAdminEmail());
                oTemplateLib = null;
                oCompanyInfo = null;
                oCompanyManager = null;
            }
        }
        catch { }

    }

    #endregion

    #region User Defined Functions

    /************************************************************
    Function Name: BindCompanies
    Functionality: This function is used to bind the company grid
    *********************************************************************/
    private void BindCompanies(char isSearch)
    {
        oCompanyManager = new BLL.CompanyManager();
        oCompanyInfo = new Entity.CompanyInfo();
        oCompanyInfo.StrCompanyEmail = txtEmail.Text.Trim();
        oCompanyInfo.StrCompanyName = txtCompanyName.Text.Trim();
        oCompanyInfo.ChrIsActive = 'X';
        if (!ddlStatus.SelectedValue.Equals("0"))
            oCompanyInfo.ChrIsActive = Convert.ToChar(ddlStatus.SelectedValue);



        GVCompany.DataSource = oCompanyManager.SearchCompanies(oCompanyInfo);
        GVCompany.DataBind();
        if (isSearch.Equals('Y'))
            lblResultMsg.Text = GVCompany.Rows.Count.ToString() + " Record(s) found.";

        if (GVCompany.Rows.Count > 0)
            lnkBtnDisapprove.Visible = true;
        else
            lnkBtnDisapprove.Visible = false;


    }

    /************************************************************
    Function Name: BindControls
    Functionality: This function is used to bind the controls
    *********************************************************************/
    private void BindControls()
    {
        AppLib.BindCompanyStatusDropdown(ddlStatus, "");
        ddlStatus.Items.Insert(0, new ListItem("All", "0"));
        ddlStatus.SelectedIndex = 0;
    }

    #endregion
}
