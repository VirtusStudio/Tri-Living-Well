<%@ Page Title="Food Journal" Language="C#" MasterPageFile="~/MasterPages/User.master" AutoEventWireup="true" CodeFile="FoodJournal.aspx.cs" Inherits="Users_FoodJournal" %>

<%@ Register src="../Controls/UC_Nutrition_FoodJournal_Popup.ascx" tagname="UC_Nutrition_FoodJournal_Popup" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:UC_Nutrition_FoodJournal_Popup ID="wucFoodJournal1" runat="server" />

</asp:Content>

