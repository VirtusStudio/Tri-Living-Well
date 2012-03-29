<%@ Page Title="Edit Company Details" Language="C#" MasterPageFile="~/MasterPages/BackOffice.master" AutoEventWireup="true" CodeFile="EditCompanyDetails.aspx.cs" Inherits="BackOffice_ManageCompany_EditCompanyDetails" %>

<%@ Register src="../../Controls/wucEditCompanyDetails.ascx" tagname="wucEditCompanyDetails" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../../Scripts/Common.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:wucEditCompanyDetails ID="wucEditCompanyDetails1" runat="server" />

</asp:Content>

