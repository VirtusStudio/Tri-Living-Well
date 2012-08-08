<%@ Page Title="Risk Stratification Process Step2" Language="C#" MasterPageFile="~/MasterPages/User.master"
    AutoEventWireup="true" CodeFile="RiskStratificationProcessStep2.aspx.cs" Inherits="Users_RiskStratificationProcessStep2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<link href="../Styles/fluid.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div id="wrapper">
<div id="contentFrame">
<div id="mainContent>
<asp:Label ID="lblError" runat="server" CssClass="required"></asp:Label>
<div id="contentHeader"><asp:Label ID="lblCMSText" runat="server"></asp:Label></div>
<div id="contentBody">
    <asp:GridView ID="GVQuestionnaireHeading" AutoGenerateColumns="False" runat="server"
        EmptyDataText="<br /><br />No Question Found.<br /><br />" EmptyDataRowStyle-CssClass="required"
        EmptyDataRowStyle-HorizontalAlign="Center" Width="100%" AllowPaging="false" AllowSorting="false"
        PagerStyle-CssClass="paging" CellSpacing="1" CellPadding="0" border="0" GridLines="None"
        BorderWidth="0" OnRowDataBound="GVQuestionHeading_RowDataBound">
        <RowStyle CssClass="topRow" />
        <AlternatingRowStyle CssClass="altRow" />
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
                                                        <td valign="top" align="left" width="75%">
                                                            <asp:Label ID="lblQuestionId" runat="server" Visible="false" Text='<%#Eval("IntQuestionnaireId") %>'></asp:Label>
                                                            <asp:Label ID="lblQuestion" runat="server" Text='<%#Eval("StrQuestion") %>'></asp:Label>
                                                        </td>
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
                        <tr>
                            <td colspan="2" style="height: 10px;">
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
<div id="continueBtn"> <asp:LinkButton CssClass="aButtonSmall" ID="lnkBack" runat="server" Width="50" CausesValidation="false" OnClick="lnkBack_Click">Back</asp:LinkButton><asp:LinkButton CssClass="aButtonSmall" ID="LinkButton2" runat="server" Width="50" ValidationGroup="CompanyRegistration" OnClick="lnkBtnSubmit_Click">Next</asp:LinkButton></div>
</div>
</div>
</div>
</div>                                                                                                                                              
</asp:Content>