using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_Templates_ManageFAQTopics : System.Web.UI.Page
{
    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("Manage FAQ Topics");

            #endregion
        }
        else
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/Main_Frame.aspx", true);


        lblMsg.Text = string.Empty;
        if (!this.Page.IsPostBack)
        {
            ViewState["Int_FAQTopicId"] = null;
            BindFAQTopics();
        }
    }

    protected void GVTopics_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("EditTopic"))
        {
            Entity.FAQTopicInfo oFAQTopicInfo = new Entity.FAQTopicInfo();
            BLL.FAQTopicLib oFAQTopicLib = new BLL.FAQTopicLib();

            oFAQTopicInfo = oFAQTopicLib.GetAllFAQTopicsById(Convert.ToInt32(e.CommandArgument));
            if (oFAQTopicInfo != null)
            {
                txtTopic.Text = oFAQTopicInfo.StrFaqTopic;

                ViewState["Int_FAQTopicId"] = e.CommandArgument.ToString();
            }

            oFAQTopicInfo = null;
            oFAQTopicInfo = null;
        }
        else if (e.CommandName.Equals("DeleteTopic"))
        {

            BLL.FAQTopicLib oFAQTopicLib = new BLL.FAQTopicLib();
            oFAQTopicLib.DeleteFAQTopicDetails(Convert.ToInt32(e.CommandArgument));
            lblMsg.Text = "Forum Topic has been deleted successfully.";

            oFAQTopicLib = null;
            ClearControls();
            BindFAQTopics();
        }
    }
    #endregion

    #region User Defined Functions

    private void BindFAQTopics()
    {
        BLL.FAQTopicLib oFAQTopicLib = new BLL.FAQTopicLib();
        GVTopics.DataSource = oFAQTopicLib.GetAllFAQTopics();
        GVTopics.DataBind();
        oFAQTopicLib = null;
    }

    private void AddUpdateFAQTopics()
    {
        BLL.FAQTopicLib oFAQTopicLib = new BLL.FAQTopicLib();

        Entity.FAQTopicInfo oFAQTopicInfo = new Entity.FAQTopicInfo();
        oFAQTopicInfo.Int_FAQTopicId = 0;
        oFAQTopicInfo.DtCreatedOn = DateTime.Now;
        oFAQTopicInfo.StrFaqTopic = txtTopic.Text.Trim();
        oFAQTopicInfo.StrCreatedBy = AppLib.GetLoggedInUserName();


        if (ViewState["Int_FAQTopicId"] != null)
        {

            oFAQTopicInfo.Int_FAQTopicId = Convert.ToInt32(ViewState["Int_FAQTopicId"]);
            if (oFAQTopicLib.UpdateFAQTopicDetails(oFAQTopicInfo))
            {
                lblMsg.Text = "FAQ Topic has been updated successfully.";
                ViewState["intNewsLetterId"] = null;
                ViewState["strOldFileName"] = null;
                ClearControls();
                BindFAQTopics();
            }
            else
            {
                lblMsg.Text = "FAQ Topic already exists.";
            }
        }
        else
        {
            if (oFAQTopicLib.SaveFAQTopicDetails(oFAQTopicInfo))
            {
                lblMsg.Text = "FAQ Topic has been added successfully.";
                ClearControls();
                BindFAQTopics();
            }
            else
            {
                lblMsg.Text = "FAQ Topic already exists.";
            }
        }
        oFAQTopicLib = null;
        oFAQTopicInfo = null;
    }



    private void ClearControls()
    {
        txtTopic.Text = string.Empty;

    }


    #endregion
    protected void lnkBtnSubmit_Click(object sender, EventArgs e)
    {
        AddUpdateFAQTopics();
    }
}