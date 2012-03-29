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

public partial class HTML_MealExchange : System.Web.UI.Page
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    PALClass objPalClass;

    protected void Page_Load(object sender, EventArgs e)
    {
        objPalClass = new PALClass(objSqlConnClass.OpenConnection());
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillOutForm();
        }
        objSqlConnClass.CloseConnection();
    }

    private void fillOutForm()
    {
        string sNavigation = "";
        sNavigation = "<a href='javascript:setIframeSection(1)' ><img src='"+AppConfig.GetBaseSiteUrl()+"Images/buttons/button_milk.jpg' /></a><br />";
        sNavigation += "<a href='javascript:setIframeSection(2)' ><img src='" + AppConfig.GetBaseSiteUrl() + "Images/buttons/button_fruit.jpg' /></a><br />";
        sNavigation += "<a href='javascript:setIframeSection(3)' ><img src='" + AppConfig.GetBaseSiteUrl() + "Images/buttons/button_vegetables.jpg' /></a><br />";
        sNavigation += "<a href='javascript:setIframeSection(4)' ><img src='" + AppConfig.GetBaseSiteUrl() + "Images/buttons/button_starch-list.jpg' /></a><br />";
        sNavigation += "<a href='javascript:setIframeSection(5)' ><img src='" + AppConfig.GetBaseSiteUrl() + "Images/buttons/button_proteins.jpg' /></a><br />";
        sNavigation += "<a href='javascript:setIframeSection(6)' ><img src='" + AppConfig.GetBaseSiteUrl() + "Images/buttons/button_fats.jpg' /></a>";
        lblNavigation.Text = sNavigation;
    }


    /*Following function is added by Netsmartz for adding the css path at runtime*/
    protected override void OnInit(EventArgs e)
    {

        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Main.css\" />"));
        base.OnInit(e);

    }

}
