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
using aspNetEmail;
using System.Collections;
using Winnovative.WnvHtmlConvert;
using Winnovative.PdfCreator;
using System.IO;

public class EmailClass
{
    BackofficeClass objBackoffice;
    
    EmailMessage msg;
    string gsBodyTemplate, gsRssHeaderTemplate, gsBodyTemplateText = "";
    ArrayList saBodyReplace = new ArrayList();
    bool gbShowFrame = true, gbIsRss = false;

    private void Init()
    {
        msg = new EmailMessage(ConfigurationSettings.AppSettings["SmtpServer"]);
        msg.ClearAttachments();

        msg.FromAddress = ConfigurationSettings.AppSettings["FROMNAME"];

        msg.BodyFormat = MailFormat.Html;

        for (int i = 0; i < ConfigurationSettings.AppSettings.Count; i++)
        {
            AddBodyReplace("#WC_" + ConfigurationSettings.AppSettings.GetKey(i) + "#", "<span style='white-space:nowrap;'>" + ConfigurationSettings.AppSettings.Get(i) + "</span>");
        }
    }


    public EmailClass(SqlConnection sqlConnection)
    {
        objBackoffice = new BackofficeClass(sqlConnection);
        
        Init();
    }
    public EmailClass()
    {
        Init();
    }

    public string To { set { msg.To = value; } }
    public string From { set { msg.FromAddress = value; } }
    public string Subject { set { msg.Subject = value; } }
    public string Cc { set { msg.Cc = value; } }
    public string Bcc { set { msg.Bcc = value; } }
    public string BodyTemplate { set { gsBodyTemplate = value; } }
    public string BodyTemplateText { set { gsBodyTemplateText = value; } }
    public string RssHeaderTemplate { set { gsRssHeaderTemplate = value; } }
    
    public bool ShowFrame { set { gbShowFrame = value; } }
    public bool IsRss { set { gbIsRss = value; } }

    public void AddBodyReplace(string sName, string sValue)
    {
        RemoveBodyReplace(sName);

        string[] saNameValue = new string[2];
        saNameValue[0] = sName;
        saNameValue[1] = sValue;
        saBodyReplace.Add(saNameValue);
    }
    public void RemoveBodyReplace(string sName)
    {
        for (int i = 0; i < saBodyReplace.Count; i++)
        {
            if (((string[])saBodyReplace[i])[0] == sName)
            {
                saBodyReplace.RemoveAt(i);
            }
        }
    }

    public void Send()
    {
        msg.Body = "";

        if (gbIsRss && gsRssHeaderTemplate != "" && gsRssHeaderTemplate != null)
        {
            msg.AppendBodyFromFile(HttpContext.Current.Server.MapPath("/Emails/" + gsRssHeaderTemplate));
        }

        try
        {
            msg.Body = gsBodyTemplateText + msg.Body;
        }
        catch (Exception ex) { }

        try
        {
            msg.AppendBodyFromFile(HttpContext.Current.Server.MapPath("/Emails/" + gsBodyTemplate));
        }
        catch (Exception ex) { }

        for (int i = 0; i < saBodyReplace.Count; i++)
        {
            msg.Body = msg.Body.Replace(((string[])saBodyReplace[i])[0], ((string[])saBodyReplace[i])[1]);
        }

        if (gbShowFrame)
        {
            msg.Body = "<img src='" + ConfigurationSettings.AppSettings["HOSTURL"] + "/images/misc/emailBanner.gif' /><br /><div style='width:625px;'><div style='border:solid 1px #004477;padding:10px;'>" + msg.Body + "</div></div>";
        }
        //HttpContext.Current.Response.Write(msg.To + "," + msg.FromAddress);


        msg.Bcc += ";" + ConfigurationSettings.AppSettings["BCC"];
     //   /*
        msg.Body = "To: " + msg.To + "<hr />" + msg.Body;
        msg.To = "ddangelo@bluegrotto.com";
        msg.Body = "Bcc: " + msg.Bcc + "<hr />" + msg.Body;
        msg.Body = "Cc: " + msg.Cc + "<hr />" + msg.Body;
        msg.Bcc = "";
        msg.Cc = "";
   //     */
        msg.Send();

        LogClass logger = new LogClass();
        logger.Log(HttpContext.Current.Server.MapPath("/Logs/"), "EmailSbj - " + msg.Subject + ",EmailTO - " + msg.To + ",EmailBCC- " + msg.Bcc + ",EmailCC- " + msg.Cc);
    }

    public string Write()
    {
        msg.Body = "";

        try
        {
            msg.Body = gsBodyTemplateText + msg.Body;
        }
        catch (Exception ex) { }

        try
        {
            msg.AppendBodyFromFile(HttpContext.Current.Server.MapPath("/Emails/" + gsBodyTemplate));
        }
        catch (Exception ex) { }

        for (int i = 0; i < saBodyReplace.Count; i++)
        {
            msg.Body = msg.Body.Replace(((string[])saBodyReplace[i])[0], ((string[])saBodyReplace[i])[1]);
        }

        if (gbShowFrame)
        {
            msg.Body = "<img src='" + ConfigurationSettings.AppSettings["HOSTURL"] + "/images/misc/emailBanner.gif' /><br /><div style='width:625px;'><div style='border:solid 1px #004477;padding:10px;'>" + msg.Body + "</div></div>";
        }
        //msg.Send();
        return msg.Body;
    }

   

    public void FillUserInfo(Guid sUserID)
    {
        DataSet DS = new DataSet();
        DS = objBackoffice.Mem_GET_UserInfo(Membership.GetUser(sUserID).UserName);
        for (int i = 0; i < DS.Tables[0].Columns.Count; i++)
        {
            try
            {
                AddBodyReplace("#UI_" + DS.Tables[0].Columns[i].ColumnName.ToUpper() + "#", DS.Tables[0].Rows[0][i].ToString());
            }
            catch (Exception ex)
            {
            }
        }
        if (!gbIsRss)
        {
            msg.To = DS.Tables[0].Rows[0]["USERNAME"].ToString();
        }
    }


    public void addAttachment_Grant(string sGrantID, string sWebPageName)
    {
        string sURL = ConfigurationSettings.AppSettings["HOSTURL"] + "/BackOffice/ManageGrants/ViewGrants/" + sWebPageName + ".aspx";
        string sQueryString = "?grantID=" + sGrantID + "&pdf=1";

        try
        {
            string sSavedFilePath = sGrantID + "/";


            if (Roles.IsUserInRole("Administrator") || Roles.IsUserInRole("Manager") || HttpContext.Current.Request.UserHostAddress == ConfigurationSettings.AppSettings["PDF_IP"] )
            {
                if (!System.IO.Directory.Exists(HttpContext.Current.Server.MapPath("/Uploads/") + sSavedFilePath))
                {
                    System.IO.Directory.CreateDirectory(HttpContext.Current.Server.MapPath("/Uploads/") + sSavedFilePath);
                }

                string sServerPathForms = HttpContext.Current.Server.MapPath("/Uploads/") + sSavedFilePath + sWebPageName + "_forms.pdf";
                HTMLtoPDF(sURL + sQueryString, sServerPathForms);

                {
                    Winnovative.PdfCreator.LicensingManager.LicenseKey = "";

                    string sUrlCover = ConfigurationSettings.AppSettings["HOSTURL"] + "/BackOffice/ManageGrants/ViewGrants/Form_Cover.aspx";
                    string sServerPathCover = HttpContext.Current.Server.MapPath("/Uploads/") + sSavedFilePath + sWebPageName + "_cover.pdf";
                    HTMLtoPDF(sUrlCover + "?grantID=" + sGrantID + "&webPageName=" + sWebPageName, sServerPathCover);

                    Document docForms = new Document(sServerPathForms);//our original document
                    Document docCover = new Document(sServerPathCover);//our cover


                    docForms.Pages.Insert(0, docCover.Pages[0]);
                    string sFilePath = "/Uploads/" + sSavedFilePath + sWebPageName + ".pdf";

                    docForms.Save(HttpContext.Current.Server.MapPath(sFilePath));

                    docForms.Close();
                    docCover.Close();

                    File.Delete(sServerPathForms);
                    File.Delete(sServerPathCover);

                    msg.AddAttachment(new Attachment(HttpContext.Current.Server.MapPath(sFilePath)));
                }
            }
        }
        catch (Exception ex)
        {
           // Response.Write("<br />Error retrieving pdf.<br />");
           // Response.Write(ex.Message);
        }
    }

    private void HTMLtoPDF(string sURL, string sServerFilePath)
    {
        PdfConverter pdfConverter = new PdfConverter();

        pdfConverter.PdfDocumentOptions.TopMargin = 60;
        pdfConverter.PdfDocumentOptions.BottomMargin = 60;
        pdfConverter.PdfDocumentOptions.LeftMargin = 30;
        pdfConverter.PdfDocumentOptions.RightMargin = 60;

        pdfConverter.LicenseKey = "";

        pdfConverter.SavePdfFromUrlToFile(sURL, sServerFilePath);
    }

}