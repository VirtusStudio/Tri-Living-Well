using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_UserUtilities_ManageQuestionforHealthCoach : System.Web.UI.Page
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
    /// *********************************************************************
    protected void Page_Load(object sender, EventArgs e)
    {
        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("Manage Questions for Health Coach");

            #endregion
        }
        else
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/Main_Frame.aspx", true);


        lblMsg.Text = string.Empty;
        if (!this.Page.IsPostBack)
        {
            BindQuestions();
            if (Request.QueryString["msg"] != null)
            {
                if (Request.QueryString["msg"].ToString().Equals("up"))
                {
                    lblMsg.Text = "Record has been updated successfully.";
                }
            }

        }
    }

    /// Event Header*******************************************************
    /// Function Name: GVQuestion_RowCommand
    /// Function Type: Event
    /// Functionality: Event fired when user click on the edit link inside the grid
    /// Input: 
    /// Output: 
    /// Return Value:
    /// Note: 
    /// *********************************************************************
    /// 
    protected void GVQuestion_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Response.Redirect(AppConfig.GetBaseSiteUrl() + "BackOffice/UserUtilities/AnswertoQuestions.aspx?qid=" + e.CommandArgument, true);
    }

    /// Event Header*******************************************************
    /// Function Name: lnkBtnSearch_Click
    /// Function Type: Event
    /// Functionality: Event used to search the questions as per the search creteria
    /// Input: 
    /// Output: 
    /// Return Value:
    /// Note: 
    /// *********************************************************************
    /// 
    protected void lnkBtnSearch_Click(object sender, EventArgs e)
    {
        BindQuestions();
    }
    #endregion

    #region User Defined Functions

    /// Function Header*******************************************************
    /// Function Name: BindQuestions
    /// Function Type: Function
    /// Functionality: used to get bind the questions which were asked by user(s)
    /// Input: 
    /// Output: 
    /// Return Value:
    /// Note: 
    /// *********************************************************************
    private void BindQuestions()
    {
        Entity.CompanyInfo oCompanyInfo = new Entity.CompanyInfo();
        oCompanyInfo.StrCategoryName = ddlCategory.SelectedValue;
        oCompanyInfo.ChrIsAnsweredGiven = Convert.ToChar(ddlAnsweredGiven.SelectedValue);
        oCompanyInfo.StrQuestionType = ddlQuestionType.SelectedValue;
        BLL.CompanyManager oCompanyManager = new BLL.CompanyManager();
        GVQuestion.DataSource = oCompanyManager.GetQuestionsForHealthCoachFromUser(oCompanyInfo);

        GVQuestion.DataBind();
        oCompanyManager = null;
        oCompanyInfo = null;
    }


    #endregion
    
}