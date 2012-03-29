<%--
Commented by Netsmartz for resolving compile time issues  (Wrong reference of INHERITS attribute)
<%@ Page language="c#" CodeFile="PrivateMessage_Update.aspx.cs" AutoEventWireup="True" Inherits="aspnetforum.addprivatemsg" MasterPageFile="AspNetForumMaster.Master" %>--%>

<%@ Page language="c#" CodeFile="PrivateMessage_Update.aspx.cs" AutoEventWireup="True" Inherits="addprivatemsg" 
MasterPageFile="AspNetForumMaster.Master" %>

<asp:Content ContentPlaceHolderID="AspNetForumContentPlaceHolder" ID="AspNetForumContent" runat="server">
    <script type="text/javascript" src="broswerDetection.js"></script>
    <script type="text/javascript" src="forum.js"></script>
    <br />
    <br /><asp:Label ID="lblMessageHistory" runat="server"  Text="testing"></asp:Label>
    <table style="width:100%;">
	     <tr><th><asp:Label ID="lblBody" Visible="false" runat="server"  Text="testing"></asp:Label></th></tr>
	     
         <tr><th><asp:Label ID="lblPrivateMsg" runat="server" EnableViewState="False" meta:resourcekey="lblPrivateMsgResource1">Send a private message</asp:Label></th></tr>
      </table>
    <div id="divMain" runat="server">
		<div class="editbar">
			<button class="formatting" title="bold" onclick="javascript:AddTag('[b]','[/b]')" type="button">
			<b>B</b></button> <button class="formatting" title="italic" onclick="javascript:AddTag('[i]','[/i]')" type="button"><i>I</i></button> <button class="formatting" title="underline" onclick="javascript:AddTag('[u]','[/u]')" type="button"><u>U</u></button> <button class="formatting" title="hyperlink" onclick="javascript:AddTag('[url=',']link[/url]')"
			type="button">url</button>
		</div>
		<asp:textbox id="tbMsg" runat="server" Width="100%" Rows="10" TextMode="MultiLine" meta:resourcekey="tbMsgResource1"></asp:textbox>
		<table style="width:100%;">
			<tr>
				<th>
					<asp:button CssClass="gradientbutton" id="btnSave" runat="server" Text="send message" onclick="btnSave_Click" meta:resourcekey="btnSaveResource1"></asp:button>
					<button onclick="history.back()" class="gradientbutton" type="button"><asp:Label ID="lblCancel" runat="server" EnableViewState="False" meta:resourcekey="lblCancelResource1">cancel</asp:Label></button>
				</th>
			</tr>
		</table>
    </div>
    <asp:Label ID="lblError" runat="server" ForeColor="red" Font-Bold="true" Visible="false" EnableViewState="false" Text="User not found or you are not logged in"/>
</asp:Content>