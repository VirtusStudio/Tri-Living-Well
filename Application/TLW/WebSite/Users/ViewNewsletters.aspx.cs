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

public partial class Users_ViewNewsletters : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MembershipUser currentUser = Membership.GetUser();
        if (!AppLib.IsLoggedinSessionExists() || currentUser == null)
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/main_frame.aspx", true);

        if (!IsPostBack)
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("User View Newsletters");

            #endregion
            BindNewsLetters();
            BindCMSText();
        }
    }
    protected void GVNewsLetter_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lnkFavoriteNewsLetter = (LinkButton)e.Row.FindControl("lnkFavoriteNewsLetter");
            if (lnkFavoriteNewsLetter != null)
            {
                string strTemp = DataBinder.Eval(e.Row.DataItem, "AddRemoveFromFavorite").ToString();
                if (strTemp.Equals("Remove from Favorite"))
                {
                    lnkFavoriteNewsLetter.OnClientClick = "return ConfirmBid('remove newsletter from favorite list')";
                }
            }
        }
    }

    protected void GVNewsLetter_RowCommand(object sender, GridViewCommandEventArgs e)
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
            oUserInfo.StrFavoriteType = "Newsletter";
            oUserInfo.DtCreatedOn = DateTime.Now;
            oUserInfo.IntFavoriteTypeId = Convert.ToInt32(e.CommandArgument);
            BLL.UserLib oUserLib = new BLL.UserLib();
            oUserLib.NewsletterAddToFavorite(oUserInfo);

            oUserInfo = null;
            oUserLib = null;
            BindNewsLetters();
        }
        else if (e.CommandName.Equals("PathNewslettersFile"))
        {
            Entity.NewsInfo oNewsInfo = new Entity.NewsInfo();
            BLL.NewsLib oNewsLib = new BLL.NewsLib();

            oNewsInfo = oNewsLib.GetNewsLettersById(Convert.ToInt32(e.CommandArgument));
            if (oNewsInfo != null)
            {

                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                LinkButton lnkNewslettes = (LinkButton)row.FindControl("lnkNewsletters");
                ViewState["strOldFileName"] = oNewsInfo.StrPDFFilename;
                string Path = AppConfig.GetBaseSiteUrl() + AppConfig.GetNewsLettersPDFPath() + oNewsInfo.StrPDFFilename;
                Response.Write("<script type='text/javascript'>detailedresults=window.open('" + Path + "', 'popUpWindow', 'height=700,width=900,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes');</script>");
            }
        }
    }
    /// Function Header*******************************************************
    /// Function Name: BindNewsLetters
    /// Function Type: Function
    /// Functionality: used to bind newsletter
    /// Input: 
    /// Output: 
    /// Return Value:
    /// Note: 
    /// *********************************************************************
    private void BindNewsLetters()
    {
        BLL.NewsLib oNewsLib = new BLL.NewsLib();
        GVNewsLetter.DataSource = oNewsLib.GetUserFavoriteNewsLetters(AppLib.GetLoggedInUserName(), "User");
        GVNewsLetter.DataBind();
        oNewsLib = null;
    }

    private void BindCMSText()
    {
        TextAreaClass objTextAreaClass;
        SqlConnClass objSqlConnClass = new SqlConnClass();
        objTextAreaClass = new TextAreaClass(objSqlConnClass.OpenConnection());
        DataSet DS = objTextAreaClass.TxA_Get_TextAreas("Newsletters", "1");
        lbltxtNewsletters.Text = DS.Tables[0].Rows[0]["TextAreaHTML"].ToString();

        DS = null;
        objTextAreaClass = null;
        objSqlConnClass = null;
    }

}