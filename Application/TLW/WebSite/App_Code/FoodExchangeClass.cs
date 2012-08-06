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
/// Summary description for FoodExchangeClass
/// </summary>
public class FoodExchangeClass
{

    #region PrivateMembers
    private SqlConnection m_Connection;
    private string m_sUserID;
    private string m_sMilkTable;
    private string m_sFruitTable;
    private string m_sVegetablesTable;
    private string m_sStarchTable;
    private string m_sProteinsTable;
    private string m_sFatsTable;
    private string m_sWaterTable;
    private string m_sFruitJuiceTable;
    private string m_sSnacksTable;
    private string m_sStarchBeansTable;
    private string m_sStarchDesertsTable;
    private string m_sStarchFatsTable;
    #endregion

    #region Constructors
    public FoodExchangeClass(SqlConnection objSQLConnection)
	{
        m_Connection = objSQLConnection;
        m_sMilkTable = "";
        m_sFruitTable = "";
        m_sVegetablesTable = "";
        m_sStarchTable = "";
        m_sProteinsTable = "";
        m_sFatsTable = "";
        m_sWaterTable = "";
        m_sFruitJuiceTable = "";
        m_sSnacksTable = "";
        m_sStarchBeansTable = "";
        m_sStarchDesertsTable = "";
        m_sStarchFatsTable = "";
	}
    #endregion

    #region Public Methods

    public string GetMilkTable() { return m_sMilkTable; }
    public string GetFruitTable() { return m_sFruitTable; }
    public string GetVegetablesTable() { return m_sVegetablesTable; }
    public string GetStarchTable() { return m_sStarchTable; }
    public string GetProteinsTable() { return m_sProteinsTable = GetProteinsTable(); }
    public string GetFatsTable() { return m_sFatsTable; }
    public string GetWaterTable() { return m_sWaterTable; }
    public string GetFruitJuiceTable() { return m_sFruitJuiceTable; }
    public string GetSnacksTable() { return m_sSnacksTable; }
    public string GetStarchBeansTable() { return m_sStarchBeansTable; }
    public string GetStarchDesertsTable() { return m_sStarchDesertsTable; }
    public string GetStarchFatsTable() { return m_sStarchFatsTable; }

    private void GetFoodExchangeData()
    {
        m_sMilkTable = CreateMilkTable();
        m_sFruitTable = CreateFruitTable();
        m_sVegetablesTable = CreateVegetablesTable();
        m_sStarchTable = CreateStarchTable();
        m_sProteinsTable = CreateProteinsTable();
        m_sFatsTable = CreateFatsTable();
        m_sWaterTable = CreateWaterTable();
        m_sFruitJuiceTable = CreateFruitJuiceTable();
        m_sSnacksTable = CreateSnacksTable();
        m_sStarchBeansTable = CreateStarchBeansTable();
        m_sStarchDesertsTable = CreateStarchDesertsTable();
        m_sStarchFatsTable = CreateStarchFatsTable();

    }

    private string CreateMilkTable()
    {
        string table = "";
        SqlCommand MyCommand;
        SqlDataAdapter MyDataAdapter;
        DataSet MyDataSet = new DataSet();
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = m_Connection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutrition_Get_Milk";
            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                table = "<table>";
                foreach (DataRow DR in MyDataSet.Tables[0].Rows)
                {
                    string sProduct = "";
                    string sMilk = "";
                    string sStarch = "";
                    string sFat = "";
                    string sProtein = "";
                    string sPortionSize = "";
                    string sPortionMeasure = "";
                    
                    if( !Convert.IsDBNull(DR["Product"]) ) sProduct = DR["Product"].ToString(); 
                    if( !Convert.IsDBNull(DR["Milk"]) ) sMilk = DR["Milk"].ToString();
                    if( !Convert.IsDBNull(DR["Starch"]) ) sStarch = DR["Starch"].ToString();
                    if( !Convert.IsDBNull(DR["Fat"]) ) sFat = DR["Fat"].ToString();
                    if( !Convert.IsDBNull(DR["Protein"]) ) sProtein = DR["Protein"].ToString();
                    if( !Convert.IsDBNull(DR["PortionSize"]) ) sPortionSize = DR["PortionSize"].ToString();
                    if( !Convert.IsDBNull(DR["PortionMeasure"]) ) sPortionMeasure = DR["PortionMeasure"].ToString();

                    table += "<tr><td>" + sProduct + "</td><td>" + sMilk + "</td><td>" + sStarch + "</td><td>" + sFat + "</td><td>" + sProtein + "</td><td>" + sPortionSize + "</td><td>" + sPortionMeasure + "</td></tr>";
                
                }
                table += "</table>";
            }
        }
        catch (Exception ex)
        {
            // TODO: log the error
        }
        return table;
    }

    private string CreateFruitTable()
    {
        string table = "";
        SqlCommand MyCommand;
        SqlDataAdapter MyDataAdapter;
        DataSet MyDataSet = new DataSet();
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = m_Connection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutrition_Get_Fruit";
            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                table = "<table>";
                foreach (DataRow DR in MyDataSet.Tables[0].Rows)
                {
                    string sProduct = "";
                    string sFruit = "";
                    string sPortionSize = "";
                    string sPortionMeasure = "";

                    if (!Convert.IsDBNull(DR["Product"])) sProduct = DR["Product"].ToString();
                    if (!Convert.IsDBNull(DR["Fruit"])) sFruit = DR["Fruit"].ToString();
                    if (!Convert.IsDBNull(DR["PortionSize"])) sPortionSize = DR["PortionSize"].ToString();
                    if (!Convert.IsDBNull(DR["PortionMeasure"])) sPortionMeasure = DR["PortionMeasure"].ToString();

                    table += "<tr><td>" + sProduct + "</td><td>" + sFruit + "</td><td>" + sPortionSize + "</td><td>" + sPortionMeasure + "</td></tr>";

                }
                table += "</table>";
            }
        }
        catch (Exception ex)
        {
            // TODO: log the error
        }
        return table;
    }

    private string CreateVegetablesTable()
    {
        string table = "";
        SqlCommand MyCommand;
        SqlDataAdapter MyDataAdapter;
        DataSet MyDataSet = new DataSet();
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = m_Connection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutrition_Get_Vegetables";
            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                table = "<table>";
                foreach (DataRow DR in MyDataSet.Tables[0].Rows)
                {
                    string sProduct = "";
                    string sVegetable = "";
                    string sPortionSize = "";
                    string sPortionMeasure = "";

                    if (!Convert.IsDBNull(DR["Product"])) sProduct = DR["Product"].ToString();
                    if (!Convert.IsDBNull(DR["Vegetable"])) sVegetable = DR["Vegetable"].ToString();
                    if (!Convert.IsDBNull(DR["PortionSize"])) sPortionSize = DR["PortionSize"].ToString();
                    if (!Convert.IsDBNull(DR["PortionMeasure"])) sPortionMeasure = DR["PortionMeasure"].ToString();

                    table += "<tr><td>" + sProduct + "</td><td>" + sVegetable + "</td><td>" + sPortionSize + "</td><td>" + sPortionMeasure + "</td></tr>";

                }
                table += "</table>";
            }
        }
        catch (Exception ex)
        {
            // TODO: log the error
        }
        return table;
    }

    private string CreateStarchTable()
    {
        string table = "";
        SqlCommand MyCommand;
        SqlDataAdapter MyDataAdapter;
        DataSet MyDataSet = new DataSet();
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = m_Connection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutrition_Get_Starch";
            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                table = "<table>";
                foreach (DataRow DR in MyDataSet.Tables[0].Rows)
                {
                    string sProduct = "";
                    string sType = "";
                    string sStarch = "";
                    string sPortionSize = "";
                    string sPortionMeasure = "";

                    if (!Convert.IsDBNull(DR["Product"])) sProduct = DR["Product"].ToString();
                    if (!Convert.IsDBNull(DR["Type"])) sType = DR["Type"].ToString();
                    if (!Convert.IsDBNull(DR["Starch"])) sStarch = DR["Starch"].ToString();
                    if (!Convert.IsDBNull(DR["PortionSize"])) sPortionSize = DR["PortionSize"].ToString();
                    if (!Convert.IsDBNull(DR["PortionMeasure"])) sPortionMeasure = DR["PortionMeasure"].ToString();

                    table += "<tr><td>" + sProduct + "</td><td>" + sType + "</td><td>" + sStarch + "</td><td>" + sPortionSize + "</td><td>" + sPortionMeasure + "</td></tr>";
                }
                table += "</table>";
            }
        }
        catch (Exception ex)
        {
            // TODO: log the error
        }
        return table;
    }

    private string CreateProteinsTable()
    {
        string table = "";
        SqlCommand MyCommand;
        SqlDataAdapter MyDataAdapter;
        DataSet MyDataSet = new DataSet();
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = m_Connection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutrition_Get_Protein";
            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                table = "<table>";
                foreach (DataRow DR in MyDataSet.Tables[0].Rows)
                {
                    string sProduct = "";
                    string sType = "";
                    string sProtein = "";
                    string sFat = "";
                    string sPortionSize = "";
                    string sPortionMeasure = "";

                    if (!Convert.IsDBNull(DR["Product"])) sProduct = DR["Product"].ToString();
                    if (!Convert.IsDBNull(DR["Type"])) sType = DR["Type"].ToString();
                    if (!Convert.IsDBNull(DR["Protein"])) sProtein = DR["Protein"].ToString();
                    if (!Convert.IsDBNull(DR["Fat"])) sFat = DR["Fat"].ToString();
                    if (!Convert.IsDBNull(DR["PortionSize"])) sPortionSize = DR["PortionSize"].ToString();
                    if (!Convert.IsDBNull(DR["PortionMeasure"])) sPortionMeasure = DR["PortionMeasure"].ToString();

                    table += "<tr><td>" + sProduct + "</td><td>" + sType + "</td><td>" + sProtein + "</td><td>" + sFat + "</td><td>" + sPortionSize + "</td><td>" + sPortionMeasure + "</td></tr>";

                }
                table += "</table>";
            }
        }
        catch (Exception ex)
        {
            // TODO: log the error
        }
        return table;
    }

    private string CreateFatsTable()
    {
        string table = "";
        SqlCommand MyCommand;
        SqlDataAdapter MyDataAdapter;
        DataSet MyDataSet = new DataSet();
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = m_Connection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutrition_Get_Fats";
            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                table = "<table>";
                foreach (DataRow DR in MyDataSet.Tables[0].Rows)
                {
                    string sProduct = "";
                    string sType = "";
                    string sFat = "";
                    string sPortionSize = "";
                    string sPortionMeasure = "";

                    if (!Convert.IsDBNull(DR["Product"])) sProduct = DR["Product"].ToString();
                    if (!Convert.IsDBNull(DR["Type"])) sType = DR["Type"].ToString();
                    if (!Convert.IsDBNull(DR["Fat"])) sFat = DR["Fat"].ToString();
                    if (!Convert.IsDBNull(DR["PortionSize"])) sPortionSize = DR["PortionSize"].ToString();
                    if (!Convert.IsDBNull(DR["PortionMeasure"])) sPortionMeasure = DR["PortionMeasure"].ToString();

                    table += "<tr><td>" + sProduct + "</td><td>" + sType + "</td><td>" + sFat + "</td><td>" + sPortionSize + "</td><td>" + sPortionMeasure + "</td></tr>";


                }
                table += "</table>";
            }
        }
        catch (Exception ex)
        {
            // TODO: log the error
        }
        return table;
    }

    private string CreateWaterTable()
    {
        return "8 Glasses of water daily.";
    }

    private string CreateFruitJuiceTable()
    {
        string table = "";
        SqlCommand MyCommand;
        SqlDataAdapter MyDataAdapter;
        DataSet MyDataSet = new DataSet();
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = m_Connection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutrition_Get_FruitJuice";
            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                table = "<table>";
                foreach (DataRow DR in MyDataSet.Tables[0].Rows)
                {
                    string sProduct = "";
                    string sFruitJuice = "";
                    string sPortionSize = "";
                    string sPortionMeasure = "";

                    if (!Convert.IsDBNull(DR["Product"])) sProduct = DR["Product"].ToString();
                    if (!Convert.IsDBNull(DR["FruitJuice"])) sFruitJuice = DR["FruitJuice"].ToString();
                    if (!Convert.IsDBNull(DR["PortionSize"])) sPortionSize = DR["PortionSize"].ToString();
                    if (!Convert.IsDBNull(DR["PortionMeasure"])) sPortionMeasure = DR["PortionMeasure"].ToString();

                    table += "<tr><td>" + sProduct + "</td><td>" + sFruitJuice + "</td><td>" + sPortionSize + "</td><td>" + sPortionMeasure + "</td></tr>";

                }
                table += "</table>";
            }
        }
        catch (Exception ex)
        {
            // TODO: log the error
        }
        return table;
    }

    private string CreateSnacksTable()
    {
        string table = "";
        SqlCommand MyCommand;
        SqlDataAdapter MyDataAdapter;
        DataSet MyDataSet = new DataSet();
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = m_Connection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutrition_Get_Snacks";
            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                table = "<table>";
                foreach (DataRow DR in MyDataSet.Tables[0].Rows)
                {
                    string sProduct = "";
                    string sType = "";
                    string sStarch = "";
                    string sFat = "";
                    string sPortionSize = "";
                    string sPortionMeasure = "";

                    if (!Convert.IsDBNull(DR["Product"])) sProduct = DR["Product"].ToString();
                    if (!Convert.IsDBNull(DR["Type"])) sType = DR["Type"].ToString();
                    if (!Convert.IsDBNull(DR["Starch"])) sStarch = DR["Starch"].ToString();
                    if (!Convert.IsDBNull(DR["Fat"])) sFat = DR["Fat"].ToString();
                    if (!Convert.IsDBNull(DR["PortionSize"])) sPortionSize = DR["PortionSize"].ToString();
                    if (!Convert.IsDBNull(DR["PortionMeasure"])) sPortionMeasure = DR["PortionMeasure"].ToString();

                    table += "<tr><td>" + sProduct + "</td><td>" + sType + "</td><td>" + sStarch + "</td><td>" + sFat + "</td><td>" + sPortionSize + "</td><td>" + sPortionMeasure + "</td></tr>";

                }
                table += "</table>";
            }
        }
        catch (Exception ex)
        {
            // TODO: log the error
        }
        return table;
    }

    private string CreateStarchBeansTable()
    {
        string table = "";
        SqlCommand MyCommand;
        SqlDataAdapter MyDataAdapter;
        DataSet MyDataSet = new DataSet();
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = m_Connection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutrition_Get_StarchBeans";
            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                table = "<table>";
                foreach (DataRow DR in MyDataSet.Tables[0].Rows)
                {
                    string sProduct = "";
                    string sType = "";
                    string sStarch = "";
                    string sFat = "";
                    string sPortionSize = "";
                    string sPortionMeasure = "";

                    if (!Convert.IsDBNull(DR["Product"])) sProduct = DR["Product"].ToString();
                    if (!Convert.IsDBNull(DR["Type"])) sType = DR["Type"].ToString();
                    if (!Convert.IsDBNull(DR["Starch"])) sStarch = DR["Starch"].ToString();
                    if (!Convert.IsDBNull(DR["Fat"])) sFat = DR["Fat"].ToString();
                    if (!Convert.IsDBNull(DR["PortionSize"])) sPortionSize = DR["PortionSize"].ToString();
                    if (!Convert.IsDBNull(DR["PortionMeasure"])) sPortionMeasure = DR["PortionMeasure"].ToString();

                    table += "<tr><td>" + sProduct + "</td><td>" + sType + "</td><td>" + sStarch + "</td><td>" + sFat + "</td><td>" + sPortionSize + "</td><td>" + sPortionMeasure + "</td></tr>";
                }
                table += "</table>";
            }
        }
        catch (Exception ex)
        {
            // TODO: log the error
        }
        return table;
    }

    private string CreateStarchDesertsTable()
    {
        string table = "";
        SqlCommand MyCommand;
        SqlDataAdapter MyDataAdapter;
        DataSet MyDataSet = new DataSet();
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = m_Connection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutrition_Get_StarchDeserts";
            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                table = "<table>";
                foreach (DataRow DR in MyDataSet.Tables[0].Rows)
                {
                    string sProduct = "";
                    string sType = "";
                    string sStarch = "";
                    string sFat = "";
                    string sPortionSize = "";
                    string sPortionMeasure = "";

                    if (!Convert.IsDBNull(DR["Product"])) sProduct = DR["Product"].ToString();
                    if (!Convert.IsDBNull(DR["Type"])) sType = DR["Type"].ToString();
                    if (!Convert.IsDBNull(DR["Starch"])) sStarch = DR["Starch"].ToString();
                    if (!Convert.IsDBNull(DR["Fat"])) sFat = DR["Fat"].ToString();
                    if (!Convert.IsDBNull(DR["PortionSize"])) sPortionSize = DR["PortionSize"].ToString();
                    if (!Convert.IsDBNull(DR["PortionMeasure"])) sPortionMeasure = DR["PortionMeasure"].ToString();

                    table += "<tr><td>" + sProduct + "</td><td>" + sType + "</td><td>" + sStarch + "</td><td>" + sFat + "</td><td>" + sPortionSize + "</td><td>" + sPortionMeasure + "</td></tr>";
                }
                table += "</table>";
            }
        }
        catch (Exception ex)
        {
            // TODO: log the error
        }
        return table;
    }

    private string CreateStarchFatsTable()
    {
        string table = "";
        SqlCommand MyCommand;
        SqlDataAdapter MyDataAdapter;
        DataSet MyDataSet = new DataSet();
        try
        {
            MyCommand = new SqlCommand();
            MyCommand.Connection = m_Connection;
            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spNutrition_Get_StarchFats";
            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                table = "<table>";
                foreach (DataRow DR in MyDataSet.Tables[0].Rows)
                {
                    string sProduct = "";
                    string sType = "";
                    string sStarch = "";
                    string sFat = "";
                    string sPortionSize = "";
                    string sPortionMeasure = "";

                    if (!Convert.IsDBNull(DR["Product"])) sProduct = DR["Product"].ToString();
                    if (!Convert.IsDBNull(DR["Type"])) sType = DR["Type"].ToString();
                    if (!Convert.IsDBNull(DR["Starch"])) sStarch = DR["Starch"].ToString();
                    if (!Convert.IsDBNull(DR["Fat"])) sFat = DR["Fat"].ToString();
                    if (!Convert.IsDBNull(DR["PortionSize"])) sPortionSize = DR["PortionSize"].ToString();
                    if (!Convert.IsDBNull(DR["PortionMeasure"])) sPortionMeasure = DR["PortionMeasure"].ToString();

                    table += "<tr><td>" + sProduct + "</td><td>" + sType + "</td><td>" + sStarch + "</td><td>" + sFat + "</td><td>" + sPortionSize + "</td><td>" + sPortionMeasure + "</td></tr>";

                }
                table += "</table>";
            }
        }
        catch (Exception ex)
        {
            // TODO: log the error
        }
        return table;
    }


    #endregion

}