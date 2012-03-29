<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Template_TABS.aspx.cs" Inherits="PAL_TABS" %>

<%@ Register Src="~/Controls/UC_Visitlog_Visitlog.ascx" TagName="UC_Visitlog_Visitlog" TagPrefix="uc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <%--<link href="/Styles/Main.css" rel="stylesheet" type="text/css" /> Above lines are commented by Netsmartz--%>
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


<telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
<!--TAB system-->
<script  type="text/javascript">
function ClientTabSelectedHandler(sender, eventArgs)
{
    var tabStrip = sender;   
    var tab = eventArgs.get_tab();
    
    document.getElementById(iframeName).src = tab.get_value();
}
function Init()
{
    var tabStrip = $find( "<%= RadTabStrip1.ClientID %>");
    document.getElementById(iframeName).src = tabStrip.get_selectedTab().get_value();
}
</script>
</telerik:RadScriptBlock>

<!--LoggedIn-->
<script type="text/javascript">
function PAGE_LOAD()
{
    Init();
}
</script>

</head>
<body  class="body2">
    <form id="form1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


<script type="text/javascript">
Sys.Application.add_load(PAGE_LOAD);  
</script> 
        <div>
            <div class="title">Templates</div>
            <br />
            <br />
            <telerik:RadTabStrip Width="98%" ID="RadTabStrip1" runat="server" OnClientTabSelected="ClientTabSelectedHandler" Skin="Web20" ></telerik:RadTabStrip>
            <iframe frameborder="0" name="IFRAME_CONTENT" id="IFRAME_CONTENT" class="IFRAME_CONTENT IFRAME_TAB" src=""></iframe>
        </div>

        <uc1:UC_Visitlog_Visitlog ID="UC_Visitlog_Visitlog1" runat="server" />
    </form>
    
<script type="text/javascript">
    var tabStrip = <%= RadTabStrip1.ClientID %>;
</script>
</body>
</html>
