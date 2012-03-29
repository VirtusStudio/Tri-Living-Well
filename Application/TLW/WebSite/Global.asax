<%@ Application Language="C#" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="System.Net.Mail" %>
<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs
        Exception ex =Server.GetLastError().GetBaseException();
        Errorlog objEmail = new Errorlog();
        Response.Write(ex.ToString()); 
        objEmail.WriteLog(ex.ToString());
       //EventLog.WriteEntry("Test Web", "MESSAGE: " + ex.Message + "\nSOURCE: " + ex.Source + "\nFORM: " + Request.Form.ToString() + "\nQUERYSTRING: " + Request.QueryString.ToString() + "\nTARGETSITE: " + ex.TargetSite + "\nSTACKTRACE: " + ex.StackTrace, EventLogEntryType.Error);


        //MailMessage mailMsg = new MailMessage();
        //SmtpClient mailObj = new SmtpClient(ConfigurationSettings.AppSettings["SMTPSERVER"]);//"192.168.1.145"

        //mailMsg.BodyEncoding = System.Text.Encoding.UTF8;
        //mailMsg.SubjectEncoding = System.Text.Encoding.UTF8;
       
        //mailMsg.Priority = MailPriority.High;
        //mailMsg.From = new MailAddress(ConfigurationSettings.AppSettings["FROMNAME"].ToString());
        //mailMsg.To.Add(ConfigurationSettings.AppSettings["ErrorEmail"].ToString());
        //mailMsg.Subject = "Error in Trilivingwell";
       
        //mailMsg.IsBodyHtml = true;
        // mailObj.Host = ConfigurationSettings.AppSettings["SMTPSERVER"].ToString();
        // if (ex != null)
        // {
        //     mailMsg.Body = "MESSAGE: " + ex.Message + "\nSOURCE: " + ex.Source + "\nFORM: " + Request.Form.ToString() + "\nQUERYSTRING: " + Request.QueryString.ToString() + "\nTARGETSITE: " + ex.TargetSite + "\nSTACKTRACE: " + ex.StackTrace;
        // }
        // else
        // {
        //     mailMsg.Body = "Exception not returned";
        // }
        //mailObj.Send(mailMsg);
    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
