<%@ Page Title="Risk Stratification Process Step2" Language="C#" MasterPageFile="~/MasterPages/User.master"
    AutoEventWireup="true" CodeFile="RiskStratificationProcessStep2.aspx.cs" Inherits="Users_RiskStratificationProcessStep2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="../Styles/BGT_Text_Arial.css" />
    <link href="../Styles/Table.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/centerRound3.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/Grid.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div style="background: none repeat scroll 0% 0% rgb(255, 255, 255); margin: 0px auto; padding: 10px; width: 886px; overflow:hidden;">
    <table>
        <tr>
            <td align="center">
                <asp:Label ID="lblError" runat="server" CssClass="required"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="title">
                Risk Stratification Process Step 2
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <center class="Round3">
                    <center>
                        <center>
                            <center>
                                <center>
                                    <center>
                                        <center>
                                            <center>
                                                <center>
                                                    <center>
                                                        <table width="100%">
                                                            <tr>
                                                                <td>
                                                                    <table class="Round3_tblHeader">
                                                                        <tr>
                                                                            <td>
                                                                                Screen 2
                                                                            </td>
                                                                            <td style="text-align: right;">
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <table width="100%" cellpadding="4" cellspacing="4" border="0">
                                                                        <tr>
                                                                            <td align="center">
                                                                                Introduction
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="top" align="left">
                                                                                <asp:Label ID="lblCMSText" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <br />
                                                                                <br />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="top" align="left">
                                                                                <table width="100%">
                                                                                    <tr>
                                                                                        <td style="width: 20%">
                                                                                        </td>
                                                                                        <td align="left">
                                                                                            Risk Factor Questionnaire
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:GridView ID="GVQuestionnaireHeading" AutoGenerateColumns="False" runat="server"
                                                                                    EmptyDataText="<br /><br />No Question Found.<br /><br />" EmptyDataRowStyle-CssClass="required"
                                                                                    EmptyDataRowStyle-HorizontalAlign="Center" Width="100%" AllowPaging="false" AllowSorting="false"
                                                                                    PagerStyle-CssClass="paging" CellSpacing="1" CellPadding="0" border="0" GridLines="None"
                                                                                    BorderWidth="0" OnRowDataBound="GVQuestionHeading_RowDataBound">
                                                                                    <Columns>
                                                                                        <asp:TemplateField ItemStyle-Height="30" HeaderText="" ItemStyle-HorizontalAlign="Left"
                                                                                            HeaderStyle-HorizontalAlign="Left">
                                                                                            <ItemTemplate>
                                                                                                <table border="0">
                                                                                                    <tr>
                                                                                                        <td valign="baseline" colspan="2" align="left">
                                                                                                            <b>
                                                                                                                <asp:Label ID="lblQuestionHeading" runat="server" Text='<%#Eval("StrHeading")%>'>
                                                                                                                </asp:Label></b>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td colspan="2" valign="top">
                                                                                                            <asp:GridView ID="GVQuestion" AutoGenerateColumns="False" runat="server" EmptyDataText="<br /><br />No Question Found.<br /><br />"
                                                                                                                EmptyDataRowStyle-CssClass="required" EmptyDataRowStyle-HorizontalAlign="Center"
                                                                                                                Width="100%" AllowPaging="false" AllowSorting="false" PagerStyle-CssClass="paging"
                                                                                                                CellSpacing="1" CellPadding="0" border="0" GridLines="None" BorderWidth="0" OnRowDataBound="GVQuestion_RowDataBound">
                                                                                                                <Columns>
                                                                                                                    <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                                                                        <ItemTemplate>
                                                                                                                            <table>
                                                                                                                                <tr>
                                                                                                                                    <td style="width: 30px;" valign="top" align="center">
                                                                                                                                    </td>
                                                                                                                                    <td valign="top" align="left">
                                                                                                                                        <asp:Label ID="lblQuestionId" runat="server" Visible="false" Text='<%#Eval("IntQuestionnaireId") %>'></asp:Label>
                                                                                                                                        <asp:Label ID="lblQuestion" runat="server" Text='<%#Eval("StrQuestion") %>'></asp:Label>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td colspan="2" style="height: 10px;">
                                                                                                                                        &nbsp;
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td>
                                                                                                                                    </td>
                                                                                                                                    <td valign="top" align="left">
                                                                                                                                        <asp:RadioButtonList ID="rdoListAnswer" Width="100" RepeatColumns="2" RepeatDirection="Horizontal"
                                                                                                                                            runat="server">
                                                                                                                                            <asp:ListItem Value="Yes" Selected="True">Yes</asp:ListItem>
                                                                                                                                            <asp:ListItem Value="No">No</asp:ListItem>
                                                                                                                                        </asp:RadioButtonList>
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                                <tr>
                                                                                                                                    <td colspan="2" style="height: 10px;">
                                                                                                                                    </td>
                                                                                                                                </tr>
                                                                                                                            </table>
                                                                                                                        </ItemTemplate>
                                                                                                                    </asp:TemplateField>
                                                                                                                </Columns>
                                                                                                            </asp:GridView>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td colspan="2" style="height: 10px;">
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </ItemTemplate>
                                                                                        </asp:TemplateField>
                                                                                    </Columns>
                                                                                </asp:GridView>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <br />
                                                                                <br />
                                                                                <asp:Label ID="lblTotalScore" runat="server" CssClass="required"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="right">
                                                                                <table width="20%">
                                                                                    <tr>
                                                                                        <td align="center" style="padding-left: 15px;">
                                                                                            <asp:LinkButton CssClass="aButtonSmall" ID="lnkBack" runat="server" Width="50" CausesValidation="false"
                                                                                                OnClick="lnkBack_Click">Back</asp:LinkButton>
                                                                                            &nbsp;
                                                                                            <asp:LinkButton CssClass="aButtonSmall" ID="lnkCalculateScore" runat="server" Width="110"
                                                                                                ValidationGroup="CompanyRegistration" OnClick="lnkCalculateScore_Click">Calculate Score</asp:LinkButton>
                                                                                            <asp:LinkButton CssClass="aButtonSmall" ID="lnkNext" runat="server" Width="50" ValidationGroup="CompanyRegistration"
                                                                                                OnClick="lnkBtnSubmit_Click">Next</asp:LinkButton>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </center>
                                                </center>
                                            </center>
                                        </center>
                                    </center>
                                </center>
                            </center>
                        </center>
                    </center>
                </center>
            </td>
        </tr>
    </table>
    </div>
</asp:Content>
