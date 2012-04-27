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

public partial class Users_MealExchange : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            BindCMSText();
            BindCMSText_Fat();
            BindCMSText_Fruit();
            BindCMSText_Pro();
            BindCMSText_Veg();
            BindCMSText_Str();
            BindCMSText_Snack();
        }

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