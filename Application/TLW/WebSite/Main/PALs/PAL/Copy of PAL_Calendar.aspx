<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Copy of PAL_Calendar.aspx.cs" Inherits="PAL_Calendar" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Src="~/Controls/UC_PAL_PalEntries_PopUp.ascx" TagName="UC_PAL_PalEntries_PopUp" TagPrefix="uc2" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>

    <link href="/Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Table.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/centerRound1.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Table.css" rel="stylesheet" type="text/css" />

</head>
<body onload="parent.setIframeHeight_NoTopScroll();top.setIframeHeight_NoTopScroll();" class="body2">
    <form id="form1" runat="server">
   
 <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<table>
<tr>
    <td><span class="subTitle">Calendar</span></td>
    <td style="text-align:right;"><a href="javascript:addEntry('');"><img src="/images/icons/iconPalEntryCreate.gif" /> Add a new Personal Activity Log Entry</a></td>
</tr>
</table>
        <br />
        <telerik:RadCalendar ID="RadCalendar1" runat="server" EnableMultiSelect="False"
            ShowRowHeaders="False" UseRowHeadersAsSelectors="False" Skin="WebBlue" Width="100%" OnDayRender="RadCalendar1_DayRender" AutoPostBack="True" OnSelectionChanged="RadCalendar1_SelectionChanged">
            <WeekendDayStyle BackColor="WhiteSmoke" BorderColor="#69798C" />
            <DayOverStyle BackColor="#CCCCFF" BorderColor="#69798C" />
            <SelectedDayStyle BackColor="#FFCCCC" BorderColor="#69798C"/>
            <OtherMonthDayStyle BackColor="WhiteSmoke" BorderColor="#69798C" /> 
            <DayStyle BorderColor="#69798C" />
            <SpecialDays>
                <telerik:RadCalendarDay Date="">
                    <ItemStyle BackColor="#CCFFCC" BorderColor="#69798C" />
                </telerik:RadCalendarDay>
            </SpecialDays>         
           
        </telerik:RadCalendar>
        <br />
        <br />

    
    
  <uc2:UC_PAL_PalEntries_PopUp id="UC_PAL_PalEntries_PopUp1" runat="server"></uc2:UC_PAL_PalEntries_PopUp>

    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <ClientEvents />
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadCalendar1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadCalendar1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    
        
    </form>



</body>
</html>
