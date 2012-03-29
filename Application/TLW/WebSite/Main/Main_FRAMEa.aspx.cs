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

public partial class Main_Main_FRAME : System.Web.UI.Page
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    BackofficeClass objBackofficeClass;
    ForumClass objForumClass;
    DataSet DS = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        string strScript = "<script type='text/javascript'>function load(sUrl) { document.getElementById(iframeName).src = '" + AppConfig.GetBaseSiteUrl() + "' + sUrl; } </script>";
        this.Page.RegisterClientScriptBlock("abc", strScript);
        objBackofficeClass = new BackofficeClass(objSqlConnClass.OpenConnection());
        objForumClass = new ForumClass(objSqlConnClass.sqlConnection);

        if (Request.QueryString["register"] != null)
        {
            IFRAME_CONTENT.Attributes.Remove("src");
            IFRAME_CONTENT.Attributes.Add("src","UserUtilities/CreateUser.aspx");
        }
        //if (!IsPostBack)
        {
            fillOutForm();
        }
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
        lblLogout.Text = " ";
        lblEdit.Text = " ";
        if (Membership.GetUser() != null)
        {
            string sUsername = Membership.GetUser().UserName;
            DS = objBackofficeClass.Mem_GET_UserInfo(sUsername);
            try
            {
                lblName.Text = DS.Tables[0].Rows[0]["FNAME"].ToString() + " " + DS.Tables[0].Rows[0]["LNAME"].ToString();

                lblEdit.Text = "<a class='small' href=\"javascript:load('UserUtilities/EditUser.aspx');\">My Account</a> <span style=font-weight:normal;>|</span> ";
                lblLogout.Text = "<a class='small' href='/login/logout.aspx'>Log Out</a> ";

                //ajax doessn't like "Roles.IsUserInRole" ???
                //if (Roles.IsUserInRole("Administrator"))
             
                if(DS.Tables[0].Rows[0]["ROLENAME"].ToString() == "Administrator")
                {
                    lblAdminArea.Text = "<a target='_top' class='small' href='/Backoffice/Main_FRAME.aspx'>Admin Area</a>";//  <span style='color:#DAA520'>|</span> ";  
                }
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
        rttUnregisteredAccounts.Text = "";
        lblUnregisteredAccounts.Text = "";
        if (Membership.GetUser() != null)
        {
            string sUserID = Membership.GetUser().ProviderUserKey.ToString();
            DataSet DS = objBackofficeClass.Mem_GET_UserInfo_BY_AccountFrom(sUserID, "0");
            string sUnregisteredAccounts = DS.Tables[0].Rows.Count.ToString();

            if (sUnregisteredAccounts != "0")
            {
                //lblUnregisteredAccounts.Text = "<a class='small' href=\"javascript:load('UserUtilities/ActivateAccount.aspx');\">" + sUnregisteredAccounts + " Account Credit(s) Left</a> <span style=font-weight:normal;>|</span>";
                lblUnregisteredAccounts.Text = "<a class='small' href='javascript:var i;'>" + sUnregisteredAccounts + " Account Credit(s) Left</a> <span style=font-weight:normal;>|</span> ";

                string sItemLayout = "<a class='aButton' style='width:130px;display:block;' href=\"javascript:load('UserUtilities/EditUser.aspx?username=#USERNAME#');\">#FNAME# #LNAME#</a>";
   
                string sMenuItems = "";
                foreach(DataRow DR in DS.Tables[0].Rows)
                {
                    string sNewItem = sItemLayout;
                    sNewItem = sNewItem.Replace("#FNAME#", DR["FNAME"].ToString());
                    sNewItem = sNewItem.Replace("#LNAME#", DR["LNAME"].ToString());
                    sNewItem = sNewItem.Replace("#USERNAME#", DR["USERNAME"].ToString());
                    sMenuItems += sNewItem;
                }

                rttUnregisteredAccounts.Text = "<span class='small'>Select a user to register:</span>";
                rttUnregisteredAccounts.Text += sMenuItems;
            }    
        }
    }

}
