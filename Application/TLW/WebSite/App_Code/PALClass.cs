using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


public class PALClass
{
    SqlConnection MyConnection;
    SqlCommand MyCommand;
    SqlDataAdapter MyDataAdapter;

    DataSet MyDataSet = new DataSet();

    public PALClass(SqlConnection objSQLConnection)
    {
        try
        {
            MyConnection = objSQLConnection;
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
    }

    public DataSet GET_Items_AnyItemTable(string ListName, string TableName)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "sp_GET_Items_AnyItemTable";
            MyCommand.Parameters.AddWithValue("@ListName", ListName);
            MyCommand.Parameters.AddWithValue("@TableName", TableName);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write("GET_Items_AnyItemTable - " + ex.Message + "<br />");
        }
        return MyDataSet;
    }


    /// <param name="DateFrom"> "" = returns all PAL_Entries</param>
    /// <param name="DateTo"> "" = returns all PAL_Entries</param>
    public DataSet PAL_GET_PalEntries_BY_UserId(string sUserID, string sDateFrom, string sDateTo)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spPAL_GET_PalEntries_BY_UserId";
            MyCommand.Parameters.AddWithValue("@USER_ID", sUserID);
            MyCommand.Parameters.AddWithValue("@DATE_FROM", sDateFrom);
            MyCommand.Parameters.AddWithValue("@DATE_TO", sDateTo);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {

        }
        return MyDataSet;
    }

    /// <param name="DateFrom"> "" = returns all PAL_Entries</param>
    /// <param name="DateTo"> "" = returns all PAL_Entries</param>
    public DataSet PAL_DELETE_PalEntries_BY_PAL_ENTRY_ID(int _intPalentriyId)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spPAL_Delete_PalEntries_BY_PALId";
            MyCommand.Parameters.AddWithValue("@PAL_ENTRYID", _intPalentriyId);
            MyCommand.ExecuteNonQuery();
        }
        catch (Exception ex)
        {

        }
        return MyDataSet;
    }



    public DataSet PAL_GET_PalEntries_BY_PalEntryId(string sPalEntryID)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spPAL_GET_PalEntries_BY_PalEntryId";
            MyCommand.Parameters.AddWithValue("@PAL_ENTRY_ID", sPalEntryID);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {

        }
        return MyDataSet;
    }

    /// <summary>
    /// DATE_CREATED DESC
    /// </summary>
    public DataSet PAL_GET_PalStarts(string sUserID, string sActiveFlg, string sProgramCompletionFlg)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spPAL_GET_PalStarts";
            MyCommand.Parameters.AddWithValue("@USER_ID", sUserID);
            MyCommand.Parameters.AddWithValue("@ACTIVE_FLG", sActiveFlg);
            MyCommand.Parameters.AddWithValue("@PROGRAM_COMPLETION_FLG", sProgramCompletionFlg);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
        }
        return MyDataSet;
    }

    public DataSet PAL_INSERT_PalEntries(string sUserID, string sPalEntryDate, int iPalEntryType, string sPalTypeText, int iPalEntryActivity, string sPalActivityText, string sPalEntryTime, string sPalEntryDuration, string sPalEntryIntensity, string sPalEntryWeight, string sPalEntryComment)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spPAL_INSERT_PalEntries";
            MyCommand.Parameters.AddWithValue("@USER_ID", sUserID);
            MyCommand.Parameters.AddWithValue("@PAL_ENTRY_DATE", sPalEntryDate);
            MyCommand.Parameters.AddWithValue("@PAL_ENTRY_TYPE", iPalEntryType);
            MyCommand.Parameters.AddWithValue("@PAL_TYPE_TEXT", sPalTypeText);
            MyCommand.Parameters.AddWithValue("@PAL_ENTRY_ACTIVITY", iPalEntryActivity);
            MyCommand.Parameters.AddWithValue("@PAL_ACTIVITY_TEXT", sPalActivityText);
            MyCommand.Parameters.AddWithValue("@PAL_ENTRY_TIME", sPalEntryTime);
            MyCommand.Parameters.AddWithValue("@PAL_ENTRY_DURATION", sPalEntryDuration);
            MyCommand.Parameters.AddWithValue("@PAL_ENTRY_INTENSITY", sPalEntryIntensity);
            MyCommand.Parameters.AddWithValue("@PAL_ENTRY_WEIGHT", sPalEntryWeight);
            MyCommand.Parameters.AddWithValue("@PAL_ENTRY_COMMENT", sPalEntryComment);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
        }
        return MyDataSet;
    }

    public DataSet PAL_UPDATE_PalEntries(string sPalEntryID, string sPalEntryDate, int iPalEntryType, string sPalTypeText, int iPalEntryActivity, string sPalActivityText, string sPalEntryTime, string sPalEntryDuration, string sPalEntryIntensity, string sPalEntryWeight, string sPalEntryComment)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spPAL_UPDATE_PalEntries";
            MyCommand.Parameters.AddWithValue("@PAL_ENTRY_ID", sPalEntryID);
            MyCommand.Parameters.AddWithValue("@PAL_ENTRY_DATE", sPalEntryDate);
            MyCommand.Parameters.AddWithValue("@PAL_ENTRY_TYPE", iPalEntryType);
            MyCommand.Parameters.AddWithValue("@PAL_TYPE_TEXT", sPalTypeText);
            MyCommand.Parameters.AddWithValue("@PAL_ENTRY_ACTIVITY", iPalEntryActivity);
            MyCommand.Parameters.AddWithValue("@PAL_ACTIVITY_TEXT", sPalActivityText);
            MyCommand.Parameters.AddWithValue("@PAL_ENTRY_TIME", sPalEntryTime);
            MyCommand.Parameters.AddWithValue("@PAL_ENTRY_DURATION", sPalEntryDuration);
            MyCommand.Parameters.AddWithValue("@PAL_ENTRY_INTENSITY", sPalEntryIntensity);
            MyCommand.Parameters.AddWithValue("@PAL_ENTRY_WEIGHT", sPalEntryWeight);
            MyCommand.Parameters.AddWithValue("@PAL_ENTRY_COMMENT", sPalEntryComment);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
        }
        return MyDataSet;
    }

    public DataSet PAL_UPDATE_PalStarts_ProgramCurrentStep(string sPalStartId, string sProgramCurrentStep)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spPAL_UPDATE_PalStarts_ProgramCurrentStep";
            MyCommand.Parameters.AddWithValue("@PAL_START_ID", sPalStartId);
            MyCommand.Parameters.AddWithValue("@PROGRAM_CURRENT_STEP", sProgramCurrentStep);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
        }
        return MyDataSet;
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="sPalStartId"></param>
    /// <param name="sProgramCompletionFlg">if(!='') sets PROGRAM_COMPLETION_FLG and PROGRAM_COMPLETION_DATE</param>
    /// <param name="sActiveFlg">if(!='') sets ACTIVE_FLG</param>
    /// <returns></returns>
    public DataSet PAL_UPDATE_PalStarts_ProgramCompletionFlg(string sPalStartId, string sProgramCompletionFlg, string sActiveFlg)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spPAL_UPDATE_PalStarts_ProgramCompletionFlg";
            MyCommand.Parameters.AddWithValue("@PAL_START_ID", sPalStartId);
            MyCommand.Parameters.AddWithValue("@PROGRAM_COMPLETION_FLG", sProgramCompletionFlg);
            MyCommand.Parameters.AddWithValue("@ACTIVE_FLG", sActiveFlg);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
        }
        return MyDataSet;
    }

    public DataSet PAL_UPDATE_PalStarts(string sPalStartID, string sProgramID, string sProgramStartDate, string sProgramStartStep)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spPAL_UPDATE_PalStarts";
            MyCommand.Parameters.AddWithValue("@PAL_START_ID", sPalStartID);
            MyCommand.Parameters.AddWithValue("@PROGRAM_ID", sProgramID);
            MyCommand.Parameters.AddWithValue("@PROGRAM_START_DATE", sProgramStartDate);
            MyCommand.Parameters.AddWithValue("@PROGRAM_START_STEP", sProgramStartStep);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
        }
        return MyDataSet;
    }

    /// <summary>
    /// This will reset all of the user's other starts ACTIVE_FLG=0, and set the inserted one ACTIVE_FLG=1
    /// </summary>
    public DataSet PAL_INSERT_PalStarts(string sUserID, string sProgramID, string sProgramStartDate, string sProgramStartStep)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spPAL_INSERT_PalStarts";
            MyCommand.Parameters.AddWithValue("@USER_ID", sUserID);
            MyCommand.Parameters.AddWithValue("@PROGRAM_ID", sProgramID);
            MyCommand.Parameters.AddWithValue("@PROGRAM_START_DATE", sProgramStartDate);
            MyCommand.Parameters.AddWithValue("@PROGRAM_START_STEP", sProgramStartStep);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
        }
        return MyDataSet;
    }


    /// <summary>
    /// This will reset all of the user's other starts ACTIVE_FLG=0, and set the inserted one ACTIVE_FLG=1
    /// </summary>
    public DataSet PAL_INSERTMULTIPLE_PalStarts(string sUserID, string sProgramID, string sProgramStartDate, string sProgramStartStep)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spPAL_INSERTMULTIPLE_PalStarts";
            MyCommand.Parameters.AddWithValue("@USER_ID", sUserID);
            MyCommand.Parameters.AddWithValue("@PROGRAM_ID", sProgramID);
            MyCommand.Parameters.AddWithValue("@PROGRAM_START_DATE", sProgramStartDate);
            MyCommand.Parameters.AddWithValue("@PROGRAM_START_STEP", sProgramStartStep);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
        }
        return MyDataSet;
    }

    public int DurationTextToMinutes(string duration)
    {
        duration = duration.Trim();
        if(duration == "-Select Duration-") return 0;
        if(duration == "15 min") return 15;
        if(duration == "30 min") return 30;
        if(duration == "45 min") return 45;
        if(duration == "1 hr") return 60;
        if(duration == "1 h 15 min") return 75;
        if(duration == "1 h 30 min") return 90;
        if(duration == "1 h 45 min") return 105;
        if(duration == "2 hr") return 120;
        if(duration == "2 h 15 min") return 135;
        if(duration == "2 h 30 min") return 150;
        if(duration == "2 h 45 min") return 165;
        if (duration == "3 hr") return 180;
        return 0;
    }

    public decimal GetCaloriesExpended(string weight, string met, string duration)
    {
        // calculate energy expended
        decimal dCalories = 0.0M;
        decimal dWeight = Convert.ToDecimal(weight);
        decimal dMET = Convert.ToDecimal(met);
        decimal dDuration = Convert.ToDecimal(DurationTextToMinutes(duration));
        dCalories = (((dMET - 1.0M) * 3.5M * (dWeight / 2.2M)) / 200.0M) * dDuration;
        return dCalories;
    }

}