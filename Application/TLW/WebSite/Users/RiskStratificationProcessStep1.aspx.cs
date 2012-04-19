using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Users_RiskStratificationProcessStep1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // HttpContext.Current.Session["strUserName"] = "ttt@ttt.com";


        


        if (!AppLib.IsLoggedinSessionExists())
        {
            lblError.Text = "Your session has been expired. Please login again";
            return;
        }

        //AppLib.GetLoggedInUserName());
        #region Insert visited log details

        AppLib.InsertVisitedSectionDetails("Risk Stratification Process Step 1 Part A");

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
            lblCMSText.Text = oTemplateLib.GetTemplateDetailsByTemplateTemplateName("RiskStratificationProcessFirstStepIntroductionPart1").TextAreaHTML;
        }
        catch { }
        finally { oTemplateLib = null; }
    }

    private void BindQuestionnaires()
    {
        BLL.QuestionnaireLib oQuestionnaireLib = new BLL.QuestionnaireLib();
        GVQuestionnaire.DataSource = oQuestionnaireLib.GetAllQuestionnairesByQuestionnareType(1);
        GVQuestionnaire.DataBind();

        oQuestionnaireLib = null;


    }

    protected void lnkBtnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            bool blnIsChecked = false;

            foreach (GridViewRow gvRow in GVQuestionnaire.Rows)
            {
                RadioButtonList rdoListAnswer = (RadioButtonList)gvRow.FindControl("rdoListAnswer");
                if (!blnIsChecked)
                {
                    if (rdoListAnswer != null)
                    {
                        if (rdoListAnswer.SelectedValue.Equals("Yes"))
                        {
                            blnIsChecked = true;
                            break;
                        }
                    }
                }
                else
                {
                    break;
                }
            }



            if (blnIsChecked)
            {
                if (!chkWaiverAgreement.Checked)
                {
                    lblError.Text = "Please accept the waiver agreement";
                    return;
                }
                else
                {
                    List<Entity.QuestionnaireInfo> oListQuestionnaireInfo = new List<Entity.QuestionnaireInfo>();

                    foreach (GridViewRow gvr in GVQuestionnaire.Rows)
                    {
                        Entity.QuestionnaireInfo oQuestionnaireInfo = new Entity.QuestionnaireInfo();
                        oQuestionnaireInfo.DtCreatedDate = DateTime.Now;
                        Label lblQuestionId = (Label)gvr.FindControl("lblQuestionId");
                        Label lblQuestion = (Label)gvr.FindControl("lblQuestion");
                        RadioButtonList rdoListAnswer = (RadioButtonList)gvr.FindControl("rdoListAnswer");

                        if (lblQuestionId != null && lblQuestion != null)
                        {
                            oQuestionnaireInfo.IntQuestionnaireId = Convert.ToInt32(lblQuestionId.Text);
                            oQuestionnaireInfo.StrQuestion = lblQuestion.Text;
                            oQuestionnaireInfo.StrAnswer = rdoListAnswer.SelectedValue;
                        }


                        oListQuestionnaireInfo.Add(oQuestionnaireInfo);
                        oQuestionnaireInfo = null;
                    }
                    BackofficeClass objBackOfficeClass = new BackofficeClass();
                    DataSet DS = objBackOfficeClass.Mem_GET_UserInfo(AppLib.GetLoggedInUserName());
                    if (DS != null)
                    {
                        if (DS.Tables[0].Rows.Count > 0)
                        {

                            BLL.QuestionnaireLib oQuestionnaireLib = new BLL.QuestionnaireLib();
                            oQuestionnaireLib.SaveUserRiskStratificationProcessDetails(oListQuestionnaireInfo, new Guid(DS.Tables[0].Rows[0]["USER_ID"].ToString()));

                            DS = null;
                            objBackOfficeClass = null;
                            oListQuestionnaireInfo = null;
                            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Users/RiskStratificationProcessStep1PartB.aspx?id=" + Request.QueryString["id"].ToString());
                        }
                    }
                }
            }

            else
            {
               Response.Redirect(AppConfig.GetBaseSiteUrl() + "Users/RiskStratificationProcessStep1PartB.aspx?id=" + Request.QueryString["id"].ToString());
               // Response.Redirect("RiskStratificationProcessStep1PartB.aspx?id=" + "raju.bot10@gmail.com");
            }
        }

        catch { }
    }
    protected void GVQuestionnaire_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            RadioButtonList rdoAnswer = (RadioButtonList)e.Row.FindControl("rdoListAnswer");

            if (rdoAnswer != null)
            {
                rdoAnswer.Items.Clear();
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
}