/*

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

public partial class UC_Nutrition_HealthyWeightCalculator_PopUp : System.Web.UI.UserControl
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
        int iPersonalSummaryId = 0;
        decimal decWeight = 0.0m;
        decimal decBodyFATPercentage = 0.0m;
        decimal decLeanBodyMass = 0.0m;
        decimal decLossFrequencyGoal = 0.0m;
        
        decimal decBodyFatWeight = 0.0m;
        int iBodyFatGoalEssential = 0;
        int iBodyFatGoalAtheletes = 0;
        int iBodyFatGoalFitness = 0;
        int iBodyFatGoalAverage = 0;
        int iBodyFatGoalObese = 0;
        decimal decDesiredBodyFatPercentage = 0.0m;
        int iWeightLossGoal1 = 0;
        int iHealthyWeightRange = 0;
        int iDesiredWeight = 0;
        int iWeightLossGoal2 = 0;
        DateTime dtTargetDate = DateTime.MinValue;

        string sDateSelected = DateTime.Now.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.GetCultureInfo("en-US"));
        HealthyWeightCalculatorClass objHealthyWeightCalculatorClass = new HealthyWeightCalculatorClass(objSqlConnClass.OpenConnection());
        DataSet dsPersonalSummary = objHealthyWeightCalculatorClass.GetHealthyWeightCalculatorPersonalSummary(Membership.GetUser().ProviderUserKey.ToString(), sDateSelected);

        if ((dsPersonalSummary != null) && (dsPersonalSummary.Tables.Count > 0))
        {
            if (dsPersonalSummary.Tables[0].Rows.Count > 0)
            {
                iPersonalSummaryId = (Convert.IsDBNull(dsPersonalSummary.Tables[0].Rows[0]["intPersonalSummaryId"])) ? 0 : Convert.ToInt32(dsPersonalSummary.Tables[0].Rows[0]["intPersonalSummaryId"]);
                decWeight = (Convert.IsDBNull(dsPersonalSummary.Tables[0].Rows[0]["decWeight"])) ? 0.00m : Convert.ToDecimal(dsPersonalSummary.Tables[0].Rows[0]["decWeight"]);
                decBodyFATPercentage = (Convert.IsDBNull(dsPersonalSummary.Tables[0].Rows[0]["decBodyFATPercentage"])) ? 0.00m : Convert.ToDecimal(dsPersonalSummary.Tables[0].Rows[0]["decBodyFATPercentage"]);
                decLossFrequencyGoal = (Convert.IsDBNull(dsPersonalSummary.Tables[0].Rows[0]["decLossFrequencyGoal"])) ? 0.00m : Convert.ToDecimal(dsPersonalSummary.Tables[0].Rows[0]["decLossFrequencyGoal"]);
            }
        }
        int iHeight = 0;
        int iAge = 0;
        string sGender = "";
        int iGender = 0;
        DateTime dtBirthday = DateTime.MinValue;

        DataSet dsUserInfo = objHealthyWeightCalculatorClass.GetHealthyWeightCalculatorUserInfo(Membership.GetUser().ProviderUserKey.ToString());
        if ((dsUserInfo != null) && (dsUserInfo.Tables.Count > 0)) 
        {
            if (dsUserInfo.Tables[0].Rows.Count > 0)
            {
                iHeight = (Convert.IsDBNull(dsUserInfo.Tables[0].Rows[0]["HEIGHT"])) ? 0 : Convert.ToInt32(dsUserInfo.Tables[0].Rows[0]["HEIGHT"]);
                iGender = (Convert.IsDBNull(dsUserInfo.Tables[0].Rows[0]["GENDER_ID"])) ? 0 : Convert.ToInt32(dsUserInfo.Tables[0].Rows[0]["GENDER_ID"]);
                dtBirthday = (Convert.IsDBNull(dsUserInfo.Tables[0].Rows[0]["DATE_BIRTH"])) ? DateTime.MinValue : Convert.ToDateTime(dsUserInfo.Tables[0].Rows[0]["DATE_BIRTH"]);
            }
        }

        iAge = DateTime.Now.Year - dtBirthday.Year;
        if (iGender == 1)
            sGender = "m";
        else if (iGender == 2)
            sGender = "f";

	    int iAgeMin = 0;
	    int iAgeMax = 0;
	    decimal decUnderMin = 0.0m;
	    decimal decUnderMax = 0.0m;
	    decimal decExcelMin = 0.0m;
	    decimal decExcelMax = 0.0m;
	    decimal decGoodMin = 0.0m;
	    decimal decGoodMax = 0.0m;
	    decimal decModMin = 0.0m;
	    decimal decModMax = 0.0m;
	    decimal decOverMin = 0.0m;
	    decimal decOverMax = 0.0m;
	    decimal decSignificantlyMin = 0.0m;
	    decimal decSignificantlyMax = 0.0m;

        /*
            Atheletes [ExcelMin],[ExcelMax]
            Fitnes [GoodMin],[GoodMax]
            Average [ModMin],[ModMax]
            Obese > [OverMin]
         */
        DataSet dsBodyFatRanges = objHealthyWeightCalculatorClass.GetBodyFatRanges(sGender, iAge);
        if ((dsBodyFatRanges != null) && (dsBodyFatRanges.Tables.Count > 0))
        {
            if (dsBodyFatRanges.Tables[0].Rows.Count > 0)
            {
                iAgeMin = (Convert.IsDBNull(dsBodyFatRanges.Tables[0].Rows[0]["AgeMin"])) ? 0 : Convert.ToInt32(dsBodyFatRanges.Tables[0].Rows[0]["AgeMin"]);
                iAgeMax = (Convert.IsDBNull(dsBodyFatRanges.Tables[0].Rows[0]["AgeMax"])) ? 0 : Convert.ToInt32(dsBodyFatRanges.Tables[0].Rows[0]["AgeMax"]);
                decUnderMin = (Convert.IsDBNull(dsBodyFatRanges.Tables[0].Rows[0]["UnderMin"])) ? 0.00m : Convert.ToDecimal(dsBodyFatRanges.Tables[0].Rows[0]["UnderMin"]);
                decUnderMax = (Convert.IsDBNull(dsBodyFatRanges.Tables[0].Rows[0]["UnderMax"])) ? 0.00m : Convert.ToDecimal(dsBodyFatRanges.Tables[0].Rows[0]["UnderMax"]);
                decExcelMin = (Convert.IsDBNull(dsBodyFatRanges.Tables[0].Rows[0]["ExcelMin"])) ? 0.00m : Convert.ToDecimal(dsBodyFatRanges.Tables[0].Rows[0]["ExcelMin"]);
                decExcelMax = (Convert.IsDBNull(dsBodyFatRanges.Tables[0].Rows[0]["ExcelMax"])) ? 0.00m : Convert.ToDecimal(dsBodyFatRanges.Tables[0].Rows[0]["ExcelMax"]);
                decGoodMin = (Convert.IsDBNull(dsBodyFatRanges.Tables[0].Rows[0]["GoodMin"])) ? 0.00m : Convert.ToDecimal(dsBodyFatRanges.Tables[0].Rows[0]["GoodMin"]);
                decGoodMax = (Convert.IsDBNull(dsBodyFatRanges.Tables[0].Rows[0]["GoodMax"])) ? 0.00m : Convert.ToDecimal(dsBodyFatRanges.Tables[0].Rows[0]["GoodMax"]);
                decModMin = (Convert.IsDBNull(dsBodyFatRanges.Tables[0].Rows[0]["ModMin"])) ? 0.00m : Convert.ToDecimal(dsBodyFatRanges.Tables[0].Rows[0]["ModMin"]);
                decModMax = (Convert.IsDBNull(dsBodyFatRanges.Tables[0].Rows[0]["ModMax"])) ? 0.00m : Convert.ToDecimal(dsBodyFatRanges.Tables[0].Rows[0]["ModMax"]);
                decOverMin = (Convert.IsDBNull(dsBodyFatRanges.Tables[0].Rows[0]["OverMin"])) ? 0.00m : Convert.ToDecimal(dsBodyFatRanges.Tables[0].Rows[0]["OverMin"]);
                decOverMax = (Convert.IsDBNull(dsBodyFatRanges.Tables[0].Rows[0]["OverMax"])) ? 0.00m : Convert.ToDecimal(dsBodyFatRanges.Tables[0].Rows[0]["OverMax"]);
                decSignificantlyMin = (Convert.IsDBNull(dsBodyFatRanges.Tables[0].Rows[0]["SignificantlyMin"])) ? 0.00m : Convert.ToDecimal(dsBodyFatRanges.Tables[0].Rows[0]["SignificantlyMin"]);
                decSignificantlyMax = (Convert.IsDBNull(dsBodyFatRanges.Tables[0].Rows[0]["SignificantlyMax"])) ? 0.00m : Convert.ToDecimal(dsBodyFatRanges.Tables[0].Rows[0]["SignificantlyMax"]);
            }
        }

        int iAtheletesMin = Convert.ToInt32(decExcelMin);
        int iAtheletesMax = Convert.ToInt32(decExcelMax);
        int iFitnessMin = Convert.ToInt32(decGoodMin);
        int iFitnessMax = Convert.ToInt32(decGoodMax);
        int iAverageMin = Convert.ToInt32(decModMin);
        int iAverageMax = Convert.ToInt32(decModMax);
        int iObese = Convert.ToInt32(decOverMin);
        string sAtheletes = iAtheletesMin.ToString() + " - " + iAtheletesMax.ToString() + "%";
        string sFitness = iFitnessMin.ToString() + " - " + iFitnessMax.ToString() + "%";
        string sAverage = iAverageMin.ToString() + " - " + iAtheletesMin.ToString() + "%";
        string sObese = ">" + iObese.ToString() + "%";

        decimal decHealthyMinWeight = 0.0m;
        decimal decHealthyMaxWeight = 0.0m;
        DataSet dsHealthyWeightRanges = objHealthyWeightCalculatorClass.GetHealthyWeightRanges(iHeight);
        if ((dsHealthyWeightRanges != null) && (dsHealthyWeightRanges.Tables.Count > 0))
        {
            if (dsHealthyWeightRanges.Tables[0].Rows.Count > 0)
            {
                decHealthyMinWeight = (Convert.IsDBNull(dsHealthyWeightRanges.Tables[0].Rows[0]["Min"])) ? 0.00m : Convert.ToDecimal(dsHealthyWeightRanges.Tables[0].Rows[0]["Min"]);
                decHealthyMinWeight = (Convert.IsDBNull(dsHealthyWeightRanges.Tables[0].Rows[0]["Max"])) ? 0.00m : Convert.ToDecimal(dsHealthyWeightRanges.Tables[0].Rows[0]["Max"]);
            }
        }

        string sHealthyWeightRange = Convert.ToInt32(decHealthyMinWeight).ToString() + " to " + Convert.ToInt32(decHealthyMaxWeight).ToString() + " lbs";

        decimal temp = 1.0m;
        decLeanBodyMass = decWeight * decimal.Subtract(temp, decBodyFATPercentage);
        decBodyFatWeight = decWeight * decBodyFATPercentage;


        hiddenPersonalSummaryId.Value = iPersonalSummaryId.ToString();


        textCurrentWeight.Text = decWeight.ToString();
        textCurrentBodyFat.Text = decBodyFATPercentage.ToString(); 
        labelLeanBodyMass.Text = decLeanBodyMass.ToString(); 
        labelBodyFatWeight.Text = decBodyFatWeight.ToString(); 
        labelEssential.Text = "3%";
        labelAtheletes.Text = sAtheletes;
        labelFitness.Text = sFitness;
        labelAverage.Text = sAverage;  
        labelObese.Text = sObese; 

        if (decLossFrequencyGoal == 0.5m)
        {
            ddlLossFrequency1.SelectedIndex = 0;
            ddlLossFrequency2.SelectedIndex = 0;
        }
        else if (decLossFrequencyGoal == 1.0m)
        {
            ddlLossFrequency1.SelectedIndex = 1;
            ddlLossFrequency2.SelectedIndex = 1;
        }
        else if (decLossFrequencyGoal == 1.5m)
        {
            ddlLossFrequency1.SelectedIndex = 2;
            ddlLossFrequency2.SelectedIndex = 2;
        }
        else if (decLossFrequencyGoal == 2.0m)
        {
            ddlLossFrequency1.SelectedIndex = 3;
            ddlLossFrequency2.SelectedIndex = 3;
        }
        else if (decLossFrequencyGoal == 2.5m)
        {
            ddlLossFrequency1.SelectedIndex = 4;
            ddlLossFrequency2.SelectedIndex = 4;
        }
        else if (decLossFrequencyGoal == 3.0m)
        {
            ddlLossFrequency1.SelectedIndex = 5;
            ddlLossFrequency2.SelectedIndex = 5;
        }
        else if (decLossFrequencyGoal == 3.5m)
        {
            ddlLossFrequency1.SelectedIndex = 6;
            ddlLossFrequency2.SelectedIndex = 6;
        }
        else if (decLossFrequencyGoal == 4.0m)
        {
            ddlLossFrequency1.SelectedIndex = 7;
            ddlLossFrequency2.SelectedIndex = 7;
        }
        else if (decLossFrequencyGoal == 4.5m)
        {
            ddlLossFrequency1.SelectedIndex = 8;
            ddlLossFrequency2.SelectedIndex = 8;
        }
        else if (decLossFrequencyGoal == 5.0m)
        {
            ddlLossFrequency1.SelectedIndex = 9;
            ddlLossFrequency2.SelectedIndex = 9;
        }
        else
        {
            ddlLossFrequency1.SelectedIndex = 0;
            ddlLossFrequency2.SelectedIndex = 0;
        }

        textDesiredBodyFatPercentage.Text = "";
        labelWeightLossGoal1.Text = "";
        labelWeightLossGoal2.Text = "";
        labelDesiredWeight.Text = "";
        textDesiredBodyFatPercentage.Text = "";
        labelTargetDate.Text = "";
        


        // calculated automatically when numbrer is entered via script
        //decimal decWeightLossGoal1 = (decWeight - decLeanBodyMass) / (1 - decDesiredBodyFatPercentage);
        //decimal decDesiredBodyFatPercentage = 0.0m;
        //textDesiredBodyFatPercentage.Text = "";
        //labelWeightLossGoal1.Text = "";
        //labelWeightLossGoal2.Text = "";
        //labelDesiredWeight.Text = "";
        //textDesiredBodyFatPercentage.Text = "";

        // calculated when user presses update
        //DateTime dtTargetDate = DateTime.Now() + (decWeightLossGoal1/decLossFrequencyGoal1);
        
        



    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {


    }

    protected void btnCalculate_Click(object sender, EventArgs e)
    {


    }

}
