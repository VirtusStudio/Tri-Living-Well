<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PAL_TABS.aspx.cs" Inherits="PAL_TABS"
    MasterPageFile="~/MasterPages/User.master"
 %>

<%@ Register Src="~/Controls/UC_Visitlog_Visitlog.ascx" TagName="UC_Visitlog_Visitlog" TagPrefix="uc1" %>


<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
   <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <script src="../../Scripts/Common.js" type="text/javascript"></script>
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


<telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
<!--TAB system-->
<script  type="text/javascript">
function ClientTabSelectedHandler(sender, eventArgs)
{
    var tabStrip = sender;   
    var tab = eventArgs.get_tab();
    document.getElementById(iframeName).src = tab.get_value();
}
function Init() {
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<script type="text/javascript">
Sys.Application.add_load(PAGE_LOAD);  
</script> 


        <table>
        <tr>
            <td>
                <div class="title" style="text-align:left;">Personal Activity Log</div>
            </td>
            <td style="">

            </td>
        </tr>
        </table>
        <br />
          <div>
        <asp:Label ID="lblActivitycalender" runat="server"></asp:Label>
    </div>

    <br />

        <div class="description">
            <div style="padding:0px 15px 0px 0px; text-align:right; vertical-align:middle;">
                        <asp:Label ID="lblEmailCoach" runat="server"></asp:Label>
                        <asp:Label ID="lblProgramForum" runat="server"></asp:Label>
            </div>
            <telerik:RadTabStrip Width="98%" ID="RadTabStrip1" runat="server" OnClientTabSelected="ClientTabSelectedHandler" Skin="Web20" ></telerik:RadTabStrip>
            <iframe frameborder="0" name="IFRAME_CONTENT" id="IFRAME_CONTENT" class="IFRAME_CONTENT IFRAME_TAB" src=""></iframe>
        </div>

        <uc1:UC_Visitlog_Visitlog ID="UC_Visitlog_Visitlog1" runat="server" />
    

    </asp:Content>