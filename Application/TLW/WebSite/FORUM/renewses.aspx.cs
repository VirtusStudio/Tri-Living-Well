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


    public partial class renewses : System.Web.UI.Page
    {
        byte[] gif = {0x47,0x49,0x46,0x38,0x39,0x61,0x01,0x00,0x01,0x00,0x91,0x00,0x00,0x00,0x00,
                    0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x21,0xf9,0x04,0x09,0x00,
                    0x00,0x00,0x00,0x2c,0x00,0x00,0x00,0x00,0x01,0x00,0x01,0x00,0x00,0x08,0x04,
                    0x00,0x01,0x04,0x04,0x00,0x3b,0x00};

        protected void Page_Init(object sender, EventArgs e)
        {
            Response.AddHeader("ContentType", "image/gif");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.BinaryWrite(gif);
            Response.End();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }