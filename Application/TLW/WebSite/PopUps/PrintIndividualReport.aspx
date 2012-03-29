<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintIndividualReport.aspx.cs"
    Inherits="PopUps_PrintIndividualReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Print Individual Report</title>
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
    <div>
        <table>
            <tr>
                <td align="left">
                    <table class="title">
                        <tr>
                            <td align="left">
                               Individual Report
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="right" style="padding-right:10px;">
                    <a href="#" onclick="javascript:window.print();" style="color: Black;">Print Report</a>
                </td>
            </tr>
            <tr><td style="padding-left:5px;">
                <b>Date:</b> <asp:Label ID="lblCurrentDate" runat="server"></asp:Label>
            </td></tr>
            <tr style="height:20px;"><td>&nbsp;</td></tr>
            <tr>
                <td>
                    <table width="100%" cellpadding="4" cellspacing="4" border="0">
                        <tr style="height:30px;">
                            <td align="left" style="width:20%">
                                <b>Ratio</b>
                            </td>
                            <td align="left" style="width:17%">
                                <b>Score</b>
                            </td>
                            <td align="left" style="width:20%">
                                <b>Risk</b>
                            </td>
                            <td align="left">
                                <b>Range</b>
                            </td>
                        </tr>
                        <tr style="height:30px;vertical-align:middle;">
                            <td align="left">
                                <b>Weight:</b>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblScoreWeight" runat="server">d</asp:Label>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblRiskWeight" runat="server"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblRangeWeight" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr style="height:30px;vertical-align:middle;">
                            <td align="left">
                                <b>Waist:</b>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblScoreWaist" runat="server"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblRiskWaist" runat="server"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblRangeWaist" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr style="height:30px;vertical-align:middle;">
                            <td align="left">
                                <b>BMI:</b>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblScoreBMI" runat="server"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblRiskBMI" runat="server"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblRangeBMI" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr style="height:30px;vertical-align:middle;">
                            <td align="left">
                                <b>Body Fat %:</b>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblScoreBodyFAT" runat="server"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblRiskBodyFAT" runat="server"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblRangeBodyFAT" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr style="height:30px;vertical-align:middle;">
                            <td align="left">
                                <b>Waist To Height:</b>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblScoreWaisttoheight" runat="server"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblRiskWaisttoHeight" runat="server"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblRangeWaisttoHeight" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr style="height:30px;vertical-align:middle;">
                            <td align="left">
                                <b>Waist To Hip:</b>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblScoreWaisttoHip" runat="server"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblRiskWaisttoHip" runat="server"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:Label ID="lblRangeWaisttoHip" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
