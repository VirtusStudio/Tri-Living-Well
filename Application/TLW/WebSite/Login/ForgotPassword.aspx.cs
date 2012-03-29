using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Login_ForgotPassword : System.Web.UI.Page
{
    SqlConnClass objSqlConn = new SqlConnClass();

    string gsUserName;

    protected void Page_Load(object sender, EventArgs e)
    {
        objSqlConn.OpenConnection();

        SubmitButton.Visible = true;

        Email.Focus();
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        objSqlConn.CloseConnection();
    }

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        string sUsername = Email.Text.ToString().Trim();

        try
        {
            if (Membership.GetUser(sUsername) != null)
            {
                sendOutConfirmationEmail(sUsername);

                FailureText.Text = "Your password has been sent";
                SubmitButton.Visible = false;
            }
            else
            {
                FailureText.Text = "User Not Found";
            }

            /*---------------------VISITLOG---------------------*/
            UC_Visitlog_Visitlog1.addEntry(1, 2, 0, 0, sUsername, "", "");

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    private void sendOutConfirmationEmail(string sUsername)
    {
        try
        {
            string strContent = string.Empty;
            MembershipUser Current = Membership.GetUser(sUsername);
            string pass = Current.GetPassword().ToString();
            BLL.TemplateLib oTemplateLib = new BLL.TemplateLib();
            strContent = oTemplateLib.GetTemplateDetailsByTemplateTemplateName("ForgotPassword").TextAreaHTML;
            strContent = strContent.Replace("[UI_USERNAME]", sUsername);
            strContent = strContent.Replace("[UI_PASSWORD]", pass);
            strContent = strContent.Replace("[WC_EMAIL_PROJECT_NAME]", AppConfig.GetSiteName());
            strContent = strContent.Replace("[SiteUrl]", AppConfig.GetBaseSiteUrl());
            strContent = strContent.Replace("[SiteName]", AppConfig.GetSiteName());
            strContent = strContent.Replace("[SitePhone]", AppConfig.GetSITEPHONE());

            AppLib.SendMailToUser(sUsername, "Forgot Password From Tri Living Well", strContent, AppConfig.GetAdminEmail());
            oTemplateLib = null;
        }
        catch { }

    }
}