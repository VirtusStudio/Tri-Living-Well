<%@ Page Title="Manage Social Networking Links" Language="C#" MasterPageFile="~/MasterPages/BackOffice.master"
    AutoEventWireup="true" CodeFile="ManageSocialNetworkingLinks.aspx.cs" Inherits="BackOffice_UserUtilities_ManageSocialNetworkingLinks"
    ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                            Manage Social Networking Links
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
                                                                    <td align="left">
                                                                        <asp:Label ID="lblResultMsg" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="height: 20px;">
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div class="divBorder">
                                                                            <asp:GridView ID="GVLinks" AutoGenerateColumns="False" runat="server" EmptyDataText="<br /><br />No Record Found.<br /><br />"
                                                                                EmptyDataRowStyle-CssClass="required" EmptyDataRowStyle-HorizontalAlign="Center"
                                                                                Width="100%" AllowPaging="false" AllowSorting="false" PagerStyle-CssClass="paging"
                                                                                CellSpacing="1" CellPadding="0" border="0" GridLines="None" BorderWidth="0"
                                                                                OnRowCommand="GVLinks_RowCommand"
                                                                                >
                                                                                <RowStyle CssClass="gridItem" />
                                                                                <HeaderStyle CssClass="gridHeader" />
                                                                                <AlternatingRowStyle CssClass="gridAltItem" />
                                                                                <Columns>
                                                                                    <asp:TemplateField Visible="false" HeaderStyle-Width="100" ItemStyle-HorizontalAlign="Center"
                                                                                        HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblIntGlobalCodesId" runat="server" Visible="false" Text='<%#Eval("IntGlobalCodesId") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Social Networking Sites"
                                                                                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <%#Eval("StrHeading")%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Links"
                                                                                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <asp:TextBox ID="txtValue" CssClass="txtBox" Width="300" MaxLength="200" runat="server"
                                                                                                Text='<%#Eval("StrValue")%>'></asp:TextBox>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" 
                                                                                        HeaderText="" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <asp:LinkButton CssClass="lnkBtn" 
                                                                                                ID="lnkUpdateLink" ToolTip="Click here to update" 
                                                                                                runat="server" CommandName="UpdateLinkValue"
                                                                                                CommandArgument='<%#Eval("IntGlobalCodesId") %>'>
                                                                                          Update</asp:LinkButton>
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
