<%@ Page Title="User Registration" Language="C#" MasterPageFile="~/MasterPages/User.master"
    AutoEventWireup="true" CodeFile="UserRegistration.aspx.cs" Inherits="UserRegistration" %>

<%@ Register Src="Controls/wucUserRegistration.ascx" TagName="UC_USER_UserRegistration"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table class="title">
                    <tr>
                        <td align="left">
                            User Registration
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="left">
                <uc1:UC_USER_UserRegistration ID="UC_USER_UserRegistration1" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
