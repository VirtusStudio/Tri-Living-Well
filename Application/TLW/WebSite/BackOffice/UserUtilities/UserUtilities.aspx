<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserUtilities.aspx.cs" MasterPageFile="~/MasterPages/BackOffice.master"
    Inherits="Administrator_UserUtilities_UserUtilities" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../../Scripts/Common.js" type="text/javascript"></script>
    <script type="text/javascript">
        function editUser(userName) {
            document.location.href = "../UserUtilities/EditUser.aspx?userName=" + userName;
        }
        function deleteUser(userName) {
            if (confirm("Are you sure you want to delete " + userName)) {
                document.location.href = "../UserUtilities/UserUtilities.aspx?delete=" + userName;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td style="width: 30%;">
            </td>
            <td style="text-align: left;">
                <asp:Label ID="lblMsg" runat="server" CssClass="required"></asp:Label>
            </td>
        </tr>
        <tr style="height:32px; vertical-align:middle;">
            <td colspan="2" align="right">
                <table style="width:200px;" border="0">
                    <tr>
                        <td>
                            <a href="CreateAdminUser.aspx"  class="lnkBtn">Create Admin User</a>
                        </td>
                        <td>
                            <a href="CreateUser.aspx"  class="lnkBtn">Create User</a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table class="title">
                    <tr>
                        <td align="left">
                            Manage Users
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div class="description">
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
                                                <table class="Round3_tblHeader">
                                                    <tr>
                                                        <td>
                                                            Active Users
                                                        </td>
                                                        <td style="text-align: right;">
                                                        </td>
                                                    </tr>
                                                </table>
                                                <telerik:RadGrid AllowSorting="True" ID="RadGrid1" OnDeleteCommand="RadGrid1_DeleteCommand"
                                                    OnItemCommand="RadGrid1_ItemCommand" Width="100%" BorderWidth="0" runat="server"
                                                    AutoGenerateColumns="False" OnItemDataBound="RadGrid1_ItemDataBound" GridLines="None">
                                                    <MasterTableView GridLines="None">
                                                        <Columns>
                                                            <telerik:GridTemplateColumn DataField="ItemId" UniqueName="ucEdit">
                                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                                <ItemStyle HorizontalAlign="Center" Width="35px"></ItemStyle>
                                                                <ItemTemplate>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn>
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkDelete" CssClass="arial_11_000_u" Text="Delete" ToolTip="Click here to change the delete."
                                                                        OnClientClick="return ConfirmDelete('User')" runat="server" CommandName="deleteuser"
                                                                        CommandArgument='<%#Eval("UserName")%>'></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridButtonColumn UniqueName="column" Text="Inactivate" CommandName="Delete">
                                                                <ItemStyle HorizontalAlign="Center" Width="55px" />
                                                            </telerik:GridButtonColumn>
                                                            <telerik:GridTemplateColumn DataField="UserName" UniqueName="ucDelete" Visible="False">
                                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                                <ItemStyle HorizontalAlign="Center" Width="180px"></ItemStyle>
                                                                <ItemTemplate>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn DataField="IsLockedOut" UniqueName="ucAccess" SortExpression="IsLockedOut"
                                                                HeaderText="Locked Out">
                                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                                <ItemStyle HorizontalAlign="Center" Width="80px"></ItemStyle>
                                                                <ItemTemplate>
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridTemplateColumn>
                                                                <ItemTemplate>
                                                                    &nbsp;
                                                                </ItemTemplate>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridBoundColumn DataField="UserName" UniqueName="UserName" SortExpression="UserName"
                                                                HeaderText="User&#160;Name">
                                                                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                                                <ItemStyle Width="180px" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="PASSWORD" UniqueName="PASSWORD" SortExpression="PASSWORD"
                                                                HeaderText="Password">
                                                                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                                                <ItemStyle Width="80px" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="RoleName" UniqueName="RoleName" SortExpression="RoleName"
                                                                HeaderText="Role">
                                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="LNAME" UniqueName="LNAME" SortExpression="LNAME"
                                                                HeaderText="Last&#160;Name">
                                                                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                                                <ItemStyle Width="80px" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="FNAME" UniqueName="FNAME" SortExpression="FNAME"
                                                                HeaderText="First&#160;Name">
                                                                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                                                <ItemStyle Width="80px" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="LAST_MODIFIED" Visible="false" UniqueName="LAST_MODIFIED"
                                                                SortExpression="LAST_MODIFIED" HeaderText="Last&#160;Modified">
                                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                                <ItemStyle HorizontalAlign="Right" Width="120px" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridTemplateColumn HeaderText="Last&#160;Modified" UniqueName="TemplateColumn"
                                                                SortExpression="LAST_MODIFIED">
                                                                <ItemTemplate>
                                                                    <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "LAST_MODIFIED").ToString()).ToString("MM/dd/yyyy")  %>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Right" Width="125px" />
                                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                            </telerik:GridTemplateColumn>
                                                            <telerik:GridBoundColumn Visible="False" DataField="IsLockedOut" UniqueName="IsLockedOut"
                                                                SortExpression="IsLockedOut" HeaderText="IsLockedOut">
                                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                            </telerik:GridBoundColumn>
                                                        </Columns>
                                                        <HeaderStyle CssClass="gridHeader" />
                                                        <AlternatingItemStyle CssClass="gridAltItem" />
                                                        <ItemStyle CssClass="gridItem" />
                                                    </MasterTableView>
                                                </telerik:RadGrid>
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
                                                <table class="Round3_tblHeader">
                                                    <tr>
                                                        <td>
                                                            Inactive Users
                                                        </td>
                                                        <td style="text-align: right;">
                                                        </td>
                                                    </tr>
                                                </table>
                                                <div class="divBorder">
                                                    <telerik:RadGrid AllowSorting="true" ID="RadGrid2" OnDeleteCommand="RadGrid2_DeleteCommand"
                                                        Width="100%" runat="server" BorderWidth="0" AutoGenerateColumns="False" OnItemDataBound="RadGrid2_ItemDataBound"
                                                        OnItemCommand="RadGrid1_ItemCommand" GridLines="None">
                                                        <MasterTableView>
                                                            <Columns>
                                                                <telerik:GridTemplateColumn>
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lnkDelete" CssClass="arial_11_000_u" Text="Delete" ToolTip="Click here to change the delete."
                                                                            OnClientClick="return ConfirmDelete('User')" runat="server" CommandName="deleteuser"
                                                                            CommandArgument='<%#Eval("UserName")%>'></asp:LinkButton>
                                                                    </ItemTemplate>
                                                                </telerik:GridTemplateColumn>
                                                                <telerik:GridButtonColumn ItemStyle-Width="90px" ItemStyle-HorizontalAlign="center"
                                                                    HeaderStyle-Width="95px" UniqueName="column" Text="Activate" CommandName="Delete">
                                                                </telerik:GridButtonColumn>
                                                                <telerik:GridTemplateColumn ItemStyle-Width="80px" DataField="IsLockedOut" UniqueName="ucAccess"
                                                                    SortExpression="IsLockedOut" HeaderText="Locked Out">
                                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                                    <ItemTemplate>
                                                                    </ItemTemplate>
                                                                </telerik:GridTemplateColumn>
                                                                <telerik:GridBoundColumn DataField="RoleName" UniqueName="RoleName" SortExpression="RoleName"
                                                                    HeaderText="Role">
                                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridTemplateColumn>
                                                                    <ItemTemplate>
                                                                        &nbsp;
                                                                    </ItemTemplate>
                                                                </telerik:GridTemplateColumn>
                                                                <telerik:GridBoundColumn ItemStyle-Width="160px" DataField="UserName" UniqueName="UserName"
                                                                    SortExpression="UserName" HeaderText="User&#160;Name">
                                                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn ItemStyle-Width="80px" DataField="PASSWORD" UniqueName="PASSWORD"
                                                                    SortExpression="PASSWORD" HeaderText="Password">
                                                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn ItemStyle-Width="80px" DataField="LNAME" UniqueName="LNAME"
                                                                    SortExpression="LNAME" HeaderText="Last&#160;Name">
                                                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn ItemStyle-Width="80px" DataField="FNAME" UniqueName="FNAME"
                                                                    SortExpression="FNAME" HeaderText="First&#160;Name">
                                                                    <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn Visible="False" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="120px"
                                                                    DataField="LAST_MODIFIED" UniqueName="LAST_MODIFIED" SortExpression="LAST_MODIFIED"
                                                                    HeaderText="Last&#160;Modified">
                                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridTemplateColumn HeaderText="Last&#160;Modified" UniqueName="TemplateColumn"
                                                                    SortExpression="LAST_MODIFIED">
                                                                    <ItemTemplate>
                                                                        <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "LAST_MODIFIED").ToString()).ToString("MM/dd/yyyy")  %>
                                                                    </ItemTemplate>
                                                                    <ItemStyle HorizontalAlign="Right" Width="125px" />
                                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                                </telerik:GridTemplateColumn>
                                                                <telerik:GridBoundColumn Visible="False" DataField="IsLockedOut" UniqueName="IsLockedOut"
                                                                    SortExpression="IsLockedOut" HeaderText="IsLockedOut">
                                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                                </telerik:GridBoundColumn>
                                                                <telerik:GridBoundColumn Visible="False" ItemStyle-Width="120px" DataField="RoleName"
                                                                    UniqueName="RoleName" SortExpression="RoleName" HeaderText="Role">
                                                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                                </telerik:GridBoundColumn>
                                                            </Columns>
                                                            <HeaderStyle CssClass="gridHeader" />
                                                            <AlternatingItemStyle CssClass="gridAltItem" />
                                                            <ItemStyle CssClass="gridItem" />
                                                        </MasterTableView>
                                                    </telerik:RadGrid>
                                                </div>
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
    <telerik:RadAjaxManager ID="RadAjaxManager2" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                    <telerik:AjaxUpdatedControl ControlID="RadGrid2" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="RadGrid2">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
                    <telerik:AjaxUpdatedControl ControlID="RadGrid2" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
</asp:Content>
