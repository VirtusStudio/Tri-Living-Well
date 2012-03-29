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

public partial class PAL_TABS : System.Web.UI.Page
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    PALClass objPalClass;

    protected void Page_Load(object sender, EventArgs e)
    {
        objPalClass = new PALClass(objSqlConnClass.OpenConnection());
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!AppLib.IsLoggedinSessionExists())
            Response.Redirect(AppConfig.GetBaseSiteUrl() + "Welcome/main_frame.aspx", true);


        if (!IsPostBack)
        {
            fillOutForm();
        }

        objSqlConnClass.CloseConnection();


        #region Insert visited log details

        AppLib.InsertVisitedSectionDetails("Personal Activity Log");

        #endregion
    }

    private void fillOutForm()
    {
        RadTabStrip1 = objSqlConnClass.fillTabs(RadTabStrip1, "PAL");
        
        DataSet DS = objPalClass.PAL_GET_PalStarts(Membership.GetUser().ProviderUserKey.ToString(), "1", "0");
        if (DS.Tables[0].Rows.Count > 0 )
        {
            string sProgramID = DS.Tables[0].Rows[0]["PROGRAM_ID"].ToString();
            string sProgramNumber = (Convert.ToInt32(sProgramID) / 100).ToString();

            /*lblProgramForum.Text = "<a href='/FORUM/topics.aspx?ForumID=" + DS.Tables[0].Rows[0]["FORUM_PROGRAM_ID"].ToString() + "'><img src='/Images/icons/iconProgram" + sProgramNumber + ".jpg' /> " + DS.Tables[0].Rows[0]["PROGRAM_NAME"].ToString() + " Forum</a>";
            lblEmailCoach.Text = "<a href='/FORUM/addprivatemsg.aspx?ToUserID=" + DS.Tables[0].Rows[0]["COACH_ID"].ToString() + "'><img src='/Images/icons/iconEmail.gif' /> Private Message Coach</a>";*/
            // above lines are commented by Netsmartz
            lblProgramForum.Text = "<a href='"+AppConfig.GetBaseSiteUrl()+"FORUM/topics.aspx?ForumID=" + DS.Tables[0].Rows[0]["FORUM_PROGRAM_ID"].ToString() + "'><img src='"+AppConfig.GetBaseSiteUrl()+"Images/icons/iconProgram" + sProgramNumber + ".jpg' /> " + DS.Tables[0].Rows[0]["PROGRAM_NAME"].ToString() + " Forum</a>";
            lblEmailCoach.Text = "<a href='"+AppConfig.GetBaseSiteUrl()+"FORUM/addprivatemsg.aspx?ToUserID=" + DS.Tables[0].Rows[0]["COACH_ID"].ToString() + "'><img src='"+AppConfig.GetBaseSiteUrl()+"Images/icons/iconEmail.gif' /> Private Message Coach</a>";
       }
    }

    /*Following function is added by Netsmartz for adding the css path at runtime*/
    protected override void OnInit(EventArgs e)
    {

        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Main.css\" />"));
        
        base.OnInit(e);

    }
}
