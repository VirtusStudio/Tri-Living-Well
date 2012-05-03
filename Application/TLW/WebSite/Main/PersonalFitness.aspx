<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/User.master"
    CodeFile="PersonalFitness.aspx.cs" Inherits="PersonalFitness" Title="Personal Fitness" %>
<%@ Register Src="~/Controls/UC_Login_Register.ascx" TagName="UC_Login_Register"
    TagPrefix="uc2" %>
<%@ Register Src="~/Controls/UC_Home_1_Control.ascx" TagName="UC_Home_1_Control"
    TagPrefix="uc3" %>
<%@ Register Src="~/Controls/UC_EnterActivity_PopUp.ascx" TagName="UC_EnterActivity_PopUp" TagPrefix="uc2" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="MetaBuilders.WebControls.RollOverLink" Namespace="MetaBuilders.WebControls"
    TagPrefix="mbrol" %>
    <%@ Register Src="~/Controls/UC_TextArea.ascx" TagName="UC_TextArea" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../Scripts/Common.js" type="text/javascript"></script>
    <script type="text/javascript">
        function popupOpen(path, x, y) {
            var sURL = path;
            var features = 'toolbar=0,location=0,status=1,menubar=0,scrollbars=1,resizable=1,width=' + x + ',height=' + y + ',left=' + top.window.screenLeft + ',top=' + top.window.screenTop;
            var windownew = window.open(sURL, "new_window", features);
            try { windownew.focus(); } catch (err) { }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <iframe id="IFRAME_CONTENT" name="IFRAME_CONTENT" class="IFRAME_CONTENT" runat="server"
        frameborder="0" style="display:none;" src="Content/Home.aspx"></iframe>

<div style="background: none repeat scroll 0% 0% rgb(255, 255, 255);   margin: 0px auto; padding: 10px; width:886px; overflow:hidden;" >
    <div class="overview">
            <table>
                <tr>
                    <td>
                        <uc1:uc_textarea id="UC_TextArea1" runat="server" textarea_name="PersonalFitness" />
                       
                    </td>
                </tr>
            </table>
            </div>
<div style="height:100px;"></div>
    <table>
        <tr>
            <td>
                <table width="100%">
                    <tr valign="top">
                        <td align="left">
                            <img alt="library" src='<%=AppConfig.GetBaseSiteUrl() %>images/personalfitness.png' border="0" />
                            <hr />
                            <p style="font-weight:bold;text-align:center;">Last Workout:</p>
                            <p style="text-align:center;"><asp:Label ID="labelLastWorkout" runat="server" /></p>
                            <p style="text-align:center;"><span style="font-weight:bold;">Workout History: </span>(7 Days)</p>
                            <p style="text-align:center;"><asp:Label ID="labelHistory" runat="server" /></p>
                        </td>
                        <td align="left" colspan="2">
                            <table>
                                <tr style="border-top:thick solid Gray;border-bottom:thick solid Gray;">
                                    <td>&nbsp;</td>
                                    <td>Recent Activity</td>
                                    <td>Weekly Total</td>
                                    <td>Cumulative</td>
                                </tr>
                                <tr>
                                    <td>Date</td>
                                    <td style="background-color:#EAF0F6;"><asp:Label ID="labelLastDate" runat="server" /></td>
                                    <td style="background-color:#EAF0F6;"><asp:Label ID="labelWeekDate" runat="server" /></td>
                                    <td style="background-color:#EAF0F6;"><asp:Label ID="LabelCumulativeDate" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>Weight</td>
                                    <td><asp:Label ID="labelLastWeight" runat="server" /></td>
                                    <td><asp:Label ID="labelWeekWeight" runat="server" /></td>
                                    <td><asp:Label ID="labelCumulativeWeight" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>Activity</td>
                                    <td style="background-color:#EAF0F6;"><asp:Label ID="labelLastActivity" runat="server" /></td>
                                    <td style="background-color:#EAF0F6;"><asp:Label ID="labelWeekActivity" runat="server" /></td>
                                    <td style="background-color:#EAF0F6;"><asp:Label ID="labelCumulativeActivity" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>Duration</td>
                                    <td><asp:Label ID="labelLastDuration" runat="server" /></td>
                                    <td><asp:Label ID="labelWeekDuration" runat="server" /></td>
                                    <td><asp:Label ID="labelCumulativeDuration" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>Intensity</td>
                                    <td style="background-color:#EAF0F6;"><asp:Label ID="labelLastIntensity" runat="server" /></td>
                                    <td style="background-color:#EAF0F6;"><asp:Label ID="labelWeekIntensity" runat="server" /></td>
                                    <td style="background-color:#EAF0F6;"><asp:Label ID="labelCumulativeIntensity" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>MET Minutes</td>
                                    <td><asp:Label ID="labelLastMet" runat="server" /></td>
                                    <td><asp:Label ID="labelWeekMet" runat="server" /></td>
                                    <td><asp:Label ID="labelCumulativeMet" runat="server" /></td>
                                </tr>
                                <tr style="border-bottom:thick solid Gray;">
                                    <td>Energy Expended</td>
                                    <td style="background-color:#EAF0F6;"><asp:Label ID="labelLastEnergy" runat="server" /></td>
                                    <td style="background-color:#EAF0F6;"><asp:Label ID="labelWeekEnergy" runat="server" /></td>
                                    <td style="background-color:#EAF0F6;"><asp:Label ID="labelCumulativeEnergy" runat="server" /></td>
                                </tr>
                                <tr><td colspan="4" align="right">&nbsp;</td></tr>
                                <tr>
                                    <td colspan="2" >&nbsp;</td>
                                    <td align="center">
                                        <a href="javascript:addEntry('');"><img src="<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconPalEntryCreate.gif" /><br />Record Activity</a>
                                        <uc2:UC_EnterActivity_PopUp id="UC_EnterActivity_PopUp1" runat="server"></uc2:UC_EnterActivity_PopUp> 
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        function ShowPopup(varPagePath) {
            var varPath = '<%=AppConfig.GetBaseSiteUrl() %>' + varPagePath;
            OpenPopup(varPath, "Popup", 600, 500);
        }
       
    </script>
<div style="height:100px;"></div>
</asp:Content>
