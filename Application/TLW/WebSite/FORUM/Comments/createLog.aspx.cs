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
 
/*namespace aspnetforum*/
/*{*/
/// <summary>
/// Summary description for editprofile.
/// </summary>
//public partial class logs : ForumPage   Commented by Netsmartz for resolving compile time issues
public partial class createLog : aspnetforum.ForumPage
{

    SqlConnClass objSqlConnClass = new SqlConnClass();
    UserActivityClass objUserActivityClass;

    int _maxAvatarFileSize;
    bool _bAvatarsEnabled;
    int _maxAvatarPictureSize;
    int _editedUserID = 0;
    int DATE_SPAN = 1;
    string gsDateFrom = "";


    protected void Page_Load(object sender, System.EventArgs e)
    {

        objUserActivityClass = new UserActivityClass(objSqlConnClass.OpenConnection());
        //  lblResult.Text = ""; //reset the result text

        //if "integrated auth" is on then lets HIDE the "change password" area
        //if (ConfigurationManager.AppSettings["IntegratedAuthentication"] != null
        //    && ConfigurationManager.AppSettings["IntegratedAuthentication"].ToLower() == "true")
        //{
        //   tblChangePsw.Visible = false;
        // tbUsername.ReadOnly = true;
        //}
        /*
        //if we're editing someone else's profile
        if (Request.QueryString["userid"] != null)
        {
            btnChangePsw.Enabled = false;
            if (IsAdministrator)
                _editedUserID = int.Parse(Request.QueryString["userid"]);
            else
                _editedUserID = 0;
        }
        else
        {
            _editedUserID = CurrentUserID;
        }

        if (_editedUserID == 0) //no user to edit
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
        }
         * */




    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillOutForm();
            fillDropDowns();
        }
    }
    private void fillDropDowns()
    {
        ListItem li = new ListItem();
        li.Text = "-Select Time-";
        li.Value = "0";//needs a value or will get deleted after DataBind()
        ddlTime.Items.Add(li);
        ddlTime.AppendDataBoundItems = true;//append the DataBind() without deleting

        ddlTime.DataSource = objUserActivityClass.GET_Items_AnyItemTable("Time", "LIST_PHYSICAL_ACTIVITY_LOG");
        ddlTime.DataTextField = "ITEM_TEXT";
        ddlTime.DataValueField = "ITEM_ID";
        ddlTime.DataBind();


        ListItem li2 = new ListItem();
        li2.Text = "-Select Duration-";
        li2.Value = "0";//needs a value or will get deleted after DataBind()
        ddlDuration.Items.Add(li2);
        ddlDuration.AppendDataBoundItems = true;//append the DataBind() without deleting

        ddlDuration.DataSource = objUserActivityClass.GET_Items_AnyItemTable("Duration", "LIST_PHYSICAL_ACTIVITY_LOG");
        ddlDuration.DataTextField = "ITEM_TEXT";
        ddlDuration.DataValueField = "ITEM_ID";
        ddlDuration.DataBind();


        ListItem li3 = new ListItem();
        li3.Text = "-Select Level-";
        li3.Value = "0";//needs a value or will get deleted after DataBind()
        ddlLevel.Items.Add(li3);
        ddlLevel.AppendDataBoundItems = true;//append the DataBind() without deleting

        ddlLevel.DataSource = objUserActivityClass.GET_Items_AnyItemTable("Activity_Level", "LIST_PHYSICAL_ACTIVITY_LOG");
        ddlLevel.DataTextField = "ITEM_TEXT";
        ddlLevel.DataValueField = "ITEM_ID";
        ddlLevel.DataBind();

    }
    private void fillOutForm()
    {
        /*rdpFrom.SelectedDate = DateTime.Now.Subtract(TimeSpan.FromDays(DATE_SPAN));  Commented by Netsmartz for resolving compile time issues*/

        fillFields();
    }


    private void fillFields()
    {

        //gsDateFrom = rdpFrom.SelectedDate.ToString();
    }



    protected void btnSave_Click(object sender, System.EventArgs e)
    {
        /*string sDate = rdpFrom.SelectedDate.ToString(); Commented by Netsmartz for resolving compile time issues*/
        string sTime = ddlTime.SelectedValue;
        string sDuration = ddlDuration.SelectedValue;
        string sLevel = ddlLevel.SelectedValue;
        string sComment = tbComment.Text;

        /*objUserActivityClass.INSERT_LOG_PHYSICAL_ACTIVITY(CurrentUserID.ToString(), sTime, sDuration, sLevel, sComment, sDate);
        this.Close(); Commented by Netsmartz for resolving compile time issues*/

    }

}
/*}*/
