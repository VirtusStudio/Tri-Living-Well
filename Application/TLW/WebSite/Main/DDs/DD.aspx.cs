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
        if (!AppLib.IsLoggedinSessionExists())
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/main_frame.aspx", true);

        #region Insert visited log details

        AppLib.InsertVisitedSectionDetails("Daily Dairy");

        #endregion


        objDDClass = new DDClass(objSqlConnClass.OpenConnection());

        gsUserID = Membership.GetUser().ProviderUserKey.ToString();

        if (IsPostBack)
        {/*
            if (Request.QueryString["date"] != null)
            {
                gsDate = Request.QueryString["date"].ToString();
            }
        }
        else
        {*/
            gsDate = ViewState["gsDate"].ToString();
        }

        
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
         fillOutForm();

        ViewState["gsDate"] = gsDate;
        objSqlConnClass.CloseConnection();
    }

    private void fillOutForm()
    {
        try
        {
            fillOutInformation();
        }
        catch { }
    }

    private void fillOutInformation()
    { try
        {
        DataSet DS = new DataSet();
        DayOfWeek dwDay = DateTime.Now.DayOfWeek;
        DateTime dtCurrentDate;
        bool bSaturday = false;
        if (gsDate == "")
        {
            dtCurrentDate = DateTime.Now;
            txtPostback.Text = DateTime.Now.Date.ToString("MM/dd/yyyy");
        }
        else
        {
            dtCurrentDate = Convert.ToDateTime(gsDate);
            if(dtCurrentDate >= DateTime.Now)
            {
                dtCurrentDate = DateTime.Now;
            }
        }

        if (dtCurrentDate.DayOfWeek == DayOfWeek.Saturday)
        {
            dtCurrentDate = dtCurrentDate.AddDays(-1);
            bSaturday = true;
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

        /*Commented by Netsmartz for resolving compile time issues 
         * lblLVField_01Type.Text = DS.Tables[0].Rows[0]["ITEM_TEXT"].ToString();
        lblLVField_02Type.Text = DS.Tables[0].Rows[1]["ITEM_TEXT"].ToString();
        lblLVField_03Type.Text = DS.Tables[0].Rows[2]["ITEM_TEXT"].ToString();
        lblLVField_04Type.Text = DS.Tables[0].Rows[3]["ITEM_TEXT"].ToString();
        lblLVField_05Type.Text = DS.Tables[0].Rows[4]["ITEM_TEXT"].ToString();*/

        


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
                ((Label)FindControl("lbl" + dtCurrentDate.DayOfWeek.ToString())).Text = "<a href=\"javascript:addEntry('" + dtCurrentDate.Date.ToString("MM/dd/yyyy") + "');\">" + dtCurrentDate.DayOfWeek.ToString() + "<br /><span class='small'>(" + dtCurrentDate.Date.ToString("MM/dd/yy") + ")</span></a>";

               
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

                ((Label)FindControl("lbl" + dtCurrentDate.DayOfWeek.ToString())).Text = "<a href=\"javascript:editEntry('" + DS.Tables[0].Rows[0]["DD_ENTRY_ID"].ToString() + "' , '" + dtCurrentDate.Date.ToString("MM/dd/yyyy") + "');\">" + dtCurrentDate.DayOfWeek.ToString() + "<br /><span class='small'>(" + dtCurrentDate.Date.ToString("MM/dd/yy") + ")</span></a>";

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
            ((Label)FindControl("lbl" + dtCurrentDate.DayOfWeek.ToString())).Text =  "<span class='small'>" + dtCurrentDate.DayOfWeek.ToString() + "<br />(" + dtCurrentDate.Date.ToString("MM/dd/yy") + ")</span>";

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

        if (!IsPostBack)
        {
            RadCalendar1.SelectedDate = DateTime.Now;
        }
        }
    catch { }
    }
    private void Page_PreInit(object sender, EventArgs e)
    {
        if (!AppLib.IsLoggedinSessionExists())
            this.MasterPageFile = "~/MasterPages/TLWSite.master";
        else
        {
           
                this.MasterPageFile = "~/MasterPages/User.master";
           
        }
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        DateTime DT = Convert.ToDateTime(txtPostback.Text);
        RadCalendar1.SelectedDate = DT;
        if (DT > DateTime.Now)
        {
            RadCalendar1.SelectedDate = DateTime.Now;
            txtPostback.Text = DateTime.Now.Date.ToString("MM/dd/yyyy");
        }
        RadCalendar1.FocusedDate = RadCalendar1.SelectedDate;

        while (DT.DayOfWeek != DayOfWeek.Saturday)
        {
            DT = DT.AddDays(1);
        }
        gsDate = DT.ToString("MM/dd/yyyy");
        fillOutInformation();

    }
 

}
