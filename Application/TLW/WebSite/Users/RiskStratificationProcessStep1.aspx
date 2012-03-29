<%@ Page Title="Risk Stratification Process Step 1" Language="C#" MasterPageFile="~/MasterPages/User.master"
    AutoEventWireup="true" CodeFile="RiskStratificationProcessStep1.aspx.cs" Inherits="Users_RiskStratificationProcessStep1"
    ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Styles/Table.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/centerRound3.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/Grid.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr>
            <td align="center">
                <asp:Label ID="lblError" runat="server" CssClass="required"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="title">
                Risk Stratification Process Step 1
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
                                                                                Screen 1
                                                                            </td>
                                                                            <td style="text-align: right;">
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <table width="100%" style="padding: 10px;" cellpadding="4" cellspacing="4" border="0">
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
                                                                                &nbsp;
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="top" align="left">
                                                                                <table width="100%">
                                                                                    <tr>
                                                                                        <td style="width: 20%">
                                                                                            <b>Part A </b>
                                                                                        </td>
                                                                                        <td align="left">
                                                                                            Physical Activity Readiness Questionnaire (PART-A)
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:GridView ID="GVQuestionnaire" AutoGenerateColumns="False" runat="server" EmptyDataText="<br /><br />No Question Found.<br /><br />"
                                                                                    EmptyDataRowStyle-CssClass="required" EmptyDataRowStyle-HorizontalAlign="Center"
                                                                                    Width="100%" AllowPaging="false" AllowSorting="false" PagerStyle-CssClass="paging"
                                                                                    CellSpacing="1" CellPadding="0" border="0" GridLines="None" BorderWidth="0" OnRowDataBound="GVQuestionnaire_RowDataBound">
                                                                                    <Columns>
                                                                                        <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="" ItemStyle-HorizontalAlign="Left"
                                                                                            HeaderStyle-HorizontalAlign="Left">
                                                                                            <ItemTemplate>
                                                                                                <table>
                                                                                                    <tr style="height: 30px;">
                                                                                                        <td style="width: 20px;" valign="top" align="center">
                                                                                                            <%# ((GridViewRow) Container).RowIndex +1 %>.
                                                                                                        </td>
                                                                                                        <td valign="top" align="left">
                                                                                                            <asp:Label ID="lblQuestionId" runat="server" Visible="false" Text='<%#Eval("IntQuestionnaireId") %>'></asp:Label>
                                                                                                            <asp:Label ID="lblQuestion" runat="server"  Text='<%#Eval("StrQuestion") %>'></asp:Label>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr style="height: 40px;">
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
                                                                            <td>
                                                                                <br />
                                                                                <br />
                                                                                <br />
                                                                                <br />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left">
                                                                                <asp:CheckBox ID="chkWaiverAgreement" runat="server" Text="I accept the Waiver Agreement" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <br />
                                                                                <br />
                                                                                <br />
                                                                                <br />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="right">
                                                                                <asp:LinkButton CssClass="aButtonSmall" ID="lnkBtnSubmit" runat="server" Width="50"
                                                                                    ValidationGroup="CompanyRegistration" OnClick="lnkBtnSubmit_Click">Next</asp:LinkButton>
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
</asp:Content>
