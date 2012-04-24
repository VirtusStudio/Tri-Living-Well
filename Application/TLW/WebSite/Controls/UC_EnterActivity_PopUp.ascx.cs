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

public partial class UC_EnterActivity_PopUp : System.Web.UI.UserControl
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    PALClass objPALClass;
    protected string strBaseUrl = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        strBaseUrl = AppConfig.GetBaseSiteUrl();
        objPALClass = new PALClass(objSqlConnClass.OpenConnection());
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        imgPAL.Src = AppConfig.GetBaseSiteUrl() + "images/icons/iconPalEntry.gif";//added by Netsmartz
        if (!IsPostBack)
        {
            fillOutForm();
        }
        objSqlConnClass.CloseConnection();
    }

    private void fillOutForm()
    {
        rdpPalEntryDate.SelectedDate = Convert.ToDateTime(DateTime.Now.ToString("MM/dd/yyyy"));//assures time is 12:00:00AM
        compareV_rdpPalEntryDate.ErrorMessage = "*Must be <= " + DateTime.Now.ToString("MM/dd/yy");
        compareV_rdpPalEntryDate.ValueToCompare = DateTime.Now.ToString("MM/dd/yyyy");

        fillDropDowns();
    }

    private void fillDropDowns()
    {
        ddlPalEntryType = objSqlConnClass.fillDropDown(ddlPalEntryType, "Type", "LIST_PAL");
        ddlPalCycling = objSqlConnClass.fillDropDown(ddlPalCycling, "Cycling", "LIST_PAL");
        ddlPalRunning = objSqlConnClass.fillDropDown(ddlPalRunning, "Running", "LIST_PAL");
        ddlPalSwimming = objSqlConnClass.fillDropDown(ddlPalSwimming, "Swimming", "LIST_PAL");
        ddlPalConditioningExercises = objSqlConnClass.fillDropDown(ddlPalConditioningExercises, "Conditioning Exercises", "LIST_PAL");
        ddlPalSports = objSqlConnClass.fillDropDown(ddlPalSports, "Sports", "LIST_PAL");
        ddlPalWalking = objSqlConnClass.fillDropDown(ddlPalWalking, "Walking", "LIST_PAL");                                                                                             
        ddlPalEntryTime = objSqlConnClass.fillDropDown(ddlPalEntryTime, "Time", "LIST_PAL");
        ddlPalEntryIntensity = objSqlConnClass.fillDropDown(ddlPalEntryIntensity, "Intensity", "LIST_PAL");
        ddlPalEntryDuration = objSqlConnClass.fillDropDown(ddlPalEntryDuration, "Duration", "LIST_PAL");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string sUserID = Membership.GetUser().ProviderUserKey.ToString();

        string sPalEntryID = txtPalEntryID.Text;
        string sPalEntryDate = Convert.ToDateTime(rdpPalEntryDate.SelectedDate).ToString("MM/d/yyyy");
        int iPalEntryType = Convert.ToInt32(ddlPalEntryType.SelectedValue);
        int iPalEntryActivity = 0;
        string sPalEntryType = ddlPalEntryType.SelectedItem.Text;
        string sPalEntryActivity = "";
        switch (iPalEntryType)
        {
            case 1:
                {
                    iPalEntryActivity = Convert.ToInt32(ddlPalWalking.SelectedValue);
                    sPalEntryActivity = ddlPalWalking.SelectedItem.Text;
                    break;
                }
            case 2:
                {
                    iPalEntryActivity = Convert.ToInt32(ddlPalRunning.SelectedValue);
                    sPalEntryActivity = ddlPalRunning.SelectedItem.Text;
                    break;
                }
            case 3:
                {
                    iPalEntryActivity = Convert.ToInt32(ddlPalSwimming.SelectedValue);
                    sPalEntryActivity = ddlPalSwimming.SelectedItem.Text;
                    break;
                }
            case 4:
                {
                    iPalEntryActivity = Convert.ToInt32(ddlPalCycling.SelectedValue);
                    sPalEntryActivity = ddlPalCycling.SelectedItem.Text;
                    break;
                }
            case 5:
                {
                    iPalEntryActivity = Convert.ToInt32(ddlPalConditioningExercises.SelectedValue);
                    sPalEntryActivity = ddlPalConditioningExercises.SelectedItem.Text;
                    break;
                }
            case 6:
                {
                    iPalEntryActivity = Convert.ToInt32(ddlPalSports.SelectedValue);
                    sPalEntryActivity = ddlPalSports.SelectedItem.Text;
                    break;
                }
            default:
                {
                    break;
                }
        }
        string sPalEntryTime = ddlPalEntryTime.SelectedValue;
        string sPalEntryDuration = ddlPalEntryDuration.SelectedValue;
        string sPalEntryIntensity = ddlPalEntryIntensity.SelectedValue;
        string sPalEntryWeight = txtPalEntryWeight.Text;
        string sPalEntryComment = txtPalEntryComment.Text;

        DataSet DS;
        if (sPalEntryID == "")//insert
        {
            DS = objPALClass.PAL_INSERT_PalEntries(sUserID, sPalEntryDate, iPalEntryType, sPalEntryType, iPalEntryActivity, sPalEntryActivity, sPalEntryTime, sPalEntryDuration, sPalEntryIntensity, sPalEntryWeight, sPalEntryComment);
        }
        else//update
        {
            DS = objPALClass.PAL_UPDATE_PalEntries(sPalEntryID, sPalEntryDate, iPalEntryType, sPalEntryType, iPalEntryActivity,  sPalEntryActivity, sPalEntryTime, sPalEntryDuration, sPalEntryIntensity, sPalEntryWeight, sPalEntryComment);
        }

        if (DS.Tables.Count > 0)//success
        {
            lblMessage.Text = "<span style='color:#009900;'>*Success!";
            txtPostback.Text = "1";//if (!= "") postback
        }
        else//failure
        {
            lblMessage.Text = "<span class='required'>*Error: Entry exists for <b>" + sPalEntryDate + "</b></span>";
        }

    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        DataSet DS = objPALClass.PAL_GET_PalEntries_BY_PalEntryId(txtPalEntryID.Text.Trim());

        //handeled on client
        //rdpPalEntryDate.SelectedDate = Convert.ToDateTime(DS.Tables[0].Rows[0]["PAL_ENTRY_DATE"]);

        txtPalEntryWeight.Text = DS.Tables[0].Rows[0]["PAL_ENTRY_WEIGHT"].ToString();
        txtPalEntryComment.Text = DS.Tables[0].Rows[0]["PAL_ENTRY_COMMENT"].ToString();
        
        ddlPalEntryType.SelectedValue = DS.Tables[0].Rows[0]["PAL_ENTRY_TYPE"].ToString();
        ddlPalEntryTime.SelectedValue = DS.Tables[0].Rows[0]["PAL_ENTRY_TIME"].ToString();
        ddlPalEntryIntensity.SelectedValue = DS.Tables[0].Rows[0]["PAL_ENTRY_INTENSITY"].ToString();
        ddlPalEntryDuration.SelectedValue = DS.Tables[0].Rows[0]["PAL_ENTRY_DURATION"].ToString();
    }
    protected void btnPostback_Click(object sender, EventArgs e)
    {
        //here just to create a postback on success
    }
}
