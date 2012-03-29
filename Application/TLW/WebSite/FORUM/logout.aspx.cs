using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;


	/// <summary>
	/// Summary description for logout.
	/// </summary>
    public partial class logout : aspnetforum.ForumPage
	{
		protected void Page_Load(object sender, System.EventArgs e)
		{
			Session["aspnetforumUserID"]=null;
			Session["aspnetforumUserName"]=null;

			//clear "remember me" cookies
			HttpCookie cookieUID = new HttpCookie("aspnetforumUID", "");
			cookieUID.Expires = DateTime.Now.AddYears(-1); //expires = negative value
			HttpCookie cookiePSW = new HttpCookie("aspnetforumPSW", "");
			cookiePSW.Expires = DateTime.Now.AddYears(-1); //expires = negative value
			Response.Cookies.Add(cookieUID);
			Response.Cookies.Add(cookiePSW);

			Response.Redirect("default.aspx");
		}
	}
