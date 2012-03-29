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
using System.Threading;
public partial class Main_Main_FRAME : System.Web.UI.Page
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    BackofficeClass objBackOfficeClass;

    protected void Page_Load(object sender, EventArgs e)
    {
        //Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("he-IL");
        //Response.Write("Changing Culture to " + Thread.CurrentThread.CurrentCulture.EnglishName + "<br>");



       // pageBody.Attributes["dir"] = "rtl";


        hdSiteUrl.Value = AppConfig.GetBaseSiteUrl();
        //string strScript = "<script type='text/javascript'>function load(sUrl) { document.getElementById(iframeName).src = '" + AppConfig.GetBaseSiteUrl() + "' + sUrl; } </script>";


        //this.Page.RegisterClientScriptBlock("abc", strScript);

        objBackOfficeClass = new BackofficeClass(objSqlConnClass.OpenConnection());
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        fillOutForm();

        objSqlConnClass.CloseConnection();
    }

    private void fillOutForm()
    {
        fillName();


    }

    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        //USed to allow AJAX to Refresh Page
        //Make Sure FillName() is being run in PreRender Statement
        //     if NOT run fillNamefrom Here
    }

    private void fillName()
    {
        lblName.Text = "Guest";
        lblLogout.Text = " ";
        lblEdit.Text = " ";

        if (Membership.GetUser() != null)
        {
            string sUsername = Membership.GetUser().UserName;
            DataSet DS = objBackOfficeClass.Mem_GET_UserInfo(sUsername);
            try
            {

                lblName.Text = DS.Tables[0].Rows[0]["FNAME"].ToString() + " " + DS.Tables[0].Rows[0]["LNAME"].ToString();

                lblEdit.Text = "<a class='small' href=\"javascript:load('edit');\">MY ACCOUNT</a> <span>|</span> ";
                //lblLogout.Text = "<a class='small' href='/login/logout.aspx'>LOGOUT</a>&nbsp;&nbsp;";/*Commented by Netsmartz*/
                lblLogout.Text = "<a class='small' href='" + AppConfig.GetBaseSiteUrl() + "login/logout.aspx'>LOGOUT</a>&nbsp;&nbsp;";

                if (Roles.IsUserInRole("Manager"))
                {
                    /*
                    lblManageUsers.Text = "<a href=\"javascript:load('bo_users');\">MANAGE USERS</a>";
                    lblCreateProject.Text = "<a href=\"javascript:load('bo_addproject');\">CREATE PROJECT</a>";
                    lblVisitlog.Text = "<a href=\"javascript:load('bo_visitlog');\">VISITLOG</a>";

                    if (Roles.IsUserInRole("SiteAdministrator"))
                    {
                        lblSiteManager.Text = "<a href=\"javascript:load('bo_accounts');\">Site Admin</a> <span>|</span> ";
                    }
                    */
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
    /*
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["MODE_CURRENT"] == "EDIT")
        {
            Session["MODE_CURRENT"] = "NORMAL";

        }
        else
        {
            Session["MODE_CURRENT"] = "EDIT";
        }
    }*/
    /*Following functions is added by Netsmartz*/
    protected override void OnInit(EventArgs e)
    {
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Welcome/Styles/Corporate.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound4.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Table.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound5.css\" />"));
        base.OnInit(e);

    }
}
