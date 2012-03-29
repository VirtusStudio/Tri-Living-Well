using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using aspNetEmail;
using System.Collections;

public class bgtString
{
    string gsString = "";

    public bgtString(string s)
    {
        gsString = s;
    }

    public string ToHTML()
    {
        return gsString.Replace("<", "&lt;").Replace(">", "&gt;").Replace("\r\n", "<br />").Replace("  ", "&nbsp;&nbsp;");
    }

    public string ToString()
    {
        return gsString.ToString();
    }

    

}