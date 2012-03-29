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


public class TextAreaClass
{
    SqlConnection MyConnection;
    SqlCommand MyCommand;
    SqlDataAdapter MyDataAdapter;

    DataSet MyDataSet = new DataSet();

    public TextAreaClass(SqlConnection objSQLConnection)
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


    public DataSet TxA_Get_TextAreas(string sTextAreaName, string sTop)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spTxA_Get_TextAreas";
            MyCommand.Parameters.AddWithValue("@TextAreaName", sTextAreaName);
            MyCommand.Parameters.AddWithValue("@Top", sTop);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {

        }
        return MyDataSet;
    }



  
    public DataSet Get_MultipleCMSPagesText()
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "sp_Get_MultipleCMSPagesText";
            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {

        }
        return MyDataSet;
    }


    /// <summary>
    /// sTextAreaHTML and sIsPreview are optional parameters.  If nothing is passed, they will not be updated.
    /// </summary>
    public DataSet TxA_INSERT_TextAreas(string sTextAreaName, string sTextAreaHTML, string sIsPreview)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spTxA_INSERT_TextAreas";
            MyCommand.Parameters.AddWithValue("@TextAreaName", sTextAreaName);
            MyCommand.Parameters.AddWithValue("@TextAreaHTML", sTextAreaHTML);
            MyCommand.Parameters.AddWithValue("@isPreview", sIsPreview);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {

        }
        return MyDataSet;
    }




    /// <summary>
    /// sTextAreaHTML and sIsPreview are optional parameters.  If nothing is passed, they will not be updated.
    /// </summary>
    public DataSet TxA_UPDATE_TextAreas(string sTextAreaId, string sTextAreaHTML)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spTxA_UPDATE_TextAreas";
            MyCommand.Parameters.AddWithValue("@TextAreaId", sTextAreaId);
            MyCommand.Parameters.AddWithValue("@TextAreaHTML", sTextAreaHTML);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {

        }
        return MyDataSet;
    }


    /// <summary>
    /// sTextAreaHTML and sIsPreview are optional parameters.  If nothing is passed, they will not be updated.
    /// </summary>
    public DataSet TxA_UPDATE_TextAreas_IsPreview(string sTextAreaId, string sIsPreview)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spTxA_UPDATE_TextAreas_IsPreview";
            MyCommand.Parameters.AddWithValue("@TextAreaId", sTextAreaId);
            MyCommand.Parameters.AddWithValue("@isPreview", sIsPreview);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {

        }
        return MyDataSet;
    }

    /// <summary>
    /// sTextAreaHTML and sIsPreview are optional parameters.  If nothing is passed, they will not be updated.
    /// </summary>
    public DataSet TxA_DELETE_TextAreas_BT_TextAreaId(string sTextAreaId)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spTxA_DELETE_TextAreas_BT_TextAreaId";
            MyCommand.Parameters.AddWithValue("@TextAreaId", sTextAreaId);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {

        }
        return MyDataSet;
    }

}