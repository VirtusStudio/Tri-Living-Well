<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main_FRAMEa.aspx.cs" Inherits="Main_Main_FRAME" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title><%= System.Configuration.ConfigurationSettings.AppSettings["SITE_NAME"] %></title>
    <link href="../Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Main.css" rel="stylesheet" type="text/css" />
</head>

<!--popUpWin-->
<script type="text/javascript">
function popUpWin(path, x, y)
{ 
    var sURL =  path;
	var features = 'toolbar=0,location=0,status=1,menubar=0,scrollbars=1,resizable=1,width='+x+',height='+y+',left=' + top.window.screenLeft + ',top=' + top.window.screenTop;
	var windownew = window.open(sURL,"new_window",features);
	windownew.focus();
}
</script>
<!--refreshMenu is meant to refresh only certain fields every so often-->
<script type="text/javascript">
function refreshMenu(sPrivateMessageInnerText)
{
    document.getElementById("<%=lblPrivateMessages.ClientID %>").innerHTML = sPrivateMessageInnerText;
}
</script>
<!--Debug Logger: top.log(obj)-->
<script type="text/javascript">
var bDebugMode = false;
var winDebugLog = null;
var gObj = null;
function log(obj)
{ 
    if(bDebugMode)
    {
        gObj = obj;
        /*if(winDebugLog == null)
        {
            openWinDebugLogger();
        }*/
        sendLog();
    }
}

function refreshMessage()
{
    refresh();
    //setTimeout("refreshMessage()", 30000);
}

function sendLog()
{
    try
    {
        winDebugLog.log(gObj);
        winDebugLog.focus();
    }
    catch(ex)
    {
        openWinDebugLogger();
        setTimeout("sendLog()", 500);
    }
}
function openWinDebugLogger()
{
    var sURL = "/PopUps/DebugLogger.aspx";
    var features = 'toolbar=0,location=0,status=1,menubar=0,scrollbars=1,resizable=1,width='+600+',height='+600+',left=' + top.window.screenLeft + ',top=' + top.window.screenTop;
    winDebugLog = window.open(sURL,"DEBUG_LOGGER",features);
}
</script>
<!--iframe height resizing-->
<script type="text/javascript">
// IFRAME HEIGHT STUFF
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

function setIframeHeight() { refresh();
  var iframeWin = window.frames[iframeName];
  var iframeEl = document.getElementById? document.getElementById(iframeName): document.all? document.all[iframeName]: null;
  //alert("setIframeHeight() - iframeWin=" + iframeWin);
  //alert("setIframeHeight() - iframeEl=" + iframeEl);
  if ( iframeEl && iframeWin ) {
   if (bTopScroll)iframeEl.style.height = "auto"; //causes a top scroll to occur & help resize for some shorter content pages
    var docHt = getDocHeight(iframeWin.document);
    // need to add to height to be sure it will all show
    //alert("setIframeHeight() - docHt=" + docHt);
    if (docHt) 
    {
        iframeEl.style.height = docHt + 50 + "px";
        iframeEl.style.width = '923px';
    }
  }
}
var bTopScroll = true;
function setIframeHeight_NoTopScroll() {
    bTopScroll = false;
    setIframeHeight();
    bTopScroll = true;
}

function setIframeHeightPlus(i)
{
    var iframeWin = window.frames[iframeName];
  var iframeEl = document.getElementById? document.getElementById(iframeName): document.all? document.all[iframeName]: null;
  //alert("setIframeHeight() - iframeWin=" + iframeWin);
  //alert("setIframeHeight() - iframeEl=" + iframeEl);
  if ( iframeEl && iframeWin ) {
    iframeEl.style.height = "auto"; // helps resize (for some) if new doc shorter than previous  
    var docHt = getDocHeight(iframeWin.document);
    // need to add to height to be sure it will all show
    //alert("setIframeHeight() - docHt=" + docHt);
    if (docHt) 
    {
        iframeEl.style.height = docHt + i + "px";
        iframeEl.style.width = '923px';
    }
    //iframeEl.style.width = "100%";
  }  
}

</script>
 
<!--refreshing user status-->
<script type="text/javascript">
function refresh()
{
    document.getElementById('btnRefresh').click();
}
</script>
<!--LoggedIn-->
<script type="text/javascript">
var bLoggedIn_Holder = "0";
function LoggedIn()
{
    if (document.getElementById('txtLoggedIn').value == "1")//they are logged on
    {//hold client-side they they were at one point logged on
        bLoggedIn_Holder = "1";
    }
    if (document.getElementById('txtLoggedIn').value == "0")//not logged on
    {
        if(bLoggedIn_Holder == "1")//they were ever logged on
        {//they must have timed out
            window.location.href = "/login/logout_IMPORTANT.aspx";
        }
    }
}
</script>
<!--background-image:url(/images/back/back_back.gif); background-position:top center; background-repeat:repeat-x;-->
<body style="background-color:#151515;" onload="refreshMessage()">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

<script type="text/javascript">
Sys.Application.add_load(LoggedIn);  
</script> 


       <telerik:RadToolTip runat="server" ID="rttUnregisteredAccounts" Width="150px" ShowEvent="OnClick" ShowDelay="0"
                TargetControlID="lblUnregisteredAccounts_rttWrapper" IsClientID="true" HideEvent="LeaveToolTip" OffsetY="0" Animation="Slide" 
                Position="BottomCenter" RelativeTo="Element" Skin="Default">
            </telerik:RadToolTip>
  
  
<table class="center" style="width:auto;">
<tr>
<td>

<center class="Round2"><center><center><center><center><center><center><center><center><center>


<!-- BEGIN CONTENT -->

<div class="FRAME">
 <div class="BANNER">
     <img style="display:none;" src="../images/back/back_top.jpg" />
            <div class="menu1">
                <asp:Label ID="lblAdminArea" runat="server"></asp:Label>
                
                <a href="javascript:load('/Main/Content/Home.aspx');">Dashboard</a>
                <a href="javascript:load('/FORUM/default.aspx');">Forum</a>
                
                    <span>
                        
                       <a href="javascript:top.popUpWin('/Main/MyProgram/MyProgram.aspx',900,650);">My Program</a>
                       <a href="javascript:load('/Main/PALs/PAL_TABS.aspx');">Personal Activity Log</a>
                       <a href="javascript:load('/Main/DDs/DD.aspx');">Daily Diary</a>
                       <a href="javascript:popUpWin('/Main/Help/webframe.html' ,800,700);">Help</a>
                
                        
                    </span>
            </div>
        
    <div class="menu2">
        <div class="menu2_div">
<telerik:RadMenu ID="RadMenu1"  runat="server"  SkinID="na" Skin="TriLivingWell" EnableEmbeddedSkins="false" >
        <Items>
            <telerik:RadMenuItem runat="server" NavigateUrl="javascript:load(&quot;Content/Home.aspx&quot;)" Text="Home"></telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" NavigateUrl="javascript:load(&quot;Content/Home.aspx&quot;)" Text="My Wellness Program">
                <Items>
                    <telerik:RadMenuItem runat="server" NavigateUrl="javascript:load(&quot;Content/Home.aspx&quot;)" Text="Dashboard"></telerik:RadMenuItem>
                    <telerik:RadMenuItem runat="server" NavigateUrl="javascript:load(&quot;/FORUM/default.aspx&quot;)" Text="Forum"></telerik:RadMenuItem>
                    <telerik:RadMenuItem runat="server" NavigateUrl="javascript:top.popUpWin('/Main/MyProgram/MyProgram.aspx',900,650);" Text="My Program"></telerik:RadMenuItem>
                    <telerik:RadMenuItem runat="server" NavigateUrl="javascript:load(&quot;/Main/PALs/PAL_TABS.aspx&quot;)" Text="Personal Activity Log"></telerik:RadMenuItem>
                    <telerik:RadMenuItem runat="server" NavigateUrl="javascript:load(&quot;/Main/DDs/DD.aspx&quot;)" Text="Daily Diary"></telerik:RadMenuItem>
                </Items>
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" NavigateUrl="javascript:load(&quot;Welcome/Content/About.aspx&quot;)" Text="About Us"></telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" NavigateUrl="javascript:load(&quot;Welcome/Content/HealthLifeStyle.aspx&quot;)" Text="Healthy Lifestyle">
                <Items>
                    <telerik:RadMenuItem runat="server" NavigateUrl="javascript:load(&quot;Welcome/Content/BenefitsOfHealth.aspx&quot;)" Text="Benefits of Health"></telerik:RadMenuItem>
                    <telerik:RadMenuItem runat="server" NavigateUrl="javascript:load(&quot;Welcome/Content/TryLivingWellFormula.aspx&quot;)" Text="Tri-Living Well Formula"></telerik:RadMenuItem>
                    <telerik:RadMenuItem runat="server" NavigateUrl="javascript:load(&quot;Welcome/Content/HowItWorks.aspx&quot;)" Text="How it Works"></telerik:RadMenuItem>
                </Items>
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" NavigateUrl="javascript:load(&quot;Welcome/Content/HealthNews.aspx&quot;)" Text="Health News"></telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" NavigateUrl="javascript:load(&quot;Welcome/Content/Resources.aspx&quot;)" Text="Resources"></telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" NavigateUrl="javascript:load(&quot;Welcome/Content/Contact.aspx&quot;)" Text="Contact Us"></telerik:RadMenuItem>
        </Items>
    </telerik:RadMenu>
               <br />
    
        </div>
        <label>
        <span style="white-space:nowrap;">Welcome:&nbsp;<asp:Label ID="lblName" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;
                   <asp:Label ID="lblPrivateMessages" runat="server"></asp:Label> 
                   <span id="lblUnregisteredAccounts_rttWrapper"><asp:Label ID="lblUnregisteredAccounts" runat="server"></asp:Label> </span>
                 
                   <asp:Label ID="lblEdit" runat="server"></asp:Label> <asp:Label ID="lblLogout" runat="server"></asp:Label> 
        <!--old logout/edit section-->
        </span>
        </label>
    </div>
    </div>
    <iframe id="IFRAME_CONTENT" name="IFRAME_CONTENT" class="IFRAME_CONTENT" runat="server" frameborder="0" src="Content/Home.aspx"></iframe>
</div>

<div class="copyright" style="padding:0px 0px 4px 10px;">
<br />

</div>
<!-- END CONTENT -->
<div style="display:none;text-align:right;padding-top:1px;">
	<a href="javascript:top.popUpWin('http://www.adobe.com/reader',600,600);">
		<img src="http://www.adobe.com/images/shared/download_buttons/get_adobe_reader.png" />
	</a>
&nbsp;
	<a href="javascript:top.popUpWin('http://www.adobe.com/flashplayer',600,600);">
		<img src="http://www.adobe.com/images/shared/download_buttons/get_adobe_flash_player.png" />
	</a>
</div>
</center></center></center></center></center></center></center></center></center></center>


</td>
</tr>

</table>


<div style="visibility:hidden;">
    <asp:Button ID="btnRefresh" runat="server" Text="REFRESH" onclick="btnRefresh_Click" />
    <asp:TextBox ID="txtLoggedIn" runat="server" Text="0"></asp:TextBox>
    <iframe src="Refresher.aspx"></iframe>
</div>


    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" UpdatePanelsRenderMode="Inline" >
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="btnRefresh">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="rttUnregisteredAccounts" />
                    <telerik:AjaxUpdatedControl ControlID="lblAdminArea" />
                    <telerik:AjaxUpdatedControl ControlID="lblName" />
                    <telerik:AjaxUpdatedControl ControlID="lblUnregisteredAccounts" />
                    <telerik:AjaxUpdatedControl ControlID="lblEdit" />
                    <telerik:AjaxUpdatedControl ControlID="lblLogout" />
                    <telerik:AjaxUpdatedControl ControlID="txtLoggedIn" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

       
    </form>
</body>
</html>
