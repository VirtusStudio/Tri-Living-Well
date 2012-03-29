<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/TLWSite.master" AutoEventWireup="true"
    CodeFile="Temp.aspx.cs" Inherits="Temp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:FileUpload ID="fuploadFirst" runat="server" />
    <asp:Button ID="btnAdd" runat="server" Text="Add" onclick="btnAdd_Click" />
    <asp:PlaceHolder ID="phFileUpload" runat="server"></asp:PlaceHolder>
    <asp:Panel ID="pFu" runat="server">
    </asp:Panel>
</asp:Content>
