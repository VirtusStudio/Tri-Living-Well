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
        string sActivityLevel = "";

        int iPersonalSummaryId = 0;
	    decimal decWeight = 0.00m;
	    decimal decWaist = 0.00m;
	    decimal decNeck = 0.00m;
	    decimal decHips = 0.00m;
	    decimal decBMI = 0.00m;
	    decimal decBodyFATPercentage = 0.00m;
	    decimal decWaistToHeight = 0.00m;
        decimal decWaistToHip = 0.00m;
	    decimal decLossFrequencyGoal = 0.00m;
	    int iActivityLevel = 0;
        int iCaloricRequirement = 0;
        decimal decLeanBodyMass = 0.00m;
        int iGoalCalories = 0;

        CaloricRequirementsCalculatorClass objCaloricRequirementsCalculatorClass = new CaloricRequirementsCalculatorClass(objSqlConnClass.OpenConnection());
        DataSet MyDataSet = objCaloricRequirementsCalculatorClass.GetCaloricRequirementsCalculator(Membership.GetUser().ProviderUserKey.ToString());
        if ((MyDataSet != null) && (MyDataSet.Tables.Count > 0))
        {
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                iPersonalSummaryId = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["intPersonalSummaryId"])) ? 0 : Convert.ToInt32(MyDataSet.Tables[0].Rows[0]["intPersonalSummaryId"]);
                decWeight = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decWeight"])) ? 0.00m : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decWeight"]);
                decWaist = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decWaist"])) ? 0.00m : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decWaist"]);
                decNeck = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decNeck"])) ? 0.00m : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decNeck"]);
                decHips = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decHips"])) ? 0.00m : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decHips"]);
                decBMI = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decBMI"])) ? 0.00m : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decBMI"]);
                decBodyFATPercentage = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decBodyFATPercentage"])) ? 0.00m : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decBodyFATPercentage"]);
                decWaistToHeight = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decWaistToHeight"])) ? 0.00m : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decWaistToHeight"]);
                decWaistToHip = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decWaistToHip"])) ? 0.00m : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decWaistToHip"]);
                decLossFrequencyGoal = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decLossFrequencyGoal"])) ? 0.00m : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decLossFrequencyGoal"]);
                iActivityLevel = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["intActivityLevel"])) ? 0 : Convert.ToInt32(MyDataSet.Tables[0].Rows[0]["intActivityLevel"]);
            }
        }
        hiddenPersonalSummaryId.Value = iPersonalSummaryId.ToString();
        iCaloricRequirement = objCaloricRequirementsCalculatorClass.GetCurrentCaloricRequirements(Membership.GetUser().ProviderUserKey.ToString());

        // Lean Body Mass = Total Body Weight x (1 - Body Fat %)
        if (decBodyFATPercentage > 0)
        {
            decimal percentageMultiplier = .01m;
            decimal decBodyFATPercentage1 = Decimal.Multiply(decBodyFATPercentage, percentageMultiplier);
            decLeanBodyMass = decWeight * (1 - decBodyFATPercentage1);
            decLeanBodyMass = Decimal.Round(decLeanBodyMass, 2);
        }

        // Weight Goal Calories = Caloric Requirement – (Loss Frequency Goal x 3500)/7
        iGoalCalories = iCaloricRequirement - Convert.ToInt32(((decLossFrequencyGoal * 3500) / 7));

        labelCalories.Text = iCaloricRequirement.ToString();
        labelGoalCalories.Text = iGoalCalories.ToString();
        labelWeight.Text = decWeight.ToString();
        labelLeanBodyMass.Text = decLeanBodyMass.ToString();
        ddlActivityLevel.SelectedIndex = iActivityLevel;

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

        if (decLeanBodyMass == 0)
        {
            btnUpdate.Visible = false;
            labelLBM1.Visible = true;
            hylinkLBM.Visible = true;
            labelLBM2.Visible = true;
        }
        else
        {
            btnUpdate.Visible = true;
            labelLBM1.Visible = false;
            hylinkLBM.Visible = false;
            labelLBM2.Visible = false;
        }

        objSqlConnClass.CloseConnection();

    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {

        string sUserID = Membership.GetUser().ProviderUserKey.ToString();
        int iPersonalSummaryId = Convert.ToInt32(hiddenPersonalSummaryId.Value);
        decimal decLeanBodyMass = Convert.ToDecimal(labelLeanBodyMass.Text.Trim());
        decimal decWeight = Convert.ToDecimal(labelWeight.Text.Trim());

        decimal decLossFrequencyGoal = 0.0m;
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
        
        int iActivityLevel = ddlActivityLevel.SelectedIndex;

        decimal decWaist = Convert.ToDecimal(hiddenWaist.Value);
        decimal decBMI = Convert.ToDecimal(hiddenBMI.Value);
        decimal decBodyFATPercentage = Convert.ToDecimal(hiddenBodyFATPercentage.Value);
        decimal decWaistToHeight = Convert.ToDecimal(hiddenWaistToHeight.Value);
        decimal decWaistToHip = Convert.ToDecimal(hiddenWaistToHip.Value);
        
        CaloricRequirementsCalculatorClass objCaloricRequirementsCalculatorClass = new CaloricRequirementsCalculatorClass(objSqlConnClass.OpenConnection());
        objCaloricRequirementsCalculatorClass.SetCaloricRequirementsCalculator(Membership.GetUser().ProviderUserKey.ToString(), iPersonalSummaryId, decLeanBodyMass, decWeight, decLossFrequencyGoal, iActivityLevel, decWaist, decBMI, decBodyFATPercentage, decWaistToHeight, decWaistToHip);
        objSqlConnClass.CloseConnection();

    }

}
