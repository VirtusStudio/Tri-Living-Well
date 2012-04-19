using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing.Text;
using System.Configuration;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Threading;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


using System.Resources;
using System.Web.Configuration;


using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Data.OleDb;


/// <summary>
/// Summary description for aspnetforum
/// </summary>
public class aspnetforum
{
    public aspnetforum()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public partial class AspNetForumMaster
    {

        /// <summary>
        /// ContentPlaceHolderHEAD control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.WebControls.ContentPlaceHolder ContentPlaceHolderHEAD;

        /// <summary>
        /// form1 control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.HtmlControls.HtmlForm form1;

        /// <summary>
        /// lblHome control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.WebControls.Label lblHome;

        /// <summary>
        /// lblRecentTopics control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.WebControls.Label lblRecentTopics;

        /// <summary>
        /// lblRecentPosts control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.WebControls.Label lblRecentPosts;

        /// <summary>
        /// lblSearch control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.WebControls.Label lblSearch;

        /// <summary>
        /// registerLink control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.HtmlControls.HtmlTableCell registerLink;

        /// <summary>
        /// lblRegister control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.WebControls.Label lblRegister;

        /// <summary>
        /// editProfileHeaderLink control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.HtmlControls.HtmlTableCell editProfileHeaderLink;

        /// <summary>
        /// lblProfile control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.WebControls.Label lblProfile;

        /// <summary>
        /// usersLink control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.HtmlControls.HtmlTableCell usersLink;

        /// <summary>
        /// lblUsers control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.WebControls.Label lblUsers;

        /// <summary>
        /// adminLink control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.HtmlControls.HtmlTableCell adminLink;

        /// <summary>
        /// lblAdmin control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.WebControls.Label lblAdmin;

        /// <summary>
        /// Th1 control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.HtmlControls.HtmlTableCell Th1;

        /// <summary>
        /// lblVersion control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.WebControls.Label lblVersion;

        /// <summary>
        /// titleLink control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.HtmlControls.HtmlAnchor titleLink;

        /// <summary>
        /// curuserTable control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.HtmlControls.HtmlTable curuserTable;

        /// <summary>
        /// lblLoggedIn control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.WebControls.Label lblLoggedIn;

        /// <summary>
        /// editProfileLink control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.HtmlControls.HtmlAnchor editProfileLink;

        /// <summary>
        /// logoutLink control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.HtmlControls.HtmlAnchor logoutLink;

        /// <summary>
        /// lblSignOut control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.WebControls.Label lblSignOut;

        /// <summary>
        /// divPersonalMsgs control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.HtmlControls.HtmlGenericControl divPersonalMsgs;

        /// <summary>
        /// lblYouHave control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.WebControls.Label lblYouHave;

        /// <summary>
        /// spanNumMsgs control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.HtmlControls.HtmlGenericControl spanNumMsgs;

        /// <summary>
        /// lblNewMsgs control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.WebControls.Label lblNewMsgs;

        /// <summary>
        /// loginTable control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.HtmlControls.HtmlTable loginTable;

        /// <summary>
        /// lblUser control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.WebControls.Label lblUser;

        /// <summary>
        /// lblPsw control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.WebControls.Label lblPsw;

        /// <summary>
        /// lblRememberMe control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.WebControls.Label lblRememberMe;

        /// <summary>
        /// lblLostPsw control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.WebControls.Label lblLostPsw;

        /// <summary>
        /// lblLoginErr control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.WebControls.Label lblLoginErr;

        /// <summary>
        /// AspNetForumContentPlaceHolder control.
        /// </summary>
        /// <remarks>
        /// Auto-generated field.
        /// To modify move field declaration from designer file to code-behind file.
        /// </remarks>
        protected global::System.Web.UI.WebControls.ContentPlaceHolder AspNetForumContentPlaceHolder;
    }



    public partial class AspNetForumMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Put user code to initialize the page here
            string dllversion = System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString();
            lblVersion.Text = "AspNetForum v." + dllversion;

            string forumtitle = ConfigurationManager.AppSettings["ForumTitle"];
            string titleurl = ConfigurationManager.AppSettings["TitleLink"];
            titleLink.InnerHtml = forumtitle;
            titleLink.HRef = titleurl;

            if (Page.Session["aspnetforumUserID"] == null) //not logged in
            {
                if (registerLink != null) registerLink.Visible = true;
                if (logoutLink != null) logoutLink.Visible = false;
                if (editProfileLink != null) editProfileLink.Visible = false;
                if (loginTable != null) loginTable.Visible = true;
                if (curuserTable != null) curuserTable.Visible = false;
                if (usersLink != null) usersLink.Visible = false;
                if (editProfileHeaderLink != null) editProfileHeaderLink.Visible = false;
            }
            else //logged in
            {
                if (registerLink != null) registerLink.Visible = false;
                if (logoutLink != null) logoutLink.Visible = true;
                if (editProfileLink != null) editProfileLink.Visible = true;
                if (loginTable != null) loginTable.Visible = false;
                if (curuserTable != null) curuserTable.Visible = true;
                if (usersLink != null) usersLink.Visible = true;
                if (editProfileHeaderLink != null) editProfileHeaderLink.Visible = true;

                if (editProfileLink != null)
                {
                    string username;
                    //IF "integrated auth" is enabled
                    //AND it is windows-authenctication
                    //then lets remove tha domain name from "domain\user" username
                    if (Page.User is System.Security.Principal.WindowsPrincipal
                        && ConfigurationManager.AppSettings["IntegratedAuthentication"] != null
                        && ConfigurationManager.AppSettings["IntegratedAuthentication"].ToLower() == "true")
                    {
                        username = Session["aspnetforumUserName"].ToString();
                        username = username.Substring(username.IndexOf("\\") + 1);
                    }
                    else
                    {
                        username = Session["aspnetforumUserName"].ToString();
                    }
                    editProfileLink.InnerHtml = username;
                }

                if (divPersonalMsgs != null) //check - if customer has commented that div in .ASPX
                {
                    int unreadPrivateMsgs = GetUnreadMessagesCount();
                    if (unreadPrivateMsgs > 0)
                    {
                        divPersonalMsgs.Visible = true;
                        spanNumMsgs.InnerHtml = unreadPrivateMsgs.ToString();
                    }
                    else
                    {
                        divPersonalMsgs.Visible = false;
                    }
                }
            }

            if (((ForumPage)Page).IsAdministrator && adminLink != null)
            {
                adminLink.Visible = true;
            }
            else
            {
                adminLink.Visible = false;
            }
        }

        private int GetUnreadMessagesCount()
        {
            string userID = Page.Session["aspnetforumUserID"].ToString();

            DbProviderFactory providerFactory = Utils.DB.CreateDBProviderFactory();
            DbConnection cn = Utils.DB.CreateConnection();
            DbCommand cmd = providerFactory.CreateCommand();
            cmd.Connection = cn;

            cmd.CommandText = "SELECT COUNT(MessageID) FROM ForumPersonalMessages WHERE ToUserID='" + userID + "' AND New=?";
            Utils.DB.FillCommandParamaters(ref cmd, true);
            cn.Open();
            object res = cmd.ExecuteScalar();
            cn.Close();
            return res == null ? 0 : Convert.ToInt32(res);
        }
    }



    public class AdminForumPage : ForumPage
    {
        protected override void OnLoad(EventArgs e)
        {
            if (!IsAdministrator)
            {
                Response.Redirect("default.aspx", true);
                Response.End();
                return;
            }

            base.OnLoad(e);
        }
    }

    public class AsyncSendMail
    {
        string _smtpServerAddress;
        string _smtpLogin;
        string _smtpPassword;
        bool _smtpAuthentication = false;
        bool _smtpUseSSL = false;
        string[] _recipients;
        string _subject;
        string _from;
        string _body;
        int _port;
        bool _enableEmailDebug;

        public AsyncSendMail(
            string[] recipients,
            string subject,
            string body)
        {
            System.Configuration.AppSettingsReader configurationAppSettings = new System.Configuration.AppSettingsReader();
            _smtpServerAddress = (string)configurationAppSettings.GetValue("MailServer", typeof(string));
            _smtpLogin = (string)configurationAppSettings.GetValue("MailServerLogin", typeof(string));
            _smtpPassword = (string)configurationAppSettings.GetValue("MailServerPassword", typeof(string));
            _from = (string)configurationAppSettings.GetValue("MailFromAddress", typeof(string));
            _port = (int)configurationAppSettings.GetValue("MailServerPort", typeof(int));
            _smtpUseSSL = (bool)configurationAppSettings.GetValue("MailUseSSL", typeof(bool));
            _enableEmailDebug = (bool)configurationAppSettings.GetValue("EmailDebug", typeof(bool));

            this._recipients = recipients;
            this._subject = subject;
            this._body = body;

            _smtpAuthentication = (_smtpLogin != "");
        }

        public void AsyncSend()
        {
            if (!_enableEmailDebug) //if we're not debugging - lets send emails in a separate thread
            {
                ThreadStart start = new ThreadStart(SendThreadProc);
                Thread thread = new Thread(start);
                thread.Priority = ThreadPriority.Normal;
                thread.Start();
            }
            else
                SendThreadProc();
        }

        private void SendThreadProc()
        {
            MailAddress fromAddress = null;
            MailAddress toAddress = null;

            try
            {
                fromAddress = new MailAddress(this._from);
            }
            catch (Exception ex)
            {
                //address parsing error
                if (_enableEmailDebug) throw (ex);
                return;
            }

            foreach (string to in this._recipients)
            {
                if (to.Trim().Length == 0) continue;

                try
                {
                    toAddress = new MailAddress(to);
                }
                catch (Exception ex)
                {
                    //address parsing error
                    if (_enableEmailDebug) throw (ex);
                    continue;
                }

                MailMessage msg = new MailMessage(fromAddress, toAddress);
                msg.Subject = this._subject;
                msg.Body = this._body;

                SmtpClient smtp = new SmtpClient();
                smtp.Port = this._port;
                smtp.Host = this._smtpServerAddress;
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.EnableSsl = _smtpUseSSL;

                if (this._smtpAuthentication)
                {
                    smtp.Credentials = new NetworkCredential(this._smtpLogin, this._smtpPassword);
                }

                try
                {
                    smtp.Send(msg);
                }
                catch (Exception ex)
                {
                    //someimtes when running under IIS (not VS Dev Server)
                    // it throws "Failure sending mail" "An established connection was aborted by the software in your host machine"
                    //this is because some antivirus blocks it.
                    if (_enableEmailDebug) throw (ex);
                }
            }
        }
    }


    public class CaptchaImage
    {
        // Public properties (all read-only).
        public string Text
        {
            get { return this.text; }
        }
        public Bitmap Image
        {
            get { return this.image; }
        }
        public int Width
        {
            get { return this.width; }
        }
        public int Height
        {
            get { return this.height; }
        }

        // Internal properties.
        private string text;
        private int width;
        private int height;
        private string familyName;
        private Bitmap image;

        // For generating random numbers.
        private Random random = new Random();

        // ====================================================================
        // Initializes a new instance of the CaptchaImage class using the
        // specified text, width and height.
        // ====================================================================
        public CaptchaImage(string s, int width, int height)
        {
            this.text = s;
            this.SetDimensions(width, height);
            this.GenerateImage();
        }

        // ====================================================================
        // Initializes a new instance of the CaptchaImage class using the
        // specified text, width, height and font family.
        // ====================================================================
        public CaptchaImage(string s, int width, int height, string familyName)
        {
            this.text = s;
            this.SetDimensions(width, height);
            this.SetFamilyName(familyName);
            this.GenerateImage();
        }

        // ====================================================================
        // This member overrides Object.Finalize.
        // ====================================================================
        ~CaptchaImage()
        {
            Dispose(false);
        }

        // ====================================================================
        // Releases all resources used by this object.
        // ====================================================================
        public void Dispose()
        {
            GC.SuppressFinalize(this);
            this.Dispose(true);
        }

        // ====================================================================
        // Custom Dispose method to clean up unmanaged resources.
        // ====================================================================
        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
                // Dispose of the bitmap.
                this.image.Dispose();
        }

        // ====================================================================
        // Sets the image width and height.
        // ====================================================================
        private void SetDimensions(int width, int height)
        {
            // Check the width and height.
            if (width <= 0)
                throw new ArgumentOutOfRangeException("width", width, "Argument out of range, must be greater than zero.");
            if (height <= 0)
                throw new ArgumentOutOfRangeException("height", height, "Argument out of range, must be greater than zero.");
            this.width = width;
            this.height = height;
        }

        // ====================================================================
        // Sets the font used for the image text.
        // ====================================================================
        private void SetFamilyName(string familyName)
        {
            // If the named font is not installed, default to a system font.
            try
            {
                Font font = new Font(this.familyName, 12F);
                this.familyName = familyName;
                font.Dispose();
            }
            catch
            {
                this.familyName = System.Drawing.FontFamily.GenericSerif.Name;
            }
        }

        // ====================================================================
        // Creates the bitmap image.
        // ====================================================================
        private void GenerateImage()
        {
            // Create a new 32-bit bitmap image.
            Bitmap bitmap = new Bitmap(this.width, this.height, PixelFormat.Format32bppArgb);

            // Create a graphics object for drawing.
            Graphics g = Graphics.FromImage(bitmap);
            g.SmoothingMode = SmoothingMode.AntiAlias;
            Rectangle rect = new Rectangle(0, 0, this.width, this.height);

            // Fill in the background.
            HatchBrush hatchBrush = new HatchBrush(HatchStyle.SmallConfetti, Color.LightGray, Color.White);
            g.FillRectangle(hatchBrush, rect);

            // Set up the text font.
            SizeF size;
            float fontSize = rect.Height + 1;
            Font font;
            // Adjust the font size until the text fits within the image.
            do
            {
                fontSize--;
                font = new Font(this.familyName, fontSize, FontStyle.Bold);
                size = g.MeasureString(this.text, font);
            } while (size.Width > rect.Width);

            // Set up the text format.
            StringFormat format = new StringFormat();
            format.Alignment = StringAlignment.Center;
            format.LineAlignment = StringAlignment.Center;

            // Create a path using the text and warp it randomly.
            GraphicsPath path = new GraphicsPath();
            path.AddString(this.text, font.FontFamily, (int)font.Style, font.Size, rect, format);
            float v = 4F;
            PointF[] points =
			{
				new PointF(this.random.Next(rect.Width) / v, this.random.Next(rect.Height) / v),
				new PointF(rect.Width - this.random.Next(rect.Width) / v, this.random.Next(rect.Height) / v),
				new PointF(this.random.Next(rect.Width) / v, rect.Height - this.random.Next(rect.Height) / v),
				new PointF(rect.Width - this.random.Next(rect.Width) / v, rect.Height - this.random.Next(rect.Height) / v)
			};
            Matrix matrix = new Matrix();
            matrix.Translate(0F, 0F);
            path.Warp(points, rect, matrix, WarpMode.Perspective, 0F);

            // Draw the text.
            hatchBrush = new HatchBrush(HatchStyle.LargeConfetti, Color.LightGray, Color.DarkGray);
            g.FillPath(hatchBrush, path);

            // Add some random noise.
            int m = Math.Max(rect.Width, rect.Height);
            for (int i = 0; i < (int)(rect.Width * rect.Height / 30F); i++)
            {
                int x = this.random.Next(rect.Width);
                int y = this.random.Next(rect.Height);
                int w = this.random.Next(m / 50);
                int h = this.random.Next(m / 50);
                g.FillEllipse(hatchBrush, x, y, w, h);
            }

            // Clean up.
            font.Dispose();
            hatchBrush.Dispose();
            g.Dispose();

            // Set the image.
            this.image = bitmap;
        }
    }

    public class ForumPage : Page
    {
        private string _forumTitle;
        protected string ForumTitle { get { return _forumTitle; } }

        protected int pageSize;

        private bool? _isAdministrator = null;

        //if the current user is an administrator
        public bool IsAdministrator
        {
            get
            {
                if (!_isAdministrator.HasValue)
                {
                    if (CurrentUserID == "") _isAdministrator = false;
                    else
                    {
                        bool openConn = (this.cn.State == ConnectionState.Open);
                        if (!openConn) this.cn.Open();
                        this.cmd.CommandText = "SELECT UserID FROM ForumAdministrators WHERE UserID='" + CurrentUserID + "'";
                        _isAdministrator = (this.cmd.ExecuteScalar() != null);
                        if (!openConn) this.cn.Close();
                    }
                }
                return _isAdministrator.Value;
            }
        }

        protected override void OnInit(EventArgs e)
        {
            //check if IP is banned
            if (ConfigurationManager.AppSettings["BannedIPs"] != null)
            {
                string[] ips = ConfigurationManager.AppSettings["BannedIPs"].Split(';');
                foreach (string ip in ips)
                {
                    if (Request.UserHostAddress == ip)
                        Response.End();
                }
            }

            _forumTitle = ConfigurationManager.AppSettings["ForumTitle"];
            pageSize = int.Parse(ConfigurationManager.AppSettings["PageSize"]);

            //if the current forum user is UNDETERMINED
            if (CurrentUserID == "")
            {
                //if login btn was pressed
                if (IsPostBack
                    && Request.Form["LoginName"] != null
                    && Request.Form["LoginName"] != ""
                    && Request.Form["Password"] != null
                    && Request.Form["Password"] != ""
                    && Request.Form["loginbutton"] != null)
                {
                    ProcessLogin();
                }

                //or if "remember me" cookie was found
                else if (Request.Cookies["aspnetforumUID"] != null)
                {
                    ProcessCookieLogin();
                }

                //if nothing of the above is true, BUT asp.net detects an authenticated user
                //and the appropriate setting in the web.config is enabled ("IntegratedAuthentication")
                else if (Page.User.Identity.IsAuthenticated
                    && ConfigurationManager.AppSettings["IntegratedAuthentication"] != null
                    && ConfigurationManager.AppSettings["IntegratedAuthentication"].ToLower() == "true")
                {
                    ProcessMembershipLogin(Page.User.Identity.Name);
                }
            }
#if TRIAL
			Literal lt = new Literal();
            lt.Text = "<div align=right>Powered by <a href=\"http://www.jitbit.com/aspnetforum.aspx\">Jitbit AspNetForum</a> free trial version.</div>";
			this.Form.Controls.AddAt(0, lt);
#endif

            base.OnInit(e);
        }

        private void ProcessLogin()
        {
            string username = Request.Form["LoginName"].Replace("'", "''");
            string password = Request.Form["Password"].Replace("'", "''");
            string hashedPsw = Password.CalculateMD5Hash(password);
            this.cmd.Parameters.Clear();
            this.cmd.CommandText = string.Format("SELECT UserID, UserName FROM ForumUsers WHERE UserName='{0}' AND (Password='{1}' OR Password='{2}') AND Disabled=0",
                username, password, hashedPsw);
            this.cn.Open();
            DbDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session["aspnetforumUserID"] = (dr[0]).ToString();
                Session["aspnetforumUserName"] = dr[1].ToString();

                if (Request.Form["rememberme"] == "1")
                {
                    // adding "remember me" cookies
                    //System.Security.Cryptography.MD5CryptoServiceProvider md5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
                    HttpCookie cookieUID = new HttpCookie("aspnetforumUID", CurrentUserID.ToString());
                    cookieUID.Expires = DateTime.Now.AddYears(1);
                    HttpCookie cookiePSW = new HttpCookie("aspnetforumPSW", hashedPsw);
                    cookiePSW.Expires = DateTime.Now.AddYears(1);
                    Response.Cookies.Add(cookieUID);
                    Response.Cookies.Add(cookiePSW);
                }
            }
            else //wrong password
            {
                if (this.Master is AspNetForumMaster)
                {
                    Control lblLoginErr = this.Master.FindControl("lblLoginErr");
                    if (lblLoginErr != null) lblLoginErr.Visible = true;
                }
            }
            dr.Close();
            this.cn.Close();
        }

        private void ProcessMembershipLogin(string username)
        {
            username = username.Replace("'", "''");
            this.cmd.Parameters.Clear();
            //this.cmd.CommandText = string.Format("SELECT UserID, UserName FROM ForumUsers WHERE UserName='{0}' AND Disabled=0", username);
            this.cmd.CommandText = string.Format("SELECT UserID, Email FROM ForumUsers WHERE Email='{0}' AND Disabled=0", username);
            this.cn.Open();
            DbDataReader dr = cmd.ExecuteReader();
            if (dr.Read()) //if user found if db (already exists)
            {
                Session["aspnetforumUserID"] = (dr[0]).ToString();
                Session["aspnetforumUserName"] = dr[1].ToString();
                dr.Close();
            }
            else //user not exists YET - let's add him to our ForumUsers table
            {

                SqlConnClass objSqlConnClass = new SqlConnClass();
                UsersClass objUsersClass = new UsersClass(objSqlConnClass.OpenConnection());


                //DataRow DR = objUsersClass.USR_GET_GetUserInfo(Membership.GetUser().ProviderUserKey.ToString()).Tables[0].Rows[0];
                /*Above line is commented by Netsmartz*/
                DataSet ds = objUsersClass.USR_GET_GetUserInfo(Membership.GetUser().ProviderUserKey.ToString());
                if (ds != null && ds.Tables.Count > 0)
                {
                    DataRow DR = ds.Tables[0].Rows[0];
                    string sUserDisplayName = "";
                    if (DR != null)
                    {
                        sUserDisplayName = DR["FNAME"].ToString() + " " + DR["LNAME"].ToString();
                    }
                    objSqlConnClass.CloseConnection();

                    dr.Close();
                    this.cmd.Parameters.Clear();
                    this.cmd.CommandText = "INSERT INTO ForumUsers (UserID, UserName, Email, [Password], UserDisplayName, Homepage, Interests, RegistrationDate, Disabled, ActivationCode) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    Utils.DB.PrepareCommandText(ref cmd);
                    Utils.DB.FillCommandParamaters(ref cmd, Membership.GetUser().ProviderUserKey.ToString(), username, "none", "none", sUserDisplayName, string.Empty, string.Empty, Utils.GetCurrTime(), false, string.Empty);
                    this.cmd.ExecuteNonQuery();

                    this.cmd.Parameters.Clear();
                    this.cmd.CommandText = string.Format("SELECT UserID, UserName FROM ForumUsers WHERE UserName='{0}' AND Disabled=0", username);
                    dr = cmd.ExecuteReader();
                    dr.Read();
                    Session["aspnetforumUserID"] = (dr[0]).ToString();
                    Session["aspnetforumUserName"] = dr[1].ToString();
                    dr.Close();
                }

            }

            this.cn.Close();

        }

        protected bool CheckForumReadPermissions(int forumID, string userID)
        {
            this.cn.Open();
            //if no read-permissoin set in the permissions table - forum is FFA to read
            this.cmd.CommandText = "SELECT ForumID FROM ForumGroupPermissions WHERE AllowReading=? and ForumID=?";
            Utils.DB.FillCommandParamaters(ref cmd, true, forumID);
            object res = this.cmd.ExecuteScalar();
            if (res == null)
            {
                this.cn.Close();
                return true;
            }

            //else - check permissions
            this.cmd.CommandText = "SELECT ForumGroupPermissions.ForumID " +
                "FROM ForumUsersInGroup INNER JOIN ForumGroupPermissions ON ForumUsersInGroup.GroupID = ForumGroupPermissions.GroupID " +
                "WHERE ForumGroupPermissions.AllowReading=? AND ForumUsersInGroup.UserID=convert(uniqueidentifier, ?) AND ForumGroupPermissions.ForumID=?";
            Utils.DB.FillCommandParamaters(ref cmd, true, userID, forumID);
            res = this.cmd.ExecuteScalar();
            this.cn.Close();
            this.cmd.Parameters.Clear();
            return (res != null);
        }

        protected bool CheckForumPostPermissions(int forumID, string userID)
        {
            this.cn.Open();
            //if no records exist in the permissions table - the forum is FFA to post
            this.cmd.CommandText = "SELECT ForumID FROM ForumGroupPermissions WHERE AllowPosting=? and ForumID=?";
            Utils.DB.FillCommandParamaters(ref cmd, true, forumID);
            object res = this.cmd.ExecuteScalar();
            if (res == null)
            {
                this.cn.Close();
                return true;
            }

            //else - check permissions
            this.cmd.CommandText = string.Format("SELECT ForumGroupPermissions.ForumID " +
                "FROM ForumUsersInGroup INNER JOIN ForumGroupPermissions ON ForumUsersInGroup.GroupID = ForumGroupPermissions.GroupID " +
                "WHERE ForumGroupPermissions.AllowPosting=? AND ForumUsersInGroup.UserID=? AND ForumGroupPermissions.ForumID=?",
                userID, forumID);
            Utils.DB.FillCommandParamaters(ref cmd, true, userID, forumID);
            res = this.cmd.ExecuteScalar();
            this.cn.Close();
            this.cmd.Parameters.Clear();
            return (res != null);
        }

        private void ProcessCookieLogin()
        {
            this.cmd.Parameters.Clear();
            this.cmd.CommandText = "SELECT UserID, Password, UserName FROM ForumUsers WHERE UserID=" + int.Parse(Request.Cookies["aspnetforumUID"].Value) + " AND Disabled=0";
            this.cn.Open();
            DbDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                if (Password.CalculateMD5Hash(dr[1].ToString()) == Request.Cookies["aspnetforumPSW"].Value
                    || dr[1].ToString() == Request.Cookies["aspnetforumPSW"].Value)
                {
                    Session["aspnetforumUserID"] = (dr[0]).ToString();
                    Session["aspnetforumUserName"] = dr[2].ToString();
                }
            }
            dr.Close();
            this.cn.Close();
        }

        protected bool IsModerator(int forumid)
        {
            if (CurrentUserID == "") return false;

            if (IsAdministrator) return true;

            bool bOpenConn = (this.cn.State == ConnectionState.Closed);

            if (bOpenConn) this.cn.Open();
            this.cmd.CommandText = "SELECT UserID FROM ForumModerators WHERE UserID='" + CurrentUserID + "' AND ForumID=" + forumid;
            bool retVal = (this.cmd.ExecuteScalar() != null);
            if (bOpenConn) this.cn.Close();

            return retVal;
        }

        //this property return the current user's ID
        protected string CurrentUserID
        {
            get { return Session["aspnetforumUserID"] == null ? "" : (Session["aspnetforumUserID"]).ToString(); }
        }
    }

    public class ForumSEOHttpModule : IHttpModule
    {
        private static bool _moduleLoaded = false;

        public ForumSEOHttpModule()
        {
        }

        public void Dispose()
        {
        }

        public static bool SEOUrlsEnabled
        {
            get { return _moduleLoaded; }
        }

        public void Init(HttpApplication context)
        {
            _moduleLoaded = true;
            //let's register our event handler
            context.PostResolveRequestCache += new EventHandler(context_PostResolveRequestCache);
        }

        void context_PostResolveRequestCache(object sender, EventArgs e)
        {
            HttpApplication application = (HttpApplication)sender;
            HttpContext context = application.Context;

            //the file being requested is not found
            if (!File.Exists(application.Request.PhysicalPath))
            {
                string path = application.Request.Path.ToLower();
                int posTopic = path.IndexOf("/topic", path.LastIndexOf("/")); //if our URL has a "/topic" in the file name
                int posForum = path.IndexOf("/forum", path.LastIndexOf("/")); //if our URL has a "/forum" in the file name

                if (posTopic > -1)
                {
                    string prefix = path.Substring(0, posTopic); //prefix is needed if the forum is installed under existing site in some subfolder, e.g. "/forum" - prefix

                    //try to extract topicid
                    string topicid = path.Substring(posTopic);
                    topicid = topicid.Replace("/topic", "");
                    topicid = topicid.Substring(0, topicid.IndexOf("-"));

                    int tst = 0;
                    if (int.TryParse(topicid, out tst)) //topicid extracted and parsed
                    {
                        string topicURL = prefix + "/messages.aspx?TopicID=" + topicid + "&" + application.Request.QueryString.ToString();
                        context.RewritePath(topicURL);
                    }
                }
                else if (posForum > -1)
                {
                    string prefix = path.Substring(0, posForum); //prefix is needed if the forum is installed under existing site in some subfolder, e.g. "/forum" - prefix

                    //try to extract topicid
                    string forumid = path.Substring(posForum);
                    forumid = forumid.Replace("/forum", "");
                    forumid = forumid.Substring(0, forumid.IndexOf("-"));

                    int tst = 0;
                    if (int.TryParse(forumid, out tst)) //topicid extracted and parsed
                    {
                        string topicURL = prefix + "/topics.aspx?ForumID=" + forumid + "&" + application.Request.QueryString.ToString();
                        context.RewritePath(topicURL);
                    }
                }
            }
        }
    }



    public class Page : System.Web.UI.Page
    {
        protected DbConnection cn;
        protected DbCommand cmd;
        protected DbProviderFactory providerFactory;

        public Page()
        {
            providerFactory = Utils.DB.CreateDBProviderFactory();
            cn = Utils.DB.CreateConnection();

            cmd = providerFactory.CreateCommand();
            cmd.Connection = cn;
        }
    }


    public class Password
    {
        public static string CreateRandomPassword(int PasswordLength)
        {
            String _allowedChars = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ23456789";
            Byte[] randomBytes = new Byte[PasswordLength];
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            rng.GetBytes(randomBytes);
            char[] chars = new char[PasswordLength];
            int allowedCharCount = _allowedChars.Length;

            for (int i = 0; i < PasswordLength; i++)
            {
                chars[i] = _allowedChars[(int)randomBytes[i] % allowedCharCount];
            }

            return new string(chars);
        }

        public static string CalculateMD5Hash(string input)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            byte[] bytes = Encoding.UTF8.GetBytes(input);
            bytes = md5.ComputeHash(bytes);
            StringBuilder s = new StringBuilder();
            foreach (byte b in bytes)
            {
                s.Append(b.ToString("x2").ToLower());
            }
            string result = s.ToString().ToUpper();
            return result;
        }
    }

    public class SendNotifications
    {
        static string _forum;
        static string _dbConnectionString;

        //initialize basic settings
        private static void InitSettings()
        {
            _forum = ConfigurationManager.AppSettings["ForumTitle"];
            _dbConnectionString = ConfigurationManager.ConnectionStrings["AspNetForumConnectionString"].ConnectionString;
        }

        //the method sends notifications of new forum MESSAGES
        public static void SendNewMsgNotificationEmails(int topicID, string userID, string url)
        {
            InitSettings();

            DbConnection cn = Utils.DB.CreateConnection();
            DbCommand cmd = Utils.DB.CreateDBProviderFactory().CreateCommand();
            cmd.Connection = cn;
            cn.Open();

            //getting topic info
            int forumID; string subj;
            cmd.CommandText = "SELECT ForumID, Subject FROM ForumTopics WHERE TopicID=" + topicID;
            DbDataReader dr = cmd.ExecuteReader();
            dr.Read();
            forumID = Convert.ToInt32(dr["ForumID"]);
            subj = dr["Subject"].ToString();
            dr.Close();

            //addin subscribers to the recipients list
            cmd.CommandText = "SELECT ForumUsers.Email FROM ForumSubscriptions INNER JOIN ForumUsers ON ForumSubscriptions.UserID = ForumUsers.UserID WHERE ForumUsers.UserID<>'" + userID + "' AND ForumSubscriptions.TopicID=" + topicID;
            dr = cmd.ExecuteReader();
            ArrayList recipients = new ArrayList();
            while (dr.Read())
            {
                recipients.Add(dr["Email"].ToString());
            }
            dr.Close();

            //addin moderators to the recipients list
            cmd.CommandText = "SELECT ForumUsers.Email FROM ForumModerators INNER JOIN ForumUsers ON ForumModerators.UserID = ForumUsers.UserID WHERE ForumUsers.UserID<>'" + userID + "' AND ForumModerators.ForumID=" + forumID;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                recipients.Add(dr["Email"].ToString());
            }
            dr.Close();

            cn.Close();

            string topicurl = url + Utils.GetTopicURL(topicID, subj);

            //adding "?lastpage=1" to the url
            if (topicurl.IndexOf("?") > -1) topicurl += "&lastpage=1";
            else topicurl += "?lastpage=1";

            string body = Resources.various.ThreadUpdatedEmailBody + "\r\n" + topicurl;
            string subject = _forum + " - " + Resources.various.ThreadUpdatedEmailSubject;

            AsyncSendMail mailer = new AsyncSendMail(
                (string[])recipients.ToArray(typeof(string)),
                subject,
                body);
            mailer.AsyncSend();
        }

        //the method sends notifications of new forum TOPICS
        public static void SendNewTopicNotificationEmails(int forumID, string userID, string url)
        {
            InitSettings();

            DbConnection cn = Utils.DB.CreateConnection();
            DbCommand cmd = Utils.DB.CreateDBProviderFactory().CreateCommand();
            cmd.Connection = cn;
            cn.Open();

            //addin subscribers to the recipients list
            cmd.CommandText = "SELECT ForumUsers.Email FROM ForumNewTopicSubscriptions INNER JOIN ForumUsers ON ForumNewTopicSubscriptions.UserID = ForumUsers.UserID WHERE ForumUsers.UserID<>'" + userID + "' AND ForumNewTopicSubscriptions.ForumID=" + forumID;
            DbDataReader dr = cmd.ExecuteReader();
            ArrayList recipients = new ArrayList();
            while (dr.Read())
            {
                recipients.Add(dr["Email"].ToString());
            }
            dr.Close();

            //addin moderators to the recipients list
            cmd.CommandText = "SELECT ForumUsers.Email FROM ForumModerators INNER JOIN ForumUsers ON ForumModerators.UserID = ForumUsers.UserID WHERE ForumUsers.UserID<>'" + userID + "' AND ForumModerators.ForumID=" + forumID;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                recipients.Add(dr["Email"].ToString());
            }
            dr.Close();

            cmd.CommandText = "SELECT Title FROM Forums WHERE ForumID=" + forumID;
            object res = cmd.ExecuteScalar();

            cn.Close();

            string forumurl = url + Utils.GetForumURL(forumID, res.ToString());
            string body = Resources.various.NewThreadEmailBody + "\r\n" + forumurl;
            string subject = _forum + " - " + Resources.various.NewThreadEmailSubject;

            AsyncSendMail mailer = new AsyncSendMail(
                (string[])recipients.ToArray(typeof(string)),
                subject,
                body);
            mailer.AsyncSend();
        }

        //the method sends notifications of new personal messages
        public static void SendPersonalNotificationEmails(string toUserID, string url)
        {
            InitSettings();

            string body = Resources.various.NewPersonalEmailBody + "\r\n" + url;
            string subject = _forum + " - " + Resources.various.NewPersonalSubject;

            DbConnection cn = Utils.DB.CreateConnection();
            DbCommand cmd = Utils.DB.CreateDBProviderFactory().CreateCommand();
            cmd.Connection = cn;
            cmd.CommandText = "SELECT ForumUsers.Email FROM ForumUsers WHERE UserID='" + toUserID + "'";

            cn.Open();
            DbDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                string[] recipients = new string[1];
                recipients[0] = dr["Email"].ToString();

                AsyncSendMail mailer = new AsyncSendMail(
                    recipients,
                    subject,
                    body);
                mailer.AsyncSend();
            }
            dr.Close();
            cn.Close();
        }

        //the method sends activation email to a newly registered user
        public static void SendActivationEmail(string to, string url)
        {
            InitSettings();

            string body = Resources.various.ActivationEmailBody + "\r\n\r\n" + url;
            string subject = _forum + " - " + Resources.various.ActivationEmailSubject;

            string[] recipients = new string[1];
            recipients[0] = to;

            AsyncSendMail mailer = new AsyncSendMail(
                    recipients,
                    subject,
                    body);
            mailer.AsyncSend();
        }

        //the method sends a "welcome" email after the user hss been activated by admin
        public static void SendWelcomeEmail(string to, string url)
        {
            InitSettings();

            string body = Resources.various.WelcomeEmailBody + "\r\n\r\n" + url;
            string subject = _forum + " - " + Resources.various.WelcomeEmailSubject;

            string[] recipients = new string[1];
            recipients[0] = to;

            AsyncSendMail mailer = new AsyncSendMail(
                    recipients,
                    subject,
                    body);
            mailer.AsyncSend();
        }

        //the method sends notifications of new user registrations to administrators
        public static void SendNewUserRegAdminNotification(string url)
        {
            InitSettings();

            string body = "New user has registered on the forum.\r\n\r\nLink to the user's profile: " + url;
            string subject = _forum + " - new user registration";

            DbConnection cn = Utils.DB.CreateConnection();
            DbCommand cmd = Utils.DB.CreateDBProviderFactory().CreateCommand();
            cmd.Connection = cn;
            cmd.CommandText = "SELECT ForumUsers.Email FROM ForumUsers INNER JOIN ForumAdministrators ON ForumUsers.UserID=ForumAdministrators.UserID";

            cn.Open();
            DbDataReader dr = cmd.ExecuteReader();
            ArrayList recipients = new ArrayList();
            while (dr.Read())
            {
                recipients.Add(dr["Email"].ToString());
            }

            if (recipients.Count > 0)
            {
                AsyncSendMail mailer = new AsyncSendMail(
                        (string[])(recipients.ToArray(typeof(string))),
                        subject,
                        body);
                mailer.AsyncSend();
            }
            dr.Close();
            cn.Close();
        }
    }

    public partial class Utils
    {
        //returns current datetime including the "ServerTimeOffset" setting
        public static DateTime GetCurrTime()
        {
            int serveroffset;
            if (int.TryParse(ConfigurationManager.AppSettings["ServerTimeOffset"], out serveroffset))
                return DateTime.Now.AddHours(serveroffset);
            else
                return DateTime.Now;
        }


        //this method returns HTML with short user info (shown on the left of the msg list) 
        //username, posts count, link to a profile
        //------------
        //if uid=0 then it displays GUEST as username
        //required for FFA forums
        public static string DisplayUserInfo(object uID, object uname, object postsCount, object avatarFileName, string sDisplay)
        {
            StringBuilder output = new StringBuilder();

            //get avatar path from web.config
            string avatarPath = "upload";
            try { avatarPath = ConfigurationManager.AppSettings["AvatarVirtualPath"]; }
            catch { }

            //remove domain from username (in case its windows auth)
            string unameNoDomain = uname.ToString();
            unameNoDomain = unameNoDomain.Substring(unameNoDomain.IndexOf("\\") + 1);

            bool bAvatarsEnabled = (ConfigurationManager.AppSettings["EnableAvatars"].ToLower() == "true");

            if (bAvatarsEnabled && avatarFileName != null && avatarFileName.ToString() != "" && sDisplay == "Avatar")
            {
                output.Append("<a href=\"viewprofile.aspx?UserID=");
                output.Append(uID);
                output.Append("\">");
                output.Append("<img src=\"");
                output.Append(avatarPath);
                output.Append("/");
                output.Append(avatarFileName);
                output.Append("\" border=\"0\" alt=\"");
                output.Append(unameNoDomain);
                output.Append("\"/></a><br/>");
            }
            else
            {
                if (sDisplay == "Avatar")
                {
                    output.Append("<img src=\"images\\icons\\iconDefaultAvatar.gif\"/></a><br/>");
                }
            }

            if (uID.ToString() != "" && sDisplay == "Username")
            {
                output.Append("<b><a href=\"viewprofile.aspx?UserID=");
                output.Append(uID);
                output.Append("\">");
                output.Append(unameNoDomain);
                output.Append("</a></b><br/>");
                //output.Append("</a></b><br/>Posts ");
                //output.Append(postsCount);
            }
            else
            {
                if (sDisplay != "Avatar")
                {
                    output.Append("<b>" + Resources.various.Guest + "</b>");
                }
            }
            return output.ToString();
        }


        //this method returns HTML with short user info (shown on the left of the msg list) 
        //username, posts count, link to a profile
        //------------
        //if uid=0 then it displays GUEST as username
        //required for FFA forums
        public static string DisplayUserInfo(object uID, object uname, object postsCount, object avatarFileName)
        {
            StringBuilder output = new StringBuilder();

            //get avatar path from web.config
            string avatarPath = "upload";
            try { avatarPath = ConfigurationManager.AppSettings["AvatarVirtualPath"]; }
            catch { }

            //remove domain from username (in case its windows auth)
            string unameNoDomain = uname.ToString();
            unameNoDomain = unameNoDomain.Substring(unameNoDomain.IndexOf("\\") + 1);

            bool bAvatarsEnabled = (ConfigurationManager.AppSettings["EnableAvatars"].ToLower() == "true");

            if (bAvatarsEnabled && avatarFileName != null && avatarFileName.ToString() != "")
            {
                output.Append("<a href=\"viewprofile.aspx?UserID=");
                output.Append(uID);
                output.Append("\">");
                output.Append("<img src=\"");
                output.Append(avatarPath);
                output.Append("/");
                output.Append(avatarFileName);
                output.Append("\" border=\"0\" alt=\"");
                output.Append(unameNoDomain);
                output.Append("\"/></a><br/>");
            }

            if (uID.ToString() != "")
            {
                output.Append("<b><a href=\"viewprofile.aspx?UserID=");
                output.Append(uID);
                output.Append("\">");
                output.Append(unameNoDomain);
                output.Append("</a></b><br/>Posts ");
                output.Append(postsCount);
            }
            else
            {
                output.Append("<b>" + Resources.various.Guest + "</b>");
            }
            return output.ToString();
        }

        //get message's date and username by messageID
        //this is used to show "last message" column in the topics list, in the forums list etc.
        public static string GetMsgInfoByID(object messsageID, DbCommand cmd)
        {
            if (messsageID.ToString().Trim() == string.Empty) return string.Empty;

            //this method is called from grids, so
            //to save performance and prevent close/reopn connection a thousand times we do this
            bool openConn = (cmd.Connection.State == ConnectionState.Open);
            if (!openConn) cmd.Connection.Open();

            cmd.CommandText = "SELECT ForumMessages.CreationDate, ForumUsers.UserName, ForumUsers.UserID " +
                "FROM ForumMessages INNER JOIN ForumUsers ON ForumUsers.UserID = ForumMessages.UserID " +
                "WHERE ForumMessages.MessageID=" + messsageID.ToString();
            DbProviderFactory providerFactory = Utils.DB.CreateDBProviderFactory();
            DbDataAdapter da = providerFactory.CreateDataAdapter();
            da.SelectCommand = cmd;
            DataTable dt = new DataTable();
            da.Fill(dt);
            string retval = "";

            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];

                //remove domain from username (in case its windows auth)
                string unameNoDomain = row["UserName"].ToString();
                unameNoDomain = unameNoDomain.Substring(unameNoDomain.IndexOf("\\") + 1);

                retval = "<a href=\"viewprofile.aspx?UserID=" + row["UserID"] + "\">" + unameNoDomain + "</a> " + row["CreationDate"];
            }

            if (!openConn) cmd.Connection.Close();

            return retval;
        }

        //returns true, if SEO-friendly URLs are enabled (if module is loaded)
        public static bool SEOUrlsEnabled
        {
            get
            {
                return ForumSEOHttpModule.SEOUrlsEnabled;
            }
        }

        //static method returns the topic url
        //if the module IS LOADED, it returns the topic URL like "topic123-title-of-the-topic.aspx"
        //if not loade - return "messages.aspx?TopicID=123"
        public static string GetTopicURL(object topicID, object subject)
        {
            if (!SEOUrlsEnabled)
                return "messages.aspx?TopicID=" + topicID;
            else
                return "topic" + topicID + "-" + Formatting.FormatTitleForURL(subject) + ".aspx";
        }

        //static method returns the forum url
        //if the module IS LOADED, it returns the topic URL like "forum123-title-of-the-forum.aspx"
        //if not loade - return "topics.aspx?ForumID=123"
        public static string GetForumURL(object forumID, object subject)
        {
            if (!SEOUrlsEnabled)
                return "topics.aspx?ForumID=" + forumID;
            else
                return "forum" + forumID + "-" + Formatting.FormatTitleForURL(subject) + ".aspx";
        }

        public static string GetForumBreadCrumbs(int forumID, DbCommand cmd)
        {
            string retval = "";

            //to save performance and prevent close/reopn connection a thousand times we do this
            bool openConn = (cmd.Connection.State == ConnectionState.Open);
            if (!openConn) cmd.Connection.Open();

            //get the forum title
            cmd.CommandText = "SELECT Title FROM Forums WHERE ForumID=" + forumID;
            string forumTitle = cmd.ExecuteScalar().ToString();

            retval = "<a href=\"" + GetForumURL(forumID, forumTitle) + "\">" + forumTitle + "</a>";

            //check if it's a subforum
            cmd.CommandText = "SELECT ParentForumID FROM ForumSubforums WHERE SubForumID=" + forumID;
            object res = cmd.ExecuteScalar();
            if (res != null) retval = GetForumBreadCrumbs(Convert.ToInt32(res), cmd) + " - " + retval;

            if (!openConn) cmd.Connection.Close();

            return retval;
        }

        // Returns a string of six random digits.
        public static string GenerateRandomCode()
        {
            // For generating random numbers.
            Random random = new Random();
            string s = "";
            for (int i = 0; i < 6; i++)
                s = String.Concat(s, random.Next(10).ToString());
            return s;
        }
    }

    public partial class Utils
    {
        //Cross-Datasource engine.
        public class DB
        {
            public static void FillCommandParamaters(ref DbCommand cmd, params object[] valuesList)
            {
                //clear params
                cmd.Parameters.Clear();

                AddCommandParamaters(ref cmd, valuesList);
            }

            //adds SEVELRAL parameters to a dbcommand
            //includes OleDb fix for MS Access:
            //(when "DbType.DateTime" causes error, and "DbType.Date" truncates time - so we have to use "OleDbType.Date" explicitly)
            public static void AddCommandParamaters(ref DbCommand cmd, params object[] valuesList)
            {
                string providerName = ConfigurationManager.ConnectionStrings["AspNetForumConnectionString"].ProviderName;
                DbProviderFactory providerFactory = DbProviderFactories.GetFactory(providerName);

                //if we are using SqlClient OR MySqlClient -
                //then replace the "?" signs in the command text with "@Param1", "@Param2" etc.
                //or with "?Param1", "?Param2" in mySQL case)
                //because ".NET native SQL ADO.NET driver" and "MySQL Connector.NET"
                //do not support unnamed parameters and "?" signs
                bool sqlDriver = (cmd is SqlCommand);
                bool mysqlDriver = (providerName == "MySql.Data.MySqlClient");
                if (sqlDriver || mysqlDriver)
                {
                    int i = 1;
                    string newCmd = cmd.CommandText;
                    Regex rx = new Regex(@"\?");
                    MatchCollection matches = rx.Matches(cmd.CommandText);
                    foreach (Match mtch in matches)
                    {
                        //replace the "?" signs in the command text with "@Param1", "@Param2" etc
                        newCmd = rx.Replace(newCmd, "@Param" + i, 1, mtch.Index);
                        i++;
                    }
                    if (mysqlDriver) //replace the "@Param" with "?Param" if we are using MySQL
                    {
                        newCmd = newCmd.Replace("@Param", "?Param");
                    }
                    cmd.CommandText = newCmd;
                }

                //now create parameters and add them to command
                for (int i = 0; i < valuesList.Length; i++)
                {
                    DbParameter dbParam = providerFactory.CreateParameter();

                    //if parameter is datetime - MS Access oledb datetime fix
                    if (valuesList[i] is DateTime && cmd is OleDbCommand)
                    {
                        ((OleDbParameter)dbParam).OleDbType = OleDbType.Date;
                    }

                    dbParam.Value = valuesList[i];
                    if (sqlDriver) //if sql - then assign parameter name
                    {
                        dbParam.ParameterName = "@Param" + (i + 1);
                    }
                    else if (mysqlDriver) //if mysql - then assign parameter name
                    {
                        dbParam.ParameterName = "?Param" + (i + 1);
                    }
                    cmd.Parameters.Add(dbParam);
                }
            }

            /// <summary>
            /// returns a NEW instance of data connection
            /// </summary>
            public static DbConnection CreateConnection()
            {
                string connStr = ConfigurationManager.ConnectionStrings["AspNetForumConnectionString"].ConnectionString;
                DbConnection cn = CreateDBProviderFactory().CreateConnection();
                cn.ConnectionString = connStr;
                return cn;
            }

            /// <summary>
            /// returns a NEW instance of DB Provider Factory
            /// </summary>
            public static DbProviderFactory CreateDBProviderFactory()
            {

                string providerName = ConfigurationManager.ConnectionStrings["AspNetForumConnectionString"].ProviderName;
                DbProviderFactory dbProviderFactory = DbProviderFactories.GetFactory(providerName);
                return dbProviderFactory;
            }

            /// <summary>
            /// prepares command text - removes disallowed symbols and words
            /// always call this method IF command-text contains reserved words, surrounded with "[]"
            /// because MySQL uses "``" instead of "[]"
            /// 
            /// ALSO replaces "TOP XX" instruction with "LIMIT XX" (for MySQL)
            /// </summary>
            /// <param name="cmd"></param>
            public static void PrepareCommandText(ref DbCommand cmd)
            {
                string providerName = ConfigurationManager.ConnectionStrings["AspNetForumConnectionString"].ProviderName;

                //if mysql-command - then replace "[]" with "`"
                //cause MySQL does not support "[" symbols
                if (providerName == "MySql.Data.MySqlClient")
                {
                    string newCmd = cmd.CommandText;

                    //special chars [] ``
                    newCmd = newCmd.Replace("[", "`");
                    newCmd = newCmd.Replace("]", "`");

                    //replace "TOP X" to "LIMIT N"
                    if (newCmd.ToUpper().StartsWith("SELECT TOP "))
                    {
                        //find first space after 11 symbol
                        int spacePos = newCmd.IndexOf(" ", 11);
                        string limitNumber = " LIMIT " + newCmd.Substring(11, spacePos - 11);
                        newCmd = "SELECT " + newCmd.Substring(spacePos) + limitNumber;
                    }

                    cmd.CommandText = newCmd;
                }
            }
        }
    }

    public partial class Utils
    {
        public class Formatting
        {
            public static string FormatSignature(string signature)
            {
                signature = signature.Trim();
                if (signature.Length == 0) return string.Empty;
                else
                {
                    return "<br/><br/>--<br/>" + FormatMessageHTML(signature);
                }
            }

            public static string FormatTitleForURL(object input)
            {
                string title = (string)input;
                title = title.Trim().ToLower();
                title = Regex.Replace(title, @"[^a-z0-9\s]", "");
                title = Regex.Replace(title, @"\s", "-");
                return title;
            }

            public static string FormatMessageHTML(string input)
            {
                input = input.Trim();
                if (input.Length == 0) return string.Empty;

                //create regexs
                Regex regexURL = new Regex(@"(\[url=([^\]]+)\])", RegexOptions.IgnoreCase);
                Regex regexCOLOR = new Regex(@"(\[color=([^\]]+)\])", RegexOptions.IgnoreCase);
                Regex regexSIZE = new Regex(@"(\[size=([^\]]+)\])", RegexOptions.IgnoreCase);
                Regex regexQUOTE = new Regex(@"(\[quote=([^\]]+)\])", RegexOptions.IgnoreCase);
                Regex regexHTTP = new Regex(@"(\s|^)(http://([^\s]+))", RegexOptions.IgnoreCase);

                string msg = input;
                msg = msg.Replace("[b]", "<b>").Replace("[/b]", "</b>");
                msg = msg.Replace("[i]", "<i>").Replace("[/i]", "</i>");
                msg = msg.Replace("[u]", "<u>").Replace("[/u]", "</u>");
                msg = msg.Replace("[code]", "<pre>").Replace("[/code]", "</pre>");
                msg = msg.Replace("[img]", "<img src=\"").Replace("[/img]", "\" border=\"0\">");

                //[URL]
                for (Match m = regexURL.Match(msg); m.Success; m = m.NextMatch())
                {
                    msg = msg.Replace(m.Groups[0].ToString(),
                        "<A href=\"" + m.Groups[2].ToString() + "\" target=\"_blank\" rel=\"nofollow\">");
                }
                msg = msg.Replace("[/url]", "</a>");

                //[COLOR]
                for (Match m = regexCOLOR.Match(msg); m.Success; m = m.NextMatch())
                {
                    msg = msg.Replace(m.Groups[0].ToString(),
                        "<span style=\"color:" + m.Groups[2].ToString() + "\">");
                }
                msg = msg.Replace("[/color]", "</span>");

                //[SIZE]
                for (Match m = regexSIZE.Match(msg); m.Success; m = m.NextMatch())
                {
                    msg = msg.Replace(m.Groups[0].ToString(),
                        "<span style=\"font-size:" + m.Groups[2].ToString() + "pt\">");
                }
                msg = msg.Replace("[/size]", "</span>");

                //[QUOTE]
                for (Match m = regexQUOTE.Match(msg); m.Success; m = m.NextMatch())
                {
                    msg = msg.Replace(m.Groups[0].ToString(),
                        "<b>" + m.Groups[2].ToString() + "</b> " + Resources.various.Wrote + ":<br><div class=quote>");
                }
                msg = msg.Replace("[/quote]", "</div>");

                //http
                for (Match m = regexHTTP.Match(msg); m.Success; m = m.NextMatch())
                {
                    msg = msg.Replace(m.Groups[2].ToString(),
                        "<a href=\"" + m.Groups[2].ToString() + "\" target=\"_blank\" rel=\"nofollow\">" + m.Groups[2].ToString() + "</a>");
                }

                //<br>
                msg = msg.Replace("\r\n", "<br/>");

                //smilies
                msg = Utils.Formatting.FormatSmilies(msg);

                return msg;
            }

            //the method formats... argh! see the code, it is self-explainig
            public static string FormatSmilies(string input)
            {
                string msg = input;
                msg = msg.Replace(":)", "<img src=\"images/smilies/smile.gif\" border=0>");
                msg = msg.Replace(";)", "<img src=\"images/smilies/wink.gif\" border=0>");
                msg = msg.Replace(":(", "<img src=\"images/smilies/upset.gif\" border=0>");
                msg = msg.Replace(":beer:", "<img src=\"images/smilies/beer.gif\" border=\"0\" alt=\"beer\" />");
                msg = msg.Replace(":bong:", "<img src=\"images/smilies/bongL3i8.gif\" border=\"0\" alt=\"Bong\" />");
                msg = msg.Replace(":cheers:", "<img src=\"images/smilies/28208052075.gif\" border=\"0\" alt=\"Toast\" />");
                msg = msg.Replace(":coffee:", "<img src=\"images/smilies/coffee26at.gif\" border=\"0\" alt=\"Drink\" />");
                msg = msg.Replace(":drop:", "<img src=\"images/smilies/wiggle.gif\" border=\"0\" alt=\"Wiggle\" />");
                msg = msg.Replace(":gossip:", "<img src=\"images/smilies/5822044956.gif\" border=\"0\" alt=\"Gossip\" />");
                msg = msg.Replace(":popcorn:", "<img src=\"images/smilies/5821542753.gif\" border=\"0\" alt=\"Eat popcorn\" />");
                msg = msg.Replace(":report:", "<img src=\"images/smilies/5822282438.gif\" border=\"0\" alt=\"Read Report\" />");
                msg = msg.Replace(":secret:", "<img src=\"images/smilies/ssst.gif\" border=\"0\" alt=\"Quiet\" />");
                msg = msg.Replace(":sleep:", "<img src=\"images/smilies/27418101277.gif\" border=\"0\" alt=\"Sleepy\" />");
                msg = msg.Replace(":smoke:", "<img src=\"images/smilies/spliff.gif\" border=\"0\" alt=\"Cool Smoke\" />");
                msg = msg.Replace(":sugar:", "<img src=\"images/smilies/5822332967.gif\" border=\"0\" alt=\"Sugar High\" />");
                msg = msg.Replace(":wave:", "<img src=\"images/smilies/wavey.gif\" border=\"0\" alt=\"Wave\" />");
                msg = msg.Replace(":wings:", "<img src=\"images/smilies/angel2.gif\" border=\"0\" alt=\"Angel Wings\" />");
                msg = msg.Replace(":applause:", "<img src=\"images/smilies/32308364851.gif\" border=\"0\" alt=\"Applause\" />");
                msg = msg.Replace(":bow:", "<img src=\"images/smilies/bowdown.gif\" border=\"0\" alt=\"bow\" />");
                msg = msg.Replace(":buddies:", "<img src=\"images/smilies/dri0047.gif\" border=\"0\" alt=\"Buddies\" />");
                msg = msg.Replace(":buttstr:", "<img src=\"images/smilies/5821472746.gif\" border=\"0\" alt=\"Buttstroke\" />");
                msg = msg.Replace(":good:", "<img src=\"images/smilies/goodpost7td.gif\" border=\"0\" alt=\"Good Posting\" />");
                msg = msg.Replace(":iagree:", "<img src=\"images/smilies/iagree.gif\" border=\"0\" alt=\"i agree\" />");
                msg = msg.Replace(":iws:", "<img src=\"images/smilies/stupid.gif\" border=\"0\" alt=\"i'm with stupid\" />");
                msg = msg.Replace(":logic:", "<img src=\"images/smilies/13523300456.gif\" border=\"0\" alt=\"Logic\" />");
                msg = msg.Replace(":pathead:", "<img src=\"images/smilies/pat9xu.gif\" border=\"0\" alt=\"Pat on the head\" />");
                msg = msg.Replace(":thumb:", "<img src=\"images/smilies/thumb.gif\" border=\"0\" alt=\"Thumbs Up\" />");
                msg = msg.Replace(":whs:", "<img src=\"images/smilies/whs0be.gif\" border=\"0\" alt=\"What He Said\" />");
                msg = msg.Replace(":worship:", "<img src=\"images/smilies/worshippy.gif\" border=\"0\" alt=\"worship\" />");
                msg = msg.Replace(":badrazz:", "<img src=\"images/smilies/badrazz.gif\" border=\"0\" alt=\"bad razz\" />");
                msg = msg.Replace(":bang:", "<img src=\"images/smilies/suicide.gif\" border=\"0\" alt=\"Suicide\" />");
                msg = msg.Replace(":blah:", "<img src=\"images/smilies/metallicblue.gif\" border=\"0\" alt=\"blah\" />");
                msg = msg.Replace(":bricks:", "<img src=\"images/smilies/sterb0734ps.gif\" border=\"0\" alt=\"Ton of Bricks\" />");
                msg = msg.Replace(":finger:", "<img src=\"images/smilies/5700274341.gif\" border=\"0\" alt=\"Go ____ yourself\" />");
                msg = msg.Replace(":forkoff:", "<img src=\"images/smilies/fork_off.gif\" border=\"0\" alt=\"Fork Off\" />");
                msg = msg.Replace(":lamer:", "<img src=\"images/smilies/lamer2845nh.gif\" border=\"0\" alt=\"Lamer noob\" />");
                msg = msg.Replace(":mf:", "<img src=\"images/smilies/thefinger.gif\" border=\"0\" alt=\"Middle finger\" />");
                msg = msg.Replace(":nono:", "<img src=\"images/smilies/hsnono.gif\" border=\"0\" alt=\"nono\" />");
                msg = msg.Replace(":owned:", "<img src=\"images/smilies/owned.gif\" border=\"0\" alt=\"Owned\" />");
                msg = msg.Replace(":shakehead:", "<img src=\"images/smilies/shakehead.gif\" border=\"0\" alt=\"shake head\" />");
                msg = msg.Replace(":shutup:", "<img src=\"images/smilies/5822291454.gif\" border=\"0\" alt=\"Shut It\" />");
                msg = msg.Replace(":slap:", "<img src=\"images/smilies/wtcslap.gif\" border=\"0\" alt=\"slap\" />");
                msg = msg.Replace(":smash:", "<img src=\"images/smilies/smash.gif\" border=\"0\" alt=\"Gavel\" />");
                msg = msg.Replace(":thumb-:", "<img src=\"images/smilies/thumbdowncopy1up.gif\" border=\"0\" alt=\"Thumbs Down\" />");
                msg = msg.Replace(":yas:", "<img src=\"images/smilies/urstupid.gif\" border=\"0\" alt=\"You're Stupid\" />");
                msg = msg.Replace(":argue:", "<img src=\"images/smilies/argue.gif\" border=\"0\" alt=\"Argument\" />");
                msg = msg.Replace(":boxer:", "<img src=\"images/smilies/boxer.gif\" border=\"0\" alt=\"boxer\" />");
                msg = msg.Replace(":fencing:", "<img src=\"images/smilies/6804382843.gif\" border=\"0\" alt=\"En Garde!\" />");
                msg = msg.Replace(":flame:", "<img src=\"images/smilies/sterb2457li.gif\" border=\"0\" alt=\"Fart/Flame the noob\" />");
                msg = msg.Replace(":goaway:", "<img src=\"images/smilies/30416221069.gif\" border=\"0\" alt=\"Go Away\" />");
                msg = msg.Replace(":guns:", "<img src=\"images/smilies/sterb1842sg.gif\" border=\"0\" alt=\"Gun\" />");
                msg = msg.Replace(":gunsling:", "<img src=\"images/smilies/sterb1908nd.gif\" border=\"0\" alt=\"Gunslinger\" />");
                msg = msg.Replace(":headbite:", "<img src=\"images/smilies/5122424636.gif\" border=\"0\" alt=\"Bite your head off\" />");
                msg = msg.Replace(":lightsab:", "<img src=\"images/smilies/sterb0298yz.gif\" border=\"0\" alt=\"Darth Lightsabers\" />");
                msg = msg.Replace(":mob:", "<img src=\"images/smilies/5422184119.gif\" border=\"0\" alt=\"Angry Mob\" />");
                msg = msg.Replace(":needmod:", "<img src=\"images/smilies/582145129.gif\" border=\"0\" alt=\"Belittle\" />");
                msg = msg.Replace(":nutkick:", "<img src=\"images/smilies/nutkick5ur.gif\" border=\"0\" alt=\"Nut Kick\" />");
                msg = msg.Replace(":pillow:", "<img src=\"images/smilies/30700402927.gif\" border=\"0\" alt=\"Pillow Fight\" />");
                msg = msg.Replace(":smack:", "<img src=\"images/smilies/5700365222.gif\" border=\"0\" alt=\"Smack!\" />");
                msg = msg.Replace(":stooge:", "<img src=\"images/smilies/sterb1918mv.gif\" border=\"0\" alt=\"3 Stooges\" />");
                msg = msg.Replace(":whack:", "<img src=\"images/smilies/sterb1881bq.gif\" border=\"0\" alt=\"Hammer Time\" />");
                msg = msg.Replace(":wuss:", "<img src=\"images/smilies/5822392499.gif\" border=\"0\" alt=\"Wuss Fight\" />");
                msg = msg.Replace(":blush:", "<img src=\"images/smilies/5821461258.gif\" border=\"0\" alt=\"Blush\" />");
                msg = msg.Replace(":boink:", "<img src=\"images/smilies/boink.gif\" border=\"0\" alt=\"boink\" />");
                msg = msg.Replace(":crazy:", "<img src=\"images/smilies/confused7nt.gif\" border=\"0\" alt=\"Bit Wonky..\" />");
                msg = msg.Replace(":doggystyl:", "<img src=\"images/smilies/xxx.gif\" border=\"0\" alt=\"doggy style\" />");
                msg = msg.Replace(":eek:", "<img src=\"images/smilies/eek.gif\" border=\"0\" alt=\"EEK!\" />");
                msg = msg.Replace(":foilhat:", "<img src=\"images/smilies/tinfoil.gif\" border=\"0\" alt=\"Tin Foil Hat\" />");
                msg = msg.Replace(":gotcha:", "<img src=\"images/smilies/gotcha.gif\" border=\"0\" alt=\"Gotcha!\" />");
                msg = msg.Replace(":greenp:", "<img src=\"images/smilies/crazy3.gif\" border=\"0\" alt=\"Green Tongue\" />");
                msg = msg.Replace(":grngreedy:", "<img src=\"images/smilies/grngreedy.gif\" border=\"0\" alt=\"Greedy Guts\" />");
                msg = msg.Replace(":hahano:", "<img src=\"images/smilies/hahano.gif\" border=\"0\" alt=\"hahano\" />");
                msg = msg.Replace(":ignore:", "<img src=\"images/smilies/ignore.gif\" border=\"0\" alt=\"Ignored\" />");
                msg = msg.Replace(":loo:", "<img src=\"images/smilies/loo.gif\" border=\"0\" alt=\"Loo Flush\" />");
                msg = msg.Replace(":looks:", "<img src=\"images/smilies/spyme.gif\" border=\"0\" alt=\"Creeped out\" />");
                msg = msg.Replace(":menace:", "<img src=\"images/smilies/menacegrin.gif\" border=\"0\" alt=\"Menacing\" />");
                msg = msg.Replace(":omg:", "<img src=\"images/smilies/omg9hi.gif\" border=\"0\" alt=\"OMG\" />");
                msg = msg.Replace(":peace:", "<img src=\"images/smilies/Peace!.gif\" border=\"0\" alt=\"Peace Sign\" />");
                msg = msg.Replace(":poke:", "<img src=\"images/smilies/stickpoke.gif\" border=\"0\" alt=\"poke\" />");
                msg = msg.Replace(":puppy:", "<img src=\"images/smilies/sdb60030.gif\" border=\"0\" alt=\"puppy dog eyes\" />");
                msg = msg.Replace(":rolleyes:", "<img src=\"images/smilies/rolleyes.gif\" border=\"0\" alt=\"Roll Eyes (Sarcastic)\" />");
                msg = msg.Replace(":shocked:", "<img src=\"images/smilies/SHOCKED.gif\" border=\"0\" alt=\"Shock\" />");
                msg = msg.Replace(":sick:", "<img src=\"images/smilies/ill.gif\" border=\"0\" alt=\"Sick\" />");
                msg = msg.Replace(":silly:", "<img src=\"images/smilies/silly.gif\" border=\"0\" alt=\"Goofus\" />");
                msg = msg.Replace(":twitch:", "<img src=\"images/smilies/twitch2.gif\" border=\"0\" alt=\"Twitchy\" />");
                msg = msg.Replace(":/:", "<img src=\"images/smilies/_sure.gif\" border=\"0\" alt=\"Riiiight.\" />");
                msg = msg.Replace(":\\:", "<img src=\"images/smilies/eek7.gif\" border=\"0\" alt=\"Whaaaaa?\" />");
                msg = msg.Replace(":confused:", "<img src=\"images/smilies/confused.gif\" border=\"0\" alt=\"Confused\" />");
                msg = msg.Replace(":doh:", "<img src=\"images/smilies/4915593391.gif\" border=\"0\" alt=\"slap forehead\" />");
                msg = msg.Replace(":duh:", "<img src=\"images/smilies/5700272664.gif\" border=\"0\" alt=\"Duhh\" />");
                msg = msg.Replace(":dunno:", "<img src=\"images/smilies/dunno.gif\" border=\"0\" alt=\"dunno\" />");
                msg = msg.Replace(":headscrat:", "<img src=\"images/smilies/headscratch.gif\" border=\"0\" alt=\"hmm\" />");
                msg = msg.Replace(":nosmile:", "<img src=\"images/smilies/nosmile.gif\" border=\"0\" alt=\"Blank stare\" />");
                msg = msg.Replace(":shrug:", "<img src=\"images/smilies/icon_darin.gif\" border=\"0\" alt=\"shrug\" />");
                msg = msg.Replace(":squint:", "<img src=\"images/smilies/squint.gif\" border=\"0\" alt=\"squint\" />");
                msg = msg.Replace(":werd:", "<img src=\"images/smilies/werd.gif\" border=\"0\" alt=\"werd\" />");
                msg = msg.Replace(":wtf:", "<img src=\"images/smilies/wtf.gif\" border=\"0\" alt=\"wtf\" />");
                msg = msg.Replace(":D", "<img src=\"images/smilies/biggrin.gif\" border=\"0\" alt=\"Big Grin\" />");
                msg = msg.Replace(":fingersx:", "<img src=\"images/smilies/fingersx.gif\" border=\"0\" alt=\"fingers crossed\" />");
                msg = msg.Replace(":gh:", "<img src=\"images/smilies/grouphug.gif\" border=\"0\" alt=\"grouphug\" />");
                msg = msg.Replace(":glomp:", "<img src=\"images/smilies/5822051440.gif\" border=\"0\" alt=\"Glomp, Hi!\" />");
                msg = msg.Replace(":hitit:", "<img src=\"images/smilies/hitit.gif\" border=\"0\" alt=\"hitit\" />");
                msg = msg.Replace(":hug:", "<img src=\"images/smilies/hug.gif\" border=\"0\" alt=\"hug\" />");
                msg = msg.Replace(":inlove:", "<img src=\"images/smilies/5822214714.gif\" border=\"0\" alt=\"In Love\" />");
                msg = msg.Replace(":kissyou:", "<img src=\"images/smilies/kissyou.gif\" border=\"0\" alt=\"Kissing\" />");
                msg = msg.Replace(":naughty:", "<img src=\"images/smilies/naughty.gif\" border=\"0\" alt=\"naughty\" />");
                msg = msg.Replace(":-P", "<img src=\"images/smilies/tongue.gif\" border=\"0\" alt=\"Stick Out Tongue\" />");
                msg = msg.Replace(":woohoo:", "<img src=\"images/smilies/woohoo.gif\" border=\"0\" alt=\"Woo Hoo!\" />");
                msg = msg.Replace(":argh:", "<img src=\"images/smilies/sd3.gif\" border=\"0\" alt=\"RRRGH\" />");
                msg = msg.Replace(":banghead:", "<img src=\"images/smilies/banghead.gif\" border=\"0\" alt=\"Brick Wall\" />");
                msg = msg.Replace(":cry:", "<img src=\"images/smilies/908572171.gif\" border=\"0\" alt=\"Cry\" />");
                msg = msg.Replace(":curse:", "<img src=\"images/smilies/28510172849.gif\" border=\"0\" alt=\"Cursing\" />");
                msg = msg.Replace(":mad:", "<img src=\"images/smilies/po.gif\" border=\"0\" alt=\"Mad\" />");
                msg = msg.Replace(":rant:", "<img src=\"images/smilies/rant2.gif\" border=\"0\" alt=\"rant\" />");
                msg = msg.Replace(":sweat:", "<img src=\"images/smilies/newbluesweatdrop.gif\" border=\"0\" alt=\"Anime Sweat\" />");
                msg = msg.Replace(":hahabow:", "<img src=\"images/smilies/bowrofl.gif\" border=\"0\" alt=\"bowrofl\" />");
                msg = msg.Replace(":hahaha:", "<img src=\"images/smilies/hahaha.gif\" border=\"0\" alt=\"hahaha\" />");
                msg = msg.Replace(":heh_heh:", "<img src=\"images/smilies/heh_heh.gif\" border=\"0\" alt=\"heh heh\" />");
                msg = msg.Replace(":hehe:", "<img src=\"images/smilies/kekekegay.gif\" border=\"0\" alt=\"hehe\" />");
                msg = msg.Replace(":jk:", "<img src=\"images/smilies/5903011026.gif\" border=\"0\" alt=\"Just Kidding\" />");
                msg = msg.Replace(":lolhit:", "<img src=\"images/smilies/5700293539.gif\" border=\"0\" alt=\"lol hit\" />");
                msg = msg.Replace(":rofl:", "<img src=\"images/smilies/laugh.gif\" border=\"0\" alt=\"laugh\" />");
                msg = msg.Replace(":roflmao:", "<img src=\"images/smilies/13501381245.gif\" border=\"0\" alt=\"ROFLMAO\" />");
                msg = msg.Replace(":404:", "<img src=\"images/smilies/404.gif\" border=\"0\" alt=\"Not Found\" />");
                msg = msg.Replace(":abuse:", "<img src=\"images/smilies/28517070443.gif\" border=\"0\" alt=\"S&M Abuse\" />");
                msg = msg.Replace(":damnpc:", "<img src=\"images/smilies/damnpc.gif\" border=\"0\" alt=\"Damn Computer..\" />");
                msg = msg.Replace(":milk:", "<img src=\"images/smilies/milk.gif\" border=\"0\" alt=\"Drink Milk\" />");
                msg = msg.Replace(":skull:", "<img src=\"images/smilies/bgmad.gif\" border=\"0\" alt=\"Skull\" />");
                msg = msg.Replace(":unclesam:", "<img src=\"images/smilies/UNCLESAM.gif\" border=\"0\" alt=\"Uncle Sam\" />");
                msg = msg.Replace(":usa:", "<img src=\"images/smilies/usa.gif\" border=\"0\" alt=\"Yankee\" />");
                msg = msg.Replace(":violin:", "<img src=\"images/smilies/7314474053.gif\" border=\"0\" alt=\"Violin\" />");
                msg = msg.Replace(":dance:", "<img src=\"images/smilies/dance.gif\" border=\"0\" alt=\"Boogy Dance\" />");
                msg = msg.Replace(":dawave:", "<img src=\"images/smilies/dawave.gif\" border=\"0\" alt=\"The Wave\" />");
                msg = msg.Replace(":hb:", "<img src=\"images/smilies/birthday.gif\" border=\"0\" alt=\"happy birthday\" />");
                msg = msg.Replace(":jammin:", "<img src=\"images/smilies/jammin.gif\" border=\"0\" alt=\"Jammin'\" />");
                msg = msg.Replace(":music:", "<img src=\"images/smilies/music-smiley-026.gif\" border=\"0\" alt=\"Rock Band\" />");
                msg = msg.Replace(":party:", "<img src=\"images/smilies/party.gif\" border=\"0\" alt=\"Party\" />");
                msg = msg.Replace(":rockon:", "<img src=\"images/smilies/ylsuper.gif\" border=\"0\" alt=\"rock on\" />");
                msg = msg.Replace(":cool:", "<img src=\"images/smilies/1cool.gif\" border=\"0\" alt=\"Cool\" />");
                msg = msg.Replace(":educated:", "<img src=\"images/smilies/educate.gif\" border=\"0\" alt=\"Educated\" />");
                msg = msg.Replace(":flasher:", "<img src=\"images/smilies/flasher.gif\" border=\"0\" alt=\"Flasher\" />");
                msg = msg.Replace(":froot:", "<img src=\"images/smilies/fruit.gif\" border=\"0\" alt=\"Froot\" />");
                msg = msg.Replace(":king:", "<img src=\"images/smilies/king.gif\" border=\"0\" alt=\"King-dude\" />");
                msg = msg.Replace(":king2:", "<img src=\"images/smilies/knee7rm.gif\" border=\"0\" alt=\"Kneel!\" />");
                msg = msg.Replace(":master:", "<img src=\"images/smilies/overlord.gif\" border=\"0\" alt=\"King-tron\" />");
                msg = msg.Replace(":pimp:", "<img src=\"images/smilies/pimp.gif\" border=\"0\" alt=\"P.I.M.P.\" />");
                msg = msg.Replace(":pirate:", "<img src=\"images/smilies/pir8.gif\" border=\"0\" alt=\"Avast!\" />");
                msg = msg.Replace(":police:", "<img src=\"images/smilies/police.gif\" border=\"0\" alt=\"Police\" />");
                msg = msg.Replace(":spock:", "<img src=\"images/smilies/spock.gif\" border=\"0\" alt=\"Spock\" />");
                msg = msg.Replace(":storm:", "<img src=\"images/smilies/5420285018.gif\" border=\"0\" alt=\"Stormtrooper\" />");
                msg = msg.Replace(":faq:", "<img src=\"images/smilies/faqnice.gif\" border=\"0\" alt=\"FAQ Nice\" />");
                msg = msg.Replace(":google:", "<img src=\"images/smilies/google.gif\" border=\"0\" alt=\"google\" />");
                msg = msg.Replace(":rtfm:", "<img src=\"images/smilies/rtfm.gif\" border=\"0\" alt=\"RTFM\" />");
                msg = msg.Replace(":rulez:", "<img src=\"images/smilies/rulez.gif\" border=\"0\" alt=\"Rulez Nice\" />");
                msg = msg.Replace(":wiki:", "<img src=\"images/smilies/wiki.gif\" border=\"0\" alt=\"Wikipedia\" />");
                msg = msg.Replace(":banhim:", "<img src=\"images/smilies/banhim.gif\" border=\"0\" alt=\"banhim\" />");
                msg = msg.Replace(":banned:", "<img src=\"images/smilies/banned.gif\" border=\"0\" alt=\"Ban Stamp\" />");
                msg = msg.Replace(":bump:", "<img src=\"images/smilies/bump.gif\" border=\"0\" alt=\"Bump\" />");
                msg = msg.Replace(":double:", "<img src=\"images/smilies/dbl.gif\" border=\"0\" alt=\"Double Thread/Post\" />");
                msg = msg.Replace(":edit:", "<img src=\"images/smilies/edited.gif\" border=\"0\" alt=\"Edit\" />");
                msg = msg.Replace(":feedback:", "<img src=\"images/smilies/feedback.gif\" border=\"0\" alt=\"Feedback Requested\" />");
                msg = msg.Replace(":flogging:", "<img src=\"images/smilies/flogging.gif\" border=\"0\" alt=\"Flog dead topic\" />");
                msg = msg.Replace(":hijack:", "<img src=\"images/smilies/threadjacked.gif\" border=\"0\" alt=\"Thread Hijack!\" />");
                msg = msg.Replace(":locked:", "<img src=\"images/smilies/lockd.gif\" border=\"0\" alt=\"lockd\" />");
                msg = msg.Replace(":mods:", "<img src=\"images/smilies/7309300734.gif\" border=\"0\" alt=\"Beware of the Mods...they come in the Niiiiiiight!\" />");
                msg = msg.Replace(":offtopic:", "<img src=\"images/smilies/offtopic.gif\" border=\"0\" alt=\"Off Topic\" />");
                msg = msg.Replace(":ontopic:", "<img src=\"images/smilies/ontopic.gif\" border=\"0\" alt=\"On Topic\" />");
                msg = msg.Replace(":qfe:", "<img src=\"images/smilies/qfe.gif\" border=\"0\" alt=\"Quoted For Emphasis\" />");
                msg = msg.Replace(":repost:", "<img src=\"images/smilies/repost.gif\" border=\"0\" alt=\"repost\" />");
                msg = msg.Replace(":spam:", "<img src=\"images/smilies/spam4ot.gif\" border=\"0\" alt=\"Spam Alert!\" />");
                msg = msg.Replace(":spamkill:", "<img src=\"images/smilies/4913420063.gif\" border=\"0\" alt=\"Die die die!\" />");
                return msg;
            }

            public static string FilterBadWords(string input)
            {
                if (ConfigurationManager.AppSettings["BadWords"] == null) return input;

                string retVal = input;
                string[] badWords = ConfigurationManager.AppSettings["BadWords"].Split(';');
                foreach (string bw in badWords)
                {
                    if (bw != null)
                    {
                        string tbw = bw.Trim();
                        if (tbw.Length > 0)
                            retVal = Regex.Replace(retVal, tbw, new string('*', tbw.Length), RegexOptions.IgnoreCase);
                    }
                }
                return retVal;
            }
        }
    }



}

namespace Resources
{
    using System;


    /// <summary>
    ///   A strongly-typed resource class, for looking up localized strings, etc.
    /// </summary>
    // This class was auto-generated by the StronglyTypedResourceBuilder
    // class via a tool like ResGen or Visual Studio.
    // To add or remove a member, edit your .ResX file then rerun ResGen
    // with the /str option or rebuild the Visual Studio project.
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.VisualStudio.Web.Application.StronglyTypedResourceProxyBuilder", "9.0.0.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    internal class various
    {

        private static global::System.Resources.ResourceManager resourceMan;

        private static global::System.Globalization.CultureInfo resourceCulture;

        [global::System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")]
        internal various()
        {
        }

        /// <summary>
        ///   Returns the cached ResourceManager instance used by this class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        internal static global::System.Resources.ResourceManager ResourceManager
        {
            get
            {
                if (object.ReferenceEquals(resourceMan, null))
                {
                    global::System.Resources.ResourceManager temp = new global::System.Resources.ResourceManager("Resources.various", global::System.Reflection.Assembly.Load("App_GlobalResources"));
                    resourceMan = temp;
                }
                return resourceMan;
            }
        }

        /// <summary>
        ///   Overrides the current thread's CurrentUICulture property for all
        ///   resource lookups using this strongly typed resource class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        internal static global::System.Globalization.CultureInfo Culture
        {
            get
            {
                return resourceCulture;
            }
            set
            {
                resourceCulture = value;
            }
        }

        /// <summary>
        ///   Looks up a localized string similar to Please verify your forum registration by clicking the link below..
        /// </summary>
        internal static string ActivationEmailBody
        {
            get
            {
                return ResourceManager.GetString("ActivationEmailBody", resourceCulture);
            }
        }

        /// <summary>
        ///   Looks up a localized string similar to Activate your membership..
        /// </summary>
        internal static string ActivationEmailSubject
        {
            get
            {
                return ResourceManager.GetString("ActivationEmailSubject", resourceCulture);
            }
        }

        /// <summary>
        ///   Looks up a localized string similar to Guest.
        /// </summary>
        internal static string Guest
        {
            get
            {
                return ResourceManager.GetString("Guest", resourceCulture);
            }
        }

        /// <summary>
        ///   Looks up a localized string similar to You have new personal message(s).
        ///
        ///To view the updates visit.
        /// </summary>
        internal static string NewPersonalEmailBody
        {
            get
            {
                return ResourceManager.GetString("NewPersonalEmailBody", resourceCulture);
            }
        }

        /// <summary>
        ///   Looks up a localized string similar to Forum notification. New personal message..
        /// </summary>
        internal static string NewPersonalSubject
        {
            get
            {
                return ResourceManager.GetString("NewPersonalSubject", resourceCulture);
            }
        }

        /// <summary>
        ///   Looks up a localized string similar to You are subscribed to a forum, a new topic is created.
        ///
        ///To view the updates visit.
        /// </summary>
        internal static string NewThreadEmailBody
        {
            get
            {
                return ResourceManager.GetString("NewThreadEmailBody", resourceCulture);
            }
        }

        /// <summary>
        ///   Looks up a localized string similar to Forum notification. New topic in a forum..
        /// </summary>
        internal static string NewThreadEmailSubject
        {
            get
            {
                return ResourceManager.GetString("NewThreadEmailSubject", resourceCulture);
            }
        }

        /// <summary>
        ///   Looks up a localized string similar to Posts.
        /// </summary>
        internal static string Posts
        {
            get
            {
                return ResourceManager.GetString("Posts", resourceCulture);
            }
        }

        /// <summary>
        ///   Looks up a localized string similar to You are subscribed to a discussion thread, which has been updated.
        ///
        ///To view the updates visit.
        /// </summary>
        internal static string ThreadUpdatedEmailBody
        {
            get
            {
                return ResourceManager.GetString("ThreadUpdatedEmailBody", resourceCulture);
            }
        }

        /// <summary>
        ///   Looks up a localized string similar to Forum notification. Thread updated..
        /// </summary>
        internal static string ThreadUpdatedEmailSubject
        {
            get
            {
                return ResourceManager.GetString("ThreadUpdatedEmailSubject", resourceCulture);
            }
        }

        /// <summary>
        ///   Looks up a localized string similar to Welcome to the forums.
        /// </summary>
        internal static string WelcomeEmailBody
        {
            get
            {
                return ResourceManager.GetString("WelcomeEmailBody", resourceCulture);
            }
        }

        /// <summary>
        ///   Looks up a localized string similar to Welcome to our forums. Your account have been activated, please feel free to visit the forum:.
        /// </summary>
        internal static string WelcomeEmailSubject
        {
            get
            {
                return ResourceManager.GetString("WelcomeEmailSubject", resourceCulture);
            }
        }

        /// <summary>
        ///   Looks up a localized string similar to wrote.
        /// </summary>
        internal static string Wrote
        {
            get
            {
                return ResourceManager.GetString("Wrote", resourceCulture);
            }
        }
    }
}


