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
/// Summary description for CaloricRequirementsCalculatorClass
/// </summary>
public class CaloricRequirementsCalculatorClass
{
    private SqlConnection MyConnection;
    private SqlCommand MyCommand;
    private SqlDataAdapter MyDataAdapter;

    public CaloricRequirementsCalculatorClass(SqlConnection objSQLConnection)
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


    public int GetCurrentCaloricRequirements(string sUserID)
    {
        int iCaloricRequirement = 0;
        DataSet MyDataSet = new DataSet();
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spDD_GET_Users_Calorie";
            MyCommand.Parameters.AddWithValue("@USER_ID", sUserID);
            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                iCaloricRequirement = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["CALORIE_NUMBER"])) ? iCaloricRequirement = 0 : Convert.ToInt32(MyDataSet.Tables[0].Rows[0]["CALORIE_NUMBER"]);
            }   
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }

        return iCaloricRequirement;
    }

    public void SetCurrentCaloricRequirements(string sUserID, int iCaloricRequirement)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spDD_SET_Users_Calorie";
            MyCommand.Parameters.AddWithValue("@USER_ID", sUserID);
            MyCommand.Parameters.AddWithValue("@CALORIE", iCaloricRequirement);
            MyCommand.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
    }

    public DataSet GetCaloricRequirementsCalculator(string sUserID)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spCaloricCalculator_GetUserData";
            MyCommand.Parameters.AddWithValue("@USER_ID", sUserID);
            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);

        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
        return MyDataSet;
    }

/*
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                m_iPersonalSummaryId = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["intPersonalSummaryId"])) ? 0 : Convert.ToInt32(MyDataSet.Tables[0].Rows[0]["intPersonalSummaryId"]);
                m_decWeight = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decWeight"])) ? 0 : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decWeight"]);
                m_decWaist = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decWaist"])) ? 0 : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decWaist"]);
                m_decBMI = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decBMI"])) ? 0 : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decBMI"]);
                m_decBodyFATPercentage = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decBodyFATPercentage"])) ? 0 : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decBodyFATPercentage"]);
                m_decWaistToHeight = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decWaistToHeight"])) ? 0 : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decWaistToHeight"]);
                m_decWaistToHip = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decWaistToHip"])) ? 0 : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decWaistToHip"]);
                m_decLossFrequencyGoal = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decLossFrequencyGoal"])) ? 0 : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decLossFrequencyGoal"]);
                m_sActivityLevel = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["sActivityLevel"])) ? "" : MyDataSet.Tables[0].Rows[0]["sActivityLevel"].ToString();

                // Lean Body Mass = Total Body Weight x (1 - Body Fat %)
                if (m_decBodyFATPercentage > 0)
                {
                    decimal percentageMultiplier = .01m;
                    m_decBodyFATPercentage = Decimal.Multiply(m_decBodyFATPercentage, percentageMultiplier);
                    m_decLeanBodyMass = m_decWeight * (1 - m_decBodyFATPercentage);
                    m_decLeanBodyMass = Decimal.Round(m_decLeanBodyMass, 2);
                }

                // Weight Goal Calories = Caloric Requirement – (Loss Frequency Goal x 3500)/7
                m_iGoalCalories = m_iCaloricRequirement - Convert.ToInt32(((m_decLossFrequencyGoal * 3500) / 7));

*/ 
    public void SetCaloricRequirementsCalculator(string sUserID, int iPersonalSummaryId, decimal decLeanBodyMass = 0m, decimal decWeight = 0m, decimal decLossFrequencyGoal = 0m, int iActivityLevel = 0, decimal decWaist = 0m, decimal decBMI = 0m, decimal decBodyFATPercentage = 0m, decimal decWaistToHeight = 0m, decimal decWaistToHip = 0m)     
    {
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spDD_SET_Users_Calorie";
            MyCommand.Parameters.AddWithValue("@USER_ID", sUserID);
            MyCommand.Parameters.AddWithValue("@PERSONAL_SUMMARY_ID", iPersonalSummaryId);
            MyCommand.Parameters.AddWithValue("@LEAN_BODY_MASS", decLeanBodyMass);
            MyCommand.Parameters.AddWithValue("@WEIGHT", decWeight);
            MyCommand.Parameters.AddWithValue("@WAIST", decWaist);
            MyCommand.Parameters.AddWithValue("@BMI", decBMI);
            MyCommand.Parameters.AddWithValue("@BODY_FAT_PERCENTAGE", decBodyFATPercentage);
            MyCommand.Parameters.AddWithValue("@WAIST_TO_HEIGHT", decWaistToHeight);
            MyCommand.Parameters.AddWithValue("@WAIST_TO_HEIGHT", decWaistToHip);
            MyCommand.Parameters.AddWithValue("@LOSS_FREQUENCY_GOAL", decLossFrequencyGoal);
            MyCommand.Parameters.AddWithValue("@ACTIVITY_LEVEL", iActivityLevel);
            MyCommand.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
    }

}