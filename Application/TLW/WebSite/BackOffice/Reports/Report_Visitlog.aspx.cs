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

public partial class BackOffice_Reports_Report_Visitlog : System.Web.UI.Page
{

    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("Visit Log");

            #endregion
        }
        else
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/Main_Frame.aspx", true);

        GVQuestion.PageSize = AppConfig.GetGridViewPageSize();
        lblMsg.Text = string.Empty;
        if (!this.Page.IsPostBack)
        {
            BindSectionVisited();
            if (Request.QueryString["msg"] != null)
            {
                if (Request.QueryString["msg"].ToString().Equals("up"))
                {
                    lblMsg.Text = "Record has been updated successfully.";
                }
            }
        }
    }
    protected void GVQuestion_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVQuestion.PageIndex = e.NewPageIndex;
        BindSectionVisited();
    }

    
    protected void lnkBtnSearch_Click(object sender, EventArgs e)
    {
        BindSectionVisited();
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
    private void BindSectionVisited()
    {
        Entity.UserInfo oUserInfo = new Entity.UserInfo();
        oUserInfo.StrDateFrom = AppLib.GetBackDate();
        oUserInfo.StrDateTo = AppLib.GetFutureDate();
        if (!txtVisitedFrom.Text.Trim().Equals(string.Empty))
        {
            if (AppLib.isDateTime(txtVisitedFrom.Text.Trim()))
            {
                oUserInfo.StrDateFrom = txtVisitedFrom.Text.Trim();
                oUserInfo.StrDateTo = AppLib.GetFutureDate();
            }
            else
                oUserInfo.StrDateFrom = AppLib.GetFutureDate();
        }


        if (!txtVisitedTo.Text.Trim().Equals(string.Empty))
        {
            if (AppLib.isDateTime(txtVisitedTo.Text.Trim()))
                oUserInfo.StrDateTo = txtVisitedTo.Text.Trim();
            else
                oUserInfo.StrDateTo = AppLib.GetBackDate();
        }

        if (oUserInfo.StrDateTo.Equals(oUserInfo.StrDateFrom))
        {
            string strTodayDate = DateTime.Now.ToShortDateString();
            if (strTodayDate.Equals(oUserInfo.StrDateTo))
                oUserInfo.StrDateTo = AppLib.GetFutureDate();
        }


        oUserInfo.StrDateTo = oUserInfo.StrDateTo + " 11:59:00 PM";
        oUserInfo.StrDateFrom = oUserInfo.StrDateFrom + " 12:01:00 AM";



        oUserInfo.StrUserType = ddlUserType.SelectedValue;
        oUserInfo.StrSectionVisited = txtSectionVisited.Text.Trim();

        BLL.UserLib oUserLib = new BLL.UserLib();

        GVQuestion.DataSource = oUserLib.GetSectionVisitedDetails(oUserInfo);

        GVQuestion.DataBind();
        oUserLib = null;
        oUserInfo = null;
    }


    #endregion
}
