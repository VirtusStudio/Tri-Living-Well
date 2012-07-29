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

public partial class NutritionCenter : System.Web.UI.Page
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    TemplateClass objTemplateClass;
    PALClass objPALClass;
    string gsUserID = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        objPALClass = new PALClass(objSqlConnClass.OpenConnection());
        gsUserID = Membership.GetUser().ProviderUserKey.ToString();

        MembershipUser currentUser = Membership.GetUser();
        if (!AppLib.IsLoggedinSessionExists() || currentUser == null)
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/main_frame.aspx", true);



        AccountClass objAccountClass;
        objAccountClass = new AccountClass(objSqlConnClass.sqlConnection);
        BackofficeClass objBackOfficeClass;
        objBackOfficeClass = new BackofficeClass(objSqlConnClass.OpenConnection());

        #region Insert visited log details

        AppLib.InsertVisitedSectionDetails("Dashboard Page");

        #endregion

        DataSet DS = objBackOfficeClass.Mem_GET_UserInfo(currentUser.UserName);
        if (DS != null)
        {
            if (DS.Tables[0].Rows.Count > 0)
            {
                if (DS.Tables[0].Rows[0]["ROLENAME"].ToString().Equals("User"))
                {
                    if (DS.Tables[0].Rows[0]["strRiskStratificationProcessStep"].ToString().Equals(string.Empty) || DS.Tables[0].Rows[0]["strRiskStratificationProcessStep"].ToString() != "6")
                    {
                        DS = null;
                        Response.Redirect(AppConfig.GetBaseSiteUrl() + "Users/RiskStratificationProcessStep1.aspx?id=" + AppLib.Encrypt(currentUser.UserName), true);
                    }
                }
            }
        }
        BindNutritionalJournal();
        DS = null;


        objTemplateClass = new TemplateClass(objSqlConnClass.OpenConnection());

    }


    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
        objSqlConnClass.CloseConnection();
    }



    /// <summary>
    /// following function is used to bind the nutritional journal details
    /// </summary>
    private void BindNutritionalJournal()
    {
        BLL.UserLib oUserLib = new BLL.UserLib();
        Entity.UserInfo oUserInfo = new Entity.UserInfo();
        SqlConnClass objSqlConnClass = new SqlConnClass();
        DDClass objDDClass = new DDClass(objSqlConnClass.OpenConnection());
        try
        {







        }
        catch
        { }
        finally
        {
            objSqlConnClass.CloseConnection();
            objSqlConnClass = null;
            objDDClass = null;
            oUserLib = null;
            oUserInfo = null;
        }
    }


    protected string GetImagePath(string _strValueCode)
    {
        string _strRetVal = string.Empty;
        if (_strValueCode.ToLower().Equals("facebook"))
            _strRetVal = AppConfig.GetBaseSiteUrl() + "images/facebook.png";
        else if (_strValueCode.ToLower().Equals("twitter"))
            _strRetVal = AppConfig.GetBaseSiteUrl() + "images/twitter.png";
        else
            _strRetVal = AppConfig.GetBaseSiteUrl() + "images/blog.png";


        return _strRetVal;
    }

}
