<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HTML_Details.aspx.cs" Inherits="HTML_Details" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="../../Styles/Main.css" rel="stylesheet" type="text/css" />
    
   
<!--IFRAME HEIGHT STUFF-->
<script type="text/javascript">
var iframeName = "IFRAME_CONTENT";
  
function getDocHeight(doc) {
  var docHt = 0, sh, oh;
  if (doc.height) docHt = doc.height;
  else if (doc.body) {
    if (doc.body.scrollHeight) docHt = sh = doc.body.scrollHeight;
    if (doc.body.offsetHeight) docHt = oh = doc.body.offsetHeight;
    if (sh && oh) docHt = Math.max(sh, oh);
  }
  return docHt;
}
function setIframeHeight_NoTopScroll() {
    bTopScroll = false;
    setIframeHeight();
    bTopScroll = true;
}
var bTopScroll = true;
function setIframeHeight() {
//    alert(" in Tabs height:");
  
  var iframeWin = window.frames[iframeName];
  var iframeEl = document.getElementById? document.getElementById(iframeName): document.all? document.all[iframeName]: null;
  //alert("setIframeHeight() - iframeWin=" + iframeWin);
  //alert("setIframeHeight() - iframeEl=" + iframeEl);
  if ( iframeEl && iframeWin ) 
  {  
    if (bTopScroll)iframeEl.style.height = "auto"; //causes a top scroll to occur & help resize for some shorter content pages
    var docHt = getDocHeight(iframeWin.document);
    // need to add to height to be sure it will all show
    //alert("setIframeHeight() - docHt=" + docHt);
    
    var newHeight = docHt + 150;
    if (newHeight < 400)
    {
        newHeight = 400;
    }
   
    if (docHt) iframeEl.style.height = newHeight + "px";
  }
}
</script> 
    
<script type="text/javascript">
function Init()
{
    window.focus();
}
</script>

</head>
<body onload="Init();">
    <form id="form1" runat="server">
    <div>
    <table>
<tr>
<td style="width:140px; vertical-align:top;"><div style=" padding-bottom:15px;">
Select a category below to jump through the page.</div>

<asp:Label ID="lblNavigation" runat="server"></asp:Label>


</td>
<td>
<iframe id="IFRAME1" runat="server" style="border:solid 1px red;"></iframe>
</td>

</tr></table>
    </div>
    </form>
</body>
</html>
