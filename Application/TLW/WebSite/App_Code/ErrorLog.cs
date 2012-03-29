using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using System.IO;

/// <summary>
/// Summary description for Errorlog
/// </summary>
/// 

    public class Errorlog
    {
        # region Methods
        #region "Write Exceptions"
        private string sLogFormat;
        private string sErrorTime;

        public Errorlog()
        {
            
            sLogFormat = DateTime.Now.ToShortDateString().ToString() + " " + DateTime.Now.ToLongTimeString().ToString() + " ==> ";

            string sYear = DateTime.Now.Year.ToString();
            string sMonth = DateTime.Now.Month.ToString();
            string sDay = DateTime.Now.Day.ToString();
            sErrorTime = sYear + sMonth + sDay;
        }

        public void WriteLog(string sErrMsg)
        {
            try
            {
                string sFileName = System.Web.HttpContext.Current.Request.PhysicalApplicationPath + "ErrorLog.txt";
                System.IO.FileInfo objFileInfo = new System.IO.FileInfo(sFileName);
                if (!objFileInfo.Exists)
                    objFileInfo.Create();

                if (objFileInfo.Length > 10485760)
                {
                    string str_number = Guid.NewGuid().ToString();
                    string newFile = System.Web.HttpContext.Current.Request.PhysicalApplicationPath + "ErrorLog\\" + str_number + "ErrorLog.txt";
                    objFileInfo.CopyTo(newFile);
                    objFileInfo.Delete();
                }


                string sPathName = System.Web.HttpContext.Current.Request.PhysicalApplicationPath + "//ErrorLog.txt";//ConfigurationSettings.AppSettings["LogFileName"];

                System.IO.FileStream objFileStream = objFileInfo.Open(System.IO.FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.ReadWrite);
                System.IO.StreamWriter objWriter = new System.IO.StreamWriter(objFileStream);
                objWriter.BaseStream.Seek(0, System.IO.SeekOrigin.End);
                objWriter.WriteLine("Error Occured at " + DateTime.Now.ToLongDateString() + " : " + DateTime.Now.ToLongTimeString());
                objWriter.WriteLine(sErrMsg);
                objWriter.WriteLine("----------------------------------------------------------------------");
                objWriter.Close();
            }
            catch { }
           
        }
        #endregion
        # endregion
    }
