using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class BackOffice_ManageCompany_ManageCompanyRequestForUserRegistration : System.Web.UI.Page
{
    BLL.CompanyManager oCompanyManager;
    Entity.CompanyInfo oCompanyInfo;

    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("View Company Requests for User Registration");

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
            }
        }
    }

    protected void lnkBtnSearch_Click(object sender, EventArgs e)
    {
        BindCompanies('Y');
    }

    protected void lnkBtnSendRequest_Click(object sender, EventArgs e)
    {
        string strEmailContentForCompany = string.Empty;
        strEmailContentForCompany = "<table>";
        string strContent = string.Empty;
        BLL.TemplateLib oTemplateLib = new BLL.TemplateLib();

        strContent = oTemplateLib.GetTemplateDetailsByTemplateTemplateName("RegistrationRequestForUserEmail").TextAreaHTML;

        List<Entity.CompanyInfo> _objListCompanyInfo = new List<Entity.CompanyInfo>();
        foreach (GridViewRow gvRows in GVUsers.Rows)
        {
            CheckBox chkSelect = (CheckBox)gvRows.FindControl("chkSelect");
            if (chkSelect.Checked)
            {
                lblMsg.Text = string.Empty;
                Label lblCompanyRequestedUsersListId = (Label)gvRows.FindControl("lblCompanyRequestedUsersListId");
                Label lblEmail = (Label)gvRows.FindControl("lblEmail");
                Label lblName = (Label)gvRows.FindControl("lblName");
                Label lblCompanyId = (Label)gvRows.FindControl("lblCompanyId");

                if (lblCompanyRequestedUsersListId != null)
                {
                    string strRegistrationLink = AppConfig.GetBaseSiteUrl() + "UserRegistration.aspx?iid=" + lblCompanyRequestedUsersListId.Text;
                    strEmailContentForCompany = strEmailContentForCompany + "<tr><td>" + lblName.Text + "(" + lblEmail.Text + ")</td></tr>";

                    strContent = strContent.Replace("[FullName]", lblName.Text);
                    strContent = strContent.Replace("[SiteUrl]", AppConfig.GetBaseSiteUrl());
                    strContent = strContent.Replace("[RegistrationLink]", strRegistrationLink);
                    strContent = strContent.Replace("[SiteName]", AppConfig.GetSiteName());
                    
                    //AppLib.SendMailToUser(lblEmail.Text, "Registration Request By TLW", strContent, AppConfig.GetAdminEmail());
                    
                       string fname = "~/Upload/" + lblName.Text + ".html";
                       StreamWriter _testData = new StreamWriter(Server.MapPath(fname)); 
                        _testData.WriteLine(strContent); // Write the file. 
                        _testData.Flush(); 
                        _testData.Close(); // Close the instance of StreamWriter. 
                        _testData.Dispose(); // Dispose from memory.




                    oCompanyInfo = new Entity.CompanyInfo();
                    oCompanyInfo.IntCompanyRequestedUsersListId = Convert.ToInt32(lblCompanyRequestedUsersListId.Text);
                    oCompanyInfo.ChrStatus = 'S';
                    oCompanyInfo.DtModifiedDate = DateTime.Now;
                    _objListCompanyInfo.Add(oCompanyInfo);
                    oCompanyInfo = null;
                }
            }
        }

        if (_objListCompanyInfo.Count > 0)
        {
            strEmailContentForCompany = strEmailContentForCompany + "</table>";
            strContent = oTemplateLib.GetTemplateDetailsByTemplateTemplateName("EmailToCompanyForRegistrationofUser").TextAreaHTML;
            strContent = strContent.Replace("[CompanyName]", ddlCompany.SelectedItem.Text);
            strContent = strContent.Replace("[Name]", strEmailContentForCompany);

            oCompanyInfo = new Entity.CompanyInfo();
            oCompanyManager = new BLL.CompanyManager();
            oCompanyInfo = oCompanyManager.GetCompanyDetailsById(Convert.ToInt32(ddlCompany.SelectedValue));
            if (oCompanyInfo != null)
            {
                AppLib.SendMailToUser(oCompanyInfo.StrCompanyEmail, "Registration Request Status of User", strContent, AppConfig.GetAdminEmail());
            }

            oCompanyManager.UpdateRequestUserStatus(_objListCompanyInfo);
            oCompanyManager = null;
            oCompanyInfo = null;

            lblMsg.Text = "Registration Request has been sent successfully.";
            BindCompanies('Y');
        }
        else
        {
            lblMsg.Text = "Please select atleast one record.";
        }
        //BindCompanies('Y');


        oTemplateLib = null;
    }

    /// Function Header*******************************************************
    /// Function Name: GVUsers_RowCommand
    /// Function Type: Event
    /// Functionality: Fired on when the user click on the linkbtns of grid
    /// wizard
    /// Input: 
    /// Output: 
    /// Return Value:
    /// Note: 
    protected void GVUsers_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.ToLower().Equals("statuschanged"))
        {
            oCompanyManager = new BLL.CompanyManager();
            oCompanyManager.UpdateCompanyActiveStatus(Convert.ToInt32(e.CommandArgument), DateTime.Now);
            lblMsg.Text = "Status has been updated successfully.";
            BindCompanies('Y');
        }
    }


    protected void ddlCompany_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindCompanies('Y');
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


        GVUsers.DataSource = oCompanyManager.SearchRequestedUsersForCompanies(Convert.ToInt32(ddlCompany.SelectedValue), 'I');
        GVUsers.DataBind();
        if (isSearch.Equals('Y'))
            lblResultMsg.Text = GVUsers.Rows.Count.ToString() + " Record(s) found.";

        if (GVUsers.Rows.Count > 0)
            lnkBtnSendRequest.Visible = true;
        else
            lnkBtnSendRequest.Visible = false;

        oCompanyManager = null;
    }

    /************************************************************
    Function Name: BindControls
    Functionality: This function is used to bind the controls
    *********************************************************************/
    private void BindControls()
    {
        AppLib.BindCompanyDropdown(ddlCompany, "");
    }

    #endregion

}