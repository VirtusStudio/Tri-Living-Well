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


public class ReportClass
{
    SqlConnection MyConnection;
    SqlCommand MyCommand;
    SqlDataAdapter MyDataAdapter;

    DataSet MyDataSet = new DataSet();

    public ReportClass(SqlConnection objSQLConnection)
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
    /// sFilter_AccountFrom = [ "" | "Main", | "Extended" | "Main,Extended" ]
    /// </summary>
    public DataSet Rpt_REPORT_ProgramLevel(string sAccountID, string sFilter_AccountFrom)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spRpt_REPORT_ProgramLevel";

            MyCommand.Parameters.AddWithValue("@ACCOUNT_ID", sAccountID);
            MyCommand.Parameters.AddWithValue("@FILTER_ACCOUNT_FROM", sFilter_AccountFrom);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
        }
        return MyDataSet;
    }

    /// <summary>
    /// sFilter_AccountFrom = [ "" | "Main", | "Extended" | "Main,Extended" ]
    /// </summary>
    public DataSet Rpt_REPORT_PalEntries_BY_Date(string sDateFrom, string sDateTo, string sAccountID, string sFilter_AccountFrom)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spRpt_REPORT_PalEntries_BY_Date";

            MyCommand.Parameters.AddWithValue("@DATE_FROM", sDateFrom);
            MyCommand.Parameters.AddWithValue("@DATE_TO", sDateTo);
            MyCommand.Parameters.AddWithValue("@ACCOUNT_ID ", sAccountID);
            MyCommand.Parameters.AddWithValue("@FILTER_ACCOUNT_FROM", sFilter_AccountFrom);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
        }
        return MyDataSet;
    }

    /// <summary>
    /// sFilter_AccountFrom = [ "" | "Main", | "Extended" | "Main,Extended" ]
    /// </summary>
    public DataSet Rpt_REPORT_DdEntries_BY_Date(string sDateFrom, string sDateTo, string sAccountID, string sFilter_AccountFrom)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spRpt_REPORT_DdEntries_BY_Date";

            MyCommand.Parameters.AddWithValue("@DATE_FROM", sDateFrom);
            MyCommand.Parameters.AddWithValue("@DATE_TO", sDateTo);
            MyCommand.Parameters.AddWithValue("@ACCOUNT_ID ", sAccountID);
            MyCommand.Parameters.AddWithValue("@FILTER_ACCOUNT_FROM", sFilter_AccountFrom);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
        }
        return MyDataSet;
    }

    /// <summary>
    /// sFilter_AccountFrom = [ "" | "Main", | "Extended" | "Main,Extended" ]
    /// </summary>
    /// <returns>AVG_TOTAL_FIELD_01, AVG_TOTAL_FIELD_02, ...AVG_TOTAL_FIELD_07</returns>
    public DataSet Rpt_REPORT_ListDd_Type(string sDateFrom, string sDateTo, string sAccountID, string sFilter_AccountFrom)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spRpt_REPORT_ListDd_Type";

            MyCommand.Parameters.AddWithValue("@DATE_FROM", sDateFrom);
            MyCommand.Parameters.AddWithValue("@DATE_TO", sDateTo);
            MyCommand.Parameters.AddWithValue("@ACCOUNT_ID ", sAccountID);
            MyCommand.Parameters.AddWithValue("@FILTER_ACCOUNT_FROM", sFilter_AccountFrom);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
        }
        return MyDataSet;
    }

    /// <summary>
    /// sFilter_AccountFrom = [ "" | "Main", | "Extended" | "Main,Extended" ]
    /// </summary>
    /// <returns>AVG_LV_FIELD_01, AVG_LV_FIELD_02, ...AVG_LV_FIELD_05</returns>
    public DataSet Rpt_REPORT_ListDd_LVType(string sDateFrom, string sDateTo, string sAccountID, string sFilter_AccountFrom)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spRpt_REPORT_ListDd_LVType";

            MyCommand.Parameters.AddWithValue("@DATE_FROM", sDateFrom);
            MyCommand.Parameters.AddWithValue("@DATE_TO", sDateTo);
            MyCommand.Parameters.AddWithValue("@ACCOUNT_ID ", sAccountID);
            MyCommand.Parameters.AddWithValue("@FILTER_ACCOUNT_FROM", sFilter_AccountFrom);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
        }
        return MyDataSet;
    }

    public DataSet Rpt_GET_vwAccountParticipants(string sAccountID)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spRpt_GET_vwAccountParticipants";

            MyCommand.Parameters.AddWithValue("@ACCOUNT_ID", sAccountID);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
        }
        return MyDataSet;
    }

    /// <summary>
    /// sFilter_AccountFrom = [ "" | "Main", | "Extended" | "Main,Extended" ]
    /// </summary>
    public DataSet Rpt_REPORT_ListPal_Duration(string sAccountID, string sFilter_AccountFrom, string sDateFrom, string sDateTo)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spRpt_REPORT_ListPal_Duration";

            MyCommand.Parameters.AddWithValue("@DATE_FROM", sDateFrom);
            MyCommand.Parameters.AddWithValue("@DATE_TO", sDateTo);
            MyCommand.Parameters.AddWithValue("@ACCOUNT_ID", sAccountID);
            MyCommand.Parameters.AddWithValue("@FILTER_ACCOUNT_FROM", sFilter_AccountFrom);


            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
        }
        return MyDataSet;
    }


    /// <summary>
    /// sFilter_AccountFrom = [ "" | "Main", | "Extended" | "Main,Extended" ]
    /// </summary>
    public DataSet Rpt_REPORT_ListPal_Intensity(string sAccountID, string sFilter_AccountFrom, string sDateFrom, string sDateTo)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spRpt_REPORT_ListPal_Intensity";

            MyCommand.Parameters.AddWithValue("@DATE_FROM", sDateFrom);
            MyCommand.Parameters.AddWithValue("@DATE_TO", sDateTo);
            MyCommand.Parameters.AddWithValue("@ACCOUNT_ID", sAccountID);
            MyCommand.Parameters.AddWithValue("@FILTER_ACCOUNT_FROM", sFilter_AccountFrom);


            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
        }
        return MyDataSet;
    }


    /// <summary>
    /// sFilter_AccountFrom = [ "" | "Main", | "Extended" | "Main,Extended" ]
    /// </summary>
    public DataSet Rpt_REPORT_ListPal_Time(string sAccountID, string sFilter_AccountFrom, string sDateFrom, string sDateTo)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spRpt_REPORT_ListPal_Time";

            MyCommand.Parameters.AddWithValue("@DATE_FROM", sDateFrom);
            MyCommand.Parameters.AddWithValue("@DATE_TO", sDateTo);
            MyCommand.Parameters.AddWithValue("@ACCOUNT_ID", sAccountID);
            MyCommand.Parameters.AddWithValue("@FILTER_ACCOUNT_FROM", sFilter_AccountFrom);


            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
        }
        return MyDataSet;
    }


    /// <summary>
    /// sFilter_AccountFrom = [ "" | "Main", | "Extended" | "Main,Extended" ]
    /// </summary>
    public DataSet Rpt_REPORT_ListPal_Type(string sAccountID, string sFilter_AccountFrom, string sDateFrom, string sDateTo)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spRpt_REPORT_ListPal_Type";

            MyCommand.Parameters.AddWithValue("@DATE_FROM", sDateFrom);
            MyCommand.Parameters.AddWithValue("@DATE_TO", sDateTo);
            MyCommand.Parameters.AddWithValue("@ACCOUNT_ID", sAccountID);
            MyCommand.Parameters.AddWithValue("@FILTER_ACCOUNT_FROM", sFilter_AccountFrom);


            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
        }
        return MyDataSet;
    }

    

  
}