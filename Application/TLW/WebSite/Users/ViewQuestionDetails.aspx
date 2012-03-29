<%@ Page Title="Vew Questions Details" Language="C#" MasterPageFile="~/MasterPages/User.master"
    AutoEventWireup="true" CodeFile="ViewQuestionDetails.aspx.cs" Inherits="Users_ViewQuestionDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td align="left">
                <table class="title">
                    <tr>
                        <td align="left">
                           Question Details
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="right">
                <a class="aButtonSmall" href="javascript:history.back();">Back</a>
            </td>
        </tr>
    </table>
    <div class="demoContent" style="padding: 0px 15px 15px 15px;">
        <table cellpadding="4" cellspacing="4" border="0">
            <tr>
                <td colspan="2" align="center">
                    <asp:Label ID="lblMsg" runat="server" CssClass="required"></asp:Label>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td align="right" style="width:20%;" valign="top">
                    <b>Category:</b>:&nbsp;&nbsp;
                </td>
                <td align="left" valign="top">
                    <asp:Label ID="lblCategory" runat="server"></asp:Label>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td align="right" valign="top">
                    <b>Question:</b>&nbsp;&nbsp;
                </td>
                <td align="left" valign="top">
                    <asp:Label ID="lblQuestion" runat="server"></asp:Label>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td align="right" valign="top">
                    <b>Subject:</b>&nbsp;&nbsp;
                </td>
                <td align="left" valign="top">
                    <asp:Label ID="lblSubject" runat="server"></asp:Label>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td align="right" valign="top">
                    <b>Comments:</b>&nbsp;&nbsp;
                </td>
                <td align="left" valign="top">
                    <asp:Label ID="lblComments" runat="server"></asp:Label>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td align="right" valign="top">
                    <b>Question Type:</b>&nbsp;&nbsp;
                </td>
                <td align="left" valign="top">
                    <asp:Label ID="lblQuestionType" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 30px;">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 30px;">
                    &nbsp;
                </td>
            </tr>
            <tr id="trAnswer" runat="server">
                <td colspan="2">
                    <table width="100%">
                        <tr>
                            <td align="left" valign="top">
                                Answer by Health Coach:
                            </td>
                        </tr>
                        <tr>
                            <td align="left" valign="top">
                                <asp:GridView ID="GVAnswer" AutoGenerateColumns="False" runat="server" EmptyDataText="<br /><br />No Record Found.<br /><br />"
                                    EmptyDataRowStyle-CssClass="required" EmptyDataRowStyle-HorizontalAlign="Center"
                                    Width="100%" AllowPaging="false" AllowSorting="false" PagerStyle-CssClass="paging"
                                    CellSpacing="1" CellPadding="0" border="0" GridLines="None" BorderWidth="0">
                                    <RowStyle CssClass="gridItem" />
                                    <HeaderStyle CssClass="gridHeader" />
                                    <AlternatingRowStyle CssClass="gridAltItem" />
                                    <Columns>
                                        <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Answered On"
                                            ItemStyle-HorizontalAlign="Left" HeaderStyle-Width="100" HeaderStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <%#AppLib.GetFormattedDate(Eval("DtAnsweredOn").ToString())%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;Answer"
                                            ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <%#Eval("StrAnswer").ToString()%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Answered By"
                                            ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <%#AppLib.GetSubString(Eval("StrAnsweredBy").ToString(), 50)%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
