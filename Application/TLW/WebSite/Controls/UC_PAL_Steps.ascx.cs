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

public partial class UC_PAL_Steps : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    public void populate(string sProgramCurrentStep, string sNumSteps)
    {
        int iProgramCurrentStep = Convert.ToInt32(sProgramCurrentStep);
        int iNumSteps = Convert.ToInt32(sNumSteps);
        lblSteps.Text = "<table style='width:auto;'><tr>";
        for (int i = 0; i < Convert.ToInt32(iNumSteps); i++)
        {
            if (i+1 < iProgramCurrentStep)
            {
            lblSteps.Text += "<td style='vertical-align:bottom;'><img src='"+AppConfig.GetBaseSiteUrl()+"images/icons/iconStepOff.gif' style='width:#WIDTH#;' /></td>";
            }
            else if (i+1 == iProgramCurrentStep)
            {
                lblSteps.Text += "<td style='vertical-align:bottom;'><img src='" + AppConfig.GetBaseSiteUrl() + "images/icons/iconStepSelected.gif' style='width:#WIDTH#;' /></td>";
            }
            else//i+1 > iProgramCurrentStep
            {
                lblSteps.Text += "<td style='vertical-align:bottom;'><img src='" + AppConfig.GetBaseSiteUrl() + "images/icons/iconStepOn.gif' style='width:#WIDTH#;' /></td>";
            }
        }
        lblSteps.Text += "</tr><tr>";
        for (int i = 0; i < Convert.ToInt32(iNumSteps); i++)
        {
            lblSteps.Text += "<td style='text-align:center;'>" + (i+1).ToString() + "</td>";
        }
        lblSteps.Text += "</tr></table>";
        //lblSteps.Text = lblSteps.Text.Replace("#WIDTH#", (100 / iNumSteps).ToString() + "%");
        lblSteps.Text = lblSteps.Text.Replace("#WIDTH#", "auto");
    }
}
