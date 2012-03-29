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

public partial class UC_Home_1_Control : System.Web.UI.UserControl
{
    int giChartDaySpan = 90;//91;

    SqlConnClass objSqlConnClass = new SqlConnClass();
    PALClass objPALClass;
    DDClass objDDClass;
    BackofficeClass objBackofficeClass;
    string gsUserID;

    protected void Page_Load(object sender, EventArgs e)
    {
        objPALClass = new PALClass(objSqlConnClass.OpenConnection());
        objDDClass = new DDClass(objSqlConnClass.OpenConnection());
        objBackofficeClass = new BackofficeClass(objSqlConnClass.OpenConnection());
        gsUserID = Membership.GetUser().ProviderUserKey.ToString();

        
        ///////RadChart settings//////
        int iDdDays = giChartDaySpan;
        int iPalDays = giChartDaySpan;
        
        DataSet DS = objDDClass.DD_GET_DdEntries_BY_UserId(gsUserID,"","");
        if (DS.Tables[0].Rows.Count > 2)
        {
            DateTime dStart = Convert.ToDateTime(DS.Tables[0].Rows[0]["DD_ENTRY_DATE"]);
            DateTime dEnd = Convert.ToDateTime(DS.Tables[0].Rows[DS.Tables[0].Rows.Count -1]["DD_ENTRY_DATE"]);
            TimeSpan TS = dStart - dEnd;
            iDdDays = TS.Days;
            if (TS.Days < giChartDaySpan)
            {
                giChartDaySpan = TS.Days;
            }
        }
        DS = objPALClass.PAL_GET_PalEntries_BY_UserId(gsUserID, "", "");
        if (DS.Tables[0].Rows.Count > 2)
        {
            DateTime dStart = Convert.ToDateTime(DS.Tables[0].Rows[0]["PAL_ENTRY_DATE"]);
            DateTime dEnd = Convert.ToDateTime(DS.Tables[0].Rows[DS.Tables[0].Rows.Count -1]["PAL_ENTRY_DATE"]);
            TimeSpan TS = dStart - dEnd;
            iPalDays = TS.Days;
        }

        if (iPalDays < iDdDays)
        {
            if (iDdDays < giChartDaySpan)
            {
                giChartDaySpan = iDdDays;
            }
        }
        else
        {
            if (iPalDays < giChartDaySpan)
            {
                giChartDaySpan = iPalDays;
            }
        }
      
        ///////RadChart settings//////

        
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (PAL_calcCurrentStep(gsUserID) > 0)
            {
             UC_USER_UserAssesment1.Visible = false;
                fillOutForm();
            }
            else
            {
                divProgram.Visible = false;
            }
        }
        else
        {
            fillPostbackInformation();
        }
        objSqlConnClass.CloseConnection();
    }
    private void fillOutForm()
    {
       
        fillOutInformation();
    }
    private void fillPostbackInformation()
    {
        //DataSet DS = objDDClass.DD_GET_DdUsers_BY_UserId(Membership.GetUser().ProviderUserKey.ToString());

        DataSet DS = objDDClass.get_User_Calorie(Membership.GetUser().ProviderUserKey.ToString());
        
        if (DS.Tables[0].Rows.Count > 0)
        {
            lblCurrentCalorie.Text = DS.Tables[0].Rows[0]["CALORIE_NUMBER"].ToString();
        }
    }
    
    private void fillOutInformation()
    {   
        int iCountExercises = 0;
        int iHeight = 0;
        bool bWeightFlg = false;
        string[] saBMIGraph = new string[365];
        int iBMIGraph = 0;
        DateTime dCurrentDate = DateTime.Now;
        DateTime dTwoWeks = (DateTime)dCurrentDate.AddDays(-14);

        DataSet DS = objBackofficeClass.Mem_GET_UserInfo(Membership.GetUser().UserName);
        lblBMIHeight.Text = DS.Tables[0].Rows[0]["HEIGHT"].ToString() + " BMIHeight";
        iHeight = Convert.ToInt32(DS.Tables[0].Rows[0]["HEIGHT"]);

       // DS = objBackofficeClass.Mem_GET_UserAssessments_BY_UserId(gsUserID);
        //lblLevelID.Text = DS.Tables[0].Rows[0]["LEVEL_ID"].ToString() + " LEVEL_ID";
        //lblAssessmentScore.Text = DS.Tables[0].Rows[0]["ASSESSMENT_SCORE"].ToString() + "";

        DS = objPALClass.PAL_GET_PalStarts(gsUserID, "1", "0");
        lblLevelID.Text = "<img src='"+AppConfig.GetBaseSiteUrl()+"images/icons/iconPalLevel" + DS.Tables[0].Rows[0]["LEVEL_ID"].ToString() + ".jpg' />";
        lblProgramName.Text = DS.Tables[0].Rows[0]["PROGRAM_NAME"].ToString();
        lblProgramCurrentStep.Text = DS.Tables[0].Rows[0]["PROGRAM_CURRENT_STEP"].ToString();
        lblNumSteps.Text = DS.Tables[0].Rows[0]["NUM_STEPS"].ToString();
        lblCurrentForum.Text = "<a href='" + AppConfig.GetBaseSiteUrl() + "FORUM/topics.aspx?ForumID=" + DS.Tables[0].Rows[0]["FORUM_PROGRAM_ID"].ToString() + "'>Program Forum</a>";

        string sNumSteps = DS.Tables[0].Rows[0]["NUM_STEPS"].ToString();
        string sProgramCurrentStep = DS.Tables[0].Rows[0]["PROGRAM_CURRENT_STEP"].ToString();

        UC_PAL_Steps1.populate(sProgramCurrentStep, sNumSteps);


        DS = objPALClass.PAL_GET_PalEntries_BY_UserId(gsUserID, "" , "");
         
        lblPalRecentActivities.Text = "";
        TimeSpan TS =  new TimeSpan();
        foreach (DataRow DR in DS.Tables[0].Rows)
        {
           
            if ((DateTime)DR["PAL_ENTRY_DATE"] > dTwoWeks)
            {
                iCountExercises++;
                lblPalRecentActivities.Text += Convert.ToDateTime(DR["PAL_ENTRY_DATE"]).ToString("MM/dd") + ": " + DR["PAL_ENTRY_TYPE_TEXT"].ToString() + "<br />";
            }

            if (DR["PAL_ENTRY_WEIGHT"].ToString() != "" && iHeight.ToString() != "0")
            {
                if (bWeightFlg == false)
                {
                    lblBMIWeight.Text = DR["PAL_ENTRY_WEIGHT"].ToString() + " BMIWeight";
                    bWeightFlg = true;
                }
      
            }
        }

        lblActivityCount.Text = iCountExercises.ToString();




        for (int i = 0; i < iBMIGraph; i++)
        {
            lblBMIGraph.Text = lblBMIGraph.Text + " (" + saBMIGraph[i] + "," + lblBMIHeight.Text + " ) ";

        }
      //  DS = objDDClass.DD_GET_DdUsers_BY_UserId(Membership.GetUser().ProviderUserKey.ToString()); //commented by Netsmartz
        DS = objDDClass.get_User_Calorie(Membership.GetUser().ProviderUserKey.ToString());
        if(DS.Tables[0].Rows.Count > 0)
        {
            lblCurrentCalorie.Text = DS.Tables[0].Rows[0]["CALORIE_NUMBER"].ToString();
        }
    }



    private int PAL_calcCurrentStep(string sUserID)
    {
        if (sUserID == "")
        {
            return 0;
        }

        DateTime dtProgramStartDate = new DateTime();
        int iProgramStartStep = 0;
        int iNumSteps = 0;
        int iMinPalEntries = 0;
        int iMinDays = 0;
        int iNextStepDaysToAdd = 0;
        DataSet dsPALStarts = objPALClass.PAL_GET_PalStarts(sUserID, "1", "0");

        if (dsPALStarts.Tables[0].Rows.Count == 0)
        {
            return 0;
        }
        else if (Convert.ToDateTime(dsPALStarts.Tables[0].Rows[0]["PROGRAM_START_DATE"]) > DateTime.Now)
        {
            return 1;
        }
        else
        {
            dtProgramStartDate = Convert.ToDateTime(dsPALStarts.Tables[0].Rows[0]["PROGRAM_START_DATE"]);
            iProgramStartStep = Convert.ToInt32(dsPALStarts.Tables[0].Rows[0]["PROGRAM_START_STEP"]);
            iNumSteps = Convert.ToInt32(dsPALStarts.Tables[0].Rows[0]["NUM_STEPS"]);
            iMinPalEntries = Convert.ToInt32(dsPALStarts.Tables[0].Rows[0]["MIN_PAL_ENTRIES"]);
            iMinDays = Convert.ToInt32(dsPALStarts.Tables[0].Rows[0]["MIN_DAYS"]);
        }

        DataSet dsPALEntries = objPALClass.PAL_GET_PalEntries_BY_UserId(sUserID, dtProgramStartDate.ToString(), DateTime.Now.ToString());

        DataView DV = dsPALEntries.Tables[0].DefaultView;
        DV.Sort = "PAL_ENTRY_DATE ASC";
        DataTable dsT = DV.ToTable();

        int iCurrentStepCount = iProgramStartStep;
        int iEntryCount = 0;
        DateTime dtCurrentStartStep = dtProgramStartDate;
        foreach (DataRow DR in dsT.Rows)
        {
            //Response.Write(iCurrentStep.ToString());

            //check the entries reguardless of NUM_STEPS because we need to check for completion
            //if (iCurrentStepCount < iNumSteps)
            {
                DateTime dtPalEntryDate = Convert.ToDateTime(DR["PAL_ENTRY_DATE"]);
                iEntryCount++;
                if (iEntryCount >= iMinPalEntries && (dtPalEntryDate) >= dtCurrentStartStep.AddDays(iMinDays - 1))
                {
                    if (iEntryCount > iMinPalEntries)
                    {
                        iEntryCount = 1;
                        dtCurrentStartStep = dtPalEntryDate.AddDays(1);
                    }
                    else
                    {
                        iEntryCount = 0;
                        dtCurrentStartStep = dtCurrentStartStep.AddDays(iMinDays);
                    }
                    
                   // dtCurrentStartStep = dtPalEntryDate.AddDays(1);
                     /*
                    if (dtCurrentStartStep.AddDays(iMinDays) < dtPalEntryDate.AddDays(1))
                    {
                    }
                    else
                    {
                    }
                      *
                    iEntryCount = 1; */
                    iCurrentStepCount++;
                }
            }
        }

        //still need to check if that did all the exercises before 2 weeks, and today has reached the two weeks
        if (iCurrentStepCount < iNumSteps)
        {
            if (iEntryCount >= iMinPalEntries && (DateTime.Now) >= dtCurrentStartStep.AddDays(iMinDays - 1))
            {
                iCurrentStepCount++;
            }
        }

        //Response.Write(iCurrentStep.ToString());

        string sPalStartID = dsPALStarts.Tables[0].Rows[0]["PAL_START_ID"].ToString();
        if (iCurrentStepCount > iNumSteps)
        {
            objPALClass.PAL_UPDATE_PalStarts_ProgramCurrentStep(sPalStartID, (iNumSteps).ToString());
            //also update set PROGRAM_COMPLETION_FLG=1, PROGRAM_COMPLETION_DATE=getdate(), ACTIVE_FLG=0
            objPALClass.PAL_UPDATE_PalStarts_ProgramCompletionFlg(sPalStartID, "1", "0");

            return 0;
        }
        else
        {
             objPALClass.PAL_UPDATE_PalStarts_ProgramCurrentStep(sPalStartID, (iCurrentStepCount).ToString());
        }


        return iCurrentStepCount;
    }
    

    protected void btnCalcStep_Click(object sender, EventArgs e)
    {
      // int iCurrentStep =  PAL_calcCurrentStep(gsUserID, "10/21/2008", "12/21/2008");
    }
}
