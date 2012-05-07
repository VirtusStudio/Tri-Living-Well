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

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string sHost = Request.ServerVariables["HTTP_HOST"].ToString();
            if (sHost.ToLower().Contains("tri-livingwell.com"))
            {
                Response.Redirect("/comingsoon.html");
            }
            else
            {
                if (Membership.GetUser() == null)//anonymous
                {
                    Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/main_frame.aspx", true);
                }
                else//logged in
                {
                    string sUsername = Membership.GetUser(AppLib.GetLoggedInUserName()).UserName; 
                    SqlConnClass objSqlConnClass = new SqlConnClass();
                    UsersClass objUsersClass = new UsersClass(objSqlConnClass.sqlConnection);
                    string sRole = objUsersClass.GetUserRole(sUsername);
                    if (sRole == "Company")
                    {
                        Response.Redirect(AppConfig.GetBaseSiteUrl() + "Company/UploadUsersForRegistration.aspx");
                    }
                    else if (sRole == "Administrator")
                    {
                        Response.Redirect(AppConfig.GetBaseSiteUrl() + "Company/UploadUsersForRegistration.aspx");
                    }

                    else
                        Response.Redirect(AppConfig.GetBaseSiteUrl() + "main/main_frame.aspx", false);
                }
            }
        }
        catch (Exception ex)
        { /*Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/main_frame.aspx", true); */
        }

    }

}