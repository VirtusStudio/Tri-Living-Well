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

public partial class Report_CompanyCurrentStatus : System.Web.UI.Page
{
    int DDL_YEARS = 10;

    SqlConnClass objSqlConnClass = new SqlConnClass();
    ReportClass objReportClass;
    
    int giYearCurrent = 0;
    int giMonthCurrent = 0;
    protected string strBaseSiteUrl;
    protected void Page_Load(object sender, EventArgs e)
    {
        strBaseSiteUrl = AppConfig.GetBaseSiteUrl();
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

    private void fillGrids(int iMode)
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

        /*RadGrid1.MasterTableView.Caption = "<b>Transaction Report: </b>";
        if (sFromDate != "" && sToDate != "")
        {
            RadGrid1.MasterTableView.Caption += "<b>" + Convert.ToDateTime(sFromDate).ToString("M/d/yyyy") + "&nbsp;-&nbsp;" + Convert.ToDateTime(sToDate).ToString("M/dd/yyyy") + "</b>";
        }
        RadGrid1.MasterTableView.Caption += "<br /><br />";
        if (sEventID != "")
        {
            RadGrid1.MasterTableView.Caption += "<b>EventID: " + sEventID + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VCI Job#: " + sVciJobID + "</b><br /><br />";
        }
       */
        DataSet DS = objReportClass.Rpt_REPORT_ProgramLevel(UC_Visitlog_Visitlog1.ACCOUNT_ID, sFilter_AccountFrom);
        RadGrid1.DataSource = DS;
        RadGrid1.DataBind();
    }

    private void fillOutForm()
    {
        DataSet DS = objReportClass.Rpt_GET_vwAccountParticipants("1");
        int iNumParticipantsMainRegistered = Convert.ToInt32(DS.Tables[0].Rows[0]["NUM_PARTICIPANTS_MAIN_REGISTERED"]);
        int iNumParticipantsMainUnregistered = Convert.ToInt32(DS.Tables[0].Rows[0]["NUM_PARTICIPANTS_MAIN_UNREGISTERED"]);
        int iNumParticipantsExtendedRegistered = Convert.ToInt32(DS.Tables[0].Rows[0]["NUM_PARTICIPANTS_EXTENDED_REGISTERED"]);
        int iNumParticipantsExtendedUnregistered = Convert.ToInt32(DS.Tables[0].Rows[0]["NUM_PARTICIPANTS_EXTENDED_UNREGISTERED"]);

        lblNumParticipantsMainRegistered.Text = iNumParticipantsMainRegistered.ToString();
        lblNumParticipantsMainUnregistered.Text = iNumParticipantsMainUnregistered.ToString();
        lblNumParticipantsExtendedRegistered.Text = iNumParticipantsExtendedRegistered.ToString();
        lblNumParticipantsExtendedUnregistered.Text = iNumParticipantsExtendedUnregistered.ToString();
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
        fillGrids(1);
        fillOutForm();
    }
    protected void btnAll_Click(object sender, EventArgs e)
    {
        DateTime dtStart = Convert.ToDateTime("1/1/" + ddlYear.SelectedValue);
        DateTime dtEnd = Convert.ToDateTime("12/31/" + ddlYear.SelectedValue);

        rdpDateStart.SelectedDate = dtStart;
        rdpDateEnd.SelectedDate = dtEnd;
        fillGrids(1);
    }
   
    protected void btnMonth_Click(object sender, EventArgs e)
    {
        DateTime dtStart = Convert.ToDateTime(txtMonth.Text + "/1/" + ddlYear.SelectedValue);
        DateTime dtEnd = dtStart.AddMonths(1).AddDays(-1);

        rdpDateStart.SelectedDate = dtStart;
        rdpDateEnd.SelectedDate = dtEnd;
        fillGrids(1);
        fillOutForm();
    }

    protected void RadGrid1_SortCommand(object source, GridSortCommandEventArgs e)
    {
        fillGrids(2);
    }

    double[] gdStep = new double[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };//ignore gdStep[0]. gdStep[1] refers to (STEP_1)
    double gdCompletion = 0;
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridFooterItem)
        {
            //steps 1-13
            for (int i = 1; i <= 13; i++)
            {
                TableCell cell = ((GridFooterItem)e.Item)["tcStep" + i.ToString()];
                cell.Style.Add("text-align", "center");
                if (gdStep[i] == 0)
                {
                    cell.CssClass = "empty";
                }
                else
                {
                    cell.Style.Add("font-weight", "bold");
                }
                Label lbl = new Label();
                lbl.Text = gdStep[i].ToString();
                cell.Controls.Add(lbl);
            }

            //Completion
            TableCell cellCompletion = ((GridFooterItem)e.Item)["tcCompletion"];
            cellCompletion.Style.Add("text-align", "center");
            if (gdCompletion == 0)
            {
                cellCompletion.CssClass = "empty";
            }
            else
            {
                cellCompletion.Style.Add("font-weight", "bold");
            }
            Label lblCompletion = new Label();
            lblCompletion.Text = gdCompletion.ToString();
            cellCompletion.Controls.Add(lblCompletion);

            //TOTALS
            TableCell cellTotals = ((GridFooterItem)e.Item)["PROGRAM_NAME"];
            cellTotals.Style.Add("font-weight", "bold");
            Label lblTotals = new Label();
            lblTotals.Text = "Totals";
            cellTotals.Controls.Add(lblTotals);
        }

        if (e.Item is GridDataItem)
        {
            //steps 1-13
            for (int i = 1; i <= 13; i++)
            {
                gdStep[i] += Convert.ToDouble((e.Item as GridDataItem)["STEP_" + i.ToString()].Text);
            }

            //Completion
            gdCompletion += Convert.ToDouble((e.Item as GridDataItem)["Completion"].Text);

            string sLevelID = (e.Item as GridDataItem)["LEVEL_ID"].Text;
            if (sLevelID == "1")//tri
            {
                e.Item.Style.Add("background-color", "#ff9999");
            }
            else if (sLevelID == "2")//living
            {
                e.Item.Style.Add("background-color", "#ffdd99");
            }
            else if (sLevelID == "3")//well
            {
                e.Item.Style.Add("background-color", "#ffff99");
            }

        }
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
