<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Refresher.aspx.cs" Inherits="Main_Refresher" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
<script type="text/javascript">
function refreshTopMenu()
{
    try
    {
        top.refreshMenu(document.getElementById("<%=txtPrivateMessages.ClientID %>").value);
    }
    catch(ex)
    {
       // window.setTimeout("clickSubmit()", "1000");
    }
    window.setTimeout("clickSubmit()", "60000");
}
function clickSubmit()
{
    document.getElementById('<%=btnSubmit.ClientID %>').click();
}
</script>
</head>
<body onload="refreshTopMenu();">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
        
        <asp:TextBox ID="txtPrivateMessages" runat="server"></asp:TextBox>

    
       
    
    </form>
</body>
</html>
