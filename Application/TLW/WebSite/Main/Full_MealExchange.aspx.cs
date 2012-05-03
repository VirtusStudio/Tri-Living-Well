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
            BindCMSText();
            BindCMSText_Fat();
            BindCMSText_Fruit();
            BindCMSText_Pro();
            BindCMSText_Veg();
            BindCMSText_Str();
            BindCMSText_Snack();
        }
        objSqlConnClass.CloseConnection();
    }

    private void fillOutForm()
    {
        string sNavigation = "";
        sNavigation = "<a href='#1' ><img src='"+AppConfig.GetBaseSiteUrl()+"Images/buttons/button_milk.jpg' /></a><br />";
        sNavigation += "<a href=#2' ><img src='" + AppConfig.GetBaseSiteUrl() + "Images/buttons/button_fruit.jpg' /></a><br />";
        sNavigation += "<a href='#3' ><img src='" + AppConfig.GetBaseSiteUrl() + "Images/buttons/button_vegetables.jpg' /></a><br />";
        sNavigation += "<a href='#4' ><img src='" + AppConfig.GetBaseSiteUrl() + "Images/buttons/button_starch-list.jpg' /></a><br />";
        sNavigation += "<a href='#5' ><img src='" + AppConfig.GetBaseSiteUrl() + "Images/buttons/button_proteins.jpg' /></a><br />";
        sNavigation += "<a href='#6' ><img src='" + AppConfig.GetBaseSiteUrl() + "Images/buttons/button_fats.jpg' /></a>";
        lblNavigation.Text = sNavigation;
    }


    /*Following function is added by Netsmartz for adding the css path at runtime*/
    protected override void OnInit(EventArgs e)
    {

        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Main.css\" />"));
        base.OnInit(e);

    }

    private void BindCMSText()
    {
        TextAreaClass objTextAreaClass;
        SqlConnClass objSqlConnClass = new SqlConnClass();
        objTextAreaClass = new TextAreaClass(objSqlConnClass.OpenConnection());
        DataSet DS = objTextAreaClass.TxA_Get_TextAreas("Meal_Milk", "1");
        lblMilk.Text = DS.Tables[0].Rows[0]["TextAreaHTML"].ToString();
        DS = null;
        objTextAreaClass = null;
        objSqlConnClass = null;

    }
    private void BindCMSText_Pro()
    {
        TextAreaClass objTextAreaClass;
        SqlConnClass objSqlConnClass = new SqlConnClass();
        objTextAreaClass = new TextAreaClass(objSqlConnClass.OpenConnection());
        DataSet DS = objTextAreaClass.TxA_Get_TextAreas("Meal_Proteins", "1");
        lblPROTEINS.Text = DS.Tables[0].Rows[0]["TextAreaHTML"].ToString();
        DS = null;
        objTextAreaClass = null;
        objSqlConnClass = null;

    }
    private void BindCMSText_Veg()
    {
        TextAreaClass objTextAreaClass;
        SqlConnClass objSqlConnClass = new SqlConnClass();
        objTextAreaClass = new TextAreaClass(objSqlConnClass.OpenConnection());
        DataSet DS = objTextAreaClass.TxA_Get_TextAreas("Meal_Vegetables", "1");
        lblVegetablee.Text = DS.Tables[0].Rows[0]["TextAreaHTML"].ToString();
        DS = null;
        objTextAreaClass = null;
        objSqlConnClass = null;

    }

    private void BindCMSText_Snack()
    {
        TextAreaClass objTextAreaClass;
        SqlConnClass objSqlConnClass = new SqlConnClass();
        objTextAreaClass = new TextAreaClass(objSqlConnClass.OpenConnection());
        DataSet DS = objTextAreaClass.TxA_Get_TextAreas("Meal_Snacks", "1");
        lblSnacks.Text = DS.Tables[0].Rows[0]["TextAreaHTML"].ToString();
        DS = null;
        objTextAreaClass = null;
        objSqlConnClass = null;

    }
    private void BindCMSText_Str()
    {
        TextAreaClass objTextAreaClass;
        SqlConnClass objSqlConnClass = new SqlConnClass();
        objTextAreaClass = new TextAreaClass(objSqlConnClass.OpenConnection());
        DataSet DS = objTextAreaClass.TxA_Get_TextAreas("Meal_Strchlists", "1");
        lblstarchlists.Text = DS.Tables[0].Rows[0]["TextAreaHTML"].ToString();
        DS = null;
        objTextAreaClass = null;
        objSqlConnClass = null;

    }
    private void BindCMSText_Fat()
    {
        TextAreaClass objTextAreaClass;
        SqlConnClass objSqlConnClass = new SqlConnClass();
        objTextAreaClass = new TextAreaClass(objSqlConnClass.OpenConnection());
        DataSet DS = objTextAreaClass.TxA_Get_TextAreas("Meal_Fat", "1");
        lblFats.Text = DS.Tables[0].Rows[0]["TextAreaHTML"].ToString();
        DS = null;
        objTextAreaClass = null;
        objSqlConnClass = null;

    }
    private void BindCMSText_Fruit()
    {
        TextAreaClass objTextAreaClass;
        SqlConnClass objSqlConnClass = new SqlConnClass();
        objTextAreaClass = new TextAreaClass(objSqlConnClass.OpenConnection());
        DataSet DS = objTextAreaClass.TxA_Get_TextAreas("Meal_Fruit", "1");
        lblFurit.Text = DS.Tables[0].Rows[0]["TextAreaHTML"].ToString();
        DS = null;
        objTextAreaClass = null;
        objSqlConnClass = null;

    }

}
