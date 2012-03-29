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
public partial class logs : aspnetforum.ForumPage
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
        }
    }



    private void fillDropDowns()
    {
        ListItem li = new ListItem();
        li.Text = "-Select Time-";
        li.Value = "0";//needs a value or will get deleted after DataBind()
        ddlTime.Items.Add(li);
        ddlTime.AppendDataBoundItems = true;//append the DataBind() without deleting



        ddlTime.DataSource = objUserActivityClass.GET_Items_AnyItemTable("Time", "LIST_PAL");
        ddlTime.DataTextField = "ITEM_TEXT";
        ddlTime.DataValueField = "ITEM_ID";
        ddlTime.DataBind();


        ListItem li2 = new ListItem();
        li2.Text = "-Select Duration-";
        li2.Value = "0";//needs a value or will get deleted after DataBind()
        ddlDuration.Items.Add(li2);
        ddlDuration.AppendDataBoundItems = true;//append the DataBind() without deleting

        ddlDuration.DataSource = objUserActivityClass.GET_Items_AnyItemTable("Duration", "LIST_PAL");
        ddlDuration.DataTextField = "ITEM_TEXT";
        ddlDuration.DataValueField = "ITEM_ID";
        ddlDuration.DataBind();


        ListItem li3 = new ListItem();
        li3.Text = "-Select Level-";
        li3.Value = "0";//needs a value or will get deleted after DataBind()
        ddlLevel.Items.Add(li3);
        ddlLevel.AppendDataBoundItems = true;//append the DataBind() without deleting

        ddlLevel.DataSource = objUserActivityClass.GET_Items_AnyItemTable("Level", "LIST_PAL");
        ddlLevel.DataTextField = "ITEM_TEXT";
        ddlLevel.DataValueField = "ITEM_ID";
        ddlLevel.DataBind();

    }
    private void fillOutForm()
    {
        ContentPlaceHolder cph = (ContentPlaceHolder)Master.FindControl("AspNetForumContentPlaceHolder");

        //  Master.FindControl

        //   rdpFrom.SelectedDate = DateTime.Now.Subtract(TimeSpan.FromDays(DATE_SPAN));
        /*
        DataSet DS = new DataSet();
        DS = objUserActivityClass.GET_LogPhysicalActivity_BY_UserId(CurrentUserID.ToString(),"","");
        int iLength = DS.Tables[0].Rows.Count;
        string UCName = "";

        Response.Write("CurrentUserID.ToString():  " + CurrentUserID.ToString());
        Response.Write("DS.Tables[0].Rows.Count:  " + DS.Tables[0].Rows.Count.ToString());
        for(int i = 0; i < iLength; i++)
        {
            UC_PAL_EntryView UC_PAL = (UC_PAL_EntryView)cph.FindControl("UC_PAL_View" + (i + 1).ToString());
            UC_PAL.LOGID = DS.Tables[0].Rows[i]["LOG_ID"].ToString();
        }


        if (iLength < 10)
        {
            for (int i = iLength+1; i < 11; i++)
            {
                UC_PAL_EntryView UC_PAL = (UC_PAL_EntryView)cph.FindControl("UC_PAL_View" + i.ToString());
                UC_PAL.VISIBLE = false;
                //UC_PAL//.LOGID = DS.Tables[0].Rows[i]["LOG_ID"].ToString();
            }
        }


        Raddatepicker1.SelectedDate = DateTime.Now.Subtract(TimeSpan.FromDays(DATE_SPAN));
        */
        fillDropDowns();
    }




    protected void btnSave_Click(object sender, System.EventArgs e)
    {
        /* string sDate = Raddatepicker1.SelectedDate.ToString();Commented by Netsmartz for resolving compile time issues*/
        string sTime = ddlTime.SelectedValue;
        string sDuration = ddlDuration.SelectedValue;
        string sLevel = ddlLevel.SelectedValue;
        string sComment = tbComment.Text;

        // objUserActivityClass.INSERT_LOG_PHYSICAL_ACTIVITY(CurrentUserID.ToString(), sTime, sDuration, sLevel, sComment, sDate);
        // Response.Redirect("logs.aspx");

    }


}