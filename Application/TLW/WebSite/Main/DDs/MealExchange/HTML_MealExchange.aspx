<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HTML_MealExchange.aspx.cs" Inherits="HTML_MealExchange" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <%--<link href="/Styles/Main.css" rel="stylesheet" type="text/css" />
    Above line is commented by Netsmartz
    --%>
<!--focus()-->
<script type="text/javascript">
function Init()
{
    window.focus();
}
</script>
<!--anchor-->
<script type="text/javascript">
function setIframeSection(anchorID)
{
    document.getElementById("IFRAME_CONTENT").src = document.getElementById("IFRAME_CONTENT").src.split('#')[0] + "#" + anchorID;
}
</script>

<!--resizing browser-->
<script type="text/javascript">
var gbAllowResize = true;
function fireResize()
{
    if (self.innerHeight) // !IE
    {
        resizeNow(self.innerHeight);
    }
    else if (document.documentElement && document.documentElement.clientHeight) // IE6
    {
        resizeNow(document.documentElement.clientHeight);
    }
    else if (document.body) // IE*
    {//jsLog("IE NOT 6")
     //   resizeNow(document.body.clientWidth, document.body.clientHeight,0, 0);
    }
}

function resizeNow(h)
{
    try
    {
        if(gbAllowResize)
        {
            var iNewHeight = parseInt(h - 60);
            if(iNewHeight < 200)
            {
                iNewHeight = 200;
            }
            document.getElementById("IFRAME_CONTENT").style.height = (iNewHeight-18).toString() + "px";
        }
    }
    catch(ex)
    {
    }
}
</script>
</head>
<body class="body2" onload="Init();fireResize();" onresize="fireResize();">
    <form id="form1" runat="server">
  
        <table style="width:auto;">
        <tr>
            <td>
                <div class="title">Meal Exchange</div>
                <div class="description">
                    <table>
                    <tr>
                        <td style="width:140px; vertical-align:top;"><div style="padding-bottom:15px;">
                            Select a category below to jump through the page.</div>
                            <asp:Label ID="lblNavigation" runat="server"></asp:Label>
                        </td>
                        <td>
                            <iframe id="IFRAME_CONTENT" name="IFRAME_CONTENT" class="IFRAME_TAB" style="overflow-y:auto;overflow-x:hidden;width:500px;" runat="server" frameborder="0" src="HTML/MealExchange.aspx"></iframe>
                        </td>
                    </tr>
                    </table>
                </div>
            </td>
        </tr>
        </table>
        
    </form>
</body>
</html>
