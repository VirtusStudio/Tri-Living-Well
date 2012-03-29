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

public partial class Controls_wucFoodJournal : System.Web.UI.UserControl
{
    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {

        lblMsg.Text = string.Empty;
        if (this.Page.IsPostBack.Equals(false))
        {
            if (Request.QueryString["msg"] != null)
            {
                if (Request.QueryString["msg"].ToString().Equals("up"))
                {
                    lblMsg.Text = "Record has been updated successfully.";
                }
                else if (Request.QueryString["msg"].ToString().Equals("ins"))
                {
                    lblMsg.Text = "Record has been added successfully.";
                }
            }

            BindNutritionalJournal();
        }
    }


    /// <summary>
    /// following event is used to calculate the additional minute.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Entity.FoodIntakeInfo oFoodIntakeInfo = new Entity.FoodIntakeInfo();

        BLL.FoodIntakeLib oFoodIntakeLib = new BLL.FoodIntakeLib();
        try
        {
            oFoodIntakeInfo.StrUserId = AppLib.GetLoggedInUserName();
            oFoodIntakeInfo.DtFoodIntakeDate = Convert.ToDateTime(txtDate.Text);
            oFoodIntakeInfo.IntCalorie = Convert.ToInt32(txtCurrentCalorie.Text);
            oFoodIntakeInfo.StrMilkDetails = lblMilk.Text + "~" + GetTxtBoxValue(txtMilkRecord) + "~" + GetTxtBoxValue(txtMilkDailyTotal);
            oFoodIntakeInfo.StrFruitDetails = lblFruit.Text + "~" + GetTxtBoxValue(txtFruitRecord) + "~" + GetTxtBoxValue(txtFruitDailyTotal);
            oFoodIntakeInfo.StrVegetablesDetails = lblVegetables.Text + "~" + GetTxtBoxValue(txtVegetablesRecord) + "~" + GetTxtBoxValue(txtVegetablesDailyTotal);
            oFoodIntakeInfo.StrStarchDetails = lblStarch.Text + "~" + GetTxtBoxValue(txtStarchRecord) + "~" + GetTxtBoxValue(txtStarchDailyTotal);
            oFoodIntakeInfo.StrProteinDetails = lblProtein.Text + "~" + GetTxtBoxValue(txtProteinRecord) + "~" + GetTxtBoxValue(txtProteinDailyTotal);
            oFoodIntakeInfo.StrFATDetails = lblFat.Text + "~" + GetTxtBoxValue(txtFatRecord) + "~" + GetTxtBoxValue(txtFatDailyTotal);
            oFoodIntakeInfo.StrWaterDetails = lblWater.Text + "~" + GetTxtBoxValue(txtWaterRecord) + "~" + GetTxtBoxValue(txtWaterDailyTotal);
            if (oFoodIntakeLib.InsertFoodIntakeDetails(oFoodIntakeInfo).Equals(0))
            {
                oFoodIntakeLib = null;
                oFoodIntakeInfo = null;
                Response.Redirect(AppConfig.GetBaseSiteUrl() + "Users/FoodJournal.aspx?msg=ins", true);
            }
        }
        catch { }
        finally
        {
            oFoodIntakeLib = null;
            oFoodIntakeInfo = null;
        }
    }

    #endregion

    #region User Defined Functions

    /// <summary>
    /// following function is used to bind the nutritional journal details
    /// </summary>
    private void BindNutritionalJournal()
    {
        BLL.UserLib oUserLib = new BLL.UserLib();
        Entity.UserInfo oUserInfo = new Entity.UserInfo();
        SqlConnClass objSqlConnClass = new SqlConnClass();
        DDClass objDDClass = new DDClass(objSqlConnClass.OpenConnection());
        DataSet DS = objDDClass.get_User_Calorie(Membership.GetUser().ProviderUserKey.ToString());
        try
        {
            if (DS.Tables[0].Rows.Count > 0)
                txtCurrentCalorie.Text = DS.Tables[0].Rows[0]["CALORIE_NUMBER"].ToString();



            oUserInfo = oUserLib.GetFoodExchangeChartByCalories(Convert.ToInt32(DS.Tables[0].Rows[0]["CALORIE_NUMBER"]));
            if (oUserInfo != null)
            {
                lblMilk.Text = oUserInfo.IntMilk.ToString();
                lblFruit.Text = oUserInfo.IntFruit.ToString();
                lblVegetables.Text = oUserInfo.IntVegetable.ToString();
                lblStarch.Text = oUserInfo.IntStarch.ToString();
                lblProtein.Text = oUserInfo.IntProtein.ToString();
                lblFat.Text = oUserInfo.IntFat.ToString();
                lblWater.Text = oUserInfo.IntWater.ToString();
            }
        }
        catch
        { }
        finally
        {
            objSqlConnClass.CloseConnection();
            objSqlConnClass = null;
            objDDClass = null;
            DS = null;
            oUserLib = null;
            oUserInfo = null;
        }
    }

    private int GetTxtBoxValue(TextBox _txtBox)
    {
        if (_txtBox.Text.Equals(string.Empty))
            return 0;
        else
            return Convert.ToInt32(_txtBox.Text);
    }


    #endregion

}