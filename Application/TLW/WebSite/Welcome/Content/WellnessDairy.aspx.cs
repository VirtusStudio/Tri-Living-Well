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

public partial class Welcome_Content_WellnessDairy : System.Web.UI.Page
{
    protected DbCommand cmd;
    protected DbConnection cn;
    protected DbProviderFactory providerFactory;
    int totalsleep = 0;
    int totalItems = 0;
    int totalstrss = 0;
    int totalstrItems = 0;
    double valsleep = 0.0;
    double valstres = 0.0;
    Entity.CompanyInfo oCompanyInfo = new Entity.CompanyInfo();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (AppLib.IsLoggedinSessionExists())
        {
            #region Insert visited log details

            AppLib.InsertVisitedSectionDetails("Wellness Diary");

            #endregion
        }

        BindEvents();
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
            int energ = Convert.ToInt32(ddlenergylevel.SelectedValue);

            this.cmd.CommandText = "INSERT INTO tbl_wellnessEntry(UserName, Sleep, Stress, Outlook, Engagement, Energy, Day, Dates) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, oCompanyInfo.StrUserName, sleep, stress, outlook, engagement, energ, dy, System.DateTime.Now.ToShortDateString());
            this.cmd.ExecuteNonQuery();
            this.cn.Close();
            lblMsg.Text = "* Your wellness Diary is Inserted Successfully";
        }
        catch (Exception ex)
        {

        }
    }

    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);


        ChartSeries pSeries = new ChartSeries();
        RadChart1.PlotArea.XAxis.AutoScale = false;
        RadChart1.PlotArea.XAxis.Items.Clear();

        RadChart1.PlotArea.XAxis.Items.Add(new ChartAxisItem("Sleep"));
        RadChart1.PlotArea.XAxis.Items.Add(new ChartAxisItem("Stress"));
        RadChart1.PlotArea.XAxis.Items.Add(new ChartAxisItem("Outlook"));
        RadChart1.PlotArea.XAxis.Items.Add(new ChartAxisItem("Engagement"));
        RadChart1.PlotArea.XAxis.Items.Add(new ChartAxisItem("Energy"));


    }

    private void BindEvents()
    {
        //BLL.EventsLib oEventsLib = new BLL.EventsLib();
        //GVdiary.DataSource = oEventsLib.GetWellnessData(AppLib.GetLoggedInUserName());
        //GVdiary.DataBind();
        //oEventsLib = null;

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
            for (int i = 0, k = 0; i < dateArr.Length; i++, k++, maxdate.AddDays(-k))
            {
                if (Convert.ToDateTime(dateArr[i]) != maxdate.AddDays(-k))
                {

                    for (int j = 0; Convert.ToDateTime(dateArr[i]) < maxdate.AddDays(-k); j++)
                    {
                        DS.Tables[0].Rows.Add(100, oCompanyInfo.StrUserName, -1, -1, -1, -1, -1, maxdate.AddDays(-k).ToString("dddd"), maxdate.AddDays(-k));
                        k = k + j + 1;
                    }


                }

            }

            DS.AcceptChanges();

            dt = DS.Tables[0];

            // Sorting DataTable

            DataView dataView = new DataView(dt);

            dataView.Sort = " Dates DESC";

            string expression = "Dates > '1/1/00'";

            // Sort descending by column named CompanyName.
            string sortOrder = "Dates DESC";
            DataRow[] dr = dt.Select(expression, sortOrder);

            DateTime date = Convert.ToDateTime(dt.Rows[0]["Dates"]);


            GVdiary.DataSource = dataView;
            GVdiary.DataBind();


        }




        //foreach (DataRow dr in dt.Rows)
        //{
        //    DateTime date1 = Convert.ToDateTime(dr["Dates"]);

        //    if (date1 != date.AddDays(-counter))
        //    {
        //        dt.Rows.Add(10, "-", 20, 23, 25, 33, 25, "-", date.AddDays(-counter));

        //    }

        //    dt.AcceptChanges();
        //    counter++;

        //}

        // Define 3 columns
        //DataColumn dc;
        //dc = new DataColumn("Day");
        //dt.Columns.Add(dc);
        //dc = new DataColumn("Sleep");
        //dt.Columns.Add(dc);
        //dc = new DataColumn("Stress");
        //dt.Columns.Add(dc);
        //dc = new DataColumn("Outlook");
        //dt.Columns.Add(dc);
        //dc = new DataColumn("Engagement");
        //dt.Columns.Add(dc);
        //dc = new DataColumn("Energy");
        //dt.Columns.Add(dc);




    }


    protected void GVdiary_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        int count = 0;
        foreach (GridViewRow r in GVdiary.Rows)
        {




            //            switch (count)
            //            {

            //                case 0:
            //Label lbl = (Label)r.Cells[0].FindControl("lblweekname");
            //            lbl.Text = "Monday";
            //            break;

            //                case 1:
            //            Label lbls = (Label)r.Cells[0].FindControl("lblweekname");
            //            lbls.Text = "Tuesday";
            //            break;
            //                case 2:
            //            Label lbl2 = (Label)r.Cells[0].FindControl("lblweekname");
            //            lbl2.Text = "Wednesday";
            //            break;
            //                case 3:
            //            Label lbl3 = (Label)r.Cells[0].FindControl("lblweekname");
            //            lbl3.Text = "Thursday";
            //            break;
            //                case 4:
            //            Label lbl4 = (Label)r.Cells[0].FindControl("lblweekname");
            //            lbl4.Text = "Friday";
            //            break;
            //                case 5:
            //            Label lbl5 = (Label)r.Cells[0].FindControl("lblweekname");
            //            lbl5.Text = "Saturday";
            //            break;
            //                case 6:
            //            Label lbl6 = (Label)r.Cells[0].FindControl("lblweekname");
            //            lbl6.Text = "Sunday";
            //            break;
            //                case 7:
            //            Label lbl7 = (Label)r.Cells[0].FindControl("lblweekname");
            //            lbl7.Text = "Average";
            //            break;
            //                default:
            //                    break;

            //            }
            //            count++;


        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label txt = new Label();
            txt.Text = "Average";
            e.Row.Cells[1].Controls.Add(txt);


            Label lb = (Label)e.Row.FindControl("lblTotalsleep");
            lb.Text = Convert.ToDouble(valsleep).ToString();
            Label lbstres = (Label)e.Row.FindControl("lblTotalstress");
            lbstres.Text = Convert.ToDouble(valstres).ToString();


        }
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblslep = (Label)e.Row.FindControl("lblslep");
            int sl = int.Parse(lblslep.Text);
            if (lblslep.Text == "-1")
            {
                sl = 0;
            }
            totalsleep += sl;
            totalItems += 1;
            //valsleep = (totalsleep / totalItems).ToString();
            valsleep = Math.Round(Convert.ToDouble(totalsleep) / totalItems, 3);

            Label lblstrs = (Label)e.Row.FindControl("lblstres");
            int st = int.Parse(lblstrs.Text);
            if (lblstrs.Text == "-1")
            {
                st = 0;
            }
            totalstrss += st;
            totalstrItems += 1;
            valstres = Math.Round(Convert.ToDouble(totalstrss) / totalstrItems, 3);


        }

    }
}