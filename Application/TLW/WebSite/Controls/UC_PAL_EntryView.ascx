<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_PAL_EntryView.ascx.cs"
    Inherits="UC_PAL_EntryView" %>
<script language="javascript" type="text/javascript">
    function DeletePAL(varId) {

        if (confirm('Are you sure that you want to delete this log entry?')) {
            var varFullURL = window.document.location.pathname;
            var varIndexofQuestionMark = varFullURL.indexOf(".aspx");
            var varRedirectURL = '';
            varRedirectURL = varFullURL.substring(0, (varIndexofQuestionMark));
            window.document.location.href = varRedirectURL + ".aspx?iddel=" + varId;
        }
        } 
</script>
<center class="Round2">
    <center>
        <center>
            <center>
                <center>
                    <center>
                        <center>
                            <center>
                                <center>
                                    <center>
                                        <table class="tblItems" style="width: 100%;">
                                            <tr class="trAlt">
                                                <td>
                                                    <table width="100%">
                                                        <tr>
                                                            <td>
                                                                Date
                                                            </td>
                                                            <td align="right">
                                                                <a href='javascript:void();' id="ancDelete" runat="server">
                                                                    <img src="<%=AppConfig.GetBaseSiteUrl() %>images/reports/xRed.gif" height="14" width="10"
                                                                        border="0" alt="Delete" title="Delete" />
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 100%; padding-left: 10px;">
                                                    <asp:Label ID="lblPalEntryDate" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr class="trAlt">
                                                <td>
                                                    Activity&nbsp;Type
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-left: 10px;">
                                                    <asp:Label ID="lblPalEntryTypeText" runat="server"></asp:Label>
                                                </td>
                                            </tr>


                                            <tr class="trAlt">
                                                <td>
                                                    Activity
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-left: 10px;">
                                                    <asp:Label ID="lblPalEntryActivityText" runat="server"></asp:Label>
                                                </td>
                                            </tr>




                                            <tr class="trAlt">
                                                <td>
                                                    Time
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-left: 10px;">
                                                    <asp:Label ID="lblPalEntryTimeText" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr class="trAlt">
                                                <td>
                                                    Duration
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-left: 10px;">
                                                    <asp:Label ID="lblPalEntryDurationText" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr class="trAlt">
                                                <td>
                                                    Intensity
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-left: 10px;">
                                                    <asp:Label ID="lblPalEntryIntensityText" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr class="trAlt">
                                                <td>
                                                    Equivalent Met
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-left: 10px; color: Maroon;">
                                                    <asp:Label ID="lblMetEquivalent" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr class="trAlt">
                                                <td>
                                                    Comment
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding-left: 10px; white-space: normal;">
                                                    <div id="divComment" runat="server" onmouseout="this.style.display='none';" style="width: 160px;
                                                        display: none; position: absolute; z-index: 0; background-color: White;">
                                                        <asp:Label ID="lblPalEntryComment" runat="server" Style="display: block; padding: 5px 20px 20px 5px;
                                                            border: solid 1px #000099; background-color: #ffffff;"></asp:Label>
                                                    </div>
                                                    <asp:Label ID="lblPalEntryCommentShort" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
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
