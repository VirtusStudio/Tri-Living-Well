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


public class CorpClass
{
    SqlConnection MyConnection;
    SqlCommand MyCommand;
    SqlDataAdapter MyDataAdapter;

    DataSet MyDataSet = new DataSet();

    public CorpClass(SqlConnection objSQLConnection)
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


    public DataSet Crp_GET_CorpTemplates_BY_TemplateId(string sTemplateID)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spCrp_GET_CorpTemplates_BY_TemplateId";
            MyCommand.Parameters.AddWithValue("@TEMPLATE_ID", sTemplateID);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
        }
        return MyDataSet;
    }



    public DataSet Crp_UPDATE_CorpTemplates(string sTemplateID, string sTemplateText)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spCrp_UPDATE_CorpTemplates";
            MyCommand.Parameters.AddWithValue("@TEMPLATE_ID", sTemplateID);
            MyCommand.Parameters.AddWithValue("@TEMPLATE_TEXT", sTemplateText);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
        }
        return MyDataSet;
    }



}