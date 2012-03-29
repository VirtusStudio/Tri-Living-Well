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

public partial class HowItWorks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("How It Works");

            #endregion
        }
    }
    ///*Following functions is added by Netsmartz*/
    //protected override void OnInit(EventArgs e)
    //{
    //    Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Welcome/Styles/Corporate.css\" />"));
    //    Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound4.css\" />"));
    //    Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Table.css\" />"));
    //    Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound5.css\" />"));
    //    base.OnInit(e);

    //}
    private void Page_PreInit(object sender, EventArgs e)
    {
        if (!AppLib.IsLoggedinSessionExists())
            this.MasterPageFile = "~/MasterPages/TLWSite.master";
        else
        {
            this.MasterPageFile = "~/MasterPages/User.master";
        }
    }
}
