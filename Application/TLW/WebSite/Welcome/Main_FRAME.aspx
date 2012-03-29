<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main_FRAME.aspx.cs" Title="Tri Living Well" Inherits="Main_Main_FRAME" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Src="~/Controls/UC_TextArea.ascx" TagName="UC_TextArea" TagPrefix="uc3" %>
<%@ Register Src="~/Controls/UC_Login_Register.ascx" TagName="UC_Login_Register"
    TagPrefix="uc1" %>
<%@ Register Src="~/Controls/UC_Announcements.ascx" TagName="UC_Announcements" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>
       </title>
    <link href="../Styles/Corporate.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/Website.css" rel="stylesheet" type="text/css" />
    <!--popUpWin-->

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
<body class="WebsiteBody" >
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div style="position: absolute; left: 50%; margin-left: -450px; top: 10px; width: 200px;
        height: 100px; border: solid 0px red;" onclick="Welcome/Main_Frame.aspx">
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
                                <telerik:RadMenuItem runat="server" Text="Home" NavigateUrl="~/Welcome/main_frame.aspx">
                                </telerik:RadMenuItem>
                                <telerik:RadMenuItem runat="server" Text="About Us" NavigateUrl="~/Welcome/Content/About.aspx">
                                </telerik:RadMenuItem>
                                <telerik:RadMenuItem runat="server" Text="Why TLW" NavigateUrl="~/Welcome/Content/WhyTLW.aspx">
                                </telerik:RadMenuItem>
                                <telerik:RadMenuItem runat="server" Text="TLW Concept" NavigateUrl="~/Welcome/Content/HowItWorks.aspx">
                                    <Items>
                                        <telerik:RadMenuItem runat="server" Text="Fitness" NavigateUrl="~/Welcome/Content/TLWFitness.aspx">
                                        </telerik:RadMenuItem>
                                        <telerik:RadMenuItem runat="server" Text="Nutrition" NavigateUrl="~/Welcome/Content/TLWNutrition.aspx">
                                        </telerik:RadMenuItem>
                                        <telerik:RadMenuItem runat="server" Text="Wellness" NavigateUrl="~/Welcome/Content/TLWWellness.aspx">
                                        </telerik:RadMenuItem>
                                    </Items>
                                </telerik:RadMenuItem>
                                <telerik:RadMenuItem runat="server" Text="Contact Us" NavigateUrl="~/Welcome/Content/Contact.aspx">
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
                    frameborder="0" class="IFRAME_CONTENT" visible="false" src="Content/Home.aspx">
                </iframe>
                <div class="BarHorizontal" style="width: 950px;">
                </div>
                <table style="width: 950px; border-top: solid 1px #ffffff; border-bottom: solid 1px #ffffff;">
                    <tr>
                        <td>
                            <a class="aImageButton" style="width: 315px; height: 216px; background-image: url(<%=AppConfig.GetBaseSiteUrl() %>images/corporate/buttons/aImgBtn/aImgBtnFitness.jpg);"
                                href="<%=AppConfig.GetBaseSiteUrl() %>Welcome/Content/TLWFitness.aspx"></a>
                        </td>
                        <td style="width: 100%; padding: 0px 2px 0px 3px;">
                            <a class="aImageButton" style="width: 315px; height: 216px; background-image: url(<%=AppConfig.GetBaseSiteUrl() %>images/corporate/buttons/aImgBtn/aImgBtnNutrition.jpg);"
                                href="<%=AppConfig.GetBaseSiteUrl() %>Welcome/Content/TLWNutrition.aspx"></a>
                        </td>
                        <td>
                            <a class="aImageButton" style="width: 315px; height: 216px; background-image: url(<%=AppConfig.GetBaseSiteUrl() %>images/corporate/buttons/aImgBtn/aImgBtnWellness.jpg);"
                                href="<%=AppConfig.GetBaseSiteUrl() %>Welcome/Content/TLWWellness.aspx"></a>
                        </td>
                    </tr>
                </table>
                <div class="BarHorizontal" style="width: 950px;">
                </div>
                <table style="width: 950px;">
                    <tr>
                        <td class="top Round4Container">
                            <div>
                                <uc1:uc_login_register id="UC_Login_Register1" runat="server" />
                            </div>
                            <div>
                                <uc2:uc_announcements id="UC_Announcements1" runat="server" />
                            </div>
                        </td>
                        <td class="top Round5Container" style="width: 100%;">
                            <center class="Round5">
                                <center>
                                    <center>
                                        <center>
                                            <center>
                                                <center>
                                                    <center>
                                                        <center>
                                                            <center>
                                                                <center>
                                                                    <table class="Round5_tblHeader">
                                                                        <tr>
                                                                            <td>
                                                                                Tri Living Well
                                                                            </td>
                                                                            <td style="text-align: right;">
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <uc3:uc_textarea id="UC_TextArea_TriLivingWell" runat="server" textarea_name="HOME_1" />
                                                                </center>
                                                            </center>
                                                        </center>
                                                    </center>
                                                </center>
                                            </center>
                                        </center>
                                    </center>
                                </center>
                            </center>
                            <br />
                            <center class="Round5">
                                <center>
                                    <center>
                                        <center>
                                            <center>
                                                <center>
                                                    <center>
                                                        <center>
                                                            <center>
                                                                <center>
                                                                    <table class="Round5_tblHeader">
                                                                        <tr>
                                                                            <td>
                                                                                Why Wellness
                                                                            </td>
                                                                            <td style="text-align: right;">
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <uc3:uc_textarea id="UC_TextArea_WhyWellness" runat="server" textarea_name="HOME_2" />
                                                                </center>
                                                            </center>
                                                        </center>
                                                    </center>
                                                </center>
                                            </center>
                                        </center>
                                    </center>
                                </center>
                            </center>
                            <br />
                            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="https://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,30,0"
                                width="650" height="275">
                                <param name="movie" value="Content/swf/HomeFlash.swf" />
                                <param name="quality" value="best" />
                                <param name="LOOP" value="true" />
                                <param name="menu" value="false" />
                                <embed src="Content/swf/HomeFlash.swf" quality="best" pluginspage="https://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"
                                    type="application/x-shockwave-flash" width="650" height="275" loop="true"></embed>
                            </object>
                        </td>
                    </tr>
                </table>
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
    </form>
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
</body>
</html>
