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
using System.Drawing;

public partial class Report_CompanyMonthlyDetail : System.Web.UI.Page
{
    string sOrganization = "Blue Grotto Technologies";
    int DDL_YEARS = 10;

    SqlConnClass objSqlConnClass = new SqlConnClass();
    ReportClass objReportClass;
    
    int giYearCurrent = 0;
    int giMonthCurrent = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        objReportClass = new ReportClass(objSqlConnClass.sqlConnection);
        
        giYearCurrent = System.DateTime.Now.Year;
        giMonthCurrent = System.DateTime.Now.Month;
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            init();
        }

        objSqlConnClass.CloseConnection();
    }
    private void init()
    {
        fillOutMonths();

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
    private void fillOutMonths()
    {
        /*
        for (int i = 1; i < 13; i++)//reset each lblMonth to 0;
        {
            Label lbl = (Label)this.FindControl("lblMonth" + i.ToString());
            lbl.Text = "0";
            lbl.CssClass += " empty";
        }

        string sOnlyNotChargedFlg = "0";//this will search for any/all transactions


        // 0 = this will search the dates by EVENT_INFO.DATE_START and DATE_END
        // 1 = this will search the dates by EVENT_INFO.DATE_SUBMITED
        string sDateSubmittedFlg = cblFilter.SelectedValue;

        string sName = "";


        DateTime dtStart = Convert.ToDateTime("1/1/" + ddlYear.SelectedValue);
        DataSet DS = objEventClass.Evt_SEARCH_EventInfo(sName, sOnlyNotChargedFlg, sDateSubmittedFlg, dtStart.ToString(), dtStart.AddYears(1).AddSeconds(-1).ToString());

        int stop = DS.Tables[0].Rows.Count;
        int iTotal = 0;

        for (int i = 0; i < stop; i++)
        {// get the label by the month index
            if(sDateSubmittedFlg == "0")
            {
                if (Convert.ToDateTime(DS.Tables[0].Rows[i]["DATE_START"].ToString()).ToString("yyyy") == ddlYear.SelectedValue)
                {
                    string sMonthIndex = Convert.ToInt32(Convert.ToDateTime(DS.Tables[0].Rows[i]["DATE_START"].ToString()).ToString("MM")).ToString();
                    Label lbl = (Label)this.FindControl("lblMonth" + sMonthIndex);
                    lbl.Text = (Convert.ToInt32(lbl.Text) + 1).ToString();
                    lbl.CssClass = lbl.CssClass.Replace(" empty", "");

                    iTotal++;
                }
            }
            else//we searched on DATE_SUBMITTED
            {
                if (Convert.ToDateTime(DS.Tables[0].Rows[i]["DATE_SUBMITTED"].ToString()).ToString("yyyy") == ddlYear.SelectedValue)
                {
                    string sMonthIndex = Convert.ToInt32(Convert.ToDateTime(DS.Tables[0].Rows[i]["DATE_SUBMITTED"].ToString()).ToString("MM")).ToString();
                    Label lbl = (Label)this.FindControl("lblMonth" + sMonthIndex);
                    lbl.Text = (Convert.ToInt32(lbl.Text) + 1).ToString();
                    lbl.CssClass = lbl.CssClass.Replace(" empty", "");

                    iTotal++;
                }
            }
        }

        lblTotal.Text = iTotal.ToString();     
         */ 
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

        RadChart_PAL_Enrties.Chart.Series[0].Items.Clear();
        RadChart_PAL_Enrties.Chart.PlotArea.XAxis.Items.Clear();

        fillRadChart_PAL_Enrties("1", Convert.ToDateTime(sFromDate).AddMonths(-1).ToString(), sFilter_AccountFrom);
        fillRadChart_PAL_Enrties("2", Convert.ToDateTime(sFromDate).AddMonths(0).ToString(), sFilter_AccountFrom);
        fillRadChart_PAL_Enrties("3", Convert.ToDateTime(sFromDate).AddMonths(1).ToString(), sFilter_AccountFrom);


        RadChart_PAL_Average_MET.Chart.Series[0].Items.Clear();
        RadChart_PAL_Average_MET.Chart.PlotArea.XAxis.Items.Clear();

        fillRadChart_PAL_Average_MET("1", Convert.ToDateTime(sFromDate).AddMonths(-1).ToString(), sFilter_AccountFrom);
        fillRadChart_PAL_Average_MET("2", Convert.ToDateTime(sFromDate).AddMonths(0).ToString(), sFilter_AccountFrom);
        fillRadChart_PAL_Average_MET("3", Convert.ToDateTime(sFromDate).AddMonths(1).ToString(), sFilter_AccountFrom);


        fillRadChart_PAL_Duration(Convert.ToDateTime(sFromDate).AddMonths(0).ToString(),  sFilter_AccountFrom);
        fillRadChart_PAL_Intensity(Convert.ToDateTime(sFromDate).AddMonths(0).ToString(),  sFilter_AccountFrom);
        fillRadChart_PAL_Time(Convert.ToDateTime(sFromDate).AddMonths(0).ToString(),  sFilter_AccountFrom);
        fillRadChart_PAL_Type(Convert.ToDateTime(sFromDate).AddMonths(0).ToString(),  sFilter_AccountFrom);

        
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
            RadChart_PAL_Enrties.Series[0].AddItem(CSI1);

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
            RadChart_PAL_Average_MET.Series[0].AddItem(CSI);

            sFromDate = Convert.ToDateTime(sFromDate).AddMonths(1).ToString();
        
    }


    private void fillRadChart_PAL_Duration(string sFromDate, string sFilter_AccountFrom)
    {

        RadChart_PAL_Duration.Chart.Series[0].Items.Clear();

        DateTime dtMonthStart = Convert.ToDateTime(sFromDate);
        string sMonthStart = dtMonthStart.ToString("MM/01/yyyy");
        string sMonthEnd = dtMonthStart.AddMonths(1).AddSeconds(-1).ToString();


        DataSet DS = objReportClass.Rpt_REPORT_ListPal_Duration(UC_Visitlog_Visitlog1.ACCOUNT_ID, sFilter_AccountFrom, sMonthStart, sMonthEnd);

        //12 possible colors
        Color[] MainColor = new Color[] {   Color.LightGoldenrodYellow, Color.LightGray, Color.LightCyan, Color.YellowGreen, Color.LightSkyBlue,  Color.Violet,      Color.Orange,    Color.Khaki,         Color.DeepPink, Color.LightGreen, Color.LightBlue, Color.LightPink};
        Color[] SecondColor = new Color[] { Color.Goldenrod,            Color.DarkGray,  Color.Cyan,      Color.Honeydew,    Color.SlateBlue,     Color.Purple,      Color.OrangeRed, Color.Tan,           Color.Red,      Color.Green,      Color.Blue,      Color.Pink};
        Color[] TextColor = new Color[] {   Color.DarkGoldenrod,        Color.Gray,      Color.DarkCyan,  Color.Olive,       Color.DarkSlateBlue, Color.DarkViolet,  Color.Red,       Color.DarkSlateGray, Color.Maroon,   Color.DarkGreen,  Color.DarkBlue,  Color.DeepPink};

        if (DS.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < DS.Tables[0].Rows.Count; i++)
            {
                if (Convert.ToInt32(DS.Tables[0].Rows[i]["COUNT"]) != 0)
                {
                    ChartSeriesItem CSI = new ChartSeriesItem();
                    CSI.YValue = Convert.ToDouble(DS.Tables[0].Rows[i]["COUNT"]);
                    CSI.Label.TextBlock.Text = DS.Tables[0].Rows[i]["ITEM_TEXT"].ToString() + " (" + DS.Tables[0].Rows[i]["COUNT"].ToString() + ")";
                    CSI.Label.TextBlock.Appearance.TextProperties.Font = new Font("Arial", 7);
                    CSI.XValue = 1;

                    //layout
                    CSI.Appearance.FillStyle.MainColor = MainColor[i];
                    CSI.Appearance.FillStyle.SecondColor = SecondColor[i];
                    CSI.Appearance.FillStyle.FillType = Telerik.Charting.Styles.FillType.Gradient;
                    CSI.Label.TextBlock.Appearance.TextProperties.Color = TextColor[i];

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

}
