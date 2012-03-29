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
    PALClass objPalClass;

    string gsUserID = "";
    string gsDate = "";

    protected void Page_Load(object sender, EventArgs e)
    {

        objDDClass = new DDClass(objSqlConnClass.OpenConnection());
        objPalClass = new PALClass(objSqlConnClass.OpenConnection());

        gsUserID = Membership.GetUser().ProviderUserKey.ToString();

        if (!IsPostBack)
        {

        }

        
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        fillOutForm();
      
        objSqlConnClass.CloseConnection();
    }

    private void fillOutForm()
    {
        fillOutInformation();
    }

    private void fillOutInformation()
    {
        DataSet DS = new DataSet();
      
    }



    protected void btnSubmitPersonalMessage_Click(object sender, EventArgs e)
    {

    }

    /*Following function is added by Netsmartz for adding the css path at runtime*/
    protected override void OnInit(EventArgs e)
    {

        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Main.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound1.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Table.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Grid.css\" />"));
        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/centerRound2.css\" />"));
        

        base.OnInit(e);

    }

}
