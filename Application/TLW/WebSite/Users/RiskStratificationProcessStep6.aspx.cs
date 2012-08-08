using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Users_RiskStratificationProcessStep6 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Session["strUserName"] = "adam@west.com";
        if (!AppLib.IsLoggedinSessionExists())
        {
            lblError.Text = "Your session has been expired. Please login again";
            return;
        }

        //AppLib.GetLoggedInUserName());
        #region Insert visited log details

        AppLib.InsertVisitedSectionDetails("Risk Stratification Process Step 6");

        #endregion

        if (!Page.IsPostBack)
        {
            SqlConnClass objSqlConnClass = new SqlConnClass();
            BackofficeClass objBackOfficeClass = new BackofficeClass();
            DDClass objDDClass;
            objDDClass = new DDClass(objSqlConnClass.OpenConnection());
            objBackOfficeClass = new BackofficeClass(objSqlConnClass.sqlConnection);
            DataSet DS1 = objBackOfficeClass.Mem_GET_UserInfo(AppLib.GetLoggedInUserName());
            if (DS1 != null)
            {
                if (DS1.Tables[0].Rows.Count > 0)
                {
                    BLL.UserLib oUserLib = new BLL.UserLib();
                    oUserLib.UpdateUserStratificationStep(new Guid(DS1.Tables[0].Rows[0]["USER_ID"].ToString()), "6");
                    oUserLib = null;
                }
            }

            objBackOfficeClass = null;
            objDDClass = null;
            DS1 = null;
        }


        BindCMSText();
    }

    private void BindCMSText()
    {
        TextAreaClass objTextAreaClass;
        SqlConnClass objSqlConnClass = new SqlConnClass();
        objTextAreaClass = new TextAreaClass(objSqlConnClass.OpenConnection());



        DataSet DS = objTextAreaClass.Get_MultipleCMSPagesText();

        for (int i = 0; i < DS.Tables[0].Rows.Count; i++)
        {
            string strTemp = DS.Tables[0].Rows[i]["strPageName"].ToString();
            if (DS.Tables[0].Rows[i]["strPageName"].ToString().ToLower().Equals("tutorialsandnavigation"))
            {
                if (DS.Tables[0].Rows[i]["TextAreaHTML"].ToString().Length > 900)
                    lblTutorialNavigationHTMLText.Text = DS.Tables[0].Rows[i]["TextAreaHTML"].ToString().Substring(0, 900);
                else
                    lblTutorialNavigationHTMLText.Text = DS.Tables[0].Rows[i]["TextAreaHTML"].ToString();
            }
            else if (DS.Tables[0].Rows[i]["strPageName"].ToString().ToLower().Equals("goalsobjectives"))
            {
                if (DS.Tables[0].Rows[i]["TextAreaHTML"].ToString().Length > 900)
                    lblGoalsObjectives.Text = DS.Tables[0].Rows[i]["TextAreaHTML"].ToString().Substring(0, 900);
                else
                    lblGoalsObjectives.Text = DS.Tables[0].Rows[i]["TextAreaHTML"].ToString();
            }

            else if (DS.Tables[0].Rows[i]["strPageName"].ToString().ToLower().Equals("levelofintensity"))
            {
                if (DS.Tables[0].Rows[i]["TextAreaHTML"].ToString().Length > 900)
                    lblLevelOfIntensity.Text = DS.Tables[0].Rows[i]["TextAreaHTML"].ToString().Substring(0, 900);
                else
                    lblLevelOfIntensity.Text = DS.Tables[0].Rows[i]["TextAreaHTML"].ToString();
            }
            else if (DS.Tables[0].Rows[i]["strPageName"].ToString().ToLower().Equals("howwemeasure"))
            {
                if (DS.Tables[0].Rows[i]["TextAreaHTML"].ToString().Length > 900)
                    lblHowWeMeasure.Text = DS.Tables[0].Rows[i]["TextAreaHTML"].ToString().Substring(0, 900);
                else
                    lblHowWeMeasure.Text = DS.Tables[0].Rows[i]["TextAreaHTML"].ToString();
            }
            else if (DS.Tables[0].Rows[i]["strPageName"].ToString().ToLower().Equals("nutritioncenter"))
            {
                if (DS.Tables[0].Rows[i]["TextAreaHTML"].ToString().Length > 900)
                    lblNutritionCenter.Text = DS.Tables[0].Rows[i]["TextAreaHTML"].ToString().Substring(0, 900);
                else
                    lblNutritionCenter.Text = DS.Tables[0].Rows[i]["TextAreaHTML"].ToString();
            }
            else if (DS.Tables[0].Rows[i]["strPageName"].ToString().ToLower().Equals("personalfitness"))
            {
                if (DS.Tables[0].Rows[i]["TextAreaHTML"].ToString().Length > 900)
                    lbPersonalFitness.Text = DS.Tables[0].Rows[i]["TextAreaHTML"].ToString().Substring(0, 900);
                else
                    lbPersonalFitness.Text = DS.Tables[0].Rows[i]["TextAreaHTML"].ToString();
            }
            else if (DS.Tables[0].Rows[i]["strPageName"].ToString().ToLower().Equals("wellnessdairy"))
            {
                if (DS.Tables[0].Rows[i]["TextAreaHTML"].ToString().Length > 900)
                    lblWellnessDiary.Text = DS.Tables[0].Rows[i]["TextAreaHTML"].ToString().Substring(0, 900);
                else
                    lblWellnessDiary.Text = DS.Tables[0].Rows[i]["TextAreaHTML"].ToString();
            }
            else if (DS.Tables[0].Rows[i]["strPageName"].ToString().ToLower().Equals("wellnessdairyforum"))
            {
                if (DS.Tables[0].Rows[i]["TextAreaHTML"].ToString().Length > 900)
                    lblWellnessDairyForum.Text = DS.Tables[0].Rows[i]["TextAreaHTML"].ToString().Substring(0, 900);
                else
                    lblWellnessDairyForum.Text = DS.Tables[0].Rows[i]["TextAreaHTML"].ToString();
            }
        }


        DS = null;
        objTextAreaClass = null;
        objSqlConnClass.CloseConnection();
        objSqlConnClass = null;
    }

    protected void lnkBtnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Main/Main_Frame.aspx", true);
            lblError.Text = "Oops - We are having technical difficulties.  Please try again in a moment.";
        }
        catch { }
    }
}