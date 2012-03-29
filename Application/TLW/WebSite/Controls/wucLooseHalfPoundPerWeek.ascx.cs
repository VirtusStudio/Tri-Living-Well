using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_wucLooseHalfPoundPerWeek : System.Web.UI.UserControl
{

    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Page.IsPostBack.Equals(false))
            BindDetails();

    }

    /// <summary>
    /// following event is used to calculate the additional minute.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnCalculate_Click(object sender, EventArgs e)
    {

        BLL.UserLib oUserLib = new BLL.UserLib();
        try
        {
            decimal decMet = oUserLib.GetMETActivityDetailsByActivityId(Convert.ToInt32(ddlActivityType.SelectedValue)).DecMET;
            decimal decWeightinKG = Convert.ToDecimal(txtWeight.Text) / Convert.ToDecimal(2.2);
            decMet = decMet - 1;
            decimal decResult = (decMet  * Convert.ToDecimal(3.5) * decWeightinKG) / Convert.ToDecimal(200);
            txtAdditionalMinuteAdded.Text = Math.Round(Convert.ToDecimal(Convert.ToDecimal(875) / decResult)).ToString();
        }
        catch { }
        finally { oUserLib = null; }
    }

    #endregion

    #region User Defined Functions

    /// <summary>
    /// following function is used to bind the details at pageload
    /// </summary>
    private void BindDetails()
    {
        BLL.UserLib oUserLib = new BLL.UserLib();
        try
        {
            ddlActivityType.DataSource = oUserLib.GetMETActivities();
            ddlActivityType.DataTextField = "StrActivityName";
            ddlActivityType.DataValueField = "IntActivityTypeId";
            ddlActivityType.DataBind();
        }
        catch { }
        finally { oUserLib = null; }
    }

    #endregion


}