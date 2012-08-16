using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class FoodExchange : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {


    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        fillOutForm();
    }

    private void fillOutForm()
    {
        SqlConnClass objSqlConnClass = new SqlConnClass();
        FoodExchangeClass objFoodExchangeClass = new FoodExchangeClass(objSqlConnClass.OpenConnection());

        literalFoodExchange.Text = objFoodExchangeClass.GetFoodExchangeTable();

        objSqlConnClass.CloseConnection();
    }


    /*Following function is added by Netsmartz for adding the css path at runtime*/
    protected override void OnInit(EventArgs e)
    {

        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Main.css\" />"));
        base.OnInit(e);

    }

 

}
