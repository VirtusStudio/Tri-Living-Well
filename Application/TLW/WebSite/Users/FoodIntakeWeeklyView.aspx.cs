using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_FoodIntakeWeeklyView : System.Web.UI.Page
{
    string gsPalCalendarEdit = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        RadCalendar1.SpecialDays[0].Date = System.DateTime.Now;
    }
    protected void RadCalendar1_DayRender(object sender, Telerik.Web.UI.Calendar.DayRenderEventArgs e)
    {
        BLL.FoodIntakeLib oFoodIntakeLib = new BLL.FoodIntakeLib();
        Telerik.Web.UI.Calendar.View.MonthView monthView = (Telerik.Web.UI.Calendar.View.MonthView)RadCalendar1.CalendarView;

        List<Entity.FoodIntakeInfo> oListFoodIntakeInfo = new List<Entity.FoodIntakeInfo>();
        oListFoodIntakeInfo = oFoodIntakeLib.GetFoodIntakeDetailsByUserId(AppLib.GetLoggedInUserName());
        foreach (var item in oListFoodIntakeInfo)
        {
            if (e.Day.Date == item.DtFoodIntakeDate)
            {
                string _strFoodDetails = @"<table class='tblItems' style='width:94%;' align='left' border='1'><tr><td align='right' ><a href = 'javascript:void(0)' onclick = 'HideDetails()'>Close</a></td></tr><tr class='trAlt'><td>Date</td></tr><tr><td style='padding-left: 10px;'>" + item.DtFoodIntakeDate.ToString("MM/dd/yyyy") + @"</td></tr><tr class='trAlt'><td>Calorie</td></tr><tr><td style='padding-left: 10px;'>" + item.IntCalorie.ToString() + @"</td></tr><tr class='trAlt'><td>Milk</td></tr><tr><td style='padding-left: 10px;'>" + GetSplitedDetailsofActivity(item.StrMilkDetails.ToString()) + @"</td></tr><tr class='trAlt'><td>Fruit</td></tr><tr><td style='padding-left: 10px;'>" + GetSplitedDetailsofActivity(item.StrFruitDetails.ToString()) + @"</td></tr><tr class='trAlt'><td>Vegetables</td></tr><tr><td style='padding-left: 10px;'>" + GetSplitedDetailsofActivity(item.StrVegetablesDetails.ToString()) + @"</td></tr><tr class='trAlt'><td>Starch</td></tr><tr><td style='padding-left: 10px;'>" + GetSplitedDetailsofActivity(item.StrStarchDetails.ToString()) + @"</td></tr><tr class='trAlt'><td>Protein</td></tr><tr><td style='padding-left: 10px;'>" + GetSplitedDetailsofActivity(item.StrProteinDetails.ToString()) + @"</td></tr><tr class='trAlt'><td>FAT</td></tr><tr><td style='padding-left: 10px;'>" + GetSplitedDetailsofActivity(item.StrFATDetails.ToString()) + @"</td></tr><tr class='trAlt'><td>Water</td></tr><tr><td style='padding-left: 10px;'>" + GetSplitedDetailsofActivity(item.StrWaterDetails.ToString()) + @"</td></tr><tr class='trAlt'><td>Created On</td></tr><tr><td style='padding-left: 10px;'>" + item.DtFoodIntakeDate.ToString("MM/dd/yyyy") + @"</td></tr></table>";
                //Response.Write(_strFoodDetails);
                Label lbTemp = new Label();
                lbTemp.Text = _strFoodDetails;
                e.Cell.Attributes.Add("onclick", "DisplayDetails(\"" + lbTemp.Text+ "\")");
                //e.Cell.Attributes.Add("onmouseout", "HideDetails()");
                e.Cell.Text = "Date:&nbsp;" + item.DtFoodIntakeDate.ToString("MM/dd/yyyy") + "<br />";
                e.Cell.Text = e.Cell.Text + "Calorie:&nbsp;" + item.IntCalorie.ToString() + "<br />";
               // e.Cell.Text = e.Cell.Text + "Calorie:&nbsp;" + item.StrMilkDetails.ToString() + "<br />";
                lbTemp = null;
            }
        }

        oListFoodIntakeInfo = null;
        oFoodIntakeLib = null;
    }

    protected string GetSplitedDetailsofActivity(string _strInputString)
    {
        string _strRetVal = "<table>";
        _strRetVal = _strRetVal + "<tr><td align='right'>Recommended:</td><td align='left'>" + _strInputString.Split('~')[0].ToString();
        _strRetVal = _strRetVal + "</td></tr>";
        _strRetVal = _strRetVal + "<tr><td align='right'>Recorded:</td><td align='left'>" + _strInputString.Split('~')[1].ToString();
        _strRetVal = _strRetVal + "</td></tr>";
        _strRetVal = _strRetVal + "<tr><td align='right'>Daily Total:</td><td align='left'>" + _strInputString.Split('~')[2].ToString();
        _strRetVal = _strRetVal + "</td></tr>";

        _strRetVal = _strRetVal + "</table>";

        return _strRetVal;
    }
}