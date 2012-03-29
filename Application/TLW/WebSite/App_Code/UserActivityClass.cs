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


public class UserActivityClass
{
    SqlConnection MyConnection;
    SqlCommand MyCommand;
    SqlDataAdapter MyDataAdapter;

    DataSet MyDataSet = new DataSet();

    public UserActivityClass(SqlConnection objSQLConnection)
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
    /// <summary>
    ///
    /// </summary>
    /// <param name="ListName"></param>
    /// <param name="TableName"></param>
    /// <returns></returns>
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


    public DataSet GET_LogPhysicalActivity_BY_LogID(string Log_ID)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "sp_GET_LogPhysicalActivity_BY_LogID";
            MyCommand.Parameters.AddWithValue("@LOG_ID", Log_ID);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write("GET_Items_AnyItemTable - " + ex.Message + "<br />");
        }
        return MyDataSet;
    }
    /*
    public DataSet GET_LogPhysicalActivity_BY_UserId(string User_ID)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "sp_GET_LogPhysicalActivity_BY_UserId";
            MyCommand.Parameters.AddWithValue("@USER_ID", User_ID);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {

        }
        return MyDataSet;
    }
    */

    /// <param name="DateFrom"> "" = return all dates</param>
    /// <param name="DateTo"></param>
    public DataSet GET_LogPhysicalActivity_BY_UserId(string sUserID, string sDateFrom, string sDateTo)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "sp_GET_LogPhysicalActivity_BY_UserId";
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

    
    public DataSet UPDATE_ActivateUserRegistration(string sRndRegCode)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;

            MyCommand.CommandText = "spReg_UPDATE_ActivateUserRegistration";
            MyCommand.Parameters.AddWithValue("@RND_REG_CODE", sRndRegCode);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }

        return MyDataSet;
    }

    
    /// <summary>
    ///
    /// </summary>
    /// <param name="ListName"></param>
    /// <param name="TableName"></param>
    /// <returns></returns>
    public int INSERT_LOG_PHYSICAL_ACTIVITY(string UserId, string sActivityType , string sTime, string sDuration, string sActivityLevel, string sComment, string sDate)
    {
        int success = 0;
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "sp_INSERT_LOG_PHYSICAL_ACTIVITY";
            MyCommand.Parameters.AddWithValue("@USER_ID", UserId);
            MyCommand.Parameters.AddWithValue("@ACTIVITY_TYPE", sActivityType);
            MyCommand.Parameters.AddWithValue("@TIME", sTime);
            MyCommand.Parameters.AddWithValue("@DUTATION", sDuration);
            MyCommand.Parameters.AddWithValue("@ACTIVITY_LEVEL", sActivityLevel);
            MyCommand.Parameters.AddWithValue("@COMMENT", sComment);
            MyCommand.Parameters.AddWithValue("@DATE", sDate);
            MyCommand.ExecuteNonQuery();
            success = 1;
        }
        catch (Exception ex)
        {
            success = 0;
        }
        return success;
    }


    

}