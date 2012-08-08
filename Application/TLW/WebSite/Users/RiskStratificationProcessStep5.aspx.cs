using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Users_RiskStratificationProcessStep5 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!AppLib.IsLoggedinSessionExists())
        {
            lblError.Text = "Your session has been expired. Please login again";
            return;
        }


        //AppLib.GetLoggedInUserName());
        #region Insert visited log details

        AppLib.InsertVisitedSectionDetails("Risk Stratification Process Step 5");

        #endregion
        // HttpContext.Current.Session["strUserName"] = "ttt@ttt.com";
        BindCMSText();
    }
    private void BindCMSText()
    {
        TextAreaClass objTextAreaClass;
        SqlConnClass objSqlConnClass = new SqlConnClass();
        objTextAreaClass = new TextAreaClass(objSqlConnClass.OpenConnection());
        DataSet DS = objTextAreaClass.TxA_Get_TextAreas("DailyCaloricRequirement", "2");
        lblDCRequirmentHTMLText.Text = DS.Tables[0].Rows[0]["TextAreaHTML"].ToString();


        DS = objTextAreaClass.TxA_Get_TextAreas("DailyCaloricRequirementHowActiveAreYou", "2");
        lblActiveAreYouHTMLText.Text = DS.Tables[0].Rows[0]["TextAreaHTML"].ToString();
        /* if (DS.Tables[0].Rows[0]["TextAreaHTML"].ToString().Length > 100)
         {
             lblDCRequirmentHTMLText.Text = DS.Tables[0].Rows[0]["TextAreaHTML"].ToString().Substring(0, 100);
         }
         else
         {
             lblDCRequirmentHTMLText.Text = DS.Tables[0].Rows[0]["TextAreaHTML"].ToString();
         }*/

        DS = null;
        objTextAreaClass = null;
        objSqlConnClass = null;
    }

    protected void lnkBack_Click(object sender, EventArgs e)
    {
        Response.Redirect(AppConfig.GetBaseSiteUrl() + "Users/RiskStratificationProcessStep4.aspx?id=" + Request.QueryString["id"].ToString() + "&c=" + Request.QueryString["c"].ToString() + "&sc=" + Request.QueryString["sc"].ToString());
    }
    protected void lnkBtnSubmit_Click(object sender, EventArgs e)
    {
        try
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
                    DataSet DS = objDDClass.DD_INSERT_DdUsers(DS1.Tables[0].Rows[0]["USER_ID"].ToString(), txtCalories.Text.Trim());
                    objSqlConnClass.CloseConnection();
                    objBackOfficeClass = null;
                    objDDClass = null;
                }
            }

            BLL.UserLib oUserLib = new BLL.UserLib();
            oUserLib.UpdateUserStratificationStep(new Guid(DS1.Tables[0].Rows[0]["USER_ID"].ToString()), "5");
            oUserLib = null;

            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Users/RiskStratificationProcessStep6.aspx?id=" + Request.QueryString["id"].ToString() + "&c=" + Request.QueryString["c"].ToString() + "&sc=" + Request.QueryString["sc"].ToString());
        }
        catch { }
    }
}