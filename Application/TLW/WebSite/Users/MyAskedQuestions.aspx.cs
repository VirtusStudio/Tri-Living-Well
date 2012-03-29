using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_MyAskedQuestions : System.Web.UI.Page
{
    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!AppLib.IsLoggedinSessionExists())
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/main_frame.aspx", true);


        #region Insert visited log details

        AppLib.InsertVisitedSectionDetails("User View his asked questions");

        #endregion

        lblMsg.Text = string.Empty;
        if (!this.Page.IsPostBack)
            BindQuestions();
    }
    protected void GVQuestion_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Response.Redirect(AppConfig.GetBaseSiteUrl() + "Users/ViewQuestionDetails.aspx?qid=" + e.CommandArgument, true);
    }
    protected void lnkBtnSearch_Click(object sender, EventArgs e)
    {
        BindQuestions();
    }
    #endregion

    #region User Defined Functions

    /// Function Header*******************************************************
    /// Function Name: BindEvents
    /// Function Type: Function
    /// Functionality: used to get bind the events
    /// Input: 
    /// Output: 
    /// Return Value:
    /// Note: 
    /// *********************************************************************
    private void BindQuestions()
    {
        Entity.CompanyInfo oCompanyInfo = new Entity.CompanyInfo();
        oCompanyInfo.StrCategoryName = "x";
        oCompanyInfo.ChrIsAnsweredGiven = 'x';
        oCompanyInfo.StrQuestionType = "x";
        BLL.CompanyManager oCompanyManager = new BLL.CompanyManager();
        GVQuestion.DataSource = oCompanyManager.GetQuestionsForHealthCoachFromUser(oCompanyInfo);

        GVQuestion.DataBind();
        oCompanyManager = null;
        oCompanyInfo = null;
    }


    #endregion

}