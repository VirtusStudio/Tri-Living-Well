using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;


	/// <summary>
	/// Summary description for captchajpgimg.
	/// </summary>
	public partial class captchajpgimg : System.Web.UI.Page
	{
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if(Session["CaptchaImageText"]==null) return;
			
			// Create a CAPTCHA image using the text stored in the Session object.
            aspnetforum.CaptchaImage ci = new aspnetforum.CaptchaImage(this.Session["CaptchaImageText"].ToString(), 200, 50, "Century Schoolbook");

			// Change the response headers to output a JPEG image.
			this.Response.Clear();
			this.Response.ContentType = "image/jpeg";

			// Write the image to the response stream in JPEG format.
			ci.Image.Save(this.Response.OutputStream, ImageFormat.Jpeg);

			// Dispose of the CAPTCHA image object.
			ci.Dispose();
		}
	}
