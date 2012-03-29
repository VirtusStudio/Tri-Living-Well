<%@ Page Language="C#" AutoEventWireup="true" CodeFile="insertPersonalMessage.aspx.cs" Inherits="PAL_Recent" %>

<%@ Register Src="~/Controls/UC_DD_DdEntries_PopUp.ascx" TagName="UC_DD_DdEntries_PopUp" TagPrefix="uc2" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>

<%--    <link href="/Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Table.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Grid.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/centerRound1.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/centerRound2.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Table.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Table.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/centerRound1.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Table.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Table.css" rel="stylesheet" type="text/css" />
    Above lines are commented by Netsmartz
    --%>

</head>
<body onload="Init();parent.setIframeHeight_NoTopScroll();top.setIframeHeight_NoTopScroll();" class="body2">
    <form id="form1" runat="server">
    
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
<script type="text/javascript">
function submitPersonalMessage()
{

    document.getElementById('<%= btnSubmitPersonalMessage.ClientID %>').click();
 }

function RadCalendar1_SelectDate(sender, eventArgs)
{
   var date = eventArgs.get_renderDay().get_date();
   var dfi = sender.DateTimeFormatInfo;
   var formattedDate = dfi.FormatDate(date, dfi.ShortDatePattern);
   ViewWeek(String(formattedDate));
}
</script>
</telerik:RadCodeBlock>


<span class="subTitle">Start Personal Message With A Specialist</span>
        <br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Height="204px" Width="410px"></asp:TextBox>
        <br />
        
        <a class="aButton" href="javascript:submitPersonalMessage();">Submit</a>
        <asp:Button ID="btnSubmitPersonalMessage" runat="server" Text="btnSubmit" OnClick="btnSubmitPersonalMessage_Click"  />
    </form>
</body>
</html>
