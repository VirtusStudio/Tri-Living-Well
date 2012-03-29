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


public class TemplateClass
{
    SqlConnection MyConnection;
    SqlCommand MyCommand;
    SqlDataAdapter MyDataAdapter;

    DataSet MyDataSet = new DataSet();

    public TemplateClass(SqlConnection objSQLConnection)
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


    public DataSet Tpl_GET_Templates_BY_TemplateId(string sTemplateID)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spTpl_GET_Templates_BY_TemplateId";
            MyCommand.Parameters.AddWithValue("@TEMPLATE_ID", sTemplateID);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {

        }
        return MyDataSet;
    }


    public DataSet Tpl_GET_Templates_BY_TemplateName(string sTemplateName, string sIsPrieviewMode)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spTpl_GET_Templates_BY_TemplateId";
            MyCommand.Parameters.AddWithValue("@TemplateName", sTemplateName);
            MyCommand.Parameters.AddWithValue("@IsPrieviewMode", sIsPrieviewMode);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {

        }
        return MyDataSet;
    }

    public DataSet Tpl_UPDATE_Templates(string sTemplateID, string sTemplateText)
    {


        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spTpl_UPDATE_Templates";

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