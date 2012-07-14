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

public partial class MasterPages_Site : System.Web.UI.MasterPage
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    BackofficeClass objBackOfficeClass;

    protected void Page_Load(object sender, EventArgs e)
    {
        hdSiteUrl.Value = AppConfig.GetBaseSiteUrl();
        objBackOfficeClass = new BackofficeClass(objSqlConnClass.OpenConnection());
    }

    protected void Page_PreRender(object sender, EventArgs e)
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
                lblLogout.Text = "<a class='small' href='" + AppConfig.GetBaseSiteUrl() + "login/logout.aspx'>LOGOUT</a>&nbsp;&nbsp;";

                if (Roles.IsUserInRole("Manager"))
                {


                }
            }
            catch (Exception ex)
            {
            }
        }

        objSqlConnClass.CloseConnection();
    }


    /*Following functions is added by Netsmartz*/
    protected override void OnInit(EventArgs e)
    {
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Welcome/Styles/Corporate.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound4.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Table.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound5.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound3.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Main.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Grid.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Website.css\" />"));

        base.OnInit(e);
    }
}
