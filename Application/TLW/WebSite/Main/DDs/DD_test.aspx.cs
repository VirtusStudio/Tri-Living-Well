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

public partial class PAL_Recent : System.Web.UI.Page
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    DDClass objDDClass;

    string gsUserID = "";
    string gsDate = "";

    protected void Page_Load(object sender, EventArgs e)
    {
       
objDDClass = new DDClass(objSqlConnClass.OpenConnection());

        gsUserID = Membership.GetUser().ProviderUserKey.ToString();

        if (!IsPostBack)
        {
            if (Request.QueryString["date"] != null)
            {
                gsDate = Request.QueryString["date"].ToString();
            }
        }
        else
        {
            gsDate = ViewState["gsDate"].ToString();
        }

        
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        fillOutForm();
       // Response.Write("gsDate: " + gsDate + ":::");

        ViewState["gsDate"] = gsDate;
        objSqlConnClass.CloseConnection();
    }

    private void fillOutForm()
    {
        fillOutInformation();
	//Response.Redirect("/mikey.html"); 
    }

    private void fillOutInformation()
    {
        DataSet DS = new DataSet();
        DayOfWeek dwDay = DateTime.Now.DayOfWeek;
        DateTime dtCurrentDate;
        bool bSaturday = false;
        if (gsDate == "")
        {
            dtCurrentDate = DateTime.Now;
        }
        else
        {
            dtCurrentDate = Convert.ToDateTime(gsDate);
            if(dtCurrentDate > DateTime.Now)
            {
                dtCurrentDate = DateTime.Now;
            }

        }

        //
        if (dtCurrentDate.DayOfWeek == DayOfWeek.Saturday)
        {
            dtCurrentDate = dtCurrentDate.AddDays(-1);
            bSaturday = true;
        }

        while (dtCurrentDate.DayOfWeek != DayOfWeek.Saturday)
        {
            if (bSaturday)
            {
                dtCurrentDate = dtCurrentDate.AddDays(1);
                bSaturday = false;
            }

            DS = objDDClass.DD_GET_DdEntries_BY_UserId(gsUserID, dtCurrentDate.Date.ToString(), dtCurrentDate.Date.ToString());
            if (DS.Tables[0].Rows.Count == 0)
            {
                ((Label)FindControl("lbl" + dtCurrentDate.DayOfWeek.ToString())).Text = "<a href=\"javascript:addEntry('" + dtCurrentDate.Date.ToString("MM/dd/yyyy") + "');\">" + dtCurrentDate.DayOfWeek.ToString() + "<br />(" + dtCurrentDate.Date.ToString("MM/dd/yy") + ")</a>";

               
                ((Label)FindControl("lblField_01" + dtCurrentDate.DayOfWeek.ToString())).Text = "0";
                ((Label)FindControl("lblField_02" + dtCurrentDate.DayOfWeek.ToString())).Text = "0";
                ((Label)FindControl("lblField_03" + dtCurrentDate.DayOfWeek.ToString())).Text = "0";
                ((Label)FindControl("lblField_04" + dtCurrentDate.DayOfWeek.ToString())).Text = "0";
                ((Label)FindControl("lblField_05" + dtCurrentDate.DayOfWeek.ToString())).Text = "0";
                ((Label)FindControl("lblField_06" + dtCurrentDate.DayOfWeek.ToString())).Text = "0";
                ((Label)FindControl("lblField_07" + dtCurrentDate.DayOfWeek.ToString())).Text = "0";
                ((Label)FindControl("lblField_08" + dtCurrentDate.DayOfWeek.ToString())).Text = "0";
                ((Label)FindControl("lblField_09" + dtCurrentDate.DayOfWeek.ToString())).Text = "0";
                ((Label)FindControl("lblField_10" + dtCurrentDate.DayOfWeek.ToString())).Text = "0";
                ((Label)FindControl("lblField_11" + dtCurrentDate.DayOfWeek.ToString())).Text = "0";
                ((Label)FindControl("lblField_12" + dtCurrentDate.DayOfWeek.ToString())).Text = "0";
            }
            else//There is a record for dtCurrentDate
            {

                ((Label)FindControl("lbl" + dtCurrentDate.DayOfWeek.ToString())).Text = "<a href=\"javascript:editEntry('" + DS.Tables[0].Rows[0]["DD_ENTRY_ID"].ToString() + "' , '" + dtCurrentDate.Date.ToString("MM/dd/yyyy") + "');\">" + dtCurrentDate.DayOfWeek.ToString() + "<br />(" + dtCurrentDate.Date.ToString("MM/dd/yy") + ")</a>";

                ((Label)FindControl("lblField_01" + dtCurrentDate.DayOfWeek.ToString())).Text = DS.Tables[0].Rows[0]["TOTAL_FIELD_01"].ToString();
                ((Label)FindControl("lblField_02" + dtCurrentDate.DayOfWeek.ToString())).Text = DS.Tables[0].Rows[0]["TOTAL_FIELD_02"].ToString();
                ((Label)FindControl("lblField_03" + dtCurrentDate.DayOfWeek.ToString())).Text = DS.Tables[0].Rows[0]["TOTAL_FIELD_03"].ToString();
                ((Label)FindControl("lblField_04" + dtCurrentDate.DayOfWeek.ToString())).Text = DS.Tables[0].Rows[0]["TOTAL_FIELD_04"].ToString();
                ((Label)FindControl("lblField_05" + dtCurrentDate.DayOfWeek.ToString())).Text = DS.Tables[0].Rows[0]["TOTAL_FIELD_05"].ToString();
                ((Label)FindControl("lblField_06" + dtCurrentDate.DayOfWeek.ToString())).Text = DS.Tables[0].Rows[0]["TOTAL_FIELD_06"].ToString();
                ((Label)FindControl("lblField_07" + dtCurrentDate.DayOfWeek.ToString())).Text = DS.Tables[0].Rows[0]["TOTAL_FIELD_07"].ToString();

                ((Label)FindControl("lblField_08" + dtCurrentDate.DayOfWeek.ToString())).Text = DS.Tables[0].Rows[0]["LV_FIELD_01"].ToString();
                ((Label)FindControl("lblField_09" + dtCurrentDate.DayOfWeek.ToString())).Text = DS.Tables[0].Rows[0]["LV_FIELD_02"].ToString();
                ((Label)FindControl("lblField_10" + dtCurrentDate.DayOfWeek.ToString())).Text = DS.Tables[0].Rows[0]["LV_FIELD_03"].ToString();
                ((Label)FindControl("lblField_11" + dtCurrentDate.DayOfWeek.ToString())).Text = DS.Tables[0].Rows[0]["LV_FIELD_04"].ToString();
                ((Label)FindControl("lblField_12" + dtCurrentDate.DayOfWeek.ToString())).Text = DS.Tables[0].Rows[0]["LV_FIELD_05"].ToString();
            }

             

            dtCurrentDate = dtCurrentDate.AddDays(-1);
        }
        //////////////////////////Setting the display for the forward and backwards buttons////////////////
        lblWeekBack.Text = "<a  href=\"javascript:ViewWeek('" + dtCurrentDate.Date.ToString("MM/dd/yyyy") + "','Back');\"><img src=\""+AppConfig.GetBaseSiteUrl()+"Images/icons/iconBack.gif\" /></a>";
        if (dtCurrentDate.AddDays(14) < DateTime.Now)
        {
            lblWeekForward.Text = "<a  href=\"javascript:ViewWeek('" + dtCurrentDate.AddDays(14).Date.ToString("MM/dd/yyyy") + "','Forward');\"><img src=\"" + AppConfig.GetBaseSiteUrl() + "Images/icons/iconForward.gif\" /></a>";
        }
        else
        {
            lblWeekForward.Text = "<a  href=\"javascript:ViewWeek('" + DateTime.Now.Date.ToString("MM/dd/yyyy") + "','Forward');\"><img src=\"" + AppConfig.GetBaseSiteUrl() + "Images/icons/iconForward.gif\" /></a>";
        }
        //////////////////////////Setting the display for the forward and backwards buttons////////////////
       

        ///////This is for future days
        if (gsDate == "")
        {
            dtCurrentDate = DateTime.Now.AddDays(1);
        }
        else
        {
            dtCurrentDate = Convert.ToDateTime(gsDate).AddDays(1);
            if (dtCurrentDate > DateTime.Now)
            {
                dtCurrentDate = DateTime.Now.AddDays(1);
            }
        }

        while (dtCurrentDate.DayOfWeek != DayOfWeek.Sunday)
        {
            ((Label)FindControl("lbl" + dtCurrentDate.DayOfWeek.ToString())).Text =  dtCurrentDate.DayOfWeek.ToString() + "<br />(" + dtCurrentDate.Date.ToString("MM/dd/yy") + ")";

            ((Label)FindControl("lblField_01" + dtCurrentDate.DayOfWeek.ToString())).Text = "0";
            ((Label)FindControl("lblField_02" + dtCurrentDate.DayOfWeek.ToString())).Text = "0";
            ((Label)FindControl("lblField_03" + dtCurrentDate.DayOfWeek.ToString())).Text = "0";
            ((Label)FindControl("lblField_04" + dtCurrentDate.DayOfWeek.ToString())).Text = "0";
            ((Label)FindControl("lblField_05" + dtCurrentDate.DayOfWeek.ToString())).Text = "0";
            ((Label)FindControl("lblField_06" + dtCurrentDate.DayOfWeek.ToString())).Text = "0";
            ((Label)FindControl("lblField_07" + dtCurrentDate.DayOfWeek.ToString())).Text = "0";

            ((Label)FindControl("lblField_08" + dtCurrentDate.DayOfWeek.ToString())).Text = "0";
            ((Label)FindControl("lblField_09" + dtCurrentDate.DayOfWeek.ToString())).Text = "0";
            ((Label)FindControl("lblField_10" + dtCurrentDate.DayOfWeek.ToString())).Text = "0";
            ((Label)FindControl("lblField_11" + dtCurrentDate.DayOfWeek.ToString())).Text = "0";
            ((Label)FindControl("lblField_12" + dtCurrentDate.DayOfWeek.ToString())).Text = "0";
           
            

            dtCurrentDate = dtCurrentDate.AddDays(1);
        }


        DS = objDDClass.GET_Items_AnyItemTable("Type", "LIST_DD");
        lblField_01Type.Text = DS.Tables[0].Rows[0]["ITEM_TEXT"].ToString();
        lblField_02Type.Text = DS.Tables[0].Rows[1]["ITEM_TEXT"].ToString();
        lblField_03Type.Text = DS.Tables[0].Rows[2]["ITEM_TEXT"].ToString();
        lblField_04Type.Text = DS.Tables[0].Rows[3]["ITEM_TEXT"].ToString();
        lblField_05Type.Text = DS.Tables[0].Rows[4]["ITEM_TEXT"].ToString();
        lblField_06Type.Text = DS.Tables[0].Rows[5]["ITEM_TEXT"].ToString();
        lblField_07Type.Text = DS.Tables[0].Rows[6]["ITEM_TEXT"].ToString();

        
        DS = objDDClass.GET_Items_AnyItemTable("LVType", "LIST_DD");
        lblField_08Type.Text = DS.Tables[0].Rows[0]["ITEM_TEXT"].ToString();
        lblField_09Type.Text = DS.Tables[0].Rows[1]["ITEM_TEXT"].ToString();
        lblField_10Type.Text = DS.Tables[0].Rows[2]["ITEM_TEXT"].ToString();
        lblField_11Type.Text = DS.Tables[0].Rows[3]["ITEM_TEXT"].ToString();
        lblField_12Type.Text = DS.Tables[0].Rows[4]["ITEM_TEXT"].ToString();


        if (!IsPostBack)
        {

            RadCalendar1.SelectedDate = DateTime.Now;
            lblWeekForward.Text = "<a  href=\"javascript:ViewWeek('" + dtCurrentDate.AddDays(14).Date.ToString("MM/dd/yyyy") + "','Forward');\"><img src=\"" + AppConfig.GetBaseSiteUrl() + "Images/icons/iconForward.gif\" /></a>";
            lblWeekBack.Text = "<a  href=\"javascript:ViewWeek('" + dtCurrentDate.Date.ToString("MM/dd/yyyy") + "','Back');\"><img src=\"" + AppConfig.GetBaseSiteUrl() + "Images/icons/iconBack.gif\" /></a>";

        }

    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        DateTime DT = Convert.ToDateTime(txtPostback.Text);

        if (txtBackDate.Text == "True")
        {
            RadCalendar1.SelectedDate = RadCalendar1.SelectedDate.AddDays(-7);
            RadCalendar1.FocusedDate = RadCalendar1.SelectedDate;
        }
        else if (txtForwardDate.Text == "True")
        {
            RadCalendar1.SelectedDate = RadCalendar1.SelectedDate.AddDays(7);
            RadCalendar1.FocusedDate = RadCalendar1.SelectedDate;
        }
        else
        {
            RadCalendar1.SelectedDate = DT;
            RadCalendar1.FocusedDate = DT;
        }
        
        if (DT > DateTime.Now)
        {
            RadCalendar1.SelectedDate = DateTime.Now;
        }

        while (DT.DayOfWeek != DayOfWeek.Saturday)
        {
            DT = DT.AddDays(1);
        }
        gsDate = DT.ToString("MM/dd/yyyy");
        fillOutInformation();



    }


    /*Following function is added by Netsmartz for adding the css path at runtime*/
    protected override void OnInit(EventArgs e)
    {

        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Main.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound1.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Table.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Grid.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound2.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound3.css\" />"));

        base.OnInit(e);

    }



}
