<%@ Page Title="My Favorite List" Language="C#" MasterPageFile="~/MasterPages/User.master" AutoEventWireup="true" CodeFile="MyFavoriteList.aspx.cs" Inherits="Users_MyFavoriteList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../Scripts/Common.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="90%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <table class="title">
                    <tr>
                        <td align="left">
                            My Favorite List
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="lblMsg" runat="server" CssClass="required"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <div class="">
                    <center class="Round3">
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
                                                                        <table class="Round3_tblHeader">
                                                                            <tr>
                                                                                <td>
                                                                                    Favorite Details
                                                                                </td>
                                                                                <td style="text-align: right;">
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left">
                                                                        <asp:Label ID="lblResultMsg" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div class="divBorder">
                                                                            <asp:GridView ID="GVFavoriteList" AutoGenerateColumns="False" runat="server" EmptyDataText="<br /><br />No Record Found.<br /><br />"
                                                                                EmptyDataRowStyle-CssClass="required" EmptyDataRowStyle-HorizontalAlign="Center"
                                                                                Width="100%" AllowPaging="false" AllowSorting="false" PagerStyle-CssClass="paging"
                                                                                CellSpacing="1" CellPadding="0" border="0" GridLines="None" BorderWidth="0"
                                                                                OnRowCommand="GVFavoriteList_RowCommand"
                                                                                >
                                                                                <RowStyle CssClass="gridItem" />
                                                                                <HeaderStyle CssClass="gridHeader" />
                                                                                <AlternatingRowStyle CssClass="gridAltItem" />
                                                                                <Columns><asp:TemplateField Visible="false" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblFavoriteId" runat="server" Visible="false" Text='<%#Eval("IntFavoriteId") %>'></asp:Label>
                                                                                            <asp:Label ID="lblFavoriteTypeId" runat="server" Visible="false" Text='<%#Eval("intFavoriteTypeId") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Added On"
                                                                                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <%#AppLib.GetFormattedDate(Eval("DtCreatedOn").ToString())%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Title"
                                                                                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <span title='<%#Eval("strTitle").ToString() %>'>
                                                                                            <%#AppLib.GetSubString(Eval("strTitle").ToString(), 50)%></span>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Favorite Type"
                                                                                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <%#Eval("strFavoriteType").ToString().Equals("NewsAnnouncements") ? "News & Announcements" : Eval("strFavoriteType").ToString()%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText=""
                                                                                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                             <a class="lnkBtn"  href='ViewFavoriteDetails.aspx?fid=<%#Eval("IntFavoriteId")  %>&type=<%#Eval("strFavoriteType")  %>&id=<%#Eval("intFavoriteTypeId")  %>'>View & Edit</a>
                                                                                        &nbsp;
                                                                                            <asp:LinkButton CssClass="lnkBtn" ID="lnkBtnDelete" runat="server"
                                                                                             OnClientClick="javascript:return confirm('Are you sure that you want to delete this?')"
                                                                                             CommandName="DeleteDetails"
                                                                                                CommandArgument='<%#Eval("IntFavoriteId") %>'>
                                                                                             Delete</asp:LinkButton>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </div>
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
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
