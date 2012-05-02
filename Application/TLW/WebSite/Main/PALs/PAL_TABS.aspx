<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PAL_TABS.aspx.cs" Inherits="PAL_TABS"
    MasterPageFile="~/MasterPages/User.master" %>

<%@ Register Src="~/Controls/UC_Visitlog_Visitlog.ascx" TagName="UC_Visitlog_Visitlog"
    TagPrefix="uc1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../../Scripts/Common.js" type="text/javascript"></script>
    <!--fix IE tableBackgroundImageCache-->
    <script type="text/javascript">
        try { document.execCommand("BackgroundImageCache", false, true); } catch (err) { }
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
            var iframeEl = document.getElementById ? document.getElementById(iframeName) : document.all ? document.all[iframeName] : null;
            //alert("setIframeHeight() - iframeWin=" + iframeWin);
            //alert("setIframeHeight() - iframeEl=" + iframeEl);
            if (iframeEl && iframeWin) {
                if (bTopScroll) iframeEl.style.height = "auto"; //causes a top scroll to occur & help resize for some shorter content pages
                var docHt = getDocHeight(iframeWin.document);
                // need to add to height to be sure it will all show
                //alert("setIframeHeight() - docHt=" + docHt);

                var newHeight = docHt + 50;
                if (newHeight < 400) {
                    newHeight = 400;
                }

                if (docHt) iframeEl.style.height = newHeight + "px";
            }
        }

    </script>


     <script type="text/javascript">
         function popUpWin(path, x, y) {



             var sURL = '<%=AppConfig.GetBaseSiteUrl() %>' + path;
             var features = 'toolbar=0,location=0,status=1,menubar=0,scrollbars=1,resizable=1,width=' + x + ',height=' + y + ',left=' + top.window.screenLeft + ',top=' + top.window.screenTop;
             var windownew = window.open(sURL, "new_window", features);
             try { windownew.focus(); } catch (err) { }
         }
         function load(Filepath) {
             if (Filepath.indexOf("//") > -1) {
                 window.location = Filepath;
             }
             else {
                 window.location = '<%=AppConfig.GetBaseSiteUrl() %>' + Filepath;
             }
         }
        </script>
    <telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
        <!--TAB system-->
        <script type="text/javascript">
            function ClientTabSelectedHandler(sender, eventArgs) {
                var tabStrip = sender;
                var tab = eventArgs.get_tab();
                document.getElementById(iframeName).src = tab.get_value();
            }
            function Init() {
                var tabStrip = $find("<%= RadTabStrip1.ClientID %>");
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
 <div style="background: none repeat scroll 0% 0% rgb(255, 255, 255);   margin: 0px auto; padding: 10px; width:886px; overflow:hidden;" >
    <table style="background: none repeat scroll 0% 0% rgb(255, 255, 255); margin: 0px auto; padding: 10px; width: 886px; background-color :#484848;font-style: normal;
    margin-bottom: 2px; padding: 2px 10px 0;text-transform: uppercase;white-space: nowrap; color :#F4F6F4;font-size :16px;font-family :'Arial Black';overflow:hidden;">
        <tr>
            <td>
                <div >
                    Personal Activity Log</div>
            </td>
            <td style="">
            </td>
        </tr>
    </table>
    <br />
    <div style="background: none repeat scroll 0% 0% rgb(255, 255, 255);   margin: 0px auto; padding: 10px; width:886px; overflow:hidden;" >
        <asp:Label ID="lblActivitycalender"  runat="server"></asp:Label>
    </div>
    <br />
    <div style="background: none repeat scroll 0% 0% rgb(255, 255, 255);  border: 1px solid #999999; padding: 8px; margin: 0px auto; padding: 10px; width: 886px; background-color :#E8E6E7;font-family :'Arial Black';overflow:hidden;">
        <div style="padding: 0px 15px 0px 0px; text-align: right; vertical-align: middle;">
            <asp:Label ID="lblEmailCoach" runat="server"></asp:Label>
            <asp:Label ID="lblProgramForum" runat="server"></asp:Label>
        </div>
        <telerik:RadTabStrip Width="98%" ID="RadTabStrip1" runat="server" OnClientTabSelected="ClientTabSelectedHandler"
            Skin="Web20">
        </telerik:RadTabStrip>
        <iframe frameborder="0" name="IFRAME_CONTENT" id="IFRAME_CONTENT" class="IFRAME_CONTENT IFRAME_TAB"
            src=""></iframe>
    </div>
    <uc1:UC_Visitlog_Visitlog ID="UC_Visitlog_Visitlog1" runat="server" />

    </div>
</asp:Content>
