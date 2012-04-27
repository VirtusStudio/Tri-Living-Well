using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AskQuestiontoHealthCoach : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = string.Empty;
        if (!this.Page.IsPostBack)
        {
            if (Request.QueryString["cid"] != null)
            {
                ddlCategory.SelectedValue = Request.QueryString["cid"].ToString();
            }

        }

    }
    protected void lnkBtnSumit_Click(object sender, EventArgs e)
    {
        SendContactUsEmail();
    }
    private void SendContactUsEmail()
    {
        string strContent = string.Empty;

        BLL.TemplateLib oTemplateLib = new BLL.TemplateLib();

        strContent = oTemplateLib.GetTemplateDetailsByTemplateTemplateName("HealthCoachSubmitQuestionEmail").TextAreaHTML;

        Entity.CompanyInfo oCompanyInfo = new Entity.CompanyInfo();
        oCompanyInfo.StrCategoryLevel = ddlLevel.SelectedItem.Text;
        oCompanyInfo.StrUserName = AppLib.GetLoggedInUserName();
        oCompanyInfo.StrCategoryName = ddlCategory.SelectedItem.Text;
        oCompanyInfo.StrQuestion = txtQuestion.Text.Trim();
        oCompanyInfo.StrSubject = txtsubject.Text.Trim();
        oCompanyInfo.StrComments = txtComments.Text.Trim();
        oCompanyInfo.StrQuestionType = rdoQuestionType.SelectedItem.Text;
        oCompanyInfo.StrAnswer = string.Empty;
        oCompanyInfo.DtCreatedOn = DateTime.Now;
        oCompanyInfo.ChrIsAnsweredGiven = 'N';
        oCompanyInfo.ChrIsDeleted = 'N';

        BLL.CompanyManager oCompanyManager = new BLL.CompanyManager();
        oCompanyManager.SaveQuestionToHealthCoachFromUser(oCompanyInfo);

    

        lblMsg.Text = "Your question has been successfully sent to health coach. Health Coach will approach you soon";
        strContent = strContent.Replace("[Name]", oCompanyManager.GetUserDetailsByUsername(AppLib.GetLoggedInUserName()).StrUserFullName);
        strContent = strContent.Replace("[Email]", AppLib.GetLoggedInUserName());
        strContent = strContent.Replace("[Category]", ddlCategory.SelectedItem.Text + " - " + ddlLevel.SelectedItem.Text);
        strContent = strContent.Replace("[Question]", txtQuestion.Text.Trim());

        strContent = strContent.Replace("[Subject]", txtsubject.Text);
        strContent = strContent.Replace("[Comments]", txtComments.Text);
        strContent = strContent.Replace("[QuestionType]", rdoQuestionType.SelectedItem.Text);

        strContent = strContent.Replace("[SiteUrl]", AppConfig.GetBaseSiteUrl());
        strContent = strContent.Replace("[SiteName]", AppConfig.GetSiteName());
        strContent = strContent.Replace("[SitePhone]", AppConfig.GetSITEPHONE());
        try
        {
            AppLib.SendMailToUser(AppLib.GetLoggedInUserName(), txtsubject.Text, strContent, AppConfig.GetAdminEmail());

            AppLib.SendMailToUser(AppConfig.GetAdminEmail(), txtsubject.Text, "Dear Admin, Following are the contents that were sent to the user. <br />" + strContent, AppLib.GetLoggedInUserName());
        }
        catch { }

        oTemplateLib = null;
        oCompanyManager = null;
        oCompanyInfo = null;

        txtQuestion.Text = string.Empty;
        txtsubject.Text = string.Empty;
        txtComments.Text = string.Empty; ;
        rdoQuestionType.SelectedIndex = 0;

        //lblMsg.Text = "Thanks for contact us. Your details has been successfully sent to TLW.";
        //txtName.Text = string.Empty;
        //txtBphone.Text = string.Empty;
        //txtComments.Text = string.Empty;
        //txtEmail.Text = string.Empty;
        //txtsubject.Text = string.Empty;
    }
    /*Following functions is added by Netsmartz*/
    protected override void OnInit(EventArgs e)
    {
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Welcome/Styles/Corporate.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound4.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Table.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound5.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Main.css\" />"));
        base.OnInit(e);

    }
}