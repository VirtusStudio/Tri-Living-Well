<%@ Page Title="Answer to Question" Language="C#" MasterPageFile="~/MasterPages/BackOffice.master"
    AutoEventWireup="true" CodeFile="AnswertoQuestions.aspx.cs" Inherits="BackOffice_UserUtilities_AnswertoQuestions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td align="left">
                <table class="title">
                    <tr>
                        <td align="left">
                            Answer to User's Questions
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="right">
                <a class="aButtonSmall" href="javascript:history.back();">Back</a>
            </td>
        </tr>
    </table>
    <div class="demoContent" style="padding: 0px 15px 15px 15px;">
        <table cellpadding="4" cellspacing="4">
            <tr>
                <td colspan="2" align="center">
                    <asp:Label ID="lblMsg" runat="server" CssClass="required"></asp:Label>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td align="right" valign="top">
                   <b> Question From User:</b>&nbsp;&nbsp;
                </td>
                <td align="left" valign="top">
                    <asp:Label ID="lblUserId" Visible="false" runat="server"></asp:Label>
                    <asp:Label ID="lblUserEmail" runat="server"></asp:Label>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td align="right" valign="top">
                   <b> Category:</b>:&nbsp;&nbsp;
                </td>
                <td align="left" valign="top">
                    <asp:Label ID="lblCategory" runat="server"></asp:Label>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td align="right" valign="top">
                    <b>Question:</b>&nbsp;&nbsp;
                </td>
                <td align="left" valign="top">
                    <asp:Label ID="lblQuestion" runat="server"></asp:Label>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td align="right" valign="top">
                    <b>Subject:</b>&nbsp;&nbsp;
                </td>
                <td align="left" valign="top">
                    <asp:Label ID="lblSubject" runat="server"></asp:Label>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td align="right" valign="top">
                   <b> Comments:</b>&nbsp;&nbsp;
                </td>
                <td align="left" valign="top">
                    <asp:Label ID="lblComments" runat="server"></asp:Label>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td align="right" valign="top">
                   <b> Question Type:</b>&nbsp;&nbsp;
                </td>
                <td align="left" valign="top">
                    <asp:RadioButtonList Width="200" ID="rdoQuestionType" RepeatColumns="2" RepeatDirection="Horizontal"
                        runat="server">
                        <asp:ListItem Value="Public" Selected="True" Text="Public"></asp:ListItem>
                        <asp:ListItem Value="Private" Text="Private"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr style="height: 30px;">
                <td align="right" valign="top">
                   <b> Enter Your Answer:</b>&nbsp;&nbsp;
                </td>
                <td align="left" valign="top">
                    <asp:TextBox CssClass="txtBox" ID="txtAnswer" runat="server" MaxLength="250" Width="350px"
                        Rows="5" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAnswer"
                        CssClass="required" Display="Static" ErrorMessage="Please Enter Your Answer."
                        SetFocusOnError="true" ValidationGroup="CreateUserWizard1" Visible="true"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height:30px;">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td align="left" valign="bottom">
                    <asp:LinkButton CssClass="aButtonSmall" ToolTip="Click here to submit your answer"
                        CausesValidation="true" ValidationGroup="CreateUserWizard1" ID="lnkBtnSearch"
                        runat="server" OnClick="lnkBtnSumit_Click">Submit Answer</asp:LinkButton>
                </td>
            </tr> <tr>
                <td colspan="2" style="height:30px;">
                    &nbsp;
                </td>
            </tr>
            <tr id="trAnswer" runat="server">
                <td colspan="2">
                    <table width="100%">
                        <tr>
                            <td align="left" valign="top">
                                Previous Answer by Health Coach:
                            </td>
                        </tr>
                        <tr>
                          
                                <td align="left" valign="top">
                                    <asp:GridView ID="GVAnswer" AutoGenerateColumns="False" runat="server" EmptyDataText="<br /><br />No Record Found.<br /><br />"
                                        EmptyDataRowStyle-CssClass="required" EmptyDataRowStyle-HorizontalAlign="Center"
                                        Width="100%" AllowPaging="false" AllowSorting="false" PagerStyle-CssClass="paging"
                                        CellSpacing="1" CellPadding="0" border="0" GridLines="None" BorderWidth="0">
                                        <RowStyle CssClass="gridItem" />
                                        <HeaderStyle CssClass="gridHeader" />
                                        <AlternatingRowStyle CssClass="gridAltItem" />
                                        <Columns>
                                            <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Answered On"
                                                ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <%#AppLib.GetFormattedDate(Eval("DtAnsweredOn").ToString())%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="&nbsp;&nbsp;&nbsp;&nbsp;Answer"
                                                ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <%#Eval("StrAnswer").ToString()%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Answered By"
                                                ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                <ItemTemplate>
                                                    <%#AppLib.GetSubString(Eval("StrAnsweredBy").ToString(), 50)%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
