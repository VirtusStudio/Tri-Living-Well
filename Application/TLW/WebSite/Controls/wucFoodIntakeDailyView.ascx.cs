using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_wucFoodIntakeDailyView : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void BindFoodIntakeRow(Entity.FoodIntakeInfo oFoodIntakeInfo)
    {
        lblDate.Text = oFoodIntakeInfo.DtFoodIntakeDate.ToString("MM/dd/yyyy");
        lblCreatedOn.Text = oFoodIntakeInfo.DtCreatedOn.ToString("MM/dd/yyyy");
        lblCalorie.Text = oFoodIntakeInfo.IntCalorie.ToString();
        lblMilk.Text = GetSplitedDetailsOfActivity(oFoodIntakeInfo.StrMilkDetails);
        lblFruit.Text = GetSplitedDetailsOfActivity(oFoodIntakeInfo.StrFruitDetails);
        lblVegetables.Text = GetSplitedDetailsOfActivity(oFoodIntakeInfo.StrVegetablesDetails);
        lblStarch.Text = GetSplitedDetailsOfActivity(oFoodIntakeInfo.StrStarchDetails);
        lblProtein.Text = GetSplitedDetailsOfActivity(oFoodIntakeInfo.StrProteinDetails);
        lblFAT.Text = GetSplitedDetailsOfActivity(oFoodIntakeInfo.StrFATDetails);
        lblWater.Text = GetSplitedDetailsOfActivity(oFoodIntakeInfo.StrWaterDetails);
    }

    private string GetSplitedDetailsOfActivity(string _strActivity)
    {
        return _strActivity;
    }

}