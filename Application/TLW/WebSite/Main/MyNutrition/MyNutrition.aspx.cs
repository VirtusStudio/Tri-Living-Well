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

public partial class MyNutrition : System.Web.UI.Page
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    PALClass objPalClass;



    protected void Page_Load(object sender, EventArgs e)
    {
        if (!AppLib.IsLoggedinSessionExists())
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/main_frame.aspx", true);



        objPalClass = new PALClass(objSqlConnClass.OpenConnection());
        #region Insert visited log details

        AppLib.InsertVisitedSectionDetails("View My Nutrition");

        #endregion
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillOutForm();
        }
        objSqlConnClass.CloseConnection();
    }

    private void fillOutForm()
    {
        if (Membership.GetUser() != null)
        {
            string sUserID = Membership.GetUser().ProviderUserKey.ToString();

            DataSet DS = objPalClass.PAL_GET_PalStarts(sUserID, "1", "0");
            if (DS.Tables[0].Rows.Count > 0)
            {
                string sProgramID = DS.Tables[0].Rows[0]["PROGRAM_ID"].ToString();
                string sLevelID = DS.Tables[0].Rows[0]["LEVEL_ID"].ToString();
                int iProgramCurrentStep = Convert.ToInt32(DS.Tables[0].Rows[0]["PROGRAM_CURRENT_STEP"]);
                int iNumSteps = Convert.ToInt32(DS.Tables[0].Rows[0]["NUM_STEPS"]);

                string sProgramNumber = (Convert.ToInt32(sProgramID) / 100).ToString();

                UC_PAL_Steps1.populate(iProgramCurrentStep.ToString(), iNumSteps.ToString());

                /*
                 * lblProgramForum.Text = "<a href='/FORUM/topics.aspx?ForumID=" + DS.Tables[0].Rows[0]["FORUM_PROGRAM_ID"].ToString() + "'><img src='/Images/icons/iconProgram" + sProgramNumber + ".jpg' /> " + DS.Tables[0].Rows[0]["PROGRAM_NAME"].ToString() + " Forum</a>";
                lblEmailCoach.Text = "<a href='/FORUM/addprivatemsg.aspx?ToUserID=" + DS.Tables[0].Rows[0]["COACH_ID"].ToString() + "'><img src='/Images/icons/iconEmail.gif' /> Private Message Coach</a>";

                lblLevelID.Text = "<img src='/images/icons/iconPalLevel" + sLevelID + ".jpg' />";
                 above lines are commented by Netsmartz
                 */
                //lblProgramID.Text = "<img src='/Images/icons/iconProgram" + sProgramNumber + ".jpg' />";
                lblProgramForum.Text = "<a href='" + AppConfig.GetBaseSiteUrl() + "FORUM/topics.aspx?ForumID=" + DS.Tables[0].Rows[0]["FORUM_PROGRAM_ID"].ToString() + "'><img src='" + AppConfig.GetBaseSiteUrl() + "Images/icons/iconProgram" + sProgramNumber + ".jpg' /> " + DS.Tables[0].Rows[0]["PROGRAM_NAME"].ToString() + " Forum</a>";
                lblEmailCoach.Text = "<a href='" + AppConfig.GetBaseSiteUrl() + "FORUM/addprivatemsg.aspx?ToUserID=" + DS.Tables[0].Rows[0]["COACH_ID"].ToString() + "'><img src='" + AppConfig.GetBaseSiteUrl() + "Images/icons/iconEmail.gif' /> Private Message Coach</a>";

                lblLevelID.Text = "<img src='" + AppConfig.GetBaseSiteUrl() + "images/icons/iconPalLevel" + sLevelID + ".jpg' />";

                //lblDetailLevel.Text = "<a href=\"javascript:top.popUpWin('/main/MyNutrition/HTML_Details.aspx?levelID=" + sLevelID + "#1',900,550);\">View Nutrition Details</a>";
                //lblDetailLevel.Text = "<a href=\"javascript:top.popUpWin('" + AppConfig.GetBaseSiteUrl() + "Main/DDs/MealExchange/HTML_MealExchange.aspx?',900,550);\">View Nutrition Details</a>";

                for (int i = 1; i <= iNumSteps; i++)
                {
                    string sNavigateUrl = "HTML_MyNutrition.aspx?levelID=" + sLevelID + "&stepID=" + i.ToString();

                    if (i == iProgramCurrentStep)
                    {
                        IFRAME_CONTENT.Attributes.Add("src", sNavigateUrl);
                    }

                    RadMenuItem RMI = new RadMenuItem();
                    RMI.Text = i.ToString();
                    RMI.NavigateUrl = "javascript:load('" + sNavigateUrl + "')";
                    //RMI.Width = new Unit((100 / Convert.ToDouble(iNumSteps)).ToString() + "%");
                    RMI.Style.Add("text-align", "center");
                    if (i <= iProgramCurrentStep + 1)//allow
                    {

                    }
                    else//disallow
                    {
                        RMI.Enabled = false;
                    }
                    RadMenu1.Items.Add(RMI);
                }
            }
        }
    }


    /*Following function is added by Netsmartz for adding the css path at runtime*/
    protected override void OnInit(EventArgs e)
    {

        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Main.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Table.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound3.css\" />"));
        base.OnInit(e);

    }
}
