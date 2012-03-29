using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_Templates_ManageFAQ : System.Web.UI.Page
{

    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("Manage FAQ");

            #endregion
        }
        else
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/Main_Frame.aspx", true);

        

        GVFAQ.PageSize = AppConfig.GetGridViewPageSize();
        lblMsg.Text = string.Empty;
        if (!this.Page.IsPostBack)
        {
            BindFAQ();
            if (Request.QueryString["msg"] != null)
            {
                if (Request.QueryString["msg"].ToString().Equals("up"))
                {
                    lblMsg.Text = "FAQ has been updated successfully.";
                }
                if (Request.QueryString["msg"].ToString().Equals("ins"))
                {
                    lblMsg.Text = "FAQ has been inserted successfully.";
                }
                if (Request.QueryString["msg"].ToString().Equals("del"))
                {
                    lblMsg.Text = "FAQ has been deleted successfully.";
                }
            }
        }
    }
    protected void GVFAQ_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVFAQ.PageIndex = e.NewPageIndex;
        BindFAQ();
    }
    protected void GVFAQ_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("DeleteFAQ"))
        {
            BLL.UserLib oUserLib = new BLL.UserLib();
            oUserLib.DeleteFAQ(Convert.ToInt32(e.CommandArgument));
            oUserLib = null;
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "BackOffice/Templates/ManageFaq.aspx?msg=del", true);
        }
    }

    protected void lnkBtnSearch_Click(object sender, EventArgs e)
    {
        BindFAQ();
    }
    #endregion

    #region User Defined Functions

    /// Function Header*******************************************************
    /// Function Name: BindEvents
    /// Function Type: Function
    /// Functionality: used to get bind the events
    /// Input: 
    /// Output: 
    /// Return Value:
    /// Note: 
    /// *********************************************************************
    private void BindFAQ()
    {
        BLL.UserLib oUserLib = new BLL.UserLib();
        GVFAQ.DataSource = oUserLib.GetAllFAQs();

        GVFAQ.DataBind();
        oUserLib = null;
    }


    #endregion
    
}