using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_MyFavoriteList : System.Web.UI.Page
{
    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!AppLib.IsLoggedinSessionExists())
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/main_frame.aspx", true);

        #region Insert visited log details

        AppLib.InsertVisitedSectionDetails("View Users Favorite List");

        #endregion


        lblMsg.Text = string.Empty;
        if (!this.Page.IsPostBack)
        {
            BindFavoriteList();
            if (Request.QueryString["msg"] != null)
            {
                if (Request.QueryString["msg"].ToString().Equals("up"))
                {
                    lblMsg.Text = "Record has been updated successfully.";
                }
                else if (Request.QueryString["msg"].ToString().Equals("ins"))
                {
                    lblMsg.Text = "Event has been added successfully.";
                }
            }
        }
    }
    protected void GVFavoriteList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("DeleteDetails"))
        {
            LinkButton lnkBtnFavorite = (LinkButton)e.CommandSource;
            Entity.UserInfo oUserInfo = new Entity.UserInfo();
            oUserInfo.IntFavoriteId = Convert.ToInt32(e.CommandArgument);
            oUserInfo.DtCreatedOn = DateTime.Now;
            oUserInfo.IntFavoriteTypeId = Convert.ToInt32(e.CommandArgument);
            BLL.UserLib oUserLib = new BLL.UserLib();
            oUserLib.EventAddToFavorite(oUserInfo);
            oUserInfo = null;
            oUserLib = null;
            BindFavoriteList();
            lblMsg.Text = "Record has been deleted successfully.";
        }
    }
    protected void lnkBtnSearch_Click(object sender, EventArgs e)
    {
        BindFavoriteList();
    }
    #endregion

    #region User Defined Functions

    /// Function Header*******************************************************
    /// Function Name: BindEvents
    /// Function Type: Function
    /// Functionality: used to get bind the events
    /// Input: 
    /// Output: 
    /// Return Value:
    /// Note: 
    /// *********************************************************************
    private void BindFavoriteList()
    {
        BLL.NewsLib oNewsLib = new BLL.NewsLib();
        GVFavoriteList.DataSource = oNewsLib.GetFavoriteListByUserName(AppLib.GetLoggedInUserName(), "User");
        GVFavoriteList.DataBind();
        oNewsLib = null;
    }


    #endregion

}