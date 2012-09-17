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
/// Summary description for ScorecardClass
/// </summary>
public class ScorecardClass
{
    #region PrivateMembers
    private string m_sUserID;
    private string m_sDateSelected;
    private int m_iPersonalSummaryIdFirst;
    private decimal m_decWeightFirst;
    private decimal m_decWaistFirst;
    private decimal m_decBMIFirst;
    private decimal m_decBodyFatPercentageFirst;
    private decimal m_decWaistToHeightFirst;
    private decimal m_decWaistToHipFirst;
    private int m_iPersonalSummaryIdLast;
    private decimal m_decWeightLast;
    private decimal m_decWaistLast;
    private decimal m_decBMILast;
    private decimal m_decBodyFatPercentageLast;
    private decimal m_decWaistToHeightLast;
    private decimal m_decWaistToHipLast;
    private SqlConnection MyConnection;
    private SqlCommand MyCommand;
    private SqlDataAdapter MyDataAdapter;
    private DataSet MyDataSet = new DataSet();
    #endregion

    #region Constructors
    public ScorecardClass(SqlConnection objSQLConnection, string sUserID, string sDateSelected = "")
	{
        m_iPersonalSummaryIdFirst = 0;
        m_decWeightFirst = 0m;
        m_decWaistFirst = 0m;
        m_decBMIFirst = 0m;
        m_decBodyFatPercentageFirst = 0m;
        m_decWaistToHeightFirst = 0m;
        m_decWaistToHipFirst = 0m;
        m_iPersonalSummaryIdLast = 0;
        m_decWeightLast = 0m;
        m_decWaistLast = 0m;
        m_decBMILast = 0m;
        m_decBodyFatPercentageLast = 0m;
        m_decWaistToHeightLast = 0m;
        m_decWaistToHipLast = 0m;

        try
        {
            m_sUserID = sUserID;
            m_sDateSelected = sDateSelected;
            MyConnection = objSQLConnection;
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
        GetUserData();
	}
    #endregion

    #region Public Methods
    public string GetUserID() { return m_sUserID; }
    public int GetPersonalSummaryIdFirst() { return m_iPersonalSummaryIdFirst; }
    public decimal GetWeightFirst() { return m_decWeightFirst; }
    public decimal GetWaistFirst() { return m_decWaistFirst; }
    public decimal GetBMIFirst() { return m_decBMIFirst; }
    public decimal GetBodyFatPercentageFirst() { return m_decBodyFatPercentageFirst; }
    public decimal GetWaistToHeightFirst() { return m_decWaistToHeightFirst; }
    public decimal GetWaistToHipFirst() { return m_decWaistToHipFirst; }
    public int GetPersonalSummaryIdLast() { return m_iPersonalSummaryIdLast; }
    public decimal GetWeightLast() { return m_decWeightLast; }
    public decimal GetWaistLast() { return m_decWaistLast; }
    public decimal GetBMILast() { return m_decBMILast; }
    public decimal GetBodyFatPercentageLast() { return m_decBodyFatPercentageLast; }
    public decimal GetWaistToHeightLast() { return m_decWaistToHeightLast; }
    public decimal GetWaistToHipLast() { return m_decWaistToHipLast; }
    public string GetDateSelected() { return m_sDateSelected; }
    public void SetDateSelected(string sDateSelected) { m_sDateSelected = sDateSelected; }

    public void SetUserData( string sUserID, string sDateSelected, int iPersonalSummaryId, decimal decWeight, decimal decWaist, decimal decBMI, decimal decBodyFatPercentage, decimal decWaistToHeight, decimal decWaistToHip)
    {
        SqlCommand MyCommand;
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutritionScorecardSetByDate";
            MyCommand.Parameters.AddWithValue("@USERID", sUserID);
            MyCommand.Parameters.AddWithValue("@DATE_SELECTED", sDateSelected);
            MyCommand.Parameters.AddWithValue("@PERSONALSUMMARYID", iPersonalSummaryId);
            MyCommand.Parameters.AddWithValue("@WEIGHT", decWeight);
            MyCommand.Parameters.AddWithValue("@WAIST", decWaist);
            MyCommand.Parameters.AddWithValue("@BMI", decBMI);
            MyCommand.Parameters.AddWithValue("@FAT", decBodyFatPercentage);
            MyCommand.Parameters.AddWithValue("@WAIST_HEIGHT", decWaistToHeight);
            MyCommand.Parameters.AddWithValue("@WAIST_HIP", decWaistToHip);
            MyCommand.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            // TODO: log the error
        }
    }

    #endregion

    #region Private Methods

    private void GetUserData()
    {
        if (m_sUserID.Trim().Length == 0) return;

        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutritionScorecardGetFirst";
            MyCommand.Parameters.AddWithValue("@USER_ID", m_sUserID);
            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                m_iPersonalSummaryIdFirst = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["intPersonalSummaryId"])) ? 0 : Convert.ToInt32(MyDataSet.Tables[0].Rows[0]["intPersonalSummaryId"]);
                m_decWeightFirst = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decWeight"])) ? 0 : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decWeight"]);
                m_decWaistFirst = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decWaist"])) ? 0 : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decWaist"]);
                m_decBMIFirst = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decBMI"])) ? 0 : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decBMI"]);
                m_decBodyFatPercentageFirst = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decBodyFATPercentage"])) ? 0 : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decBodyFATPercentage"]);
                m_decWaistToHeightFirst = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decWaistToHeight"])) ? 0 : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decWaistToHeight"]);
                m_decWaistToHipFirst = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decWaistToHip"])) ? 0 : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decWaistToHip"]);
            }
            else
            {
                m_iPersonalSummaryIdFirst = 0;
                m_decWeightFirst = 0m;
                m_decWaistFirst = 0m;
                m_decBMIFirst = 0m;
                m_decBodyFatPercentageFirst = 0m;
                m_decWaistToHeightFirst = 0m;
                m_decWaistToHipFirst = 0m;
            }
        }
        catch (Exception ex)
        {
            // TODO: log the error
        }

        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = MyConnection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutritionScorecardGetLast";
            MyCommand.Parameters.AddWithValue("@USER_ID", m_sUserID);
            MyCommand.Parameters.AddWithValue("@DATE_SELECTED", m_sDateSelected);
            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                m_iPersonalSummaryIdLast = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["intPersonalSummaryId"])) ? 0 : Convert.ToInt32(MyDataSet.Tables[0].Rows[0]["intPersonalSummaryId"]);
                m_decWeightLast = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decWeight"])) ? 0 : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decWeight"]);
                m_decWaistLast = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decWaist"])) ? 0 : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decWaist"]);
                m_decBMILast = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decBMI"])) ? 0 : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decBMI"]);
                m_decBodyFatPercentageLast = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decBodyFATPercentage"])) ? 0 : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decBodyFATPercentage"]);
                m_decWaistToHeightLast = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decWaistToHeight"])) ? 0 : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decWaistToHeight"]);
                m_decWaistToHipLast = (Convert.IsDBNull(MyDataSet.Tables[0].Rows[0]["decWaistToHip"])) ? 0 : Convert.ToDecimal(MyDataSet.Tables[0].Rows[0]["decWaistToHip"]);
            }
            else
            {
                m_iPersonalSummaryIdLast = 0;
                m_decWeightLast = 0m;
                m_decWaistLast = 0m;
                m_decBMILast = 0m;
                m_decBodyFatPercentageLast = 0m;
                m_decWaistToHeightLast = 0m;
                m_decWaistToHipLast = 0m;
            }
        }
        catch (Exception ex)
        {
            // TODO: log the error
        }
    }

    #endregion






}