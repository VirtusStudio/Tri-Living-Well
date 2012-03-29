//###########################################################//
//    Copyright 2007 Blue Grotto Technologies, Inc.          //
//    This code is owned by Blue Grotto Technologies, Inc    //
//    It may not be copied, shared or modified.              //
//###########################################################//
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
using aspNetEmail;
using Telerik.Web.UI;

public partial class Administrator_UserUtilities_UserUtilities : System.Web.UI.Page
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    BackofficeClass objBackOfficeClass;
    DataSet DS = new DataSet();

    string gsUsers = "", gsUsersMax = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        objBackOfficeClass = new BackofficeClass(objSqlConnClass.OpenConnection());

        if (!this.Page.IsPostBack)
        {

            if (Request.QueryString["msg"] != null)
            {
                if (Request.QueryString["msg"].ToString().Equals("ins"))
                    lblMsg.Text = "User created successfully.";
                else if (Request.QueryString["msg"].ToString().Equals("up"))
                    lblMsg.Text = "User information has beed updated successfully.";
                else if (Request.QueryString["msg"].ToString().Equals("del"))
                    lblMsg.Text = "User has beed deleted successfully.";


            }
        }
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        fillOutForm();
        objSqlConnClass.CloseConnection();
    }
    private void fillOutForm()
    {
        fillGrids();
    }
    private void fillGrids()
    {
        RadGrid1.DataSource = objBackOfficeClass.Mem_GET_UserInfo_BY_AccountFrom("","1");
        RadGrid1.DataBind();
        RadGrid2.DataSource = objBackOfficeClass.Mem_GET_UserInfo_BY_AccountFrom("", "0");
        RadGrid2.DataBind();
    }
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridDataItem)
        {
            try
            {//do something based on a global variable perhaps
                ((LinkButton)(e.Item as GridDataItem)["column"].Controls[0]).Text = "Deactivate";

                string sUsername = (e.Item as GridDataItem)["UserName"].Text.ToString();

                Label lblEdit = new Label();
                lblEdit.Text = "<a href=" + '"' + "javascript:editUser('" + sUsername + "')" + '"' + ">Edit</a>";
                (e.Item as GridDataItem)["ucEdit"].Controls.Add(lblEdit);
                
                Image imgAccess = new Image();
                imgAccess.ImageUrl = AppConfig.GetBaseSiteUrl()+ "images/reports/circleNo.gif";
                if ((e.Item as GridDataItem)["IsLockedOut"].Text.ToString() == "False")
                {
                    imgAccess.ImageUrl =AppConfig.GetBaseSiteUrl()+ "images/reports/circleYes.gif";
                }

                (e.Item as GridDataItem)["ucAccess"].Controls.Add(imgAccess);
                
            //    Label lblRole = new Label();
                // changed roleid access to rolename so ...
            //    lblRole.Text = (e.Item as GridDataItem)["RoleName"].Text.ToString();
                ////////// old stuff 
                /*lblRole.Text = "Administrator";
                if ((e.Item as GridDataItem)["RoleName"].Text.ToString() == "c09b69f6-d294-47cd-9928-e7706c9a6027")//role ID
                {
                    lblRole.Text = "User";
                }
                */
            //    (e.Item as GridDataItem)["ucRole"].Controls.Add(lblRole);
            }
            catch (Exception ex)
            {
                Response.Write("RadGrid_ItemDataBound() : " + ex.Message);
            }
        }
    }
    protected void RadGrid2_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridDataItem)
        {
            try
            {
                string sUsername = (e.Item as GridDataItem)["UserName"].Text.ToString();
                
                Image imgAccess = new Image();
                imgAccess.ImageUrl =AppConfig.GetBaseSiteUrl()+ "images/reports/circleNo.gif";
                if ((e.Item as GridDataItem)["IsLockedOut"].Text.ToString() == "False")
                {
                    imgAccess.ImageUrl = AppConfig.GetBaseSiteUrl()+ "images/reports/circleYes.gif";
                }
                (e.Item as GridDataItem)["ucAccess"].Controls.Add(imgAccess);
                 
             //   Label lblRole = new Label();
             //   lblRole.Text = (e.Item as GridDataItem)["RoleName"].Text.ToString();

                // changed to retrieve rolename instead of roleid
                /*
                lblRole.Text = "Administrator";
                if ((e.Item as GridDataItem)["RoleName"].Text.ToString() == "c09b69f6-d294-47cd-9928-e7706c9a6027")
                {
                    lblRole.Text = "User";
                }*/
             //   (e.Item as GridDataItem)["ucRole"].Controls.Add(lblRole);
            }
            catch (Exception ex)
            {
                Response.Write("RadGrid_ItemDataBound() : " + ex.Message);
            }
        }
    }

    protected void RadGrid1_ItemCommand(object source, GridCommandEventArgs e)
    {
        if (e.CommandName.ToLower().Equals("deleteuser"))
        {
            string sUserName = (e.Item as GridDataItem)["UserName"].Text;
            objBackOfficeClass.DeleteUserDetails(sUserName, "0", "1");
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Backoffice/UserUtilities/UserUtilities.aspx?msg=del", true);

        }
    }

    protected void RadGrid1_DeleteCommand(object source, GridCommandEventArgs e)
    {

        string sUserName = (e.Item as GridDataItem)["UserName"].Text.ToString().ToLower();
     
        if (sUserName != Membership.GetUser().UserName.ToLower())
        {
                objBackOfficeClass.Mem_DELETE_UserInfo(sUserName, "0", "1");

        }     
    }
    protected void RadGrid2_DeleteCommand(object source, GridCommandEventArgs e)
    {
        string sUserName = (e.Item as GridDataItem)["UserName"].Text;
        objBackOfficeClass.Mem_DELETE_UserInfo(sUserName, "1", "0");
    }

    /*Following function is added by Netsmartz for adding the css path at runtime*/
    protected override void OnInit(EventArgs e)
    {

        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Main.css\" />"));


        base.OnInit(e);

    }
}
