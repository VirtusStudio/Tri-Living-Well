<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DebugLogger.aspx.cs" Inherits="PopUps_DebugLogger" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="/Styles/Main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
this.focus();
function log(sObj)
{//alert("a");
    if(sObj == "")
    {
        sObj = "<i>Empty String</i>";
    }
    document.getElementById("spanText").innerHTML +=  sObj + "<br />";
}
function clearLog()
{alert("b");
    document.getElementById('spanText').innerHTML = "";
}
</script>
</head>
<body>
    <form id="form1" runat="server">
    

        <table style="position:fixed;top:0px;left:0px;border:solid 1px #004477;background-color:#ddddff;width:200px;">
        <tr>
            <td style="padding:10px;">
                <table>
                <tr>
                    <td>Debug Logger 2.0</td>
                    <td style="text-align:right;"><a href="javascript:clearLog();">clear</a></td>
                </tr>
                <tr><td><br /></td></tr>
                <tr>
                    <td class="top" style="border:solid 1px #004477;;padding:10px;background-color:#ffffff;white-space:nowrap;">
                        <span id="spanText"></span>
                    </td>
                </tr>
                </table>
            </td>
        </tr>
        </table>        



    </form>
</body>
</html>
