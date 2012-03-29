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

public partial class UC_Visitlog_Visitlog : System.Web.UI.UserControl
{
    SqlConnClass objSqlConn = new SqlConnClass();
    VisitlogClass objVisitlogClass;
    AccountClass objAccountClass;
    
    string gsUserName = "";
    bool IsUserLoggedOn = false;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        objVisitlogClass = new VisitlogClass(objSqlConn.OpenConnection());
        objAccountClass = new AccountClass(objSqlConn.sqlConnection);

        if (Membership.GetUser() != null)
        {
            IsUserLoggedOn = true;
            gsUserName = Membership.GetUser().UserName;
            //Response.Write(">> " + gsUserName + "<BR>");
        }

        if (!IsPostBack)
        {
            checkVariables();
        }
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        objSqlConn.CloseConnection();
    }

    private void checkVariables()
    {
        try
        {
            if (gsUserName == "")
            {
                if (Membership.GetUser() != null)
                {
                    gsUserName = Membership.GetUser().UserName;
                    //Response.Write(" set >> " + gsUserName + "<BR>");
                }
            }

            objVisitlogClass = new VisitlogClass(objSqlConn.OpenConnection());

            if (Session["VISIT_ID"] == null)
            {
                Session["VISIT_ID"] = objVisitlogClass.INSERT_Visitlog(Request.ServerVariables.Get("HTTP_USER_AGENT"), Request.ServerVariables.Get("REMOTE_ADDR"));
            }

            if (Session["ACCOUNT_ID"] == null && IsUserLoggedOn)
            {/*checking that wheather the account is existing for logged user or not */
                try
                {
                    string sUserID = Membership.GetUser().ProviderUserKey.ToString();
                    DataSet DS = objAccountClass.Act_GET_Accounts_BY_UserId(sUserID);
                    if (DS.Tables[0].Rows.Count > 0)/*Added by Netsmartz */
                    {
                        Session["ACCOUNT_ID"] = DS.Tables[0].Rows[0]["ACCOUNT_ID"].ToString();
                        Session["USER_TYPE_ID"] = DS.Tables[0].Rows[0]["USER_TYPE_ID"].ToString();
                    }
                }
                catch (Exception ex)
                {//they aren't tied to an accout.
                    FormsAuthentication.SignOut();// LOG USER OUT PROGRAMMATICALLY
                }
            }



        }
        catch (Exception ex)
        {
            //Response.Write("checkvariables() : " + ex.Message);
        } 
    }

    public void addEntry(int A,int B,int C, int D, string primary, string secondary, string comment)
    {
        checkVariables();

        try
        {
            //Response.Write("visit log - addEntry() <BR>");
            //Response.Write("visit log - addEntry() - user = " + gsUserName + " <BR>");

            objVisitlogClass.INSERT_VisitlogAction(Session["VISIT_ID"].ToString(), gsUserName, A, B, C, D, primary, secondary, comment);
        }
        catch (Exception ex)
        {
            Response.Write("addEntry() : " + ex.Message);
        } 
    }

    public string VISIT_ID
    {
        get
        {
            checkVariables();
            return Session["VISIT_ID"].ToString();
        }
    }

    public string ACCOUNT_ID
    {
        get
        {
            checkVariables();
            return Session["ACCOUNT_ID"].ToString();
        }
    }
    public string USER_TYPE_ID
    {
        get
        {
            checkVariables();
            return Session["USER_TYPE_ID"].ToString();
        }
    }

}