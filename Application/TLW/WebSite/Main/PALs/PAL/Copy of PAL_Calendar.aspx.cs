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
using Mediachase.Web.UI.WebControls;
using System.IO;

public partial class PAL_Calendar : System.Web.UI.Page
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    PALClass objPALClass;

    string gsUserID = "";
    string gsPalCalendarAdd = "";
    string gsPalCalendarEdit = "";
    string gsPalCalendarDefault = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        objPALClass = new PALClass(objSqlConnClass.OpenConnection());

        gsUserID = Membership.GetUser().ProviderUserKey.ToString();

        gsPalCalendarAdd = readFromFile("/Layouts/PAL_Calendar/PAL_Calendar_Add.htm");
        gsPalCalendarEdit = readFromFile("/Layouts/PAL_Calendar/PAL_Calendar_Edit.htm");
        gsPalCalendarDefault = readFromFile("/Layouts/PAL_Calendar/PAL_Calendar_Default.htm");
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        {
            fillOutForm();
        }

        objSqlConnClass.CloseConnection();
    }
    private void fillOutForm()
    {
        fillCalendar(System.DateTime.Now);
    }

    private void fillCalendar(DateTime dtDate)
    {
        RadCalendar1.SpecialDays[0].Date = System.DateTime.Now;
    }

    protected void RadCalendar1_DayRender(object sender, Telerik.Web.UI.Calendar.DayRenderEventArgs e)
    {
        Telerik.Web.UI.Calendar.View.MonthView monthView = (Telerik.Web.UI.Calendar.View.MonthView)RadCalendar1.CalendarView;

        if (e.Day.Date >= monthView.MonthStartDate.AddDays(-7) && e.Day.Date <= monthView.MonthEndDate.AddDays(13))
        {
            bool bHasData = false;
            foreach (DataRow DR in objPALClass.PAL_GET_PalEntries_BY_UserId(gsUserID, monthView.MonthStartDate.AddDays(-7).ToString(), monthView.MonthEndDate.AddDays(13).ToString()).Tables[0].Rows)
            {
                if (e.Day.Date == Convert.ToDateTime(DR["PAL_ENTRY_DATE"]))
                {
                    bHasData = true;
                    e.Cell.Text = gsPalCalendarEdit;
                    e.Cell.Text = e.Cell.Text.Replace("#DAY#", e.Day.Date.Day.ToString());
                    e.Cell.Text = e.Cell.Text.Replace("#PAL_ENTRY_DATE#", DR["PAL_ENTRY_DATE"].ToString());
                    e.Cell.Text = e.Cell.Text.Replace("#PAL_ENTRY_ID#", DR["PAL_ENTRY_ID"].ToString());
                    e.Cell.Text = e.Cell.Text.Replace("#PAL_ENTRY_TYPE#", DR["PAL_ENTRY_TYPE"].ToString());
                    e.Cell.Text = e.Cell.Text.Replace("#PAL_ENTRY_TYPE_TEXT#", DR["PAL_ENTRY_TYPE_TEXT"].ToString());
                    e.Cell.Text = e.Cell.Text.Replace("#PAL_ENTRY_INTENSITY#", DR["PAL_ENTRY_INTENSITY"].ToString());
                    e.Cell.Text = e.Cell.Text.Replace("#PAL_ENTRY_INTENSITY_TEXT#", DR["PAL_ENTRY_INTENSITY_TEXT"].ToString());
                    e.Cell.Text = e.Cell.Text.Replace("#MET_EQUIVALENT#", "<span style='color:maroon;  background-color:White;'>" + DR["MET_EQUIVALENT"].ToString() + " METs </span>");
                    break;
                }
            }
            if (!bHasData)
            {
                if (e.Day.Date > DateTime.Now)//it's in the future
                {
                    e.Cell.Text = gsPalCalendarDefault;
                    e.Cell.Text = e.Cell.Text.Replace("#DAY#", e.Day.Date.Day.ToString()); 
                }
                else//allow them to add days
                {
                    e.Cell.Text = gsPalCalendarAdd;
                    e.Cell.Text = e.Cell.Text.Replace("#DAY#", e.Day.Date.Day.ToString());
                    e.Cell.Text = e.Cell.Text.Replace("#DATE#", e.Day.Date.ToString("MM/dd/yyyy"));
                }
            }
        }
    }

    private string readFromFile(string sVirtualPath)
    {
        StreamReader SR = new StreamReader(Server.MapPath(sVirtualPath));
        string sResult = SR.ReadToEnd();
        SR.Close();

        return sResult;
    }

    protected void RadCalendar1_SelectionChanged(object sender, Telerik.Web.UI.Calendar.SelectedDatesEventArgs e)
    {

    }
}
