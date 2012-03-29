<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<%@ Register Src="~/Controls/UC_TextArea.ascx" TagName="UC_TextArea" TagPrefix="uc3" %>
<%@ Register Src="~/Controls/UC_Login_Register.ascx" TagName="UC_Login_Register"
    TagPrefix="uc1" %>
<%@ Register Src="~/Controls/UC_Announcements.ascx" TagName="UC_Announcements" TagPrefix="uc2" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--########################################################
    Copyright 2007 Blue Grotto Technologies, Inc.
    This code is owned by Blue Grotto Technologies, Inc
    It may not be copied, shared or modified.
###########################################################-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Home</title>
    <%--<link href="../Styles/Corporate.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Table.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/centerRound4.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/centerRound5.css" rel="stylesheet" type="text/css" />
    Above lines are commented by Netsmartz
    --%>
    <script type="text/javascript">
    bIsPostBack = false;
    function Page_Load()//
    {
        if (!bIsPostBack)//
        {
            bIsPostBack = true;
        }

        
    }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <script type="text/javascript">
    Sys.Application.add_load(Page_Load);
    </script>
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
                    <uc1:UC_Login_Register ID="UC_Login_Register1" runat="server" />
                </div>
                <div>
                    <uc2:UC_Announcements ID="UC_Announcements1" runat="server" />
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
                                                        <uc3:UC_TextArea ID="UC_TextArea_TriLivingWell" runat="server" TEXTAREA_NAME="HOME_1" />
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
                                                        <uc3:UC_TextArea ID="UC_TextArea_WhyWellness" runat="server" TEXTAREA_NAME="HOME_2" />
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
                    <param name="movie" value="swf/HomeFlash.swf" />
                    <param name="quality" value="best" />
                    <param name="LOOP" value="true" />
                    <param name="menu" value="false" />
                    <embed src="swf/HomeFlash.swf" quality="best" pluginspage="https://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"
                        type="application/x-shockwave-flash" width="650" height="275" loop="true"></embed>
                </object>
            </td>
        </tr>
    </table>
   <%-- <telerik:RadAjaxManager ID="telerikjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="btnChangeMode">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="UC_TextArea_TriLivingWell" LoadingPanelID="Ajaxloadingpanel1" />
                    <telerik:AjaxUpdatedControl ControlID="UC_TextArea_WhyWellness" LoadingPanelID="Ajaxloadingpanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>--%>
    </form>
</body>
</html>
