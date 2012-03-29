<%@ Page Title="View Favorite Item Details" Language="C#" MasterPageFile="~/MasterPages/User.master" AutoEventWireup="true" CodeFile="ViewFavoriteDetails.aspx.cs" Inherits="Users_ViewFavoriteDetails" %>

<%@ Register src="../Controls/wucViewFavoriteItemDetails.ascx" tagname="wucViewFavoriteItemDetails" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:wucViewFavoriteItemDetails ID="wucViewFavoriteItemDetails1" 
        runat="server" />
</asp:Content>

