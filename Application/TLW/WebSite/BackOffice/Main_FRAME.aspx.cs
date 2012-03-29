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

public partial class Main_FRAME : System.Web.UI.Page
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    BackofficeClass objBackOfficeClass;
    DataSet DS = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("Back Office Home page");

            #endregion
        }
        else
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/Main_Frame.aspx", true);


        objBackOfficeClass = new BackofficeClass(objSqlConnClass.OpenConnection());

        //if (Request.QueryString["register"] != null)
        //{
        //    IFRAME_CONTENT.Attributes.Remove("src");
        //    IFRAME_CONTENT.Attributes.Add("src", "UserUtilities/CreateUser.aspx");
        //}
        //if (!IsPostBack)
        //{
        //    fillOutForm();
        //}
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        objSqlConnClass.CloseConnection();
    }

    private void fillOutForm()
    {
       // fillName();

        //RadCalendar1.EnableRowSelectors = false;
        //RadCalendar1.SelectedDates.Add(new RadDate(DateTime.Today));
    }

    protected void btnRefresh_Click(object sender, EventArgs e)
    {
       // fillName();
    }

    //private void fillName()
    //{
    //    lblName.Text = "Guest";
    //    lblLogout.Text = "<a style='text-decoration: underline;color:#FF7300;' href='" + AppConfig.GetBaseSiteUrl() + "login/logout.aspx'>Logout</a>";
    //    if (Membership.GetUser() != null)
    //    {
    //        string sUsername = Membership.GetUser().UserName;
    //        DS = objBackOfficeClass.Mem_GET_UserInfo(sUsername);
    //        lblName.Text = DS.Tables[0].Rows[0]["FNAME"].ToString() + " " + DS.Tables[0].Rows[0]["LNAME"].ToString();

    //        //lblEdit.Text = "<a class='small' href=\"javascript:load('/main/UserUtilities/EditUser.aspx');\">My Account</a> <span style=font-weight:normal;>|</span> ";
    //        lblEdit.Text = "<a style='text-decoration: underline;color:#FF7300;'   href=\"javascript:load('" + AppConfig.GetBaseSiteUrl() + "main/UserUtilities/EditUser.aspx');\">My Account</a> <span style=font-weight:normal;>|</span> ";
    //        /* Above line is commented by Netsmartz*/
    //        //lblLogout.Text = "<a class='small' href='/login/logout.aspx'>Logout</a>"; /*Commented By Netsmartz*/
    //        lblLogout.Text = "<a style='text-decoration: underline;color:#FF7300;' href='" + AppConfig.GetBaseSiteUrl() + "login/logout.aspx'>Logout</a>";
    //    }
    //}

    /*Following function is added by Netsmartz for adding the css path at runtime*/
    protected override void OnInit(EventArgs e)
    {

      //  Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Main.css\" />"));

        base.OnInit(e);
    }


}
