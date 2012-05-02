using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Common;
using System.Web.Security;
using Telerik.Charting;

public partial class WellnessDiary : System.Web.UI.Page
{
    protected DbCommand cmd;
    protected DbConnection cn;
    protected DbProviderFactory providerFactory;
    int totalsleep = 0;
    int totalItems = 0;
    int totalstrss = 0;
    int totaloutlook = 0;
    int totalenergy = 0;
    int totalstrItems = 0;
    int totaloutlookItems = 0;
    int totalengagement = 0;
    int totalenergyitems = 0;
    int totalengagementItems = 0;
    double valsleep = 0.0;
    double valoutlook = 0.0;
    double valengagement = 0.0;
    double valstres = 0.0;
    double valenergy = 0.0;
    DateTime today;
    Entity.CompanyInfo oCompanyInfo = new Entity.CompanyInfo();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("Wellness Diary");

            #endregion
        }
        if (!Page.IsPostBack)
        {
            BindEvents();
            bindChart();
        }
    }
    private DataTable GenerateTransposedTable(DataTable inputTable)
    {
        DataTable outputTable = new DataTable();

        // Add columns by looping rows

        // Header row's first column is same as in inputTable
        outputTable.Columns.Add(inputTable.Columns[0].ColumnName.ToString());

        // Header row's second column onwards, 'inputTable's first column taken
        foreach (DataRow inRow in inputTable.Rows)
        {
            string newColName = inRow[0].ToString();
            outputTable.Columns.Add(newColName);
        }

        // Add rows by looping columns        
        for (int rCount = 1; rCount <= inputTable.Columns.Count - 1; rCount++)
        {
            DataRow newRow = outputTable.NewRow();

            // First column is inputTable's Header row's second column
            newRow[0] = inputTable.Columns[rCount].ColumnName.ToString();
            for (int cCount = 0; cCount <= inputTable.Rows.Count - 1; cCount++)
            {
                string colValue = inputTable.Rows[cCount][rCount].ToString();
                newRow[cCount + 1] = colValue;
            }
            outputTable.Rows.Add(newRow);
        }

        return outputTable;
    }
    /*Following functions is added by Netsmartz*/
    protected override void OnInit(EventArgs e)
    {
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Welcome/Styles/Corporate.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound4.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Table.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound5.css\" />"));
        base.OnInit(e);

    }
    protected void lnkBtnSearch_Click(object sender, EventArgs e)
    {
        InsertData();
    }

    private void InsertData()
    {
        try
        {
            DateTime dateValue = System.DateTime.Today;
            string dy = dateValue.ToString("dddddddd");

            providerFactory = aspnetforum.Utils.DB.CreateDBProviderFactory();
            cn = aspnetforum.Utils.DB.CreateConnection();
            cmd = providerFactory.CreateCommand();
            cmd.Connection = cn;
            this.cn.Open();

            oCompanyInfo.StrUserName = AppLib.GetLoggedInUserName();
            int sleep = Convert.ToInt32(ddlQualitySleep.SelectedValue);
            int stress = Convert.ToInt32(ddlLevel.SelectedValue);
            int outlook = Convert.ToInt32(ddloutlook.SelectedValue);
            int engagement = Convert.ToInt32(ddlengagement.SelectedValue);
            int energy = Convert.ToInt32(ddlenergylevel.SelectedValue);

            if (sleep == 0 || stress == 0  || outlook == 0 || engagement == 0 || energy == 0)
                lblMsg.Text = "You must answer each question to save.";

            else
            {

                string sUsername = Membership.GetUser().UserName;
                BLL.UserLib oUserLib = new BLL.UserLib();
                Entity.UserInfo oUserInfo = new Entity.UserInfo();
                SqlConnClass objSqlConnClass = new SqlConnClass();
                DDClass objDDClass = new DDClass(objSqlConnClass.OpenConnection());
                DataSet DS = objDDClass.AddupdateWellness(sUsername);
                if (DS.Tables[0].Rows.Count > 0)
                {
                    DataTable dt = new DataTable();
                    DateTime datee = DateTime.Today;

                    string[] dateArr = new string[DS.Tables[0].Rows.Count];
                    for (int i = 0; i < DS.Tables[0].Rows.Count; i++)
                    {
                        DateTime maxdate = Convert.ToDateTime(DS.Tables[0].Rows[i]["Dates"].ToString());
                        if (maxdate == datee)
                        {
                            this.cmd.CommandText = "Update tbl_wellnessEntry set UserName='" + sUsername + "',Sleep='" + sleep + "',Stress='" + stress + "',Outlook='" + outlook + "',Engagement='" + engagement + "',Energy='" + energy + "',Day='" + dy + "',Dates='" + maxdate + "' where Dates='" + datee + "'";
                            this.cmd.ExecuteNonQuery();
                            this.cn.Close();
                            BindEvents();
                            bindChart();

                            // Page.Response.Redirect(Page.Request.Url.ToString(), true);
                            lblMsg.Text = "* Your wellness Diary is Updated Successfully";
                        }
                    }
                }
                else
                {
                    this.cmd.CommandText = "INSERT INTO tbl_wellnessEntry(UserName, Sleep, Stress, Outlook, Engagement, Energy, Day, Dates) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                    aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, sUsername, sleep, stress, outlook, engagement, energy, dy, System.DateTime.Now.ToShortDateString());
                    this.cmd.ExecuteNonQuery();
                    this.cn.Close();
                    BindEvents();
                    bindChart();
                    //  Page.Response.Redirect(Page.Request.Url.ToString(), true);
                    lblMsg.Text = "* Your wellness Diary is Inserted Successfully";
                }
            }

        }
        catch (Exception ex)
        {

        }
    }
    private void BindEvents()
    {
        string sUsername = Membership.GetUser().UserName;
        BLL.UserLib oUserLib = new BLL.UserLib();
        Entity.UserInfo oUserInfo = new Entity.UserInfo();
        SqlConnClass objSqlConnClass = new SqlConnClass();
        DDClass objDDClass = new DDClass(objSqlConnClass.OpenConnection());
        DataSet DS = objDDClass.GetwellnessDate(sUsername);
        if (DS.Tables[0].Rows.Count > 0)
        {
            DataTable dt = new DataTable();
            DateTime datee = DateTime.Now;
            DateTime dl = datee.AddDays(-6);

            string[] dateArr = new string[DS.Tables[0].Rows.Count];
            for (int i = 0; i < DS.Tables[0].Rows.Count; i++)
            {
                dateArr[i] = DS.Tables[0].Rows[i]["Dates"].ToString();
            }

            DateTime maxdate = Convert.ToDateTime(DS.Tables[0].Rows[0]["Dates"]);
            DateTime mindate = Convert.ToDateTime(DS.Tables[0].Rows[DS.Tables[0].Rows.Count - 1]["Dates"]);
            for (int i = 0, k = 0; i < dateArr.Length; i++, k++, maxdate.AddDays(-k))
            {
                if (Convert.ToDateTime(dateArr[i]) != maxdate.AddDays(-k))
                {

                    for (int j = 0; Convert.ToDateTime(dateArr[i]) < maxdate.AddDays(-k); j++)
                    {
                        if (DS.Tables[0].Rows.Count < 7)
                        {
                            DS.Tables[0].Rows.Add(100, oCompanyInfo.StrUserName, -1, -1, -1, -1, -1, maxdate.AddDays(-k).ToString("dddd"), maxdate.AddDays(-k), mindate.AddDays(-k).DayOfWeek);
                            k = k + j + 1;
                        }
                    }


                }

            }

            int rcount = DS.Tables[0].Rows.Count;

            if (rcount < 7)
            {

                for (int j = 0; j < 7 - rcount; j++)
                {
                    int x = j + 1;
                    if (j == 0)
                    {

                        DS.Tables[0].Rows.Add(100, oCompanyInfo.StrUserName, -1, -1, -1, -1, -1, mindate.AddDays(-1).ToString("dddd"), mindate.AddDays(-1), mindate.AddDays(-1).DayOfWeek);
                    }
                    else
                    {
                        DS.Tables[0].Rows.Add(100, oCompanyInfo.StrUserName, -1, -1, -1, -1, -1, mindate.AddDays(-x).ToString("dddd"), mindate.AddDays(-x), mindate.AddDays(-x).DayOfWeek);
                    }

                }

            }

            DS.AcceptChanges();

            dt = DS.Tables[0];

            // Sorting DataTable

            DataView dataView = new DataView(dt);

            dataView.Sort = " DayOfWeeks ASC";


            string expression = "Dates > '1/1/00'";

            // Sort descending by column named CompanyName.
            string sortOrder = "DayOfWeeks ASC";
            DataRow[] dr = dt.Select(expression, sortOrder);

            DateTime date = Convert.ToDateTime(dt.Rows[0]["Dates"]);


            GVdiary.DataSource = dataView;
            GVdiary.DataBind();


        }

    }


    protected void GVdiary_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //bindChart();
        // BindEvents();

        int count = 0;
        foreach (GridViewRow r in GVdiary.Rows)
        {
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label txt = new Label();
            txt.Text = "Average";
            txt.ForeColor = System.Drawing.Color.Black;
            e.Row.Cells[1].Controls.Add(txt);


            Label lb = (Label)e.Row.FindControl("lblTotalsleep");
            lb.Text = Convert.ToDouble(valsleep).ToString();

            Label lbstres = (Label)e.Row.FindControl("lblTotalstress");
            lbstres.Text = Convert.ToDouble(valstres).ToString();
            Label lbout = (Label)e.Row.FindControl("lblTotalOutlook");
            lbout.Text = Convert.ToDouble(valoutlook).ToString();
            Label lbengage = (Label)e.Row.FindControl("lblTotalengage");
            lbengage.Text = Convert.ToDouble(valengagement).ToString();
            Label lbenergy = (Label)e.Row.FindControl("lblTotalenergy");
            lbenergy.Text = Convert.ToDouble(valenergy).ToString();


        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //bindChart();
            // BindEvents();

            Label lblslep = (Label)e.Row.FindControl("lblslep");

            int sl = int.Parse(lblslep.Text);
            if (lblslep.Text == "-1")
            {
                sl = 0;
            }
            totalsleep += sl;
            if (sl == 0)
            {
                totalItems = Convert.ToInt32(totalItems);
            }
            else
            {
                totalItems += 1;
            }

            //valsleep = (totalsleep / totalItems).ToString();
            valsleep = Math.Round(Convert.ToDouble(totalsleep) / totalItems, 1);

            Label lblstrs = (Label)e.Row.FindControl("lblstres");
            int st = int.Parse(lblstrs.Text);
            if (lblstrs.Text == "-1")
            {
                st = 0;
            }
            totalstrss += st;
            if (st == 0)
            {
                totalstrItems = Convert.ToInt32(totalstrItems);
            }
            else
            {
                totalstrItems += 1;
            }

            valstres = Math.Round(Convert.ToDouble(totalstrss) / totalstrItems, 1);

            Label lblot = (Label)e.Row.FindControl("lblout");
            int outs = int.Parse(lblot.Text);
            if (lblot.Text == "-1")
            {
                outs = 0;
            }
            totaloutlook += outs;
            if (outs == 0)
            {
                totaloutlookItems = Convert.ToInt32(totaloutlookItems);
            }
            else
            {
                totaloutlookItems += 1;
            }


            valoutlook = Math.Round(Convert.ToDouble(totaloutlook) / totaloutlookItems, 1);

            Label lbleng = (Label)e.Row.FindControl("lblengage");
            int engg = int.Parse(lbleng.Text);
            if (lbleng.Text == "-1")
            {
                engg = 0;
            }
            totalengagement += engg;
            if (engg == 0)
            {
                totalengagementItems = Convert.ToInt32(totalengagementItems);
            }
            else
            {
                totalengagementItems += 1;
            }

            valengagement = Math.Round(Convert.ToDouble(totalengagement) / totalengagementItems, 1);

            Label lblenergy = (Label)e.Row.FindControl("lblenergy");
            int engry = int.Parse(lblenergy.Text);
            if (lblenergy.Text == "-1")
            {
                engry = 0;
            }
            totalenergy += engry;
            if (engry == 0)
            {
                totalenergyitems = Convert.ToInt32(totalenergyitems);
            }
            else
            {
                totalenergyitems += 1;
            }

            valenergy = Math.Round(Convert.ToDouble(totalenergy) / totalenergyitems, 1);


        }

    }

    private void bindChart()
    {
        double[] avg = new double[1];
        avg[0] = valsleep;
        double[] avgstress = new double[1];
        avgstress[0] = valstres;
        double[] avgoutlook = new double[1];
        avgoutlook[0] = valoutlook;
        double[] avgengagement = new double[1];
        avgengagement[0] = valengagement;
        double[] avgenergy = new double[1];
        avgenergy[0] = valenergy;
        chart1.Series["Average"].Points[0].YValues = avg;
        chart1.Series["Average"].Points[1].YValues = avgstress;
        chart1.Series["Average"].Points[2].YValues = avgoutlook;
        chart1.Series["Average"].Points[3].YValues = avgengagement;
        chart1.Series["Average"].Points[4].YValues = avgenergy;

        string sUsername = Membership.GetUser().UserName;
        BLL.UserLib oUserLib = new BLL.UserLib();
        Entity.UserInfo oUserInfo = new Entity.UserInfo();
        SqlConnClass objSqlConnClass = new SqlConnClass();
        DDClass objDDClass = new DDClass(objSqlConnClass.OpenConnection());
        DataSet DS = objDDClass.GetwellnessDate(sUsername);
        if (DS.Tables[0].Rows.Count > 0)
        {
            DataTable dt = new DataTable();
            DateTime datee = DateTime.Now;
            DateTime dl = datee.AddDays(-6);

            string[] dateArr = new string[DS.Tables[0].Rows.Count];
            for (int i = 0; i < DS.Tables[0].Rows.Count; i++)
            {
                dateArr[i] = DS.Tables[0].Rows[i]["Dates"].ToString();
            }

            DateTime maxdate = Convert.ToDateTime(DS.Tables[0].Rows[0]["Dates"]);
            DateTime mindate = Convert.ToDateTime(DS.Tables[0].Rows[DS.Tables[0].Rows.Count - 1]["Dates"]);
            for (int i = 0, k = 0; i < dateArr.Length; i++, k++, maxdate.AddDays(-k))
            {
                if (Convert.ToDateTime(dateArr[i]) != maxdate.AddDays(-k))
                {

                    for (int j = 0; Convert.ToDateTime(dateArr[i]) < maxdate.AddDays(-k); j++)
                    {
                        if (DS.Tables[0].Rows.Count < 7)
                        {
                            DS.Tables[0].Rows.Add(100, oCompanyInfo.StrUserName, -1, -1, -1, -1, -1, maxdate.AddDays(-k).ToString("dddd"), maxdate.AddDays(-k));
                            k = k + j + 1;
                        }
                    }


                }

            }

            int rcount = DS.Tables[0].Rows.Count;

            if (rcount < 7)
            {

                for (int j = 0; j < 7 - rcount; j++)
                {
                    int x = j + 1;
                    if (j == 0)
                    {

                        DS.Tables[0].Rows.Add(100, oCompanyInfo.StrUserName, -1, -1, -1, -1, -1, mindate.AddDays(-1).ToString("dddd"), mindate.AddDays(-1), mindate.AddDays(-1).DayOfWeek);
                    }
                    else
                    {
                        DS.Tables[0].Rows.Add(100, oCompanyInfo.StrUserName, -1, -1, -1, -1, -1, mindate.AddDays(-x).ToString("dddd"), mindate.AddDays(-x), mindate.AddDays(-x).DayOfWeek);
                    }

                }

            }



            DS.AcceptChanges();
            dt = DS.Tables[0];


            foreach (DataRow dr in dt.Rows)
            {
                string day = dr["Day"].ToString().Trim().ToLower();
                switch (day)
                {
                    case "monday":
                        double[] mon = new double[1];
                        double[] monstress = new double[1];
                        double[] outlook = new double[1];
                        double[] engagement = new double[1];
                        double[] energy = new double[1];
                        mon[0] = Convert.ToInt16(dr["Sleep"].ToString());
                        monstress[0] = Convert.ToInt16(dr["Stress"].ToString());
                        outlook[0] = Convert.ToInt16(dr["Outlook"].ToString());
                        engagement[0] = Convert.ToInt16(dr["Engagement"].ToString());
                        energy[0] = Convert.ToInt16(dr["Energy"].ToString());

                        if (mon[0] == -1 || monstress[0] == -1 || outlook[0] == -1 || engagement[0] == -1 || energy[0] == -1)
                        {
                            mon[0] = 0;
                            monstress[0] = 0;
                            outlook[0] = 0;
                            engagement[0] = 0;
                            energy[0] = 0;
                        }
                        else
                        {


                            chart1.Series["Monday"].Points[0].YValues = mon;
                            chart1.Series["Monday"].Points[1].YValues = monstress;
                            chart1.Series["Monday"].Points[2].YValues = outlook;
                            chart1.Series["Monday"].Points[3].YValues = engagement;
                            chart1.Series["Monday"].Points[4].YValues = energy;

                        }

                        break;
                    case "tuesday":
                        double[] tues = new double[1];
                        double[] tuestress = new double[1];
                        double[] tuesoutlook = new double[1];
                        double[] tuesengament = new double[1];
                        double[] tuesenergy = new double[1];

                        tues[0] = Convert.ToInt16(dr["Sleep"].ToString());
                        tuestress[0] = Convert.ToInt16(dr["Stress"].ToString());
                        tuesoutlook[0] = Convert.ToInt16(dr["Outlook"].ToString());
                        tuesengament[0] = Convert.ToInt16(dr["Engagement"].ToString());
                        tuesenergy[0] = Convert.ToInt16(dr["Energy"].ToString());
                        if (tues[0] == -1 || tuestress[0] == -1 || tuesoutlook[0] == -1 || tuesengament[0] == -1 || tuesenergy[0] == -1)
                        {
                            tues[0] = 0;
                            tuestress[0] = 0;
                            tuesoutlook[0] = 0;
                            tuesengament[0] = 0;
                            tuesenergy[0] = 0;
                        }
                        else
                        {

                            chart1.Series["Tuesday"].Points[0].YValues = tues;
                            chart1.Series["Tuesday"].Points[1].YValues = tuestress;
                            chart1.Series["Tuesday"].Points[2].YValues = tuesoutlook;
                            chart1.Series["Tuesday"].Points[3].YValues = tuesengament;
                            chart1.Series["Tuesday"].Points[4].YValues = tuesenergy;

                        }
                        break;
                    case "wednesday":
                        double[] wed = new double[1];
                        double[] wedstress = new double[1];
                        double[] wedoutlook = new double[1];
                        double[] wedengage = new double[1];
                        double[] wedenergy = new double[1];
                        wed[0] = Convert.ToInt16(dr["Sleep"].ToString());
                        wedstress[0] = Convert.ToInt16(dr["Stress"].ToString());
                        wedoutlook[0] = Convert.ToInt16(dr["Outlook"].ToString());
                        wedengage[0] = Convert.ToInt16(dr["Engagement"].ToString());
                        wedenergy[0] = Convert.ToInt16(dr["Energy"].ToString());

                        if (wed[0] == -1 || wedstress[0] == -1 || wedoutlook[0] == -1 || wedengage[0] == -1 || wedenergy[0] == -1)
                        {
                            wed[0] = 0;
                            wedstress[0] = 0;
                            wedoutlook[0] = 0;
                            wedengage[0] = 0;
                            wedenergy[0] = 0;
                        }
                        else
                        {


                            chart1.Series["Wednesday"].Points[0].YValues = wed;
                            chart1.Series["Wednesday"].Points[1].YValues = wedstress;
                            chart1.Series["Wednesday"].Points[2].YValues = wedoutlook;
                            chart1.Series["Wednesday"].Points[3].YValues = wedengage;
                            chart1.Series["Wednesday"].Points[4].YValues = wedenergy;
                        }
                        break;
                    case "thursday":
                        double[] turs = new double[1];
                        double[] turstress = new double[1];
                        double[] tursoutlook = new double[1];
                        double[] tursengage = new double[1];
                        double[] tursenergy = new double[1];

                        turs[0] = Convert.ToInt16(dr["Sleep"].ToString());
                        turstress[0] = Convert.ToInt16(dr["Stress"].ToString());
                        tursoutlook[0] = Convert.ToInt16(dr["Outlook"].ToString());
                        tursengage[0] = Convert.ToInt16(dr["Engagement"].ToString());
                        tursenergy[0] = Convert.ToInt16(dr["Energy"].ToString());
                        if (turs[0] == -1 || turstress[0] == -1 || tursoutlook[0] == -1 || tursengage[0] == -1 || tursenergy[0] == -1)
                        {
                            turs[0] = 0;
                            turstress[0] = 0;
                            tursoutlook[0] = 0;
                            tursengage[0] = 0;
                            tursenergy[0] = 0;
                        }
                        else
                        {

                            chart1.Series["Thursday"].Points[0].YValues = turs;
                            chart1.Series["Thursday"].Points[1].YValues = turstress;
                            chart1.Series["Thursday"].Points[2].YValues = tursoutlook;
                            chart1.Series["Thursday"].Points[3].YValues = tursengage;
                            chart1.Series["Thursday"].Points[4].YValues = tursenergy;
                        }
                        break;
                    case "friday":
                        double[] xpoint = new double[1];
                        double[] xpointstress = new double[1];
                        double[] xpointoutlook = new double[1];
                        double[] xpointengage = new double[1];
                        double[] xpointenergy = new double[1];

                        xpoint[0] = Convert.ToInt16(dr["Sleep"].ToString());
                        xpointstress[0] = Convert.ToInt16(dr["Stress"].ToString());
                        xpointoutlook[0] = Convert.ToInt16(dr["Outlook"].ToString());
                        xpointengage[0] = Convert.ToInt16(dr["Engagement"].ToString());
                        xpointenergy[0] = Convert.ToInt16(dr["Energy"].ToString());
                        if (xpoint[0] == -1 || xpointstress[0] == -1 || xpointoutlook[0] == -1 || xpointengage[0] == -1 || xpointenergy[0] == -1)
                        {
                            xpoint[0] = 0;
                            xpointstress[0] = 0;
                            xpointoutlook[0] = 0;
                            xpointengage[0] = 0;
                            xpointenergy[0] = 0;
                        }
                        else
                        {

                            chart1.Series["Friday"].Points[0].YValues = xpoint;
                            chart1.Series["Friday"].Points[1].YValues = xpointstress;
                            chart1.Series["Friday"].Points[2].YValues = xpointoutlook;
                            chart1.Series["Friday"].Points[3].YValues = xpointengage;
                            chart1.Series["Friday"].Points[4].YValues = xpointenergy;
                        }
                        break;
                    case "saturday":
                        double[] sat = new double[1];
                        double[] satress = new double[1];
                        double[] satoutlook = new double[1];
                        double[] satengagement = new double[1];
                        double[] satenergy = new double[1];
                        sat[0] = Convert.ToInt16(dr["Sleep"].ToString());
                        satress[0] = Convert.ToInt16(dr["Stress"].ToString());
                        satoutlook[0] = Convert.ToInt16(dr["Outlook"].ToString());
                        satengagement[0] = Convert.ToInt16(dr["Engagement"].ToString());
                        satenergy[0] = Convert.ToInt16(dr["Energy"].ToString());

                        if (sat[0] == -1 || satress[0] == -1 || satoutlook[0] == -1 || satengagement[0] == -1 || satenergy[0] == -1)
                        {
                            sat[0] = 0;
                            satress[0] = 0;
                            satoutlook[0] = 0;
                            satengagement[0] = 0;
                            satenergy[0] = 0;
                        }
                        else
                        {

                            chart1.Series["Saturday"].Points[0].YValues = sat;
                            chart1.Series["Saturday"].Points[1].YValues = satress;
                            chart1.Series["Saturday"].Points[2].YValues = satoutlook;
                            chart1.Series["Saturday"].Points[3].YValues = satengagement;
                            chart1.Series["Saturday"].Points[4].YValues = satenergy;
                        }
                        break;
                    case "sunday":
                        double[] sun = new double[1];
                        double[] sunstress = new double[1];
                        double[] sunoutlook = new double[1];
                        double[] sunengage = new double[1];
                        double[] sunenergy = new double[1];
                        sun[0] = Convert.ToInt16(dr["Sleep"].ToString());
                        sunstress[0] = Convert.ToInt16(dr["Stress"].ToString());
                        sunoutlook[0] = Convert.ToInt16(dr["Outlook"].ToString());
                        sunengage[0] = Convert.ToInt16(dr["Engagement"].ToString());
                        sunenergy[0] = Convert.ToInt16(dr["Energy"].ToString());
                        if (sun[0] == -1 || sunstress[0] == -1 || sunoutlook[0] == -1 || sunengage[0] == -1 || sunenergy[0] == -1)
                        {
                            sun[0] = 0;
                            sunstress[0] = 0;
                            sunoutlook[0] = 0;
                            sunengage[0] = 0;
                            sunenergy[0] = 0;
                        }
                        else
                        {



                            chart1.Series["Sunday"].Points[0].YValues = sun;
                            chart1.Series["Sunday"].Points[1].YValues = sunstress;
                            chart1.Series["Sunday"].Points[2].YValues = sunoutlook;
                            chart1.Series["Sunday"].Points[3].YValues = sunengage;
                            chart1.Series["Sunday"].Points[4].YValues = sunenergy;
                        }
                        break;
                }

            }


        }
    }
}