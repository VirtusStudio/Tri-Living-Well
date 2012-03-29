using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_ViewQuestionDetails : System.Web.UI.Page
{

    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("View Questions Details by User");

            #endregion
        }
        else
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/Main_Frame.aspx", true);


        BindDetails();
    }
     
    #endregion

    #region User Defined Functions


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
                 

                lblQuestionType.Text= oCompanyInfo.StrQuestionType;
                
                
                GVAnswer.DataSource = oCompanyManager.GetAnswerofPrivateQuestionByQuestionId(Convert.ToInt32(Request.QueryString["qid"]));
                GVAnswer.DataBind();
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

    

    #endregion
  
}