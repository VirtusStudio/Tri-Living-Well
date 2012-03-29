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

public partial class Report_SlideCommnets : System.Web.UI.Page
{
    int DDL_YEARS = 10;

    int giYearCurrent = 0;
    int giMonthCurrent = 0;

    string gsUserID = "";


    SqlConnClass objSqlConnClass = new SqlConnClass();
    PALClass objPALClass;

    protected void Page_Load(object sender, EventArgs e)
    {
        objPALClass = new PALClass(objSqlConnClass.OpenConnection());

        giYearCurrent = System.DateTime.Now.Year;
        giMonthCurrent = System.DateTime.Now.Month;

        lblError.Visible = false;
        gsUserID = Membership.GetUser().ProviderUserKey.ToString();

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
        initDropDowns();
        if (ddlYear.Items.Count > 0)
        {
            ddlYear.Text = giYearCurrent.ToString();
            initDates();
        }

    }
    private void initDropDowns()
    {
        //fill years
        for (int i = 0; i < DDL_YEARS; i++)
        {
            if (giYearCurrent - i < 2008)
            {
                break;
            }
            ListItem li = new ListItem();
            li.Value = (giYearCurrent - i).ToString();
            li.Text = (giYearCurrent - i).ToString();
            ddlYear.Items.Add(li);
        }


    }

    private void initDates()
    {
        //This is where we decide if defualt is year or month

        //DateTime dtStart = Convert.ToDateTime("1/1/" + ddlYear.SelectedValue);
        //DateTime dtEnd = dtStart.AddYears(1).AddDays(-1);

        DateTime dtStart = Convert.ToDateTime(giMonthCurrent.ToString() + "/1/" + ddlYear.SelectedValue);
        DateTime dtEnd = dtStart.AddMonths(1).AddDays(-1);

        rdpDateStart.SelectedDate = dtStart;
        rdpDateEnd.SelectedDate = dtEnd;
    }

    private void fillGrids(int iMode)
    {


        string sUserName = "";
        string sSlideID = "";
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

        //Response.Write("sSlideID: " + sSlideID + "sUserName: " + sUserName + "sFromDate: " + sFromDate + "sToDate: " + sToDate);



            RadGrid1.MasterTableView.Caption = "<b>Exercise History: " + Convert.ToDateTime(sFromDate).ToString("M/d/yyyy") + "&nbsp;-&nbsp;" + Convert.ToDateTime(sToDate).ToString("M/dd/yyyy") + "</b><br /><br /><b>Username: " + sUserName + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Slide: " + sSlideID + "</b><br /><br />";
            RadGrid1.DataSource = objPALClass.PAL_GET_PalEntries_BY_UserId(gsUserID, sFromDate, sToDate);
           // RadGrid1.DataSource = objPALClass.Sld_GET_SlideComments("", "", sSlideID, sCommaExcludedUsernames);
      
        if (RadGrid1.DataSource != null)
        {
            RadGrid1.DataBind();
        }
    }

    protected void ddlSlideID_SelectedIndexChanged(object sender, EventArgs e)
    {
       // fillOutForm();
    }


    protected void btnMonth_Click(object sender, EventArgs e)
    {
        DateTime dtStart = Convert.ToDateTime(txtMonth.Text + "/1/" + ddlYear.SelectedValue);
        DateTime dtEnd = dtStart.AddMonths(1).AddDays(-1);

        fillGrids(1);
    }

    protected void btnAll_Click(object sender, EventArgs e)
    {
        DateTime dtStart = Convert.ToDateTime("1/1/" + ddlYear.SelectedValue);
        DateTime dtEnd = Convert.ToDateTime("12/31/" + ddlYear.SelectedValue);

        rdpDateStart.SelectedDate = dtStart;
        rdpDateEnd.SelectedDate = dtEnd;

        fillGrids(1);
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        fillGrids(1);
    }

    protected void RadGrid1_SortCommand(object source, GridSortCommandEventArgs e)
    {
        fillGrids(2);
    }


    protected void lbExcel2003_Click(object sender, EventArgs e)
    {
        string sFilename = "SurveyAnswers" + System.DateTime.Now.ToString("MMddyyhhmmss") + ".xls";

        if (ViewState["sFromDate"] != null)
        {
            fillGrids(2);

            RadGrid1.Columns.FindByUniqueName("tcTEXT_1").Visible = false;
            RadGrid1.Columns.FindByUniqueName("tcTEXT_2").Visible = false;
            RadGrid1.Columns.FindByUniqueName("tcTEXT_3").Visible = false;

            RadGrid1.Columns.FindByUniqueName("tcTEXT_1_Excel").Visible = true;
            RadGrid1.Columns.FindByUniqueName("tcTEXT_2_Excel").Visible = true;
            RadGrid1.Columns.FindByUniqueName("tcTEXT_3_Excel").Visible = true;

            RadGrid1.GridLines = GridLines.Both;
            RadGrid1.MasterTableView.ExportToExcel();

            Response.AppendHeader("Content-Type", "application/vnd.ms-excel");
            Response.AppendHeader("Content-disposition", "attachment; filename=" + sFilename);
        }
        else
        {
            lblError.Visible = true;
            lblError.Text = "Submit a search before exporting to Excel.";
            //lblExcelError.
        }
    }
    protected void lbExcel2007_Click(object sender, EventArgs e)
    {
        string sFilename = "SurveyAnswers" + System.DateTime.Now.ToString("MMddyyhhmmss") + ".xls";


        if (ViewState["sFromDate"] != null)
        {
            fillGrids(2);

            RadGrid1.Columns.FindByUniqueName("tcTEXT_1").Visible = false;
            RadGrid1.Columns.FindByUniqueName("tcTEXT_2").Visible = false;
            RadGrid1.Columns.FindByUniqueName("tcTEXT_3").Visible = false;

            RadGrid1.Columns.FindByUniqueName("tcTEXT_1_Excel").Visible = true;
            RadGrid1.Columns.FindByUniqueName("tcTEXT_2_Excel").Visible = true;
            RadGrid1.Columns.FindByUniqueName("tcTEXT_3_Excel").Visible = true;

            RadGrid1.GridLines = GridLines.Both;
            RadGrid1.MasterTableView.ExportToExcel();

            Response.AppendHeader("Content-Type", "application/vnd.ms-excel");
            Response.AppendHeader("Content-disposition", "attachment; filename=" + sFilename);
        }
        else
        {
            lblError.Visible = true;
            lblError.Text = "Submit a search before exporting to Excel.";
            //lblExcelError.
        }
    }

}