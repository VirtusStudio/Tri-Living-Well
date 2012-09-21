/*

*/

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

public partial class UC_Nutrition_HealthScale_PopUp : System.Web.UI.UserControl
{
    private SqlConnClass objSqlConnClass = new SqlConnClass();
    

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        fillOutForm();
    }

    private void fillOutForm()
    {
        int iGoalWeight = 0;
        int iWeightLossGoal = 0;
        int iBaselineLBS = 0;
        int iBaselineLoss = 0;
        int iLatestLBS = 0;
        int iLatestLoss = 0;
        decimal iPercentChangeLBS = 0.0m;
        decimal iPercentChangeLoss = 0.0m;
        DateTime dtTargetDateLBS = DateTime.MinValue;
        DateTime dtTargetDateLoss = DateTime.MinValue;
          
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {


    }

}
