using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_ManageQuestionnaires : System.Web.UI.Page
{

    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("Manage Questionnaires");

            #endregion
        }
        else
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/Main_Frame.aspx", true);


        lblMsg.Text = string.Empty;

        trQuestionnaireHeading.Visible = false;
        if (!this.Page.IsPostBack)
        {
            ViewState["intQuestionnaireId"] = null;
            BindQuestionnaireTypes();
        }
    }

    protected void lnkBtnSearch_Click(object sender, EventArgs e)
    {
        AddUpdateQuestionnareDetails();
    }

    protected void ddlQuestionnaireType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlQuestionnaireType.SelectedValue.Equals("3"))
        {
            BindQuestionnairesBySubHeading();
            trQuestionnaireHeading.Visible = true;
        }
        else
        {
            BindQuestionnaires();
            trQuestionnaireHeading.Visible = false;
        }



    }
    protected void ddlHeading_SelectedIndexChanged(object sender, EventArgs e)
    {
        trQuestionnaireHeading.Visible = true;
        if (!ddlHeading.SelectedValue.Equals("0"))
            BindQuestionnairesBySubHeading();
    }

    protected void GVQuestionnaire_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("EditQuestionnaire"))
        {
            Entity.QuestionnaireInfo oQuestionnaireInfo = new Entity.QuestionnaireInfo();
            BLL.QuestionnaireLib oQuestionnaireLib = new BLL.QuestionnaireLib();
            oQuestionnaireInfo = oQuestionnaireLib.GetAllQuestionnairesById(Convert.ToInt32(e.CommandArgument));
            if (oQuestionnaireInfo != null)
            {
                txtQuestions.Text = oQuestionnaireInfo.StrQuestion;
                txtQuestions.Enabled = false;
                chkYes.Checked = oQuestionnaireInfo.ChrDisplayYes.Equals('Y') ? true : false;
                ChkNo.Checked = oQuestionnaireInfo.ChrDisplayNo.Equals('Y') ? true : false;
                ChkDontKnow.Checked = oQuestionnaireInfo.ChrDisplayDontKnow.Equals('Y') ? true : false;
                chkIsActive.Checked = oQuestionnaireInfo.ChrIsActive.Equals('Y') ? true : false;
                ddlQuestionnaireType.SelectedIndex = ddlQuestionnaireType.Items.IndexOf(ddlQuestionnaireType.Items.FindByValue(oQuestionnaireInfo.IntQuestionnaireType.ToString()));

                if (oQuestionnaireInfo.IntQuestionnaireType.Equals(3))
                {
                    trQuestionnaireHeading.Visible = true;
                    ddlHeading.SelectedIndex = ddlHeading.Items.IndexOf(ddlHeading.Items.FindByText(oQuestionnaireInfo.StrQuestionHeading.ToString()));
                }
                else
                {
                    trQuestionnaireHeading.Visible = false;
                }
                ViewState["intQuestionnaireId"] = e.CommandArgument.ToString();
            }
        }
        else if (e.CommandName.Equals("DeleteQuestionnaire"))
        {

            BLL.QuestionnaireLib oQuestionnaireLib = new BLL.QuestionnaireLib();
            oQuestionnaireLib.DeleteQuestionnaireDetails(Convert.ToInt32(e.CommandArgument));
            lblMsg.Text = "Questionnaire has been deleted successfully.";

            oQuestionnaireLib = null;
            trQuestionnaireHeading.Visible = true;
            //ClearControls();
            BindQuestionnaires();
            BindQuestionnairesBySubHeading();
        }
        else if (e.CommandName.Equals("StatusChanged"))
        {

            BLL.QuestionnaireLib oQuestionnaireLib = new BLL.QuestionnaireLib();
            oQuestionnaireLib.ChangeStatusofQuestionnaire(Convert.ToInt32(e.CommandArgument));
            lblMsg.Text = "Questionnaire status has been changed successfully.";
            
            oQuestionnaireLib = null;
           // ClearControls();
            trQuestionnaireHeading.Visible = true;
            BindQuestionnaires();
            BindQuestionnairesBySubHeading();
        }


    }
    #endregion

    #region User Defined Functions

    private void AddUpdateQuestionnareDetails()
    {
        BLL.QuestionnaireLib oQuestionnaireLib = new BLL.QuestionnaireLib();
        Entity.QuestionnaireInfo oQuestionnaireInfo = new Entity.QuestionnaireInfo();
        oQuestionnaireInfo.IntQuestionnaireId = 0;
        oQuestionnaireInfo.IntQuestionnaireType = Convert.ToInt32(ddlQuestionnaireType.SelectedValue);
        oQuestionnaireInfo.StrQuestion = txtQuestions.Text.Trim();

        if (oQuestionnaireInfo.StrQuestion.Length > 500)
            oQuestionnaireInfo.StrQuestion = oQuestionnaireInfo.StrQuestion.Substring(0, 499);




        oQuestionnaireInfo.ChrDisplayYes = chkYes.Checked ? 'Y' : 'N';
        oQuestionnaireInfo.ChrDisplayNo = ChkNo.Checked ? 'Y' : 'N';
        oQuestionnaireInfo.ChrDisplayDontKnow = ChkDontKnow.Checked ? 'Y' : 'N';
        oQuestionnaireInfo.ChrIsActive = chkIsActive.Checked ? 'Y' : 'N';
        oQuestionnaireInfo.ChrIsDeleted = 'N';
        oQuestionnaireInfo.DtCreatedDate = DateTime.Now;

        if (oQuestionnaireInfo.IntQuestionnaireType.Equals(3))
        {
            oQuestionnaireInfo.StrQuestionHeading = ddlHeading.SelectedItem.Text;
        }
        else
        {
            oQuestionnaireInfo.StrQuestionHeading = string.Empty;
        }


        if (ViewState["intQuestionnaireId"] != null)
        {
            oQuestionnaireInfo.IntQuestionnaireId = Convert.ToInt32(ViewState["intQuestionnaireId"]);
            if (oQuestionnaireLib.UpdateQuestionnaireDetails(oQuestionnaireInfo) > 0)
            {
                lblMsg.Text = "Questionnaire has been updated successfully.";
                ViewState["intQuestionnaireId"] = null;
                //ClearControls();
                txtQuestions.Text = string.Empty;
                chkIsActive.Checked = false;
                ChkDontKnow.Checked = false;
                ChkNo.Checked = false;
                chkYes.Checked = false;
                trQuestionnaireHeading.Visible = true;
                //ClearControls();
                BindQuestionnaires();
                BindQuestionnairesBySubHeading();
            }
            else
            {
                lblMsg.Text = "Questionnaire already exists.";
            }
        }
        else
        {
            if (oQuestionnaireLib.SaveQuestionnaireDetails(oQuestionnaireInfo) > 0)
            {
                lblMsg.Text = "Questionnaire has been added successfully.";
                trQuestionnaireHeading.Visible = true;
                txtQuestions.Text = string.Empty;
                chkIsActive.Checked = false;
                ChkDontKnow.Checked = false;
                ChkNo.Checked = false;
                chkYes.Checked = false;
                //ClearControls();
                BindQuestionnaires();
                BindQuestionnairesBySubHeading();
            }
            else
            {
                lblMsg.Text = "Questionnaire already exists.";
            }
        }


        oQuestionnaireInfo = null;
        oQuestionnaireLib = null;
    }

    private void BindQuestionnaireTypes()
    {
        AppLib.BindGlobalCodesDropdown(ddlQuestionnaireType, "Select", "QuestionnaireTypes");
        AppLib.BindGlobalCodesDropdown(ddlHeading, "Select", "SubQuestionnaireTypes");
    }

    private void BindQuestionnairesBySubHeading()
    {
        BLL.QuestionnaireLib oQuestionnaireLib = new BLL.QuestionnaireLib();
        GVQuestionnaire.DataSource = oQuestionnaireLib.GetAllQuestionnairesByHeading(Convert.ToInt32(ddlQuestionnaireType.SelectedValue), ddlHeading.SelectedItem.Text);
        GVQuestionnaire.DataBind();
        GVQuestionnaire.Columns[2].Visible = true;



        oQuestionnaireLib = null;
    }

    private void BindQuestionnaires()
    {
        BLL.QuestionnaireLib oQuestionnaireLib = new BLL.QuestionnaireLib();
        GVQuestionnaire.DataSource = oQuestionnaireLib.GetAllQuestionnairesByQuestionnareType(Convert.ToInt32(ddlQuestionnaireType.SelectedValue));
        GVQuestionnaire.DataBind();
        GVQuestionnaire.Columns[2].Visible = false;
        oQuestionnaireLib = null;
    }

    private void ClearControls()
    {
        ddlQuestionnaireType.SelectedIndex = 0;
        txtQuestions.Text = string.Empty;
        chkIsActive.Checked = false;
        ChkDontKnow.Checked = false;
        ChkNo.Checked = false;
        chkYes.Checked = false;
        ddlHeading.SelectedIndex = 0;
    }

    #endregion

}