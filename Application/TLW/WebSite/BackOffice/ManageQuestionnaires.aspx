<%@ Page Title="Manage Questionnaires " Language="C#" MasterPageFile="~/MasterPages/BackOffice.master"
    AutoEventWireup="true" CodeFile="ManageQuestionnaires.aspx.cs" Inherits="BackOffice_ManageQuestionnaires" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../Scripts/Common.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="90%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <table class="title">
                    <tr>
                        <td align="left">
                            Manage Questionnaires
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="lblMsg" runat="server" CssClass="required"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <div class="">
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
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <table class="Round3_tblHeader">
                                                                            <tr>
                                                                                <td>
                                                                                    Add/Edit Questionnaire
                                                                                </td>
                                                                                <td style="text-align: right;">
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table border="0" width="100%" cellpadding="2" cellspacing="2">
                                                                            <tr style="height: 10px;">
                                                                                <td colspan="2">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="left" valign="middle" style="width: 20%;">
                                                                                    <span class="keyword">Select Quesionnaire Type:</span>&nbsp;
                                                                                </td>
                                                                                <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                    <asp:DropDownList ID="ddlQuestionnaireType" AutoPostBack="true" CssClass="txtBox"
                                                                                        runat="server" OnSelectedIndexChanged="ddlQuestionnaireType_SelectedIndexChanged">
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="height: 18px;">
                                                                                <td colspan="2">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="height: 40px;" id="trQuestionnaireHeading" runat="server">
                                                                                <td align="left" valign="middle">
                                                                                    <span class="keyword">Select Heading:</span>&nbsp;
                                                                                </td>
                                                                                <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                    <asp:DropDownList ID="ddlHeading" AutoPostBack="true" CssClass="txtBox" runat="server"
                                                                                        OnSelectedIndexChanged="ddlHeading_SelectedIndexChanged">
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="height: 18px;">
                                                                                <td colspan="2">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="height: 40px;">
                                                                                <td align="left" valign="middle">
                                                                                    <span class="keyword">Enter Question:</span>&nbsp;
                                                                                </td>
                                                                                <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                    <asp:TextBox runat="server" CssClass="txtBox" ID="txtQuestions" TextMode="MultiLine"
                                                                                        Rows="6" MaxLength="500" Width="450px"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtQuestions" Display="Static"
                                                                                        ValidationGroup="Question" ID="RequiredFieldValidator1" ErrorMessage="Please Enter Question."
                                                                                        CssClass="required"></asp:RequiredFieldValidator>
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="height: 18px;">
                                                                                <td colspan="2">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="height: 40px;">
                                                                                <td align="left" valign="middle">
                                                                                    <span class="keyword">Answer Options:</span>&nbsp;
                                                                                </td>
                                                                                <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                    <asp:CheckBox ID="chkYes" Text="&nbsp;Yes" runat="server" />
                                                                                    <asp:CheckBox ID="ChkNo" Text="&nbsp;No" runat="server" />
                                                                                    <asp:CheckBox ID="ChkDontKnow" Text="&nbsp;Don't Know" runat="server" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="height: 40px;">
                                                                                <td align="left" valign="middle">
                                                                                </td>
                                                                                <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                    <asp:CheckBox ID="chkIsActive" Text="&nbsp;Is Active" runat="server" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="height: 18px;">
                                                                                <td colspan="2">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                </td>
                                                                                <td align="left" valign="bottom">
                                                                                    <asp:LinkButton CssClass="aButtonSmall" ValidationGroup="Question" CausesValidation="true"
                                                                                        ToolTip="Click here to add/update" ID="lnkBtnSearch" runat="server" OnClick="lnkBtnSearch_Click">Add/Update</asp:LinkButton>
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
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="">
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
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <table class="Round3_tblHeader">
                                                                            <tr>
                                                                                <td>
                                                                                    Questionnaire Details
                                                                                </td>
                                                                                <td style="text-align: right;">
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left">
                                                                        <asp:Label ID="lblResultMsg" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div class="divBorder">
                                                                            <asp:GridView ID="GVQuestionnaire" AutoGenerateColumns="False" runat="server" EmptyDataText="<br /><br />No Question Found.<br /><br />"
                                                                                EmptyDataRowStyle-CssClass="required" EmptyDataRowStyle-HorizontalAlign="Center"
                                                                                Width="100%" AllowPaging="false" AllowSorting="false" PagerStyle-CssClass="paging"
                                                                                CellSpacing="1" CellPadding="0" border="0" GridLines="None" BorderWidth="0" OnRowCommand="GVQuestionnaire_RowCommand">
                                                                                <RowStyle CssClass="gridItem" />
                                                                                <HeaderStyle CssClass="gridHeader" />
                                                                                <AlternatingRowStyle CssClass="gridAltItem" />
                                                                                <Columns>
                                                                                    <asp:TemplateField Visible="false" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lbQuestionnaireId" runat="server" Visible="false" Text='<%#Eval("IntQuestionnaireId") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Questions"
                                                                                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <%#AppLib.GetSubString(Eval("StrQuestion").ToString(),30)%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Heading"
                                                                                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <%#AppLib.GetSubString(Eval("StrQuestionHeading").ToString(),20)%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Display Yes"
                                                                                        ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <%#Eval("ChrDisplayYes").ToString().Equals("Y")?"True":"False"%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Display No"
                                                                                        ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <%#Eval("ChrDisplayNo").ToString().Equals("Y")?"True":"False"%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Display Don't Know"
                                                                                        ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <%#Eval("ChrDisplayDontKnow").ToString().Equals("Y") ? "True" : "False"%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Date Created"
                                                                                        ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <%# AppLib.GetFormattedDate(Eval("DtCreatedDate").ToString())%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" SortExpression="ChrIsActive"
                                                                                        HeaderText="Current Status" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <asp:LinkButton CssClass="lnkBtn" OnClientClick="return ConfirmBid('change the status')"
                                                                                                ID="lnkSatus" ToolTip="Click here to change the status" runat="server" CommandName="StatusChanged"
                                                                                                CommandArgument='<%#Eval("IntQuestionnaireId") %>'>
                                                                                            
                                                                                             <%# Eval("ChrIsActive").ToString().Equals("Y")?"Active":"Deactive"%></asp:LinkButton>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Edit"
                                                                                        ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <asp:LinkButton ID="lnkEditQuestionnaire" runat="server" Text="Edit" CommandArgument='<%#Eval("IntQuestionnaireId") %>'
                                                                                                CommandName="EditQuestionnaire"></asp:LinkButton>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField Visible="false" HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Delete"
                                                                                        ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <asp:LinkButton ID="lnkDeleteQuestionnaire" runat="server" Text="Delete" OnClientClick="return ConfirmDelete('Question')"
                                                                                                CommandArgument='<%#Eval("IntQuestionnaireId") %>' CommandName="DeleteQuestionnaire"></asp:LinkButton>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </div>
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
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
