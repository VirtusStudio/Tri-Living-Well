<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MyMessageBox.ascx.cs"
    Inherits="MyMessageBox" %>

<div class="container">
    <asp:Panel ID="MessageBox" runat="server">
        <asp:HyperLink runat="server" id="CloseButton" >
            <asp:Image runat="server" ImageUrl="~/images/close.png" AlternateText="Click here to close this message" />
        </asp:HyperLink>
        <p>
            <asp:Literal ID="litMessage" runat="server"></asp:Literal></p>
    </asp:Panel>
</div>