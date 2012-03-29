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

public class VisitlogClass
{
    SqlConnection sqlConn;
    SqlCommand sqlCommand;
    SqlDataAdapter sqlDataAdapter;
    
    DataSet sqlDataSet = new DataSet();
    
    bool debug;

    public VisitlogClass(SqlConnection objsqlConnection)
    {
        try
        {
            sqlConn = objsqlConnection;
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
    }

    /*****************************************************************************/

    public DataSet GET_VisitlogAction_BY_VisitID(string visitID)
    {
        sqlDataSet = new DataSet();

        try
        {
            sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConn;

            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "sp_GET_VisitlogAction_BY_VisitID";
            sqlCommand.Parameters.AddWithValue("@VISITID", Convert.ToInt32(visitID));
            sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(sqlDataSet);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }

        return sqlDataSet;
    }

    /*****************************************************************************/

    public DataSet GET_Visitlog_BY_Date(DateTime from, DateTime to)
    {
        to = to.AddHours(24);
        sqlDataSet = new DataSet();

        try
        {
            sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConn;

            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "sp_GET_Visitlog_BY_Date";
            sqlCommand.Parameters.AddWithValue("@DATE_FROM", from);
            sqlCommand.Parameters.AddWithValue("@DATE_TO", to);
            sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(sqlDataSet);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }

        return sqlDataSet;
    }

    /*****************************************************************************/

    public DataSet GET_Visitlog_BY_VisitID(string visitID)
    {
        sqlDataSet = new DataSet();

        try
        {
            sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConn;

            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "sp_GET_Visitlog_BY_VisitID";
            sqlCommand.Parameters.AddWithValue("@VISITID", Convert.ToInt32(visitID));
            sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(sqlDataSet);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }

        return sqlDataSet;
    }

    /*****************************************************************************/

    public string INSERT_Visitlog(string agent, string visitIP)
    {
        string visitID = "0";
        DataSet DS = new DataSet();

        try
        {
            sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConn;

            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "sp_INSERT_Visitlog";
            sqlCommand.Parameters.AddWithValue("@AGENT", agent);
            sqlCommand.Parameters.AddWithValue("@VISITIP", visitIP);
            sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(DS);

            visitID = DS.Tables[0].Rows[0]["VISIT_ID"].ToString();
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }

        return visitID;
    }

    /*****************************************************************************/

    public void INSERT_VisitlogAction(string visitID, string userName, int A, int B, int C, int D, string primary, string secondary, string comment)
    {
        try
        {
            sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConn;

            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "sp_INSERT_VisitlogAction";
            sqlCommand.Parameters.AddWithValue("@VISITID", visitID);
            sqlCommand.Parameters.AddWithValue("@USERNAME", userName);
            sqlCommand.Parameters.AddWithValue("@A", A);
            sqlCommand.Parameters.AddWithValue("@B", B);
            sqlCommand.Parameters.AddWithValue("@C", C);
            sqlCommand.Parameters.AddWithValue("@D", D);
            sqlCommand.Parameters.AddWithValue("@PRIMARY", primary);
            sqlCommand.Parameters.AddWithValue("@SECONDARY", secondary);
            sqlCommand.Parameters.AddWithValue("@COMMENT", comment);
            sqlDataAdapter = new SqlDataAdapter(sqlCommand);

            sqlCommand.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);        
        }
    }

    /*****************************************************************************/

    public DataSet GET_VisitlogLegend(string A, string B, string C, string D)
    {
        sqlDataSet = new DataSet();

        try
        {
            sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConn;

            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "sp_GET_VisitlogLegend";
            sqlCommand.Parameters.AddWithValue("@A", Convert.ToInt32(A));
            sqlCommand.Parameters.AddWithValue("@B", Convert.ToInt32(B));
            sqlCommand.Parameters.AddWithValue("@C", Convert.ToInt32(C));
            sqlCommand.Parameters.AddWithValue("@D", Convert.ToInt32(D));
            sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(sqlDataSet);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }

        return sqlDataSet;
    }

    /*****************************************************************************/
}