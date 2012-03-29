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

public partial class Main_UserUtilities_EditUser : System.Web.UI.Page
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    BackofficeClass objBackofficeClass;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("Edit User");

            #endregion
        }
        else
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/Main_Frame.aspx", true);



        objBackofficeClass = new BackofficeClass(objSqlConnClass.OpenConnection());
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        string sUserID_LoggedIn = "";
        if (Membership.GetUser() != null)
        {
            sUserID_LoggedIn = Membership.GetUser().ProviderUserKey.ToString();
        }

        //only fill out original info on load. otherwise, we should be redirecting on success
        if (!IsPostBack)
        {
            if (Request.QueryString["username"] != null)
            {
                string sUsername = Request.QueryString["username"].ToString();
                DataSet DS = objBackofficeClass.Mem_GET_UserInfo(sUsername);
                if (DS.Tables[0].Rows.Count > 0)//we have a user
                {
                    //if (DS.Tables[0].Rows[0]["REGISTRATION_FLG"].ToString() == "0" && DS.Tables[0].Rows[0]["ACCOUNT_FROM"].ToString() == sUserID_LoggedIn)//they have not gone through the org process and they are a 'Main' user
                    if (DS.Tables[0].Rows[0]["REGISTRATION_FLG"].ToString() == "0" && DS.Tables[0].Rows[0]["ACCOUNT_FROM"].ToString() == DS.Tables[0].Rows[0]["USER_ID"].ToString())//they have not gone through the org process and they are a 'Main' user
                    {
                        UC_USER_EditAccount1.populate(DS.Tables[0].Rows[0]["USER_ID"].ToString());
                    }
                    else//they have already gone through the registration process
                    {//they shouldn't be here
                        //Response.Write(DS.Tables[0].Rows[0]["ACCOUNT_FROM"].ToString());
                        //Response.Redirect("/login/logout.aspx"); commented by Netsmartz
                        Response.Redirect(AppConfig.GetBaseSiteUrl() + "login/logout.aspx");
                        //Response.Redirect("google.com");
                    }
                }
                else//that user doesn't exist in the DB
                {
                    if (sUserID_LoggedIn != "")
                        UC_USER_EditAccount1.populate(sUserID_LoggedIn);
                }
            }
            else
            {
                if (sUserID_LoggedIn != "")
                    UC_USER_EditAccount1.populate(sUserID_LoggedIn);
            }
        }

        objSqlConnClass.CloseConnection();
    }
    private void Page_PreInit(object sender, EventArgs e)
    {
        if (!AppLib.IsLoggedinSessionExists())
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/Main_Frame.aspx", true);
        else
        {
            if (Request.QueryString["src"] != null)
            {
                if (Request.QueryString["src"].ToString().Equals("admin"))
                    this.MasterPageFile = "~/MasterPages/BackOffice.master";
            }
            else
            {
                if (AppLib.GetLoggedInUserType().Equals("U"))
                    this.MasterPageFile = "~/MasterPages/User.master";
                else if (AppLib.GetLoggedInUserType().Equals("A"))
                    this.MasterPageFile = "~/MasterPages/BackOffice.master";
                else
                    this.MasterPageFile = "~/MasterPages/Company.master";
            }
        }
    }
}
