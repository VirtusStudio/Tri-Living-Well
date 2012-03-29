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
using Mediachase.Web.UI.WebControls;
using System.IO;

public partial class Nutrition_Summary : System.Web.UI.Page
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        //objPALClass = new PALClass(objSqlConnClass.OpenConnection());
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        {
            fillOutForm();
        }

        //objSqlConnClass.CloseConnection();
    }
    private void fillOutForm()
    {
   
    }

    /*Following function is added by Netsmartz for adding the css path at runtime*/
    protected override void OnInit(EventArgs e)
    {

        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Main.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound1.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Table.css\" />"));

        base.OnInit(e);

    }

}
