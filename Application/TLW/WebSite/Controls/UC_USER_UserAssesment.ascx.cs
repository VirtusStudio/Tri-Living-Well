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
using aspNetEmail;

public partial class UC_USER_UserAssesment : System.Web.UI.UserControl
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    PALClass objPALClass;
    BackofficeClass objBackofficeClass;

    string gsLevelID = "0";

    protected void Page_Load(object sender, EventArgs e)
    {
        objPALClass = new PALClass(objSqlConnClass.OpenConnection());
        objBackofficeClass = new BackofficeClass(objSqlConnClass.sqlConnection);

        div1.Style.Add("display", "none");
        div2.Style.Add("display", "none");
        div2_5.Style.Add("display", "none");
        //div3.Style.Add("display", "none");
        BindImages();
        if (ViewState["gsLevelID"] != null)
        {
            gsLevelID = ViewState["gsLevelID"].ToString();
        }
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            div1.Style.Remove("display");
            fillOutForm();
        }
        objSqlConnClass.CloseConnection();

        ViewState["gsLevelID"] = gsLevelID;
    }

    private void fillOutForm()
    {
        if (Membership.GetUser() != null)
        {
            string sUserID = Membership.GetUser().ProviderUserKey.ToString();
            if (objPALClass.PAL_GET_PalStarts(sUserID, "0", "1").Tables[0].Rows.Count > 0)
            {//they have completed a program and need a new one, so show a congrats section
                div1_Instructions_New.Visible = false;
            }
            else//they have never completed a grogram, so only show they new by hiding the return
            {
                div1_Instructions_Return.Visible = false;
            }
        }
    }

    protected void btnSelectProgram_Click(object sender, EventArgs e)
    {
        if (RadTabStrip1.SelectedTab != null)//step 3 submitted
        {
            string sUserID = Membership.GetUser().ProviderUserKey.ToString();
            string sProgramStartDate = DateTime.Now.ToString("MM/dd/yyyy");
            string sProgramValue = RadTabStrip1.SelectedTab.Value;
            string sProgramStartStep = "1";

            string sProgramID = ((Convert.ToInt32(sProgramValue) * 100) + Convert.ToInt32(gsLevelID)).ToString();

            DataSet DS = objPALClass.PAL_INSERT_PalStarts(sUserID, sProgramID, sProgramStartDate, sProgramStartStep);

            //Response.Redirect(AppConfig.GetBaseSiteUrl() + "Main/Content/Home.aspx");


            Response.Redirect(AppConfig.GetBaseSiteUrl() + "main/Main_Frame.aspx");


            if (DS.Tables.Count > 0)//success
            {

                Response.Redirect(AppConfig.GetBaseSiteUrl() + "main/Main_Frame.aspx");
            }
            else//failure
            {
                Response.Write("A Failure occured while attempting to save your information.");
            }

        }
    }

    protected void btnStep1_Click(object sender, EventArgs e)
    {
        div2.Style.Remove("display");
    }

    protected void btnStep2_Click(object sender, EventArgs e)
    {//we need to decide how this places them in a category

        string sAssessmentScore = txtAssesmentScore.Text;
        lblAssesmentScore.Text = sAssessmentScore;


        gsLevelID = "3";
        txtLevelID.Text = gsLevelID;

        string sUserID = Membership.GetUser().ProviderUserKey.ToString();

        objBackofficeClass.Mem_INSERT_UserAssessments(sUserID, gsLevelID, sAssessmentScore);


        lblPalLevelID_Step2.Text = "<img src='" + AppConfig.GetBaseSiteUrl() + "images/icons/iconPalLevel" + gsLevelID + ".jpg' />";
        div2_5.Style.Remove("display");
    }

    protected void btnStep2_5_Click(object sender, EventArgs e)
    {
        lblPalLevelID_Step3.Text = "<img src='" + AppConfig.GetBaseSiteUrl() + "images/icons/iconPalLevel3.gif' />";
        //div3.Style.Remove("display");
        DIV3_FLG.Text = "1";
    }

    /*Following function is used to bindthe images's path and is added by Netsmartz */
    private void BindImages()
    {
        imgPALZeroStepFirst.Src = AppConfig.GetBaseSiteUrl() + "images/icons/iconPalLevel0.gif";//added by Netsmartz
        imgPALZeroStepSecond.Src = AppConfig.GetBaseSiteUrl() + "images/icons/iconPalLevel0.gif";//added by Netsmartz
        imgHRAScore.Src = AppConfig.GetBaseSiteUrl() + "images/icons/iconPalLevel0.jpg";//added by Netsmartz
        imgPALZeroStepSecondofThree.Src = AppConfig.GetBaseSiteUrl() + "images/icons/iconPalLevel0.gif";//added by Netsmartz
    }
}
