using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Users_RiskStratificationProcessStep3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!AppLib.IsLoggedinSessionExists())
        {
            lblError.Text = "Your session has been expired. Please login again";
            return;
        }

        if (Request.QueryString["sc"] != null)
        {
            lblScore.Text = AppLib.Decrypt(Request.QueryString["sc"].ToString()) + " and " + "Category is" + Request.QueryString["cat"].ToString();
        }

        if (Request.QueryString["cat"].ToString() == "Tri")
        {
            multiTabs.ActiveViewIndex = 0;
            menuTabs.Items[0].Selected = true;
            
        }
        else if (Request.QueryString["cat"].ToString() == "Living")
        {
            multiTabs.ActiveViewIndex = 1;
            menuTabs.Items[1].Selected = true;
        }
        else
        {
            multiTabs.ActiveViewIndex = 2;
            menuTabs.Items[2].Selected = true;
        }

        //AppLib.GetLoggedInUserName());
        #region Insert visited log details

        AppLib.InsertVisitedSectionDetails("Risk Stratification Process Step 3");

        #endregion

        imgCategory.Src = AppConfig.GetBaseSiteUrl() + "images/icons/iconPalLevel" + AppLib.Decrypt(Request.QueryString["c"].ToString()) + ".jpg";

    }
    protected void lnkBack_Click(object sender, EventArgs e)
    {
        Response.Redirect(AppConfig.GetBaseSiteUrl() + "Users/RiskStratificationProcessStep2.aspx?id=" + Request.QueryString["id"].ToString() + "sc=" + Request.QueryString["sc"].ToString());
    }
    protected void lnkBtnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (!chkWaiverAgreement.Checked)
            {
                lblError.Text = "Please accept the waiver agreement";
                return;
            }
            else
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
                        BLL.UserLib oUserLib = new BLL.UserLib();
                        oUserLib.UpdateUserStratificationStep(new Guid(DS1.Tables[0].Rows[0]["USER_ID"].ToString()), "3");
                        oUserLib = null;
                        Response.Redirect(AppConfig.GetBaseSiteUrl() + "Users/RiskStratificationProcessStep4.aspx?id=" + Request.QueryString["id"].ToString() + "&c=" + Request.QueryString["c"].ToString() + "&sc=" + Request.QueryString["sc"].ToString());
                    }
                }
            }
        }
        catch { }
    }
}