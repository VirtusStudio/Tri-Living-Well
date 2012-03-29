using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.IO;
using System.Text;


/// <summary>
/// Summary description for LogClass
/// </summary>
public class LogClass
{
    private string sLogFormat;
    private string sErrorTime;

	public LogClass()
	{
        //sLogFormat used to create log files format :
        sLogFormat = DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt") + " ==> ";

        //this variable used to create log filename format "
        //for example filename : ErrorLogYYYYMMDD
        sErrorTime = DateTime.Now.ToString("yyyyMMdd");

	}
    public void Log(string sPathName, string sErrMsg)
    {
        if (ConfigurationSettings.AppSettings["APPLICATIONLOG"] == "1")
        {
            Directory.CreateDirectory(sPathName);

            StreamWriter SW = new StreamWriter(sPathName + sErrorTime + ".log", true);
            SW.WriteLine(sLogFormat + sErrMsg);
            SW.Flush();
            SW.Close();
        }
    }
}
