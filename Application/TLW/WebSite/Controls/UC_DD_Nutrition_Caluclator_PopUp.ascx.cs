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

public partial class UC_DD_Nutrition_Caluclator_PopUp : System.Web.UI.UserControl
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    DDClass objDDClass;

    protected void Page_Load(object sender, EventArgs e)
    {
        objDDClass = new DDClass(objSqlConnClass.OpenConnection());
        lblMsg.Text = string.Empty;
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillOutForm();

        }

        objSqlConnClass.CloseConnection();
    }

    private void fillOutForm()
    {

        ddlCalorieNumber = objSqlConnClass.fillDropDown(ddlCalorieNumber, "Calorie", "LIST_DD");

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string sUserID = Membership.GetUser().ProviderUserKey.ToString();


    }


    protected void btnCalorieSubmit_Click(object sender, EventArgs e)
    {
        if (!txtCalories.Text.Trim().Equals(string.Empty))
        {
            try
            {
                if (Convert.ToInt32(txtCalories.Text).Equals(0))
                {
                    //lblMsg.Text ="";

                }
            }
            catch {
                lblMsg.Text = "Invalid Calories.";
                return;
            }

            int iRecommendedCalories = Convert.ToInt32(txtCalories.Text);

            iRecommendedCalories = iRecommendedCalories / 100;
            iRecommendedCalories = iRecommendedCalories * 100;
            objDDClass.DD_UPDATE_DdUsers(Membership.GetUser().ProviderUserKey.ToString(), iRecommendedCalories.ToString());
        }
        else
        {
            lblMsg.Text = "Please Calculate Recommended Calories.";          
        }
    }
}
