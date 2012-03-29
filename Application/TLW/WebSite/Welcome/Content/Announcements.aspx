<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Announcements.aspx.cs" Inherits="Annoucements" %>
 
<%@ Register Src="~/Controls/UC_TextArea.ascx" TagName="UC_TextArea" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100%;">
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
                                                            Announcments
                                                        </td>
                                                        <td style="text-align: right;">
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
        <div class="demoContent" style="padding: 0px 15px 15px 15px;">
            <table>
                <tr>
                    <td>
                        <asp:DataList ID="dlNewsAnnouncments" runat="server">
                            <ItemTemplate>
                                <table width="100%" cellpadding="2" cellspacing="2" border="0">
                                    <tr>
                                        <td align="left">
                                            <span class="textLinkFile"><a class="textLinkFile" target="_blank" 
                                            href='<%#GetPDFLink(Eval("StrPDFFilename").ToString(),Eval("StrDirectLink").ToString()) %>'
                                                >
                                                <%#Eval("StrHeading").ToString()%></a></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="textLinkDescription">
                                            <%#Eval("StrDescription").ToString()%>
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
        </div>
    </div>
</asp:Content>
