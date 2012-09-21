
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

public partial class UC_Nutrition_BodyFatCalculator_PopUp : System.Web.UI.UserControl
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
        int iBaselinePersonalSummaryId = 0;
        decimal decBaselineWeight = 0.00m;
        decimal decBaselineWaist = 0.00m;
        decimal decBaselineNeck = 0.00m;
        decimal decBaselineHips = 0.00m;
        int iLatestPersonalSummaryId = 0;
        decimal decLatestWeight = 0.00m;
        decimal decLatestWaist = 0.00m;
        decimal decLatestNeck = 0.00m;
        decimal decLatestHips = 0.00m;

        decimal decWeightChange = 0.00m;
        decimal decWaistChange = 0.00m;
        decimal decNeckChange = 0.00m;
        decimal decHipsChange = 0.00m;

        decimal decWeightPercentageChange = 0.00m;
        decimal decWaistPercentageChange = 0.00m;
        decimal decNeckPercentageChange = 0.00m;
        decimal decHipsPercentageChange = 0.00m;

        string sDateSelected = textEntryDate.Text.Trim();
        if (sDateSelected.Length == 0)
            sDateSelected = DateTime.Now.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.GetCultureInfo("en-US"));
        else
        {
            DateTime dt = DateTime.Parse(sDateSelected);
            sDateSelected = dt.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.GetCultureInfo("en-US"));
        }

        BodyFatCalculatorClass bfc = new BodyFatCalculatorClass(objSqlConnClass.OpenConnection());
        
        DataSet MyDataSetBaseline = bfc.GetBodyFatCalculatorBaseline(Membership.GetUser().ProviderUserKey.ToString());
        if ((MyDataSetBaseline != null) && (MyDataSetBaseline.Tables.Count > 0))
        {
            if (MyDataSetBaseline.Tables[0].Rows.Count > 0)
            {
                iBaselinePersonalSummaryId = (Convert.IsDBNull(MyDataSetBaseline.Tables[0].Rows[0]["intPersonalSummaryId"])) ? 0 : Convert.ToInt32(MyDataSetBaseline.Tables[0].Rows[0]["intPersonalSummaryId"]);
                decBaselineWeight = (Convert.IsDBNull(MyDataSetBaseline.Tables[0].Rows[0]["decWeight"])) ? 0 : Convert.ToDecimal(MyDataSetBaseline.Tables[0].Rows[0]["decWeight"]);
                decBaselineWaist = (Convert.IsDBNull(MyDataSetBaseline.Tables[0].Rows[0]["decWaist"])) ? 0 : Convert.ToDecimal(MyDataSetBaseline.Tables[0].Rows[0]["decWaist"]);
                decBaselineNeck = (Convert.IsDBNull(MyDataSetBaseline.Tables[0].Rows[0]["decBMI"])) ? 0 : Convert.ToDecimal(MyDataSetBaseline.Tables[0].Rows[0]["decBMI"]);
                decBaselineHips = (Convert.IsDBNull(MyDataSetBaseline.Tables[0].Rows[0]["decBodyFATPercentage"])) ? 0 : Convert.ToDecimal(MyDataSetBaseline.Tables[0].Rows[0]["decBodyFATPercentage"]);
            }
        }

        DataSet MyDataSetLatest = bfc.GetBodyFatCalculatorLatest(Membership.GetUser().ProviderUserKey.ToString(), sDateSelected);
        if ((MyDataSetLatest != null) && (MyDataSetLatest.Tables.Count > 0))
        {
            if (MyDataSetLatest.Tables[0].Rows.Count > 0)
            {
                iLatestPersonalSummaryId = (Convert.IsDBNull(MyDataSetLatest.Tables[0].Rows[0]["intPersonalSummaryId"])) ? 0 : Convert.ToInt32(MyDataSetLatest.Tables[0].Rows[0]["intPersonalSummaryId"]);
                decLatestWeight = (Convert.IsDBNull(MyDataSetLatest.Tables[0].Rows[0]["decWeight"])) ? 0 : Convert.ToDecimal(MyDataSetLatest.Tables[0].Rows[0]["decWeight"]);
                decLatestWaist = (Convert.IsDBNull(MyDataSetLatest.Tables[0].Rows[0]["decWaist"])) ? 0 : Convert.ToDecimal(MyDataSetLatest.Tables[0].Rows[0]["decWaist"]);
                decLatestNeck = (Convert.IsDBNull(MyDataSetLatest.Tables[0].Rows[0]["decBMI"])) ? 0 : Convert.ToDecimal(MyDataSetLatest.Tables[0].Rows[0]["decBMI"]);
                decLatestHips = (Convert.IsDBNull(MyDataSetLatest.Tables[0].Rows[0]["decBodyFATPercentage"])) ? 0 : Convert.ToDecimal(MyDataSetLatest.Tables[0].Rows[0]["decBodyFATPercentage"]);
            }
        }
        decWeightChange = decBaselineWeight - decLatestWeight;
        decWaistChange = decBaselineWaist - decLatestWaist;
        decNeckChange = decBaselineNeck - decLatestNeck;
        decHipsChange = decBaselineHips - decLatestHips;

        if (decBaselineWeight > 0) decWeightPercentageChange = decWeightChange/decBaselineWeight;
        if (decBaselineWaist > 0) decWaistPercentageChange = decWaistChange/decBaselineWaist;
        if (decBaselineNeck > 0) decNeckPercentageChange = decNeckChange/decBaselineNeck;
        if (decBaselineHips > 0) decHipsPercentageChange = decHipsChange / decBaselineHips;

        textBaselineWeight.Text = decBaselineWeight.ToString();
        textBaselineWeight.ReadOnly = true;
        textLatestWeight.Text = decLatestWaist.ToString();
        textLatestWeight.Attributes.Add("onkeypress", "return (window.event.keyCode == 45 || window.event.keyCode == 13 || window.event.keyCode == 8 || window.event.keyCode == 9 || window.event.keyCode == 189 || window.event.keyCode == 109 || (window.event.keyCode >= 48 && window.event.keyCode <= 58) )");
        textChangeWeight.Text = decWeightChange.ToString();
        textChangeWeight.ReadOnly = true;
        textPercentChangeWeight.Text = decWeightPercentageChange.ToString();
        textPercentChangeWeight.ReadOnly = true;

        textBaselineWaist.Text = decBaselineWaist.ToString();
        textBaselineWaist.ReadOnly = true;
        textLatestWaist.Text = decLatestWaist.ToString();
        textLatestWaist.Attributes.Add("onkeypress", "return (window.event.keyCode == 45 || window.event.keyCode == 13 || window.event.keyCode == 8 || window.event.keyCode == 9 || window.event.keyCode == 189 || window.event.keyCode == 109 || (window.event.keyCode >= 48 && window.event.keyCode <= 58) )");
        textChangeWaist.Text = decWaistChange.ToString();
        textChangeWaist.ReadOnly = true;
        textPercentChangeWaist.Text = decWaistPercentageChange.ToString();
        textPercentChangeWaist.ReadOnly = true;

        textBaselineNeck.Text = decBaselineNeck.ToString();
        textBaselineNeck.ReadOnly = true;
        textLatestNeck.Text = decLatestNeck.ToString();
        textLatestNeck.Attributes.Add("onkeypress", "return (window.event.keyCode == 45 || window.event.keyCode == 13 || window.event.keyCode == 8 || window.event.keyCode == 9 || window.event.keyCode == 189 || window.event.keyCode == 109 || (window.event.keyCode >= 48 && window.event.keyCode <= 58) )");
        textChangeNeck.Text = decNeckChange.ToString();
        textChangeNeck.ReadOnly = true;
        textPercentChangeNeck.Text = decNeckPercentageChange.ToString();
        textPercentChangeNeck.ReadOnly = true;

        textBaselineHips.Text = decBaselineHips.ToString();
        textBaselineHips.ReadOnly = true;
        textLatestHips.Text = decLatestHips.ToString();
        textLatestHips.Attributes.Add("onkeypress", "return (window.event.keyCode == 45 || window.event.keyCode == 13 || window.event.keyCode == 8 || window.event.keyCode == 9 || window.event.keyCode == 189 || window.event.keyCode == 109 || (window.event.keyCode >= 48 && window.event.keyCode <= 58) )");
        textChangeHips.Text = decHipsChange.ToString();
        textChangeHips.ReadOnly = true;
        textPercentChangeHips.Text = decHipsPercentageChange.ToString();
        textPercentChangeHips.ReadOnly = true;

        hiddenPersonalSummaryId.Value = iLatestPersonalSummaryId.ToString();
        textEntryDate.Text = sDateSelected;
            
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string sDateSelected = textEntryDate.Text.Trim();
        if (sDateSelected.Length == 0)
            sDateSelected = DateTime.Now.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.GetCultureInfo("en-US"));
        else
        {
            DateTime dt = DateTime.Parse(sDateSelected);
            sDateSelected = dt.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.GetCultureInfo("en-US"));
        }
        
        string sUserID = Membership.GetUser().ProviderUserKey.ToString();
        int iPersonalSummaryId = Convert.ToInt32(hiddenPersonalSummaryId.Value);
        decimal decWeight = Convert.ToDecimal(textLatestWeight.Text);
        decimal decWaist = Convert.ToDecimal(textLatestWaist.Text);
        decimal decNeck = Convert.ToDecimal(textLatestNeck.Text);
        decimal decHips = Convert.ToDecimal(textLatestHips.Text);
        BodyFatCalculatorClass bfc = new BodyFatCalculatorClass(objSqlConnClass.OpenConnection());
        bfc.SetBodyFatCalculator(Membership.GetUser().ProviderUserKey.ToString(), sDateSelected, iPersonalSummaryId, decWeight, decWaist, decNeck, decHips);
    }

}
