using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Users_RiskStratificationProcessStep2 : System.Web.UI.Page
{
    BackofficeClass objBackOfficeClass;
    int intGenderID = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        // HttpContext.Current.Session["strUserName"] = "ttt@ttt.com";
        if (!AppLib.IsLoggedinSessionExists())
        {
            lblError.Text = "Your session has been expired. Please login again";
            return;
        }


        //AppLib.GetLoggedInUserName());
        FindLoggedInUserGender();
        #region Insert visited log details

        AppLib.InsertVisitedSectionDetails("Risk Stratification Process Step 2");

        #endregion


        BindCMSText();

        if (this.Page.IsPostBack.Equals(false))
            BindQuestionnaires();
    }
    private void BindCMSText()
    {
        BLL.TemplateLib oTemplateLib = new BLL.TemplateLib();
        try
        {
            lblCMSText.Text = oTemplateLib.GetTemplateDetailsByTemplateTemplateName("RiskStratificationProcessSecondStepIntroduction").TextAreaHTML;
        }
        catch { }
        finally { oTemplateLib = null; }
    }

    protected void lnkBack_Click(object sender, EventArgs e)
    {
        Response.Redirect(AppConfig.GetBaseSiteUrl() + "Users/RiskStratificationProcessStep1PartB.aspx?id=" + Request.QueryString["id"].ToString());
    }
    protected void lnkBtnSubmit_Click(object sender, EventArgs e)
    {
        BLL.QuestionnaireLib oQuestionnaireLib = new BLL.QuestionnaireLib();
        try
        {



            bool bolIsPositiveRiskFactor = false;
            int intPositiveRiskFactor = 0;
            int intNegativeRiskFactor = 0;
            //Response.Redirect(AppConfig.GetBaseSiteUrl() + "Users/RiskStratificationProcessStep3.aspx?id=" + Request.QueryString["id"].ToString());
            foreach (GridViewRow gvr in GVQuestionnaireHeading.Rows)
            {
                Label lblQuestionHeading = (Label)gvr.FindControl("lblQuestionHeading");
                GridView GVQuestion = (GridView)gvr.FindControl("GVQuestion");
                string strQuestHeading = lblQuestionHeading.Text;

                if (lblQuestionHeading != null)
                {
                    if (!strQuestHeading.ToLower().Equals("age"))
                    {
                        foreach (GridViewRow gvrQuestions in GVQuestion.Rows)
                        {
                            Label lblQuestionId = (Label)gvrQuestions.FindControl("lblQuestionId");
                            RadioButtonList rdoListAnswer = (RadioButtonList)gvrQuestions.FindControl("rdoListAnswer");

                            if (lblQuestionId.Text.Equals("18"))
                            {

                                //18 means 45 old
                            }
                            else if (lblQuestionId.Text.Equals("19"))
                            {
                                //19 means 55 old

                            }
                        }
                    }

                    if (strQuestHeading.ToLower().Equals("positive risk factor"))
                    {
                        foreach (GridViewRow gvrQuestions in GVQuestion.Rows)
                        {
                            RadioButtonList rdoListAnswer = (RadioButtonList)gvrQuestions.FindControl("rdoListAnswer");
                            if (rdoListAnswer != null)
                            {
                                if (rdoListAnswer.SelectedValue.Equals("Yes"))
                                    bolIsPositiveRiskFactor = true;
                            }
                        }
                    }
                    else if (strQuestHeading.ToLower().Equals("cholesterol"))
                    {
                        bool blnIsAdded = false;
                        foreach (GridViewRow gvrQuestions in GVQuestion.Rows)
                        {
                            RadioButtonList rdoListAnswer = (RadioButtonList)gvrQuestions.FindControl("rdoListAnswer");
                            if (rdoListAnswer.SelectedValue.Equals("Yes"))
                            {
                                if (!blnIsAdded)
                                {
                                    blnIsAdded = true;
                                    intNegativeRiskFactor = intNegativeRiskFactor + 1;
                                }
                            }
                        }
                    }
                    else if (strQuestHeading.ToLower().Equals("hypertension"))
                    {
                        bool blnIsAdded = false;
                        foreach (GridViewRow gvrQuestions in GVQuestion.Rows)
                        {
                            RadioButtonList rdoListAnswer = (RadioButtonList)gvrQuestions.FindControl("rdoListAnswer");
                            if (rdoListAnswer.SelectedValue.Equals("Yes"))
                            {
                                if (!blnIsAdded)
                                {
                                    blnIsAdded = true;
                                    intNegativeRiskFactor = intNegativeRiskFactor + 1;
                                }
                            }
                        }
                    }
                    else if (strQuestHeading.ToLower().Equals("smoking"))
                    {
                        foreach (GridViewRow gvrQuestions in GVQuestion.Rows)
                        {
                            RadioButtonList rdoListAnswer = (RadioButtonList)gvrQuestions.FindControl("rdoListAnswer");
                            if (rdoListAnswer.SelectedValue.Equals("Yes"))
                            {
                                //Response.Write("smoking=" + intNegativeRiskFactor);
                                intNegativeRiskFactor = intNegativeRiskFactor + 1;
                            }
                        }
                    }
                    else if (strQuestHeading.ToLower().Equals("pre-diabetes"))
                    {
                        foreach (GridViewRow gvrQuestions in GVQuestion.Rows)
                        {
                            RadioButtonList rdoListAnswer = (RadioButtonList)gvrQuestions.FindControl("rdoListAnswer");
                            if (rdoListAnswer.SelectedValue.Equals("Yes"))
                                intNegativeRiskFactor = intNegativeRiskFactor + 1;
                        }
                    }
                    else if (strQuestHeading.ToLower().Equals("weight"))
                    {
                        foreach (GridViewRow gvrQuestions in GVQuestion.Rows)
                        {
                            RadioButtonList rdoListAnswer = (RadioButtonList)gvrQuestions.FindControl("rdoListAnswer");
                            if (rdoListAnswer.SelectedValue.Equals("Yes"))
                                intNegativeRiskFactor = intNegativeRiskFactor + 1;
                        }
                    }
                    else if (strQuestHeading.ToLower().Equals("activity factor"))
                    {
                        foreach (GridViewRow gvrQuestions in GVQuestion.Rows)
                        {
                            RadioButtonList rdoListAnswer = (RadioButtonList)gvrQuestions.FindControl("rdoListAnswer");
                            if (rdoListAnswer.SelectedValue.Equals("Yes"))
                                intNegativeRiskFactor = intNegativeRiskFactor + 1;
                        }
                    }
                }
            }


            if (bolIsPositiveRiskFactor)
                intNegativeRiskFactor = intNegativeRiskFactor - 1;




            int intScore = 0;
            int intCategory = 0;
            //intScore = intNegativeRiskFactor - intPositiveRiskFactor;
            intScore = intNegativeRiskFactor;
            objBackOfficeClass = new BackofficeClass();
            string strEmailId = AppLib.Decrypt(Request.QueryString["id"].ToString());

            if (!oQuestionnaireLib.HasUserGivenYesAnswerinFirstRiskStratificationStep(strEmailId))
            {
                oQuestionnaireLib = null;
                DataSet DS = objBackOfficeClass.Mem_GET_UserInfo(strEmailId);
                if (DS != null)
                {
                    if (DS.Tables[0].Rows.Count > 0)
                    {
                        int intCurrentYear = DateTime.Now.Year;
                        int intBirthYear = Convert.ToDateTime(DS.Tables[0].Rows[0]["DATE_BIRTH"]).Year;
                        int intPresentAge = intCurrentYear - intBirthYear;

                        int intGenderCode = Convert.ToInt32(DS.Tables[0].Rows[0]["GENDER_ID"]);
                        if ((intGenderCode.Equals(1) && intPresentAge <= 45) || (intGenderCode.Equals(2) && intPresentAge <= 55))
                        {///1 = male, 2= female
                            if (intScore <= 1)
                            {
                                /*Well category Low Risk*/
                                intCategory = 0;
                            }
                        }
                        else if ((intGenderCode.Equals(1) && intPresentAge > 45) || (intGenderCode.Equals(2) && intPresentAge > 55))
                        {///1 = male, 2= female
                            if (intScore >= 2)
                            {
                                /*Living category Medium Risk*/
                                intCategory = 2;
                            }
                        }
                        else
                        {
                            intCategory = 1;
                            //try and high risk 
                            /*if user given any yes answer at the step 1 questions*/
                        }
                    }
                }

                DS = null;
                objBackOfficeClass = null;
            }
            else
            {  //try and high risk 
                intCategory = 1;      /*Means user given any yes answer at the step 1 questions*/
            }


            List<Entity.QuestionnaireInfo> oListQuestionnaireInfo = new List<Entity.QuestionnaireInfo>();

            foreach (GridViewRow gvr in GVQuestionnaireHeading.Rows)
            {
                GridView GVQuestion = (GridView)gvr.FindControl("GVQuestion");
                if (GVQuestion != null)
                {
                    foreach (GridViewRow gvrQuestion in GVQuestion.Rows)
                    {
                        Entity.QuestionnaireInfo oQuestionnaireInfo = new Entity.QuestionnaireInfo();
                        oQuestionnaireInfo.DtCreatedDate = DateTime.Now;
                        Label lblQuestionId = (Label)gvrQuestion.FindControl("lblQuestionId");
                        Label lblQuestion = (Label)gvrQuestion.FindControl("lblQuestion");
                        RadioButtonList rdoListAnswer = (RadioButtonList)gvrQuestion.FindControl("rdoListAnswer");

                        if (lblQuestionId != null && lblQuestion != null)
                        {
                            oQuestionnaireInfo.IntQuestionnaireId = Convert.ToInt32(lblQuestionId.Text);
                            oQuestionnaireInfo.StrQuestion = lblQuestion.Text;
                            oQuestionnaireInfo.StrAnswer = rdoListAnswer.SelectedValue;
                        }


                        oListQuestionnaireInfo.Add(oQuestionnaireInfo);
                        oQuestionnaireInfo = null;
                    }
                }

            }

            objBackOfficeClass = new BackofficeClass();
            DataSet DS1 = objBackOfficeClass.Mem_GET_UserInfo(AppLib.GetLoggedInUserName());
            if (DS1 != null)
            {
                if (DS1.Tables[0].Rows.Count > 0)
                {
                    oQuestionnaireLib = new BLL.QuestionnaireLib();
                    oQuestionnaireLib.SaveUserRiskStratificationProcessDetailsStepSecond(oListQuestionnaireInfo, new Guid(DS1.Tables[0].Rows[0]["USER_ID"].ToString()));

                    BLL.UserLib oUserLib = new BLL.UserLib();
                    if (!oUserLib.CheckUserAssessmentAlreadyExists(new Guid(DS1.Tables[0].Rows[0]["USER_ID"].ToString())))
                        objBackOfficeClass.Mem_INSERT_UserAssessments(DS1.Tables[0].Rows[0]["USER_ID"].ToString(), "1", intScore.ToString());

                    objBackOfficeClass = null;
                    oListQuestionnaireInfo = null;
                    DS1 = null;
                    oUserLib = null;
                    Response.Redirect(AppConfig.GetBaseSiteUrl() + "Users/RiskStratificationProcessStep3.aspx?id=" + Request.QueryString["id"].ToString() + "&sc=" + AppLib.Encrypt(intScore.ToString()) + "&c=" + AppLib.Encrypt(intCategory.ToString()));
                }
            }
        }
        catch (Exception ex) { lblError.Text = ex.Message; }
        finally { oQuestionnaireLib = null; }
    }


    protected void lnkCalculateScore_Click(object sender, EventArgs e)
    {
        try
        {
            bool bolIsPositiveRiskFactor = false;
            int intPositiveRiskFactor = 0;
            int intNegativeRiskFactor = 0;
            //Response.Redirect(AppConfig.GetBaseSiteUrl() + "Users/RiskStratificationProcessStep3.aspx?id=" + Request.QueryString["id"].ToString());
            foreach (GridViewRow gvr in GVQuestionnaireHeading.Rows)
            {
                Label lblQuestionHeading = (Label)gvr.FindControl("lblQuestionHeading");
                GridView GVQuestion = (GridView)gvr.FindControl("GVQuestion");
                string strQuestHeading = lblQuestionHeading.Text;

                if (lblQuestionHeading != null)
                {
                    if (!strQuestHeading.ToLower().Equals("age"))
                    {
                        foreach (GridViewRow gvrQuestions in GVQuestion.Rows)
                        {
                            Label lblQuestionId = (Label)gvrQuestions.FindControl("lblQuestionId");
                            RadioButtonList rdoListAnswer = (RadioButtonList)gvrQuestions.FindControl("rdoListAnswer");

                            if (lblQuestionId.Text.Equals("18"))
                            {

                                //18 means 45 old
                            }
                            else if (lblQuestionId.Text.Equals("19"))
                            {
                                //19 means 55 old

                            }
                        }
                    }

                    if (strQuestHeading.ToLower().Equals("positive risk factor"))
                    {
                        foreach (GridViewRow gvrQuestions in GVQuestion.Rows)
                        {
                            RadioButtonList rdoListAnswer = (RadioButtonList)gvrQuestions.FindControl("rdoListAnswer");
                            if (rdoListAnswer != null)
                            {
                                if (rdoListAnswer.SelectedValue.Equals("Yes"))
                                    bolIsPositiveRiskFactor = true;
                            }
                        }
                    }
                    else if (strQuestHeading.ToLower().Equals("cholesterol"))
                    {
                        bool blnIsAdded = false;
                        foreach (GridViewRow gvrQuestions in GVQuestion.Rows)
                        {
                            RadioButtonList rdoListAnswer = (RadioButtonList)gvrQuestions.FindControl("rdoListAnswer");
                            if (rdoListAnswer.SelectedValue.Equals("Yes"))
                            {
                                if (!blnIsAdded)
                                {
                                    blnIsAdded = true;
                                    intNegativeRiskFactor = intNegativeRiskFactor + 1;
                                }
                            }
                        }
                    }
                    else if (strQuestHeading.ToLower().Equals("hypertension"))
                    {
                        bool blnIsAdded = false;
                        foreach (GridViewRow gvrQuestions in GVQuestion.Rows)
                        {
                            RadioButtonList rdoListAnswer = (RadioButtonList)gvrQuestions.FindControl("rdoListAnswer");
                            if (rdoListAnswer.SelectedValue.Equals("Yes"))
                            {
                                if (!blnIsAdded)
                                {
                                    blnIsAdded = true;
                                    intNegativeRiskFactor = intNegativeRiskFactor + 1;
                                }
                            }
                        }
                    }
                    else if (strQuestHeading.ToLower().Equals("smoking"))
                    {
                        foreach (GridViewRow gvrQuestions in GVQuestion.Rows)
                        {
                            RadioButtonList rdoListAnswer = (RadioButtonList)gvrQuestions.FindControl("rdoListAnswer");
                            if (rdoListAnswer.SelectedValue.Equals("Yes"))
                            {
                                //Response.Write("smoking=" + intNegativeRiskFactor);
                                intNegativeRiskFactor = intNegativeRiskFactor + 1;
                            }
                        }
                    }
                    else if (strQuestHeading.ToLower().Equals("pre-diabetes"))
                    {
                        foreach (GridViewRow gvrQuestions in GVQuestion.Rows)
                        {
                            RadioButtonList rdoListAnswer = (RadioButtonList)gvrQuestions.FindControl("rdoListAnswer");
                            if (rdoListAnswer.SelectedValue.Equals("Yes"))
                                intNegativeRiskFactor = intNegativeRiskFactor + 1;
                        }
                    }
                    else if (strQuestHeading.ToLower().Equals("weight"))
                    {
                        foreach (GridViewRow gvrQuestions in GVQuestion.Rows)
                        {
                            RadioButtonList rdoListAnswer = (RadioButtonList)gvrQuestions.FindControl("rdoListAnswer");
                            if (rdoListAnswer.SelectedValue.Equals("Yes"))
                                intNegativeRiskFactor = intNegativeRiskFactor + 1;
                        }
                    }
                    else if (strQuestHeading.ToLower().Equals("activity factor"))
                    {
                        foreach (GridViewRow gvrQuestions in GVQuestion.Rows)
                        {
                            RadioButtonList rdoListAnswer = (RadioButtonList)gvrQuestions.FindControl("rdoListAnswer");
                            if (rdoListAnswer.SelectedValue.Equals("Yes"))
                                intNegativeRiskFactor = intNegativeRiskFactor + 1;
                        }
                    }
                }
            }

            //   Response.Write(intNegativeRiskFactor.ToString());

            if (bolIsPositiveRiskFactor)
                intNegativeRiskFactor = intNegativeRiskFactor - 1;

            int intScore = 0;
            int intCategory = 0;
            //intScore = intNegativeRiskFactor - intPositiveRiskFactor;
            intScore = intNegativeRiskFactor;
            objBackOfficeClass = new BackofficeClass();
            string strEmailId = AppLib.Decrypt(Request.QueryString["id"].ToString());

            DataSet DS = objBackOfficeClass.Mem_GET_UserInfo(strEmailId);
            if (DS != null)
            {
                if (DS.Tables[0].Rows.Count > 0)
                {
                    int intCurrentYear = DateTime.Now.Year;
                    int intBirthYear = Convert.ToDateTime(DS.Tables[0].Rows[0]["DATE_BIRTH"]).Year;
                    int intPresentAge = intCurrentYear - intBirthYear;

                    int intGenderCode = Convert.ToInt32(DS.Tables[0].Rows[0]["GENDER_ID"]);
                    if ((intGenderCode.Equals(1) && intPresentAge <= 45) || (intGenderCode.Equals(2) && intPresentAge <= 55))
                    {///1 = male, 2= female
                        if (intScore <= 1)
                        {
                            /*Well category Low Risk*/
                            intCategory = 0;
                        }
                    }
                    else if ((intGenderCode.Equals(1) && intPresentAge > 45) || (intGenderCode.Equals(2) && intPresentAge > 55))
                    {///1 = male, 2= female
                        if (intScore >= 2)
                        {
                            /*Living category Medium Risk*/
                            intCategory = 2;
                        }
                    }
                    else
                    {
                        intCategory = 1;
                        //try and high risk 
                        /*if user given any yes answer at the step 1 questions*/
                    }
                }
            }

            DS = null;
            objBackOfficeClass = null;


            lblTotalScore.Text = "Your Score:" + " " + intScore.ToString();
        }
        catch { }
        finally { }
    }
    protected void GVQuestionHeading_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            GridView GVQuestion = (GridView)e.Row.FindControl("GVQuestion");
            if (GVQuestion != null)
            {
                BLL.QuestionnaireLib oQuestionnaireLib = new BLL.QuestionnaireLib();
                GVQuestion.DataSource = oQuestionnaireLib.GetAllQuestionnairesByHeading(3, DataBinder.Eval(e.Row.DataItem, "strHeading").ToString());
                GVQuestion.DataBind();

            }
        }
    }

    protected void GVQuestion_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            RadioButtonList rdoAnswer = (RadioButtonList)e.Row.FindControl("rdoListAnswer");
            Label lblQuestionId = (Label)e.Row.FindControl("lblQuestionId");

            if (rdoAnswer != null)
            {
                rdoAnswer.Items.Clear();

                if (intGenderID.Equals(1))
                {//1 = male, 2= female
                    if (lblQuestionId.Text.Equals("19"))
                    {
                        e.Row.Visible = false;
                        rdoAnswer.Visible = false;
                        //19 means 55 old
                    }
                }
                else
                {//1 = male, 2= female
                    if (lblQuestionId.Text.Equals("18"))
                    {
                        e.Row.Visible = false;
                        rdoAnswer.Visible = false;
                        //18 means 45 old
                    }
                }


                if (DataBinder.Eval(e.Row.DataItem, "ChrDisplayYes").ToString().Equals("Y"))
                {
                    rdoAnswer.Items.Add(new ListItem("Yes", "Yes"));
                    rdoAnswer.SelectedIndex = 0;
                }
                if (DataBinder.Eval(e.Row.DataItem, "ChrDisplayNo").ToString().Equals("Y"))
                {
                    rdoAnswer.Items.Add(new ListItem("No", "No"));
                }
                if (DataBinder.Eval(e.Row.DataItem, "ChrDisplayDontKnow").ToString().Equals("Y"))
                {
                    rdoAnswer.Items.Add(new ListItem("Don't Know", "DontKnow"));
                }
            }
        }
    }

    /// <summary>
    /// following function is used to bind the questions.
    /// </summary>
    private void BindQuestionnaires()
    {
        BLL.QuestionnaireLib oQuestionnaireLib = new BLL.QuestionnaireLib();
        GVQuestionnaireHeading.DataSource = oQuestionnaireLib.GetGlobalCodesByCategoryName("SubQuestionnaireTypes");
        GVQuestionnaireHeading.DataBind();
        oQuestionnaireLib = null;
    }

    /// <summary>
    /// following function is used to check whether the current logged in user is male or female
    /// </summary>
    private void FindLoggedInUserGender()
    {
        string strEmailId = AppLib.Decrypt(Request.QueryString["id"].ToString());
        objBackOfficeClass = new BackofficeClass();
        DataSet DS = objBackOfficeClass.Mem_GET_UserInfo(strEmailId);
        if (DS != null)
        {
            if (DS.Tables[0].Rows.Count > 0)
                intGenderID = Convert.ToInt32(DS.Tables[0].Rows[0]["GENDER_ID"]);
        }




        DS = null;
        objBackOfficeClass = null;
    }

}