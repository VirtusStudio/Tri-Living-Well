using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TestDevice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write(Context.Request.Browser.MobileDeviceModel);
        if (Context.Request.Browser.IsMobileDevice)
        {
            Response.Write("Opened From Mobile");
        }
        else
        {
            Response.Write("Not Opened From Mobile");
        }
    }
}