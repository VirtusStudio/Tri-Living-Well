using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public class SqlConnClass
{
    System.Data.SqlClient.SqlConnection sqlConn;

    bool debug;

    public SqlConnClass()
    {
        try
        {
            string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlServer"].ToString();
            sqlConn = new SqlConnection(ConnectionString);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
    }

    public SqlConnection sqlConnection
    {
        get
        {
            return sqlConn;
        }
        set
        {

        }
    }

    public SqlConnection OpenConnection()
    {
        try
        {
            sqlConn.Open();
        }
        catch (Exception ex)
        {
            if (debug) HttpContext.Current.Response.Write(ex.Message);
        }

        return sqlConn;
    }

    public bool CloseConnection()
    {
        try
        {
            sqlConn.Close();
            return true;
        }
        catch (Exception ex)
        {
            if (debug) HttpContext.Current.Response.Write(ex.Message);
            return false;
        }
    }

    public string SQLstats()
    {
        string str;
        
        str = "";
        
        Hashtable stats =  (Hashtable) sqlConn.RetrieveStatistics();

        foreach (DictionaryEntry item in stats)
        {
            str += (string)item.Key + " = " + (string)item.Value.ToString() + "<br />";
        }

        return str;        
    }

    private DataSet Lst_GET_ListTabs(string sListName)
    {
        DataSet MyDataSet = new DataSet();
        try
        {
            SqlCommand MyCommand = new SqlCommand();
            MyCommand.Connection = sqlConn;

            MyCommand.CommandType = CommandType.StoredProcedure;
            MyCommand.CommandText = "spLst_GET_ListTabs";

            MyCommand.Parameters.AddWithValue("@LIST_NAME", sListName);

            SqlDataAdapter MyDataAdapter = new SqlDataAdapter(MyCommand);
            MyDataAdapter.Fill(MyDataSet);
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
        }
        return MyDataSet;
    }

    public Telerik.Web.UI.RadTabStrip fillTabs(Telerik.Web.UI.RadTabStrip RadTabStrip1, string sListName)
    {
        foreach (DataRow DR in Lst_GET_ListTabs(sListName).Tables[0].Rows)
        {
            Telerik.Web.UI.RadTab tab = new Telerik.Web.UI.RadTab(DR["TEXT"].ToString(), DR["VALUE"].ToString());
            RadTabStrip1.Tabs.Add(tab);

            /*
            Telerik.Web.UI.RadTab tab = new Telerik.Web.UI.RadTab();

            tab.Text = DR["TEXT"].ToString();
            tab.NavigateUrl = DR["VALUE"].ToString();
            tab.Target = "TAB_IFRAME_CONTENT";

            RadTabStrip1.Tabs.Add(tab);
            */

            tab.Enabled = false;
            if (DR["ENABLED_FLG"].ToString() == "1")
            {
                tab.Enabled = true;
            }

            tab.Visible = false;
            if (DR["VISIBLE_FLG"].ToString() == "1")
            {
                tab.Visible = true;
            }

            if (!tab.Enabled || !tab.Visible)
            {
                foreach (string sRoleName in DR["ROLES"].ToString().Split(','))
                {
                    if (sRoleName != "" && Roles.IsUserInRole(sRoleName.Trim()))
                    {
                        tab.Enabled = true;
                        tab.Visible = true;
                        break;
                    }
                }
            }
            if (!tab.Enabled || !tab.Visible)
            {
                foreach (string sUserName in DR["USERNAMES"].ToString().Split(','))
                {
                    if (sUserName != "" && sUserName.Trim().ToLower() == Membership.GetUser().UserName.ToLower())
                    {
                        tab.Enabled = true;
                        tab.Visible = true;
                        break;
                    }
                }
            }
            if (tab.Enabled && tab.Visible)
            {
                if (DR["SELECTED_FLG"].ToString() == "1")
                {
                    tab.Selected = true;
                }
            }
        }
        return RadTabStrip1;
    }
    
    public DropDownList fillDropDown(DropDownList DropDownList1, string sListName, string sTableName)
    {
        BackofficeClass objBackofficeClass = new BackofficeClass(sqlConn);

        DropDownList1.DataSource = objBackofficeClass.GET_Items_AnyItemTable(sListName, sTableName);
        DropDownList1.DataTextField = "ITEM_TEXT";
        DropDownList1.DataValueField = "ITEM_VALUE";
        DropDownList1.DataBind();

        return DropDownList1;
    }
}