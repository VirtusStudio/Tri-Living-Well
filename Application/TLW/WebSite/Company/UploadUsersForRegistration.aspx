<%@ Page Title="Upload Users For Registration" Language="C#" MasterPageFile="~/MasterPages/Company.master"
    AutoEventWireup="true" CodeFile="UploadUsersForRegistration.aspx.cs" Inherits="Company_UploadUsersForRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../../Scripts/Common.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <div style="background: none repeat scroll 0% 0% rgb(255, 255, 255); margin: 0px auto; padding: 10px; width: 886px; overflow:hidden;"> 
    <div style="padding-top: 20px; height: 600px">
    <table width="90%" border="0" cellpadding="0" cellspacing="0">                                                                 
        <tr>
            <td align="right" valign="top" style="width: 15%;">
                <span class="keyword">Employee List:</span>&nbsp;
            </td>
            <td align="left" valign="top" style="width: 25%;">
                <asp:FileUpload ID="fuUser" Height="22" CssClass="txtBox" runat="server" />
            </td>
            <td align="left" valign="top">
                <asp:LinkButton ID="btnUpload" CssClass="aButtonSmall" runat="server" Text="Upload"
                    OnClick="btnUpload_Click" />
            </td>
            <td align="right" valign="top">
                        <asp:LinkButton ID="lntBtnDownload" CssClass="templateButton" runat="server" Text="&nbsp;Download Template&nbsp;"
                    OnClick="lntBtnDownload_Click" />
            </td>
        </tr> 
        <tr>
            <td align="center" colspan="4">
                &nbsp;
                <asp:Label ID="lblMsg" ForeColor="Red" runat="server" CssClass="required"></asp:Label>
            </td>
        </tr>                                                                 
        <tr id="trGVGridRecords" runat="server">
            <td colspan="4">
                <div class="divBorder">
                    <asp:GridView ID="gvRequestedUser" runat="server" AutoGenerateColumns="false" OnRowDataBound="gvRequestedUser_RowDataBound">
                        <RowStyle CssClass="gridItem" />
                        <HeaderStyle CssClass="gridHeader" />
                        <AlternatingRowStyle CssClass="gridAltItem" />
                        <Columns>
                            <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="First Name"
                                ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmpfName" runat="server" Text='<%# Eval("EmployeeFirstName") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Last Name"
                                ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmpLName" runat="server" Text='<%# Eval("EmployeeLastName") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Email"
                                ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmpEmail" runat="server" Text='<%# Eval("EmployeeEmail") %>'></asp:Label></ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="4" align="center">
                <asp:LinkButton CssClass="aButtonSmall" ToolTip="Click here to send request" ID="btnSaveRecord"
                    runat="server" OnClick="btnSaveRecord_Click">Submit</asp:LinkButton>
            </td>
        </tr>                                                   
    </table>
    </div>
</div>
</asp:Content>
