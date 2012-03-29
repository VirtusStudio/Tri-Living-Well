using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class BackOffice_UserUtilities_ManageHotLinks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = string.Empty;

        if (!IsPostBack)
        {
            BindDetails();
            if (Request.QueryString["msg"] != null)
            {
                if (Request.QueryString["msg"].ToString().Equals("ins"))
                    lblMsg.Text = "Record has been inserted successfully.";
                else if (Request.QueryString["msg"].ToString().Equals("del"))
                    lblMsg.Text = "Record has been deleted successfully.";
                else if (Request.QueryString["msg"].ToString().Equals("up"))
                    lblMsg.Text = "Record has been updated successfully.";
                

            }
        }
    }
    protected void GVLinks_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("EditLinks"))
        {
            BLL.HotSectionDetailsLib oHotSectionDetailsLib = null;
            Entity.HotSectionDetailsInfo oHotSectionDetailsInfo = null;
            try
            {
                oHotSectionDetailsLib = new BLL.HotSectionDetailsLib();
                oHotSectionDetailsInfo = new Entity.HotSectionDetailsInfo();
                oHotSectionDetailsInfo = oHotSectionDetailsLib.GetAllHotSectionsByPrimaryId(Convert.ToInt32(e.CommandArgument));
                if (oHotSectionDetailsInfo != null)
                {
                    ViewState["IntHotSectionId"] = e.CommandArgument.ToString();
                    txtDescription.Text = oHotSectionDetailsInfo.StrDescription;
                    txtHeading.Text = oHotSectionDetailsInfo.StrHeading;
                }
            }
            catch (Exception ex) { lblMsg.Text = ex.Message; }
            finally
            {
                oHotSectionDetailsInfo = null;
                oHotSectionDetailsLib = null;
            }

        }
        else if (e.CommandName.Equals("DeleteLinks"))
        {
            BLL.HotSectionDetailsLib oHotSectionDetailsLib = null;
            try
            {
                oHotSectionDetailsLib = new BLL.HotSectionDetailsLib();

                oHotSectionDetailsLib.DeleteHotSectionDetails(Convert.ToInt32(e.CommandArgument));
                oHotSectionDetailsLib = null;
                Response.Redirect(AppConfig.GetBaseSiteUrl() + "BackOffice/UserUtilities/ManageHotLinks.aspx?msg=del");
            }
            catch (Exception ex) { lblMsg.Text = ex.Message; }
            finally
            {
                oHotSectionDetailsLib = null;
            }
        }
    }


    protected void lnkbtnSave_Click(object sender, EventArgs e)
    {
        BackofficeClass objBackOfficeClass = new BackofficeClass();
        DataSet DS = objBackOfficeClass.Mem_GET_UserInfo(AppLib.GetLoggedInUserName());

        BLL.HotSectionDetailsLib oHotSectionDetailsLib = null;
        Entity.HotSectionDetailsInfo oHotSectionDetailsInfo = null;
        try
        {

            oHotSectionDetailsInfo = new Entity.HotSectionDetailsInfo();
            if (txtHeading.Text.Length > 500)
                oHotSectionDetailsInfo.StrHeading = txtHeading.Text.Substring(0, 498);
            else
                oHotSectionDetailsInfo.StrHeading = txtHeading.Text.Trim();

            oHotSectionDetailsInfo.StrDescription = txtDescription.Text.Trim();
            oHotSectionDetailsInfo.DtCreatedOn = DateTime.Now;
            oHotSectionDetailsInfo.StrLink = string.Empty;
            oHotSectionDetailsInfo.ChrIsDeleted = 'N';
            oHotSectionDetailsInfo.ChrDisplayOnDashboard = 'Y';
            oHotSectionDetailsInfo.GuidUserId = new Guid(DS.Tables[0].Rows[0]["USER_ID"].ToString());
            oHotSectionDetailsLib = new BLL.HotSectionDetailsLib();
            if (ViewState["IntHotSectionId"] != null)
            {
                oHotSectionDetailsInfo.IntHotSectionId = Convert.ToInt32(ViewState["IntHotSectionId"]);
                ViewState["IntHotSectionId"] = null;
                if (oHotSectionDetailsLib.UpdateHotSectionDetails(oHotSectionDetailsInfo) > 0)
                    Response.Redirect(AppConfig.GetBaseSiteUrl() + "BackOffice/UserUtilities/ManageHotLinks.aspx?msg=up");
                else
                    lblMsg.Text = "Record already exists.";
            }
            else
            {
                if (oHotSectionDetailsLib.SaveHotSectionDetails(oHotSectionDetailsInfo) > 0)
                    Response.Redirect(AppConfig.GetBaseSiteUrl() + "BackOffice/UserUtilities/ManageHotLinks.aspx?msg=ins");
                else
                    lblMsg.Text = "Record already exists.";
            }
        }
        catch (Exception ex) { lblMsg.Text = ex.Message; }
        finally
        {
            DS = null;
            objBackOfficeClass = null;
            oHotSectionDetailsInfo = null;
            oHotSectionDetailsLib = null;
        }
    }

    private void BindDetails()
    {
        BackofficeClass objBackOfficeClass = new BackofficeClass();
        DataSet DS = objBackOfficeClass.Mem_GET_UserInfo(AppLib.GetLoggedInUserName());

        BLL.HotSectionDetailsLib oHotSectionDetailsLib = null;

        try
        {
            oHotSectionDetailsLib = new BLL.HotSectionDetailsLib();
            Guid _guidUserID = new Guid(DS.Tables[0].Rows[0]["USER_ID"].ToString());
            GVLinks.DataSource = oHotSectionDetailsLib.GetAllHotSectionsByUserId(_guidUserID);
            GVLinks.DataBind();

        }
        catch (Exception ex) { lblMsg.Text = ex.Message; }
        finally
        {
            DS = null;
            objBackOfficeClass = null;
            oHotSectionDetailsLib = null;
        }
    }

}