using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BackOffice_UserUtilities_ManageSocialNetworkingLinks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
        }
    }
    protected void GVLinks_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("UpdateLinkValue"))
        {
            BLL.QuestionnaireLib oQuestionnaireLib;
            try
            {
                oQuestionnaireLib = new BLL.QuestionnaireLib();
                GridViewRow gvRow = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                TextBox txtValue = (TextBox)gvRow.FindControl("txtValue");
                if (txtValue != null)
                {
                    if (!txtValue.Text.Equals(string.Empty))
                    {
                        if (oQuestionnaireLib.UpdateGlobalCodesByGlobalCodeId(txtValue.Text, Convert.ToInt32(e.CommandArgument)))
                        {
                            lblMsg.Text = "Record has been updated successfully.";
                            BindGrid();
                        }
                    }
                    else
                    {
                        lblMsg.Text = "Please enter the link value.";
                        return;
                    }
                }
            }
            catch (Exception ex) { lblMsg.Text = ex.Message; }
            finally { oQuestionnaireLib = null; }


        }
    }
    private void BindGrid()
    {
        BLL.QuestionnaireLib oQuestionnaireLib;
        try
        {
            oQuestionnaireLib = new BLL.QuestionnaireLib();
            GVLinks.DataSource = oQuestionnaireLib.GetGlobalCodesByCategoryName("SocialNetworkingLink");
            GVLinks.DataBind();
        }
        catch (Exception ex) { lblMsg.Text = ex.Message; }
        finally { oQuestionnaireLib = null; }
    }
}