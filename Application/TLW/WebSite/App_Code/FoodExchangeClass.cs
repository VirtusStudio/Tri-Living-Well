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
    private string m_sFruitJuiceTable;
    private string m_sVegetablesTable;
    private string m_sStarchBreadsTable;        
    private string m_sStarchGrainsTable;       
    private string m_sStarchVegetablesTable;
    private string m_sStarchSnacksTable;
    private string m_sStarchCerealsTable;
    private string m_sStarchBeansTable;
    private string m_sStarchFatsTable;
    private string m_sStarchDessertsTable;
    private string m_sStarchCreamyDessertsTable;
    private string m_sProteinBeefTable;
    private string m_sProteinCheeseTable;
    private string m_sProteinEggsTable;
    private string m_sProteinFishTable;
    private string m_sProteinLambTable;
    private string m_sProteinPorkTable;
    private string m_sProteinPoultryTable;
    private string m_sProteinShellfishTable;
    private string m_sProteinVealTable;
    private string m_sProteinOtherTable;
    private string m_sFatsMonosaturatedTable;
    private string m_sFatsPolyunsaturatedTable;
    private string m_sFatsSaturatedTable;
    private string m_sSnacksBreakfastBarsTable;
    private string m_sSnacksChipsTable;
    private string m_sSnacksCookiesTable;
    private string m_sSnacksCrackersTable;
    private string m_sSnacksCandyTable;
    private string m_sSnacksCakesTable;
    private string m_sWaterTable;
    private string m_FoodExchangeTable;

    #endregion

    #region Constructors
    public FoodExchangeClass(SqlConnection objSQLConnection)
	{
        m_Connection = objSQLConnection;

        m_sMilkTable = "";
        m_sFruitTable = "";
        m_sFruitJuiceTable = "";
        m_sVegetablesTable = "";
        m_sStarchBreadsTable = "";     
        m_sStarchGrainsTable = "";  
        m_sStarchVegetablesTable = "";
        m_sStarchSnacksTable = "";
        m_sStarchCerealsTable = "";
        m_sStarchBeansTable = "";
        m_sStarchFatsTable = "";
        m_sStarchDessertsTable = "";
        m_sStarchCreamyDessertsTable = "";
        m_sProteinBeefTable = "";
        m_sProteinCheeseTable = "";
        m_sProteinEggsTable = "";
        m_sProteinFishTable = "";
        m_sProteinLambTable = "";
        m_sProteinPorkTable = "";
        m_sProteinPoultryTable = "";
        m_sProteinShellfishTable = "";
        m_sProteinVealTable = "";
        m_sProteinOtherTable = "";
        m_sFatsMonosaturatedTable = "";
        m_sFatsPolyunsaturatedTable = "";
        m_sFatsSaturatedTable = "";
        m_sSnacksBreakfastBarsTable = "";
        m_sSnacksChipsTable = "";
        m_sSnacksCookiesTable = "";
        m_sSnacksCrackersTable = "";
        m_sSnacksCandyTable = "";
        m_sSnacksCakesTable = "";
        m_sWaterTable = "";
        m_FoodExchangeTable = "";

        GetFoodExchangeData();
        CreateFoodExchangeTable();

	}
    #endregion

    #region Public Methods

    public string GetFoodExchangeTable() { 
        return m_FoodExchangeTable;
    
    }

    private void GetFoodExchangeData()
    {

        string[] headers = { "Milk/Dairy Products", "Milk", "Starch", "Fat", "Protein", "Portion" };  
        string[] columns = { "Product", "", "Milk", "Starch", "Fat", "Protein", "PortionSize", "PortionMeasure" }; 
        m_sMilkTable = CreateTable(headers, columns, "spNutrition_Get_Milk");
        
        string[] headers1 = { "Fruit Description", "Fruit", "&nbsp;", "&nbsp;", "&nbsp;", "Portion" };  
        string[] columns1 = { "Product", "", "Fruit", "&nbsp;", "&nbsp;", "&nbsp;", "PortionSize", "PortionMeasure" }; 
        m_sFruitTable = CreateTable(headers1, columns1, "spNutrition_Get_Fruit");
        
        string[] headers2 = { "Juice Description", "Fruit Juice", "&nbsp;", "&nbsp;", "&nbsp;", "Portion" };  
        string[] columns2 = { "Product", "", "FruitJuice", "&nbsp;", "&nbsp;", "&nbsp;", "PortionSize", "PortionMeasure" }; 
        m_sFruitJuiceTable = CreateTable(headers2, columns2, "spNutrition_Get_FruitJuice");

        string[] headers3 = { "Vegetable Description", "# of Vegetables", "&nbsp;", "&nbsp;", "&nbsp;", "Portion" };  
        string[] columns3 = { "Product", "", "Vegetable", "&nbsp;", "&nbsp;", "&nbsp;", "PortionSize", "PortionMeasure" }; 
        m_sVegetablesTable = CreateTable(headers3, columns3, "spNutrition_Get_Vegetables");

        string[] headers4 = { "Type of Bread", "# of Starches", "&nbsp;", "&nbsp;", "&nbsp;", "Portion" };
        string[] columns4 = { "Product", "Type", "Starch", "&nbsp;", "&nbsp;", "&nbsp;", "PortionSize", "PortionMeasure" }; 
        m_sStarchBreadsTable = CreateTable(headers4, columns4, "spNutrition_Get_StarchBreads"); 

        string[] headers5 = { "Type of Grain", "# of Starches", "&nbsp;", "&nbsp;", "&nbsp;", "Portion" };
        string[] columns5 = { "Product", "Type", "Starch", "&nbsp;", "&nbsp;", "&nbsp;", "PortionSize", "PortionMeasure" }; 
        m_sStarchGrainsTable = CreateTable(headers5, columns5, "spNutrition_Get_StarchGrains");

        string[] headers6 = { "Type of Vegetable", "# of Starches", "&nbsp;", "&nbsp;", "&nbsp;", "Portion" };
        string[] columns6 = { "Product", "Type", "Starch", "&nbsp;", "&nbsp;", "&nbsp;", "PortionSize", "PortionMeasure" }; 
        m_sStarchVegetablesTable = CreateTable(headers6, columns6, "spNutrition_Get_StarchVegetables");

        string[] headers7 = { "Type of Snack", "# of Starches", "Fats", "&nbsp;", "&nbsp;", "Portion" };
        string[] columns7 = { "Product", "Type", "Starch", "Fats", "&nbsp;", "&nbsp;", "PortionSize", "PortionMeasure" }; 
        m_sStarchSnacksTable = CreateTable(headers7, columns7, "spNutrition_Get_StarchSnacks");

        string[] headers8 = { "Type of Cereal", "# of Starches", "&nbsp;", "&nbsp;", "&nbsp;", "Portion" };
        string[] columns8 = { "Product", "Type", "Starch", "&nbsp;", "&nbsp;", "&nbsp;", "PortionSize", "PortionMeasure" }; 
        m_sStarchCerealsTable = CreateTable(headers8, columns8, "spNutrition_Get_StarchCereals");

        string[] headers9 = { "Type", "# of Starches", "Protein", "&nbsp;", "&nbsp;", "Portion" };
        string[] columns9 = { "Product", "Type", "Starch", "Protein", "&nbsp;", "&nbsp;", "PortionSize", "PortionMeasure" };
        m_sStarchBeansTable = CreateTable(headers9, columns9, "spNutrition_Get_StarchBeans");

        string[] headers10 = { "Description", "# of Starches", "Fats", "&nbsp;", "&nbsp;", "Portion" };
        string[] columns10 = { "Product", "Type", "Starch", "Fat", "&nbsp;", "&nbsp;", "PortionSize", "PortionMeasure" };
        m_sStarchFatsTable = CreateTable(headers10, columns10, "spNutrition_Get_StarchFats");

        string[] headers11 = { "Type/Description", "# of Starches", "Fats", "&nbsp;", "&nbsp;", "Portion" };
        string[] columns11 = { "Product", "Type", "Starch", "Fat", "&nbsp;", "&nbsp;", "PortionSize", "PortionMeasure" };
        m_sStarchDessertsTable = CreateTable(headers11, columns11, "spNutrition_Get_StarchDesserts");
        m_sStarchCreamyDessertsTable = CreateTable(headers11, columns11, "spNutrition_Get_StarchCreamyDesserts");

        string[] headers12 = { "Type/Description", "Protein", "Fats", "&nbsp;", "&nbsp;", "Portion" };
        string[] columns12 = { "Product", "Type", "Protein", "Fats", "&nbsp;", "&nbsp;", "PortionSize", "PortionMeasure" };
        m_sProteinBeefTable =  CreateTable(headers12, columns12, "spNutrition_Get_ProteinBeef");
        m_sProteinCheeseTable =  CreateTable(headers12, columns12, "spNutrition_Get_ProteinCheese");
        m_sProteinEggsTable =  CreateTable(headers12, columns12, "spNutrition_Get_ProteinEggs");
        m_sProteinFishTable =  CreateTable(headers12, columns12, "spNutrition_Get_ProteinFish");
        m_sProteinLambTable =  CreateTable(headers12, columns12, "spNutrition_Get_ProteinLamb");
        m_sProteinPorkTable =  CreateTable(headers12, columns12, "spNutrition_Get_ProteinPork");
        m_sProteinPoultryTable =  CreateTable(headers12, columns12, "spNutrition_Get_ProteinPoultry");
        m_sProteinShellfishTable =  CreateTable(headers12, columns12, "spNutrition_Get_ProteinShellfish");
        m_sProteinVealTable =  CreateTable(headers12, columns12, "spNutrition_Get_ProteinVeal");
        m_sProteinOtherTable =  CreateTable(headers12, columns12, "spNutrition_Get_ProteinOther");

        string[] headers13 = { "Type/Description", "Fats", "&nbsp;", "&nbsp;", "&nbsp;", "Portion" };
        string[] columns13 = { "Product", "Type", "Fats", "&nbsp;", "&nbsp;", "&nbsp;", "PortionSize", "PortionMeasure" };
        m_sFatsMonosaturatedTable = CreateTable(headers13, columns13, "spNutrition_Get_FatsMonosaturated");
        m_sFatsPolyunsaturatedTable = CreateTable(headers13, columns13, "spNutrition_Get_FatsPolyunsaturated");
        m_sFatsSaturatedTable = CreateTable(headers13, columns13, "spNutrition_Get_FatsPolyunsaturated");


        string[] headers14 = { "Type/Description", "Starch", "Fats", "&nbsp;", "&nbsp;", "Portion" };
        string[] columns14 = { "Product", "Type", "Fats", "Fats", "&nbsp;", "&nbsp;", "PortionSize", "PortionMeasure" };
        m_sSnacksBreakfastBarsTable = CreateTable(headers14, columns14, "spNutrition_Get_SnacksBreakfastBars");
        m_sSnacksChipsTable = CreateTable(headers14, columns14, "spNutrition_Get_SnacksChips");
        m_sSnacksCookiesTable = CreateTable(headers14, columns14, "spNutrition_Get_SnacksCookies");
        m_sSnacksCrackersTable = CreateTable(headers14, columns14, "spNutrition_Get_SnacksCrackers");
        m_sSnacksCandyTable = CreateTable(headers14, columns14, "spNutrition_Get_SnacksCandy");
        m_sSnacksCakesTable = CreateTable(headers14, columns14, "spNutrition_Get_SnacksCakes");

        m_sWaterTable = CreateWaterTable();

    }

    private void CreateFoodExchangeTable()
    {
        string table = "<table>";

        table += "<tr><td><a name='Milk'></a>Milk<br /><br /></td></tr>";
        table += "<tr><td>" + m_sMilkTable + "</td></tr>";
        
        table += "<tr><td><br /><br /><a name='Fruit'></a>Fruit<br /><br /></td></tr>";
        table += "<tr><td>" + m_sFruitTable + "</td></tr>";

        table += "<tr><td><br /><br />Fruit Juice<br /><br /></td></tr>";
        table += "<tr><td>" + m_sFruitJuiceTable + "</td></tr>";
        
        table += "<tr><td><br /><br /><a name='Vegetables'></a>Vegetables<br /><br /></td></tr>";
        table += "<tr><td>" + m_sVegetablesTable + "</td></tr>";
        
        table += "<tr><td><br /><br /><a name='Starch'></a>Starch List<br /><br /></td></tr>";
        table += "<tr><td>Breads<br /></td></tr>";
        table += "<tr><td>" + m_sStarchBreadsTable + "</td></tr>";

        table += "<tr><td><br />Grains<br /></td></tr>";
        table += "<tr><td>" + m_sStarchGrainsTable + "</td></tr>";

        table += "<tr><td><br />Starchy Vegetables<br /></td></tr>";
        table += "<tr><td>" + m_sStarchVegetablesTable + "</td></tr>";

        table += "<tr><td><br />Crackers & Snacks<br /></td></tr>";
        table += "<tr><td>" + m_sStarchSnacksTable + "</td></tr>";

        table += "<tr><td><br />Cereals<br /></td></tr>";
        table += "<tr><td>" + m_sStarchCerealsTable + "</td></tr>";

        table += "<tr><td><br />Beans, Peas, & Lentils<br /></td></tr>";
        table += "<tr><td>" + m_sStarchBeansTable + "</td></tr>";

        table += "<tr><td><br />Starches with Fats<br /></td></tr>";
        table += "<tr><td>" + m_sStarchFatsTable + "</td></tr>";

        table += "<tr><td><br />Desserts<br /></td></tr>";
        table += "<tr><td>" + m_sStarchDessertsTable + "</td></tr>";

        table += "<tr><td><br />Frozen Creamy Desserts<br /></td></tr>";
        table += "<tr><td>" + m_sStarchCreamyDessertsTable + "</td></tr>";
        
        table += "<tr><td><br /><br /><a name='Protein'></a>Protein<br /><br /></td></tr>";
        table += "<tr><td>Beef<br /></td></tr>";
        table += "<tr><td>" + m_sProteinBeefTable + "</td></tr>";

        table += "<tr><td><br />Cheese<br /></td></tr>";
        table += "<tr><td>" + m_sProteinCheeseTable + "</td></tr>";

        table += "<tr><td><br />Eggs<br /></td></tr>";
        table += "<tr><td>" + m_sProteinEggsTable + "</td></tr>";

        table += "<tr><td><br />Fish<br /></td></tr>";
        table += "<tr><td>" + m_sProteinFishTable + "</td></tr>";

        table += "<tr><td><br />Fish<br /></td></tr>";
        table += "<tr><td>" + m_sStarchBreadsTable + "</td></tr>";

        table += "<tr><td><br />Lamb<br /></td></tr>";
        table += "<tr><td>" + m_sProteinLambTable + "</td></tr>";

        table += "<tr><td><br />Pork<br /></td></tr>";
        table += "<tr><td>" + m_sProteinPorkTable + "</td></tr>";

        table += "<tr><td><br />Poultry<br /></td></tr>";
        table += "<tr><td>" + m_sProteinPoultryTable + "</td></tr>";

        table += "<tr><td><br />Shellfish<br /></td></tr>";
        table += "<tr><td>" + m_sProteinShellfishTable + "</td></tr>";

        table += "<tr><td><br />Veal<br /></td></tr>";
        table += "<tr><td>" + m_sProteinVealTable + "</td></tr>";

        table += "<tr><td><br />Other Proteins<br /></td></tr>";
        table += "<tr><td>" + m_sProteinOtherTable + "</td></tr>";
        
        table += "<tr><td><br /><br /><a name='Fat'></a>Fat<br /><br /></td></tr>";
        table += "<tr><td>Monosaturated Fats<br /></td></tr>";
        table += "<tr><td>" + m_sFatsMonosaturatedTable + "</td></tr>";

        table += "<tr><td><br />Polyunsaturated Fats<br /></td></tr>";
        table += "<tr><td>" + m_sFatsPolyunsaturatedTable + "</td></tr>";

        table += "<tr><td><br />Saturated Fats<br /></td></tr>";
        table += "<tr><td>" + m_sFatsSaturatedTable + "</td></tr>";

        table += "<tr><td><br /><br />Snacks<br /><br /></td></tr>";
        table += "<tr><td>Breakfast Bars<br /></td></tr>";
        table += "<tr><td>" + m_sSnacksBreakfastBarsTable + "</td></tr>";

        table += "<tr><td><br />Chips<br /></td></tr>";
        table += "<tr><td>" + m_sSnacksChipsTable + "</td></tr>";

        table += "<tr><td><br />Cookies<br /></td></tr>";
        table += "<tr><td>" + m_sSnacksCookiesTable + "</td></tr>";

        table += "<tr><td><br />Crackers<br /></td></tr>";
        table += "<tr><td>" + m_sSnacksCrackersTable + "</td></tr>";

        table += "<tr><td><br />Candy<br /></td></tr>";
        table += "<tr><td>" + m_sSnacksCandyTable + "</td></tr>";
        
        table += "<tr><td><br /><br /><a name='Water'></a>Water<br /></td></tr>";
        table += "<tr><td>" + m_sWaterTable + "</td></tr>";

        m_FoodExchangeTable = table;
    }

    private string CreateTable(string[] colHeaders, string[] colNames, string spName)
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
            MyCommand.CommandText = spName;
            MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
            if (MyDataSet.Tables[0].Rows.Count > 0)
            {
                table = "<table><tr>";
                table += "<th width='30%' align='left'>" + colHeaders[0] + "</th>";
                table += "<th width='14%' align='left'>" + colHeaders[1] + "</th>";
                table += "<th width='14%' align='left'>" + colHeaders[2] + "</th>";
                table += "<th width='14%' align='left'>" + colHeaders[3] + "</th>";
                table += "<th width='14%' align='left'>" + colHeaders[4] + "</th>";
                table += "<th width='14%' align='left'>" + colHeaders[5] + "</th></tr>";

                foreach (DataRow DR in MyDataSet.Tables[0].Rows)
                {
                    string portionSize = "";
                    string portionMeasure = "";

                    table += "<tr>";

                    if (colNames[0].Equals("&nbsp;") || Convert.IsDBNull(DR[colNames[0]]))
                        table += "<td align='left'>&nbsp;</td>";
                    else
                    {
                        string product = DR[colNames[0]].ToString();
                        string type = "";
                        if (colNames[1].Equals(""))
                        {
                            table += "<td align='left'>" + product + "</td>";     
                        }
                        else
                        {
                            type = (Convert.IsDBNull(DR[colNames[1]])) ? "" : DR[colNames[1]].ToString();
                            table += "<td align='left'>" + product;
                            if (type.Length > 0) table += " / " + type;
                            table += "</td>";
                        }
                    }
                    if (colNames[2].Equals("&nbsp;"))
                        table += "<td align='left'>&nbsp;</td>";
                    else if (Convert.IsDBNull(DR[colNames[2]]))
                        table += "<td align='left'>0.00</td>";
                    else table += "<td align='left'>" + Convert.ToDouble(DR[colNames[2]]).ToString("0.00") + "</td>";

                    if (colNames[3].Equals("&nbsp;"))
                        table += "<td align='left'>&nbsp;</td>";
                    else if (Convert.IsDBNull(DR[colNames[3]]))
                        table += "<td align='left'>0.00</td>";
                    else table += "<td align='left'>" + Convert.ToDouble(DR[colNames[3]]).ToString("0.00") + "</td>";

                    if (colNames[4].Equals("&nbsp;"))
                        table += "<td align='left'>&nbsp;</td>";
                    else if (Convert.IsDBNull(DR[colNames[4]]))
                        table += "<td align='left'>0.00</td>";
                    else table += "<td align='left'>" + Convert.ToDouble(DR[colNames[4]]).ToString("0.00") + "</td>";

                    if (colNames[5].Equals("&nbsp;"))
                        table += "<td align='left'>&nbsp;</td>";
                    else if (Convert.IsDBNull(DR[colNames[5]]))
                        table += "<td align='left'>0.00</td>";
                    else table += "<td align='left'>" + Convert.ToDouble(DR[colNames[5]]).ToString("0.00") + "</td>";

                    if (colNames[6].Equals("&nbsp;") || Convert.IsDBNull(DR[colNames[6]]))
                        portionSize = "&nbsp;";
                    else portionSize = Convert.ToDouble(DR[colNames[6]]).ToString("0.00");

                    if (colNames[7].Equals("&nbsp;") || Convert.IsDBNull(DR[colNames[7]]))
                        portionMeasure = "&nbsp;";
                    else if (Convert.IsDBNull(DR[colNames[7]]))
                        portionMeasure = "";
                    else portionMeasure = DR[colNames[7]].ToString();

                    table += "<td align='left'>" + portionSize + " " + portionMeasure + "</td></tr>";

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

    #endregion

}