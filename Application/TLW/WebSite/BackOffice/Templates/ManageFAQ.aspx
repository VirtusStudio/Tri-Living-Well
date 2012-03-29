<%@ Page Title="Manage FAQ" Language="C#" MasterPageFile="~/MasterPages/BackOffice.master"
    AutoEventWireup="true" CodeFile="ManageFAQ.aspx.cs" Inherits="BackOffice_Templates_ManageFAQ" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../../Scripts/Common.js" type="text/javascript"></script>
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
                            Manage FAQ
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
            <td align="right">
                <a href='<%=AppConfig.GetBaseSiteUrl() %>BackOffice/Templates/AddEditFaq.aspx' class="lnkBtn">
                    Add New FAQ</a>
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
                                                                                    FAQ Details
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
                                                                            <asp:GridView ID="GVFAQ" AutoGenerateColumns="False" runat="server" EmptyDataText="<br /><br />No Record Found.<br /><br />"
                                                                                EmptyDataRowStyle-CssClass="required" EmptyDataRowStyle-HorizontalAlign="Center"
                                                                                Width="100%" AllowPaging="true" AllowSorting="false" PagerStyle-CssClass="paging"
                                                                                CellSpacing="1" CellPadding="0" GridLines="None" BorderWidth="0" OnPageIndexChanging="GVFAQ_PageIndexChanging"
                                                                                OnRowCommand="GVFAQ_RowCommand">
                                                                                <RowStyle CssClass="gridItem" />
                                                                                <HeaderStyle CssClass="gridHeader" />
                                                                                <AlternatingRowStyle CssClass="gridAltItem" />
                                                                                <Columns>
                                                                                    <asp:TemplateField Visible="false" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblFAQId" runat="server" Visible="false" Text='<%#Eval("IntFAQId") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Created On"
                                                                                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <%#Eval("DtCreatedOn").ToString()%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Topic"
                                                                                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <%#AppLib.GetSubString(Eval("StrHeading").ToString(), 50)%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Question"
                                                                                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <%#AppLib.GetSubString(Eval("StrQuestion").ToString(), 30)%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Edit"
                                                                                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <a href='<%=AppConfig.GetBaseSiteUrl() %>BackOffice/Templates/AddEditFaq.aspx?id=<%#Eval("IntFAQId") %>'
                                                                                                class="lnkBtn">Edit</a>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Delete"
                                                                                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <asp:LinkButton CssClass="lnkBtn" ID="lnkBtnDelete" runat="server" CommandName="DeleteFAQ"
                                                                                            OnClientClick="javascript:return ConfirmDelete('FAQ');"
                                                                                                CommandArgument='<%#Eval("IntFAQId") %>'>
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
