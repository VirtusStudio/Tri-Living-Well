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

public partial class MasterPages_User : System.Web.UI.MasterPage
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    BackofficeClass objBackofficeClass;
    ForumClass objForumClass;
    DataSet DS = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!AppLib.IsLoggedinSessionExists())
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/Main_Frame.aspx", true);
        MembershipUser currentUser = Membership.GetUser();
        Roles.GetRolesForUser(HttpContext.Current.User.Identity.Name);
        //string strScript = "<script type='text/javascript'>function load(sUrl) { document.getElementById(iframeName).src = '" + AppConfig.GetBaseSiteUrl() + "' + sUrl; } </script>";
        //this.Page.RegisterClientScriptBlock("abc", strScript);
        objBackofficeClass = new BackofficeClass(objSqlConnClass.OpenConnection());
        objForumClass = new ForumClass(objSqlConnClass.sqlConnection);


        BackofficeClass objBackOfficeClass;
        objBackOfficeClass = new BackofficeClass(objSqlConnClass.OpenConnection());
        DataSet DS = objBackOfficeClass.Mem_GET_Admin(currentUser.UserName);
        if (DS != null)
        {
            if (DS.Tables[0].Rows.Count > 0)
            {
                if (DS.Tables[0].Rows[0]["ROLENAME"].ToString().Equals("Administrator"))
                {
                    if (Session["popup"] != null)
                    {
                        bool pop = (bool)Session["popup"];

                        if (pop)
                        {
                            BLL.CompanyManager oCompanyManager = new BLL.CompanyManager();
                            int no = oCompanyManager.GetQuestion();
                            // string Script = "jConfirm('You have " + no + " unanswered HealthCoach Message !  Click Ok to answer them', 'HealthCoach Message',function(r) {alert(r);});";

                            if (no != 0)
                            {

                                string Script = "jConfirm('You have " + no + " unanswered HealthCoach Message !  Click Ok to see them', 'HealthCoach Message',function(r) { if(r) {window.location.href = '../Backoffice/UserUtilities/ManageQuestionforHealthCoach.aspx';}});";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseWindow", Script, true);
                                Session["popup"] = false;
                            }
                        }
                        else
                        {
                            Session.Remove(Session["popup"].ToString());
                        }
                    }
                    else
                    {

                    }
                }

                else
                {
                    if (Session["popup"] != null)
                    {
                        bool pop = (bool)Session["popup"];

                        if (pop)
                        {
                            BLL.CompanyManager oCompanyManagers = new BLL.CompanyManager();
                            int no = oCompanyManagers.GetAnswers(currentUser.UserName);
                            if (no != 0)
                            {
                                string Script = "jConfirm('You have " + no + " answered HealthCoach Message !  Click Ok to see them', 'HealthCoach Message',function(r) { if(r) {window.location.href = '../Users/MyAskedQuestions.aspx';}});";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseWindow", Script, true);
                                Session["popup"] = false;
                            }
                        }
                        else
                        {
                            Session.Remove(Session["popup"].ToString());
                        }
                    }
                    else
                    {

                    }
                }
            }
        }

        //if (Request.QueryString["register"] != null)
        //{
        //    IFRAME_CONTENT.Attributes.Remove("src");
        //    IFRAME_CONTENT.Attributes.Add("src", "UserUtilities/CreateUser.aspx");
        //}


        //if (!IsPostBack)
        {
            fillOutForm();
        }



        //if (HttpContext.Current.User.IsInRole("Administrator"))
        //{

        //    if (Session["popup"] != null)
        //    {
        //        bool pop = (bool)Session["popup"];

        //        if (pop)
        //        {
        //            BLL.CompanyManager oCompanyManager = new BLL.CompanyManager();
        //            int no = oCompanyManager.GetQuestion();
        //            string Script = "jConfirm('You have " + no + " unanswered HealthCoach Message !  Click Ok to answer them', 'HealthCoach Message',function(r) { if(r) {window.location.href = '../Backoffice/UserUtilities/ManageQuestionforHealthCoach.aspx';}});";
        //            ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseWindow", Script, true);
        //            Session["popup"] = false;
        //        }
        //        else
        //        {
        //            Session.Remove(Session["popup"].ToString());
        //        }
        //    }
        //    else
        //    {

        //    }
        //}
        //else
        //{

        //}



    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        objSqlConnClass.CloseConnection();

        if (Membership.GetUser() != null)
        {
            txtLoggedIn.Text = "1";
        }
        else
        {
            txtLoggedIn.Text = "0";
        }
    }

    private void fillOutForm()
    {
        fillName();
        fillPersonalMessages();
        fillUnregisteredAccounts();
    }

    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        fillOutForm();
    }

    private void fillName()
    {
        lblName.Text = "Guest";
        BLL.CompanyManager oCompanyManager;
        Entity.CompanyInfo oCompanyInfo;
        string sUsername = AppLib.GetLoggedInUserName();
        oCompanyManager = new BLL.CompanyManager();
        oCompanyInfo = new Entity.CompanyInfo();
        oCompanyInfo = oCompanyManager.CheckEmailIDExistsInCompany(sUsername);
        if (oCompanyInfo != null)
        {
            lblName.Text = oCompanyInfo.StrCompanyName;
            // rmMenu.Items[7].Items[2].Visible = false;
            //  IFRAME_CONTENT.Attributes.Remove("src");
            // IFRAME_CONTENT.Attributes.Add("src", AppConfig.GetBaseSiteUrl() + "Company/UploadUsersForRegistration.aspx");
            //rmMenu.Items[7].Items[1].Visible = true;
            //rmMenu.Items[7].Items[0].Visible = true;
        }
        else
        {
            //rmMenu.Items[7].Items[2].Visible = true;



            // rmMenu.Items[7].Items[1].Visible = false;
            //rmMenu.Items[7].Items[0].Visible = false;
            //rmMenu.Items[7].Visible = false;
        }


        oCompanyInfo = null;
        oCompanyManager = null;


        lblLogout.Text = " ";
        lblLogout.Text = "<a class='small' href='" + AppConfig.GetBaseSiteUrl() + "login/logout.aspx'>Log Out</a> ";
        //lblEdit.Text = " ";
        if (Membership.GetUser() != null)
        {
            //string sUsername = Membership.GetUser().UserName;
            DS = objBackofficeClass.Mem_GET_UserInfo(sUsername);
            try
            {
                // lblEdit.Text = "<a class='small' href=\"javascript:load('" + AppConfig.GetBaseSiteUrl() + "Main/UserUtilities/EditUser.aspx');\">My Account</a> <span style=font-weight:normal;>|</span> ";
                lblLogout.Text = "<a class='small' href='/login/logout.aspx'>Log Out</a> ";/*Commented by Netsmartz*/
                lblLogout.Text = "<a class='small' href='" + AppConfig.GetBaseSiteUrl() + "login/logout.aspx'>Log Out</a> ";

                if (AppLib.GetLoggedInUserType().ToLower().ToString().Equals("a"))
                {
                   // lblAdminArea.Text = "<a target='_top' class='small' href='" + AppConfig.GetBaseSiteUrl() + "Backoffice/Main_FRAME.aspx'>Admin Area</a>";//  <span style='color:#DAA520'>|</span> ";  
                }
                if (AppLib.GetCurrentUserType().ToLower().ToString().Equals("c"))
                {
                    //lblEdit.Text = "<a class='small' href=\"javascript:load('" + AppConfig.GetBaseSiteUrl() + "Company/EditCompanyDetails.aspx?id=" + AppLib.GetLoggedInUserId() + "');\">My Account</a> <span style=font-weight:normal;>|</span> ";
                }

                lblName.Text = DS.Tables[0].Rows[0]["FNAME"].ToString() + " " + DS.Tables[0].Rows[0]["LNAME"].ToString();
            }
            catch (Exception ex)
            {
            }
        }
    }

    private void fillPersonalMessages()
    {
        //now this is handeled in the Refresher.aspx page calling top.lblPrivateMessages
        /*
        lblPrivateMessages.Text = "";

        int iMessageCount = 0;
        try
        {
            DataSet DS = objForumClass.Fum_GET_ForumPersonalMessages_BY_UserId(Membership.GetUser().ProviderUserKey.ToString(), "1");
            if (DS.Tables[0].Rows.Count > 0)
            {
                lblPrivateMessages.Text = "&nbsp;&nbsp;<a class='small' href=\"javascript:load('/FORUM/privateinbox.aspx');\">" + DS.Tables[0].Rows.Count.ToString() + " New Message(s)</a> <span style=font-weight:normal;>|</span> ";
            }
        }
        catch (Exception ex)
        {
        }
         */
    }

    private void fillUnregisteredAccounts()
    {
        //rttUnregisteredAccounts.Text = "";
        // lblUnregisteredAccounts.Text = "";
        if (Membership.GetUser() != null)
        {
            string sUserID = Membership.GetUser().ProviderUserKey.ToString();
            DataSet DS = objBackofficeClass.Mem_GET_UserInfo_BY_AccountFrom(sUserID, "0");
            string sUnregisteredAccounts = DS.Tables[0].Rows.Count.ToString();

            if (sUnregisteredAccounts != "0")
            {
                //lblUnregisteredAccounts.Text = "<a class='small' href=\"javascript:load('UserUtilities/ActivateAccount.aspx');\">" + sUnregisteredAccounts + " Account Credit(s) Left</a> <span style=font-weight:normal;>|</span>";
                // lblUnregisteredAccounts.Text = "<a class='small' href='javascript:var i;'>" + sUnregisteredAccounts + " Account Credit(s) Left</a> <span style=font-weight:normal;>|</span> ";

                string sItemLayout = "<a class='aButton' style='width:130px;display:block;' href=\"javascript:load('Main/UserUtilities/EditUser.aspx?username=#USERNAME#');\">#FNAME# #LNAME#</a>";

                string sMenuItems = "";
                foreach (DataRow DR in DS.Tables[0].Rows)
                {
                    string sNewItem = sItemLayout;
                    sNewItem = sNewItem.Replace("#FNAME#", DR["FNAME"].ToString());
                    sNewItem = sNewItem.Replace("#LNAME#", DR["LNAME"].ToString());
                    sNewItem = sNewItem.Replace("#USERNAME#", DR["USERNAME"].ToString());
                    sMenuItems += sNewItem;
                }

                // rttUnregisteredAccounts.Text = "<span class='small'>Select a user to register:</span>";
                // rttUnregisteredAccounts.Text += sMenuItems;
            }
        }
    }

    private void RegisterPopupWinScript()
    {

    }
    /*Following functions is added by Netsmartz*/
    protected override void OnInit(EventArgs e)
    {
        if (!AppLib.IsLoggedinSessionExists())
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/Main_Frame.aspx", true);



        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Welcome/Styles/Corporate.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound1.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound1.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound3.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound4.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound5.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Table.css\" />"));


        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Main.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Grid.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Website.css\" />"));
        base.OnInit(e);
    }
}
