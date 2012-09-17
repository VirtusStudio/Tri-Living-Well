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

public partial class UC_Nutrition_Scorecard_PopUp : System.Web.UI.UserControl
{
    private SqlConnClass objSqlConnClass = new SqlConnClass();
    

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        fillOutForm();
    }

    private void fillOutForm(string sDateSelected = "")
    {
        ScorecardClass objScorecardClass = new ScorecardClass(objSqlConnClass.OpenConnection(), Membership.GetUser().ProviderUserKey.ToString(), sDateSelected);

        hiddenUserId.Value = objScorecardClass.GetUserID();
        hiddenBaselinePersonalSummaryId.Value = objScorecardClass.GetPersonalSummaryIdFirst().ToString();
        hiddenLatestPersonalSummaryId.Value = objScorecardClass.GetPersonalSummaryIdLast().ToString();

        textEntryDate.Text = objScorecardClass.GetDateSelected();

        decimal decBaselineWeight = objScorecardClass.GetWeightFirst();
        decimal decLatestWeight = objScorecardClass.GetWeightLast();
        textBaselineWeight.Text = decBaselineWeight.ToString();
        textLatestWeight.Text = decLatestWeight.ToString();
        textChangeWeight.Text = (decBaselineWeight - decLatestWeight).ToString();
        if (decBaselineWeight > 0.0m && decLatestWeight > 0.0m)
        {
            textChangeWeight.Text = (decBaselineWeight - decLatestWeight).ToString();
            textPercentChangeWeight.Text = ((decBaselineWeight - decLatestWeight) / decBaselineWeight).ToString();
        }
        else
        {
            textChangeWeight.Text = "0"; 
            textPercentChangeWeight.Text = "0";
        }

        decimal decBaselineWaist = objScorecardClass.GetWaistFirst();
        decimal decLatestWaist = objScorecardClass.GetWaistLast();
        textBaselineWaist.Text = decBaselineWaist.ToString();
        textLatestWaist.Text = decLatestWaist.ToString();
        if (decBaselineWaist > 0.0m && decLatestWaist > 0.0m)
        {
            textChangeWaist.Text = (decBaselineWaist - decLatestWaist).ToString();
            textPercentChangeWaist.Text = ((decBaselineWaist - decLatestWaist) / decBaselineWaist).ToString();
        }
        else
        {
            textChangeWaist.Text = "0";
            textPercentChangeWaist.Text = "0";
        }

        decimal decBaselineBMI = objScorecardClass.GetBMIFirst();
        decimal decLatestBMI = objScorecardClass.GetBMILast();        
        textBaselineBMI.Text = decBaselineBMI.ToString();
        textLatestBMI.Text = decLatestBMI.ToString();
        if (decBaselineBMI > 0.0m && decLatestBMI > 0.0m)
        {
            textChangeBMI.Text = (decBaselineBMI - decLatestBMI).ToString();
            textPercentChangeBMI.Text = ((decBaselineBMI - decLatestBMI) / decBaselineBMI).ToString();
        }
        else
        {
            textChangeBMI.Text = "0";
            textPercentChangeBMI.Text = "0";
        }

        decimal decBaselineBFP = objScorecardClass.GetBodyFatPercentageFirst();
        decimal decLatestBFP = objScorecardClass.GetBodyFatPercentageLast();
        textBaselineBFP.Text = decBaselineBFP.ToString();
        textLatestBFP.Text = decLatestBFP.ToString();
        if (decBaselineBFP > 0.0m && decLatestBFP > 0.0m)
        {
            textChangeBFP.Text = (decBaselineBFP - decLatestBFP).ToString();
            textPercentChangeBFP.Text = ((decBaselineBFP - decLatestBFP) / decBaselineBFP).ToString();
        }
        else
        {
            textChangeBFP.Text = "0";
            textPercentChangeBFP.Text = "0";
        }

        decimal decBaselineWaistHipRatio = objScorecardClass.GetWaistToHipFirst();
        decimal decLatestWaistHipRatio = objScorecardClass.GetWaistToHipLast();
        textBaselineWaistHipRatio.Text = decBaselineWaistHipRatio.ToString();
        textLatestWaistHipRatio.Text = decLatestWaistHipRatio.ToString();
        if (decBaselineWaistHipRatio > 0.0m && decLatestWaistHipRatio > 0.0m)
        {
            textChangeWaistHipRatio.Text = (decBaselineWaistHipRatio - decLatestWaistHipRatio).ToString();
            textPercentChangeWaistHipRatio.Text = ((decBaselineWaistHipRatio - decLatestWaistHipRatio) / decBaselineWaistHipRatio).ToString();
        }
        else
        {
            textChangeWaistHipRatio.Text = "0";
            textPercentChangeWaistHipRatio.Text = "0";
        }

        decimal decBaselineWaistHeightRatio = objScorecardClass.GetWaistToHeightFirst();
        decimal decLatestWaistHeightRatio = objScorecardClass.GetWaistToHeightLast();
        textBaselineWaistHeightRatio.Text = decBaselineWaistHeightRatio.ToString();
        textLatestWaistHeightRatio.Text = decLatestWaistHeightRatio.ToString();
        if (decBaselineWaistHeightRatio > 0.0m && decLatestWaistHeightRatio > 0.0m)
        {
            textChangeWaistHeightRatio.Text = (decBaselineWaistHeightRatio - decLatestWaistHeightRatio).ToString();
            textPercentChangeWaistHeightRatio.Text = ((decBaselineWaistHeightRatio - decLatestWaistHeightRatio) / decBaselineWaistHeightRatio).ToString();
        }
        else
        {
            textChangeWaistHeightRatio.Text = "0";
            textPercentChangeWaistHeightRatio.Text = "0";
        }

        textEntryDate.Enabled = true;
        textBaselineWeight.Enabled = false;
        textChangeWeight.Enabled = false;
        textPercentChangeWeight.Enabled = false;
        textBaselineWaist.Enabled = false;
        textChangeWaist.Enabled = false;
        textPercentChangeWaist.Enabled = false;
        textBaselineBMI.Enabled = false;
        textChangeBMI.Enabled = false;
        textPercentChangeBMI.Enabled = false;
        textBaselineBFP.Enabled = false;
        textChangeBFP.Enabled = false;
        textPercentChangeBFP.Enabled = false;
        textBaselineWaistHipRatio.Enabled = false;
        textChangeWaistHipRatio.Enabled = false;
        textPercentChangeWaistHipRatio.Enabled = false;
        textBaselineWaistHeightRatio.Enabled = false;
        textChangeWaistHeightRatio.Enabled = false;
        textPercentChangeWaistHeightRatio.Enabled = false;

        if (objScorecardClass.GetDateSelected().Trim().Length == 0)
        {
            textLatestWeight.Enabled = true;
            textLatestWaist.Enabled = true;
            textLatestBMI.Enabled = true;
            textLatestBFP.Enabled = true;
            textLatestWaistHipRatio.Enabled = true;
            textLatestWaistHeightRatio.Enabled = true;
        }
        else
        {
            textLatestWeight.Enabled = false;
            textLatestWaist.Enabled = false;
            textLatestBMI.Enabled = false;
            textLatestBFP.Enabled = false;
            textLatestWaistHipRatio.Enabled = false;
            textLatestWaistHeightRatio.Enabled = false;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string sUserID = hiddenUserId.Value.Trim();
        string sDateSelected = textEntryDate.Text.Trim();
        int iPersonalSummaryId = Convert.ToInt32(hiddenLatestPersonalSummaryId.Value.Trim());
        decimal decWeight = Convert.ToDecimal(textLatestWeight.Text.Trim());
        decimal decWaist = Convert.ToDecimal(textLatestWaist.Text.Trim());
        decimal decBMI = Convert.ToDecimal(textLatestBMI.Text.Trim());
        decimal decBodyFatPercentage = Convert.ToDecimal(textLatestBFP.Text.Trim());
        decimal decWaistToHeight = Convert.ToDecimal(textLatestWaistHeightRatio.Text.Trim());
        decimal decLatestWaistHipRatio = Convert.ToDecimal(textLatestWaistHipRatio.Text.Trim());;
        decimal decLatestWaistHeight = Convert.ToDecimal(textLatestWaistHeightRatio.Text.Trim());
         
        ScorecardClass objScorecardClass = new ScorecardClass(objSqlConnClass.OpenConnection(), Membership.GetUser().ProviderUserKey.ToString(), sDateSelected);
        objScorecardClass.SetUserData( sUserID, sDateSelected, iPersonalSummaryId, decWeight, decWaist, decBMI, decBodyFatPercentage, decWaistToHeight, decLatestWaistHipRatio);
    }

}
