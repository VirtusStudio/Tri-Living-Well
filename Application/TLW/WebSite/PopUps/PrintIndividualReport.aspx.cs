using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PopUps_PrintIndividualReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("Print Individual Report");

            #endregion

            if (Request.QueryString["bFAT"] != null)
            {
                lblScoreWeight.Text = Request.QueryString["weight"].ToString().Equals("") ? "0" : Request.QueryString["weight"] + "lbs.";
                lblScoreWaist.Text = Request.QueryString["waist"].ToString().Equals("") ? "0" : Request.QueryString["waist"];
                lblScoreBMI.Text = Request.QueryString["bmi"].ToString().Equals("") ? "0" : Request.QueryString["bmi"];
                lblScoreBodyFAT.Text = Request.QueryString["bFAT"].ToString().Equals("") ? "0" : Request.QueryString["bFAT"] + "%";
                lblScoreWaisttoheight.Text = Request.QueryString["wtheight"].ToString().Equals("") ? "0" : Request.QueryString["wtheight"];
                lblScoreWaisttoHip.Text = Request.QueryString["wthip"].ToString().Equals("") ? "0" : Request.QueryString["wthip"];
                BindTLWFormulaDetails();
            }
        }
        catch (Exception ex) { Response.Write(ex.Message); }
    }

    private void BindTLWFormulaDetails()
    {
        BLL.PersonalSummaryLib oPersonalSummaryLib = null;
        Entity.PersonalSummaryInfo oPersonalSummaryInfo = null;
        List<Entity.PersonalSummaryInfo> oListPersonalSummaryInfo = null;
        try
        {
            lblCurrentDate.Text = DateTime.Now.ToShortDateString();
            oListPersonalSummaryInfo = new List<Entity.PersonalSummaryInfo>();

            oPersonalSummaryLib = new BLL.PersonalSummaryLib();

            oPersonalSummaryInfo = new Entity.PersonalSummaryInfo();
            oPersonalSummaryInfo.StrGender = Request.QueryString["gender"].ToString();
            oPersonalSummaryInfo.DecWaist = Convert.ToDecimal(Request.QueryString["waist"].ToString().Equals("") ? "0" : Request.QueryString["waist"]);
            oPersonalSummaryInfo.DecBMI = Convert.ToDecimal(Request.QueryString["bmi"].ToString().Equals("") ? "0" : Request.QueryString["bmi"]);
            oPersonalSummaryInfo.DecBodyFATPercentage = Convert.ToDecimal(Request.QueryString["bFAT"].ToString().Equals("") ? "0" : Request.QueryString["bFAT"]);
            oPersonalSummaryInfo.DecWaistToHeight = Convert.ToDecimal(Request.QueryString["wtheight"].ToString().Equals("") ? "0" : Request.QueryString["wtheight"]);
            oPersonalSummaryInfo.DecWaistToHip = Convert.ToDecimal(Request.QueryString["wthip"].ToString().Equals("") ? "0" : Request.QueryString["wthip"]);
            oListPersonalSummaryInfo = oPersonalSummaryLib.GetTLWFormulaForIndividualReport(oPersonalSummaryInfo);

            lblRiskWeight.Text = oListPersonalSummaryInfo.Where(x => x.StrRatioCode.Trim().ToLower().Equals("weight")).Select(x => x.StrLevelofRisk).FirstOrDefault();
            lblRangeWeight.Text = oListPersonalSummaryInfo.Where(x => x.StrRatioCode.Trim().ToLower().Equals("weight")).Select(x => (x.DecFrom.ToString().Equals("0") ? "<" : x.DecFrom.ToString()) + " --- " + (x.DecTo.ToString().Equals("999999") ? ">" : x.DecTo.ToString())).FirstOrDefault();

            lblRiskWaist.Text = oListPersonalSummaryInfo.Where(x => x.StrRatioCode.Trim().ToLower().Equals("waist")).Select(x => x.StrLevelofRisk).FirstOrDefault();
            lblRangeWaist.Text = oListPersonalSummaryInfo.Where(x => x.StrRatioCode.Trim().ToLower().Equals("waist")).Select(x => (x.DecFrom.ToString().Equals("0") ? "<" : x.DecFrom.ToString()) + " --- " + (x.DecTo.ToString().Equals("999999") ? ">" : x.DecTo.ToString())).FirstOrDefault();

            lblRiskBMI.Text = oListPersonalSummaryInfo.Where(x => x.StrRatioCode.Trim().ToLower().Equals("bmi")).Select(x => x.StrLevelofRisk).FirstOrDefault();
            lblRangeBMI.Text = oListPersonalSummaryInfo.Where(x => x.StrRatioCode.Trim().ToLower().Equals("bmi")).Select(x => (x.DecFrom.ToString().Equals("0") ? "<" : x.DecFrom.ToString()) + " --- " + (x.DecTo.ToString().Equals("999999") ? ">" : x.DecTo.ToString())).FirstOrDefault();


            lblRiskBodyFAT.Text = oListPersonalSummaryInfo.Where(x => x.StrRatioCode.Trim().ToLower().Equals("bfatp")).Select(x => x.StrLevelofRisk).FirstOrDefault();
            lblRangeBodyFAT.Text = oListPersonalSummaryInfo.Where(x => x.StrRatioCode.Trim().ToLower().Equals("bfatp")).Select(x => (x.DecFrom.ToString().Equals("0") ? "<" : x.DecFrom.ToString()) + " --- " + (x.DecTo.ToString().Equals("999999") ? ">" : x.DecTo.ToString())).FirstOrDefault();


            lblRiskWaisttoHeight.Text = oListPersonalSummaryInfo.Where(x => x.StrRatioCode.Trim().ToLower().Equals("wtheight")).Select(x => x.StrLevelofRisk).FirstOrDefault();
            lblRangeWaisttoHeight.Text = oListPersonalSummaryInfo.Where(x => x.StrRatioCode.Trim().ToLower().Equals("wtheight")).Select(x => (x.DecFrom.ToString().Equals("0") ? "<" : x.DecFrom.ToString()) + " --- " + (x.DecTo.ToString().Equals("999999") ? ">" : x.DecTo.ToString())).FirstOrDefault();

            lblRiskWaisttoHip.Text = oListPersonalSummaryInfo.Where(x => x.StrRatioCode.Trim().ToLower().Equals("wthip")).Select(x => x.StrLevelofRisk).FirstOrDefault();
            lblRangeWaisttoHip.Text = oListPersonalSummaryInfo.Where(x => x.StrRatioCode.Trim().ToLower().Equals("wthip")).Select(x => (x.DecFrom.ToString().Equals("0") ? "<" : x.DecFrom.ToString()) + " --- " + (x.DecTo.ToString().Equals("999999") ? ">" : x.DecTo.ToString())).FirstOrDefault();

        }
        catch (Exception ex) { throw ex; }
        finally
        {
            oPersonalSummaryLib = null;
            oPersonalSummaryInfo = null;
        }
    }

}