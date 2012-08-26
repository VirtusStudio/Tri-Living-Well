/*
•	Caloric Requirements Calculator Pop-up pre-populated by original DCR calculation during account set-up
•	Hitting “Update” Updates the User Caloric Requirements in the DB as well as the goal Calories
•	Original Caloric Requirements (Risk Strat) Calculated by:
    o	Male BMR = (9.99 x (Weight/2.2)) + (6.25 x (Height*2.54)) – 4.92 x Age + 5
    o	Female BMR = (9.99 x (Weight/2.2)) + (6.25 x (Height*2.54)) – 4.92 x Age -161
    o	BMR Multiplied by Activity level selected
•	Daily Calorie Calculator takes more information into consideration:
    o	BMR = 370 + (9.79759519 x Lean Body Mass (lbs))
    o	BMR multiplied by Activity level selected.
•	Weight Goal Calories = Caloric Requirement – (Loss Frequency Goal x 3500)/7
•	NOTE: If Lean Body Mass has not been calculated, “Update” button is replaced by prompt: 
    “Please use Body Fat % Calculator to calculate Lean Body Mass prior to updating Caloric requirements”.
    o	Body Fat % Calculator text hyperlinks to Body Fat % Calculator

*/

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

public partial class UC_Nutrition_CalorieCalculator_PopUp : System.Web.UI.UserControl
{
    private SqlConnClass objSqlConnClass = new SqlConnClass();
    

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        fillOutForm();
    }

    private void fillOutForm()
    {
        /*
        •	Caloric Requirements Calculator Pop-up pre-populated by original DCR calculation during account set-up
        •	Hitting “Update” Updates the User Caloric Requirements in the DB as well as the goal Calories
        •	Original Caloric Requirements (Risk Strat) Calculated by:
            o	Male BMR = (9.99 x (Weight/2.2)) + (6.25 x (Height*2.54)) – 4.92 x Age + 5
            o	Female BMR = (9.99 x (Weight/2.2)) + (6.25 x (Height*2.54)) – 4.92 x Age -161
            o	BMR Multiplied by Activity level selected
        •	Daily Calorie Calculator takes more information into consideration:
            o	BMR = 370 + (9.79759519 x Lean Body Mass (lbs))
            o	BMR multiplied by Activity level selected.
        •	Weight Goal Calories = Caloric Requirement – (Loss Frequency Goal x 3500)/7
        •	NOTE: If Lean Body Mass has not been calculated, “Update” button is replaced by prompt: 
            “Please use Body Fat % Calculator to calculate Lean Body Mass prior to updating Caloric requirements”.
            o	Body Fat % Calculator text hyperlinks to Body Fat % Calculator

        */
        string sedentary = "Sedentary - little or no exercise</asp:ListItem";
        string lightly = "Lightly Active - light exercise/sports 1-3 days/week</asp:ListItem";
        string moderately = "Moderately Active - moderate exercise/sports 3-5 days/week</asp:ListItem";
        string very = "Very Active - hard exercise/sports 6-7 days/week</asp:ListItem";
        string extra = "Extra Active - very hard daily exercise/sports & physical job or 2X day training";
        decimal decLossFrequencyGoal = 0.0m;
        string sActivityLevel = "";
        
        CaloricRequirementsCalculatorClass objCaloricRequirementsCalculatorClass = new CaloricRequirementsCalculatorClass(objSqlConnClass.OpenConnection(), Membership.GetUser().ProviderUserKey.ToString());
        labelCalories.Text = objCaloricRequirementsCalculatorClass.getCaloricRequirement().ToString();
        labelGoalCalories.Text = objCaloricRequirementsCalculatorClass.getGoalCalories().ToString();
        labelWeight.Text = objCaloricRequirementsCalculatorClass.getWeight().ToString();
        labelLeanBodyMass.Text = objCaloricRequirementsCalculatorClass.getLeanBodyMass().ToString();
        decLossFrequencyGoal = objCaloricRequirementsCalculatorClass.getLossFrequencyGoal();
        sActivityLevel = objCaloricRequirementsCalculatorClass.getActivityLevel();

        if (decLossFrequencyGoal == 0.5m)
            ddlLossFrequencyGoal.SelectedIndex = 0;
        else if (decLossFrequencyGoal == 1.0m)
            ddlLossFrequencyGoal.SelectedIndex = 1;
        else if (decLossFrequencyGoal == 1.5m)
            ddlLossFrequencyGoal.SelectedIndex = 2;
        else if (decLossFrequencyGoal == 2.0m)
            ddlLossFrequencyGoal.SelectedIndex = 3;
        else if (decLossFrequencyGoal == 2.5m)
            ddlLossFrequencyGoal.SelectedIndex = 4;
        else if (decLossFrequencyGoal == 3.0m)
            ddlLossFrequencyGoal.SelectedIndex = 5;
        else if (decLossFrequencyGoal == 3.5m)
            ddlLossFrequencyGoal.SelectedIndex = 6;
        else if (decLossFrequencyGoal == 4.0m)
            ddlLossFrequencyGoal.SelectedIndex = 7;
        else if (decLossFrequencyGoal == 4.5m)
            ddlLossFrequencyGoal.SelectedIndex = 8;
        else if (decLossFrequencyGoal == 5.0m)
            ddlLossFrequencyGoal.SelectedIndex = 9;
        else
            ddlLossFrequencyGoal.SelectedIndex = 0;
    
        if(string.Compare(sActivityLevel, sedentary, true) == 0)
            ddlActivityLevel.SelectedIndex = 0;
        else if (string.Compare(sActivityLevel, lightly, true) == 0)
            ddlActivityLevel.SelectedIndex = 1;
        else if (string.Compare(sActivityLevel, moderately, true) == 0)
            ddlActivityLevel.SelectedIndex = 2;
        else if (string.Compare(sActivityLevel, very, true) == 0)
            ddlActivityLevel.SelectedIndex = 3;
        else if (string.Compare(sActivityLevel, extra, true) == 0)
            ddlActivityLevel.SelectedIndex = 4;
        else
            ddlActivityLevel.SelectedIndex = 0;

        if (objCaloricRequirementsCalculatorClass.getLeanBodyMass() == 0)
        {
            btnUpdate.Visible = false;

        }

        objSqlConnClass.CloseConnection();

    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {

        CaloricRequirementsCalculatorClass objCaloricRequirementsCalculatorClass = new CaloricRequirementsCalculatorClass(objSqlConnClass.OpenConnection(), Membership.GetUser().ProviderUserKey.ToString());
        string sUserID = Membership.GetUser().ProviderUserKey.ToString();
        string sCalories = labelCalories.Text;
        string sGoalCalories = labelGoalCalories.Text;
        string sWeight = labelWeight.Text;
        string sLeanBodyMass = labelLeanBodyMass.Text;
        decimal decLossFrequencyGoal = 0.0m;
        string sActivityLevel = "";
        string sedentary = "Sedentary - little or no exercise</asp:ListItem";
        string lightly = "Lightly Active - light exercise/sports 1-3 days/week</asp:ListItem";
        string moderately = "Moderately Active - moderate exercise/sports 3-5 days/week</asp:ListItem";
        string very = "Very Active - hard exercise/sports 6-7 days/week</asp:ListItem";
        string extra = "Extra Active - very hard daily exercise/sports & physical job or 2X day training";

        int ddlLossFrequencyGoalIndex = ddlLossFrequencyGoal.SelectedIndex;
        if (ddlLossFrequencyGoal.SelectedIndex == 0)
            decLossFrequencyGoal = 0.5m;      
        else if (ddlLossFrequencyGoal.SelectedIndex == 1)
            decLossFrequencyGoal = 1.0m;
        else if (ddlLossFrequencyGoal.SelectedIndex == 2)
            decLossFrequencyGoal = 1.5m;
        else if (ddlLossFrequencyGoal.SelectedIndex == 3)
            decLossFrequencyGoal = 2.0m;
        else if (ddlLossFrequencyGoal.SelectedIndex == 4)
            decLossFrequencyGoal = 2.5m;
        else if (ddlLossFrequencyGoal.SelectedIndex == 5)
            decLossFrequencyGoal = 3.0m;    
        else if (ddlLossFrequencyGoal.SelectedIndex == 6)
            decLossFrequencyGoal = 3.5m;
        else if (ddlLossFrequencyGoal.SelectedIndex == 7)
            decLossFrequencyGoal = 4.0m; 
        else if (ddlLossFrequencyGoal.SelectedIndex == 8)
            decLossFrequencyGoal = 4.5m;
        else if (ddlLossFrequencyGoal.SelectedIndex == 9)
            decLossFrequencyGoal = 5.0m;
        else
            decLossFrequencyGoal = 0.5m;

        if (ddlActivityLevel.SelectedIndex == 0)
            sActivityLevel = sedentary;
        else if (ddlActivityLevel.SelectedIndex == 1)
            sActivityLevel = lightly;
        else if (ddlActivityLevel.SelectedIndex == 2)
            sActivityLevel = moderately;
        else if (ddlActivityLevel.SelectedIndex == 3)
            sActivityLevel = very;
        else if (ddlActivityLevel.SelectedIndex == 4)
            sActivityLevel = extra;
        else
            sActivityLevel = sedentary;

        objCaloricRequirementsCalculatorClass.SetUserData(Convert.ToDecimal(sLeanBodyMass), Convert.ToInt32(sWeight), decLossFrequencyGoal, sActivityLevel); 

        objSqlConnClass.CloseConnection();

    }

}
