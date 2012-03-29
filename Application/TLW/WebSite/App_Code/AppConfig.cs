/*Code Header ******************************************************
Author Name: Rashid
Creation Date: 2-8-2007
File Name: AppConfig.cs
Description: Contains Static function definations.
Tables Accessed: 
Program specs:  
Tested By: 
***********************************************************************
Modification History:
Change No.	Changed By	Date	        Version	    Raised By/SRS No	Description 
***********************************************************************/
using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for AppConfig
/// </summary>
public class AppConfig
{
	public AppConfig()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /*Sub Header***********************************************************
   Function Name: GetBaseSiteUrl
   Functionality: This function will return Site Path.
   Input:
   Output: 
   Note: Any Special comment
   *********************************************************************/
    public static string GetBaseSiteUrl()
    {
        return ConfigurationManager.AppSettings["BaseSiteUrl"].ToString();
    }
    /*Sub Header***********************************************************
   Function Name: GetBaseSiteUrl
   Functionality: This function will return Site Path.
   Input:
   Output: 
   Note: Any Special comment
   *********************************************************************/
    public static string GetCompanyRequestExcelUploadPath()
    {
        return ConfigurationManager.AppSettings["CompanyRequestExcelPath"].ToString();
    }
    /*Sub Header***********************************************************
   Function Name: GetSMTPserver
   Functionality: This function will return SMTP server.
   Input:
   Output: string
   Note: Any Special comment
   *********************************************************************/
    public static string GetSMTPserver()
    {
        return ConfigurationManager.AppSettings["glbsmtpserver"].ToString();
    }
    
    /*Sub Header***********************************************************
   Function Name: GetAdminEmail
   Functionality: This function will return admin email id
   Input:
   Output: string
   Note: Any Special comment
   *********************************************************************/
    public static string GetAdminEmail()
    {
        return ConfigurationManager.AppSettings["AdminEmail"].ToString();
    }

 /*Sub Header***********************************************************
   Function Name: GetAdminEmail
   Functionality: This function will return admin email id
   Input:
   Output: string
   Note: Any Special comment
   *********************************************************************/
    public static string GetSiteName()
    {
        return ConfigurationManager.AppSettings["SITE_NAME"].ToString();
    }

 /*Sub Header***********************************************************
   Function Name: GetAdminEmail
   Functionality: This function will return admin email id
   Input:
   Output: string
   Note: Any Special comment
   *********************************************************************/
    public static string GetSITEPHONE()
    {
        return ConfigurationManager.AppSettings["SITE_PHONE"].ToString();
    }

    /*Sub Header***********************************************************
      Function Name: GetAdminEmail
      Functionality: This function will return news n announcemens pdf path
      Input:
      Output: string
      Note: Any Special comment
      *********************************************************************/
    public static string GetNewsAnnouncementsPDFPath()
    {
        return ConfigurationManager.AppSettings["NewsAnnouncementsPDFPath"].ToString();
    }

    /*Sub Header***********************************************************
      Function Name: GetAdminEmail
      Functionality: This function will return news n announcemens pdf path
      Input:
      Output: string
      Note: Any Special comment
      *********************************************************************/
    public static string GetNewsLettersPDFPath()
    {
        return ConfigurationManager.AppSettings["NewsLettersPDFPath"].ToString();
    }

    /*Sub Header***********************************************************
      Function Name: GetLibrariesPath
      Functionality: This function will return path of Library files
      Input:
      Output: string
      Note: Any Special comment
      *********************************************************************/
    public static string GetLibrariesFilePath()
    {
        return ConfigurationManager.AppSettings["LibrariesFilesPath"].ToString();
    }
    /*Sub Header***********************************************************
Function Name: GridViewPageSize
Functionality: This function is used to return page size for the gridview
Input: 
Output: 
*********************************************************************/
    public static int GetGridViewPageSize()
    {
        return Convert.ToInt32(ConfigurationManager.AppSettings["GridViewPageSize"]);
    }

}