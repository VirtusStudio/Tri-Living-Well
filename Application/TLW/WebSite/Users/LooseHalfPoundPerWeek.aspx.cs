using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_LooseHalfPoundPerWeek : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        #region Insert visited log details

        AppLib.InsertVisitedSectionDetails("User View Loose Half Per Week");

        #endregion
    }
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