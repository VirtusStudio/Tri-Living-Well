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


public class DDClass
{
    SqlConnection MyConnection;
    SqlCommand MyCommand;
    SqlDataAdapter MyDataAdapter;

    DataSet MyDataSet = new DataSet();

    public DDClass(SqlConnection objSQLConnection)
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
    public DataSet DD_GET_DdEntries_BY_UserId(string sUserID, string sDateFrom, string sDateTo)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spDD_GET_DdEntries_BY_UserId";
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

    public DataSet DD_GET_DdEntries_BY_EntryId(string sEntryID)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spDD_GET_DdEntries_BY_EntryId";
            MyCommand.Parameters.AddWithValue("@DD_ENTRY_ID", sEntryID);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {

        }
        return MyDataSet;
    }


    public DataSet DD_INSERT_DdEntries( string sUserID, string sDateDdEntryDate, string sEditTotals, string[] arrsBreakfast, string[] arrsLunch, string[] arrsDinner, string[] arrsTotal, string[] arrsLifeValue)
    {


        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spDD_INSERT_DdEntries";


            MyCommand.Parameters.AddWithValue("@USER_ID", sUserID);
            MyCommand.Parameters.AddWithValue("@DD_ENTRY_DATE", sDateDdEntryDate);
            MyCommand.Parameters.AddWithValue("@TOTAL_EDIT_FLG", sEditTotals);

            for (int i = 1; i <= 7; i++)
            {
                MyCommand.Parameters.AddWithValue("@B_FIELD_0" + i.ToString(),arrsBreakfast[i]);
                MyCommand.Parameters.AddWithValue("@L_FIELD_0" + i.ToString(), arrsLunch[i]);
                MyCommand.Parameters.AddWithValue("@D_FIELD_0" + i.ToString(), arrsDinner[i]);
                MyCommand.Parameters.AddWithValue("@TOTAL_FIELD_0" + i.ToString(), arrsTotal[i]);
            }

            for (int i = 1; i <= 5; i++)
            {
                MyCommand.Parameters.AddWithValue("@LV_FIELD_0" + i.ToString(), arrsLifeValue[i]);
            }



            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
        }
        return MyDataSet;
    }

    public DataSet DD_UPDATE_DdEntries(string sDdEntryID, string sUserID, string sDateDdEntryDate, string sEditTotals, string[] arrsBreakfast, string[] arrsLunch, string[] arrsDinner, string[] arrsTotal, string[] arrsLifeValue)
    {


        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spDD_UPDATE_DdEntries";


            MyCommand.Parameters.AddWithValue("@DD_ENTRY_ID", sDdEntryID);
           // MyCommand.Parameters.AddWithValue("@USER_ID", sUserID);
            MyCommand.Parameters.AddWithValue("@DD_ENTRY_DATE", sDateDdEntryDate);
            MyCommand.Parameters.AddWithValue("@TOTAL_EDIT_FLG", sEditTotals);

            for (int i = 1; i <= 7; i++)
            {
                MyCommand.Parameters.AddWithValue("@B_FIELD_0" + i.ToString(), arrsBreakfast[i]);
                MyCommand.Parameters.AddWithValue("@L_FIELD_0" + i.ToString(), arrsLunch[i]);
                MyCommand.Parameters.AddWithValue("@D_FIELD_0" + i.ToString(), arrsDinner[i]);
                MyCommand.Parameters.AddWithValue("@TOTAL_FIELD_0" + i.ToString(), arrsTotal[i]);
            }

            for (int i = 1; i <= 5; i++)
            {
                MyCommand.Parameters.AddWithValue("@LV_FIELD_0" + i.ToString(), arrsLifeValue[i]);
            }



            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
        }
        return MyDataSet;
    }



    public DataSet DD_UPDATE_DdUsers(string sUserID, string sCalorieNumber)
    {


        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spDD_UPDATE_DdUsers";


            MyCommand.Parameters.AddWithValue("@USER_ID", sUserID);
            MyCommand.Parameters.AddWithValue("@CALORIE_NUMBER", sCalorieNumber);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
        }
        return MyDataSet;
    }

    public DataSet DD_INSERT_DdUsers(string sUserID, string sCalorieNumber)
    {


        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spDD_INSERT_DdUsers";


            MyCommand.Parameters.AddWithValue("@USER_ID", sUserID);
            MyCommand.Parameters.AddWithValue("@CALORIE_NUMBER", sCalorieNumber);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
        }
        return MyDataSet;
    }

    public DataSet DD_GET_DdUsers_BY_UserId(string sUserID)
    {


        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spDD_GET_DdUsers_BY_UserId";


            MyCommand.Parameters.AddWithValue("@USER_ID", sUserID);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
        }
        return MyDataSet;
    }
    public DataSet get_User_Calorie(string sUserID)
    {


        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spDD_GET_Users_Calorie";


            MyCommand.Parameters.AddWithValue("@USER_ID", sUserID);

            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
        }
        return MyDataSet;
    }
    


}