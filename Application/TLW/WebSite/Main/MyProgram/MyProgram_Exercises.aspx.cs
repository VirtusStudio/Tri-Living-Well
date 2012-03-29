using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.IO;
using Telerik.Web.UI;

public partial class MyProgram_Exercises : System.Web.UI.Page
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    ProgramClass objProgramClass;
    PALClass objPalClass;

    string gsLayout1 = "", gsLayout2 = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!AppLib.IsLoggedinSessionExists())
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/main_frame.aspx", true);


        objPalClass = new PALClass(objSqlConnClass.OpenConnection());
        objProgramClass = new ProgramClass(objSqlConnClass.sqlConnection);
       
        #region Insert visited log details

        AppLib.InsertVisitedSectionDetails("View Exercise Details");

        #endregion
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //StreamReader SR1 = new StreamReader(Server.MapPath("/HTML_Templates/MyProgram_Exercises_1.html"));/*Commented by Netsmartz*/
            StreamReader SR1 = new StreamReader(Server.MapPath("../../HTML_Templates/MyProgram_Exercises_1.html"));
            gsLayout1 = SR1.ReadToEnd();
            SR1.Close();

            //StreamReader SR2 = new StreamReader(Server.MapPath("/HTML_Templates/MyProgram_Exercises_2.html"));/*Commented by Netsmartz*/
            StreamReader SR2 = new StreamReader(Server.MapPath("../../HTML_Templates/MyProgram_Exercises_2.html"));
            gsLayout2 = SR2.ReadToEnd();
            SR2.Close();

            initForm();
        }
        objSqlConnClass.CloseConnection();
    }

    private void initForm()
    {
        if (Request.QueryString["programSeries"] != null)
        {
            string sProgramSeries = Request.QueryString["programSeries"];

            string sUserID = Membership.GetUser().ProviderUserKey.ToString();
            DataSet DS = objPalClass.PAL_GET_PalStarts(sUserID, "1", "0");
            if (DS.Tables[0].Rows.Count > 0)
            {
                string sProgramID = DS.Tables[0].Rows[0]["PROGRAM_ID"].ToString();
                if ((Convert.ToInt32(sProgramID) / 100 * 100).ToString() == sProgramSeries)//changes 801 to 800
                {
                    //note: the HeaderText must be changed before binding the grid. As a bind would use the hardcoded value
                    RadGrid1.Columns.FindByUniqueName("tcCustom").HeaderText += " - " + DS.Tables[0].Rows[0]["PROGRAM_NAME"].ToString();
                    fillGrids(sProgramSeries);
                }
            }
            else//show them a sample... which i guess is everything from the querystring
            {
                fillGrids(sProgramSeries);
            }
        }
    }

    private void fillGrids(string sProgramSeries)
    {
        DataSet DS = objProgramClass.Prg_GET_ProgramsExercises_BY_ProgramSeries(sProgramSeries);

        RadGrid1.DataSource = DS;
        RadGrid1.DataBind();

        RadGrid2.DataSource = DS;
        RadGrid2.DataBind();
    }

    protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        if (e.Item is GridDataItem)
        {
            try
            {
                Label lbl = new Label();
                lbl.Text = gsLayout1;//Choose the appropriate layout

                lbl.Text = lbl.Text.Replace("#EXERCISE_ID#", (e.Item as GridDataItem)["EXERCISE_ID"].Text);
                lbl.Text = lbl.Text.Replace("#NAME#", (e.Item as GridDataItem)["NAME"].Text);
                lbl.Text = lbl.Text.Replace("#IMAGE1#", (e.Item as GridDataItem)["IMAGE1"].Text);
                lbl.Text = lbl.Text.Replace("#IMAGE2#", (e.Item as GridDataItem)["IMAGE2"].Text);
                lbl.Text = lbl.Text.Replace("#HTML_TEXT#", (e.Item as GridDataItem)["HTML_TEXT"].Text);

                (e.Item as GridDataItem)["tcCustom"].Controls.Add(lbl);
            }
            catch { }
        }
    }

    protected void RadGrid2_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        if (e.Item is GridDataItem)
        {
            try
            {
                Label lbl = new Label();
                lbl.Text = gsLayout2;//Choose the appropriate layout

                lbl.Text = lbl.Text.Replace("#EXERCISE_ID#", (e.Item as GridDataItem)["EXERCISE_ID"].Text);
                lbl.Text = lbl.Text.Replace("#NAME#", (e.Item as GridDataItem)["NAME"].Text);
                lbl.Text = lbl.Text.Replace("#IMAGE1#", (e.Item as GridDataItem)["IMAGE1"].Text);
                lbl.Text = lbl.Text.Replace("#IMAGE2#", (e.Item as GridDataItem)["IMAGE2"].Text);
                lbl.Text = lbl.Text.Replace("#HTML_TEXT#", (e.Item as GridDataItem)["HTML_TEXT"].Text);

                (e.Item as GridDataItem)["tcCustom"].Controls.Add(lbl);
            }
            catch { }
        }
    }

    /*Following function is added by Netsmartz for adding the css path at runtime*/
    protected override void OnInit(EventArgs e)
    {

        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Main.css\" />"));
        base.OnInit(e);

    }

}
