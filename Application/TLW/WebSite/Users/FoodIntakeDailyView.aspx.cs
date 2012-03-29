using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_FoodIntakeDailyView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindFoodIntake();
        
        //wucFoodIntakeDailyView.BindFoodIntakeRow(
    }
    private void BindFoodIntake()
    {
        BLL.FoodIntakeLib oFoodIntakeLib = new BLL.FoodIntakeLib();
       
        try
        {
            DLFILob.DataSource = oFoodIntakeLib.GetFoodIntakeDetailsByUserId(AppLib.GetLoggedInUserName());
            DLFILob.DataBind();
        }
        catch { }
        finally { oFoodIntakeLib = null; }
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