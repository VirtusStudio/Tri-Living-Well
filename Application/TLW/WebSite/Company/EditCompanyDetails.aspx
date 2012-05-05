<%@ Page Title="Edit Company Details" Language="C#" MasterPageFile="~/MasterPages/Company.master" AutoEventWireup="true" CodeFile="EditCompanyDetails.aspx.cs" Inherits="Company_EditCompanyDetails" %>

<%@ Register src="../Controls/wucEditCompanyDetails.ascx" tagname="wucEditCompanyDetails" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../../Scripts/Common.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div style="background: none repeat scroll 0% 0% rgb(255, 255, 255); margin: 0px auto; padding: 10px; width: 886px; overflow:hidden;"> 
    <uc1:wucEditCompanyDetails ID="wucEditCompanyDetails1" runat="server" />
 </div>

</asp:Content>


