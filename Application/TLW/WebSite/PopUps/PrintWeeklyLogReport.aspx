<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintWeeklyLogReport.aspx.cs"
    Inherits="PopUps_PrintWeeklyLogReport" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../Welcome/Styles/Corporate.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/centerRound1.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/centerRound3.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/centerRound4.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/centerRound5.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/Table.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/Grid.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/WebSite.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <table>
            <tr>
                <td align="left">
                    <table class="title">
                        <tr>
                            <td align="left">
                                Weekly View of Food Intake
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <a href="#" onclick="javascript:window.print();" style="color: Black;">Print</a>
                </td>
            </tr>
            <tr>
                <td align="left" >
                    <telerik:RadCalendar ID="RadCalendar1" runat="server" EnableMultiSelect="False" ShowRowHeaders="False"
                        UseRowHeadersAsSelectors="False" Skin="WebBlue" Width="100%" AutoPostBack="false"
                        OnDayRender="RadCalendar1_DayRender">
                        <WeekendDayStyle BackColor="WhiteSmoke" BorderColor="#69798C" />
                        <DayOverStyle BackColor="#CCCCFF" BorderColor="#69798C" />
                        <SelectedDayStyle BackColor="#FFCCCC" BorderColor="#69798C" />
                        <OtherMonthDayStyle BackColor="WhiteSmoke" BorderColor="#69798C" />
                        <DayStyle HorizontalAlign="Left" BorderColor="#69798C" />
                        <SpecialDays>
                            <telerik:RadCalendarDay Date="">
                                <ItemStyle BackColor="#CCFFCC" BorderColor="#69798C" />
                            </telerik:RadCalendarDay>
                        </SpecialDays>
                    </telerik:RadCalendar>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
