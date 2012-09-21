using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;

public partial class Controls_UC_Nutrition_FoodJournal_Popup : System.Web.UI.UserControl
{

    private SqlConnClass objSqlConnClass = new SqlConnClass();

    protected void Page_Load(object sender, EventArgs e){}

    protected void Page_PreRender(object sender, EventArgs e)
    {
        FillOutForm();
    }

    private void FillOutForm(string sJournalDate = "")
    {
        FoodJournalClass fjc = new FoodJournalClass(objSqlConnClass.OpenConnection());
        DateTime dtFoodIntakeDate = DateTime.Today;

        if( sJournalDate.Trim().Length > 0 ) 
            dtFoodIntakeDate = Convert.ToDateTime(sJournalDate);
        else
            dtFoodIntakeDate = DateTime.Now;
        
        textNotes.Text = fjc.GetJournalNotes(Membership.GetUser().ProviderUserKey.ToString(), dtFoodIntakeDate);
        textJournalDate.Text = sJournalDate;

        int iTotalMilk = 0;
        int iTotalFruit = 0;
        int iTotalVeg = 0;
        int iTotalStarch = 0;
        int iTotalProtein = 0;
        int iTotalFat = 0;
        
        int iCounter = 0;
        DataSet journalDataSet = fjc.GetJournalData(Membership.GetUser().ProviderUserKey.ToString(), dtFoodIntakeDate);
        try
        {
            if ((journalDataSet != null) && (journalDataSet.Tables.Count > 0))
            {
                foreach (DataRow dataRow in journalDataSet.Tables[0].Rows)
                {
                    iCounter++;
                    if (iCounter > 6) break;

                    int iFoodIntakeLogId = (Convert.IsDBNull(dataRow["intFoodIntakeLogId"])) ? 0 : Convert.ToInt32(dataRow["intFoodIntakeLogId"]);
                    int iMeal = (Convert.IsDBNull(dataRow["intMealId"])) ? 0 : Convert.ToInt32(dataRow["intMealId"]);
                    string guidUserId = (Convert.IsDBNull(dataRow["guidUserId"])) ? "" : dataRow["guidUserId"].ToString();
                    DateTime logDate = (Convert.IsDBNull(dataRow["dtFoodIntakeDate"])) ? DateTime.MinValue : Convert.ToDateTime(dataRow["dtFoodIntakeDate"]);
                    int iMilkDetails = (Convert.IsDBNull(dataRow["strMilkDetails"])) ? 0 : Convert.ToInt32(dataRow["strMilkDetails"].ToString());
                    int iFruitDetails = (Convert.IsDBNull(dataRow["strFruitDetails"])) ? 0 : Convert.ToInt32(dataRow["strFruitDetails"].ToString());
                    int iVegetablesDetails = (Convert.IsDBNull(dataRow["strVegetablesDetails"])) ? 0 : Convert.ToInt32(dataRow["strVegetablesDetails"].ToString());
                    int iStarchDetails = (Convert.IsDBNull(dataRow["strStarchDetails"])) ? 0 : Convert.ToInt32(dataRow["strStarchDetails"].ToString());
                    int iProteinDetails = (Convert.IsDBNull(dataRow["strProteinDetails"])) ? 0 : Convert.ToInt32(dataRow["strProteinDetails"].ToString());
                    int iFATDetails = (Convert.IsDBNull(dataRow["strFATDetails"])) ? 0 : Convert.ToInt32(dataRow["strFATDetails"].ToString());

                    iTotalMilk += iMilkDetails;
                    iTotalFruit += iFruitDetails;
                    iTotalVeg += iVegetablesDetails;
                    iTotalStarch += iStarchDetails;
                    iTotalProtein += iProteinDetails;
                    iTotalFat += iFATDetails;

                    switch (iCounter)
                    {
                        case 1:
                            FoodIntakeLogId1.Value = iFoodIntakeLogId.ToString();
                            ddlMeal1.SelectedIndex = iMeal;
                            string hours1 = logDate.Hour.ToString();
                            if (hours1.Length == 1) hours1 = "0" + hours1;
                            string minutes1 = logDate.Minute.ToString();
                            if (minutes1.Length == 1) minutes1 = "0" + minutes1;
                            textJournalTime1.Text = hours1 + ":" + minutes1;
                            txtMilkRecord1.Text = iMilkDetails.ToString();
                            txtFruitRecord1.Text = iFruitDetails.ToString();
                            txtVegetablesRecord1.Text = iVegetablesDetails.ToString();
                            txtStarchRecord1.Text = iStarchDetails.ToString();
                            txtProteinRecord1.Text = iProteinDetails.ToString();
                            txtFatRecord1.Text = iFATDetails.ToString();
                            break;
                        case 2:
                            FoodIntakeLogId2.Value = iFoodIntakeLogId.ToString();
                            ddlMeal2.SelectedIndex = iMeal;
                            string hours2 = logDate.Hour.ToString();
                            if (hours2.Length == 1) hours2 = "0" + hours2;
                            string minutes2 = logDate.Minute.ToString();
                            if (minutes2.Length == 1) minutes2 = "0" + minutes2;
                            textJournalTime2.Text = hours2 + ":" + minutes2;
                            txtMilkRecord2.Text = iMilkDetails.ToString();
                            txtFruitRecord2.Text = iFruitDetails.ToString();
                            txtVegetablesRecord2.Text = iVegetablesDetails.ToString();
                            txtStarchRecord2.Text = iStarchDetails.ToString();
                            txtProteinRecord2.Text = iProteinDetails.ToString();
                            txtFatRecord2.Text = iFATDetails.ToString();
                            break;
                        case 3:
                            FoodIntakeLogId3.Value = iFoodIntakeLogId.ToString();
                            ddlMeal3.SelectedIndex = iMeal;
                            string hours3 = logDate.Hour.ToString();
                            if (hours3.Length == 1) hours3 = "0" + hours3;
                            string minutes3 = logDate.Minute.ToString();
                            if (minutes3.Length == 1) minutes3 = "0" + minutes3;
                            textJournalTime3.Text = hours3 + ":" + minutes3;
                            txtMilkRecord3.Text = iMilkDetails.ToString();
                            txtFruitRecord3.Text = iFruitDetails.ToString();
                            txtVegetablesRecord3.Text = iVegetablesDetails.ToString();
                            txtStarchRecord3.Text = iStarchDetails.ToString();
                            txtProteinRecord3.Text = iProteinDetails.ToString();
                            txtFatRecord3.Text = iFATDetails.ToString();
                            break;
                        case 4:
                            FoodIntakeLogId4.Value = iFoodIntakeLogId.ToString();
                            ddlMeal4.SelectedIndex = iMeal;
                            string hours4 = logDate.Hour.ToString();
                            if (hours4.Length == 1) hours4 = "0" + hours4;
                            string minutes4 = logDate.Minute.ToString();
                            if (minutes4.Length == 1) minutes4 = "0" + minutes4;
                            textJournalTime4.Text = hours4 + ":" + minutes4;
                            txtMilkRecord4.Text = iMilkDetails.ToString();
                            txtFruitRecord4.Text = iFruitDetails.ToString();
                            txtVegetablesRecord4.Text = iVegetablesDetails.ToString();
                            txtStarchRecord4.Text = iStarchDetails.ToString();
                            txtProteinRecord4.Text = iProteinDetails.ToString();
                            txtFatRecord4.Text = iFATDetails.ToString();
                            break;
                        case 5:
                            FoodIntakeLogId5.Value = iFoodIntakeLogId.ToString();
                            ddlMeal5.SelectedIndex = iMeal;
                            string hours5 = logDate.Hour.ToString();
                            if (hours5.Length == 1) hours5 = "0" + hours5;
                            string minutes5 = logDate.Minute.ToString();
                            if (minutes5.Length == 1) minutes5 = "0" + minutes5;
                            textJournalTime5.Text = hours5 + ":" + minutes5;
                            txtMilkRecord5.Text = iMilkDetails.ToString();
                            txtFruitRecord5.Text = iFruitDetails.ToString();
                            txtVegetablesRecord5.Text = iVegetablesDetails.ToString();
                            txtStarchRecord5.Text = iStarchDetails.ToString();
                            txtProteinRecord5.Text = iProteinDetails.ToString();
                            txtFatRecord5.Text = iFATDetails.ToString();
                            break;
                        case 6:
                            FoodIntakeLogId6.Value = iFoodIntakeLogId.ToString();
                            ddlMeal6.SelectedIndex = iMeal;
                            string hours6 = logDate.Hour.ToString();
                            if (hours6.Length == 1) hours6 = "0" + hours6;
                            string minutes6 = logDate.Minute.ToString();
                            if (minutes6.Length == 1) minutes6 = "0" + minutes6;
                            textJournalTime6.Text = hours6 + ":" + minutes6;
                            txtMilkRecord6.Text = iMilkDetails.ToString();
                            txtFruitRecord6.Text = iFruitDetails.ToString();
                            txtVegetablesRecord6.Text = iVegetablesDetails.ToString();
                            txtStarchRecord6.Text = iStarchDetails.ToString();
                            txtProteinRecord6.Text = iProteinDetails.ToString();
                            txtFatRecord6.Text = iFATDetails.ToString();
                            break;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }

        textGoalMilk.Text = "";
        textGoalFruit.Text = "";
        textGoalVeg.Text = "";
        textGoalStarch.Text = "";
        textGoalProtein.Text = "";
        textGoalFat.Text = "";
            
        textNotes.Text = fjc.GetJournalNotes(Membership.GetUser().ProviderUserKey.ToString(), dtFoodIntakeDate);

        searchTable.Text = "<table><tr><th>Food Type</th><th># Starch</th><th># Fat</th><th>Portion Size</th></tr><tr><td colspan='4'><hr /></td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr></table>";
    }
    
    protected void btnSave_Click(object sender, EventArgs e)
    {
        FoodJournalClass fjc = new FoodJournalClass(objSqlConnClass.OpenConnection());
        if( ddlMeal1.SelectedIndex > 0 )
        {
            int iFoodIntakeLogId = Convert.ToInt32( FoodIntakeLogId1.Value);
            int iMealId = ddlMeal1.SelectedIndex;
            string sUserID = Membership.GetUser().ProviderUserKey.ToString();
            DateTime dtFoodIntakeDate = Convert.ToDateTime(textJournalTime1.Text);
            string strMilkDetails = txtMilkRecord1.Text;
            string strFruitDetails = txtFruitRecord1.Text;
            string strVegetablesDetails = txtVegetablesRecord1.Text;
            string strStarchDetails = txtStarchRecord1.Text;
            string strProteinDetails = txtProteinRecord1.Text;
            string strFATDetails = txtFatRecord1.Text;
            fjc.SetJournalData(iFoodIntakeLogId, iMealId, Membership.GetUser().ProviderUserKey.ToString(), dtFoodIntakeDate, strMilkDetails, strFruitDetails, strVegetablesDetails, strStarchDetails, strProteinDetails, strFATDetails);
        }
        if( ddlMeal2.SelectedIndex > 0 )
        {
            int iFoodIntakeLogId = Convert.ToInt32(FoodIntakeLogId2.Value);
            int iMealId = ddlMeal2.SelectedIndex;
            string sUserID = Membership.GetUser().ProviderUserKey.ToString();
            DateTime dtFoodIntakeDate = Convert.ToDateTime( textJournalTime2.Text);
            string strMilkDetails = txtMilkRecord2.Text;
            string strFruitDetails = txtFruitRecord2.Text;
            string strVegetablesDetails = txtVegetablesRecord2.Text;
            string strStarchDetails = txtStarchRecord2.Text;
            string strProteinDetails = txtProteinRecord2.Text;
            string strFATDetails = txtFatRecord2.Text;
            fjc.SetJournalData(iFoodIntakeLogId, iMealId, Membership.GetUser().ProviderUserKey.ToString(), dtFoodIntakeDate, strMilkDetails, strFruitDetails, strVegetablesDetails, strStarchDetails, strProteinDetails, strFATDetails);
        }
        if( ddlMeal3.SelectedIndex > 0 )
        {
            int iFoodIntakeLogId = Convert.ToInt32( FoodIntakeLogId3.Value);
            int iMealId = ddlMeal3.SelectedIndex;
            string sUserID = Membership.GetUser().ProviderUserKey.ToString();
            DateTime dtFoodIntakeDate = Convert.ToDateTime( textJournalTime3.Text);
            string strMilkDetails = txtMilkRecord3.Text;
            string strFruitDetails = txtFruitRecord3.Text;
            string strVegetablesDetails = txtVegetablesRecord3.Text;
            string strStarchDetails = txtStarchRecord3.Text;
            string strProteinDetails = txtProteinRecord3.Text;
            string strFATDetails = txtFatRecord3.Text;
            fjc.SetJournalData(iFoodIntakeLogId, iMealId, Membership.GetUser().ProviderUserKey.ToString(), dtFoodIntakeDate, strMilkDetails, strFruitDetails, strVegetablesDetails, strStarchDetails, strProteinDetails, strFATDetails);
        }
        if( ddlMeal4.SelectedIndex > 0 )
        {
            int iFoodIntakeLogId = Convert.ToInt32( FoodIntakeLogId4.Value);
            int iMealId = ddlMeal4.SelectedIndex;
            string sUserID = Membership.GetUser().ProviderUserKey.ToString();
            DateTime dtFoodIntakeDate = Convert.ToDateTime( textJournalTime4.Text);
            string strMilkDetails = txtMilkRecord4.Text;
            string strFruitDetails = txtFruitRecord4.Text;
            string strVegetablesDetails = txtVegetablesRecord4.Text;
            string strStarchDetails = txtStarchRecord4.Text;
            string strProteinDetails = txtProteinRecord4.Text;
            string strFATDetails = txtFatRecord4.Text;
            fjc.SetJournalData(iFoodIntakeLogId, iMealId, Membership.GetUser().ProviderUserKey.ToString(), dtFoodIntakeDate, strMilkDetails, strFruitDetails, strVegetablesDetails, strStarchDetails, strProteinDetails, strFATDetails);
        }
        if( ddlMeal5.SelectedIndex > 0 )
        {
            int iFoodIntakeLogId = Convert.ToInt32( FoodIntakeLogId5.Value);
            int iMealId = ddlMeal5.SelectedIndex;
            string sUserID = Membership.GetUser().ProviderUserKey.ToString();
            DateTime dtFoodIntakeDate = Convert.ToDateTime( textJournalTime5.Text);
            string strMilkDetails = txtMilkRecord5.Text;
            string strFruitDetails = txtFruitRecord5.Text;
            string strVegetablesDetails = txtVegetablesRecord5.Text;
            string strStarchDetails = txtStarchRecord5.Text;
            string strProteinDetails = txtProteinRecord5.Text;
            string strFATDetails = txtFatRecord5.Text;
            fjc.SetJournalData(iFoodIntakeLogId, iMealId, Membership.GetUser().ProviderUserKey.ToString(), dtFoodIntakeDate, strMilkDetails, strFruitDetails, strVegetablesDetails, strStarchDetails, strProteinDetails, strFATDetails);
        }
        if( ddlMeal6.SelectedIndex > 0 )
        {
            int iFoodIntakeLogId = Convert.ToInt32( FoodIntakeLogId6.Value);
            int iMealId = ddlMeal6.SelectedIndex;
            string sUserID = Membership.GetUser().ProviderUserKey.ToString();
            DateTime dtFoodIntakeDate = Convert.ToDateTime( textJournalTime6.Text);
            string strMilkDetails = txtMilkRecord6.Text;
            string strFruitDetails = txtFruitRecord6.Text;
            string strVegetablesDetails = txtVegetablesRecord6.Text;
            string strStarchDetails = txtStarchRecord6.Text;
            string strProteinDetails = txtProteinRecord6.Text;
            string strFATDetails = txtFatRecord6.Text;
            fjc.SetJournalData(iFoodIntakeLogId, iMealId, Membership.GetUser().ProviderUserKey.ToString(), dtFoodIntakeDate, strMilkDetails, strFruitDetails, strVegetablesDetails, strStarchDetails, strProteinDetails, strFATDetails);
        }
        fjc.SetJournalNotes(Membership.GetUser().ProviderUserKey.ToString(), Convert.ToDateTime(textJournalTime6.Text), textNotes.Text);
        FillOutForm(textJournalTime1.Text);
    }

    protected void btnPrint_Click(object sender, EventArgs e)
    {

    }

    protected void On_textJournalDate_Changed(object sender, EventArgs e)
    {
        FillOutForm(textJournalDate.Text.Trim());
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string food = textFoodSearch.Text.Trim();
        string table = "";
        FoodJournalClass fjc = new FoodJournalClass(objSqlConnClass.OpenConnection());
        DataSet searchDataSet = fjc.GetFoodSearch(food);
        if ((searchDataSet != null) && (searchDataSet.Tables.Count > 0))
        {
            if (searchDataSet.Tables[0].Rows.Count == 0)
            {
                table = "<table>" + Environment.NewLine;
                table += "<tr>" + Environment.NewLine;
                table += "<th>Food Type</th>" + Environment.NewLine;
                table += "<th># Starch</th>" + Environment.NewLine;
                table += "<th># Fat</th>" + Environment.NewLine;
                table += "<th>Portion Size</th>" + Environment.NewLine;
                table += "</tr>" + Environment.NewLine;
                foreach (DataRow dataRow in searchDataSet.Tables[0].Rows)
                {
                    table += "<tr>" + Environment.NewLine;

                    string sProduct = (Convert.IsDBNull(dataRow["Product"])) ? "&nbsp;" : dataRow["Product"].ToString();
                    table += "<td>" + sProduct + "</td>" + Environment.NewLine;

                    string sStarch = (Convert.IsDBNull(dataRow["PortionSize"])) ? "0.00" : dataRow["PortionSize"].ToString();
                    table += "<td>" + sStarch + "</td>" + Environment.NewLine;

                    string sProtein = (Convert.IsDBNull(dataRow["PortionSize"])) ? "0.00" : dataRow["PortionSize"].ToString();
                    table += "<td>" + sProtein + "</td>" + Environment.NewLine;

                    string sFats = (Convert.IsDBNull(dataRow["PortionSize"])) ? "0.00" : dataRow["PortionSize"].ToString();
                    table += "<td>" + sFats + "</td>" + Environment.NewLine;

                    string sPortionSize = (Convert.IsDBNull(dataRow["PortionSize"])) ? "0.00" : dataRow["PortionSize"].ToString();
                    table += "<td>" + sPortionSize + "</td>" + Environment.NewLine;

                    string sPortionMeasure = (Convert.IsDBNull(dataRow["PortionMeasure"])) ? "&nbsp;" : dataRow["PortionMeasure"].ToString();
                    table += "<td>" + sPortionMeasure + "</td>" + Environment.NewLine;

                    table += "</tr>" + Environment.NewLine;
                }
            }
        }
        table = "</table>" + Environment.NewLine;

        searchTable.Text = table;
    }
    
}