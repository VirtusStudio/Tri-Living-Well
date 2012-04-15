<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/TLWSite.master" AutoEventWireup="true" CodeFile="ResendInvite.aspx.cs" Inherits="ResendInvite" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <h3>Please enter your email address to have your invite re-sent to you.</h3>
 
<table class="tblItems">
    <tr>
        <td>
            <span class="keyword">Your Email Address:</span>&nbsp;
        </td>
        <td style="white-space: nowrap;">
            <asp:TextBox runat="server" ID="EmailAddress" Width="150px" />
        </td>
        <td align="left">
            <asp:RequiredFieldValidator runat="server" ValidationGroup="ResendEmailGroup" ControlToValidate="EmailAddress" Display="Static" ID="EmailAddressRequired" ErrorMessage="Email Address Required" CssClass="required"></asp:RequiredFieldValidator>
            <asp:CustomValidator runat="server" ValidationGroup="ResendEmailGroup" ControlToValidate="EmailAddress" Display="Static" ID="CustomValidatorEmailAddress" CssClass="required" OnServerValidate="CheckEmail" ErrorMessage="Please use your company email address." ></asp:CustomValidator>
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:LinkButton ValidationGroup="ResendEmailGroup" CssClass="aButtonSmall" ID="ResendEmailButton" runat="server"  OnClick="ResendEmailClick" Text="Resend Email"></asp:LinkButton>
        </td>
    </tr>
</table>

</asp:Content>

