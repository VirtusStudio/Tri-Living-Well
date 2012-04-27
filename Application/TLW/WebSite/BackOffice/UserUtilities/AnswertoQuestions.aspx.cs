using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_UserUtilities_AnswertoQuestions : System.Web.UI.Page
{

    #region Events

    /// Event Header*******************************************************
    /// Function Name: Page_Load
    /// Function Type: Event
    /// Functionality: Event fired when the page gets loaded.
    /// Input: 
    /// Output: 
    /// Return Value:
    /// Note: 
    /// ********************************************************************
    protected void Page_Load(object sender, EventArgs e)
    {
        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("Answer to Users Questions");

            #endregion
        }
        else
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/Main_Frame.aspx", true);

        if (!this.Page.IsPostBack)
        {
            BindDetails();
        }
    }
    /// Event Header*******************************************************
    /// Function Name: lnkBtnSumit_Click
    /// Function Type: Event
    /// Functionality: Event fired when admin user click on the submit button
    /// Input: 
    /// Output: 
    /// Return Value:
    /// Note: 
    /// ********************************************************************
    protected void lnkBtnSumit_Click(object sender, EventArgs e)
    {
        SaveDetails();
    }

    #endregion

    #region User Defined Functions

    /// Function Header*******************************************************
    /// Function Name: BindDetails
    /// Function Type: Function
    /// Functionality: Function used to bind the details of question
    /// Input: 
    /// Output: 
    /// Return Value:
    /// Note: 
    /// ********************************************************************
    private void BindDetails()
    {
        BLL.CompanyManager oCompanyManager = new BLL.CompanyManager();
        Entity.CompanyInfo oCompanyInfo = new Entity.CompanyInfo();
        if (Request.QueryString["qid"] != null)
        {
            oCompanyInfo = oCompanyManager.GetQuestionsForHealthCoachFromUserByQuestionId(Convert.ToInt32(Request.QueryString["qid"]));
            if (oCompanyInfo != null)
            {
                lblCategory.Text = oCompanyInfo.StrCategoryName + " - " + oCompanyInfo.StrCategoryLevel;
                lblQuestion.Text = oCompanyInfo.StrQuestion;
                lblSubject.Text = oCompanyInfo.StrSubject;
                lblComments.Text = oCompanyInfo.StrComments;
                lblUserId.Text = oCompanyInfo.StrUserName;

                rdoQuestionType.SelectedValue = oCompanyInfo.StrQuestionType;
                lblUserEmail.Text = oCompanyInfo.StrUserName;
                lblUserEmail.Text = oCompanyManager.GetUserDetailsByUsername(lblUserEmail.Text).StrUserFullName + "(" + oCompanyInfo.StrUserName + ")";
                GVAnswer.DataSource = oCompanyManager.GetAnswerofPrivateQuestionByQuestionId(Convert.ToInt32(Request.QueryString["qid"]));
                GVAnswer.DataBind();

                txtAnswer.Text = oCompanyManager.GetAnswerofPrivateQuestionByQuestionId(Convert.ToInt32(Request.QueryString["qid"])).ElementAt(0).StrAnswer;

                if (GVAnswer.Rows.Count > 0)
                    trAnswer.Visible = true;
                else
                    trAnswer.Visible = false;
                //
            }
        }

        oCompanyInfo = null;
        oCompanyManager = null;
    }

    /// Function Header*******************************************************
    /// Function Name: SaveDetails
    /// Function Type: Function
    /// Functionality: Function used to save the details of questions with answer provided by admin
    /// Input: 
    /// Output: 
    /// Return Value:
    /// Note: 
    /// ********************************************************************
    private void SaveDetails()
    {
        string strContent = string.Empty;

        BLL.TemplateLib oTemplateLib = new BLL.TemplateLib();


        Entity.CompanyInfo oCompanyInfo = new Entity.CompanyInfo();
        oCompanyInfo.StrUserName = AppLib.GetLoggedInUserName();
        oCompanyInfo.IntQuestionId = Convert.ToInt32(Request.QueryString["qid"]);
        oCompanyInfo.StrAnswer = txtAnswer.Text.Trim();
        oCompanyInfo.DtAnsweredOn = DateTime.Now;
        oCompanyInfo.StrQuestionType = rdoQuestionType.SelectedValue;
        oCompanyInfo.StrAnsweredBy = AppLib.GetLoggedInUserName();
        oCompanyInfo.StrQuestion = lblQuestion.Text;
        oCompanyInfo.StrUserId = lblUserId.Text;
        BLL.CompanyManager oCompanyManager = new BLL.CompanyManager();
        oCompanyManager.SaveAnswerFromHealthCoach(oCompanyInfo);

        strContent = oTemplateLib.GetTemplateDetailsByTemplateTemplateName("HealthCoachSubmitQuestionEmail").TextAreaHTML;

        try
        {

            strContent = strContent.Replace("[Name]", oCompanyManager.GetUserDetailsByUsername(lblUserEmail.Text).StrUserFullName);

            strContent = strContent.Replace("[Category]", lblCategory.Text);
            strContent = strContent.Replace("[Question]", lblQuestion.Text);
            strContent = strContent.Replace("[Subject]", lblSubject.Text);
            strContent = strContent.Replace("[Comments]", lblComments.Text);
            strContent = strContent.Replace("[QuestionType]", rdoQuestionType.SelectedValue);
            strContent = strContent.Replace("[Answer]", txtAnswer.Text);
            strContent = strContent.Replace("[SiteUrl]", AppConfig.GetBaseSiteUrl());
            strContent = strContent.Replace("[SiteName]", AppConfig.GetSiteName());
            strContent = strContent.Replace("[SitePhone]", AppConfig.GetSITEPHONE());
            AppLib.SendMailToUser(lblUserEmail.Text, lblSubject.Text, strContent, AppConfig.GetAdminEmail());

            //AppLib.SendMailToUser(AppConfig.GetAdminEmail(), lblSubject.Text, "Dear Admin, Following are the contents that were sent to the user. <br />" + strContent, lblUserEmail.Text);
        }
        catch { }
        finally
        {
            oTemplateLib = null;
            oCompanyManager = null;
            oCompanyInfo = null;
        }


        Response.Redirect(AppConfig.GetBaseSiteUrl() + "BackOffice/UserUtilities/ManageQuestionforHealthCoach.aspx?msg=up", true);

    }


    #endregion

}