using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Company_ViewRequestedUsers : System.Web.UI.Page
{
    BLL.CompanyManager oCompanyManager;
    Entity.CompanyInfo oCompanyInfo;

    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!AppLib.IsLoggedinSessionExists())
        {
            lblMsg.Text = "Your session has been expired. Please login again";
            return;
        }



        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("View Requested Users Status");

            #endregion
        }


        lblResultMsg.Text = string.Empty;
        lblResultMsg.CssClass = "required";
        lblMsg.Text = string.Empty;
        if (this.Page.IsPostBack.Equals(false))
            BindCompanies();
    }

    #endregion

    #region User Defined Functions

    /************************************************************
    Function Name: BindCompanies
    Functionality: This function is used to bind the company grid
    *********************************************************************/
    private void BindCompanies()
    {
        oCompanyManager = new BLL.CompanyManager();
        GVUsers.DataSource = oCompanyManager.SearchRequestedUsersForCompanies(Convert.ToInt32(AppLib.GetLoggedInUserId()), Convert.ToChar(ddlStatus.SelectedValue));
        GVUsers.DataBind();
    }


    #endregion

    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindCompanies();
    }
}