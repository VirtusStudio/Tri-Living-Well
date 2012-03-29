<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ActivateAccount_a.aspx.cs" Inherits="ActivateAccount" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%--Commented by Netsmartz for resolving compile time issues 
<%@ Register Assembly="RadAjax.Net2" Namespace="Telerik.WebControls" TagPrefix="radA" %>--%>
<%@ Register Src="~/Controls/UC_USER_EditAccount.ascx" TagName="UC_USER_EditAccount" TagPrefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
 <title>Edit Account Information</title>
    
</head>
<body class="body2">
    <form id="form1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
        
        <div class="title">Activate an Account</div>
        <div class="description"> 
            Select an Account to Activate: <asp:DropDownList ID="ddlUserID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlUserID_SelectedIndexChanged"></asp:DropDownList>
            <asp:Panel ID="Panel1" runat="server">
                <uc1:UC_USER_EditAccount ID="UC_USER_EditAccount1" runat="server" USER_MODE="true" />
            </asp:Panel>
            
        </div>

<%--
Commented by Netsmartz for resolving compile time issues 
<radA:AjaxLoadingPanel ID="AjaxLoadingPanel1" runat="server" Height="75px" Width="75px">
    <div style="text-align:center;">
        <img src="/RadControls/Ajax/Skins/Default/loading2.gif" /> Getting Data <img src="/RadControls/Ajax/Skins/Default/loading2.gif" />
    </div>
</radA:AjaxLoadingPanel>

    <radA:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
             <radA:AjaxSetting AjaxControlID="ddlUserID">
                <UpdatedControls>
                    <radA:AjaxUpdatedControl ControlID="Panel1" LoadingPanelID="AjaxLoadingPanel1" />
                </UpdatedControls>
            </radA:AjaxSetting>
        </AjaxSettings>
    </radA:RadAjaxManager>--%>
    
    
    </form>
</body>
</html>
