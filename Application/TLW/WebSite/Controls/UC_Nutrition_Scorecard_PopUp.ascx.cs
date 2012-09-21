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
        int iBaselinePersonalSummaryId = 0;
	    decimal decBaselineWeight = 0.00m;
	    decimal decBaselineWaist = 0.00m;
	    decimal decBaselineNeck = 0.00m;
	    decimal decBaselineHips = 0.00m;
	    decimal decBaselineBMI = 0.00m;
	    decimal decBaselineBodyFATPercentage = 0.00m;
	    decimal decBaselineWaistToHeight = 0.00m;
	    decimal decBaselineWaistToHip = 0.00m;

        int iLatestPersonalSummaryId = 0;
	    decimal decLatestWeight = 0.00m;
	    decimal decLatestWaist = 0.00m;
	    decimal decLatestNeck = 0.00m;
	    decimal decLatestHips = 0.00m;
	    decimal decLatestBMI = 0.00m;
	    decimal decLatestBodyFATPercentage = 0.00m;
	    decimal decLatestWaistToHeight = 0.00m;
	    decimal decLatestWaistToHip = 0.00m;

        decimal decChangeWeight = 0.00m;
        decimal decPercentChangeWeight = 0.00m;
	    decimal decChangeWaist = 0.00m;
	    decimal decPercentChangeWaist = 0.00m;
	    decimal decChangeBMI = 0.00m;
	    decimal decPercentChangeBMI = 0.00m;
	    decimal decChangeBFP = 0.00m;
	    decimal decPercentChangeBFP = 0.00m;
	    decimal decChangeWaistHipRatio = 0.00m;
	    decimal decPercentChangeWaistHipRatio = 0.00m;
	    decimal decChangeWaistHeightRatio = 0.00m;
	    decimal decPercentChangeWaistHeightRatio = 0.00m;

        ScorecardClass objScorecardClass = new ScorecardClass(objSqlConnClass.OpenConnection());
        DataSet baseLine = objScorecardClass.GetFirstScorecard(Membership.GetUser().ProviderUserKey.ToString(), sDateSelected);
        DataSet latest = objScorecardClass.GetLastScorecard(Membership.GetUser().ProviderUserKey.ToString(), sDateSelected);

        if ((baseLine != null) && (baseLine.Tables.Count > 0))
        {
            if (baseLine.Tables[0].Rows.Count > 0)
            {
                DataRow dataRow = baseLine.Tables[0].Rows[0];
                iBaselinePersonalSummaryId = (Convert.IsDBNull(dataRow["intPersonalSummaryId"])) ? 0 : Convert.ToInt32(dataRow["intPersonalSummaryId"]);
                decBaselineWeight = (Convert.IsDBNull(dataRow["decWeight"])) ? 0.00m : Convert.ToDecimal(dataRow["decWeight"]);
                decBaselineWaist = (Convert.IsDBNull(dataRow["decWaist"])) ? 0.00m : Convert.ToDecimal(dataRow["decWaist"]);
                decBaselineNeck = (Convert.IsDBNull(dataRow["decNeck"])) ? 0.00m : Convert.ToDecimal(dataRow["decNeck"]);
                decBaselineHips = (Convert.IsDBNull(dataRow["decHips"])) ? 0.00m : Convert.ToDecimal(dataRow["decHips"]);
                decBaselineBMI = (Convert.IsDBNull(dataRow["decBMI"])) ? 0.00m : Convert.ToDecimal(dataRow["decBMI"]);
                decBaselineBodyFATPercentage = (Convert.IsDBNull(dataRow["decBodyFATPercentage"])) ? 0.00m : Convert.ToDecimal(dataRow["decBodyFATPercentage"]);
                decBaselineWaistToHeight = (Convert.IsDBNull(dataRow["decWaistToHeight"])) ? 0.00m : Convert.ToDecimal(dataRow["decWaistToHeight"]);
                decBaselineWaistToHip = (Convert.IsDBNull(dataRow["decWaistToHip"])) ? 0.00m : Convert.ToDecimal(dataRow["decWaistToHip"]);
            }
        }
        
        hiddenBaselinePersonalSummaryId.Value = iBaselinePersonalSummaryId.ToString();
        textBaselineWeight.Text = decBaselineWeight.ToString();
        textBaselineWaist.Text = decBaselineWaist.ToString();
        textBaselineBMI.Text = decBaselineBMI.ToString();
        textBaselineBFP.Text = decBaselineBMI.ToString();
        textBaselineWaistHipRatio.Text = decBaselineWaistToHip.ToString();
        textBaselineWaistHeightRatio.Text = decBaselineWaistToHeight.ToString();
        textBaselineWeight.Enabled = false;
        textBaselineWaist.Enabled = false;
        textBaselineBMI.Enabled = false;
        textBaselineBFP.Enabled = false;
        textBaselineWaistHipRatio.Enabled = false;
        textBaselineWaistHeightRatio.Enabled = false;


        if ((latest != null) && (latest.Tables.Count > 0))
        {
            if (latest.Tables[0].Rows.Count > 0)
            {
                DataRow dataRow = latest.Tables[0].Rows[0];
                iLatestPersonalSummaryId = (Convert.IsDBNull(dataRow["intPersonalSummaryId"])) ? 0 : Convert.ToInt32(dataRow["intPersonalSummaryId"]);
                decLatestWeight = (Convert.IsDBNull(dataRow["decWeight"])) ? 0.00m : Convert.ToDecimal(dataRow["decWeight"]);
                decLatestWaist = (Convert.IsDBNull(dataRow["decWaist"])) ? 0.00m : Convert.ToDecimal(dataRow["decWaist"]);
                decLatestNeck = (Convert.IsDBNull(dataRow["decNeck"])) ? 0.00m : Convert.ToDecimal(dataRow["decNeck"]);
                decLatestHips = (Convert.IsDBNull(dataRow["decHips"])) ? 0.00m : Convert.ToDecimal(dataRow["decHips"]);
                decLatestBMI = (Convert.IsDBNull(dataRow["decBMI"])) ? 0.00m : Convert.ToDecimal(dataRow["decBMI"]);
                decLatestBodyFATPercentage = (Convert.IsDBNull(dataRow["decBodyFATPercentage"])) ? 0.00m : Convert.ToDecimal(dataRow["decBodyFATPercentage"]);
                decLatestWaistToHeight = (Convert.IsDBNull(dataRow["decWaistToHeight"])) ? 0.00m : Convert.ToDecimal(dataRow["decWaistToHeight"]);
                decLatestWaistToHip = (Convert.IsDBNull(dataRow["decWaistToHip"])) ? 0.00m : Convert.ToDecimal(dataRow["decWaistToHip"]);
            }
        }
        hiddenLatestPersonalSummaryId.Value = iLatestPersonalSummaryId.ToString();
        textLatestWeight.Text = decLatestWeight.ToString();
        textLatestWaist.Text = decLatestWaist.ToString();
        textLatestBMI.Text = decLatestBMI.ToString();
        textLatestBFP.Text = decLatestBMI.ToString();
        textLatestWaistHipRatio.Text = decLatestWaistToHip.ToString();
        textLatestWaistHeightRatio.Text = decLatestWaistToHeight.ToString();

        decChangeWeight = decBaselineWeight - decLatestWeight;
        decChangeWaist = decBaselineWaist - decLatestWaist;
        decChangeBMI = decBaselineBMI - decLatestBMI;
        decChangeBFP = decBaselineBodyFATPercentage - decLatestBodyFATPercentage;
	    decChangeWaistHipRatio = decBaselineWaistToHip - decLatestWaistToHip;
	    decChangeWaistHeightRatio = decBaselineWaistToHeight - decLatestWaistToHeight;

        if(decBaselineWeight > 0) decPercentChangeWeight = decChangeWeight/decBaselineWeight;
	    if(decBaselineWaist > 0) decPercentChangeWaist = decChangeWaist/decBaselineWaist;
	    if(decBaselineBMI > 0) decPercentChangeBMI = decChangeBMI/decBaselineBMI;
	    if(decBaselineBodyFATPercentage > 0) decPercentChangeBFP = decChangeBFP/decBaselineBodyFATPercentage;
        if(decBaselineWaistToHip > 0) decPercentChangeWaistHipRatio = decChangeWaistHipRatio/decBaselineWaistToHip;
	    if(decBaselineWaistToHeight > 0) decPercentChangeWaistHeightRatio = decChangeWaistHeightRatio/decBaselineWaistToHeight;
	    
        textChangeWeight.Text = decChangeWeight.ToString();
        textPercentChangeWeight.Text = decPercentChangeWeight.ToString();
        textChangeWaist.Text = decChangeWaist.ToString();
        textPercentChangeWaist.Text = decPercentChangeWaist.ToString();
        textChangeBMI.Text = decChangeBMI.ToString();
        textPercentChangeBMI.Text = decPercentChangeBMI.ToString();
        textChangeBFP.Text = decChangeBFP.ToString();
        textPercentChangeBFP.Text = decPercentChangeBFP.ToString();
        textChangeWaistHipRatio.Text = decChangeWaistHipRatio.ToString();
        textPercentChangeWaistHipRatio.Text = decPercentChangeWaistHipRatio.ToString();
        textChangeWaistHeightRatio.Text = decChangeWaistHeightRatio.ToString();
        textPercentChangeWaistHeightRatio.Text = decPercentChangeWaistHeightRatio.ToString();


        if (sDateSelected.Trim().Length == 0)
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

        textEntryDate.Text = sDateSelected;

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string sDateSelected = textEntryDate.Text.Trim();
        int iPersonalSummaryId = Convert.ToInt32(hiddenLatestPersonalSummaryId.Value.Trim());
        decimal decWeight = Convert.ToDecimal(textLatestWeight.Text.Trim());
        decimal decWaist = Convert.ToDecimal(textLatestWaist.Text.Trim());
        decimal decBMI = Convert.ToDecimal(textLatestBMI.Text.Trim());
        decimal decBodyFatPercentage = Convert.ToDecimal(textLatestBFP.Text.Trim());
        decimal decWaistToHeight = Convert.ToDecimal(textLatestWaistHeightRatio.Text.Trim());
        decimal decLatestWaistHipRatio = Convert.ToDecimal(textLatestWaistHipRatio.Text.Trim());;
        decimal decLatestWaistHeight = Convert.ToDecimal(textLatestWaistHeightRatio.Text.Trim());
         
        ScorecardClass objScorecardClass = new ScorecardClass(objSqlConnClass.OpenConnection());
        objScorecardClass.SetScorecard(Membership.GetUser().ProviderUserKey.ToString(), sDateSelected, iPersonalSummaryId, decWeight, decWaist, decBMI, decBodyFatPercentage, decWaistToHeight, decLatestWaistHipRatio);
    }

}
