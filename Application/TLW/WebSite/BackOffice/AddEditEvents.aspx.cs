using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_AddEditEvents : System.Web.UI.Page
{
    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("Add Edit Event");

            #endregion
        }
        else
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/Main_Frame.aspx", true);


        lblMsg.Text = string.Empty;
        if (!this.Page.IsPostBack)
            BindEventsDetails();
    }
    protected void lnkBtnSearch_Click(object sender, EventArgs e)
    {

        AddUpdateEventDetails();
    }
    protected void lnkCancel_Click(object sender, EventArgs e)
    {

        Response.Redirect(AppConfig.GetBaseSiteUrl() + "Backoffice/ManageEvents.aspx");
    }

    #endregion

    #region User Defined Functions

    private void BindEventsDetails()
    {
        if (Request.QueryString["id"] != null)
        {
            lnkBtnSearch.Text = "Update";
            lblHeading.Text = "Update Event";
            lblSubHeading.Text = "Update Event Details";
            int _intEventId = 0;
            _intEventId = Convert.ToInt32(Request.QueryString["id"]);
            Entity.EventInfo oEventInfo = new Entity.EventInfo();
            BLL.EventsLib oEventsLib = new BLL.EventsLib();
            oEventInfo = oEventsLib.GetEventByEventId(_intEventId);
            if (oEventInfo != null)
            {
                txtActivity.Text = oEventInfo.StrActivity;
                txtComments.Text = oEventInfo.StrComments;
                txtDate.Text = oEventInfo.DtEventDate.ToShortDateString();
                txtLocation.Text = oEventInfo.StrLocation;
                rdoIsActive.SelectedValue = oEventInfo.ChrIsActive.ToString();
                rdoApproved.SelectedValue = oEventInfo.ChrStatus.ToString();

            }

            oEventsLib = null;
            oEventInfo = null;
        }
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

        if (oEventInfo.StrComments.Length > 200)
            oEventInfo.StrComments = oEventInfo.StrComments.Substring(0, 199);



        oEventInfo.ChrIsActive = Convert.ToChar(rdoIsActive.SelectedValue);
        oEventInfo.ChrStatus = Convert.ToChar(rdoApproved.SelectedValue);

        oEventInfo.DtCreatedOn = DateTime.Now;
        oEventInfo.ChrIsDeleted = 'N';
        if (Request.QueryString["id"] != null)
        {
            oEventInfo.IntEventsId = Convert.ToInt32(Request.QueryString["id"]);
            if (oEventsLib.UpdateEventDetails(oEventInfo) > 0)
            {
                oEventsLib = null;
                oEventInfo = null;
                Response.Redirect(AppConfig.GetBaseSiteUrl() + "BackOffice/ManageEvents.aspx?msg=up");
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
                oEventsLib = null;
                oEventInfo = null;
                Response.Redirect(AppConfig.GetBaseSiteUrl() + "BackOffice/ManageEvents.aspx?msg=ins");
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

    #endregion
}