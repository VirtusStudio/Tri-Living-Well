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

public partial class PersonalFitness : System.Web.UI.Page
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    TemplateClass objTemplateClass;
    PALClass objPALClass;
    string gsUserID = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        objPALClass = new PALClass(objSqlConnClass.OpenConnection());
        gsUserID = Membership.GetUser().ProviderUserKey.ToString();

        MembershipUser currentUser = Membership.GetUser();
        if (!AppLib.IsLoggedinSessionExists() || currentUser == null)
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/main_frame.aspx", true);

        

        AccountClass objAccountClass;
        objAccountClass = new AccountClass(objSqlConnClass.sqlConnection);
        BackofficeClass objBackOfficeClass;
        objBackOfficeClass = new BackofficeClass(objSqlConnClass.OpenConnection());

        #region Insert visited log details

        AppLib.InsertVisitedSectionDetails("Dashboard Page");

        #endregion

        DataSet DS = objBackOfficeClass.Mem_GET_UserInfo(currentUser.UserName);
        if (DS != null)
        {
            if (DS.Tables[0].Rows.Count > 0)
            {
                if (DS.Tables[0].Rows[0]["ROLENAME"].ToString().Equals("User"))
                {
                    if (DS.Tables[0].Rows[0]["strRiskStratificationProcessStep"].ToString().Equals(string.Empty) || DS.Tables[0].Rows[0]["strRiskStratificationProcessStep"].ToString() != "6")
                    {
                        DS = null;
                        Response.Redirect(AppConfig.GetBaseSiteUrl() + "Users/RiskStratificationProcessStep1.aspx?id=" + AppLib.Encrypt(currentUser.UserName), true);
                    }
                }
            }
        }
        BindNutritionalJournal();
        DS = null;


        objTemplateClass = new TemplateClass(objSqlConnClass.OpenConnection());

        int ileftMargin = 0;
        string sTriangleImg = "triangle1.jpg";
        int iMET = 0;
        string sLastWorkout = "";
        DataSet entries = objPALClass.PAL_GET_PalEntries_BY_UserId(gsUserID, "", "");
        foreach (DataRow DR in entries.Tables[0].Rows)
        {
            iMET += Convert.ToInt32(DR["MET_EQUIVALENT"]);
            sLastWorkout = DR["PAL_ENTRY_DATE"].ToString();
        }
        labelLastWorkout.Text = sLastWorkout;

        iMET = 100;
        // 0
        if (iMET <= 0)
        {
            ileftMargin = 7;
            sTriangleImg = "triangle1.jpg";
        }
        // 1
        else if (iMET <= 100)
        {
            ileftMargin = 32;
            sTriangleImg = "triangle1.jpg";
        }
        // 2
        else if (iMET <= 200)
        {
            ileftMargin = 52;
            sTriangleImg = "triangle2.jpg";
        }
        // 3
        else if (iMET <= 300)
        {
            ileftMargin = 72;
            sTriangleImg = "triangle3.jpg";
        }
        // 4
        else if (iMET <= 400)
        {
            ileftMargin = 92;
            sTriangleImg = "triangle4.jpg";
        }
        // 5
        else if (iMET <= 500)
        {
            ileftMargin = 112;
            sTriangleImg = "triangle5.jpg";
        }
        // 6
        else if (iMET <= 600)
        {
            ileftMargin = 132;
            sTriangleImg = "triangle6.jpg";
        }
        // 7
        else if (iMET <= 700)
        {
            ileftMargin = 152;
            sTriangleImg = "triangle7.jpg";
        }
        // 8
        else if (iMET <= 800)
        {
            ileftMargin = 172;
            sTriangleImg = "triangle8.jpg";
        }
        // 9
        else if (iMET <= 900)
        {
            ileftMargin = 192;
            sTriangleImg = "triangle9.jpg";
        }
        // 10
        else if (iMET > 900)
        {
            ileftMargin = 212;
            sTriangleImg = "triangle10.jpg";
        }
        literalTriangle.Text = "<img style='margin-left:20px;' src='" + AppConfig.GetBaseSiteUrl() + "Images/dashboard/" + sTriangleImg + "' />";
        literalMetsMarker.Text = "<div style='width:30px;margin-left:" + ileftMargin.ToString() + "px;margin-top:-7px;font-weight:bold;font-size:larger;font-color:Black;text-align:center;line-height:80%'>&#9650;<br />" + iMET.ToString() + "</div>";

        getActivitiesData();
    }

    private void getActivitiesData()
    {

        // have to get last activity
        DataSet DS = objPALClass.PAL_GET_PalEntries_BY_UserId(gsUserID, "", "");

        if (DS.Tables.Count > 0 && DS.Tables[0].Rows.Count > 0)
        {
            DataRow drLastEntry = DS.Tables[0].Rows[DS.Tables[0].Rows.Count - 1];
            string lastEntryDate = Convert.ToDateTime(drLastEntry["PAL_ENTRY_DATE"]).ToString("MM/dd/yyyy");
            string lastEntryType = drLastEntry["PAL_ENTRY_TYPE_TEXT"].ToString();
            string lastEntryActivity = drLastEntry["PAL_ENTRY_ACTIVITY_TEXT"].ToString();
            string lastEntryTimeText = drLastEntry["PAL_ENTRY_TIME_TEXT"].ToString();
            string lastEntryDuration = Convert.ToString(objPALClass.DurationTextToMinutes(drLastEntry["PAL_ENTRY_DURATION_TEXT"].ToString()));
            string lastEntryWeight = drLastEntry["PAL_ENTRY_WEIGHT"].ToString();
            string lastEntryIntensity = drLastEntry["PAL_ENTRY_INTENSITY_TEXT"].ToString();
            string lastEntryComment = drLastEntry["PAL_ENTRY_COMMENT"].ToString();
            string lastMetEquivalent = drLastEntry["MET_EQUIVALENT"].ToString();

            // calculate energy expended
            decimal dCalories = objPALClass.GetCaloriesExpended(lastEntryWeight, lastMetEquivalent, lastEntryDuration);
            string lastCaloriesExpended = decimal.Round(dCalories, 2).ToString();

            // put together the last 7 days of dates
            string lastDates = "";

            // have to get past weeks
            int iWeekTotalMets = 0;
            decimal dWeekCaloriesExpended = 0.0M;
            int iWeekDuration = 0;
            int iRowCount = DS.Tables[0].Rows.Count;
            for (int i = 1; i <= 7; i++)
            {
                if (i <= iRowCount)
                {
                    DataRow dr = DS.Tables[0].Rows[i - 1];
                    iWeekTotalMets += Convert.ToInt32(dr["MET_EQUIVALENT"]);
                    iWeekDuration += objPALClass.DurationTextToMinutes(dr["PAL_ENTRY_DURATION_TEXT"].ToString());
                    dWeekCaloriesExpended += objPALClass.GetCaloriesExpended(dr["PAL_ENTRY_WEIGHT"].ToString(), dr["MET_EQUIVALENT"].ToString(), dr["PAL_ENTRY_DURATION_TEXT"].ToString());
                    lastDates += Convert.ToDateTime(dr["PAL_ENTRY_DATE"]).ToString("MM/dd/yyyy");
                    lastDates += " ";
                }
            }
            string weekTotalMetEquivalent = iWeekTotalMets.ToString();
            string weekCaloriesExpended = decimal.Round(dWeekCaloriesExpended, 2).ToString();
            string weekDuration = iWeekDuration.ToString();

            // have to get cumulative
            int iCumulativeTotalMets = 0;
            decimal dCumulativeCaloriesExpended = 0.0M;
            int iCumulativeDuration = 0;
            iRowCount = DS.Tables[0].Rows.Count;
            for (int i = 1; i <= iRowCount; i++)
            {
                if (i <= iRowCount)
                {
                    DataRow dr = DS.Tables[0].Rows[i - 1];
                    iCumulativeTotalMets += Convert.ToInt32(dr["MET_EQUIVALENT"]);
                    iCumulativeDuration += objPALClass.DurationTextToMinutes(dr["PAL_ENTRY_DURATION_TEXT"].ToString());
                    dCumulativeCaloriesExpended += objPALClass.GetCaloriesExpended(dr["PAL_ENTRY_WEIGHT"].ToString(), dr["MET_EQUIVALENT"].ToString(), dr["PAL_ENTRY_DURATION_TEXT"].ToString());
                }
            }
            string cumulativeTotalMetEquivalent = iCumulativeTotalMets.ToString();
            string cumulativeCaloriesExpended = decimal.Round(dCumulativeCaloriesExpended, 2).ToString();
            string cumulativeDuration = iCumulativeDuration.ToString();

            labelLastDate.Text = lastEntryDate;
            labelWeekDate.Text = "";
            LabelCumulativeDate.Text = "";
            labelLastWeight.Text = lastEntryWeight;
            labelWeekWeight.Text = "";
            labelCumulativeWeight.Text = "";
            labelLastActivity.Text = lastEntryActivity;
            labelWeekActivity.Text = "";
            labelCumulativeActivity.Text = "";
            labelLastDuration.Text = lastEntryDuration;
            labelWeekDuration.Text = weekDuration;
            labelCumulativeDuration.Text = cumulativeDuration;
            labelLastIntensity.Text = lastEntryIntensity;
            labelWeekIntensity.Text = "";
            labelCumulativeIntensity.Text = "";
            labelLastMet.Text = lastMetEquivalent;
            labelWeekMet.Text = weekTotalMetEquivalent;
            labelCumulativeMet.Text = cumulativeTotalMetEquivalent;
            labelLastEnergy.Text = lastCaloriesExpended;
            labelWeekEnergy.Text = weekCaloriesExpended;
            labelCumulativeEnergy.Text = cumulativeCaloriesExpended;

            labelLastWorkout.Text = Convert.ToDateTime(drLastEntry["PAL_ENTRY_DATE"]).ToString("dddd MMMM dd, yyyy");
            labelHistory.Text = lastDates;
        }
        else
        {
            labelLastDate.Text = "";
            labelWeekDate.Text = "";
            LabelCumulativeDate.Text = "";
            labelLastWeight.Text = "";
            labelWeekWeight.Text = "";
            labelCumulativeWeight.Text = "";
            labelLastActivity.Text = "";
            labelWeekActivity.Text = "";
            labelCumulativeActivity.Text = "";
            labelLastDuration.Text = "";
            labelWeekDuration.Text = "";
            labelCumulativeDuration.Text = "";
            labelLastIntensity.Text = "";
            labelWeekIntensity.Text = "";
            labelCumulativeIntensity.Text = "";
            labelLastMet.Text = "";
            labelWeekMet.Text = "";
            labelCumulativeMet.Text = "";
            labelLastEnergy.Text = "";
            labelWeekEnergy.Text = "";
            labelCumulativeEnergy.Text = "";
            labelLastWorkout.Text = "";
            labelHistory.Text = "";
        }
    }


    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
        }
        objSqlConnClass.CloseConnection();
    }



    /// <summary>
    /// following function is used to bind the nutritional journal details
    /// </summary>
    private void BindNutritionalJournal()
    {
        BLL.UserLib oUserLib = new BLL.UserLib();
        Entity.UserInfo oUserInfo = new Entity.UserInfo();
        SqlConnClass objSqlConnClass = new SqlConnClass();
        DDClass objDDClass = new DDClass(objSqlConnClass.OpenConnection());
        try
        {







        }
        catch
        { }
        finally
        {
            objSqlConnClass.CloseConnection();
            objSqlConnClass = null;
            objDDClass = null;
            oUserLib = null;
            oUserInfo = null;
        }
    }


    protected string GetImagePath(string _strValueCode)
    {
        string _strRetVal = string.Empty;
        if (_strValueCode.ToLower().Equals("facebook"))
            _strRetVal = AppConfig.GetBaseSiteUrl() + "images/facebook.png";
        else if (_strValueCode.ToLower().Equals("twitter"))
            _strRetVal = AppConfig.GetBaseSiteUrl() + "images/twitter.png";
        else
            _strRetVal = AppConfig.GetBaseSiteUrl() + "images/blog.png";


            return _strRetVal;
    }

}
