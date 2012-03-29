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
using Telerik.Charting;

public partial class Report_CompanyMonthlyDetail : System.Web.UI.Page
{
    string sOrganization = "Blue Grotto Technologies";
    int DDL_YEARS = 10;
    
    SqlConnClass objSqlConnClass = new SqlConnClass();
    BackofficeClass objBackofficeClass;
    ReportClass objReportClass;
    
    int giYearCurrent = 0;
    int giMonthCurrent = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        objBackofficeClass = new BackofficeClass(objSqlConnClass.sqlConnection);
        objReportClass = new ReportClass(objSqlConnClass.sqlConnection);
        
        giYearCurrent = System.DateTime.Now.Year;
        giMonthCurrent = System.DateTime.Now.Month;
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            init();

            //Simulating a month click event
            txtMonth.Text= System.DateTime.Now.Month.ToString();
            btnMonth_Click(sender, e);
            ////////////
        }

        objSqlConnClass.CloseConnection();
    }
    private void init()
    {
       // fillOutMonths();

        initDropDowns();
        if (ddlYear.Items.Count > 0)
        {
            ddlYear.Text = giYearCurrent.ToString();
            initDates();
        }
    }



    private void initDates()
    {
        //This is where we decide if defualt is year or month

        DateTime dtStart = Convert.ToDateTime(giMonthCurrent.ToString() +  "/1/" + ddlYear.SelectedValue);
        DateTime dtEnd = dtStart.AddMonths(1).AddDays(-1);

        /*
        DateTime dtStart = Convert.ToDateTime("1/1/" + ddlYear.SelectedValue);
        DateTime dtEnd = dtStart.AddYears(1).AddDays(-1);
         */

        rdpDateStart.SelectedDate = dtStart;
        rdpDateEnd.SelectedDate = dtEnd;
    }
    private void initDropDowns()
    {
        for (int i = -1; i < DDL_YEARS; i++)
        {
            if (giYearCurrent - i < 2008)
            {
                return;
            }
            ListItem li = new ListItem();
            li.Value = (giYearCurrent - i).ToString();
            li.Text = (giYearCurrent - i).ToString();
            ddlYear.Items.Add(li);
        }
    }

    private void fillOutForm(int iMode)
    {
        string sFromDate = "";
        string sToDate = "";
        if (iMode == 1)// get values from aspx
        {
            sFromDate = rdpDateStart.SelectedDate.ToString();
            sToDate = rdpDateEnd.SelectedDate.ToString();
        }
        else if (iMode == 2)// get values from viewstate
        {
            sFromDate = ViewState["sFromDate"].ToString();
            sToDate = ViewState["sToDate"].ToString();
        }
        ViewState["sFromDate"] = sFromDate;
        ViewState["sToDate"] = sToDate;


        string sFilter_AccountFrom = "";
        foreach (ListItem LI in cblFilter.Items)
        {
            if (LI.Selected)
            {
                //LI.Value = [ "Main" | "Extended" ]
                sFilter_AccountFrom += LI.Value + ",";
            }
        }
        sFilter_AccountFrom = sFilter_AccountFrom.Trim(new char[] { ',' });

        if (sToDate != "")
        {
            sToDate = Convert.ToDateTime(sToDate).ToString("MM/dd/yyyy") + "  23:59:59";
        }

        DataSet DS = objReportClass.Rpt_REPORT_PalEntries_BY_Date(sFromDate, sToDate, UC_Visitlog_Visitlog1.ACCOUNT_ID, sFilter_AccountFrom);
        double iNumPal = Convert.ToDouble(DS.Tables[0].Rows[0]["NUM_PAL"]);
        double iSumMet = Convert.ToDouble(DS.Tables[0].Rows[0]["SUM_MET"]);

        lblNumPal.Text = iNumPal.ToString();
        lblAvgMetPal.Text = String.Format("{0:0.00}", (iSumMet / iNumPal));

        //
        RadChart_PAL_Enrties.Chart.Series[0].Items.Clear();
        RadChart_PAL_Enrties.Chart.PlotArea.XAxis.Items.Clear();

        fillRadChart_PAL_Enrties("1", Convert.ToDateTime(sFromDate).AddMonths(-1).ToString(), sFilter_AccountFrom);
        fillRadChart_PAL_Enrties("2", Convert.ToDateTime(sFromDate).AddMonths(0).ToString(), sFilter_AccountFrom);
        fillRadChart_PAL_Enrties("3", Convert.ToDateTime(sFromDate).AddMonths(1).ToString(), sFilter_AccountFrom);

        //
        RadChart_PAL_Average_MET.Chart.Series[0].Items.Clear();
        RadChart_PAL_Average_MET.Chart.PlotArea.XAxis.Items.Clear();

        fillRadChart_PAL_Average_MET("1", Convert.ToDateTime(sFromDate).AddMonths(-1).ToString(), sFilter_AccountFrom);
        fillRadChart_PAL_Average_MET("2", Convert.ToDateTime(sFromDate).AddMonths(0).ToString(), sFilter_AccountFrom);
        fillRadChart_PAL_Average_MET("3", Convert.ToDateTime(sFromDate).AddMonths(1).ToString(), sFilter_AccountFrom);

        //
        fillRadChart_PAL_Type(Convert.ToDateTime(sFromDate).AddMonths(0).ToString(),  sFilter_AccountFrom);
        fillRadChart_PAL_Time(Convert.ToDateTime(sFromDate).AddMonths(0).ToString(),  sFilter_AccountFrom);
        fillRadChart_PAL_Duration(Convert.ToDateTime(sFromDate).AddMonths(0).ToString(),  sFilter_AccountFrom);
        fillRadChart_PAL_Intensity(Convert.ToDateTime(sFromDate).AddMonths(0).ToString(),  sFilter_AccountFrom);

        //
        RadChart_DD_Totals.Chart.Series[0].Items.Clear();
        RadChart_DD_Totals.Chart.Series[1].Items.Clear();
        RadChart_DD_Totals.Chart.Series[2].Items.Clear();
        RadChart_DD_Totals.Chart.Series[3].Items.Clear();
        RadChart_DD_Totals.Chart.Series[4].Items.Clear();
        RadChart_DD_Totals.Chart.Series[5].Items.Clear();
        RadChart_DD_Totals.Chart.Series[6].Items.Clear();
        RadChart_DD_Totals.Chart.PlotArea.XAxis.Items.Clear();

        fillRadChart_DD_Totals("1", Convert.ToDateTime(sFromDate).AddMonths(-1).ToString(), sFilter_AccountFrom);
        fillRadChart_DD_Totals("2", Convert.ToDateTime(sFromDate).AddMonths(0).ToString(), sFilter_AccountFrom);
        fillRadChart_DD_Totals("3", Convert.ToDateTime(sFromDate).AddMonths(1).ToString(), sFilter_AccountFrom);

        //
        RadChart_DD_TotalsCount.Chart.Series[0].Items.Clear();
        RadChart_DD_TotalsCount.Chart.PlotArea.XAxis.Items.Clear();

        fillRadChart_DD_TotalsCount("1", Convert.ToDateTime(sFromDate).AddMonths(-1).ToString(), sFilter_AccountFrom);
        fillRadChart_DD_TotalsCount("2", Convert.ToDateTime(sFromDate).AddMonths(0).ToString(), sFilter_AccountFrom);
        fillRadChart_DD_TotalsCount("3", Convert.ToDateTime(sFromDate).AddMonths(1).ToString(), sFilter_AccountFrom);

        //
        RadChart_DD_LVTotals.Chart.Series[0].Items.Clear();
        RadChart_DD_LVTotals.Chart.Series[1].Items.Clear();
        RadChart_DD_LVTotals.Chart.PlotArea.XAxis.Items.Clear();

        fillRadChart_DD_LVTotals("1", Convert.ToDateTime(sFromDate).AddMonths(-1).ToString(), sFilter_AccountFrom);
        fillRadChart_DD_LVTotals("2", Convert.ToDateTime(sFromDate).AddMonths(0).ToString(), sFilter_AccountFrom);
        fillRadChart_DD_LVTotals("3", Convert.ToDateTime(sFromDate).AddMonths(1).ToString(), sFilter_AccountFrom);
    }



    private void fillRadChart_PAL_Enrties(string sXAxisValue, string sFromDate, string sFilter_AccountFrom)
    {
        DateTime dtMonthStart = Convert.ToDateTime(sFromDate);
        string sMonthStart = dtMonthStart.ToString("MM/01/yyyy");
        string sMonthEnd = dtMonthStart.AddMonths(1).AddSeconds(-1).ToString();
        DataSet DS = objReportClass.Rpt_REPORT_PalEntries_BY_Date(sMonthStart, sMonthEnd, UC_Visitlog_Visitlog1.ACCOUNT_ID, sFilter_AccountFrom);

        string sXAxisText = dtMonthStart.ToString("MMM yy");
        double dNumPal = Convert.ToDouble(DS.Tables[0].Rows[0]["NUM_PAL"]);
        double dSumMet = Convert.ToDouble(DS.Tables[0].Rows[0]["SUM_MET"]);

        //insert the new xaxis coordinate
        ChartAxisItem CAI = new ChartAxisItem();
        CAI.Value = Convert.ToDecimal(sXAxisValue);
        CAI.TextBlock.Text = sXAxisText;// dtCurrent.AddDays(-giChartDaySpan).ToString("MMM d");
        CAI.Appearance.RotationAngle = 0;
        CAI.Appearance.Position.AlignedPosition = Telerik.Charting.Styles.AlignedPositions.Top;
        RadChart_PAL_Enrties.PlotArea.XAxis.Items.Add(CAI);

        ChartSeriesItem CSI1 = new ChartSeriesItem();
        CSI1.YValue = dNumPal;
        CSI1.XValue = Convert.ToDouble(sXAxisValue);
        //if (Convert.ToDateTime(sMonthStart) < DateTime.Now)
        {
            RadChart_PAL_Enrties.Series[0].AddItem(CSI1);

        }
        sFromDate = Convert.ToDateTime(sFromDate).AddMonths(1).ToString();
    }


    private void fillRadChart_PAL_Average_MET(string sXAxisValue, string sFromDate, string sFilter_AccountFrom)
    {


            DateTime dtMonthStart = Convert.ToDateTime(sFromDate);
            string sMonthStart = dtMonthStart.ToString("MM/01/yyyy");
            string sMonthEnd = dtMonthStart.AddMonths(1).AddSeconds(-1).ToString();
            DataSet DS = objReportClass.Rpt_REPORT_PalEntries_BY_Date(sMonthStart, sMonthEnd, UC_Visitlog_Visitlog1.ACCOUNT_ID, sFilter_AccountFrom);

            string sXAxisText = dtMonthStart.ToString("MMM yy");
            double dNumPal = Convert.ToDouble(DS.Tables[0].Rows[0]["NUM_PAL"]);
            double dSumMet = Convert.ToDouble(DS.Tables[0].Rows[0]["SUM_MET"]);

            //insert the new xaxis coordinate
            ChartAxisItem CAI = new ChartAxisItem();
            CAI.Value = Convert.ToDecimal(sXAxisValue);
            CAI.TextBlock.Text = sXAxisText;// dtCurrent.AddDays(-giChartDaySpan).ToString("MMM d");
            CAI.Appearance.RotationAngle = 0;
            CAI.Appearance.Position.AlignedPosition = Telerik.Charting.Styles.AlignedPositions.Top;
            RadChart_PAL_Average_MET.PlotArea.XAxis.Items.Add(CAI);

            ChartSeriesItem CSI = new ChartSeriesItem();
            if (dNumPal == 0)
            {
                CSI.YValue = 0;
            }
            else
            {
                CSI.YValue = Convert.ToDouble(String.Format("{0:0.00}", dSumMet / dNumPal));
            }
            CSI.XValue = Convert.ToDouble(sXAxisValue);
           /// if (Convert.ToDateTime(sMonthStart) < DateTime.Now)
            {
                RadChart_PAL_Average_MET.Series[0].AddItem(CSI);
            }
            sFromDate = Convert.ToDateTime(sFromDate).AddMonths(1).ToString();
        
    }

    private void fillRadChart_PAL_Type(string sFromDate,  string sFilter_AccountFrom)
    {
        RadChart_PAL_Type.Chart.Series[0].Items.Clear();

        DateTime dtMonthStart = Convert.ToDateTime(sFromDate);
        string sMonthStart = dtMonthStart.ToString("MM/01/yyyy");
        string sMonthEnd = dtMonthStart.AddMonths(1).AddSeconds(-1).ToString();

        DataSet DS = objReportClass.Rpt_REPORT_ListPal_Type(UC_Visitlog_Visitlog1.ACCOUNT_ID, sFilter_AccountFrom, sMonthStart, sMonthEnd);

        if (DS.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in DS.Tables[0].Rows)
            {
                if (Convert.ToInt32(DR["COUNT"]) != 0)
                {
                    ChartSeriesItem CSI = new ChartSeriesItem();
                    CSI.YValue = Convert.ToDouble(DR["COUNT"]);
                    CSI.Label.TextBlock.Text = DR["ITEM_TEXT"].ToString() + " (" + DR["COUNT"].ToString() + ")";
                    CSI.XValue = 1;
                    RadChart_PAL_Type.Series[0].AddItem(CSI);
                }

            }
        }

    }

    private void fillRadChart_PAL_Time(string sFromDate,  string sFilter_AccountFrom)
    {
        RadChart_PAL_Time.Chart.Series[0].Items.Clear();

        DateTime dtMonthStart = Convert.ToDateTime(sFromDate);
        string sMonthStart = dtMonthStart.ToString("MM/01/yyyy");
        string sMonthEnd = dtMonthStart.AddMonths(1).AddSeconds(-1).ToString();


        DataSet DS = objReportClass.Rpt_REPORT_ListPal_Time(UC_Visitlog_Visitlog1.ACCOUNT_ID, sFilter_AccountFrom, sMonthStart, sMonthEnd);


        if (DS.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in DS.Tables[0].Rows)
            {
                if (Convert.ToInt32(DR["COUNT"]) != 0)
                {
                    ChartSeriesItem CSI = new ChartSeriesItem();
                    CSI.YValue = Convert.ToDouble(DR["COUNT"]);
                    CSI.Label.TextBlock.Text = DR["ITEM_TEXT"].ToString() + " (" + DR["COUNT"].ToString() + ")";
                    CSI.XValue = 1;
                    RadChart_PAL_Time.Series[0].AddItem(CSI);
                }

            }
        }

    }

    private void fillRadChart_PAL_Duration(string sFromDate, string sFilter_AccountFrom)
    {

        RadChart_PAL_Duration.Chart.Series[0].Items.Clear();

        DateTime dtMonthStart = Convert.ToDateTime(sFromDate);
        string sMonthStart = dtMonthStart.ToString("MM/01/yyyy");
        string sMonthEnd = dtMonthStart.AddMonths(1).AddSeconds(-1).ToString();


        DataSet DS = objReportClass.Rpt_REPORT_ListPal_Duration(UC_Visitlog_Visitlog1.ACCOUNT_ID, sFilter_AccountFrom, sMonthStart, sMonthEnd);


        if (DS.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in DS.Tables[0].Rows)
            {
                if (Convert.ToInt32(DR["COUNT"]) != 0)
                {
                    ChartSeriesItem CSI = new ChartSeriesItem();
                    CSI.YValue = Convert.ToDouble(DR["COUNT"]);
                    CSI.Label.TextBlock.Text = DR["ITEM_TEXT"].ToString() + " (" + DR["COUNT"].ToString() + ")";
                    CSI.XValue = 1;
                    RadChart_PAL_Duration.Series[0].AddItem(CSI);
                }

            }
        }

    }

    private void fillRadChart_PAL_Intensity(string sFromDate, string sFilter_AccountFrom)
    {
        RadChart_PAL_Intensity.Chart.Series[0].Items.Clear();

        DateTime dtMonthStart = Convert.ToDateTime(sFromDate);
        string sMonthStart = dtMonthStart.ToString("MM/01/yyyy");
        string sMonthEnd = dtMonthStart.AddMonths(1).AddSeconds(-1).ToString();


        DataSet DS = objReportClass.Rpt_REPORT_ListPal_Intensity(UC_Visitlog_Visitlog1.ACCOUNT_ID, sFilter_AccountFrom, sMonthStart, sMonthEnd);


        if (DS.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow DR in DS.Tables[0].Rows)
            {
                if (Convert.ToInt32(DR["COUNT"]) != 0)
                {
                    ChartSeriesItem CSI = new ChartSeriesItem();
                    CSI.YValue = Convert.ToDouble(DR["COUNT"]);
                    CSI.Label.TextBlock.Text = DR["ITEM_TEXT"].ToString() + " (" + DR["COUNT"].ToString() + ")";
                    CSI.XValue = 1;
                    RadChart_PAL_Intensity.Series[0].AddItem(CSI);
                }

            }
        }

    }


    private void fillRadChart_DD_Totals(string sXAxisValue, string sFromDate, string sFilter_AccountFrom)
    {
        DateTime dtMonthStart = Convert.ToDateTime(sFromDate);
        string sMonthStart = dtMonthStart.ToString("MM/01/yyyy");
        string sMonthEnd = dtMonthStart.AddMonths(1).AddSeconds(-1).ToString();


          //insert the new xaxis coordinate
            string sXAxisText = dtMonthStart.ToString("MMM yy");
            ChartAxisItem CAI = new ChartAxisItem();
            CAI.Value = Convert.ToDecimal(sXAxisValue);
            CAI.TextBlock.Text = sXAxisText;// dtCurrent.AddDays(-giChartDaySpan).ToString("MMM d");
            CAI.Appearance.RotationAngle = 0;
            CAI.Appearance.Position.AlignedPosition = Telerik.Charting.Styles.AlignedPositions.Top;
            RadChart_DD_Totals.PlotArea.XAxis.Items.Add(CAI);

        
        DataSet DS = objBackofficeClass.GET_Items_AnyItemTable("Type", "LIST_DD");

        RadChart_DD_Totals.Series[0].Name = DS.Tables[0].Rows[0]["ITEM_TEXT"].ToString();
        RadChart_DD_Totals.Series[1].Name = DS.Tables[0].Rows[1]["ITEM_TEXT"].ToString();
        RadChart_DD_Totals.Series[2].Name = DS.Tables[0].Rows[2]["ITEM_TEXT"].ToString();
        RadChart_DD_Totals.Series[3].Name = DS.Tables[0].Rows[3]["ITEM_TEXT"].ToString();
        RadChart_DD_Totals.Series[4].Name = DS.Tables[0].Rows[4]["ITEM_TEXT"].ToString();
        RadChart_DD_Totals.Series[5].Name = DS.Tables[0].Rows[5]["ITEM_TEXT"].ToString();
        RadChart_DD_Totals.Series[6].Name = DS.Tables[0].Rows[6]["ITEM_TEXT"].ToString();

        DS = objReportClass.Rpt_REPORT_ListDd_Type(sMonthStart, sMonthEnd, UC_Visitlog_Visitlog1.ACCOUNT_ID, sFilter_AccountFrom);

       // if (DS.Tables[0].Rows.Count > 0 && Convert.ToDateTime(sMonthStart) < DateTime.Now)
        {
            DataRow DR = DS.Tables[0].Rows[0];

            ChartSeriesItem CSI = new ChartSeriesItem();
            
            CSI.YValue = Convert.ToDouble(DR["AVG_TOTAL_FIELD_01"]);
            CSI.XValue = Convert.ToDouble(sXAxisValue);
            RadChart_DD_Totals.Series[0].AddItem(CSI);

            CSI = new ChartSeriesItem();
            CSI.YValue = Convert.ToDouble(DR["AVG_TOTAL_FIELD_02"]);
            CSI.XValue = Convert.ToDouble(sXAxisValue);
            RadChart_DD_Totals.Series[1].AddItem(CSI);

            CSI = new ChartSeriesItem();
            CSI.YValue = Convert.ToDouble(DR["AVG_TOTAL_FIELD_03"]);
            CSI.XValue = Convert.ToDouble(sXAxisValue);
            RadChart_DD_Totals.Series[2].AddItem(CSI);

            CSI = new ChartSeriesItem();
            CSI.YValue = Convert.ToDouble(DR["AVG_TOTAL_FIELD_04"]);
            CSI.XValue = Convert.ToDouble(sXAxisValue);
            RadChart_DD_Totals.Series[3].AddItem(CSI);

            CSI = new ChartSeriesItem();
            CSI.YValue = Convert.ToDouble(DR["AVG_TOTAL_FIELD_05"]);
            CSI.XValue = Convert.ToDouble(sXAxisValue);
            RadChart_DD_Totals.Series[4].AddItem(CSI);

            CSI = new ChartSeriesItem();
            CSI.YValue = Convert.ToDouble(DR["AVG_TOTAL_FIELD_06"]);
            CSI.XValue = Convert.ToDouble(sXAxisValue);
            RadChart_DD_Totals.Series[5].AddItem(CSI);

            CSI = new ChartSeriesItem();
            CSI.YValue = Convert.ToDouble(DR["AVG_TOTAL_FIELD_07"]);
            CSI.XValue = Convert.ToDouble(sXAxisValue);
            RadChart_DD_Totals.Series[6].AddItem(CSI);

        }
    }


    private void fillRadChart_DD_LVTotals(string sXAxisValue, string sFromDate, string sFilter_AccountFrom)
    {


        DateTime dtMonthStart = Convert.ToDateTime(sFromDate);
        string sMonthStart = dtMonthStart.ToString("MM/01/yyyy");
        string sMonthEnd = dtMonthStart.AddMonths(1).AddSeconds(-1).ToString();


        //insert the new xaxis coordinate
        string sXAxisText = dtMonthStart.ToString("MMM yy");
        ChartAxisItem CAI = new ChartAxisItem();
        CAI.Value = Convert.ToDecimal(sXAxisValue);
        CAI.TextBlock.Text = sXAxisText;// dtCurrent.AddDays(-giChartDaySpan).ToString("MMM d");
        CAI.Appearance.RotationAngle = 0;
        CAI.Appearance.Position.AlignedPosition = Telerik.Charting.Styles.AlignedPositions.Top;
        RadChart_DD_LVTotals.PlotArea.XAxis.Items.Add(CAI);

        DataSet DS = objBackofficeClass.GET_Items_AnyItemTable("LVType", "LIST_DD");

        RadChart_DD_LVTotals.Series[0].Name = DS.Tables[0].Rows[0]["ITEM_TEXT"].ToString();
        RadChart_DD_LVTotals.Series[1].Name = DS.Tables[0].Rows[1]["ITEM_TEXT"].ToString();

        DS = objReportClass.Rpt_REPORT_ListDd_LVType(sMonthStart, sMonthEnd, UC_Visitlog_Visitlog1.ACCOUNT_ID, sFilter_AccountFrom);

      //  if (DS.Tables[0].Rows.Count > 0 && Convert.ToDateTime(sMonthStart) < DateTime.Now)
        {
            DataRow DR = DS.Tables[0].Rows[0];

            ChartSeriesItem CSI = new ChartSeriesItem();
            CSI.YValue = Convert.ToDouble(DR["AVG_LV_FIELD_01"]);
            CSI.XValue = Convert.ToDouble(sXAxisValue);
            RadChart_DD_LVTotals.Series[0].AddItem(CSI);

            CSI = new ChartSeriesItem();
            CSI.YValue = Convert.ToDouble(DR["AVG_LV_FIELD_02"]);
            CSI.XValue = Convert.ToDouble(sXAxisValue);
            RadChart_DD_LVTotals.Series[1].AddItem(CSI);


        }
    }


    private void fillRadChart_DD_TotalsCount(string sXAxisValue, string sFromDate, string sFilter_AccountFrom)
    {
        DateTime dtMonthStart = Convert.ToDateTime(sFromDate);
        string sMonthStart = dtMonthStart.ToString("MM/01/yyyy");
        string sMonthEnd = dtMonthStart.AddMonths(1).AddSeconds(-1).ToString();


        //insert the new xaxis coordinate
        string sXAxisText = dtMonthStart.ToString("MMM yy");
        ChartAxisItem CAI = new ChartAxisItem();
        CAI.Value = Convert.ToDecimal(sXAxisValue);
        CAI.TextBlock.Text = sXAxisText;// dtCurrent.AddDays(-giChartDaySpan).ToString("MMM d");
        CAI.Appearance.RotationAngle = 0;
        CAI.Appearance.Position.AlignedPosition = Telerik.Charting.Styles.AlignedPositions.Top;
        RadChart_DD_TotalsCount.PlotArea.XAxis.Items.Add(CAI);

        DataSet DS = objBackofficeClass.GET_Items_AnyItemTable("LVType", "LIST_DD");

        //RadChart_DD_LVTotals.Series[0].Name = DS.Tables[0].Rows[0]["ITEM_TEXT"].ToString();

        DS = objReportClass.Rpt_REPORT_ListDd_LVType(sMonthStart, sMonthEnd, UC_Visitlog_Visitlog1.ACCOUNT_ID, sFilter_AccountFrom);

       // if (DS.Tables[0].Rows.Count > 0 && Convert.ToDateTime(sMonthStart) < DateTime.Now)
        {
            DataRow DR = DS.Tables[0].Rows[0];

            ChartSeriesItem CSI = new ChartSeriesItem();
            CSI.YValue = Convert.ToDouble(DR["Count"]);
            CSI.XValue = Convert.ToDouble(sXAxisValue);
            RadChart_DD_TotalsCount.Series[0].AddItem(CSI);
        }
    }


   

    protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        //fillOutMonths();
    }

    protected void cblFilter_SelectedIndexChanged(object sender, EventArgs e)
    {
        //fillOutMonths();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        fillOutForm(1);
    }
    protected void btnAll_Click(object sender, EventArgs e)
    {
        DateTime dtStart = Convert.ToDateTime("1/1/" + ddlYear.SelectedValue);
        DateTime dtEnd = Convert.ToDateTime("12/31/" + ddlYear.SelectedValue);

        rdpDateStart.SelectedDate = dtStart;
        rdpDateEnd.SelectedDate = dtEnd;
        fillOutForm(1);
    }
   
    protected void btnMonth_Click(object sender, EventArgs e)
    {
        DateTime dtStart = Convert.ToDateTime(txtMonth.Text + "/1/" + ddlYear.SelectedValue);
        DateTime dtEnd = dtStart.AddMonths(1).AddDays(-1);

        rdpDateStart.SelectedDate = dtStart;
        rdpDateEnd.SelectedDate = dtEnd;
        fillOutForm(1);
    }

    /*Following function is added by Netsmartz for adding the css path at runtime*/
    protected override void OnInit(EventArgs e)
    {

        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Main.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Table.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Grid.css\" />"));

        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound3.css\" />"));

        base.OnInit(e);

    }
}
