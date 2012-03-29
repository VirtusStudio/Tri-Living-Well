//###########################################################//
//    Copyright 2007 Blue Grotto Technologies, Inc.          //
//    This code is owned by Blue Grotto Technologies, Inc    //
//    It may not be copied, shared or modified.              //
//###########################################################//
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

public partial class Administrator_UserUtilities_LoadUsers : System.Web.UI.Page
{
    SqlConnClass objSqlConnClass = new SqlConnClass();
    BackofficeClass objBackOfficeClass;
    DataSet DS = new DataSet();
    Label lbl_error;

    protected void Page_Load(object sender, EventArgs e)
    {
        objBackOfficeClass = new BackofficeClass(objSqlConnClass.OpenConnection());
    }

   
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillOutForm();
        }
        objSqlConnClass.CloseConnection();
    }

    private void fillOutForm()
    {

//        int cnt = DS.Tables[0].Rows.Count;


    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string sUserName;
    /* Commented by Netsmartz for resolving compile time issues
      DS = objBackOfficeClass.Mem_GET_UserInfoRaw();*/
        DataSet DS = new DataSet(); /*   line added by Netsmartz for resolving compile time issues */
        sUserName = string.Empty;

        if (DS.Tables.Count > 0)
        {
            // got some data
            foreach ( DataRow dRow in DS.Tables[0].Rows)
            {
                // add the user to membership
                try 
                {
                    sUserName = dRow["email"].ToString().Trim();
                    if (!Membership.ValidateUser(sUserName, "samsung1"))
                    {
                        Membership.CreateUser(sUserName, "samsung1", sUserName);
                    }

                    // do the rest
                    AddTheRestInfo(dRow, sUserName);

                }
                catch (Exception ex)
                {
                    Response.Write("<br/>error adding mmbr:" + sUserName + "-"+ ex.Message);
                  //  lbl_error.Text = "error adding mmbr:" + MembershipCreateStatus;
                }
            }
        }
        lbl_Error.Text = "Accounts created successfully";

    }


    private void AddTheRestInfo(DataRow Row, string sUserName)
    {
        // bring in the trimmed version of username
        try
        {

            MembershipUser user = Membership.GetUser(sUserName);
            if (!Roles.IsUserInRole(sUserName,"User"))
            {
                 Roles.AddUserToRole(sUserName, "User");
            }
            //////////////////////////////////////////////////////////////////////
            //Defining and Assigning the objects for all Extra Information 
            //////////////////////////////////////////////////////////////////////
            //Assiging the parameters array
            string[] parameters = new string[19];
            parameters[0] = sUserName;
            parameters[1] = Row["FNAME"].ToString();
            parameters[2] = ""; // mname
            parameters[3] = Row["LNAME"].ToString();
            parameters[4] = Row["ADDRESS1"].ToString();
            parameters[5] = Row["ADDRESS2"].ToString();
            parameters[6] = Row["CITY"].ToString();
            parameters[7] = Row["STATE_ID"].ToString();
            parameters[8] = Row["ZIP"].ToString();
            parameters[9] = "USA";
            parameters[10] = Row["PHONE"].ToString();
            parameters[10] = Row["PHONE"].ToString();
            parameters[11] = Row["FAX"].ToString();
            parameters[12] = Row["COMPANY"].ToString();
            parameters[13] = Row["DIVISION"].ToString();
            parameters[14] = Row["PHONE_EVENING"].ToString();
            parameters[15] = Row["PHONE_CELL"].ToString(); 
            
            ///////////////////////////////////////////////////////////////
            //Calling the function for saving the information for the user
            ////////////////////////////////////////////////////////////////
            objBackOfficeClass.Mem_INSERT_UserInfo(parameters);

            //"deactivate" them
//            objBackOfficeClass.Mem_DELETE_UserInfo(sUsername, 1);

        }
        catch (Exception ex)
        {
            Response.Write("ERROR ADDING USER_INFO:" + sUserName + "-" + ex.Message.ToString());
        }
    }


    /*Following function is added by Netsmartz for adding the css path at runtime*/
    protected override void OnInit(EventArgs e)
    {

        Page.Header.Controls.Add(new LiteralControl("<link type=\"text/css\" rel=\"Stylesheet\" href=\"" + AppConfig.GetBaseSiteUrl() + "Styles/Main.css\" />"));
        
        base.OnInit(e);

    }
}
