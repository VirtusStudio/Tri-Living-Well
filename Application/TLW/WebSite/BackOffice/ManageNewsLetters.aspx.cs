using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_ManageNewsLetters : System.Web.UI.Page
{
    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("Manage NewsLetters");

            #endregion
        }
        else
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/Main_Frame.aspx", true);


        lblMsg.Text = string.Empty;
        ancPrevious.Visible = false;
        if (!this.Page.IsPostBack)
        {
            ViewState["intNewsLetterId"] = null;
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
            oNewsInfo = oNewsLib.GetNewsLettersById(Convert.ToInt32(e.CommandArgument));
            if (oNewsInfo != null)
            {
                // if (!odataReader.DtCancelOn.ToString().Equals("1/1/1999 12:00:00 AM"))
                txttitle.Text = oNewsInfo.StrTitle;
                txtDescription.Text = oNewsInfo.StrDescription;
                if (!oNewsInfo.StrNewsletterDate.ToString().Equals("1/1/1999 12:00:00 AM"))
                    txtDate.Text = oNewsInfo.StrNewsletterDate.ToShortDateString();

                chkIsActive.Checked = oNewsInfo.ChrIsActive.Equals('Y') ? true : false;
                ViewState["strOldFileName"] = oNewsInfo.StrPDFFilename;
                ancPrevious.Visible = true;
                ancPrevious.HRef = AppConfig.GetBaseSiteUrl() + AppConfig.GetNewsLettersPDFPath() + oNewsInfo.StrPDFFilename;
                ViewState["intNewsLetterId"] = e.CommandArgument.ToString();
            }
        }
        else if (e.CommandName.Equals("DeleteNews"))
        {

            BLL.NewsLib oNewsLib = new BLL.NewsLib();
            oNewsLib.DeleteNewsletter(Convert.ToInt32(e.CommandArgument));
            lblMsg.Text = "Newsletter has been deleted successfully.";

            oNewsLib = null;
            ClearControls();
            BindNewsAnnouncements();
        }
        else if (e.CommandName.Equals("StatusChanged"))
        {

            BLL.NewsLib oNewsLib = new BLL.NewsLib();
            oNewsLib.UpdateNewsletterStatus(Convert.ToInt32(e.CommandArgument));
            lblMsg.Text = "Newsletter status has been changed successfully.";
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
        GVNews.DataSource = oNewsLib.GetAllNewsLetters();
        GVNews.DataBind();
        oNewsLib = null;
    }

    private void AddUpdateQuestionnareDetails()
    {
        BLL.NewsLib oNewsLib = new BLL.NewsLib();
        Entity.NewsInfo oNewsInfo = new Entity.NewsInfo();
        oNewsInfo.IntNewsLetterId = 0;
        oNewsInfo.StrTitle = txttitle.Text.Trim();
        oNewsInfo.StrDescription = txtDescription.Text.Trim();


        if (oNewsInfo.StrDescription.Length > 500)
            oNewsInfo.StrDescription = oNewsInfo.StrDescription.Substring(0, 490);



        if (!txtDate.Text.Equals(string.Empty))
            oNewsInfo.StrNewsletterDate = Convert.ToDateTime(txtDate.Text);
        else
            oNewsInfo.StrNewsletterDate = Convert.ToDateTime("01/01/1999");

        oNewsInfo.ChrIsActive = chkIsActive.Checked ? 'Y' : 'N';
        oNewsInfo.DtCreatedOn = DateTime.Now;

        oNewsInfo.StrPDFFilename = string.Empty;
        if (ViewState["strOldFileName"] != null)
        {
            oNewsInfo.StrPDFFilename = ViewState["strOldFileName"].ToString();
        }

        string strpath = string.Empty;
        try
        {
            if (fupPDF.HasFile)
            {
                
                strpath = Request.PhysicalApplicationPath + AppConfig.GetNewsLettersPDFPath();

                if (ViewState["strOldFileName"] != null)
                {
                    if (System.IO.File.Exists(strpath + ViewState["strOldFileName"]))
                    {
                        System.IO.File.Delete(strpath + ViewState["strOldFileName"]);
                    }
                }


                string strFileName = DateTime.Now.ToString("MMddyyyyHHmmss");
                strFileName = AppLib.UploadCompanyExcelForUserRegRequest(ref fupPDF, strFileName, strpath);
                oNewsInfo.StrPDFFilename = strFileName;
            }
        }
        catch
        {
        }


        if (ViewState["intNewsLetterId"] != null)
        {
            oNewsInfo.IntNewsLetterId = Convert.ToInt32(ViewState["intNewsLetterId"]);
            if (oNewsLib.UpdateNewsletter(oNewsInfo) > 0)
            {
                lblMsg.Text = "Newsletter has been updated successfully.";
                ViewState["intNewsLetterId"] = null;
                ViewState["strOldFileName"] = null;
                ClearControls();
                BindNewsAnnouncements();
            }
            else
            {
                lblMsg.Text = "Newsletter already exists.";
            }
        }
        else
        {
            if (oNewsLib.SaveNewsletter(oNewsInfo) > 0)
            {
                lblMsg.Text = "Newsletter has been added successfully.";
                ClearControls();
                BindNewsAnnouncements();
            }
            else
            {
                lblMsg.Text = "Newsletter already exists.";
            }
        }
        oNewsInfo = null;
        oNewsLib = null;
    }

   

    private void ClearControls()
    {
        txtDescription.Text = string.Empty;
        txttitle.Text = string.Empty;
        chkIsActive.Checked = false;
        txtDate.Text = string.Empty;
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