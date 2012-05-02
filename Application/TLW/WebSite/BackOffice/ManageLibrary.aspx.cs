using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_ManageLibrary : System.Web.UI.Page
{
    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("Manage Library");

            #endregion
        }
        else
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/Main_Frame.aspx", true);


        lblMsg.Text = string.Empty;
        ancPrevious.Visible = false;
        lnkBtnSearch.Text = "Save";
        if (!this.Page.IsPostBack)
        {
            ViewState["intNewsLetterId"] = null;
            BindLibrary();
        }
    }
    protected void lnkBtnSearch_Click(object sender, EventArgs e)
    {
        if (CheckFileExtension())
        {
            AddUpdateLibraryDetails();
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
            Entity.LibraryInfo oLibraryInfo = new Entity.LibraryInfo();
            BLL.LibraryLib oLibraryLib = new BLL.LibraryLib();
            oLibraryInfo = oLibraryLib.GetLibraryByLibraryId(Convert.ToInt32(e.CommandArgument));
            if (oLibraryInfo != null)
            {
                // if (!odataReader.DtCancelOn.ToString().Equals("1/1/1999 12:00:00 AM"))
                txttitle.Text = oLibraryInfo.StrTitle;
                txtDescription.Text = oLibraryInfo.StrDescription;
                if (!oLibraryInfo.DtLibraryDate.ToString().Equals("1/1/1999 12:00:00 AM"))
                    txtDate.Text = oLibraryInfo.DtLibraryDate.ToShortDateString();

                chkIsActive.Checked = oLibraryInfo.ChrIsActive.Equals('Y') ? true : false;
                ViewState["strOldFileName"] = oLibraryInfo.StrLocation;

                if (oLibraryInfo.StrLocationType.ToLower().Equals("pdf") || oLibraryInfo.StrLocationType.ToLower().Equals("video"))
                {
                    trLink.Style.Add("display", "none");
                    trFileUpload.Style.Add("display", "''");
                    ancPrevious.Visible = true;
                    ancPrevious.HRef = AppConfig.GetBaseSiteUrl() + AppConfig.GetLibrariesFilePath() + oLibraryInfo.StrLocation;
                }
                else
                {
                    txtLink.Text = oLibraryInfo.StrLocation;
                    trLink.Style.Add("display", "''");
                    trFileUpload.Style.Add("display", "none");
                }

                ddlCategoryType.SelectedIndex = ddlCategoryType.Items.IndexOf(ddlCategoryType.Items.FindByValue(oLibraryInfo.StrLocationType));
                ddlCategory.SelectedIndex = ddlCategory.Items.IndexOf(ddlCategory.Items.FindByValue(oLibraryInfo.StrCategory));

                lnkBtnSearch.Text = "Update";
                ViewState["intLibraryId"] = e.CommandArgument.ToString();

                oLibraryInfo = null;
                oLibraryLib = null;
            }
        }
        else if (e.CommandName.Equals("DeleteNews"))
        {

            BLL.LibraryLib oLibraryLib = new BLL.LibraryLib();
            oLibraryLib.DeleteLibraryDetails(Convert.ToInt32(e.CommandArgument));
            lblMsg.Text = "Library has been deleted successfully.";

            oLibraryLib = null;
            ClearControls();
            BindLibrary();
        }
        else if (e.CommandName.Equals("StatusChanged"))
        {

            BLL.LibraryLib oLibraryLib = new BLL.LibraryLib();
            oLibraryLib.ActivateDeactivateLibrary(Convert.ToInt32(e.CommandArgument));
            lblMsg.Text = "Library status has been changed successfully.";
            oLibraryLib = null;
            ClearControls();
            BindLibrary();
        }
    }
    #endregion

    #region User Defined Functions

    private void BindLibrary()
    {
        BLL.LibraryLib oLibraryLib = new BLL.LibraryLib();
        GVNews.DataSource = oLibraryLib.GetAllLibraries();
        GVNews.DataBind();
        oLibraryLib = null;
    }

    private void AddUpdateLibraryDetails()
    {
        BLL.LibraryLib oLibraryLib = new BLL.LibraryLib();
        Entity.LibraryInfo oLibraryInfo = new Entity.LibraryInfo();
        oLibraryInfo.IntLibraryId = 0;
        oLibraryInfo.ChrIsDeleted = 'N';
        oLibraryInfo.DtDeletedDate = DateTime.Now;
        oLibraryInfo.DtCreatedDate = DateTime.Now;
        oLibraryInfo.DtModifiedDate = oLibraryInfo.DtCreatedDate;

        oLibraryInfo.StrTitle = txttitle.Text.Trim();
        oLibraryInfo.StrDescription = txtDescription.Text.Trim();
        if (oLibraryInfo.StrDescription.Length > 500)
            oLibraryInfo.StrDescription = oLibraryInfo.StrDescription.Substring(0, 499);




        if (!txtDate.Text.Equals(string.Empty))
            oLibraryInfo.DtLibraryDate = Convert.ToDateTime(txtDate.Text);
        else
            oLibraryInfo.DtLibraryDate = Convert.ToDateTime("01/01/1999");

        oLibraryInfo.ChrIsActive = chkIsActive.Checked ? 'Y' : 'N';

        oLibraryInfo.StrLocationType = ddlCategoryType.SelectedItem.Text;
        oLibraryInfo.StrCategory = ddlCategory.SelectedItem.Text;

        oLibraryInfo.StrLocation = string.Empty;
        if (ViewState["strOldFileName"] != null)
            oLibraryInfo.StrLocation = ViewState["strOldFileName"].ToString();

        if (oLibraryInfo.StrLocationType.ToString().ToLower().Equals("pdf") || oLibraryInfo.StrLocationType.ToString().ToLower().Equals("video"))
        {
            string strpath = string.Empty;
            try
            {
                if (fupPDF.HasFile)
                {
                    strpath = Request.PhysicalApplicationPath + AppConfig.GetLibrariesFilePath();

                    if (ViewState["strOldFileName"] != null)
                    {
                        if (System.IO.File.Exists(strpath + ViewState["strOldFileName"]))
                            System.IO.File.Delete(strpath + ViewState["strOldFileName"]);
                    }


                    string strFileName = DateTime.Now.ToString("MMddyyyyHHmmss");
                    strFileName = AppLib.UploadCompanyExcelForUserRegRequest(ref fupPDF, strFileName, strpath);
                    oLibraryInfo.StrLocation = strFileName;
                }
            }
            catch
            {
            }
        }
        else
            oLibraryInfo.StrLocation = txtLink.Text.Trim();



        bool blnIsSuccessfullOperation = false;
        if (ViewState["intLibraryId"] != null)
        {
            oLibraryInfo.IntLibraryId = Convert.ToInt32(ViewState["intLibraryId"]);
            if (oLibraryLib.UpdateLibraryDetails(oLibraryInfo) > 0)
            {
                lblMsg.Text = "Library has been updated successfully.";
                ViewState["intLibraryId"] = null;
                ViewState["strOldFileName"] = null;
                blnIsSuccessfullOperation = true;

            }
            else
                lblMsg.Text = "Library already exists.";
        }
        else
        {
            if (oLibraryLib.SaveLibraryDetails(oLibraryInfo) > 0)
            {
                lblMsg.Text = "Library has been added successfully.";
                blnIsSuccessfullOperation = true;

            }
            else
                lblMsg.Text = "Library already exists.";
        }
        oLibraryInfo = null;
        oLibraryLib = null;


        if (blnIsSuccessfullOperation)
        {
            ClearControls();
            BindLibrary();
        }
    }

    private void ClearControls()
    {
        txtDescription.Text = string.Empty;
        txttitle.Text = string.Empty;
        chkIsActive.Checked = false;
        txtDate.Text = string.Empty;
        lnkBtnSearch.Text = "Save";
        txtLink.Text = string.Empty;
        ddlCategory.SelectedIndex = 0;
        ddlCategoryType.SelectedIndex = 0;
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