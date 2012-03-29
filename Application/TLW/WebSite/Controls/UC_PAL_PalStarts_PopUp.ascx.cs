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

public partial class UC_PAL_PalStarts_PopUp : System.Web.UI.UserControl
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    PALClass objPALClass;
    ProgramClass objProgramClass;
    BackofficeClass objBackofficeClass;

    string gsUserID = "";
    string gsPalStartID = "";

    bool gbUserMode = true;

    public bool USER_MODE
    {
        get { return gbUserMode; }
        set { gbUserMode = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        imgProgramInfo.Src = AppConfig.GetBaseSiteUrl() + "images/icons/iconProgram.gif";//added by Netsmartz
        objPALClass = new PALClass(objSqlConnClass.OpenConnection());
        objProgramClass = new ProgramClass(objSqlConnClass.sqlConnection);
        objBackofficeClass = new BackofficeClass(objSqlConnClass.sqlConnection);

        gsUserID = Membership.GetUser().ProviderUserKey.ToString();

        if (ViewState["gsPalStartID"] != null)
        {
            gsPalStartID = ViewState["gsPalStartID"].ToString();
        }
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet DS = objPALClass.PAL_GET_PalStarts(gsUserID, "1", "0");
            if (DS.Tables[0].Rows.Count > 0)
            {
                gsPalStartID = DS.Tables[0].Rows[0]["PAL_START_ID"].ToString();
                fillOutForm();
            }
        }
        ViewState["gsPalStartID"] = gsPalStartID;
        objSqlConnClass.CloseConnection();
    }

    private void fillOutForm()
    {
        fillDropDowns();
        if (gbUserMode)
        {
            trProgramStartDate.Style.Add("display", "none");
            btnEdit.Enabled = false;
        }
    }

    private void fillDropDowns()
    {
        fillDropDownProgramID(gsUserID);

        if (gbUserMode)
        {
            ddlProgramID.AutoPostBack = false;

            ddlProgramStartStep.Items.Add(new ListItem("-Select Start Step-", ""));
            for (int i = 0; i < 3; i++)
            {
                ddlProgramStartStep.Items.Add(new ListItem((i + 1).ToString(), (i + 1).ToString()));
            }
        }
        else
        {
            fillDropDownProgramStartStep(ddlProgramID.SelectedValue);
        }
    }
    private void fillDropDownProgramID(string sUserID)
    {
        int i = 0;
        string sLevelID = objBackofficeClass.Mem_GET_UserAssessments_BY_UserId(sUserID).Tables[0].Rows[0]["LEVEL_ID"].ToString();

        ddlProgramID.Items.Add(new ListItem("-Select Program-", ""));
        foreach (DataRow DR in objProgramClass.Prg_GET_Programs_BY_LevelId(sLevelID).Tables[0].Rows)
        {
            ddlProgramID.Items.Add(new ListItem(DR["PROGRAM_NAME"].ToString(), DR["PROGRAM_ID"].ToString()));
        }
    }
    private void fillDropDownProgramStartStep(string sProgramID)
    {
        ddlProgramStartStep.Items.Clear();
        if (sProgramID != "")
        {
            ddlProgramStartStep.Items.Add(new ListItem("-Select Start Step-", ""));
            for (int i = 0; i < Convert.ToInt32(objProgramClass.Prg_GET_Programs_BY_ProgramId(sProgramID).Tables[0].Rows[0]["NUM_STEPS"]); i++)
            {
                ddlProgramStartStep.Items.Add(new ListItem((i + 1).ToString(), (i + 1).ToString()));
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string sProgramStartDate = "";
        if(gbUserMode)
        {
            sProgramStartDate = DateTime.Now.ToString("MM/dd/yyyy");
        }
        else
        {
            sProgramStartDate = Convert.ToDateTime(rdpProgramStartDate.SelectedDate).ToString("MM/d/yyyy");
        }
        string sProgramID = ddlProgramID.SelectedValue;
        string sProgramStartStep = ddlProgramStartStep.SelectedValue;

        DataSet DS = objPALClass.PAL_UPDATE_PalStarts(gsPalStartID, sProgramID, sProgramStartDate, sProgramStartStep);
        
        if (DS.Tables.Count > 0)//success
        {
            lblMessage.Text = "<span style='color:#009900;'>*Success!";
            txtPostback.Text = "1";//if (!= "") postback
        }
        else//failure
        {
            lblMessage.Text = "<span class='required'>*Error: Unable to update info</span>";
        }
        
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        DataSet DS = objPALClass.PAL_GET_PalStarts(gsUserID, "1", "0");
        gsPalStartID = DS.Tables[0].Rows[0]["PAL_START_ID"].ToString();
        
        txtProgramStartDate.Text = DS.Tables[0].Rows[0]["PROGRAM_START_DATE"].ToString();//client converts to RadDatePicker
        ddlProgramID.SelectedValue = DS.Tables[0].Rows[0]["PROGRAM_ID"].ToString();

        fillDropDownProgramStartStep(ddlProgramID.SelectedValue);
        try
        {
            ddlProgramStartStep.SelectedValue = DS.Tables[0].Rows[0]["PROGRAM_START_STEP"].ToString();
        }
        catch (Exception ex)
        {
        }
    }
    protected void btnPostback_Click(object sender, EventArgs e)
    {
        //here just to create a postback on success
    }
    protected void ddlProgramID_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!gbUserMode)
        {
            fillDropDownProgramStartStep(ddlProgramID.SelectedValue);
        }
    }
}
