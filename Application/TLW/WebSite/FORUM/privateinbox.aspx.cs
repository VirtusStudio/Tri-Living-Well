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
using System.Data.Common;
/*using Telerik.WebControls;  Commented by Netsmartz for resolving compile time issues*/


	/// <summary>
	/// Summary description for privatemessages.
	/// </summary>
	public partial class privateinbox : aspnetforum.ForumPage
	{

        SqlConnClass objSqlConnClass = new SqlConnClass();
        ForumClass objForumClass;



        protected string pagerString = "";

		protected void Page_Load(object sender, System.EventArgs e)
        {
           
            if (CurrentUserID == "")
            {
                lblNotLoggedIn.Visible = true;
            }
            else
            {
                lblNotLoggedIn.Visible = false;
            }

            objForumClass = new ForumClass(objSqlConnClass.OpenConnection());

		}

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillGrids();
                /*   RadGrid1.DataBind(); Commented by Netsmartz for resolving compile time issues*/

                   //cn.Open();
                   //MarkAllAsRead();
                   //cn.Close();
               }
           }

           private void MarkAllAsRead()
           {
               this.cmd.CommandText = "UPDATE ForumPersonalMessages SET New=? WHERE ToUserID='" + CurrentUserID + "'";
               aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, false);
               this.cmd.ExecuteNonQuery();
           }

           private void fillGrids()
           {
               try
               {
                   string sCommandText = "Select FPM.* , FU.*, ";
                   sCommandText = sCommandText + " NewMessageCount = (select count(*) from ForumPersonalMessages where MessageGroupID = FPM.MessageGroupID and New=1 and ToUserID='" + CurrentUserID + "')";
                   sCommandText = sCommandText + " FROM ForumPersonalMessages FPM INNER JOIN ForumPersonalMessages FPM2 ON FPM2.MessageID = FPM.MessageID";
                   sCommandText = sCommandText + " INNER JOIN ForumUsers FU ON (FU.UserID = FPM.FromUserID or FU.UserID = FPM.FromUserID)";
                   sCommandText = sCommandText + " WHERE (FPM.ToUserID='" + CurrentUserID + "' or FPM.FromUserID='" + CurrentUserID + "') and FPM.ArchiveFlg = 0 and ";
                   sCommandText = sCommandText + " FPM.MessageID = (SELECT MIN(MessageID) from ForumPersonalMessages where MessageGroupID = FPM.MessageGroupID)";
                   sCommandText = sCommandText + " order by NewMessageCount DESC, FPM.CreationDate DESC";

                   this.cmd.CommandText = sCommandText;
                   DbDataAdapter da = providerFactory.CreateDataAdapter();
                   da.SelectCommand = this.cmd;
                   DataTable dt = new DataTable();
                   da.Fill(dt);
               }
               catch { }
             /*  RadGrid1.DataSource = dt; Commented by Netsmartz for resolving compile time issues*/
            
               //Response.Write(sCommandText);
           }
        /* Commented by Netsmartz for resolving compile time issues
           protected void RadGrid1_NeedDataSource(object source, GridNeedDataSourceEventArgs e)
           {
               if (IsPostBack)
               {
                   fillGrids();
               }
           }
           protected void RadGrid1_DetailTableDataBind(object source, Telerik.WebControls.GridDetailTableDataBindEventArgs e)
           {
               GridDataItem parentItem = (GridDataItem)e.DetailTableView.ParentItem;
               // if more than two hierarchical levels, can determine which we are dealing by setting a unique 'datamember' on asp side, and checking it's value here
               //eg:::: if (e.DetailTableView.DataMember == "Purchases")
               //e.DetailTableView.Name
               string sMessageGroupID = parentItem.GetDataKeyValue("MessageGroupID").ToString();
               this.cmd.CommandText = "SELECT ForumPersonalMessages.*, ForumUsers.UserName, ForumUsers.Signature, ForumUsers.UserID FROM ForumPersonalMessages INNER JOIN ForumUsers ON ForumPersonalMessages.FromUserID=ForumUsers.UserID WHERE MessageGroupID =" + sMessageGroupID + " ORDER BY ForumPersonalMessages.CreationDate ASC";
               DbDataAdapter da = providerFactory.CreateDataAdapter();
               da.SelectCommand = this.cmd;
               DataTable dt = new DataTable();

         
               da.Fill(dt);
               e.DetailTableView.DataSource = dt;

               cn.Open();
               this.cmd.CommandText = "UPDATE ForumPersonalMessages SET New=? WHERE ToUserID='" + CurrentUserID + "' and MessageGroupID =" + sMessageGroupID;
               aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, false);
               this.cmd.ExecuteNonQuery();
               cn.Close();
           }
          
            protected void RadGrid1_DetailTableDataBound(object source, GridItemEventArgs e)
           {
               if (e.Item is GridDataItem)
               {*/
                   /*
                   GridDataItem gridItem = (GridDataItem)e.Item;
                   GridTFoot GF = 
                   MessageGroupID = (TextBox)GFI.FindControl("MessageGroupID");
                   MessageGroupID.Text = gridItem.GetDataKeyValue("MessageGroupID").ToString();
                   TextBox UserID = (TextBox)GFI.FindControl("UserID");
                   if ( Convert.ToInt32(gridItem.GetDataKeyValue("FromUserID")) == CurrentUserID)
                   {
                       UserID.Text = gridItem.GetDataKeyValue("ToUserID").ToString();
                   }
                       else
                   {

                       UserID.Text = gridItem.GetDataKeyValue("FromUserID").ToString();
                      //<input id="MessageGroupID" type="text" runat="server" />
                      //<input id="UserID" type="text" runat="server" />
                    
                   }
                   */
          /* Commented by Netsmartz for resolving compile time issues  }

        }*/

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            string strReply = "ert";//tbReply.text;

            this.cn.Open();
            this.cmd.CommandText = "INSERT INTO ForumPersonalMessages (MessageGroupID, FromUserID, ToUserID, Body, CreationDate) VALUES (?, ?, ?, ?, ?)";
            //Utils.DB.FillCommandParamaters(MessageGroupID, CurrentUserID, UserID, strReply, Utils.GetCurrTime());
            this.cmd.ExecuteNonQuery();
            this.cn.Close();
        }

        protected void btnSaveComment_Click(object sender, EventArgs e)
        {
            string sMessage = txtComment.Text;
            string sMessageGroupID = MessageGroupID.Value;
            string sFromUserID = FromUserID.Value;
            string sToUserID = ToUserID.Value;

            this.cn.Open();
            this.cmd.CommandText = "INSERT INTO ForumPersonalMessages (MessageGroupID, FromUserID, ToUserID, Subject, Body, CreationDate, New, ArchiveFlg ) VALUES (?, ?, ?, ?, ? , ?, 1, 0)";

            if (CurrentUserID.ToString() == sFromUserID)
            {
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, sMessageGroupID, CurrentUserID, sToUserID, "", sMessage, aspnetforum.Utils.GetCurrTime());
            }
            else
            {
                aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, sMessageGroupID, CurrentUserID, sFromUserID, "", sMessage, aspnetforum.Utils.GetCurrTime());
            }
            this.cmd.ExecuteNonQuery();
            this.cn.Close();
            Response.Redirect("privateinbox.aspx");

        }
        protected void btnArchiveMessages_Click(object sender, EventArgs e)
        {
            string sMessageGroupID = MessageGroupID.Value;


            cn.Open();
            this.cmd.CommandText = "UPDATE ForumPersonalMessages SET New=? WHERE ToUserID='" + CurrentUserID + "' and MessageGroupID =" + sMessageGroupID;
            aspnetforum.Utils.DB.FillCommandParamaters(ref cmd, false);
            this.cmd.ExecuteNonQuery();
            cn.Close();
            

            objForumClass.Fum_UPDATE_ForumPersonalMessages_BY_MessageGroupID(sMessageGroupID, "1");

            Response.Redirect("privateinbox.aspx");

        }
}
