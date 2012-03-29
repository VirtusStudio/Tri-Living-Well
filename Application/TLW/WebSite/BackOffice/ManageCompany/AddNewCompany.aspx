<%@ Page Title="Add New Company" Language="C#" MasterPageFile="~/MasterPages/BackOffice.master"
    AutoEventWireup="true" CodeFile="AddNewCompany.aspx.cs" Inherits="BackOffice_ManageCompany_AddNewCompany" %>

<%@ Register Src="../../Controls/wucCompanyRegistration.ascx" TagName="UC_USER_CreateAccount"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1"  runat="Server">
    <table width="90%" border="0" cellpadding="0" cellspacing="0">
        <tr style="height:20px;">
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td >
                <uc1:UC_USER_CreateAccount ID="UC_USER_CreateAccount3" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
