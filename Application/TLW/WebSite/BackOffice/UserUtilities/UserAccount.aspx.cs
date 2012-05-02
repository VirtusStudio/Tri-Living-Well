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

public partial class BackOffice_UserUtilities_UserAccount : System.Web.UI.Page
{
    string gsUserName = "";
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

        gsUserName = Request.QueryString["src"].ToString();

    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        //the control will redirect them if success
        if (!IsPostBack)
        {
            MembershipUser currentUsers = Membership.GetUser();
            string us = currentUsers.UserName;
            UC_USER_EditAccount1.populate(Membership.GetUser(us).ProviderUserKey.ToString());
        }
    }


    /*Following function is added by Netsmartz for adding the css path at runtime*/
    protected override void OnInit(EventArgs e)
    {

        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Main.css\" />"));
        base.OnInit(e);

    }
}
