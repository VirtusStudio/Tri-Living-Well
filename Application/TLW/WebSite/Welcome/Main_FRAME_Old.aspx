<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main_FRAME_Old.aspx.cs" Inherits="Main_Main_FRAME" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
        <%= System.Configuration.ConfigurationSettings.AppSettings["SITE_NAME"] %></title>
    <link href="../Styles/Corporate.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/Website.css" rel="stylesheet" type="text/css" />
    <!--popUpWin-->
    <script type="text/javascript">
        function popUpWin(path, x, y) {
            var sURL = path;
            var features = 'toolbar=0,location=0,status=1,menubar=0,scrollbars=1,resizable=1,width=' + x + ',height=' + y + ',left=' + top.window.screenLeft + ',top=' + top.window.screenTop;
            var windownew = window.open(sURL, "new_window", features);
            try { windownew.focus(); } catch (err) { }
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

        function setIframeHeightForOutSide() {
            refresh();
            var iframeWin = window.frames[iframeName];
            var iframeEl = document.getElementById ? document.getElementById(iframeName) : document.all ? document.all[iframeName] : null;
            //alert("setIframeHeight() - iframeWin=" + iframeWin);
            //alert("setIframeHeight() - iframeEl=" + iframeEl);
            if (iframeEl && iframeWin) {
                if (bTopScroll) iframeEl.style.height = "800px"; //causes a top scroll to occur & help resize for some shorter content pages
                var docHt = getDocHeight(iframeWin.document);
                // need to add to height to be sure it will all show
                //alert("setIframeHeight() - docHt=" + docHt);
               
                  
                    iframeEl.style.height = "800px";
                    iframeEl.style.width = '960px';
                 
            }
            
        }
        function setIframeHeight() {
            refresh();
            var iframeWin = window.frames[iframeName];
            var iframeEl = document.getElementById ? document.getElementById(iframeName) : document.all ? document.all[iframeName] : null;
            //alert("setIframeHeight() - iframeWin=" + iframeWin);
            //alert("setIframeHeight() - iframeEl=" + iframeEl);
            if (iframeEl && iframeWin) {
                if (bTopScroll) iframeEl.style.height = "auto"; //causes a top scroll to occur & help resize for some shorter content pages
                var docHt = getDocHeight(iframeWin.document);
                // need to add to height to be sure it will all show
                //alert("setIframeHeight() - docHt=" + docHt);
                if (docHt)//
                {
                    if (docHt < 300)//
                    {
                        docHt = 300;
                    }
                    iframeEl.style.height = docHt + 50 + "px";
                    iframeEl.style.width = '960px';
                }
            }
            
        }



        var bTopScroll = true;
        function setIframeHeight_NoTopScroll() {
            bTopScroll = false;
            setIframeHeight();
            bTopScroll = true;
        }

        function setIframeHeightPlus(i) {
            var iframeWin = window.frames[iframeName];
            var iframeEl = document.getElementById ? document.getElementById(iframeName) : document.all ? document.all[iframeName] : null;
            //alert("setIframeHeight() - iframeWin=" + iframeWin);
            //alert("setIframeHeight() - iframeEl=" + iframeEl);
            if (iframeEl && iframeWin) {
                iframeEl.style.height = "auto"; // helps resize (for some) if new doc shorter than previous  
                var docHt = getDocHeight(iframeWin.document);
                // need to add to height to be sure it will all show
                //alert("setIframeHeight() - docHt=" + docHt);
                if (docHt) {
                    iframeEl.style.height = docHt + i + "px";
                    iframeEl.style.width = '960px';
                }
                //iframeEl.style.width = "100%";
            }

            
        }

    </script>
    <!--refreshing user status-->
    <script type="text/javascript">
        function refresh() {
            document.getElementById('btnRefresh').click();
        }
    </script>
</head>
<body class="WebsiteBody">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div style="position: absolute; left: 50%; margin-left: -450px; top: 10px; width: 200px;
        height: 100px; border: solid 0px red;" onclick="javascript:load('Welcome/Content/Home.aspx');">
    </div>
    <table class="center" style="width: 950px;">
        <tr>
            <td>
                <asp:HiddenField ID="hdSiteUrl" runat="server" />
                <div class="WebsiteHeader" style="border: solid 0px red;">
                    <div style="padding: 89px 0px 0px 450px; border: solid 0px green;">
                        <telerik:RadMenu CssClass="WebsiteHeaderMenu" EnableScreenBoundaryDetection="False"
                            ID="RadMenu1" runat="server" EnableEmbeddedSkins="False" Skin="Forest">
                            <Items>
                                <telerik:RadMenuItem runat="server" Text="Home" NavigateUrl="javascript:load('Welcome/Content/Home.aspx');">
                                </telerik:RadMenuItem>
                                <telerik:RadMenuItem runat="server" Text="About Us" NavigateUrl="javascript:load('Welcome/Content/About.aspx');">
                                </telerik:RadMenuItem>
                                <telerik:RadMenuItem runat="server" Text="Why TLW" NavigateUrl="javascript:load('Welcome/Content/WhyTLW.aspx');">
                                </telerik:RadMenuItem>
                                <telerik:RadMenuItem runat="server" Text="TLW Concept" NavigateUrl="javascript:load('Welcome/Content/HowItWorks.aspx');">
                                    <Items>
                                        <telerik:RadMenuItem runat="server" Text="Fitness" NavigateUrl="javascript:load('Welcome/Content/TLWFitness.aspx');">
                                        </telerik:RadMenuItem>
                                        <telerik:RadMenuItem runat="server" Text="Nutrition" NavigateUrl="javascript:load('Welcome/Content/TLWNutrition.aspx');">
                                        </telerik:RadMenuItem>
                                        <telerik:RadMenuItem runat="server" Text="Wellness" NavigateUrl="javascript:load('Welcome/Content/TLWWellness.aspx');">
                                        </telerik:RadMenuItem>
                                    </Items>
                                </telerik:RadMenuItem>
                                <telerik:RadMenuItem runat="server" Text="Contact Us" NavigateUrl="javascript:load('Welcome/Content/Contact.aspx');">
                                </telerik:RadMenuItem>
                            </Items>
                        </telerik:RadMenu>
                    </div>
                </div>
                <div style="display: none;">
                    <asp:Label ID="lblName" runat="server"></asp:Label>
                    <asp:Label ID="lblEdit" runat="server"></asp:Label>
                    <asp:Label ID="lblLogout" runat="server"></asp:Label>
                </div>
                <iframe style="width: 950px;" id="IFRAME_CONTENT" name="IFRAME_CONTENT" runat="server"
                    frameborder="0" class="IFRAME_CONTENT" src="Content/Home.aspx"></iframe>
                <div class="WebsiteFooter" style="width: 930px;">
                    <table>
                        <tr>
                            <td class="top">
                                Tri-Living Well<br />
                                1008 Upper Gulph Road<br />
                                Suite 300<br />
                                Wayne, PA 19087
                            </td>
                            <td class="top" style="text-align: right;">
                                <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
                                    <%=ConfigurationSettings.AppSettings["SITE_PHONE"] %><br />
                                    Email:
                                    <%=ConfigurationSettings.AppSettings["SITE_EMAIL"] %><br />
                                </telerik:RadCodeBlock>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    <div style="display: none;">
        <asp:Button ID="btnRefresh" runat="server" Text="REFRESH" OnClick="btnRefresh_Click" />
    </div>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="btnRefresh">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="lblName" />
                    <telerik:AjaxUpdatedControl ControlID="lblEdit" />
                    <telerik:AjaxUpdatedControl ControlID="lblLogout" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <%--<asp:Button ID="Button1" runat="server" onclick="Button1_Click"  Text="Change Mode" />--%>
    </form>
</body>
</html>
