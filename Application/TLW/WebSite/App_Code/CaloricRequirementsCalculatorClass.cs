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

    #region PrivateMembers
    private SqlConnection m_Connection;
    private string m_sUserID;
    private int m_iCaloricRequirement;
    private int m_iGoalCalories;
    private decimal m_decLeanBodyMass;
    private decimal m_decLossFrequencyGoal;
    private string m_sActivityLevel;
    private int m_iPersonalSummaryId;
    private decimal m_decWeight;
    private decimal m_decWaist;
    private decimal m_decBMI;
    private decimal m_decBodyFATPercentage;
    private decimal m_decWaistToHeight;
    private decimal m_decWaistToHip;
    #endregion

    #region Constructors
    public CaloricRequirementsCalculatorClass(SqlConnection objSQLConnection, string sUserID)
	{
        m_Connection = objSQLConnection;
        m_sUserID = sUserID;
        m_iCaloricRequirement = 0;
        m_iGoalCalories = 0;
        m_decLeanBodyMass = 0m;
        m_decLossFrequencyGoal = 0m;
        m_sActivityLevel = "";
        m_iPersonalSummaryId = 0;
        m_decWeight = 0m;
        m_decWaist = 0m;
        m_decBMI = 0m;
        m_decBodyFATPercentage = 0m;
        m_decWaistToHeight = 0m;
        m_decWaistToHip = 0m;
        GetMemberData();
	}
    #endregion

    #region Public Methods
    public int getCaloricRequirement() { return m_iCaloricRequirement; }
    public int getGoalCalories() { return m_iGoalCalories; }
    public decimal getLeanBodyMass() { return m_decLeanBodyMass; }
    public decimal getLossFrequencyGoal() { return m_decLossFrequencyGoal; }
    public string getActivityLevel() { return m_sActivityLevel; }
    public decimal getWeight() { return m_decWeight; }
    public decimal getWaist() { return m_decWaist; }
    public decimal getBMI() { return m_decBMI; }
    public decimal getBodyFATPercentage() { return m_decBodyFATPercentage; }
    public decimal getWaistToHeight() { return m_decWaistToHeight; }
    public decimal getWaistToHip() { return m_decWaistToHip; }
    #endregion

    #region Public Methods

    private void GetMemberData()
    {
        GetCurrentCaloricRequirements();
        GetUserData();
    }

    private void GetCurrentCaloricRequirements()
    {
        m_iCaloricRequirement = 0;
        SqlCommand MyCommand;
        SqlDataAdapter MyDataAdapter;
        DataSet MyDataSet = new DataSet();
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = m_Connection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spDD_GET_Users_Calorie";
            MyCommand.Parameters.AddWithValue("@USER_ID", m_sUserID);
            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                m_iCaloricRequirement = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["CALORIE_NUMBER"])) ? m_iCaloricRequirement = 0 : Convert.ToInt32(MyDataSet.Tables[0].Rows[0]["CALORIE_NUMBER"]);
            }   
        }
        catch (Exception ex)
        {
            // TODO: log the error
        }
    }

    private void SetCurrentCaloricRequirements(int iCaloricRequirement)
    {
        SqlCommand MyCommand;
        SqlDataAdapter MyDataAdapter;
        DataSet MyDataSet = new DataSet();
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = m_Connection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spDD_SET_Users_Calorie";
            MyCommand.Parameters.AddWithValue("@USER_ID", m_sUserID);
            MyCommand.Parameters.AddWithValue("@CALORIE", iCaloricRequirement);
            MyCommand.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            // TODO: log the error
        }
    }

    private void GetUserData()
    {
        m_decLeanBodyMass = 0m;
        m_iPersonalSummaryId = 0;
        m_decWeight = 0m;
        m_decWaist = 0m;
        m_decBMI = 0m;
        m_decBodyFATPercentage = 0m;
        m_decWaistToHeight = 0m;
        m_decWaistToHip = 0m;
        m_decLossFrequencyGoal = 0m;
        m_sActivityLevel = "";

        SqlCommand MyCommand;
        SqlDataAdapter MyDataAdapter;
        DataSet MyDataSet = new DataSet();
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = m_Connection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spCaloricCalculator_GetUserData";
            MyCommand.Parameters.AddWithValue("@USER_ID", m_sUserID);
            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
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
            }
        }
        catch (Exception ex)
        {
            // TODO: log the error
            string msg = ex.Message;
        }
    }

    public void SetUserData(decimal decLeanBodyMass = 0m, decimal decWeight = 0m, decimal decLossFrequencyGoal = 0m, string sActivityLevel = "", decimal decWaist = 0m, decimal decBMI = 0m, decimal decBodyFATPercentage = 0m, decimal decWaistToHeight = 0m, decimal decWaistToHip = 0m)     
    {
        if( decLeanBodyMass == 0m ) decLeanBodyMass = m_decLeanBodyMass;
        if (decWeight == 0m) decWeight = m_decWeight;
        if( decWaist == 0m ) decWaist = m_decWaist;
        if( decBMI == 0m ) decBMI = m_decBMI;
        if( decBodyFATPercentage == 0m ) decBodyFATPercentage = m_decBodyFATPercentage;
        if( decWaistToHeight == 0m ) decWaistToHeight = m_decWaistToHeight;
        if( decWaistToHip == 0m ) decWaistToHip = m_decWaistToHip;
        if (decLossFrequencyGoal == 0m) decLossFrequencyGoal = m_decLossFrequencyGoal;
        if( sActivityLevel == "" ) sActivityLevel = m_sActivityLevel;    
        
        SqlCommand MyCommand;
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = m_Connection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spDD_SET_Users_Calorie";
            MyCommand.Parameters.AddWithValue("@USER_ID", m_sUserID);
            MyCommand.Parameters.AddWithValue("@PERSONAL_SUMMARY_ID", m_iPersonalSummaryId);
            MyCommand.Parameters.AddWithValue("@LEAN_BODY_MASS", decLeanBodyMass);
            MyCommand.Parameters.AddWithValue("@WEIGHT", decWeight);
            MyCommand.Parameters.AddWithValue("@WAIST", decWaist);
            MyCommand.Parameters.AddWithValue("@BMI", decBMI);
            MyCommand.Parameters.AddWithValue("@BODY_FAT_PERCENTAGE", decBodyFATPercentage);
            MyCommand.Parameters.AddWithValue("@WAIST_TO_HEIGHT", decWaistToHeight);
            MyCommand.Parameters.AddWithValue("@WAIST_TO_HEIGHT", decWaistToHip);
            MyCommand.Parameters.AddWithValue("@LOSS_FREQUENCY_GOAL", decLossFrequencyGoal);
            MyCommand.Parameters.AddWithValue("@ACTIVITY_LEVEL", sActivityLevel);
            MyCommand.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            // TODO: log the error
        }
    }

    #endregion






}