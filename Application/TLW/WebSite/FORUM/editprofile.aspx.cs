using System;
using System.Collections;
using System.Configuration;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.Common;
using System.IO;

	/// <summary>
	/// Summary description for editprofile.
	/// </summary>
	public partial class editprofile : aspnetforum.ForumPage
	{
        int _maxAvatarFileSize;
        bool _bAvatarsEnabled;
        int _maxAvatarPictureSize;
        string _editedUserID = "";

        protected void Page_Load(object sender, System.EventArgs e)
        {
            lblResult.Text = ""; //reset the result text

            //if "integrated auth" is on then lets HIDE the "change password" area
            if (ConfigurationManager.AppSettings["IntegratedAuthentication"] != null
                && ConfigurationManager.AppSettings["IntegratedAuthentication"].ToLower() == "true")
            {
                tblChangePsw.Visible = false;
                tbUsername.ReadOnly = true;
            }

            //if we're editing someone else's profile
            if (Request.QueryString["userid"] != null)
            {
                btnChangePsw.Enabled = false;
                if (IsAdministrator)
                    _editedUserID = Request.QueryString["userid"].ToString();
                else
                    _editedUserID = "";
            }
            else
            {
                _editedUserID = CurrentUserID;
            }

            if (_editedUserID == "") //no user to edit
            {
                lblNotLoggedIn.Visible = true;
                divMain.Visible = false;
            }
            else
            {
                lblNotLoggedIn.Visible = false;
                divMain.Visible = true;
                _bAvatarsEnabled = (ConfigurationManager.AppSettings["EnableAvatars"].ToLower() == "true");
                tblAvatar.Visible = _bAvatarsEnabled;

                if (_bAvatarsEnabled)
                {
                    _maxAvatarFileSize = int.Parse(ConfigurationManager.AppSettings["MaxAvatarFileSizeInBytes"]);
                    _maxAvatarPictureSize = int.Parse(ConfigurationManager.AppSettings["MaxAvatarWidthHeight"]);
                    lblMaxSize.Text = _maxAvatarFileSize.ToString();
                    lblMaxDimenstions.Text = string.Format("{0}x{1}", _maxAvatarPictureSize, _maxAvatarPictureSize);
                }

                if (!IsPostBack)
                    ShowUserInfo();
            }
        }

		private void ShowUserInfo()
		{
			this.cmd.CommandText = "SELECT * FROM ForumUsers WHERE UserID='" + _editedUserID + "'";
			this.cn.Open();
			DbDataReader dr = this.cmd.ExecuteReader();
			if(dr.Read())
			{
				tbUsername.Text = dr["Username"].ToString();
				tbEmail.Text = dr["Email"].ToString();
				tbHomepage.Text = dr["Homepage"].ToString();
				tbInterests.Text = dr["Interests"].ToString();
                tbSignature.Text = dr["Signature"].ToString();

                //avatar
                string avatarPic = dr["AvatarFileName"].ToString();
                if (_bAvatarsEnabled && avatarPic != "")
                {
                    imgAvatar.Visible = true;
                    imgAvatar.Src = "upload/" + avatarPic;
                }
                else
                {
                    imgAvatar.Visible = false;
                }
			}
			dr.Close();
			this.cn.Close();
		}

		protected void btnSave_Click(object sender, System.EventArgs e)
		{
            //check is a user tries to change his username but IntegratedAuth is ON
            if (ConfigurationManager.AppSettings["IntegratedAuthentication"] != null
                && ConfigurationManager.AppSettings["IntegratedAuthentication"].ToLower() == "true"
                && _editedUserID == CurrentUserID
                && tbUsername.Text != Session["aspnetforumUserName"].ToString())
            {
                lblResult.Text = "Users are not allowed to change theirs usernames when Integrated authentication is ON";
                return;
            }

            //check username uniqueness
            this.cmd.CommandText = "SELECT UserID FROM ForumUsers WHERE UserName=? AND UserID<>convert(uniqueidentifier, ?)";
            aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, tbUsername.Text, _editedUserID);
			cn.Open();
            object res = this.cmd.ExecuteScalar();
			if(res!=null)
			{
				cn.Close();
				lblResult.Text = "User <b>" + tbUsername.Text + "</b> allready exists.";
				return;
			}

            //remove html tags from signature
            string signature = tbSignature.Text.Trim();
            signature.Replace("<", "&lt;").Replace(">", "&gt;");
            signature = (signature.Length > 1000 ? signature.Substring(0, 1000) : signature);

            //update settings
            this.cmd.CommandText = "UPDATE ForumUsers SET UserName=?, Email=?, Homepage=?, Interests=?, Signature=? WHERE UserID=convert(uniqueidentifier, ?)";
            aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, tbUsername.Text, tbEmail.Text, tbHomepage.Text, tbInterests.Text, signature, _editedUserID);
			this.cmd.ExecuteNonQuery();
			this.cn.Close();

			if(_editedUserID==CurrentUserID) Session["aspnetforumUserName"] = tbUsername.Text;
			lblResult.Text = "Profile saved";
		}

		protected void btnChangePsw_Click(object sender, System.EventArgs e)
		{
            if (tbNewPsw1.Text != "" && tbNewPsw2.Text != "" && tbNewPsw1.Text == tbNewPsw2.Text)
            {
                this.cmd.CommandText = "SELECT UserID FROM ForumUsers WHERE (Password=? OR Password=?) AND UserID=convert(uniqueidentifier, ?)";
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, tbOldPsw.Text, aspnetforum.Password.CalculateMD5Hash(tbOldPsw.Text), _editedUserID);
                this.cn.Open();
                if (this.cmd.ExecuteScalar() != null)
                {
                    this.cmd.CommandText = "UPDATE ForumUsers SET [Password]=? WHERE UserID=convert(uniqueidentifier, ?)";
                    aspnetforum.Utils.DB.PrepareCommandText(ref cmd);
                    aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, aspnetforum.Password.CalculateMD5Hash(tbNewPsw1.Text), _editedUserID);
                    this.cmd.ExecuteNonQuery();
                    lblResult.Text = "Password changed";
                }
                else
                {
                    lblResult.Text = "Password was NOT Changed! Please specify the correct values.";
                }
                this.cn.Close();
            }
            else
            {
                lblResult.Text = "Password was NOT Changed! Please specify the correct values.";
            }
		}

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string uploadDir = Page.MapPath("upload");

            //delete previous avatar if exists
            cmd.CommandText = "SELECT AvatarFileName FROM ForumUsers WHERE UserID=convert(uniqueidentifier, ?)";
            aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, _editedUserID);
            cn.Open();
            object res = cmd.ExecuteScalar();
            if (res != null && res.ToString() != "")
            {
                if (File.Exists(uploadDir + "\\" + res.ToString()))
                {
                    File.Delete(uploadDir + "\\" + res.ToString());
                }
                cmd.CommandText = "UPDATE ForumUsers SET AvatarFileName=NULL WHERE UserID=convert(uniqueidentifier, ?)";
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, _editedUserID);
                cmd.ExecuteNonQuery();
            }
            cn.Close();

            //now adding a new avatar
            string shortname = avatarUpload.PostedFile.FileName;
            if (shortname != "")
            {
                if (avatarUpload.PostedFile.ContentLength > _maxAvatarFileSize)
                {
                    //file is too big
                    lblResult.Text = "Avatar file size is too big";
                    return;
                }
                shortname = shortname.Substring(shortname.LastIndexOf("\\") + 1);

                //rename if the file already exists
                int i = 0;
                while(File.Exists(uploadDir + "\\" + shortname))
                {
                    i = i + 1;
                    int dotPos = shortname.LastIndexOf(".");
                    string namewithoutext = shortname.Substring(0, dotPos);
                    string ext = shortname.Substring(dotPos + 1);
                    shortname = namewithoutext + "[" + i + "]." + ext;
                }

                //check picture
                Bitmap bmp;
                try
                {
                    bmp = new Bitmap(avatarUpload.PostedFile.InputStream);
                }
                catch
                {
                    //is't not a picture
                    lblResult.Text = "Not a picture file";
                    return;
                }
                if (bmp.Width > _maxAvatarPictureSize || bmp.Height > _maxAvatarPictureSize)
                {
                    //the picture is too big
                    lblResult.Text = "Picture dimensions are too big";
                    return;
                }

                avatarUpload.PostedFile.SaveAs(uploadDir + "\\" + shortname);
                this.cmd.CommandText = "UPDATE ForumUsers SET AvatarFileName=? WHERE UserID=convert(uniqueidentifier, ?)";
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, shortname, _editedUserID);
                this.cn.Open();
                this.cmd.ExecuteNonQuery();
                this.cn.Close();
            }

            //refresh avatar pic
            ShowUserInfo();
        }
	}