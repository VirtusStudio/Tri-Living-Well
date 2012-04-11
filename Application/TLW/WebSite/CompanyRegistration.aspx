<%@ Page Title="Company Registration" Language="C#" MasterPageFile="~/MasterPages/User.master" AutoEventWireup="true" CodeFile="CompanyRegistration.aspx.cs" Inherits="CompanyRegistration" %>

<%@ Register src="Controls/wucCompanyRegistration.ascx" tagname="UC_USER_CreateAccount" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../Scripts/Common.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:UC_USER_CreateAccount ID="UC_USER_CreateAccount3" runat="server" />
</asp:Content>


