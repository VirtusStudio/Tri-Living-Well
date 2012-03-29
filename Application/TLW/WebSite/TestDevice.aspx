<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestDevice.aspx.cs" Inherits="TestDevice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script language="javascript" type="text/javascript">
        function CheckBrowser() {
            var xmlhttp;
            var varBrowserType = '';
            try {
                xmlhttp = new ActiveXObject("Msxml2.XMLHTTP"); /* for IE < 5 */
                varBrowserType = "IE";
            }
            catch (e) {
                try {
                    varBrowserType = "IE";
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                catch (E) {
                    xmlhttp = false;
                }
            }

            /* mozilla & opera */
            if (!xmlhttp && typeof XMLHttpRequest != 'undefined') {
                varBrowserType = "Firefox";
            }


            alert(varBrowserType);
        }
    </script>
</head>
<body onload="javascript:CheckBrowser();">
    <form id="form1" runat="server">
    <div>
    </div>
    </form>
</body>
</html>
