using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_Templates_AddEditFAQ : System.Web.UI.Page
{
    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            if (Request.QueryString["id"] == null)
            {
                
                lnkBtnSubmit.Text = "Save";
                AppLib.InsertVisitedSectionDetails("Add FAQ");
            }
            else
            {
                lblHeading.Text = "Edit FAQ"; 
                AppLib.InsertVisitedSectionDetails("Edit FAQ");
                lnkBtnSubmit.Text = "Update";
            }
            #endregion
        }
        else
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/Main_Frame.aspx", true);

        if (!this.Page.IsPostBack)
        {
            BindFAQTopics();
            BindDetails();
        }
    }
    protected void lnkBtnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect(AppConfig.GetBaseSiteUrl() + "BackOffice/Templates/ManageFaq.aspx", true);
        // SendContactUsEmail();
    }

    protected void lnkBtnSubmit_Click(object sender, EventArgs e)
    {
        BLL.UserLib oUserLib = new BLL.UserLib();
        Entity.UserInfo oUserInfo = new Entity.UserInfo();

        oUserInfo.IntQuestionId = 0;
        oUserInfo.StrHeading = ddlTopic.SelectedItem.Text;
        oUserInfo.StrQuestion = txtQuestion.Text;
        if (oUserInfo.StrQuestion.Length > 500)
            oUserInfo.StrQuestion = oUserInfo.StrQuestion.Substring(0, 499);

        oUserInfo.StrAnswer = txtAnswer.Text;
        if (oUserInfo.StrAnswer.Length > 500)
            oUserInfo.StrAnswer = oUserInfo.StrAnswer.Substring(0, 499);

        oUserInfo.DtCreatedOn = DateTime.Now;
        oUserInfo.StrUserId = AppLib.GetLoggedInUserName();
        if (Request.QueryString["id"] == null)
        {
            oUserInfo.ChrUserType = 'A';
           
            if (oUserLib.InsertFAQ(oUserInfo))
            {
                oUserLib = null;
                oUserInfo = null;
                Response.Redirect(AppConfig.GetBaseSiteUrl() + "BackOffice/Templates/ManageFaq.aspx?msg=ins", true);
            }
            else
            {
                lblMsg.Text = "FAQ already exists.";
            }
        }
        else
        {
            oUserInfo.IntFAQId = Convert.ToInt32(Request.QueryString["id"]);

            if (oUserLib.UpdateFAQ(oUserInfo))
            {
                oUserLib = null;
                oUserInfo = null;
                Response.Redirect(AppConfig.GetBaseSiteUrl() + "BackOffice/Templates/ManageFaq.aspx?msg=up", true);
            }
            else
            {
                lblMsg.Text = "FAQ already exists.";
            }
        }


        // SendContactUsEmail();
    }

    #endregion

    #region User Defined Functions

    private void BindFAQTopics()
    {
        BLL.UserLib oUserLib = new BLL.UserLib();
        ddlTopic.DataSource = oUserLib.GetFAQTopics();
        ddlTopic.DataTextField = "StrFaqTopic";
        ddlTopic.DataValueField = "IntFAQTopicId";
        ddlTopic.DataBind();
        oUserLib = null;

    }
    private void BindDetails()
    {

        BLL.UserLib oUserLib = new BLL.UserLib();
        Entity.UserInfo oUserInfo = new Entity.UserInfo();
        if (Request.QueryString["id"] != null)
        {
            oUserInfo = oUserLib.GetAllFAQByFaqId(Convert.ToInt32(Request.QueryString["id"]));
            if (oUserInfo != null)
            {
                ddlTopic.SelectedIndex = ddlTopic.Items.IndexOf(ddlTopic.Items.FindByText(oUserInfo.StrHeading));
                txtQuestion.Text = oUserInfo.StrQuestion;
                txtAnswer.Text = oUserInfo.StrAnswer;
            }
        }

        oUserInfo = null;
        oUserLib = null;
    }




    #endregion
}