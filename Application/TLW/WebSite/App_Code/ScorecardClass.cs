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

/// <summary>
/// Summary description for ScorecardClass
/// </summary>
public class ScorecardClass
{
    private SqlConnection MyConnection;
    private SqlCommand MyCommand;
    private SqlDataAdapter MyDataAdapter;

    public ScorecardClass(SqlConnection objSQLConnection)
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

    public void SetScorecard( string sUserID, string sDateSelected, int iPersonalSummaryId, decimal decWeight, decimal decWaist, decimal decBMI, decimal decBodyFatPercentage, decimal decWaistToHeight, decimal decWaistToHip)
    {
        SqlCommand MyCommand;
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutritionScorecardSetByDate";
            MyCommand.Parameters.AddWithValue("@USERID", sUserID);
            MyCommand.Parameters.AddWithValue("@DATE_SELECTED", sDateSelected);
            MyCommand.Parameters.AddWithValue("@PERSONALSUMMARYID", iPersonalSummaryId);
            MyCommand.Parameters.AddWithValue("@WEIGHT", decWeight);
            MyCommand.Parameters.AddWithValue("@WAIST", decWaist);
            MyCommand.Parameters.AddWithValue("@BMI", decBMI);
            MyCommand.Parameters.AddWithValue("@FAT", decBodyFatPercentage);
            MyCommand.Parameters.AddWithValue("@WAIST_HEIGHT", decWaistToHeight);
            MyCommand.Parameters.AddWithValue("@WAIST_HIP", decWaistToHip);
            MyCommand.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
    }

    public DataSet GetFirstScorecard(string sUserID, string sDateSelected)
    {
        DataSet MyDataSet = new DataSet();
        if (sUserID.Trim().Length == 0) return MyDataSet;

        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutritionScorecardGetFirst";
            MyCommand.Parameters.AddWithValue("@USERID", sUserID);
            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
        return MyDataSet;
    }


    public DataSet GetLastScorecard(string sUserID, string sDateSelected)
    {
        DataSet MyDataSet = new DataSet();
        if (sUserID.Trim().Length == 0) return MyDataSet;

        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutritionScorecardGetLast";
            MyCommand.Parameters.AddWithValue("@USERID", sUserID);
            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
        return MyDataSet;
    }




}