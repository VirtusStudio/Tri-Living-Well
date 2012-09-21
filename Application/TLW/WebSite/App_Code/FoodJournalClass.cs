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

public class FoodJournalClass
{
    private SqlConnection MyConnection;
    private SqlCommand MyCommand;
    private SqlDataAdapter MyDataAdapter;
    private DataSet MyDataSet = new DataSet();

    public FoodJournalClass(SqlConnection objSQLConnection)
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

    public void SetJournalData(int iFoodIntakeLogId, int iMealId, string sUserID, DateTime dtFoodIntakeDate, string strMilkDetails, string strFruitDetails, string strVegetablesDetails,
        string strStarchDetails, string strProteinDetails, string strFATDetails)
    {
        SqlCommand MyCommand;
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutritionFoodJournalSetByDate";
            MyCommand.Parameters.AddWithValue("@FOODINTAKELOGID", iFoodIntakeLogId);
            MyCommand.Parameters.AddWithValue("@MEALID", iMealId);
            MyCommand.Parameters.AddWithValue("@USERID", sUserID);
            MyCommand.Parameters.AddWithValue("@LOGDATE", dtFoodIntakeDate.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.GetCultureInfo("en-US")));
            MyCommand.Parameters.AddWithValue("@MILKDETAILS", strMilkDetails);
            MyCommand.Parameters.AddWithValue("@FRUITDETAILS", strFruitDetails);
            MyCommand.Parameters.AddWithValue("@VEGETABLEDETAILS", strVegetablesDetails);
            MyCommand.Parameters.AddWithValue("@STARCHDETAILS", strStarchDetails);
            MyCommand.Parameters.AddWithValue("@PROTEINDETAILS", strProteinDetails);
            MyCommand.Parameters.AddWithValue("@FATDETAILS", strFATDetails);
            MyCommand.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
    }

    public DataSet GetJournalData(string sUserID, DateTime dtFoodIntakeDate)
    {
        DataSet journalDataSet = new DataSet();
        DateTime dtFrom = dtFoodIntakeDate.Date;
        DateTime dtTo = dtFoodIntakeDate.Date;
        dtTo = dtTo.AddHours(11);
        dtTo = dtTo.AddMinutes(59);
        dtTo = dtTo.AddSeconds(59);

        SqlCommand MyCommand;
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutritionFoodJournalGet";
            MyCommand.Parameters.AddWithValue("@USERID", sUserID);
            MyCommand.Parameters.AddWithValue("@FROMDATE", dtFrom.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.GetCultureInfo("en-US")));
            MyCommand.Parameters.AddWithValue("@TODATE", dtTo.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.GetCultureInfo("en-US")));
            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(journalDataSet);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
        return journalDataSet;
    }


    public string GetJournalNotes(string sUserID, DateTime dtFoodIntakeDate)
    {
        if (sUserID.Trim().Length == 0) return "";
        string notes = "";
        SqlCommand MyCommand;
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutritionFoodJournalNotesGet";
            MyCommand.Parameters.AddWithValue("@USERID", sUserID);
            MyCommand.Parameters.AddWithValue("@DATESELECTED", dtFoodIntakeDate.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.GetCultureInfo("en-US")));
            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                notes = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["strNotes"])) ? "" : MyDataSet.Tables[0].Rows[0]["strNotes"].ToString();
            }
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
        return notes;
    }

    public void SetJournalNotes(string sUserID, DateTime dtFoodIntakeDate, string notes)
    {
        if (sUserID.Trim().Length == 0) return;
        SqlCommand MyCommand;
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutritionFoodJournalNotesSet";
            MyCommand.Parameters.AddWithValue("@USER_ID", sUserID);
            MyCommand.Parameters.AddWithValue("@LOGDATE", dtFoodIntakeDate.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.GetCultureInfo("en-US")));
            MyCommand.Parameters.AddWithValue("@NOTES", notes);
            MyCommand.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
    }

    public DataSet GetFoodSearch(string food)
    {
        DataSet searchDataSet = new DataSet();
        if (food.Trim().Length == 0) return searchDataSet;
        SqlCommand MyCommand;
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutritionFoodSearch";
            MyCommand.Parameters.AddWithValue("@FOODTYPE", food);
            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(searchDataSet);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
        return searchDataSet;
    }

}