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
            // Response.Write(Request.ServerVariables["HTTP_HOST"].ToString());
            if (sHost.ToLower().Contains("tri-livingwell.com"))
            {
                Response.Redirect("/comingsoon.html");
            }
            else
            {
                if (Membership.GetUser() == null)//anonymous
                {
                    //Response.Redirect("/Welcome/main_frame.aspx");/*Commented by Netsmartz*/
                    Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/main_frame.aspx", true);
                }
                else//logged in
                {
                    //Response.Redirect("/main/main_frame.aspx");/*CommentedBy Netsmartz*/
                    string sUsername = Membership.GetUser(AppLib.GetLoggedInUserName()).UserName;
                    Response.Redirect(AppConfig.GetBaseSiteUrl() + "main/main_frame.aspx", false);
                    // HttpContext.Current.Response.End();
                    /*if (Roles.IsUserInRole(sUsername, "Company"))
                    {
                        Response.Redirect(AppConfig.GetBaseSiteUrl() + "Company/UploadUsersForRegistration.aspx");
                    }
                    */
                }
            }
        }
        catch (Exception ex)
        { /*Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/main_frame.aspx", true); */
        }

    }

}