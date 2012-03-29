<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_Announcements.ascx.cs"
    Inherits="Controls_UC_Announcements" %>
<%@ Register Src="~/Controls/UC_TextArea.ascx" TagName="UC_TextArea" TagPrefix="uc1" %>
<center class="Round4">
    <center>
        <center>
            <center>
                <center>
                    <center>
                        <center>
                            <center>
                                <center>
                                    <center>
                                        <table>
                                            <tr>
                                                <td>
                                                    <table class="Round4_tblHeader">
                                                        <tr>
                                                            <td>
                                                                News & Announcements
                                                            </td>
                                                            <td style="text-align: right;">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <a class="textLinkWebsite" href="<%=AppConfig.GetBaseSiteUrl() %>Welcome/Content/Announcements.aspx">
                                                        View All</a><br />
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:DataList ID="dlNewsAnnouncments" runat="server">
                                                        <ItemTemplate>
                                                            <table width="100%" cellpadding="2" cellspacing="2" border="0">
                                                                <tr>
                                                                    <td align="left">
                                                                        <span class="textLinkFile"><a target="_blank"  href='<%#GetPDFLink(Eval("StrPDFFilename").ToString(),Eval("StrDirectLink").ToString()) %>'
                                                                            class="textLinkWebsite">
                                                                            <%#AppLib.GetSubString(Eval("StrHeading").ToString(), 30)%></a></span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </td>
                                            </tr>
                                        </table>
                                        <%--<uc1:UC_TextArea ID="UC_TextArea1" runat="server"  TEXTAREA_NAME="HOME_3" />--%>
                                    </center>
                                </center>
                            </center>
                        </center>
                    </center>
                </center>
            </center>
        </center>
    </center>
