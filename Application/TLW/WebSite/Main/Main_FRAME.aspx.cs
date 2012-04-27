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

public partial class Main_Main_FRAME : System.Web.UI.Page
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    TemplateClass objTemplateClass;

    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
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
        BindSocialLinks();
        DS = null;


        objTemplateClass = new TemplateClass(objSqlConnClass.OpenConnection());

    

        //if (!HttpContext.Current.User.IsInRole("Administrator"))
        //{

        //    if (Session["popup"] != null)
        //    {
        //        bool pop = (bool)Session["popup"];

        //        if (pop)
        //        {
        //            BLL.CompanyManager oCompanyManager = new BLL.CompanyManager();
        //            int no = oCompanyManager.GetQuestion();
        //            string Script = "jConfirm('You have " + no + " unanswered HealthCoach Message !  Click Ok to answer them', 'HealthCoach Message',function(r) { if(r) {window.location.href = '../Backoffice/UserUtilities/ManageQuestionforHealthCoach.aspx';}});";
        //            ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseWindow", Script, true);
        //            Session["popup"] = false;
        //        }
        //        else
        //        {
        //            Session.Remove(Session["popup"].ToString());
        //        }
        //    }
        //    else
        //    {

        //    }
        //}

      }

    

    //private  void ShowQuestion(string val)
    //{
        
    //    Entity.CompanyInfo oCompanyInfo = new Entity.CompanyInfo();
    //    BLL.CompanyManager oCompanyManager = new BLL.CompanyManager();
    //    int q = oCompanyManager.GetQuestion(val);
    //    return q;
        
    //}



    //protected void GVNewsLetter_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        LinkButton lnkFavoriteNewsLetter = (LinkButton)e.Row.FindControl("lnkFavoriteNewsLetter");
    //        if (lnkFavoriteNewsLetter != null)
    //        {
    //            string strTemp = DataBinder.Eval(e.Row.DataItem, "AddRemoveFromFavorite").ToString();
    //            if (strTemp.Equals("Remove from Favorite"))
    //            {
    //                lnkFavoriteNewsLetter.OnClientClick = "return ConfirmBid('remove newsletter from favorite list')";
    //            }
    //        }
    //    }
    //}

    //protected void GVNewsLetter_RowCommand(object sender, GridViewCommandEventArgs e)
    //{
    //    if (e.CommandName.Equals("AddToFavorite"))
    //    {
    //        LinkButton lnkBtnFavorite = (LinkButton)e.CommandSource;
    //        Entity.UserInfo oUserInfo = new Entity.UserInfo();
    //        oUserInfo.IntFavoriteTypeId = 0;
    //        oUserInfo.IntFavoriteId = 0;
    //        if (lnkBtnFavorite.Text == "Remove from Favorite")
    //            oUserInfo.IntFavoriteId = Convert.ToInt32(e.CommandArgument);



    //        oUserInfo.StrUserId = AppLib.GetLoggedInUserName();
    //        oUserInfo.StrTitle = "";
    //        oUserInfo.StrFavoriteType = "Newsletter";
    //        oUserInfo.DtCreatedOn = DateTime.Now;
    //        oUserInfo.IntFavoriteTypeId = Convert.ToInt32(e.CommandArgument);
    //        BLL.UserLib oUserLib = new BLL.UserLib();
    //        oUserLib.NewsletterAddToFavorite(oUserInfo);

    //        oUserInfo = null;
    //        oUserLib = null;
    //        //BindNewsLetters();
    //    }

    //}

    //protected void GVLibrary_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        LinkButton lnkFavoriteNewsLetter = (LinkButton)e.Row.FindControl("lnkFavoriteNewsLetter");
    //        if (lnkFavoriteNewsLetter != null)
    //        {
    //            string strTemp = DataBinder.Eval(e.Row.DataItem, "AddRemoveFromFavorite").ToString();
    //            if (strTemp.Equals("Remove from Favorite"))
    //            {
    //                lnkFavoriteNewsLetter.OnClientClick = "return ConfirmBid('remove Library from favorite list')";
    //            }
    //        }
    //    }
    //}

    //protected void GVLibrary_RowCommand(object sender, GridViewCommandEventArgs e)
    //{
    //    if (e.CommandName.Equals("AddToFavorite"))
    //    {
    //        LinkButton lnkBtnFavorite = (LinkButton)e.CommandSource;
    //        Entity.UserInfo oUserInfo = new Entity.UserInfo();
    //        oUserInfo.IntFavoriteTypeId = 0;
    //        oUserInfo.IntFavoriteId = 0;
    //        if (lnkBtnFavorite.Text == "Remove from Favorite")
    //            oUserInfo.IntFavoriteId = Convert.ToInt32(e.CommandArgument);



    //        oUserInfo.StrUserId = AppLib.GetLoggedInUserName();
    //        oUserInfo.StrTitle = "";
    //        oUserInfo.StrFavoriteType = "Library";
    //        oUserInfo.DtCreatedOn = DateTime.Now;
    //        oUserInfo.IntFavoriteTypeId = Convert.ToInt32(e.CommandArgument);
    //        BLL.UserLib oUserLib = new BLL.UserLib();
    //        oUserLib.LibraryAddToFavorite(oUserInfo);

    //        oUserInfo = null;
    //        oUserLib = null;
    //        BindLibrary();
    //    }

    //}


    //protected void GVAnnouncements_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        LinkButton lnkFavoriteNewsLetter = (LinkButton)e.Row.FindControl("lnkFavoriteNewsLetter");
    //        if (lnkFavoriteNewsLetter != null)
    //        {
    //            string strTemp = DataBinder.Eval(e.Row.DataItem, "AddRemoveFromFavorite").ToString();
    //            if (strTemp.Equals("Remove from Favorite"))
    //            {
    //                lnkFavoriteNewsLetter.OnClientClick = "return ConfirmBid('remove News & Announcement from favorite list')";
    //            }
    //        }
    //    }
    //}

    //protected void GVAnnouncements_RowCommand(object sender, GridViewCommandEventArgs e)
    //{
    //    if (e.CommandName.Equals("AddToFavorite"))
    //    {
    //        LinkButton lnkBtnFavorite = (LinkButton)e.CommandSource;
    //        Entity.UserInfo oUserInfo = new Entity.UserInfo();
    //        oUserInfo.IntFavoriteTypeId = 0;
    //        oUserInfo.IntFavoriteId = 0;
    //        if (lnkBtnFavorite.Text == "Remove from Favorite")
    //            oUserInfo.IntFavoriteId = Convert.ToInt32(e.CommandArgument);


    //        oUserInfo.StrUserId = AppLib.GetLoggedInUserName();
    //        oUserInfo.StrTitle = "";
    //        oUserInfo.StrFavoriteType = "NewsAnnouncements";
    //        oUserInfo.DtCreatedOn = DateTime.Now;
    //        oUserInfo.IntFavoriteTypeId = Convert.ToInt32(e.CommandArgument);
    //        BLL.UserLib oUserLib = new BLL.UserLib();
    //        oUserLib.NewsletterAndannoucementsAddToFavorite(oUserInfo);

    //        oUserInfo = null;
    //        oUserLib = null;
    //        BindAnnouncements();
    //    }

    //}


    //protected void GVEvents_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        LinkButton lnkFavoriteNewsLetter = (LinkButton)e.Row.FindControl("lnkFavoriteNewsLetter");
    //        if (lnkFavoriteNewsLetter != null)
    //        {
    //            string strTemp = DataBinder.Eval(e.Row.DataItem, "AddRemoveFromFavorite").ToString();
    //            if (strTemp.Equals("Remove from Favorite"))
    //                lnkFavoriteNewsLetter.OnClientClick = "return ConfirmBid('remove Event from favorite list')";
    //        }
    //    }
    //}

    //protected void GVEvents_RowCommand(object sender, GridViewCommandEventArgs e)
    //{
    //    if (e.CommandName.Equals("AddToFavorite"))
    //    {
    //        LinkButton lnkBtnFavorite = (LinkButton)e.CommandSource;
    //        Entity.UserInfo oUserInfo = new Entity.UserInfo();
    //        oUserInfo.IntFavoriteTypeId = 0;
    //        oUserInfo.IntFavoriteId = 0;
    //        if (lnkBtnFavorite.Text == "Remove from Favorite")
    //            oUserInfo.IntFavoriteId = Convert.ToInt32(e.CommandArgument);


    //        oUserInfo.StrUserId = AppLib.GetLoggedInUserName();
    //        oUserInfo.StrTitle = "";
    //        oUserInfo.StrFavoriteType = "Event";
    //        oUserInfo.DtCreatedOn = DateTime.Now;
    //        oUserInfo.IntFavoriteTypeId = Convert.ToInt32(e.CommandArgument);
    //        BLL.UserLib oUserLib = new BLL.UserLib();
    //        oUserLib.EventAddToFavorite(oUserInfo);

    //        oUserInfo = null;
    //        oUserLib = null;
    //        BindEvents();
    //    }

    //}

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillOutForm();
        }
        objSqlConnClass.CloseConnection();
    }

    #endregion

    #region User Defined Functions

    private void fillOutForm()
    {
        fillOutTemplates();
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
        DataSet DS = objDDClass.get_User_Calorie(Membership.GetUser().ProviderUserKey.ToString());
        try
        {

            if (DS.Tables[0].Rows.Count > 0)
                //lblCaloriesAmount.Text = DS.Tables[0].Rows[0]["CALORIE_NUMBER"].ToString();



            oUserInfo = oUserLib.GetFoodExchangeChartByCalories(Convert.ToInt32(DS.Tables[0].Rows[0]["CALORIE_NUMBER"]));
            if (oUserInfo != null)
            {
                //lblDairyAmount.Text = oUserInfo.IntMilk.ToString();
                //lblFruitAmount.Text = oUserInfo.IntFruit.ToString();
                //lblVegetableAmount.Text = oUserInfo.IntVegetable.ToString();
                //lblStarchAmount.Text = oUserInfo.IntStarch.ToString();
                //lblProteinAmount.Text = oUserInfo.IntProtein.ToString();
                //lblFATAmount.Text = oUserInfo.IntFat.ToString();
                //lblWaterAmount.Text = oUserInfo.IntWater.ToString();
            }

        }
        catch
        { }
        finally
        {
            objSqlConnClass.CloseConnection();
            objSqlConnClass = null;
            objDDClass = null;
            DS = null;
            oUserLib = null;
            oUserInfo = null;
        }
    }

    private void BindHotSection()
    {
        BLL.HotSectionDetailsLib oHotSectionDetailsLib = null;

        try
        {
            oHotSectionDetailsLib = new BLL.HotSectionDetailsLib();

            dlHotLinks.DataSource = oHotSectionDetailsLib.GetAllHotSections();
            dlHotLinks.DataBind();

        }
        catch (Exception ex) { throw ex; }
        finally
        {
            oHotSectionDetailsLib = null;
        }
    }

    private void fillOutTemplates()
    {
        //BindNewsLetters();
        BindAnnouncements();
        BindEvents();
      //  BindLibrary();
        BindHotSection();
        /* DataSet DS = objTemplateClass.Tpl_GET_Templates_BY_TemplateId("1");
         if (DS.Tables[0] != null)
         {
             lblTemplateText1.Text = DS.Tables[0].Rows[0]["TEMPLATE_TEXT"].ToString();
         }
         DS = objTemplateClass.Tpl_GET_Templates_BY_TemplateId("2");
         if (DS.Tables[0] != null)
         {
             lblTemplateText2.Text = DS.Tables[0].Rows[0]["TEMPLATE_TEXT"].ToString();
         }*/
    }
    ///// Function Header*******************************************************
    ///// Function Name: BindLibrary
    ///// Function Type: Function
    ///// Functionality: used to bind announcements
    ///// Input: 
    ///// Output: 
    ///// Return Value:
    ///// Note: 
    ///// *********************************************************************
    //private void BindLibrary()
    //{
    //    BLL.NewsLib oNewsLib = new BLL.NewsLib();
    //    GVLibrary.DataSource = oNewsLib.GetUserFavoriteLibrary(AppLib.GetLoggedInUserName(), "User");
    //    GVLibrary.DataBind();
    //    oNewsLib = null;
    //}

    /// Function Header*******************************************************
    /// Function Name: BindAnnouncements
    /// Function Type: Function
    /// Functionality: used to bind announcements
    /// Input: 
    /// Output: 
    /// Return Value:
    /// Note: 
    /// *********************************************************************
    private void BindAnnouncements()
    {
        BLL.NewsLib oNewsLib = new BLL.NewsLib();
       /* GVAnnouncements.DataSource = oNewsLib.GetUserFavoriteNewsAndAnnouncement(AppLib.GetLoggedInUserName(), "User");
        GVAnnouncements.DataBind();*/
        oNewsLib = null;
    }


    /// Function Header*******************************************************
    /// Function Name: BindAnnouncements
    /// Function Type: Function
    /// Functionality: used to bind announcements
    /// Input: 
    /// Output: 
    /// Return Value:
    /// Note: 
    /// *********************************************************************
    private void BindEvents()
    {
        BLL.NewsLib oNewsLib = new BLL.NewsLib();
       /* GVEvents.DataSource = oNewsLib.GetUserFavoriteEvents(AppLib.GetLoggedInUserName(), "User");
        GVEvents.DataBind();*/
        oNewsLib = null;
    }


    /// Function Header*******************************************************
    /// Function Name: BindAnnouncements
    /// Function Type: Function
    /// Functionality: used to bind announcements
    /// Input: 
    /// Output: 
    /// Return Value:
    /// Note: 
    /// *********************************************************************
    private void BindSocialLinks()
    {
        BLL.QuestionnaireLib oQuestionnaireLib;
        try
        {
            oQuestionnaireLib = new BLL.QuestionnaireLib();
            //dlLinks.DataSource = oQuestionnaireLib.GetGlobalCodesByCategoryName("SocialNetworkingLink");
            //dlLinks.DataBind();
        }
        catch (Exception ex) { throw ex; }
        finally { oQuestionnaireLib = null; }
    }


    ///// Function Header*******************************************************
    ///// Function Name: BindNewsLetters
    ///// Function Type: Function
    ///// Functionality: used to bind newsletter
    ///// Input: 
    ///// Output: 
    ///// Return Value:
    ///// Note: 
    ///// *********************************************************************
    //private void BindNewsLetters()
    //{
    //    BLL.NewsLib oNewsLib = new BLL.NewsLib();
    //    GVNewsLetter.DataSource = oNewsLib.GetUserFavoriteNewsLetters(AppLib.GetLoggedInUserName(), "User");
    //    GVNewsLetter.DataBind();
    //    oNewsLib = null;
    //}

    /*
    //private void Page_PreInit(object sender, EventArgs e)
    //{
    //    if (!AppLib.IsLoggedinSessionExists())
    //        this.MasterPageFile = "~/MasterPages/TLWSite.master";
    //    else
    //    {
    //        this.MasterPageFile = "~/MasterPages/User.master";
    //    }
    //}*/


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
    #endregion

}
