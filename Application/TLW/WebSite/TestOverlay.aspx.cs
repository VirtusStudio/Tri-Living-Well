using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TestOverlay : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        textWeeklyDuration.Text = "1000";
        textWeeklyMetMinutes.Text = "900";
        textWeeklyCalories.Text = "3600";
        textTotalDuration.Text = "5000";
        textTotalMinutes.Text = "4500";
        textTotalCalories.Text = "10000";
        textRecordDate.Text = "10/11/2012";
        textRecordWeight.Text = "250";
        textRecordDuration.Text = "40";
        textRecordMet.Text = "35";
        textRecordEnergy.Text = "100";
        textareaRecordComments.Text = "qaqaqaqaqaqaqwswsksswjsjsjahaahhqhhaajisisiajajajqjjjj";




    }

    protected void buttonOKClick(Object sender, EventArgs e)
    {
                                                           
        string cycling = ddlCycling.SelectedValue;
        string running = ddlRunning.SelectedValue;
        string swimming = ddlSwimming.SelectedValue;
        string conditioning = ddlConditioningExercises.SelectedValue;
        string sports = ddlSports.SelectedValue;
        string walking = ddlWalking.SelectedValue;
        string activityDate = textRecordDate.Text.Trim();
        int weight = Convert.ToInt32(textRecordWeight.Text.Trim());
        int duration =  Convert.ToInt32(textRecordDuration.Text.Trim());
        int metMinutes = Convert.ToInt32(textRecordMet.Text.Trim());
        int energy = Convert.ToInt32(textRecordEnergy.Text.Trim());
        string intensity = ddlRecordIntensity.SelectedValue;
        string comments = textareaRecordComments.Text.Trim();

    }
}