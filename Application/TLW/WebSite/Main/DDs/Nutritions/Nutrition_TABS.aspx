<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Nutrition_TABS.aspx.cs" Inherits="PAL_TABS" %>

<%@ Register Src="~/Controls/UC_Visitlog_Visitlog.ascx" TagName="UC_Visitlog_Visitlog" TagPrefix="uc1" %>

<%--Commented by Netsmartz for resolving compile time issues 
<%@ Register Assembly="RadTabStrip.Net2" Namespace="Telerik.WebControls" TagPrefix="radTS" %>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <%--<link href="/Styles/Main.css" rel="stylesheet" type="text/css" />
    Above line is commented by Netsmartz
    --%>
    
<!--fix IE tableBackgroundImageCache-->
<script type="text/javascript">
    try {document.execCommand("BackgroundImageCache", false, true);} catch(err) {}
</script>

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
    
    var newHeight = docHt + 50;
    if (newHeight < 400)
    {
        newHeight = 400;
    }
   
    if (docHt) iframeEl.style.height = newHeight + "px";
  }
}

</script>

<!--TAB system-->
<script  type="text/javascript">
function ClientTabSelectedHandler(sender, eventArgs)
{
    var tabStrip = sender;   
    var tab = eventArgs.Tab;
    document.getElementById(iframeName).src = tab.Value;
}
function Init()
{
    document.getElementById(iframeName).src = tabStrip.SelectedTab.Value;
}
</script>
</head>
<body onload="Init();" class="body2">
    <form id="form1" runat="server">

    <div>
        <table>
            <tr>
                <td>
                    <div class="title">Nutrition</div>
                </td>
            </tr>
        </table>
            
        <div class="description">
          <%--
          Commented by Netsmartz for resolving compile time issues 
          <radTS:RadTabStrip Width="98%" ID="RadTabStrip1" runat="server" OnClientTabSelected="ClientTabSelectedHandler" Skin="Web20" ></radTS:RadTabStrip>--%>
            <iframe frameborder="0" name="IFRAME_CONTENT" id="IFRAME_CONTENT" class="IFRAME_CONTENT IFRAME_TAB" src=""></iframe>
        </div>
    </div>

        <uc1:UC_Visitlog_Visitlog ID="UC_Visitlog_Visitlog1" runat="server" />
    </form>
    
<script type="text/javascript">
   
</script>
</body>
</html>
