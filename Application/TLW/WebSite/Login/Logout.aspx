<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Logout.aspx.cs" Inherits="Login_Logout" %>

<%@ Register Src="~/Controls/UC_Visitlog_Visitlog.ascx" TagName="UC_Visitlog_Visitlog" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<script type="text/javascript">
function init()
{
    if(window.opener != null)
    {   
        window.opener.location.href = "../login/logout.aspx";
        window.close();
    }
    else
    {
        top.window.location.href= "../Default.aspx";
    }
}
</script>

<body onload="init()">
    <form id="form1" runat="server">
    <div>
        <uc1:UC_Visitlog_Visitlog ID="UC_Visitlog_Visitlog1" runat="server" />
    
    </div>
    </form>
</body>
</html>