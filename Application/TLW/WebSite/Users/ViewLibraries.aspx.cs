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

}