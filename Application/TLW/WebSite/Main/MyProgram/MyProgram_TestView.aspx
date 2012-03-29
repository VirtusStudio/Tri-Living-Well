<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyProgram_TestView.aspx.cs" Inherits="MyProgram" %>

<%@ Register Src="~/Controls/UC_Visitlog_Visitlog.ascx" TagName="UC_Visitlog_Visitlog" TagPrefix="uc1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%--Commented by Netsmartz for resolving compile time issues 
<%@ Register Assembly="RadTabStrip.Net2" Namespace="Telerik.WebControls" TagPrefix="radTS" %>--%>

<%@ Register src="../../Controls/UC_PAL_Steps.ascx" tagname="UC_PAL_Steps" tagprefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <link href="../../Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/Table.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/centerRound3.css" rel="stylesheet" type="text/css" />
    
<script type="text/javascript">
function popUpWin(path, x, y)
{ 
    var sURL =  path;
	var features = 'toolbar=0,location=0,status=1,menubar=0,scrollbars=1,resizable=1,width='+x+',height='+y+',left=' + top.window.screenLeft + ',top=' + top.window.screenTop;
	var windownew = window.open(sURL,"new_sub_window",features);
	windownew.focus();
}
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
    //alert(" in Tabs height:");
  
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
    
    var newHeight = docHt + 100;
    if (newHeight < 400)
    {
        newHeight = 400;
    }
   
    if (docHt) iframeEl.style.height = newHeight + "px";
  }
}
</script>


<!--MENU system-->
<script  type="text/javascript">
function load(sUrl)
{
    document.getElementById(iframeName).src = sUrl;
}
function Init() {
    window.focus();
    //document.getElementById(iframeName).src = tabStrip.SelectedTab.Value;
}
</script>


</head>
<body onload="Init();" class="body2">
<form id="form1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

<div style="text-align:right; padding-bottom:5px;">
    <asp:Label ID="lblViewExerciseDetail" runat="server"></asp:Label> | <a href="/Main/MyNutrition/MyNutrition.aspx">Switch to My Nutrition</a>
</div>

<div style="font-size:large;">
                Walking <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=101">101</a> | 
                <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=102">102</a> | 
                <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=103">103</a> <br />
                
                Running <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=201">201</a> | 
                <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=202">202</a> | 
                <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=203">203</a>  <br /> 
                
                Cycling <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=301">301</a> | 
                <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=302">302</a> | 
                <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=303">303</a>  <br /> 
                
                Swimming <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=401">401</a> | 
                <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=402">402</a> | 
                <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=403">403</a>  <br /> 
               
                Female Specific Home <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=501">501</a> | 
                <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=502">502</a> | 
                <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=503">503</a>  <br /> 
                
                Female Specific Gym <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=601">601</a> | 
                <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=602">602</a> | 
                <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=603">603</a>  <br />
                
                Strength Training Home <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=701">701</a> | 
                <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=702">702</a> | 
                <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=703">703</a>  <br /> 
                
                Strength Training Gym <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=801">801</a> | 
                <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=802">802</a> | 
                <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=803">803</a>  <br /> 
                
                Cross Fit <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=901">901</a> | 
                <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=902">902</a> | 
                <a style="font-size:large;" href="MyProgram_TestView.aspx?programID=903">903</a> 
                
                
                </div>



    <div style="height:100%;">
        <table>
        <tr>
            <td>
                <div class="title">My Program</div>
            </td>
            <td style="display:none;">
                <div style="padding:0px 15px 0px 0px; text-align:right; vertical-align:middle;">
                    <asp:Label ID="lblEmailCoach" runat="server"></asp:Label>
                    <asp:Label ID="lblProgramForum" runat="server"></asp:Label>
                </div>
            </td>
        </tr>
        </table>
        <div class="description">
             <center class="Round3"><center><center><center><center><center><center><center><center><center>
                <table class="Round3_tblHeader"><tr><td>My Status</td><td style="text-align:right;"></td></tr></table>   
                <table>
                <tr>
                    <td><uc2:UC_PAL_Steps ID="UC_PAL_Steps1" runat="server" /></td>
                    <td></td>
                    <td style="text-align:right;"><asp:Label ID="lblProgramID" runat="server"></asp:Label> &nbsp;<asp:Label ID="lblLevelID" runat="server"></asp:Label></td>
                </tr>
                </table>
            </center></center></center></center></center></center></center></center></center></center>
         </div>       
                <telerik:RadMenu ID="RadMenu1" runat="server" SkinID="" Skin="Web20" Width="99%">
                </telerik:RadMenu>
             
                <iframe runat="server" frameborder="0" name="IFRAME_CONTENT" id="IFRAME_CONTENT" 
                class="IFRAME_CONTENT IFRAME_TAB" style="height:375px;overflow-y:scroll;overflow-x:hidden;"></iframe>
             
        
    </div>

        
        <uc1:UC_Visitlog_Visitlog ID="UC_Visitlog_Visitlog1" runat="server" />
    </form>
    
</body>
</html>
