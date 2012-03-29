
///***********************************************************
///Author Name: Netsmartz
///Creation Date: 21th Dec, 2010
///File Name:   CompanyRegistration.aspx.cs			Component Used: 
///Called From: Presentation layer 
///Description: This page is used to add the company details
///Tables Accessed: 
///Program specs: TLW
///UTP doc:
///Tested By: 
///***********************************************************************
///Modification History:
///Change No.   Changed By	    Date	    Version	    Raised By/SRS No	    Description
///
/// 
///***********************************************************************
///

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CompanyRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    { 
    }
    private void Page_PreInit(object sender, EventArgs e)
    {
        if (!AppLib.IsLoggedinSessionExists())
            this.MasterPageFile = "~/MasterPages/TLWSite.master";
        else
        {
            if (AppLib.GetLoggedInUserType().Equals("U"))
                this.MasterPageFile = "~/MasterPages/User.master";
            else
                this.MasterPageFile = "~/MasterPages/BackOffice.master";
        }
    }
}