using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_wucViewFavoriteItemDetails : System.Web.UI.UserControl
{
    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        trNewsletter.Visible = false;

        trEvent.Visible = false;
        trNewsAnnouncement.Visible = false;
        trLibrary.Visible = false;
        BindDetails();
        ancPrevious.Visible = false;
        if (!this.Page.IsPostBack)
        {
            BindFavoriteDetails();
        }
    }
    protected void lnkBtnSubmit_Click(object sender, EventArgs e)
    {
        BLL.UserLib oUserLib = new BLL.UserLib();
        oUserLib.UpdateFavoriteTitle(Convert.ToInt32(Request.QueryString["fid"]), txtFavoriteTitle.Text.Trim());
        oUserLib = null;
        Response.Redirect(AppConfig.GetBaseSiteUrl() + "Users/MyFavoriteList.aspx?msg=up", true);
    }

    #endregion

    #region User Defined Functions

    private void BindFavoriteDetails()
    {
        if (Request.QueryString["type"] != null && Request.QueryString["id"] != null && Request.QueryString["fid"] != null)
        {
            BLL.NewsLib oNewsLib = new BLL.NewsLib();
            Entity.NewsInfo oNewsInfo = new Entity.NewsInfo();
            oNewsInfo = oNewsLib.GetFavoriteListByFavoriteId(Convert.ToInt32(Request.QueryString["fid"]));
            if (oNewsInfo != null)
                txtFavoriteTitle.Text = oNewsInfo.StrTitle;

            oNewsLib = null;
            oNewsInfo = null;
        }
    }

    private void BindDetails()
    {
        if (Request.QueryString["type"] != null && Request.QueryString["id"] != null && Request.QueryString["fid"] != null)
        {
            BLL.NewsLib oNewsLib = new BLL.NewsLib();
            Entity.NewsInfo oNewsInfo = new Entity.NewsInfo();

            if (Request.QueryString["type"].ToString().ToLower().Equals("newsletter"))
            {
                trNewsletter.Visible = true;
                oNewsInfo = new Entity.NewsInfo();
                oNewsLib = new BLL.NewsLib();
                oNewsInfo = oNewsLib.GetNewsLettersById(Convert.ToInt32(Request.QueryString["id"]));
                if (oNewsInfo != null)
                {
                    lblNewsletterDescription.Text = oNewsInfo.StrDescription;
                    if (!oNewsInfo.StrNewsletterDate.ToString().Equals("1/1/1999 12:00:00 AM"))
                        lblNewsletterDate.Text = oNewsInfo.StrNewsletterDate.ToShortDateString();

                    if (!oNewsInfo.StrPDFFilename.Equals("na.pdf"))
                    {
                        ancPrevious.Visible = true;
                        ancPrevious.HRef = AppConfig.GetBaseSiteUrl() + AppConfig.GetNewsLettersPDFPath() + oNewsInfo.StrPDFFilename;
                    }
                    else
                    {
                        trNewsletterPDF.Visible = false;
                    }
                }
            }
            else if (Request.QueryString["type"].ToString().ToLower().Equals("event"))
            {
                trEvent.Visible = true;
                if (Request.QueryString["id"] != null)
                {
                    int _intEventId = 0;
                    _intEventId = Convert.ToInt32(Request.QueryString["id"]);
                    Entity.EventInfo oEventInfo = new Entity.EventInfo();
                    BLL.EventsLib oEventsLib = new BLL.EventsLib();
                    oEventInfo = oEventsLib.GetEventByEventId(_intEventId);
                    if (oEventInfo != null)
                    {
                        lblEventActivity.Text = oEventInfo.StrActivity;
                        lblEventComments.Text = oEventInfo.StrComments;
                        lblEventDate.Text = oEventInfo.DtEventDate.ToShortDateString();
                        lblEventLocation.Text = oEventInfo.StrLocation;
                    }

                    oEventsLib = null;
                    oEventInfo = null;
                }
            }
            else if (Request.QueryString["type"].ToString().ToLower().Equals("newsannouncements"))
            {
                trNewsAnnouncement.Visible = true;
                oNewsInfo = new Entity.NewsInfo();
                oNewsLib = new BLL.NewsLib();
                oNewsInfo = oNewsLib.GetNewsAnnouncementsById(Convert.ToInt32(Request.QueryString["id"]));
                if (oNewsInfo != null)
                {
                    lblNewsAnnouncementDescription.Text = oNewsInfo.StrDescription;
                    lblNewsAnnouncementDirectLink.Text = oNewsInfo.StrDirectLink;
                    if (lblNewsAnnouncementDirectLink.Text.Trim().Equals(string.Empty))
                    {
                        trNewsAnnouncementDirectLink.Visible = false;
                        trNewsAnnouncementPDF.Visible = true;
                        ancPreviousNewsAnnoucment.HRef = AppConfig.GetBaseSiteUrl() + AppConfig.GetNewsAnnouncementsPDFPath() + oNewsInfo.StrPDFFilename;
                    }
                    else
                    {
                        trNewsAnnouncementDirectLink.Visible = true;
                        trNewsAnnouncementPDF.Visible = false;
                    }

                    oNewsInfo = null;
                    oNewsLib = null;
                }
            }
            else if (Request.QueryString["type"].ToString().ToLower().Equals("library"))
            {
                trLibrary.Visible = true;
                Entity.LibraryInfo oLibraryInfo = new Entity.LibraryInfo();
                BLL.LibraryLib oLibraryLib = new BLL.LibraryLib();
                oLibraryInfo = oLibraryLib.GetLibraryByLibraryId(Convert.ToInt32(Request.QueryString["id"]));
                if (oLibraryInfo != null)
                {
                    lblLibraryDescription.Text = oLibraryInfo.StrDescription;
                    if (!oLibraryInfo.DtLibraryDate.ToString().Equals("1/1/1999 12:00:00 AM"))
                        lblLibraryDate.Text = oLibraryInfo.DtLibraryDate.ToShortDateString();


                    if (oLibraryInfo.StrLocationType.ToLower().Equals("pdf") || oLibraryInfo.StrLocationType.ToLower().Equals("video"))
                    {
                        trLibraryLink.Visible = false;
                        ancLibraryPDF.Visible = true;
                        ancLibraryPDF.HRef = AppConfig.GetBaseSiteUrl() + AppConfig.GetLibrariesFilePath() + oLibraryInfo.StrLocation;
                    }
                    else
                    {
                        trLibraryPDF.Visible = false;
                        lblLibraryWebsiteLink.Text = oLibraryInfo.StrLocation;
                    }

                    lblLibraryCategoryType.Text = oLibraryInfo.StrLocationType;
                    lblLibraryCategory.Text = oLibraryInfo.StrCategory;

                    oLibraryInfo = null;
                    oLibraryLib = null;
                }
            }
        }
    }

    #endregion

}