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
using Telerik.Charting;

public partial class UC_Home_2_Control : System.Web.UI.UserControl
{
    int giChartDaySpan;//91;

    SqlConnClass objSqlConnClass = new SqlConnClass();
    PALClass objPALClass;
    DDClass objDDClass;
    BackofficeClass objBackofficeClass;
    string gsUserID;

    int giArraySize = 200;
    string[,] gaDates; 
    

    /////////Chart Fields
    int  giChartAverageView, giChartDays;

    protected void Page_Load(object sender, EventArgs e)
    {
        
        gaDates = new string[giArraySize, 4];

        objPALClass = new PALClass(objSqlConnClass.OpenConnection());
        objDDClass = new DDClass(objSqlConnClass.OpenConnection());
        objBackofficeClass = new BackofficeClass(objSqlConnClass.OpenConnection());
        gsUserID = Membership.GetUser().ProviderUserKey.ToString();

         
        ///////RadChart settings/////

        giChartDaySpan = 180;
        if (rbDays1Month.Checked) { giChartDaySpan = 30; }
        else if (rbDays3Month.Checked) { giChartDaySpan = 90; }
        else{ giChartDaySpan = 180; }

        if (rbViewDaily.Checked) { giChartAverageView = 1; }
        else if (rbViewWeekly.Checked) { giChartAverageView = 7; }
        else if (rbViewMonthly.Checked) { giChartAverageView = 30; }


        int iDdDays = giChartDaySpan;
        int iPalDays = giChartDaySpan;


        /*
        DataSet DS = objDDClass.DD_GET_DdEntries_BY_UserId(gsUserID, "", "");
        if (DS.Tables[0].Rows.Count > 2)
        {
            //foreach(DataRow DR in DS.Tables[0].Rows

            DateTime dStart = Convert.ToDateTime(DS.Tables[0].Rows[0]["DD_ENTRY_DATE"]);
            DateTime dEnd = Convert.ToDateTime(DS.Tables[0].Rows[DS.Tables[0].Rows.Count - 1]["DD_ENTRY_DATE"]);
            TimeSpan TS = dStart - dEnd;
            iDdDays = TS.Days;
        }
        DS = objPALClass.PAL_GET_PalEntries_BY_UserId(gsUserID, "", "");
        if (DS.Tables[0].Rows.Count > 2)
        {
            DateTime dStart = Convert.ToDateTime(DS.Tables[0].Rows[0]["PAL_ENTRY_DATE"]);
            DateTime dEnd = Convert.ToDateTime(DS.Tables[0].Rows[DS.Tables[0].Rows.Count - 1]["PAL_ENTRY_DATE"]);
            TimeSpan TS = dStart - dEnd;
            iPalDays = TS.Days;
        }

        if (iPalDays < iDdDays)
        {
            if (iDdDays < giChartDaySpan)
            {
                giChartDaySpan = iDdDays;
            }
        }
        else
        {
            if (iPalDays < giChartDaySpan)
            {
                giChartDaySpan = iPalDays;
            }
        }
       

        if (rbDays1Month.Checked) { giChartDaySpan = 30; }
        else if (rbDays3Month.Checked) { giChartDaySpan = 90; }
        else { giChartDaySpan = 180; }
 */
       // Response.Write(giChartDaySpan.ToString());


        /*
         if (giChartDaySpan / 12 * 12 == giChartDaySpan) { RadChart1.PlotArea.XAxis.LabelStep = 12; }
         else if (giChartDaySpan / 13 * 13 == giChartDaySpan) { RadChart1.PlotArea.XAxis.LabelStep = 13; }
         else if (giChartDaySpan / 14 * 14 == giChartDaySpan) { RadChart1.PlotArea.XAxis.LabelStep = 14; }
         else if (giChartDaySpan / 15 * 15 == giChartDaySpan) { RadChart1.PlotArea.XAxis.LabelStep = 15; }
         else if (giChartDaySpan / 16 * 16 == giChartDaySpan) { RadChart1.PlotArea.XAxis.LabelStep = 16; }
         else if (giChartDaySpan / 17 * 17 == giChartDaySpan) { RadChart1.PlotArea.XAxis.LabelStep = 17; }
         else if (giChartDaySpan / 18 * 18 == giChartDaySpan) { RadChart1.PlotArea.XAxis.LabelStep = 18; }
         else if (giChartDaySpan / 19 * 19 == giChartDaySpan) { RadChart1.PlotArea.XAxis.LabelStep = 19; }
         * */
        ///////RadChart settings//////

    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        fillOutForm();
        objSqlConnClass.CloseConnection();
    }
    private void fillOutForm()
    {
    
        ChartSeries cs1 = RadChart1.Series[0];
        cs1.Clear();
        ChartSeries cs2 = RadChart1.Series[1];
        cs2.Clear();
        ChartSeries cs3 = RadChart1.Series[2];
        cs3.Clear();
        ChartSeries cs4 = RadChart1.Series[3];
        cs4.Clear();

        if (rbTypeLine.Checked)
        {
            cs1.Type = ChartSeriesType.Line;
            cs2.Type = ChartSeriesType.Line;
            cs3.Type = ChartSeriesType.Line;
            cs4.Type = ChartSeriesType.Line;
        }
        else if (rbTypeBar.Checked)
        {
            cs1.Type = ChartSeriesType.Bar;
            cs2.Type = ChartSeriesType.Bar;
            cs3.Type = ChartSeriesType.Bar;
            cs4.Type = ChartSeriesType.Bar;
        }
        else
        {
            cs1.Type = ChartSeriesType.Point;
            cs2.Type = ChartSeriesType.Point;
            cs3.Type = ChartSeriesType.Point;
            cs4.Type = ChartSeriesType.Point;
        }


        if (giChartAverageView == 1)
        {
            RadChart1.PlotArea.XAxis.LabelStep = 10;
            
        }
        else if (giChartAverageView == 7)
        {
            RadChart1.PlotArea.XAxis.LabelStep = 2;
        }
        else
        {
            RadChart1.PlotArea.XAxis.LabelStep = 1;
        }
        RadChart1.PlotArea.XAxis.Clear();
        RadChart1.PlotArea.YAxis.Clear();
        RadChart1.PlotArea.YAxis2.Clear();

        

        fillChartAxis();

        fillChartData();
    }
    private void fillChartAxis()
    {
        DateTime dtToday = Convert.ToDateTime(DateTime.Now.ToString("MM/dd/yyyy"));
        try
        {
            int iAvergaeView = 1;
            int arrIndex = 0;
            for (int i = 0; i <= giChartDaySpan; i++)
            {
                if (iAvergaeView >= giChartAverageView)
                {
                    iAvergaeView = 1;
                    DateTime dtCurrent = dtToday.AddDays(i);
                    TimeSpan span = dtCurrent.Subtract(dtToday);
                    //Response.Write(" <b>" + span.Days + "</b>, " + dtCurrent.AddDays(-giChartDaySpan).ToString("MMM d"));
                    ChartAxisItem CAI = new ChartAxisItem();
                    CAI.Value = span.Days;
                    CAI.TextBlock.Text = dtCurrent.AddDays(-giChartDaySpan).ToString("MMM d");

                    //Response.Write(rbViewMonthly.Checked.ToString());
                    if (rbViewMonthly.Checked)
                    {
                        CAI.TextBlock.Text = dtCurrent.AddDays(-giChartDaySpan).ToString("MMM");
                    }
                    

                    CAI.Appearance.RotationAngle = 0;
                    CAI.Appearance.Position.AlignedPosition = Telerik.Charting.Styles.AlignedPositions.Top;

                    RadChart1.PlotArea.XAxis.Items.Add(CAI);

                    gaDates[arrIndex, 0] = dtCurrent.AddDays(-giChartDaySpan).ToString("MM/dd/yyyy");
                   // Response.Write(gaDates[arrIndex, 0]+ " | ");
                    gaDates[arrIndex, 2] = "0";
                    gaDates[arrIndex, 3] = CAI.Value.ToString();
                    arrIndex++;
                }
                else
                {
                    iAvergaeView++;
                }
            }

            RadChart1.PlotArea.XAxis.Appearance.MajorGridLines.Color = System.Drawing.Color.Red;
            RadChart1.PlotArea.XAxis.Appearance.MajorGridLines.Visible = true;
            RadChart1.PlotArea.XAxis.Appearance.MajorGridLines.PenStyle = System.Drawing.Drawing2D.DashStyle.Solid;
            RadChart1.PlotArea.XAxis.Appearance.MajorGridLines.Width = 3;

            if (Convert.ToDateTime(gaDates[arrIndex - 1, 0]) < DateTime.Now)
            {
                gaDates[arrIndex - 1, 0] = DateTime.Now.Date.ToString("MM/dd/yyyy");
            }

            for (int i = 0; i < 6; i++)
            {
                ChartAxisItem CAI = new ChartAxisItem();
                CAI.Value = i;
                CAI.TextBlock.Text = (i * 10).ToString();
                CAI.TextBlock.Appearance.TextProperties.Color = System.Drawing.Color.Goldenrod;
                //CAI.Appearance.RotationAngle = 90;
                //CAI.Appearance.Position.AlignedPosition = Telerik.Charting.Styles.AlignedPositions.None;


                RadChart1.PlotArea.YAxis.Items.Add(CAI);
            }

            for (int i = 0; i < 6; i++)
            {
                ChartAxisItem CAI = new ChartAxisItem();
                CAI.Value = i;
                CAI.TextBlock.Text = i.ToString();
                CAI.TextBlock.Appearance.TextProperties.Color = System.Drawing.Color.Gray;
                //CAI.Appearance.RotationAngle = 90;
                //CAI.Appearance.Position.AlignedPosition = Telerik.Charting.Styles.AlignedPositions.None;


                RadChart1.PlotArea.YAxis2.Items.Add(CAI);
            }
        }
        catch (Exception ex)
        {
        }
    }
    private void fillChartData()
    {   
        int iCountExercises = 0;
        int iHeight = 0;
        bool bWeightFlg = false;
        string[] saBMIGraph = new string[365];
        int iBMIGraph = 0;
        DateTime dCurrentDate = DateTime.Now;
        DateTime dTwoWeks = (DateTime)dCurrentDate.AddDays(-14);

        DataSet DS = objBackofficeClass.Mem_GET_UserInfo(Membership.GetUser().UserName);
        lblBMIHeight.Text = DS.Tables[0].Rows[0]["HEIGHT"].ToString() + " BMIHeight";
        iHeight = Convert.ToInt32(DS.Tables[0].Rows[0]["HEIGHT"]);

       // DS = objBackofficeClass.Mem_GET_UserAssessments_BY_UserId(gsUserID);
        //lblLevelID.Text = DS.Tables[0].Rows[0]["LEVEL_ID"].ToString() + " LEVEL_ID";
        //lblAssessmentScore.Text = DS.Tables[0].Rows[0]["ASSESSMENT_SCORE"].ToString() + "";

        DS = objPALClass.PAL_GET_PalStarts(gsUserID, "1", "0");
     
        string sNumSteps = DS.Tables[0].Rows[0]["NUM_STEPS"].ToString();
        string sProgramCurrentStep = DS.Tables[0].Rows[0]["PROGRAM_CURRENT_STEP"].ToString();

       
        DS = objPALClass.PAL_GET_PalEntries_BY_UserId(gsUserID, dCurrentDate.AddDays(-giChartDaySpan).ToString(), dCurrentDate.ToString());
         
         ChartSeries chChartSeries = RadChart1.Series[0];
        ChartSeriesItem CSI;
        TimeSpan TS =  new TimeSpan();
        foreach (DataRow DR in DS.Tables[0].Rows)
        {
            CSI = new ChartSeriesItem();

            int iCurrentDateAverage = 0;
            while ((DateTime)DR["PAL_ENTRY_DATE"] > Convert.ToDateTime(gaDates[iCurrentDateAverage, 0]) && iCurrentDateAverage < giArraySize - 1)//Gert to correct average group
            {
                iCurrentDateAverage++;
            }

            if (DR["PAL_ENTRY_WEIGHT"].ToString() != "" && iHeight.ToString() != "0")
            {
                int iBMI = (Convert.ToInt32(DR["PAL_ENTRY_WEIGHT"]) * 703 / (iHeight * iHeight));
                if (bWeightFlg == false)
                {
                    lblBMIWeight.Text = DR["PAL_ENTRY_WEIGHT"].ToString() + " BMIWeight";
                    bWeightFlg = true;
                }
                try
                {
                    gaDates[iCurrentDateAverage, 1] = (Convert.ToDouble(gaDates[iCurrentDateAverage, 1]) + (Convert.ToDouble(iBMI) / 10)).ToString();
                    gaDates[iCurrentDateAverage, 2] = (Convert.ToInt32(gaDates[iCurrentDateAverage, 2]) + 1).ToString();
                }
                catch (Exception e)
                { }

                saBMIGraph[iBMIGraph] = DR["PAL_ENTRY_WEIGHT"].ToString();
                iBMIGraph++;
            }
           

        }
        if (cbBMI.Checked)
        { 
            /*
            Response.Write("</br>RadChart1.PlotAreaX " + RadChart1.PlotArea.XAxis.Items.Count.ToString() + " x " + RadChart1.PlotArea.XAxis.Items[0].Value.ToString() + " x " + RadChart1.PlotArea.XAxis.Items[RadChart1.PlotArea.XAxis.Items.Count - 1].Value.ToString() + "</br>");
            Response.Write("RadChart1.PlotAreaX " + RadChart1.PlotArea.YAxis.Items.Count.ToString() + " x " + RadChart1.PlotArea.YAxis.Items[0].Value.ToString() + " x " + RadChart1.PlotArea.YAxis.Items[RadChart1.PlotArea.YAxis.Items.Count - 1].Value.ToString() + "</br>");
            Response.Write("RadChart1.PlotAreaX " + RadChart1.PlotArea.YAxis2.Items.Count.ToString() + " x " + RadChart1.PlotArea.YAxis2.Items[0].Value.ToString() + " x " + RadChart1.PlotArea.YAxis2.Items[RadChart1.PlotArea.YAxis2.Items.Count - 1].Value.ToString() + "</br>");

           
            Response.Write("XAvis values: " + RadChart1.PlotArea.XAxis.Items[0].Value.ToString() + ", ");
            Response.Write(RadChart1.PlotArea.XAxis.Items[1].Value.ToString() + ", ");
            Response.Write(RadChart1.PlotArea.XAxis.Items[2].Value.ToString() + ", ");
            Response.Write(RadChart1.PlotArea.XAxis.Items[3].Value.ToString() + ", ");
            Response.Write(RadChart1.PlotArea.XAxis.Items[4].Value.ToString() + ", ");
            Response.Write(RadChart1.PlotArea.XAxis.Items[5].Value.ToString() + ", ");
            Response.Write(RadChart1.PlotArea.XAxis.Items[6].Value.ToString() + ", ");
            Response.Write(RadChart1.PlotArea.XAxis.Items[7].Value.ToString() + ", ");
            Response.Write(RadChart1.PlotArea.XAxis.Items[8].Value.ToString() + ", ");
            Response.Write(RadChart1.PlotArea.XAxis.Items[9].Value.ToString() + ", ");
            Response.Write(RadChart1.PlotArea.XAxis.Items[10].Value.ToString() + ", ");
            Response.Write(RadChart1.PlotArea.XAxis.Items[11].Value.ToString());
            */
                for (int i = 0; i < giArraySize; i++)
                {
                    if (gaDates[i, 2] != "0" && gaDates[i, 2] != "" && gaDates[i, 2] != null)
                    {
                        CSI = new ChartSeriesItem();
                        CSI.YValue = Convert.ToDouble(gaDates[i, 1]) / Convert.ToInt32(gaDates[i, 2]);
                        TS = DateTime.Now - Convert.ToDateTime(gaDates[i, 0]);

                        CSI.XValue = Convert.ToDouble(gaDates[i, 3]);//(giChartDaySpan - TS.Days);

                        chChartSeries.AddItem(CSI);//, Convert.ToDateTime(DR["PAL_ENTRY_DATE"].ToString(),"dd,MM,yyyy").ToString());

                       

                    }
                }
        }

        //clear out the array data for the next field.  
        for (int i = 0; i < giArraySize; i++)
        {
            gaDates[i, 1] = "0";
            gaDates[i, 2] ="0";
        }



        
        DS = objDDClass.DD_GET_DdEntries_BY_UserId(gsUserID, dCurrentDate.AddDays(-giChartDaySpan).ToString(), dCurrentDate.ToString());

        chChartSeries = RadChart1.Series[1];
        TS = new TimeSpan();
        foreach (DataRow DR in DS.Tables[0].Rows)
        {
            CSI = new ChartSeriesItem();


            int iCurrentDateAverage = 0;
            while ((DateTime)DR["DD_ENTRY_DATE"] > Convert.ToDateTime(gaDates[iCurrentDateAverage, 0]))//Gert to correct average group
            {
                iCurrentDateAverage++;
            }



            if (DR["LV_FIELD_01"].ToString() != "" && DR["LV_FIELD_01"].ToString() != "0")
            {
                int iSleep = Convert.ToInt32(DR["LV_FIELD_01"]);

                gaDates[iCurrentDateAverage, 1] = (Convert.ToDouble(gaDates[iCurrentDateAverage, 1]) + (Convert.ToDouble(iSleep))).ToString();
                gaDates[iCurrentDateAverage, 2] = (Convert.ToInt32(gaDates[iCurrentDateAverage, 2]) + 1).ToString();

                saBMIGraph[iBMIGraph] = DR["LV_FIELD_01"].ToString();
                iBMIGraph++;
            }
        }


        if (cbSleep.Checked)
        {
       
            for (int i = 0; i < giArraySize; i++)
            {
                if (gaDates[i, 2] != "0" && gaDates[i, 2] != "" && gaDates[i, 2] != null)
                {
                    CSI = new ChartSeriesItem();
                    CSI.YValue = Convert.ToDouble(gaDates[i, 1]) / Convert.ToInt32(gaDates[i, 2]);
                    TS = DateTime.Now - Convert.ToDateTime(gaDates[i, 0]);

                    CSI.XValue = Convert.ToDouble(gaDates[i, 3]);//(giChartDaySpan - TS.Days);

                    chChartSeries.AddItem(CSI);//, Convert.ToDateTime(DR["PAL_ENTRY_DATE"].ToString(),"dd,MM,yyyy").ToString());
                }
            }
        }


        //clear out the array data for the next field.  
        for (int i = 0; i < giArraySize; i++)
        {
            gaDates[i, 1] = "0";
            gaDates[i, 2] = "0";
        }







        DS = objDDClass.DD_GET_DdEntries_BY_UserId(gsUserID, dCurrentDate.AddDays(-giChartDaySpan).ToString(), dCurrentDate.ToString());

        chChartSeries = RadChart1.Series[2];
        TS = new TimeSpan();
        foreach (DataRow DR in DS.Tables[0].Rows)
        {
            CSI = new ChartSeriesItem();


            int iCurrentDateAverage = 0;
            while ((DateTime)DR["DD_ENTRY_DATE"] > Convert.ToDateTime(gaDates[iCurrentDateAverage, 0]))//Gert to correct average group
            {
                iCurrentDateAverage++;
            }



            if (DR["LV_FIELD_02"].ToString() != "" && DR["LV_FIELD_02"].ToString() != "0")
            {
                int iSleep = Convert.ToInt32(DR["LV_FIELD_02"]);
               // Response.Write(gaDates[iCurrentDateAverage, 1].ToString() + ",  ");


                gaDates[iCurrentDateAverage, 1] = (Convert.ToDouble(gaDates[iCurrentDateAverage, 1]) + (Convert.ToDouble(iSleep))).ToString();
                gaDates[iCurrentDateAverage, 2] = (Convert.ToInt32(gaDates[iCurrentDateAverage, 2]) + 1).ToString();

                saBMIGraph[iBMIGraph] = DR["LV_FIELD_02"].ToString();
                iBMIGraph++;
            }
        }

        if (cbStress.Checked)
        {

            for (int i = 0; i < giArraySize; i++)
            {
                if (gaDates[i, 2] != "0" && gaDates[i, 2] != "" && gaDates[i, 2] != null)
                {
                    CSI = new ChartSeriesItem();
                    CSI.YValue = Convert.ToDouble(gaDates[i, 1]) / Convert.ToInt32(gaDates[i, 2]);
                    TS = DateTime.Now - Convert.ToDateTime(gaDates[i, 0]);
                  //  Response.Write(CSI.YValue.ToString()+"  ");
                    CSI.XValue = Convert.ToDouble(gaDates[i, 3]);//(giChartDaySpan - TS.Days);

                    chChartSeries.AddItem(CSI);//, Convert.ToDateTime(DR["PAL_ENTRY_DATE"].ToString(),"dd,MM,yyyy").ToString());
                }
            }
        }

        //clear out the array data for the next field.  
        for (int i = 0; i < giArraySize; i++)
        {
            gaDates[i, 1] = "0";
            gaDates[i, 2] = "0";
        }








        DS = objPALClass.PAL_GET_PalEntries_BY_UserId(gsUserID, dCurrentDate.AddDays(-giChartDaySpan).ToString(), dCurrentDate.ToString());

        chChartSeries = RadChart1.Series[3];
        TS = new TimeSpan();
        foreach (DataRow DR in DS.Tables[0].Rows)
        {
            CSI = new ChartSeriesItem();

            //Response.Write(((DateTime)DR["PAL_ENTRY_DATE"]).ToString() + " </br> " );

            int iCurrentDateAverage = 0;
            while ((DateTime)DR["PAL_ENTRY_DATE"] > Convert.ToDateTime(gaDates[iCurrentDateAverage, 0]) && iCurrentDateAverage < giArraySize - 1)//Gert to correct average group
            {
                
                iCurrentDateAverage++;
            }

            if (DR["MET_EQUIVALENT"].ToString() != "")
            {
                int iMET = Convert.ToInt32(DR["MET_EQUIVALENT"]) / 10;

                gaDates[iCurrentDateAverage, 1] = (Convert.ToDouble(gaDates[iCurrentDateAverage, 1]) + (Convert.ToDouble(iMET))).ToString();
                gaDates[iCurrentDateAverage, 2] = (Convert.ToInt32(gaDates[iCurrentDateAverage, 2]) + 1).ToString();



                saBMIGraph[iBMIGraph] = DR["MET_EQUIVALENT"].ToString();
                iBMIGraph++;
            }
        }

        for (int i = 0; i < iBMIGraph; i++)
        {
            lblBMIGraph.Text = lblBMIGraph.Text + " (" + saBMIGraph[i] + "," + lblBMIHeight.Text + " ) ";

        }

        if (cbMET.Checked)
        {

            for (int i = 0; i < giArraySize; i++)
            {
                if (gaDates[i, 2] != "0" && gaDates[i, 2] != "" && gaDates[i, 2] != null)
                {
                    CSI = new ChartSeriesItem();
                    CSI.YValue = Convert.ToDouble(gaDates[i, 1]) / Convert.ToInt32(gaDates[i, 2]);
                    TS = DateTime.Now - Convert.ToDateTime(gaDates[i, 0]);

                    CSI.XValue = Convert.ToDouble(gaDates[i, 3]);//(giChartDaySpan - TS.Days);

                    chChartSeries.AddItem(CSI);//, Convert.ToDateTime(DR["PAL_ENTRY_DATE"].ToString(),"dd,MM,yyyy").ToString());
                }
            }
        }

       





      
    }
    protected void btnUpdateChart_Click(object sender, EventArgs e)
    {
    
    }
}
