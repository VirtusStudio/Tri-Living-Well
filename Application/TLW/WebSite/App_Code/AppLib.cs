
///***********************************************************
///Author Name: Netsmartz
///Creation Date: 21th Dec, 2010
///File Name:   Applib.cs			Component Used: 
///Called From: 
///Description: This class is contains the common functions
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
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net.Mail;
using System.IO;
using System.Threading;
using System.Resources;
using System.Globalization;
using System.Text;
using System.Security.Cryptography;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.Data.OleDb;
using System.Data;

/// <summary>
/// Summary description for AppLib
/// </summary>
public class AppLib
{
    public AppLib()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    /*Sub Header***********************************************************
   Function Name: Encrypt
   Functionality: This function will upload files to location specified by concating id with the file.
                      
   Input: FileUpload,string,int
   Output: int
   Use format: href='<%# Eval("WebPage") + "?ServiceTypeID=" + HttpUtility.UrlEncode(BLL.CommonFunctions.Encrypt(Eval("ServiceTypeID").ToString()))
   Note: Any Special comment
   *********************************************************************/
    public static string Encrypt(string toEncrypt)
    {
        byte[] keyArray;
        byte[] toEncryptArray = UTF8Encoding.UTF8.GetBytes(toEncrypt);

        string key = ")(*&";

        MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
        keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
        //Always release the resources and flush data of the Cryptographic service provide. Best Practice

        hashmd5.Clear();


        TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
        //set the secret key for the tripleDES algorithm
        tdes.Key = keyArray;
        //mode of operation. there are other 4 modes. We choose ECB(Electronic code Book)
        tdes.Mode = CipherMode.ECB;
        //padding mode(if any extra byte added)

        tdes.Padding = PaddingMode.PKCS7;

        ICryptoTransform cTransform = tdes.CreateEncryptor();
        //transform the specified region of bytes array to resultArray
        byte[] resultArray = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length);
        //Release resources held by TripleDes Encryptor
        tdes.Clear();
        //Return the encrypted data into unreadable string format
        return Convert.ToBase64String(resultArray, 0, resultArray.Length);
    }

    /*Sub Header***********************************************************
    Function Name: Decrypt
    Functionality: This function will Decrypt a string/URL
                          
    Input: String
    Output: int
    Note: Any Special comment
    *********************************************************************/
    public static string Decrypt(string cipherString)
    {
        cipherString = cipherString.Replace(" ", "+");
        byte[] keyArray;
        //get the byte code of the string

        byte[] toEncryptArray = Convert.FromBase64String(cipherString);

        string key = ")(*&";

        //if hashing was used get the hash code with regards to your key
        MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
        keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
        //release any resource held by the MD5CryptoServiceProvider

        hashmd5.Clear();


        TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
        //set the secret key for the tripleDES algorithm
        tdes.Key = keyArray;
        //mode of operation. there are other 4 modes. We choose ECB(Electronic code Book)

        tdes.Mode = CipherMode.ECB;
        //padding mode(if any extra byte added)
        tdes.Padding = PaddingMode.PKCS7;

        ICryptoTransform cTransform = tdes.CreateDecryptor();
        byte[] resultArray = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length);
        //Release resources held by TripleDes Encryptor                
        tdes.Clear();
        //return the Clear decrypted TEXT
        return UTF8Encoding.UTF8.GetString(resultArray);
    }

    public static string EncryptPassword(string strpassword)
    {
        string strForEncryption = strpassword;
        byte[] result;
        SHA256 sHA1Managed = new SHA256Managed();
        result = sHA1Managed.ComputeHash(ASCIIEncoding.ASCII.GetBytes(strForEncryption));
        System.Text.StringBuilder encryptedString = new System.Text.StringBuilder();
        foreach (byte outputByte in result)
            // convert each byte to a Hexadecimal upper case string
            encryptedString.Append(outputByte.ToString("x2").ToUpper());
        string strEnctyptpwd = encryptedString.ToString();
        return strEnctyptpwd;

    }

    /*Sub Header***********************************************************
Function Name: GetFormattedDate
Functionality: This function is used to return the formated date.
Input: 
Output: string
Note: Any Special comment
*********************************************************************/
    public static string GetFormattedDate(string strInputDate)
    {
        if (strInputDate.Trim() == "")
        {
            return "";
        }
        else
        {
            try
            {
                return Convert.ToDateTime(strInputDate).ToString("dd-MMM-yyyy");
            }
            catch
            {
                return "";
            }
        }
    }

    /*Sub Header***********************************************************
Function Name: GetFormattedDate
Functionality: This function is used to return the formated date.
Input: 
Output: string
Note: Any Special comment
*********************************************************************/
    public static bool isValidDate(string strInputDate)
    {
        if (strInputDate.Trim() == "")
        {
            return false;
        }
        else
        {
            try
            {
                DateTime dtTemp = Convert.ToDateTime(strInputDate);
                return true;

            }
            catch
            {
                return false;
            }
        }
    }


    /*Sub Header***********************************************************
Function Name: GetCompanyStatus
Functionality: This function is used to return the status for the company.
Input: 
Output: string
Note: Any Special comment
*********************************************************************/
    public static string GetCompanyStatus(string strStatus)
    {
        string strRetVal = string.Empty;
        if (strStatus.ToLower().Equals("y"))
        {
            strRetVal = "Activated";
        }
        else if (strStatus.ToLower().Equals("n"))
        {
            strRetVal = "Deactivated";
        }
        else
        {
            strRetVal = "Disapproved";
        }
        return strRetVal;
    }

    /*Sub Header***********************************************************
Function Name: BindCompanyStatus
Functionality: This function is used to bind the hashtable company status
Input:
Output: 

*********************************************************************/
    public static Hashtable BindCompanyStatus()
    {
        Hashtable _objhashReturn = new Hashtable();
        _objhashReturn.Add("Y", "Active");
        _objhashReturn.Add("N", "Deactive");
        return _objhashReturn;
    }



    /*Sub Header***********************************************************
Function Name: BindCompanyStatus
Functionality: This function is used to bind the hashtable company status
Input:
Output: 

*********************************************************************/
    public static Hashtable GetRequestedUserStatuses()
    {
        Hashtable _objhashReturn = new Hashtable();
        _objhashReturn.Add("I", "InProcess");
        _objhashReturn.Add("S", "Request For Registration Sent By TLW");
        _objhashReturn.Add("D", "Disapproved By TLW");
        _objhashReturn.Add("L", "Registered");
        return _objhashReturn;
    }

    /*Sub Header***********************************************************
Function Name: BindCompanyStatus
Functionality: This function is used to bind the hashtable company status
Input:
Output: 

*********************************************************************/
    public static string GetRequestedUserStatuseByStatusId(char chrStatus)
    {

        return GetRequestedUserStatuses()[chrStatus.ToString()].ToString();
    }


    /*Sub Header***********************************************************
 Function Name: BindCompanyStatusDropdown
 Functionality: This function is used to bind the company statuses with the predefined array
                          
 Input: dropdownlist and the strInitialText
 Output: 
 Note: 
 *********************************************************************/
    public static void BindCompanyStatusDropdown(DropDownList ddList, string strInitialText)
    {
        ddList.DataSource = BindCompanyStatus();
        ddList.DataTextField = "Value";
        ddList.DataValueField = "Key";
        ddList.DataBind();

        ListItem lstInitialItem;
        if (strInitialText.Trim() != "")
        {
            lstInitialItem = new ListItem(strInitialText, "0");
            ddList.Items.Insert(0, lstInitialItem);
        }
        lstInitialItem = null;
    }

    /*Sub Header***********************************************************
 Function Name: BindCompanyStatusDropdown
 Functionality: This function is used to bind the company statuses with the predefined array
                          
 Input: dropdownlist and the strInitialText
 Output: 
 Note: 
 *********************************************************************/
    public static void BindCompanyStatusRadioButtonList(RadioButtonList rdoList, string strInitialText)
    {
        rdoList.DataSource = BindCompanyStatus();
        rdoList.DataTextField = "Value";
        rdoList.DataValueField = "Key";
        rdoList.DataBind();
    }

    /*Sub Header***********************************************************
Function Name: ReadXmlAndReturnDataset
Functionality: This function is used to read the xml at the specified path and will return the dataaset
                          
Input: strFilePath and strSheetName
Output: 
Note: 
*********************************************************************/
    public static DataSet ReadXmlAndReturnDataset(string strFilePath, string strSheetName)
    {
        string connString = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + strFilePath + ";Extended Properties=Excel 8.0";
        // Create the connection object
        OleDbConnection oledbConn = new OleDbConnection(connString);
        OleDbDataAdapter oleda = new OleDbDataAdapter();

        try
        {
            oledbConn.Open();


            // Create OleDbCommand object and select data from worksheet Sheet1
            OleDbCommand cmd = new OleDbCommand("SELECT * FROM [" + strSheetName + "$]", oledbConn);

            // Create new OleDbDataAdapter

            oleda.SelectCommand = cmd;

            // Create a DataSet which will hold the data extracted from the worksheet.
            DataSet ds = new DataSet();

            // Fill the DataSet from the data extracted from the worksheet.
            oleda.Fill(ds, "Employees");
            cmd.Dispose();

            return ds;
        }
        catch (Exception ex) { throw ex; }
        finally
        {

            oledbConn.Close();
            oleda.Dispose();
            //ds.Dispose();
            oledbConn.Dispose();


        }
    }

    /*Sub Header***********************************************************
   Function Name: GetLoggedInUserId
   Functionality: This function will return id of loggedin user
   Input: 
   Output: string
   Note: Any Special comment
   *********************************************************************/
    public static int GetLoggedInUserId()
    {
        try
        {

            if (!(HttpContext.Current.Session["intLoggedUserId"] == null))
            {
                return Convert.ToInt32(HttpContext.Current.Session["intLoggedUserId"]);
            }
            else
            {
                return 0;
            }
        }
        catch (Exception ex)
        {
            return 0;
        }
    }


    /*Sub Header***********************************************************
Function Name: GetLoggedInUserType
Functionality: This function will return type of user type
Input: 
Output: string
Note: Any Special comment
*********************************************************************/
    public static string GetLoggedInUserType()
    {
        try
        {
            if (!(HttpContext.Current.Session["strUserType"] == null))
            {
                return Convert.ToString(HttpContext.Current.Session["strUserType"]);
            }
            else
            {
                return "";
            }
        }
        catch (Exception ex)
        {
            return "";
        }
    }

    /*Sub Header***********************************************************
   Function Name: GetLoggedInUserType
   Functionality: This function will return type of user type
   Input: 
   Output: string
   Note: Any Special comment
   *********************************************************************/
    public static string GetCurrentUserType()
    {
        try
        {
            if (!(HttpContext.Current.Session["ChrUserType"] == null))
            {
                return Convert.ToString(HttpContext.Current.Session["ChrUserType"]);
            }
            else
            {
                return "";
            }
        }
        catch (Exception ex)
        {
            return "";
        }
    }



    /*Sub Header***********************************************************
  Function Name: GetLoggedInUserId
  Functionality: This function will return id of loggedin user
  Input: 
  Output: string
  Note: Any Special comment
  *********************************************************************/
    public static bool IsLoggedinSessionExists()
    {
        try
        {

            if (!(HttpContext.Current.Session["strUserName"] == null))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch (Exception ex)
        {
            return false;
        }
    }

    /*Sub Header***********************************************************
Function Name: GetLoggedInUserId
Functionality: This function will return id of loggedin user
Input: 
Output: string
Note: Any Special comment
*********************************************************************/
    public static string GetLoggedInUserName()
    {
        try
        {

            if (!(HttpContext.Current.Session["strUserName"] == null))
            {
                return Convert.ToString(HttpContext.Current.Session["strUserName"]);
            }
            else
            {
                return "";
            }
        }
        catch (Exception ex)
        {
            return "";
        }
    }

    /*Sub Header***********************************************************
Function Name: UploadMemberDocuments
Functionality: This function is used to upload the member's document and will return the documentname
Input: fileUp--fileupload controls, strdocumentType -- what type of document to be uploaded that is wheather it is
     * Signature form, BankStatement etc, intMemberId-- it refers to the memberid for which the documetns are going to 
     * be uploaded
Output: 
*********************************************************************/
    public static string UploadCompanyExcelForUserRegRequest(ref FileUpload fileUp, string strFileName, string strPath)
    {
        if (fileUp.HasFile.Equals(true))
        {
            string strFileExtension = Path.GetExtension(fileUp.FileName);
            strFileName = strFileName + strFileExtension;
            fileUp.PostedFile.SaveAs(strPath + strFileName);
            return strFileName;
        }
        else
        {
            return "";
        }
    }

    /*Sub Header***********************************************************
Function Name: BindCompanyStatusDropdown
Functionality: This function is used to bind the company statuses with the predefined array
                          
Input: dropdownlist and the strInitialText
Output: 
Note: 
*********************************************************************/
    public static void BindCompanyDropdown(DropDownList ddList, string strInitialText)
    {
        BLL.CompanyManager oCompanyManager = new BLL.CompanyManager();

        ddList.DataSource = oCompanyManager.GetCompanyAllCompanies();
        ddList.DataTextField = "strCompanyName";
        ddList.DataValueField = "intCompanyId";
        ddList.DataBind();

        ListItem lstInitialItem;
        if (strInitialText.Trim() != "")
        {
            lstInitialItem = new ListItem(strInitialText, "0");
            ddList.Items.Insert(0, lstInitialItem);
        }
        lstInitialItem = null;
        oCompanyManager = null;
    }

    /*Sub Header***********************************************************
Function Name: BindCompanyStatusDropdown
Functionality: This function is used to bind the company statuses with the predefined array
                          
Input: dropdownlist and the strInitialText
Output: 
Note: 
*********************************************************************/
    public static void BindCompanyCheckBoxList(CheckBoxList ddList, string strInitialText)
    {
        BLL.CompanyManager oCompanyManager = new BLL.CompanyManager();

        ddList.DataSource = oCompanyManager.GetCompanyAllCompanies();
        ddList.DataTextField = "strCompanyName";
        ddList.DataValueField = "intCompanyId";
        ddList.DataBind();


        ListItem lstInitialItem;
        if (strInitialText.Trim() != "")
        {
            lstInitialItem = new ListItem(strInitialText, "0");
            ddList.Items.Insert(0, lstInitialItem);
        }
        lstInitialItem = null;
        oCompanyManager = null;
    }


    /*Sub Header***********************************************************
 Function Name: SendMailToUser
 Functionality: This function will send mail to specified user.
 Input: string,string, string, string
 Output: 
 Note: Any Special comment
 *********************************************************************/
    public static void SendMailToUser(string mailTo, string emailSubject, string emailBody, string mailFrom)
    {
        //Code commented and put our code
      
        try
        {
            
            //int UserId = AppLib.GetUserIDByEmail(mailTo);
            //emailBody = emailBody.Replace("[strBaseSiteUrl]", AppConfig.GetBaseSiteUrl());
            //emailBody = emailBody.Replace("[FULLNAME]", AppLib.GetUserFirstAndLastNameById(UserId));
            SmtpClient SmtpMail = new SmtpClient();
            MailMessage myMail = new MailMessage();
            System.Text.Encoding myEncoding = System.Text.Encoding.GetEncoding("iso-8859-1");
            myMail.SubjectEncoding = myEncoding;
            myMail.BodyEncoding = myEncoding;
            myMail.From = (new MailAddress(mailFrom.ToString()));
            // myMail.ReplyTo = "noreply@kangalope.com";
            myMail.To.Add(mailTo.ToString());
            myMail.Subject = emailSubject;
            myMail.Priority = MailPriority.Normal;
            myMail.IsBodyHtml = true;
            myMail.Body = emailBody;
            SmtpMail.Host = AppConfig.GetSMTPserver();
            SmtpMail.Port = 25;
            SmtpMail.EnableSsl = true;
            SmtpMail.DeliveryMethod = SmtpDeliveryMethod.Network;
            SmtpMail.UseDefaultCredentials = false;
            SmtpMail.Credentials = new System.Net.NetworkCredential("tlw@virtusstudio.com", "Virtus2012");
            
            SmtpMail.Send(myMail);

         
            
        }
        catch (Exception exc)
        {
            string msg;
            //msg = Resources.Resource.strErrorMSGTryAgain;
            //throw new RentAlpsException(msg, exc);
        }
    }

    /*Sub Header***********************************************************
 Function Name: GetFileContent
 Functionality: This function will return contents from any file
 Input: string
 Output: string
 Note: Any Special comment
 *********************************************************************/
    public static string GetEmailContent(string strTemplateName)
    {
        StreamReader strReader;
        string strPath = HttpContext.Current.Server.MapPath("Emails/") + strTemplateName;
        //string strPath = strFilePath;
        bool blnIsPresent = false;

        try
        {
            try
            {
                if (File.Exists(strPath))
                {
                    strReader = File.OpenText(strPath);
                    blnIsPresent = true;
                }
                else
                {
                    strReader = File.OpenText(HttpContext.Current.Server.MapPath("Emails/") + strTemplateName);
                    blnIsPresent = true;
                }
            }
            catch (Exception ex)
            {
                strReader = File.OpenText(HttpContext.Current.Server.MapPath("../Emails/") + strTemplateName);
                blnIsPresent = true;
            }

            if (!blnIsPresent)
            {
                try
                {
                    strPath = HttpContext.Current.Server.MapPath("../Emails/") + strTemplateName;
                    if (File.Exists(strPath))
                    {
                        strReader = File.OpenText(strPath);
                    }
                    else
                    {
                        strReader = File.OpenText(HttpContext.Current.Server.MapPath("../../Emails/") + strTemplateName);
                    }
                }

                catch (Exception ex)
                {
                    strReader = File.OpenText(HttpContext.Current.Server.MapPath("../../Emails/") + strTemplateName);
                }
            }
        }
        catch (Exception ex)
        {
            strReader = File.OpenText(HttpContext.Current.Server.MapPath("../../Emails/") + strTemplateName);
        }
        string mailContent = strReader.ReadToEnd();
        strReader.DiscardBufferedData();
        strReader.Close();

        return mailContent;
    }

    /*Sub Header***********************************************************
Function Name: BindGlobalCodesDropdown
Functionality: This function is used to bind the dropdown from the globalcodes
Input: dropdownlist and the strInitialText
Output: 
Note: 
*********************************************************************/
    public static void BindGlobalCodesDropdown(DropDownList ddList, string strInitialText, string _strCategory)
    {
        BLL.QuestionnaireLib oQuestionnaireLib = new BLL.QuestionnaireLib();
        ddList.DataSource = oQuestionnaireLib.GetGlobalCodesByCategoryName(_strCategory);
        ddList.DataTextField = "strHeading";
        ddList.DataValueField = "IntGlobalCodesId";
        ddList.DataBind();

        ListItem lstInitialItem;
        if (strInitialText.Trim() != "")
        {
            lstInitialItem = new ListItem(strInitialText, "0");
            ddList.Items.Insert(0, lstInitialItem);
        }
        lstInitialItem = null;

        oQuestionnaireLib = null;
    }

    /*Sub Header***********************************************************
Function Name: BindAllUsers
Functionality: This function is used to bind the dropdown from the users
Input: dropdownlist and the strInitialText
Output: 
Note: 
*********************************************************************/
    public static void BindAllUsers(DropDownList ddList, string strInitialText)
    {
        BLL.CompanyManager oCompanyManager = new BLL.CompanyManager();
        ddList.DataSource = oCompanyManager.GetAllUsers();
        ddList.DataTextField = "StrEmpEmail";
        ddList.DataValueField = "StrEmpEmail";
        ddList.DataBind();

        ListItem lstInitialItem;
        if (strInitialText.Trim() != "")
        {
            lstInitialItem = new ListItem(strInitialText, "0");
            ddList.Items.Insert(0, lstInitialItem);
        }
        lstInitialItem = null;

        oCompanyManager = null;
    }
    /*Sub Header***********************************************************
Function Name: GetSubString
Functionality: This function is used to return the substring upto some predefined length
Input: _strString and the _intRetCharacter
Output: 
Note: 
*********************************************************************/
    public static string GetSubString(string _strString, int _intRetCharacter)
    {
        if (_strString.Trim() == "-1")
        {
            return "<span title='" + _strString + "'> - </span>";

        }
        else
        {
            if (_intRetCharacter < _strString.Length)
            {
                return "<span title='" + _strString + "'>" + _strString.Substring(0, _intRetCharacter) + "..." + "</span>";
            }
            else
            {
                return "<span title='" + _strString + "'>" + _strString + "</span>";
            }
        }
    }

    /// <summary>
    /// Code to get the timeElasped
    /// </summary>
    /// <param name="dayNo"></param>
    /// <returns></returns>
    public static string GetTimespan(string _strtime)
    {
        string day = "0", hrs = "0", min = "0";

        DateTime totaltime = System.DateTime.Now;
        TimeSpan dt = totaltime - Convert.ToDateTime(_strtime);

        // TimeSpan tsp=totaltime.Subtract(_strtime);
        //11.01:42:20.9098716
        string tim = dt.ToString();
        int i = tim.LastIndexOf('.');
        string lhs = i < 0 ? tim : tim.Substring(0, i),
        rhs = i < 0 ? "" : tim.Substring(i + 1);

        string[] dy = lhs.Split('.');
        if (dy.Length > 1)
        {
            day = dy[0].ToString() + "Days ";

            string str = dy[1].ToString();
            string[] hms = str.Split(':');

            if (hms.Length == 3)
            {
                hrs = hms[0].ToString() + "Hrs ";
                min = hms[1].ToString() + "Min ";

            }
            else if (hms.Length == 2)
            {
                min = hms[0].ToString() + "Min ";
            }

        }

        lhs = day + hrs + min;
        return lhs;

    }


    public static string GetDayOfWeek(string dayNo)
    {


        switch (dayNo)
        {
            case "1":
                return "Sunday";
            case "2":
                return "Monday";
            case "3":
                return "Tuesday";
            case "4":
                return "Wednesday";
            case "5":
                return "Thursday";
            case "6":
                return "Friday";
            case "7":
                return "Saturday";
            // ...
        }

        return "";
    }

    /*Sub Header***********************************************************
Function Name: InsertVisitedSectionDetails
Functionality: This function is used to insert the section visited by user.
Input: _strString and the _intRetCharacter
Output: 
Note: 
*********************************************************************/
    public static void InsertVisitedSectionDetails(string _strSectionVisited)
    {
        BLL.UserLib oUserLib = new BLL.UserLib();
        Entity.UserInfo oUserInfo = new Entity.UserInfo();
        oUserInfo.StrUserId = AppLib.GetLoggedInUserName();
        oUserInfo.StrUserType = AppLib.GetCurrentUserType();
        oUserInfo.DtCreatedOn = DateTime.Now;
        oUserInfo.StrAgent = System.Web.HttpContext.Current.Request.ServerVariables.Get("HTTP_USER_AGENT");
        oUserInfo.StrVisitedIP = System.Web.HttpContext.Current.Request.ServerVariables.Get("REMOTE_ADDR");
        oUserInfo.StrSectionVisited = _strSectionVisited;
        oUserLib.InesrtSectionVisitedDetails(oUserInfo);
        oUserInfo = null;
        oUserLib = null;

    }
    /*Sub Header***********************************************************
Function Name: GetFutureDate
Functionality: This function is used to return the future date 
Input: 
Output: string
Note: Any Special comment
*********************************************************************/
    public static string GetFutureDate()
    {
        return "01/01/2599";
    }


    /*Sub Header***********************************************************
Function Name: GetBackDate
Functionality: This function is used to return the back date 
Input: 
Output: string
Note: Any Special comment
*********************************************************************/
    public static string GetBackDate()
    {
        return "01/01/2010";
    }

    /*Sub Header***********************************************************
   Function Name: isDateTime
   Functionality: This function will check for DateTime value. 
   Input: string
   Output: bool
   Note: Any Special comment
   *********************************************************************/
    public static bool isDateTime(string strValue)
    {
        if (strValue.ToString().Trim() == "")
        {
            return false;
        }
        else
        {
            try
            {
                Convert.ToDateTime(strValue);
            }
            catch
            {
                return false;
            }
        }
        return true;
    }

    /*Sub Header***********************************************************
   Function Name: GetBMI
   Functionality: This function will return the BMI
   Input: string
   Output: bool
   Note: Any Special comment
   *********************************************************************/
    public static decimal GetBMI(decimal _decWeightinLBS, decimal _decHeightinInches)
    {
        decimal _decRetVal = (_decWeightinLBS * Convert.ToDecimal(703)) / (_decHeightinInches * _decHeightinInches);
        return _decRetVal;

    }


    /*Sub Header***********************************************************
   Function Name: GetBMI
   Functionality: This function will return the BMI
   Input: string
   Output: bool
   Note: Any Special comment
   *********************************************************************/
    public static decimal GetBodyFATPercentage(string _strMaleOrFemale, decimal _decWaist, decimal _decHip, decimal _decNeck, decimal _decHeight)
    {
        decimal _decRetVal = 0;

        try
        {
            if (_strMaleOrFemale.ToLower().Equals("male"))
            {
                decimal _decLog1 = Convert.ToDecimal(Math.Log10(Convert.ToDouble(Convert.ToDecimal(_decWaist - _decNeck))));
                decimal _decRetVal1 = Convert.ToDecimal(86.010) * _decLog1;
                decimal _decLog2 = Convert.ToDecimal(Math.Log10(Convert.ToDouble(_decHeight)));
                _decLog2 = _decLog2 * Convert.ToDecimal(70.041);
                _decRetVal = _decRetVal1 - _decLog2 + Convert.ToDecimal(36.76);
            }
            else
            {
                _decRetVal = Convert.ToDecimal(163.205) * Convert.ToDecimal(Math.Log10(Convert.ToDouble(Convert.ToDecimal(_decWaist + _decHip - _decNeck))));
                _decRetVal = _decRetVal - (Convert.ToDecimal(97.684) * Convert.ToDecimal(Math.Log10(Convert.ToDouble(Convert.ToDecimal(_decHeight)))));
                _decRetVal = _decRetVal - Convert.ToDecimal(78.387);
            }

            return _decRetVal;
        }
        catch { return _decRetVal; }


    }

    /*Sub Header***********************************************************
   Function Name: GetBMI
   Functionality: This function will return the BMI
   Input: string
   Output: bool
   Note: Any Special comment
   *********************************************************************/
    public static decimal GetPercentageIncreate(decimal _decFrom, decimal _decTo)
    {
        decimal _decRetVal = (_decTo - _decFrom) / _decFrom;
        return _decRetVal * 100;

    }


}