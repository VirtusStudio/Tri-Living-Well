<%@ Page Title="Food Journal" Language="C#" MasterPageFile="~/MasterPages/User.master" AutoEventWireup="true" CodeFile="FoodJournal.aspx.cs" Inherits="Users_FoodJournal" %>

<%@ Register src="../Controls/wucFoodJournal.ascx" tagname="wucFoodJournal" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:wucFoodJournal ID="wucFoodJournal1" runat="server" />

</asp:Content>

