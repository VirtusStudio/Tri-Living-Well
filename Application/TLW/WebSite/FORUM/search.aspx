<%@ Page language="c#" CodeFile="search.aspx.cs" AutoEventWireup="True" Inherits="search" Title="Search" MasterPageFile="AspNetForumMaster.Master" %>
<asp:Content ContentPlaceHolderID="AspNetForumContentPlaceHolder" ID="AspNetForumContent" runat="server">
    <script type="text/javascript">
    function ValidateSearch(source, arguments)
    {
        arguments.IsValid = (arguments.Value.length>3);
    }
    </script>
	
	<div class="location">
		<b><a href="default.aspx"><asp:Label ID="lblHome" runat="server" EnableViewState="False" meta:resourcekey="lblHomeResource1">Home</asp:Label></a>
		»
		<asp:Label ID="lblSearch" runat="server" EnableViewState="False" meta:resourcekey="lblSearchResource1">Search</asp:Label>
		</b></div>
	
	<table cellspacing="5">
		<tr>
			<th colspan="2"><asp:Label ID="lblSearch2" runat="server" EnableViewState="False" meta:resourcekey="lblSearch2Resource1">Search</asp:Label></th>
		</tr>
		<tr>
			<td><asp:Label ID="lblSearchFor" runat="server" EnableViewState="False" meta:resourcekey="lblSearchForResource1">Search for:</asp:Label></td>
			<td>
				<asp:TextBox id="tbWords" runat="server" meta:resourcekey="tbWordsResource1" EnableViewState="false" /><br/>
				<asp:CustomValidator id="validatorLength" runat="server" ErrorMessage="4 characters minimum" ControlToValidate="tbWords" Display="Dynamic" ClientValidationFunction="ValidateSearch" meta:resourcekey="validatorLengthResource1" EnableViewState="false" />
				<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="nothing to search for" ControlToValidate="tbWords" Display="Dynamic" meta:resourcekey="RequiredFieldValidator1Resource1" EnableViewState="false" /></td>
		</tr>
		<tr>
			<td><asp:Label ID="lblAll" runat="server" EnableViewState="False" meta:resourcekey="lblAllResource1">Search ALL words:</asp:Label></td>
			<td>
				<asp:RadioButton id="rbAll" runat="server" GroupName="searchmode" Checked="True" meta:resourcekey="rbAllResource1" EnableViewState="false" /></td>
		</tr>
		<tr>
			<td><asp:Label ID="lblExact" runat="server" EnableViewState="False" meta:resourcekey="lblExactResource1">Match EXACT phrase:</asp:Label></td>
			<td>
				<asp:RadioButton id="rbExact" runat="server" GroupName="searchmode" meta:resourcekey="rbExactResource1" EnableViewState="false" /></td>
		</tr>
		<tr>
			<td><asp:Label ID="lblAny" runat="server" EnableViewState="False" meta:resourcekey="lblAnyResource1">Match ANY of the words:</asp:Label></td>
			<td>
				<asp:RadioButton id="rbAny" runat="server" GroupName="searchmode" meta:resourcekey="rbAnyResource1" EnableViewState="false" /></td>
		</tr>
		<tr>
			<td><asp:Label ID="lblDateFrom" runat="server" EnableViewState="False" meta:resourcekey="lblDateFromResource1">Post date - from:</asp:Label><br/>
				(yyyy-mm-dd)
			</td>
			<td><asp:TextBox id="tbDateFrom" runat="server" meta:resourcekey="tbDateFromResource1" EnableViewState="false" /><br/>
				<asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" Display="Dynamic" ControlToValidate="tbDateFrom" ErrorMessage="wrong format" ValidationExpression="^((\d{2})|(\d{4}))\-(([1-9])|(0[1-9])|(1[0-2]))\-(([0-9])|(0[1-9])|(1[0-9])|(2[0-9])|(3[0-1]))$" meta:resourcekey="RegularExpressionValidator1Resource1" EnableViewState="false" />
				<asp:CustomValidator id="CustomValidatorDateFrom" runat="server" EnableViewState="false" Display="Dynamic" ControlToValidate="tbDateFrom" ErrorMessage="wrong format" meta:resourcekey="RegularExpressionValidator2Resource1" OnServerValidate="CustomValidatorDateFrom_ServerValidate" />
				</td>
		</tr>
		<tr>
			<td><asp:Label ID="lblDateTo" runat="server" EnableViewState="False" meta:resourcekey="lblDateToResource1">Post date - to:</asp:Label><br/>
				(yyyy-mm-dd)</td>
			<td><asp:TextBox id="tbDateTo" runat="server" meta:resourcekey="tbDateToResource1" EnableViewState="false" /><br/>
				<asp:RegularExpressionValidator id="RegularExpressionValidator2" runat="server" Display="Dynamic" ControlToValidate="tbDateTo" ErrorMessage="wrong format" ValidationExpression="^((\d{2})|(\d{4}))\-(([1-9])|(0[1-9])|(1[0-2]))\-(([0-9])|(0[1-9])|(1[0-9])|(2[0-9])|(3[0-1]))$" meta:resourcekey="RegularExpressionValidator2Resource1" EnableViewState="false" />
				<asp:CustomValidator id="CustomValidatorDateTo" runat="server" EnableViewState="false" Display="Dynamic" ControlToValidate="tbDateTo" ErrorMessage="wrong format" meta:resourcekey="RegularExpressionValidator2Resource1" OnServerValidate="CustomValidatorDateTo_ServerValidate" />
				</td>
		</tr>
		<tr>
			<th colspan="2">
				<asp:Button CssClass="gradientbutton" id="btnSearch" runat="server" Text="search" onclick="btnSearch_Click" meta:resourcekey="btnSearchResource1" EnableViewState="false"></asp:Button>
			</th>
		</tr>
	</table>
	<br/>
	<asp:DataGrid CellSpacing="2" CellPadding="2" id="gridResults" runat="server" BorderColor="#E0E0E0" EnableViewState="False" AutoGenerateColumns="False" Width="100%" ShowHeader="False" meta:resourcekey="gridResultsResource1">
    <ItemStyle Height="25" />
		<Columns>
			<asp:HyperLinkColumn  DataNavigateUrlField="TopicID" DataNavigateUrlFormatString="messages.aspx?TopicID={0}" DataTextField="Subject" meta:resourcekey="HyperLinkColumnResource1"></asp:HyperLinkColumn>
		</Columns>
	</asp:DataGrid>
	<asp:Label id="lblNothingFound" runat="server" Visible="False" EnableViewState="false" meta:resourcekey="lblNothingFoundResource1">Sorry, your search did not match any results.</asp:Label>
	<div class="location"><hr />
		<b><a href="default.aspx"><asp:Label ID="lblHome2" runat="server" EnableViewState="False" meta:resourcekey="lblHome2Resource1">Home</asp:Label></a>
		»
		<asp:Label ID="lblSearch3" runat="server" EnableViewState="False" meta:resourcekey="lblSearch3Resource1">Search</asp:Label></b></div>
</asp:Content>