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

public partial class Anonymous_Registration_Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
    }

    protected void lbSubmit_Click(object sender, EventArgs e)
    {
        string sUsername = Membership.GetUser().UserName;
        Membership.Provider.ChangePassword(sUsername, Membership.GetUser().GetPassword(), txtPassword.Text.Trim());
        Roles.RemoveUserFromRole(sUsername, "Password");
        Roles.AddUserToRole(sUsername, "User");

        Response.Redirect(AppConfig.GetBaseSiteUrl()+ "main/Main_Frame.aspx");
    }
}