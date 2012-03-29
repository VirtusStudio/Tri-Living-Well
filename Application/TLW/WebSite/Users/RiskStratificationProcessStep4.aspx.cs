using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Users_RiskStratificationProcessStep4 : System.Web.UI.Page
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

        AppLib.InsertVisitedSectionDetails("Risk Stratification Process Step 4");

        #endregion

    }
    protected void lnkBack_Click(object sender, EventArgs e)
    {
        Response.Redirect(AppConfig.GetBaseSiteUrl() + "Users/RiskStratificationProcessStep3.aspx?id=" + Request.QueryString["id"].ToString() + "&c=" + Request.QueryString["c"].ToString() + "&sc=" + Request.QueryString["sc"].ToString());
    }
    protected void lnkBtnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnClass objSqlConnClass = new SqlConnClass();
            BackofficeClass objBackOfficeClass = new BackofficeClass();
            PALClass objPALClass;
            objPALClass = new PALClass(objSqlConnClass.OpenConnection());
            objBackOfficeClass = new BackofficeClass(objSqlConnClass.sqlConnection);

            DataSet DS1 = objBackOfficeClass.Mem_GET_UserInfo(AppLib.GetLoggedInUserName());
            if (DS1 != null)
            {
                if (DS1.Tables[0].Rows.Count > 0)
                {
                    DataSet DS = objPALClass.PAL_INSERTMULTIPLE_PalStarts(DS1.Tables[0].Rows[0]["USER_ID"].ToString(), hfCategoryId.Value, DateTime.Now.ToString("MM/dd/yyyy"), "1");
                    DS = objPALClass.PAL_INSERTMULTIPLE_PalStarts(DS1.Tables[0].Rows[0]["USER_ID"].ToString(), hfSecondCategoryId.Value, DateTime.Now.ToString("MM/dd/yyyy"), "1");

                    objSqlConnClass.CloseConnection();


                    objBackOfficeClass = null;
                    objPALClass = null;
                    BLL.UserLib oUserLib = new BLL.UserLib();
                    oUserLib.UpdateUserStratificationStep(new Guid(DS1.Tables[0].Rows[0]["USER_ID"].ToString()), "4");
                    oUserLib = null;
                    DS = null;

                    Response.Redirect(AppConfig.GetBaseSiteUrl() + "Users/RiskStratificationProcessStep5.aspx?id=" + Request.QueryString["id"].ToString() + "&c=" + Request.QueryString["c"].ToString() + "&sc=" + Request.QueryString["sc"].ToString());

                }
            }


            objSqlConnClass.CloseConnection();
            objBackOfficeClass = null;
            objPALClass = null;
        }
        catch { }
    }
}