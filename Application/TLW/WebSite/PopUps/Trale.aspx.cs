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

public partial class Trale : System.Web.UI.Page
{
    /****************************************************
     * AES KEY: test key
     * IV: test IV
     *
     ***************************************************/
    protected void Page_Load(object sender, EventArgs e)
    {
        string strClientURLEncryptKey = "test key"; //"9^B3#54378NJcv7/sx^A1b#98bhY/4^7";
        string strClientURLEncryptIV = "test IV"; //"45VtY#bn1$zaq2#1";
        
        TRALEExplorer.SSO.AESEncrypt AESEncryptSSO = new TRALEExplorer.SSO.AESEncrypt();

        string timeStamp = DateTime.Now.ToString();
        if (timeStamp.Length > 0)
        {
            timeStamp = timeStamp.Replace(" ", ":") + ":EST";
        }

        AESEncryptSSO.IV = strClientURLEncryptIV;
        
        string paramList = @"MEMBERID=200052;COMPANYID=ABA1901;EMAIL=eddie@trale.com;DOB=1/1/1960;GENDER=M;FIRSTNAME=ROBERT;LASTNAME=SMITH;LNG=ES;TS=" + timeStamp + ";";
        AESEncryptSSO.ParamDelimiter = ";";

        string crypt = AESEncryptSSO.Encrypt(paramList, strClientURLEncryptKey);
        crypt = AESEncryptSSO.StringToHex(crypt);

        //I beleive "xt_H2USSO.aspx" is a test output page that should show the decrypted paramaters.
        //And "xt_SSO.aspx" is the final page we will go live with
        Response.Redirect("http://hratestserver.traleexplorer.com/xt_H2USSO.aspx?crypt=" + crypt, true);

        Response.Write("~/xt_H2USSO.aspx?crypt=" + crypt);
    }

}
