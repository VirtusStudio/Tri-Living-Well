<%@ Page Title="Risk Stratification Process Step 1" Language="C#" MasterPageFile="~/MasterPages/User.master"
    AutoEventWireup="true" CodeFile="RiskStratificationProcessStep1.aspx.cs" Inherits="Users_RiskStratificationProcessStep1"
    ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<link href="../Styles/fluid.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div id="wrapper">
<div id="contentFrame">
<div id="mainContent>
<asp:Label ID="Label1" runat="server" CssClass="required"></asp:Label>
<div id="contentHeader"><asp:Label ID="lblCMSText" runat="server"></asp:Label></div>
<div id="contentBody">
    <asp:GridView ID="GVQuestionnaire" AutoGenerateColumns="False" runat="server" EmptyDataText="<br /><br />No Question Found.<br /><br />"
        EmptyDataRowStyle-CssClass="required" EmptyDataRowStyle-HorizontalAlign="Center"
        Width="100%" AllowPaging="false" AllowSorting="false" PagerStyle-CssClass="paging"
        CellSpacing="1" CellPadding="0" border="0" GridLines="None" BorderWidth="0" OnRowDataBound="GVQuestionnaire_RowDataBound">
        <RowStyle CssClass="topRow" />
        <AlternatingRowStyle CssClass="altRow" />
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
<div id="waiver"><asp:CheckBox ID="chkWaiverAgreement" runat="server" Text="&nbsp; &nbsp; I have read and accept the Waiver Agreement" />&nbsp; &nbsp; &nbsp;<asp:Label ID="lblError" runat="server" CssClass="required"></asp:Label></div>
<div id="continueBtn"><asp:LinkButton CssClass="aButtonSmall" ID="lnkBtnSubmit" runat="server" Width="50" ValidationGroup="CompanyRegistration" OnClick="lnkBtnSubmit_Click">Next</asp:LinkButton></div>
</div>
</div>
</div>
</div>
</asp:Content>
