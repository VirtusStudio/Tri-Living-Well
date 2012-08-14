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

 protected void UpdateDates_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(ddlStartMonth.SelectedValue) || string.IsNullOrEmpty(ddlStartYear.SelectedValue) || string.IsNullOrEmpty(ddlEndMonth.SelectedValue) || string.IsNullOrEmpty(ddlEndYear.SelectedValue))
        {
            lblMsg.Text = "Please select To and From Dates";
        }
        else
        {
            update();
            
        }
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
                            //lblMsg.Text = "* Your wellness Diary is Updated Successfully";
                        }
                    }
                }
                else
                {
                    this.cmd.CommandText = "INSERT INTO tbl_wellnessEntry(UserName, Sleep, Stress, Outlook, Engagement, Energy, Day, Dates) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                    aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, sUsername, sleep, stress, outlook, engagement, energy, dy, System.DateTime.Today.ToShortDateString());
                    this.cmd.ExecuteNonQuery();
                    this.cn.Close();
                    BindEvents();
                    bindChart();
                    //  Page.Response.Redirect(Page.Request.Url.ToString(), true);
                    //lblMsg.Text = "* Your wellness Diary is Inserted Successfully";
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
            
            DS.AcceptChanges();

            dt = DS.Tables[0];

            int count = dt.Rows.Count;

            if (count > 7)
            {

                dt.DefaultView.Sort = "Dates DESC";
                dt = dt.DefaultView.ToTable();
                                
                DataTable top7 = dt.Clone();
                for (int i = 0; i < 7; i++)
                {
                    top7.ImportRow(dt.Rows[i]);
                }

                DataView dataView = new DataView(top7);

                dataView.Sort = "Dates ASC";
                GVdiary.DataSource = dataView;
                GVdiary.DataBind();
            }
            else
            {

                // Sorting DataTable

                DataView dataView = new DataView(dt);

                dataView.Sort = "Dates ASC";
                GVdiary.DataSource = dataView;
                GVdiary.DataBind();
            }

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
            txt.Text = "";
            txt.ForeColor = System.Drawing.Color.Black;
            e.Row.Cells[1].Controls.Add(txt);

            Label lbAvg = (Label)e.Row.FindControl("lblAverage");
            lbAvg.Text = "Average";

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
        string sUsername = Membership.GetUser().UserName;
        BLL.UserLib oUserLib = new BLL.UserLib();
        Entity.UserInfo oUserInfo = new Entity.UserInfo();
        SqlConnClass objSqlConnClass = new SqlConnClass();
        DDClass objDDClass = new DDClass(objSqlConnClass.OpenConnection());
        DataSet DS = objDDClass.GetwellnessDate(sUsername);
        if (DS.Tables[0].Rows.Count > 0)
        {
            DataTable dt = new DataTable();
            
            DS.AcceptChanges();
            dt = DS.Tables[0];

            int noRecords = dt.Rows.Count;

            if (noRecords > 7)
            {
                DataView dataView = new DataView(dt);

                //dataView.Sort = "Dates DESC";

                string expression = "Dates > '1/1/00'";

                // Sort descending by column named CompanyName.
                string sortOrder = "Dates DESC";

                DataRow[] dr = dt.Select(expression, sortOrder);
                
                double sleep = new double(); ;
                double stress = new double(); ;
                double outlook = new double();
                double engagement = new double();
                double energy = new double();

                DateTime fulldate = Convert.ToDateTime(dr[6]["Dates"]);
                string dates = fulldate.Date.ToShortDateString();
                chart1.Series["Sleep"].Points.AddXY(dates, dr[6]["Sleep"]);
                chart1.Series["Stress"].Points.AddXY(dates, dr[6]["Stress"]);
                chart1.Series["Outlook"].Points.AddXY(dates, dr[6]["Outlook"]);
                chart1.Series["Engagement"].Points.AddXY(dates, dr[6]["Engagement"]);
                chart1.Series["Energy"].Points.AddXY(dates, dr[6]["Energy"]);

                fulldate = Convert.ToDateTime(dr[5]["Dates"]);
                dates = fulldate.Date.ToShortDateString();
                chart1.Series["Sleep"].Points.AddXY(dates, dr[5]["Sleep"]);
                chart1.Series["Stress"].Points.AddXY(dates, dr[5]["Stress"]);
                chart1.Series["Outlook"].Points.AddXY(dates, dr[5]["Outlook"]);
                chart1.Series["Engagement"].Points.AddXY(dates, dr[5]["Engagement"]);
                chart1.Series["Energy"].Points.AddXY(dates, dr[5]["Energy"]);

                fulldate = Convert.ToDateTime(dr[4]["Dates"]);
                dates = fulldate.Date.ToShortDateString();
                chart1.Series["Sleep"].Points.AddXY(dates, dr[4]["Sleep"]);
                chart1.Series["Stress"].Points.AddXY(dates, dr[4]["Stress"]);
                chart1.Series["Outlook"].Points.AddXY(dates, dr[4]["Outlook"]);
                chart1.Series["Engagement"].Points.AddXY(dates, dr[4]["Engagement"]);
                chart1.Series["Energy"].Points.AddXY(dates, dr[4]["Energy"]);

                fulldate = Convert.ToDateTime(dr[3]["Dates"]);
                dates = fulldate.Date.ToShortDateString();
                chart1.Series["Sleep"].Points.AddXY(dates, dr[3]["Sleep"]);
                chart1.Series["Stress"].Points.AddXY(dates, dr[3]["Stress"]);
                chart1.Series["Outlook"].Points.AddXY(dates, dr[3]["Outlook"]);
                chart1.Series["Engagement"].Points.AddXY(dates, dr[3]["Engagement"]);
                chart1.Series["Energy"].Points.AddXY(dates, dr[3]["Energy"]);

                fulldate = Convert.ToDateTime(dr[2]["Dates"]);
                dates = fulldate.Date.ToShortDateString();
                chart1.Series["Sleep"].Points.AddXY(dates, dr[2]["Sleep"]);
                chart1.Series["Stress"].Points.AddXY(dates, dr[2]["Stress"]);
                chart1.Series["Outlook"].Points.AddXY(dates, dr[2]["Outlook"]);
                chart1.Series["Engagement"].Points.AddXY(dates, dr[2]["Engagement"]);
                chart1.Series["Energy"].Points.AddXY(dates, dr[2]["Energy"]);

                fulldate = Convert.ToDateTime(dr[1]["Dates"]);
                dates = fulldate.Date.ToShortDateString();
                chart1.Series["Sleep"].Points.AddXY(dates, dr[1]["Sleep"]);
                chart1.Series["Stress"].Points.AddXY(dates, dr[1]["Stress"]);
                chart1.Series["Outlook"].Points.AddXY(dates, dr[1]["Outlook"]);
                chart1.Series["Engagement"].Points.AddXY(dates, dr[1]["Engagement"]);
                chart1.Series["Energy"].Points.AddXY(dates, dr[1]["Energy"]);

                fulldate = Convert.ToDateTime(dr[0]["Dates"]);
                dates = fulldate.Date.ToShortDateString();
                chart1.Series["Sleep"].Points.AddXY(dates, dr[0]["Sleep"]);
                chart1.Series["Stress"].Points.AddXY(dates, dr[0]["Stress"]);
                chart1.Series["Outlook"].Points.AddXY(dates, dr[0]["Outlook"]);
                chart1.Series["Engagement"].Points.AddXY(dates, dr[0]["Engagement"]);
                chart1.Series["Energy"].Points.AddXY(dates, dr[0]["Energy"]); 
                    
                chart1.Series["Sleep"].BorderWidth = 2;
                chart1.Series["Stress"].BorderWidth = 2;
                chart1.Series["Outlook"].BorderWidth = 2;
                chart1.Series["Engagement"].BorderWidth = 2;
                chart1.Series["Energy"].BorderWidth = 2;
            
            }

            else
            {


                foreach (DataRow dr in dt.Rows)
                {
                    double sleep = new double(); ;
                    double stress = new double(); ;
                    double outlook = new double();
                    double engagement = new double();
                    double energy = new double();
                    sleep = Convert.ToInt16(dr["Sleep"].ToString());
                    stress = Convert.ToInt16(dr["Stress"].ToString());
                    outlook = Convert.ToInt16(dr["Outlook"].ToString());
                    engagement = Convert.ToInt16(dr["Engagement"].ToString());
                    energy = Convert.ToInt16(dr["Energy"].ToString());

                    string dates = dr["Dates"].ToString();
                    chart1.Series["Sleep"].Points.AddXY(dates, sleep);//(dates, sleep[0]);
                    chart1.Series["Stress"].Points.AddXY(dates, stress);
                    chart1.Series["Outlook"].Points.AddXY(dates, outlook);
                    chart1.Series["Engagement"].Points.AddXY(dates, engagement);
                    chart1.Series["Energy"].Points.AddXY(dates, energy);

                    chart1.Series["Sleep"].BorderWidth = 2;
                    chart1.Series["Stress"].BorderWidth = 2;
                    chart1.Series["Outlook"].BorderWidth = 2;
                    chart1.Series["Engagement"].BorderWidth = 2;
                    chart1.Series["Energy"].BorderWidth = 2;
                }
            }
        }
    }

    private void update()
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

            DS.AcceptChanges();
            dt = DS.Tables[0];

            string startMonth = ddlStartMonth.SelectedValue;
            string startDay = ddlStartDay.SelectedValue; ;
            string startYear = ddlStartYear.SelectedValue;
            string endMonth = ddlEndMonth.SelectedValue;
            string endDay = ddlEndDay.SelectedValue; ;
            string endYear = ddlEndYear.SelectedValue;
            string startDate = startMonth + "/" + startDay + "/" + startYear;
            string endDate = endMonth + "/" + endDay + "/" + endYear;

            // Sorting DataTable
          
            string expression = "Dates >= '" + startDate + "' and Dates <= '" + endDate + "'";

            // Sort descending by column named CompanyName.
            string sortOrder = "Dates ASC";

            DataRow[] dr = dt.Select(expression, sortOrder);

            int drLength = dr.Length;

            for (int i = 0; i <= drLength - 1; i++)
            {
                DateTime fulldate = Convert.ToDateTime(dr[i]["Dates"]);
                string dates = fulldate.Date.ToShortDateString();
                chart1.Series["Sleep"].Points.AddXY(dates, dr[i]["Sleep"]);
                chart1.Series["Stress"].Points.AddXY(dates, dr[i]["Stress"]);
                chart1.Series["Outlook"].Points.AddXY(dates, dr[i]["Outlook"]);
                chart1.Series["Engagement"].Points.AddXY(dates, dr[i]["Engagement"]);
                chart1.Series["Energy"].Points.AddXY(dates, dr[i]["Energy"]);

                chart1.Series["Sleep"].BorderWidth = 2;
                chart1.Series["Stress"].BorderWidth = 2;
                chart1.Series["Outlook"].BorderWidth = 2;
                chart1.Series["Engagement"].BorderWidth = 2;
                chart1.Series["Energy"].BorderWidth = 2;
            }


            DataView dataView = new DataView(dt);

            dataView.RowFilter = "Dates >= '" + startDate + "' and Dates <= '" + endDate + "'";
            dataView.Sort = "Dates ASC";

            GVdiary.DataSource = dataView;
            GVdiary.DataBind();
        }
    }
}