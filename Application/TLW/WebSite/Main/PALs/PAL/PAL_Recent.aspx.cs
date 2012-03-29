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
    PALClass objPALClass;

    string gsUserID = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = string.Empty;
        if (!IsPostBack)
        {
            if (Request.QueryString["iddel"] != null)
            {
                lblMsg.Text = "Log has been deleted successfully.";
            }
        }

        objPALClass = new PALClass(objSqlConnClass.OpenConnection());
        // if (!AppLib.IsLoggedinSessionExists())

        gsUserID = Membership.GetUser().ProviderUserKey.ToString();
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        //if (!AppLib.IsLoggedinSessionExists())
        fillOutForm();

        objSqlConnClass.CloseConnection();
    }

    private void fillOutForm()
    {
        fillOutInformation();
    }

    private void fillOutInformation()
    {
        DataSet DS = objPALClass.PAL_GET_PalEntries_BY_UserId(gsUserID, "", "");
        int iRowCount = DS.Tables[0].Rows.Count;
        for (int i = 1; i <= 10; i++)//foreach UC_PAL_EntryView
        {
            UC_PAL_EntryView UC = (UC_PAL_EntryView)FindControl("UC_PAL_EntryView" + (i).ToString());

            if (i <= iRowCount)
            {
                UC.populate(DS.Tables[0].Rows[i - 1]);
                UC.Visible = true;
            }
            else
            {
                UC.Visible = false;
            }
        }
    }
    /*Following function is added by Netsmartz for adding the css path at runtime*/
    protected override void OnInit(EventArgs e)
    {

        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Main.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Table.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Grid.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound1.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound2.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound3.css\" />"));
        base.OnInit(e);

    }

}
