using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_ManageEvents : System.Web.UI.Page
{

    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("Manage Events");

            #endregion
        }
        else
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/Main_Frame.aspx", true);

        lblMsg.Text = string.Empty;
        if (!this.Page.IsPostBack)
        {
            BindUsers();
            BindEvents();
            if (Request.QueryString["msg"] != null)
            {
                if (Request.QueryString["msg"].ToString().Equals("up"))
                {
                    lblMsg.Text = "Event has been updated successfully.";
                }
                else if (Request.QueryString["msg"].ToString().Equals("ins"))
                {
                    lblMsg.Text = "Event has been added successfully.";
                }
            }
           
        }
    }
    protected void lnkBtnSearch_Click(object sender, EventArgs e)
    {
        BindEvents();
    }
    protected void GVEvents_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lnkBtnStatusAppDisapproved = (LinkButton)e.Row.FindControl("lnkBtnStatusAppDisapproved");
            if (lnkBtnStatusAppDisapproved != null)
            {
                string strTemp = DataBinder.Eval(e.Row.DataItem, "ChrStatus").ToString().Equals("A") ? "Disapprove" : "Approved";
                lnkBtnStatusAppDisapproved.OnClientClick = "return ConfirmBid('" + strTemp + " this event')";
                lnkBtnStatusAppDisapproved.ToolTip = "Click here to " + strTemp;
            }
        }
    }
    protected void GVEvents_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("DeleteNews"))
        {
            BLL.EventsLib oEventsLib = new BLL.EventsLib();
            oEventsLib.DeleteEventDetails(Convert.ToInt32(e.CommandArgument));
            lblMsg.Text = "Event has been deleted successfully.";
            oEventsLib = null;
            BindEvents();
        }
        else if (e.CommandName.Equals("StatusChanged"))
        {
            BLL.EventsLib oEventsLib = new BLL.EventsLib();
            oEventsLib.ActivateDeactivateEvent(Convert.ToInt32(e.CommandArgument));
            lblMsg.Text = "Event status has been changed successfully.";
            oEventsLib = null;
            BindEvents();
        }
        else if (e.CommandName.Equals("AppDisStatusChanged"))
        {
            BLL.EventsLib oEventsLib = new BLL.EventsLib();
            oEventsLib.ApproveDisapproveEvent(Convert.ToInt32(e.CommandArgument));
            lblMsg.Text = "Event status has been changed successfully.";
            oEventsLib = null;
            BindEvents();
        }
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
    private void BindEvents()
    {
        BLL.EventsLib oEventsLib = new BLL.EventsLib();
        GVEvents.DataSource = oEventsLib.SearchEvents(Convert.ToChar(ddlStatus.SelectedValue), ddlUsers.SelectedValue);
        GVEvents.DataBind();
        oEventsLib = null;
    }

    /// Function Header*******************************************************
    /// Function Name: BindUsers
    /// Function Type: Function
    /// Functionality: used to get bind the user's list
    /// Input: 
    /// Output: 
    /// Return Value:
    /// Note: 
    /// *********************************************************************

    private void BindUsers()
    {
        AppLib.BindAllUsers(ddlUsers, "All");
        ddlUsers.SelectedIndex = 0;
    }

    #endregion
 
}