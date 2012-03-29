using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PopUps_PrintWeeklyLogReport : System.Web.UI.Page
{
    string gsPalCalendarEdit = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region Insert visited log details

        AppLib.InsertVisitedSectionDetails("Print Weekly Log Report");

        #endregion

        RadCalendar1.SpecialDays[0].Date = System.DateTime.Now;
    }
    protected void RadCalendar1_DayRender(object sender, Telerik.Web.UI.Calendar.DayRenderEventArgs e)
    {
        BLL.FoodIntakeLib oFoodIntakeLib = new BLL.FoodIntakeLib();

        List<Entity.FoodIntakeInfo> oListFoodIntakeInfo = new List<Entity.FoodIntakeInfo>();
        oListFoodIntakeInfo = oFoodIntakeLib.GetFoodIntakeDetailsByUserId(AppLib.GetLoggedInUserName());
        foreach (var item in oListFoodIntakeInfo)
        {
            if (e.Day.Date == item.DtFoodIntakeDate)
            {
                e.Cell.HorizontalAlign = HorizontalAlign.Left;
                string _strFoodDetails = @"<table style='width:100%;' align='left' border='1'>
<tr class='trAlt'><td style='text-align:left;'>Date:&nbsp;" + item.DtFoodIntakeDate.ToString("MM/dd/yyyy") + @"
</td><td style='text-align:left;'>Calorie:&nbsp;" + item.IntCalorie.ToString() + @"</td></tr>
<tr class='trAlt'><td  style='text-align:left;'>Milk:" + GetSplitedDetailsofActivity(item.StrMilkDetails.ToString()) +
@"</td><td style='text-align:left;'>Fruit:" + GetSplitedDetailsofActivity(item.StrFruitDetails.ToString()) + @"</td></tr>
<tr class='trAlt'><td style='text-align:left;'>Vegetables:" + GetSplitedDetailsofActivity(item.StrVegetablesDetails.ToString()) + @"</td>
<td style='text-align:left;'>Starch:" + GetSplitedDetailsofActivity(item.StrStarchDetails.ToString()) + @"</td></tr>
<tr class='trAlt'><td style='text-align:left;'>Protein:" + GetSplitedDetailsofActivity(item.StrProteinDetails.ToString()) + @"</td>
<td style='text-align:left;'>FAT:" + GetSplitedDetailsofActivity(item.StrFATDetails.ToString()) + @"</td></tr>
<tr class='trAlt'><td colspan='2' style='text-align:left;'>Water:" + GetSplitedDetailsofActivity(item.StrWaterDetails.ToString()) + @"</td></tr>
</table>";
            
                e.Cell.Text = _strFoodDetails;
            }

        }

        oListFoodIntakeInfo = null;
        oFoodIntakeLib = null;
    }

    protected string GetSplitedDetailsofActivity(string _strInputString)
    {
        string _strRetVal = "";
        _strRetVal = "Recommended:" + _strInputString.Split('~')[0].ToString();
        _strRetVal = _strRetVal + ", Recorded:" + _strInputString.Split('~')[1].ToString();
        
        _strRetVal = _strRetVal + ", Daily Total:" + _strInputString.Split('~')[2].ToString();
    

        return _strRetVal;
    }
}