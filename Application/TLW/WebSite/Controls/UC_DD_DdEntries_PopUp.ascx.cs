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

public partial class UC_DD_DdEntries_PopUp : System.Web.UI.UserControl
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    DDClass objDDClass;

    protected void Page_Load(object sender, EventArgs e)
    {
        objDDClass = new DDClass(objSqlConnClass.OpenConnection());
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        imgDDLog.Src = AppConfig.GetBaseSiteUrl() + "images/icons/iconDdEntry.gif";
        if (!IsPostBack)
        {

            fillOutForm();
            for (int i = 1; i <= 7; i++)
            {
                ((RadNumericTextBox)FindControl("txtTotalField_0" + i.ToString())).Enabled = false;
            }
        }

        objSqlConnClass.CloseConnection();
    }

    private void fillOutForm()
    {
        rdpDdEntryDate.SelectedDate = Convert.ToDateTime(DateTime.Now.ToString("MM/dd/yyyy"));//assures time is 12:00:00AM

        clearFields();

        DataSet DS = objDDClass.DD_GET_DdUsers_BY_UserId(Membership.GetUser().ProviderUserKey.ToString());
        if (DS.Tables[0].Rows.Count != 0)
        {
            string sCalorieDiet = "";
            sCalorieDiet = "<a href=\"javascript:fillTotals(";
            sCalorieDiet = sCalorieDiet + "'" + DS.Tables[0].Rows[0]["FIELD_01"].ToString() + "',";
            sCalorieDiet = sCalorieDiet + "'" + DS.Tables[0].Rows[0]["FIELD_02"].ToString() + "',";
            sCalorieDiet = sCalorieDiet + "'" + DS.Tables[0].Rows[0]["FIELD_03"].ToString() + "',";
            sCalorieDiet = sCalorieDiet + "'" + DS.Tables[0].Rows[0]["FIELD_04"].ToString() + "',";
            sCalorieDiet = sCalorieDiet + "'" + DS.Tables[0].Rows[0]["FIELD_05"].ToString() + "',";
            sCalorieDiet = sCalorieDiet + "'" + DS.Tables[0].Rows[0]["FIELD_06"].ToString() + "',";
            sCalorieDiet = sCalorieDiet + "'" + DS.Tables[0].Rows[0]["FIELD_07"].ToString() + "');\" class=\"aButton\">" + DS.Tables[0].Rows[0]["CALORIE_NUMBER"].ToString() + "&nbsp;Calorie&nbsp;Diet</a>";


            txtFillField_01.Text = DS.Tables[0].Rows[0]["FIELD_01"].ToString();
            txtFillField_02.Text = DS.Tables[0].Rows[0]["FIELD_02"].ToString();
            txtFillField_03.Text = DS.Tables[0].Rows[0]["FIELD_03"].ToString();
            txtFillField_04.Text = DS.Tables[0].Rows[0]["FIELD_04"].ToString();
            txtFillField_05.Text = DS.Tables[0].Rows[0]["FIELD_05"].ToString();
            txtFillField_06.Text = DS.Tables[0].Rows[0]["FIELD_06"].ToString();
            txtFillField_07.Text = DS.Tables[0].Rows[0]["FIELD_07"].ToString();

            lblCalorieDiet.Text = sCalorieDiet;
        }

        DS = objDDClass.GET_Items_AnyItemTable("Type", "LIST_DD");
        lblField_01Type.Text = DS.Tables[0].Rows[0]["ITEM_TEXT"].ToString();
        lblField_02Type.Text = DS.Tables[0].Rows[1]["ITEM_TEXT"].ToString();
        lblField_03Type.Text = DS.Tables[0].Rows[2]["ITEM_TEXT"].ToString();
        lblField_04Type.Text = DS.Tables[0].Rows[3]["ITEM_TEXT"].ToString();
        lblField_05Type.Text = DS.Tables[0].Rows[4]["ITEM_TEXT"].ToString();
        lblField_06Type.Text = DS.Tables[0].Rows[5]["ITEM_TEXT"].ToString();
        lblField_07Type.Text = DS.Tables[0].Rows[6]["ITEM_TEXT"].ToString();


        DS = objDDClass.GET_Items_AnyItemTable("LVType", "LIST_DD");
        lblLVField_01Type.Text = DS.Tables[0].Rows[0]["ITEM_TEXT"].ToString();
        lblLVField_02Type.Text = DS.Tables[0].Rows[1]["ITEM_TEXT"].ToString();
        lblLVField_03Type.Text = DS.Tables[0].Rows[2]["ITEM_TEXT"].ToString();
        lblLVField_04Type.Text = DS.Tables[0].Rows[3]["ITEM_TEXT"].ToString();
        lblLVField_05Type.Text = DS.Tables[0].Rows[4]["ITEM_TEXT"].ToString();



    }

    private void clearFields()
    {

        for (int i = 1; i <= 7; i++)
        {
            ((RadNumericTextBox)FindControl("txtBField_0" + i.ToString())).Value = 0;
            ((RadNumericTextBox)FindControl("txtLField_0" + i.ToString())).Value = 0;
            ((RadNumericTextBox)FindControl("txtDField_0" + i.ToString())).Value = 0;
            ((RadNumericTextBox)FindControl("txtTotalField_0" + i.ToString())).Value = 0;
        }

        for (int i = 1; i <= 5; i++)
        {
            ((RadNumericTextBox)FindControl("txtLVField_0" + i.ToString())).Value = 0;
        }



    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string sUserID = Membership.GetUser().ProviderUserKey.ToString();
        string sDateDdEntryDate = rdpDdEntryDate.SelectedDate.ToString();
        string sEditTotals;
        if (cbEditTotals.Checked)
        { sEditTotals = "1"; }
        else
        { sEditTotals = "0"; }

        string[] arrsBreakfast = new string[8];
        string[] arrsLunch = new string[8];
        string[] arrsDinner = new string[8];
        string[] arrsTotal = new string[8];
        string[] arrsLifeValue = new string[6];

        for (int i = 1; i <= 7; i++)
        {
            arrsBreakfast[i] = ((RadNumericTextBox)FindControl("txtBField_0" + i.ToString())).Text;
            arrsLunch[i] = ((RadNumericTextBox)FindControl("txtLField_0" + i.ToString())).Text;
            arrsDinner[i] = ((RadNumericTextBox)FindControl("txtDField_0" + i.ToString())).Text;
            arrsTotal[i] = ((RadNumericTextBox)FindControl("txtTotalField_0" + i.ToString())).Text;
        }

        for (int i = 1; i <= 5; i++)
        {
            arrsLifeValue[i] = ((RadNumericTextBox)FindControl("txtLVField_0" + i.ToString())).Text;
        }

        if (txtDdEntryID.Text == "")
        {
            objDDClass.DD_INSERT_DdEntries(sUserID, sDateDdEntryDate, sEditTotals, arrsBreakfast, arrsLunch, arrsDinner, arrsTotal, arrsLifeValue);
        }
        else
        {
            objDDClass.DD_UPDATE_DdEntries(txtDdEntryID.Text, sUserID, sDateDdEntryDate, sEditTotals, arrsBreakfast, arrsLunch, arrsDinner, arrsTotal, arrsLifeValue);
        }





    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        //txtPalEntryID

        DataSet DS = objDDClass.DD_GET_DdEntries_BY_EntryId(txtDdEntryID.Text.Trim());

        if (DS.Tables[0].Rows.Count != 0)
        {
            for (int i = 1; i <= 7; i++)
            {
                ((RadNumericTextBox)FindControl("txtBField_0" + i.ToString())).Value = Convert.ToDouble(DS.Tables[0].Rows[0]["B_FIELD_0" + i.ToString()]);
                ((RadNumericTextBox)FindControl("txtLField_0" + i.ToString())).Value = Convert.ToDouble(DS.Tables[0].Rows[0]["L_FIELD_0" + i.ToString()]);
                ((RadNumericTextBox)FindControl("txtDField_0" + i.ToString())).Value = Convert.ToDouble(DS.Tables[0].Rows[0]["D_FIELD_0" + i.ToString()]);
                ((RadNumericTextBox)FindControl("txtTotalField_0" + i.ToString())).Value = Convert.ToDouble(DS.Tables[0].Rows[0]["TOTAL_FIELD_0" + i.ToString()]);

            }

            for (int i = 1; i <= 5; i++)
            {
                ((RadNumericTextBox)FindControl("txtLVField_0" + i.ToString())).Value = Convert.ToDouble(DS.Tables[0].Rows[0]["LV_FIELD_0" + i.ToString()]);
            }

        }

    }

}
