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
using Telerik.Web.UI;

public partial class MasterPages_BackOffice : System.Web.UI.MasterPage
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    BackofficeClass objBackOfficeClass;
    DataSet DS = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        objBackOfficeClass = new BackofficeClass(objSqlConnClass.OpenConnection());
        {
            fillName();
        }

    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        objSqlConnClass.CloseConnection();
    }
    /*Following function is added by Netsmartz for adding the css path at runtime*/
    protected override void OnInit(EventArgs e)
    {
        if (!AppLib.IsLoggedinSessionExists())
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/Main_Frame.aspx", true);





        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Welcome/Styles/Corporate.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound4.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Table.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound5.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound3.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Main.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Grid.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Website.css\" />")); base.OnInit(e);

    }
    private void fillName()
    {
        try
        {
            lblName.Text = "Guest";
            lblLogout.Text = "<a style='text-decoration: underline;color:#FF7300;' href='" + AppConfig.GetBaseSiteUrl() + "login/logout.aspx'>Logout</a>";
            if (Membership.GetUser() != null)
            { //lblEdit.Text = "<a class='small' href=\"javascript:load('/main/UserUtilities/EditUser.aspx');\">My Account</a> <span style=font-weight:normal;>|</span> ";
                lblEdit.Text = "<a style='text-decoration: underline;color:#FF7300;'   href=\"" + AppConfig.GetBaseSiteUrl() + "main/UserUtilities/EditUser.aspx?src=admin\">My Account</a> <span style=font-weight:normal;>|</span> ";
                /* Above line is commented by Netsmartz*/
                //lblLogout.Text = "<a class='small' href='/login/logout.aspx'>Logout</a>"; /*Commented By Netsmartz*/
                lblLogout.Text = "<a style='text-decoration: underline;color:#FF7300;' href='" + AppConfig.GetBaseSiteUrl() + "login/logout.aspx'>Logout</a>";

                string sUsername = Membership.GetUser().UserName;
                DS = objBackOfficeClass.Mem_GET_UserInfo(sUsername);
                if (DS != null)
                    lblName.Text = DS.Tables[0].Rows[0]["FNAME"].ToString() + " " + DS.Tables[0].Rows[0]["LNAME"].ToString();

            }
        }
        catch { }
    }

}
