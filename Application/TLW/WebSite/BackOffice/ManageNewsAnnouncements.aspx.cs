using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_ManageNewsAnnouncements : System.Web.UI.Page
{
    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("Manage News and Announcements");

            #endregion
        }
        else
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/Main_Frame.aspx", true);

        lblMsg.Text = string.Empty;
        ancPrevious.Visible = false;
        if (!this.Page.IsPostBack)
        {
            ViewState["intNewsAnnouncementsId"] = null;
            BindNewsAnnouncements();
        }
    }
    protected void lnkBtnSearch_Click(object sender, EventArgs e)
    {
        if (CheckFileExtension())
        {
            AddUpdateQuestionnareDetails();
        }
        else
        {
            lblMsg.Text = "Please select pdf file only.";
            return;
        }
    }

    protected void GVNews_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("EditNews"))
        {
            Entity.NewsInfo oNewsInfo = new Entity.NewsInfo();
            BLL.NewsLib oNewsLib = new BLL.NewsLib();
            oNewsInfo = oNewsLib.GetNewsAnnouncementsById(Convert.ToInt32(e.CommandArgument));
            if (oNewsInfo != null)
            {
                txtHeading.Text = oNewsInfo.StrHeading;
                txtDescription.Text = oNewsInfo.StrDescription;
                chkIsHome.Checked = oNewsInfo.ChrIsHomePage.Equals('Y') ? true : false;
                chkIsActive.Checked = oNewsInfo.ChrIsActive.Equals('Y') ? true : false;
                txtDirectLink.Text = oNewsInfo.StrDirectLink;
                if (txtDirectLink.Text.Trim().Equals(string.Empty))
                {
                    ViewState["strOldFileName"] = oNewsInfo.StrPDFFilename;
                    ancPrevious.Visible = true;
                    ancPrevious.HRef = AppConfig.GetBaseSiteUrl() + AppConfig.GetNewsAnnouncementsPDFPath() + oNewsInfo.StrPDFFilename;
                }


                ViewState["intNewsAnnouncementsId"] = e.CommandArgument.ToString();
                oNewsInfo = null;
                oNewsLib = null;
            }
        }
        else if (e.CommandName.Equals("DeleteNews"))
        {

            BLL.NewsLib oNewsLib = new BLL.NewsLib();
            oNewsLib.DeleteNewsAnnouncements(Convert.ToInt32(e.CommandArgument));
            lblMsg.Text = "News & Announcements has been deleted successfully.";

            oNewsLib = null;
            ClearControls();
            BindNewsAnnouncements();
        }
        else if (e.CommandName.Equals("StatusChanged"))
        {

            BLL.NewsLib oNewsLib = new BLL.NewsLib();
            oNewsLib.UpdateNewsAnnouncementsStatus(Convert.ToInt32(e.CommandArgument));
            lblMsg.Text = "News & Announcements status has been changed successfully.";
            oNewsLib = null;
            ClearControls();
            BindNewsAnnouncements();
        }
    }
    #endregion

    #region User Defined Functions

    private void BindNewsAnnouncements()
    {
        BLL.NewsLib oNewsLib = new BLL.NewsLib();
        GVNews.DataSource = oNewsLib.GetAllNewsAnnouncements();
        GVNews.DataBind();
        oNewsLib = null;
    }

    private void AddUpdateQuestionnareDetails()
    {
        if (fupPDF.HasFile)
        {
            if (!txtDirectLink.Text.Trim().Equals(string.Empty))
            {
                lblMsg.Text = "You can not Upload or Enter Direct Link simultaneously.";
                return;
            }
        }


        BLL.NewsLib oNewsLib = new BLL.NewsLib();
        Entity.NewsInfo oNewsInfo = new Entity.NewsInfo();
        oNewsInfo.IntNewsAnnouncementsId = 0;

        oNewsInfo.StrHeading = txtHeading.Text.Trim();
        oNewsInfo.StrDescription = txtDescription.Text.Trim();

        if (oNewsInfo.StrDescription.Length > 500)
            oNewsInfo.StrDescription = oNewsInfo.StrDescription.Substring(0, 499);



        oNewsInfo.ChrIsHomePage = chkIsHome.Checked ? 'Y' : 'N';
        oNewsInfo.ChrIsActive = chkIsActive.Checked ? 'Y' : 'N';
        oNewsInfo.StrDirectLink = string.Empty;
        oNewsInfo.DtCreatedOn = DateTime.Now;
        oNewsInfo.StrPDFFilename = string.Empty;
        if (ViewState["strOldFileName"] != null)
            oNewsInfo.StrPDFFilename = ViewState["strOldFileName"].ToString();

        string strpath = string.Empty;
        try
        {
            if (fupPDF.HasFile)
            {
                strpath = Request.PhysicalApplicationPath + AppConfig.GetNewsAnnouncementsPDFPath();

                if (ViewState["strOldFileName"] != null)
                {
                    if (System.IO.File.Exists(strpath + ViewState["strOldFileName"]))
                        System.IO.File.Delete(strpath + ViewState["strOldFileName"]);
                }



                string strFileName = DateTime.Now.ToString("MMddyyyyHHmmss");
                strFileName = AppLib.UploadCompanyExcelForUserRegRequest(ref fupPDF, strFileName, strpath);
                oNewsInfo.StrPDFFilename = strFileName;
            }
            else
            {
                oNewsInfo.StrDirectLink = txtDirectLink.Text.Trim();
            }
        }
        catch
        { //lblMsg.Text = "Invalid file/Content. Please download the template and fill the proper details.";

        }


        if (ViewState["intNewsAnnouncementsId"] != null)
        {
            oNewsInfo.IntNewsAnnouncementsId = Convert.ToInt32(ViewState["intNewsAnnouncementsId"]);
            if (oNewsLib.UpdateNewsAnnouncements(oNewsInfo) > 0)
            {
                lblMsg.Text = "News & Announcements has been updated successfully.";
                ViewState["intNewsAnnouncementsId"] = null;
                ViewState["strOldFileName"] = null;
                ClearControls();
                BindNewsAnnouncements();
            }
            else
            {
                lblMsg.Text = "News & Announcements already exists.";
            }
        }
        else
        {
            if (oNewsLib.SaveNewsAnnouncements(oNewsInfo) > 0)
            {
                lblMsg.Text = "News & Announcements has been added successfully.";
                ClearControls();
                BindNewsAnnouncements();
            }
            else
            {
                lblMsg.Text = "News & Announcements already exists.";
            }
        }
        oNewsInfo = null;
        oNewsLib = null;
    }


    private void ClearControls()
    {
        txtDescription.Text = string.Empty;
        txtHeading.Text = string.Empty;
        chkIsActive.Checked = false;
        chkIsHome.Checked = false;
        txtDirectLink.Text = string.Empty;
    }

    private bool CheckFileExtension()
    {
        if (fupPDF.HasFile)
        {
            string strFileExtension = System.IO.Path.GetExtension(fupPDF.FileName);
            if (strFileExtension.ToLower().Equals(".pdf"))
                return true;
            else
                return false;
        }
        else
            return true;
    }

    #endregion

}