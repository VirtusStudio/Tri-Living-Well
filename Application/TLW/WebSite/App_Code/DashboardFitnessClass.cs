using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
//using System.Web.Security;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Web.UI.WebControls.WebParts;
//using System.Web.UI.HtmlControls;




/// <summary>
/// Summary description for DashboardFitnessClass
/// </summary>
public class DashboardFitnessClass
{
    public SqlConnection m_Connection { get; set; }
    public SqlCommand m_Command { get; set; }
    public SqlDataAdapter m_DataAdapter { get; set; }
    public DataSet m_DataSet { get; set; }
    public string m_sUserId { get; set; }
    public int m_iWeeklyTotalMets { get; set; }
    public DateTime m_dtLastWorkout { get; set; }
    public string m_sLastWorkout { get; set; }
    public string m_sWorkoutHistory { get; set; }
    public string m_sCurrentProgram { get; set; }
    public string m_sCurrentStage { get; set; }
    public int m_iCurrentStep { get; set; }
    public string m_sTriangleImage { get; set; }
    public string m_sStepImage { get; set; }
    public string m_sProgressNumberLeft { get; set; }
    public string m_sProgressMarkerLeft { get; set; }

    public struct MetsTriangle
    {
	    public string image;
	    public string numberLeftPos;
	    public string markerLeftPos;
    };


    public DashboardFitnessClass(SqlConnection objSQLConnection, string sUserId)
	{
        try
        {
            m_Connection = objSQLConnection;
            m_sUserId = sUserId;
            m_DataSet = new DataSet();
            FillMembers();
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
    }

    private void FillMembers()
    {
        DateTime dtDay1 = DateTime.MinValue;
        DateTime dtDay2 = DateTime.MinValue;
        DateTime dtDay3 = DateTime.MinValue;
        DateTime dtDay4 = DateTime.MinValue;
        DateTime dtDay5 = DateTime.MinValue;
        DateTime dtDay6 = DateTime.MinValue;
        DateTime dtDay7 = DateTime.MinValue;
        DateTime today = DateTime.Now.Date;
        DateTime lastWeek = today.AddDays(-7).Date;

        string sToday = today.Month.ToString() + "/" + today.Day.ToString() + "/" + today.Year.ToString();
        string sLastWeek = lastWeek.Month.ToString() + "/" + lastWeek.Day.ToString() + "/" + lastWeek.Year.ToString();

        // Testing - this guy has data
        // AA1F476C-6628-4934-BE8C-47FB1DFAD2A8
        // 2009-01-20 00:00:00.000
        // 2009-01-28 00:00:00.000
        // m_sUserId = "AA1F476C-6628-4934-BE8C-47FB1DFAD2A8";
        // sLastWeek = "1/20/2009";
        // sToday = "1/28/2009";

        // get the dates
        PALClass objPALClass = new PALClass(m_Connection);
        DataSet entries = objPALClass.PAL_GET_PalEntries_BY_UserId(m_sUserId, sLastWeek, sToday);
        int tableCount = entries.Tables.Count;
        int rowsCount = entries.Tables[0].Rows.Count;
        int properIndex = rowsCount;
        if (tableCount > 0 && rowsCount > 0)
        {
            foreach (DataRow DR in entries.Tables[0].Rows)
            {                
                if( !Convert.IsDBNull(DR["PAL_ENTRY_DATE"])  ) {

                    DateTime dtDr = Convert.ToDateTime(DR["PAL_ENTRY_DATE"].ToString()).Date;
                     
                    if( properIndex == 1 && dtDay1 == DateTime.MinValue) {
                        dtDay1 = dtDr;
                    }
                    if (properIndex == 2 && dtDay2 == DateTime.MinValue) {
                        dtDay2 = dtDr;
                    }
                    if (properIndex == 3 && dtDay3 == DateTime.MinValue) {
                        dtDay3 = dtDr;
                    }
                    if (properIndex == 4 && dtDay4 == DateTime.MinValue) {
                        dtDay4 = dtDr;
                    }
                    if (properIndex == 5 && dtDay5 == DateTime.MinValue) {
                        dtDay5 = dtDr;
                    }
                    if (properIndex == 6 && dtDay6 == DateTime.MinValue) {
                        dtDay6 = dtDr;
                    }
                    if (properIndex == 7 && dtDay7 == DateTime.MinValue) {
                        dtDay7 = dtDr;
                    }
                    properIndex--;
                }
                if( !Convert.IsDBNull(DR["MET_EQUIVALENT"]) ) m_iWeeklyTotalMets += Convert.ToInt16(DR["MET_EQUIVALENT"].ToString());
            }

            m_dtLastWorkout = GetLastWorkout(dtDay1, dtDay2, dtDay3, dtDay4, dtDay5, dtDay6, dtDay7 );
            m_sLastWorkout = GetDateString(m_dtLastWorkout);
            m_sWorkoutHistory = GetWorkoutHistory(dtDay1, dtDay2, dtDay3, dtDay4, dtDay5, dtDay6, dtDay7);
        }

        // get the weekly total mets triangle image as well as the left position of the marker and the left position of the total number
        MetsTriangle mt = GetMetsTriangle(m_iWeeklyTotalMets);
        m_sTriangleImage = mt.image;
        m_sProgressNumberLeft = mt.numberLeftPos;
        m_sProgressMarkerLeft = mt.markerLeftPos;

        // get the current program, he current step, and the step image by looking at the last entry in palstarts table
        DataSet starts = objPALClass.PAL_GET_PalStarts(m_sUserId, "1", "0");
        tableCount = entries.Tables.Count;
        int startCount = starts.Tables[0].Rows.Count;
        if (tableCount > 0 && startCount > 0)
        {
            DataRow drStarts = starts.Tables[0].Rows[startCount-1];
            if (!Convert.IsDBNull(drStarts["PROGRAM_NAME"])) m_sCurrentProgram = drStarts["PROGRAM_NAME"].ToString();
            if (!Convert.IsDBNull(drStarts["LEVEL_ID"])) m_sCurrentStage = drStarts["LEVEL_ID"].ToString();
            if (!Convert.IsDBNull(drStarts["PROGRAM_CURRENT_STEP"])) m_iCurrentStep = Convert.ToInt16(drStarts["PROGRAM_CURRENT_STEP"].ToString());
        }
        m_sStepImage = GetStepImage(m_iCurrentStep);

    }

    // representing strings on the logo by month/day/year with no leading zeroes and a 4 digit year, 7/21/2012
    private string GetDateString(DateTime dt)
    {
        if (dt == DateTime.MinValue) return "";
        string sDate = dt.Month.ToString() + "/" + dt.Day.ToString() + "/" + dt.Year.ToString();
        return sDate;
    }

    private string GetWorkoutHistory(DateTime dtDay1, DateTime dtDay2, DateTime dtDay3, DateTime dtDay4, DateTime dtDay5, DateTime dtDay6, DateTime dtDay7)
    {
        string returnValue = "";
        string sDay1 = GetDateString(dtDay1);
        string sDay2 = GetDateString(dtDay2);
        string sDay3 = GetDateString(dtDay3);
        string sDay4 = GetDateString(dtDay4);
        string sDay5 = GetDateString(dtDay5);
        string sDay6 = GetDateString(dtDay6);
        string sDay7 = GetDateString(dtDay7);

        if (sDay1.Length > 0) {
            if (returnValue.Length == 0)
                returnValue = sDay1;
            else
                returnValue += ", " + sDay1;
        }
        if (sDay2.Length > 0)
        {
            if (returnValue.Length == 0)
                returnValue = sDay2;
            else
                returnValue += ", " + sDay2;
        }
        if (sDay3.Length > 0)
        {
            if (returnValue.Length == 0)
                returnValue = sDay3;
            else
                returnValue += ", " + sDay3;
        }
        if (sDay4.Length > 0)
        {
            if (returnValue.Length == 0)
                returnValue = sDay4;
            else
                returnValue += ", " + sDay4;
        }
        if (sDay5.Length > 0)
        {
            if (returnValue.Length == 0)
                returnValue = sDay5;
            else
                returnValue += ", " + sDay5;
        }
        if (sDay6.Length > 0)
        {
            if (returnValue.Length == 0)
                returnValue = sDay6;
            else
                returnValue += ", " + sDay6;
        }
        if (sDay7.Length > 0)
        {
            if (returnValue.Length == 0)
                returnValue = sDay7;
            else
                returnValue += ", " + sDay7;
        }
        return returnValue;
    }

    private DateTime GetLastWorkout(DateTime dtDay1, DateTime dtDay2, DateTime dtDay3, DateTime dtDay4, DateTime dtDay5, DateTime dtDay6, DateTime dtDay7)
    {
        if (dtDay7 != DateTime.MinValue) return dtDay7;
        if (dtDay6 != DateTime.MinValue) return dtDay6;
        if (dtDay5 != DateTime.MinValue) return dtDay5;
        if (dtDay4 != DateTime.MinValue) return dtDay4;
        if (dtDay3 != DateTime.MinValue) return dtDay3;
        if (dtDay2 != DateTime.MinValue) return dtDay2;
        if (dtDay1 != DateTime.MinValue) return dtDay1;
        return DateTime.MinValue;
    }

    private MetsTriangle GetMetsTriangle(int mets)
    {
        // the triangle image starts at left position of 40px
        // middle of marker is 8 pixels
        // making start of number the middle of the marker
        MetsTriangle returnValue;
        returnValue.image = "triangle0.jpg";
        returnValue.markerLeftPos = "";
        returnValue.numberLeftPos = "";
        int posWhiteLine = 1;

        if (mets <= 0)
        {
            // no white line
            posWhiteLine = 1;
            returnValue.image = "triangle0.jpg";
        }
        else if (mets >= 1 && mets <= 99)
        {
            // triangle1 image white line at 25pixels
            posWhiteLine = 25;
            returnValue.image = "triangle1.jpg";
        }
        else if (mets >= 100 && mets <= 199)
        {
            // triangle2 image white line at 45 pixels
            posWhiteLine = 45;
            returnValue.image = "triangle2.jpg";
        }
        else if (mets >= 200 && mets <= 299)
        {
            // triangle3 image white line at 65 pixels
            posWhiteLine = 65;
            returnValue.image = "triangle3.jpg";
        }
        else if (mets >= 300 && mets <= 399)
        {
            // triangle4 image white line at 85 pixels
            posWhiteLine = 85;
            returnValue.image = "triangle4.jpg";
        }
        else if (mets >= 400 && mets <= 499)
        {
            // triangle5 image white line at 105 pixels
            posWhiteLine = 105;
            returnValue.image = "triangle5.jpg";
        }
        else if (mets >= 500 && mets <= 599)
        {
            // triangle6 image white line at 125 pixels
            posWhiteLine = 125;
            returnValue.image = "triangle6.jpg";
        }
        else if (mets >= 600 && mets <= 699)
        {
            // triangle7 image white line at 145 pixels
            posWhiteLine = 145;
            returnValue.image = "triangle7.jpg";
        }
        else if (mets >= 700 && mets <= 799)
        {
            // triangle8 image white line at 165 pixels
            posWhiteLine = 165;
            returnValue.image = "triangle8.jpg";
        }
        else if (mets >= 800 && mets <= 899)
        {
            // triangle9 image white line at 185 pixels
            posWhiteLine = 185;
            returnValue.image = "triangle9.jpg";
        }
        else if (mets >= 900 && mets < 1000)
        {
            // triangle10 image no white line so 205 pixels
            posWhiteLine = 205;
            returnValue.image = "triangle10.jpg";
        }
        else if (mets >= 1000)
        {
            // triangle10 image no white line so 205 pixels
            posWhiteLine = 205;
            returnValue.image = "triangle10.jpg";
        }
        else
        {
            // triangle0 no white line so 0px
            posWhiteLine = 0;
            returnValue.image = "triangle0.jpg";
        }

        // the triangle image starts at left position of 40px
        int leftPosTriangleImage = 40;
        
        // middle of marker is 8 pixels
        int middlePosMarkerImage = 8;

        // marker offset
        int offsetMarkerImage = 17;

        // marker left
        returnValue.markerLeftPos = (leftPosTriangleImage + posWhiteLine - middlePosMarkerImage - offsetMarkerImage).ToString();
        
        // making start of number the middle of the marker
        //returnValue.numberLeftPos = (leftPosTriangleImage + posWhiteLine).ToString();
        returnValue.numberLeftPos = "11";
        return returnValue;
    }

    private string GetStepImage(int step)
    {
        string stepImage = "step1.png";

        if (step <= 1)
        {
            stepImage = "step1.png";
        }
        else if (step == 2)
        {
            stepImage = "step2.png";
        }
        else if (step == 3)
        {
            stepImage = "step3.png";
        }
        else if (step == 4)
        {
            stepImage = "step4.png";
        }
        else if (step == 5)
        {
            stepImage = "step5.png";
        }
        else if (step == 6)
        {
            stepImage = "step6.png";
        }
        else if (step == 7)
        {
            stepImage = "step7.png";
        }
        else if (step == 8)
        {
            stepImage = "step8.png";
        }
        else if (step == 9)
        {
            stepImage = "step9.png";
        }
        else if (step == 10)
        {
            stepImage = "step10.png";
        }
        else if (step == 11)
        {
            stepImage = "step11.png";
        }
        else if (step == 12)
        {
            stepImage = "step12.png";
        }
        else if (step >= 13)
        {
            stepImage = "step13.png";
        }
        return stepImage;
    }
}