<%@ Page Title="Section details" Language="C#" MasterPageFile="~/MasterPages/User.master"
    AutoEventWireup="true" CodeFile="HotSectionDetails.aspx.cs" Inherits="Users_HotSectionDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="background: none repeat scroll 0% 0% rgb(255, 255, 255); margin: 0px auto; padding: 10px; width: 886px; overflow:hidden;">
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
                                                            What's Hot
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
                    <td align="right">
                        <a href='<%=AppConfig.GetBaseSiteUrl() %>Main/Main_Frame.aspx'>Back</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:DataList ID="dlHotLinks" runat="server" RepeatColumns="1" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <table cellpadding="2" cellspacing="2" border="0">
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr style="vertical-align: top">
                                        <td>
                                            <a name='<%#Eval("IntHotSectionId") %>'>
                                                <%#Eval("StrHeading").ToString()%>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%#Eval("StrDescription").ToString()%>
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
