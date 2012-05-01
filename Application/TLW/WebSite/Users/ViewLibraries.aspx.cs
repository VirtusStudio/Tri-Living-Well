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

public partial class Users_ViewLibraries : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MembershipUser currentUser = Membership.GetUser();
        if (!AppLib.IsLoggedinSessionExists() || currentUser == null)
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/main_frame.aspx", true);

        if (!IsPostBack)
        {
            BindLibrary();
            BindCMSText();
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("User View library");

            #endregion
            
        }
    }
    protected void GVLibrary_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lnkFavoriteNewsLetter = (LinkButton)e.Row.FindControl("lnkFavoriteNewsLetter");
            if (lnkFavoriteNewsLetter != null)
            {
                string strTemp = DataBinder.Eval(e.Row.DataItem, "AddRemoveFromFavorite").ToString();
                if (strTemp.Equals("Remove from Favorite"))
                {
                    lnkFavoriteNewsLetter.OnClientClick = "return ConfirmBid('remove Library from favorite list')";
                }
            }
        }
    }

    protected void GVLibrary_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("AddToFavorite"))
        {
            LinkButton lnkBtnFavorite = (LinkButton)e.CommandSource;
            Entity.UserInfo oUserInfo = new Entity.UserInfo();
            oUserInfo.IntFavoriteTypeId = 0;
            oUserInfo.IntFavoriteId = 0;
            if (lnkBtnFavorite.Text == "Remove from Favorite")
                oUserInfo.IntFavoriteId = Convert.ToInt32(e.CommandArgument);



            oUserInfo.StrUserId = AppLib.GetLoggedInUserName();
            oUserInfo.StrTitle = "";
            oUserInfo.StrFavoriteType = "Library";
            oUserInfo.DtCreatedOn = DateTime.Now;
            oUserInfo.IntFavoriteTypeId = Convert.ToInt32(e.CommandArgument);
            BLL.UserLib oUserLib = new BLL.UserLib();
            oUserLib.LibraryAddToFavorite(oUserInfo);

            oUserInfo = null;
            oUserLib = null;
            BindLibrary();
        }
        else if (e.CommandName.Equals("PathViewlabrariesFile"))
        {

            Entity.LibraryInfo oLibraryInfo = new Entity.LibraryInfo();
            BLL.LibraryLib oLibraryLib = new BLL.LibraryLib();

            oLibraryInfo = oLibraryLib.GetLibraryByLibraryId(Convert.ToInt32(e.CommandArgument));

            if (oLibraryInfo.StrLocationType.ToLower().Equals("pdf") || oLibraryInfo.StrLocationType.ToLower().Equals("video"))
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                LinkButton lnkNewslettes = (LinkButton)row.FindControl("lnkViewLabraries");

                string path = AppConfig.GetBaseSiteUrl() + AppConfig.GetLibrariesFilePath() + oLibraryInfo.StrLocation;

                Response.Write("<script type='text/javascript'>detailedresults=window.open('" + path + "', 'popUpWindow', 'height=700,width=900,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes');</script>");




            }
            else
            {

            }


        }
    }


    /// Function Header*******************************************************
    /// Function Name: BindLibrary
    /// Function Type: Function
    /// Functionality: used to bind announcements
    /// Input: 
    /// Output: 
    /// Return Value:
    /// Note: 
    /// *********************************************************************
    private void BindLibrary()
    {
        BLL.NewsLib oNewsLib = new BLL.NewsLib();
        GVLibrary.DataSource = oNewsLib.GetUserFavoriteLibrary(AppLib.GetLoggedInUserName(), "User");
        GVLibrary.DataBind();
        oNewsLib = null;
    }
    private void BindCMSText()
    {
        TextAreaClass objTextAreaClass;
        SqlConnClass objSqlConnClass = new SqlConnClass();
        objTextAreaClass = new TextAreaClass(objSqlConnClass.OpenConnection());
        DataSet DS = objTextAreaClass.TxA_Get_TextAreas("Libraries", "1");
        lbltextcontent.Text = DS.Tables[0].Rows[0]["TextAreaHTML"].ToString();

        DS = null;
        objTextAreaClass = null;
        objSqlConnClass = null;
    }

}