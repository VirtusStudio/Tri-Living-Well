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

public partial class UC_Nutrition_IndividualReport_PopUp : System.Web.UI.UserControl
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
            // linkMeasuring
            // linkMen
            // linkWomen" ImageUrl="<%=AppConfig.GetBaseSiteUrl() %>Images\tipswomen.png" NavigateUrl="#" Text="Tips for Women" Target="_new" runat="server"/>
            // textEntryDate
            // textBaselineWeight
            // textLatestWeight
            // textChangeWeight
            // textPercentChangeWeight
            // textBaselineWaist
            // textLatestWaist
            // textChangeWaist
            // textPercentChangeWaist
            // textBaselineNeck
            // textLatestNeck
            // textChangeNeck
            // textPercentChangeNeck
            // textBaselineHips
            // textLatestHips
            // textChangeHips
            // textPercentChangeHips
          
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {


    }

}
