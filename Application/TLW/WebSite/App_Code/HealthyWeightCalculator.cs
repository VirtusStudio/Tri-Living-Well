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
/// Summary description for BodyFatCalculatorClass
/// </summary>
public class HealthyWeightCalculatorClass
{
    private SqlConnection MyConnection;
    private SqlCommand MyCommand;
    private SqlDataAdapter MyDataAdapter;

    public HealthyWeightCalculatorClass(SqlConnection objSQLConnection)
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

    public void SetHealthyWeightCalculator(string sUserID, string sDateSelected, int iPersonalSummaryId, decimal decWeight, decimal decWaist, decimal decNeck, decimal decHips)
    {
        
        SqlCommand MyCommand;
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutritionBodyFatCalculatorSetByDate";
            MyCommand.Parameters.AddWithValue("@USERID", sUserID);
            MyCommand.Parameters.AddWithValue("@DATESELECTED", sDateSelected);
            MyCommand.Parameters.AddWithValue("@PERSONALSUMMARYID", iPersonalSummaryId);
            MyCommand.Parameters.AddWithValue("@WEIGHT", decWeight);
            MyCommand.Parameters.AddWithValue("@WAIST", decWaist);
            MyCommand.Parameters.AddWithValue("@NECK", decNeck);
            MyCommand.Parameters.AddWithValue("@HIPS", decHips);
            MyCommand.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
    }

    public DataSet GetHealthyWeightCalculatorPersonalSummary(string sUserID, string sDateSelected)
    {
        DataSet MyDataSet = new DataSet();
        if (sUserID.Trim().Length == 0) return MyDataSet;

        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutritionBodyFatCalculatorGetLast";
            MyCommand.Parameters.AddWithValue("@USERID", sUserID);
            MyCommand.Parameters.AddWithValue("@DATESELECTED", sDateSelected);
            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
        return MyDataSet;
    }

    public DataSet GetHealthyWeightCalculatorUserInfo(string sUserID)
    {
        DataSet MyDataSet = new DataSet();
        if (sUserID.Trim().Length == 0) return MyDataSet;

        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutritionUserInfoGet";
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

    public DataSet GetHealthyWeightRanges(int iHeight)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutritionGetHealthyWeightRanges";
            MyCommand.Parameters.AddWithValue("@HEIGHT", iHeight);
            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
        return MyDataSet;
    }
   
    

    public DataSet GetBodyFatRanges(string sGender, int iAge)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutritionGetBodyFatRanges";
            MyCommand.Parameters.AddWithValue("@GENDER", sGender);
            MyCommand.Parameters.AddWithValue("@AGE", iAge);
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