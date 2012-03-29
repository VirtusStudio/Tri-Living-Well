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


public class ForumClass
{
    SqlConnection MyConnection;
    SqlCommand MyCommand;
    SqlDataAdapter MyDataAdapter;

    DataSet MyDataSet = new DataSet();

    public ForumClass(SqlConnection objSQLConnection)
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
    public DataSet Fum_INSERT_ForumPersonalMessages(string sMessageGroupID, string sFromUserID, string sToUserID, string sBody)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spFum_INSERT_ForumPersonalMessages";
            MyCommand.Parameters.AddWithValue("@MessageGroupID", sMessageGroupID);
            MyCommand.Parameters.AddWithValue("@FromUserID", sFromUserID);
            MyCommand.Parameters.AddWithValue("@ToUserID", sToUserID);
            MyCommand.Parameters.AddWithValue("@Body", sBody);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {

        }
        return MyDataSet;
    }

    public DataSet Fum_GET_ForumPersonalMessages_BY_UserId(string sUserID, string sNew)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spFum_GET_ForumPersonalMessages_BY_UserId";
            MyCommand.Parameters.AddWithValue("@USER_ID", sUserID);
            MyCommand.Parameters.AddWithValue("@New", sNew);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {

        }
        return MyDataSet;
    }


    public DataSet Fum_UPDATE_ForumPersonalMessages_BY_MessageGroupID(string sMessageGroupID, string sArchiveFlg)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spFum_UPDATE_ForumPersonalMessages_BY_MessageGroupID";
            MyCommand.Parameters.AddWithValue("@MessageGroupID", sMessageGroupID);
            MyCommand.Parameters.AddWithValue("@ArchiveFlg", sArchiveFlg);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {

        }
        return MyDataSet;
    }

}