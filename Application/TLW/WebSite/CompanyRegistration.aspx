<%@ Page Title="Company Registration" Language="C#" MasterPageFile="~/MasterPages/User.master" AutoEventWireup="true" CodeFile="CompanyRegistration.aspx.cs" Inherits="CompanyRegistration" %>

<%@ Register src="Controls/wucCompanyRegistration.ascx" tagname="UC_USER_CreateAccount" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="margin: 0px auto; width: 886px">
    <uc1:UC_USER_CreateAccount ID="UC_USER_CreateAccount3" runat="server" />
    </div>
</asp:Content>


