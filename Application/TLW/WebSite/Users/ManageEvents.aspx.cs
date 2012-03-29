using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_ManageEvents : System.Web.UI.Page
{

    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!AppLib.IsLoggedinSessionExists())
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/main_frame.aspx", true);

        #region Insert visited log details

        AppLib.InsertVisitedSectionDetails("Manage Event");

        #endregion


        lblMsg.Text = string.Empty;
        if (!this.Page.IsPostBack)
        {
            ViewState["intEventId"] = null;
            BindEvents();
        }
    }
 
    protected void lnkBtnSearch_Click(object sender, EventArgs e)
    {

        AddUpdateEventDetails();
    }

    protected void GVEvents_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("EditNews"))
        {
            Entity.EventInfo oEventInfo = new Entity.EventInfo();
            BLL.EventsLib oEventsLib = new BLL.EventsLib();
            oEventInfo = oEventsLib.GetEventByEventId(Convert.ToInt32(e.CommandArgument));
            if (oEventInfo != null)
            {
                ViewState["intEventId"] = e.CommandArgument.ToString();
                txtActivity.Text = oEventInfo.StrActivity;
                txtComments.Text = oEventInfo.StrComments;
                txtDate.Text = oEventInfo.DtEventDate.ToShortDateString();
                txtLocation.Text = oEventInfo.StrLocation;
            }
        }
        else if (e.CommandName.Equals("DeleteNews"))
        {

            BLL.EventsLib oEventsLib = new BLL.EventsLib();
            oEventsLib.DeleteEventDetails(Convert.ToInt32(e.CommandArgument));
            lblMsg.Text = "Event has been deleted successfully.";

            oEventsLib = null;
            ClearControls();
            BindEvents();
        }
        else if (e.CommandName.Equals("StatusChanged"))
        {
            BLL.EventsLib oEventsLib = new BLL.EventsLib();
            oEventsLib.ActivateDeactivateEvent(Convert.ToInt32(e.CommandArgument));
            lblMsg.Text = "Event status has been changed successfully.";
            oEventsLib = null;
            ClearControls();
            BindEvents();
        }
    }

    #endregion

    #region User Defined Functions

    private void BindEvents()
    {
        BLL.EventsLib oEventsLib = new BLL.EventsLib();
        GVEvents.DataSource = oEventsLib.GetEventByUserId(AppLib.GetLoggedInUserName());
        GVEvents.DataBind();
        oEventsLib = null;
    }

    private void AddUpdateEventDetails()
    {
        BLL.EventsLib oEventsLib = new BLL.EventsLib();
        Entity.EventInfo oEventInfo = new Entity.EventInfo();
        oEventInfo.IntEventsId = 0;
        oEventInfo.StrUserName = AppLib.GetLoggedInUserName();
        oEventInfo.DtEventDate = Convert.ToDateTime(txtDate.Text);
        oEventInfo.StrActivity = txtActivity.Text.Trim();
        oEventInfo.StrLocation = txtLocation.Text.Trim();
        oEventInfo.StrComments = txtComments.Text.Trim();

        oEventInfo.ChrIsActive = 'Y';
        oEventInfo.ChrStatus = 'D';
        oEventInfo.ChrIsDeleted = 'N';

        oEventInfo.DtCreatedOn = DateTime.Now;

        if (ViewState["intEventId"] != null)
        {
            oEventInfo.IntEventsId = Convert.ToInt32(ViewState["intEventId"]);
            if (oEventsLib.UpdateEventDetails(oEventInfo) > 0)
            {
                lblMsg.Text = "Event has been updated successfully.";
                ViewState["intEventId"] = null;
                ClearControls();
                BindEvents();
            }
            else
            {
                lblMsg.Text = "Event already exists.";
                return;
            }
        }
        else
        {
            if (oEventsLib.SaveEventDetails(oEventInfo) > 0)
            {
                lblMsg.Text = "Event has been added successfully.";
                ClearControls();
                BindEvents();
            }
            else
            {
                lblMsg.Text = "Event already exists.";
                return;
            }
        }
        oEventInfo = null;
        oEventsLib = null;
    }

    private void Page_PreInit(object sender, EventArgs e)
    {
        if (!AppLib.IsLoggedinSessionExists())
            this.MasterPageFile = "~/MasterPages/TLWSite.master";
        else
        {
                this.MasterPageFile = "~/MasterPages/User.master";
            
        }
    }

    private void ClearControls()
    {
        txtComments.Text = string.Empty;
        txtActivity.Text = string.Empty;
        txtLocation.Text = string.Empty;
        txtDate.Text = string.Empty;
    }

    #endregion
}