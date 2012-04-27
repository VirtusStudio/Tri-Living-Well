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

public partial class UC_Login_Register : System.Web.UI.UserControl
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    BackofficeClass objBackofficeClass;
    PALClass objPALClass;
    AccountClass objAccountClass;
    Entity.CompanyInfo oCompanyInfo;
    BLL.CompanyManager oCompanyManager;
    protected void Page_Load(object sender, EventArgs e)
    {
        /*   Membership.CreateUser("pardeep@gmail.com", "abcabsf","pardeep@gmail.com");*/



        objBackofficeClass = new BackofficeClass(objSqlConnClass.OpenConnection());
        objAccountClass = new AccountClass(objSqlConnClass.sqlConnection);

        if (!IsPostBack)
        {
            TextBox UserName = (TextBox)Login1.FindControl("UserName");
            TextBox Password = (TextBox)Login1.FindControl("Password");
            CheckBox cbRememberMe = (CheckBox)Login1.FindControl("cbRememberMe");

            UserName.Focus();

            HttpCookie cookie = Request.Cookies["RememberMe"];
            if (cookie != null)
            {
                // Response.Write("COOKIES");
                string emailID = cookie.Values["Email"].ToString();
                UserName.Text = emailID;
                cbRememberMe.Checked = true;
                Password.Focus();
            }
        }
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {

        objSqlConnClass.CloseConnection();
    }
    protected void OnLoggedIn(object sender, EventArgs e)
    {
        TextBox UserName = (TextBox)Login1.FindControl("UserName");
        TextBox Password = (TextBox)Login1.FindControl("Password");

        try
        {
            HttpContext.Current.Session["strUserName"] = UserName.Text.ToString().Trim();
            sendOutConfirmationEmail(UserName.Text.ToString().Trim());

            BLL.UserLib oUserLib = new BLL.UserLib();

            Session["strUserType"] = oUserLib.GetRoleNameByUserName(UserName.Text.ToString().Trim());

            Session["ChrUserType"] = oUserLib.GetUserTypeByUser(UserName.Text.ToString().Trim());

            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("Logged In");

            #endregion

            oUserLib = null;


            BLL.CompanyManager oCompanyManager;
            Entity.CompanyInfo oCompanyInfo;

            oCompanyManager = new BLL.CompanyManager();
            oCompanyInfo = new Entity.CompanyInfo();


            oCompanyInfo = oCompanyManager.GetCompanyDetailsByEmailId(AppLib.GetLoggedInUserName());
            if (oCompanyInfo != null)
                Session["intLoggedUserId"] = oCompanyInfo.IntCompanyId.ToString();



            oCompanyInfo = null;
            oCompanyManager = null;

            CheckBox cbRememberMe = (CheckBox)Login1.FindControl("cbRememberMe");

            if (cbRememberMe.Checked)
            {
                Response.Cookies.Remove("RememberMe");
                HttpCookie myCookie = new HttpCookie("RememberMe");

                myCookie.Values.Add("Email", UserName.Text.ToString().Trim());

                myCookie.Expires = DateTime.Now.AddDays(200); //you can add years and months too here
                Response.Cookies.Add(myCookie);
            }
            else
            {
                HttpCookie cookie = Request.Cookies["RememberMe"];
                if (cookie != null)
                {
                    cookie.Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies.Add(cookie);
                }
            }
        }
        catch (Exception ex)
        {
        }

        //string sUsername = AppLib.GetLoggedInUserName();
        string sUsername = Membership.GetUser(UserName.Text.Trim()).UserName;

        try
        {
            if (objBackofficeClass.Mem_GET_UserInfo(sUsername).Tables[0].Rows[0]["REGISTRATION_FLG"].ToString() == "0")
            {//they have not gone through their personal registration yet

                FormsAuthentication.SignOut();// LOG USER OUT PROGRAMMATICALLY
                //Response.Redirect("/Main/UserUtilities/EditUser.aspx?username=" + sUsername);/*Commented by Netsmartz*/
                Response.Redirect(AppConfig.GetBaseSiteUrl() + "Main/UserUtilities/EditUser.aspx?username=" + sUsername, true);
            }
        }
        catch (Exception ex)
        {
        }


        try
        {
            if (Roles.IsUserInRole(sUsername, "Password"))
            {
                //Response.Redirect("/Anonymous/ResetPassword/ResetPassword.aspx");/*Commented by Netsmartz*/

                Response.Redirect(AppConfig.GetBaseSiteUrl() + "Anonymous/ResetPassword/ResetPassword.aspx");
            }
            else if (Roles.IsUserInRole(sUsername, "Company"))
            {
                //Response.Redirect("/Anonymous/ResetPassword/ResetPassword.aspx");/*Commented by Netsmartz*/

                Response.Redirect(AppConfig.GetBaseSiteUrl() + "Company/UploadUsersForRegistration.aspx");
            }
        }
        catch (Exception ex)
        {
        }




        /*---------------------VISITLOG---------------------*/
     //   UC_Visitlog_Visitlog1.addEntry(1, 0, 0, 0, "", "", "");



        Response.Redirect(AppConfig.GetBaseSiteUrl() + "login/login_success.aspx");
    }
    private void sendOutConfirmationEmail(string sUsername)
    {
        try
        {
            string strContent = string.Empty;

            BLL.TemplateLib oTemplateLib = new BLL.TemplateLib();
            strContent = oTemplateLib.GetTemplateDetailsByTemplateTemplateName("LoginNotification").TextAreaHTML;

            strContent = strContent.Replace("[LoginTime]", DateTime.Now.ToString());
            strContent = strContent.Replace("[SiteUrl]", AppConfig.GetBaseSiteUrl());
            strContent = strContent.Replace("[SiteName]", AppConfig.GetSiteName());
            strContent = strContent.Replace("[SitePhone]", AppConfig.GetSITEPHONE());

            AppLib.SendMailToUser(sUsername, "Login Notification from Tri Living Well", strContent, AppConfig.GetAdminEmail());
            oTemplateLib = null;
        }
        catch { }

    }
    protected void Login1_LoginError(object sender, EventArgs e)
    {
        TextBox UserName = (TextBox)Login1.FindControl("UserName");
        TextBox Password = (TextBox)Login1.FindControl("Password");

        /*---------------------VISITLOG---------------------*/
        UC_Visitlog_Visitlog1.addEntry(1, 1, 0, 0, UserName.Text, Password.Text, "");
    }


}
