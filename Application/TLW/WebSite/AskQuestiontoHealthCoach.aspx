<%@ Page Title="Ask Question to Health Coaching" Language="C#" AutoEventWireup="true"
    CodeFile="AskQuestiontoHealthCoach.aspx.cs" Inherits="AskQuestiontoHealthCoach" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>
</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 100%;">
        
        <center class="Round5">
            <center>
                <center>
                    <center>
                        <center>
                            <center>
                                <center>
                                    <center>
                                        <center>
                                            <center>
                                                <table class="Round5_tblHeader">
                                                    <tr>
                                                        <td>
                                                            Ask To Health Coach
                                                        </td>
                                                        <td style="text-align: right;">
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
        <div class="demoContent" style="padding: 0px 15px 15px 15px;">
            <table cellpadding="4" cellspacing="4">
            <tr><td align="right" colspan="2">
                <input  style="height:30px;" type="button" class="aButtonSmall" value="Close" onclick="javascript:window.close();" />
            </td></tr>
            <tr><td colspan="2" align="center">
                <asp:Label ID="lblMsg" runat="server" CssClass="required"></asp:Label>
            </td></tr>
                <tr style="height:30px;">
                    <td align="right" valign="top">
                        Select Category:
                    </td>
                    <td align="left" valign="top">
                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="txtBox">
                            <asp:ListItem Value="101" Text="Walking"></asp:ListItem>
                            <asp:ListItem Value="201" Text="Running"></asp:ListItem>
                            <asp:ListItem Value="301" Text="Cycling"></asp:ListItem>
                            <asp:ListItem Value="401" Text="Swimming"></asp:ListItem>
                            <asp:ListItem Value="501" Text="Female Specific Home"></asp:ListItem>
                            <asp:ListItem Value="601" Text="Female Specific Gym"></asp:ListItem>
                            <asp:ListItem Value="701" Text="Strength Training Home"></asp:ListItem>
                            <asp:ListItem Value="801" Text="Strength Training Gym"></asp:ListItem>
                            <asp:ListItem Value="901" Text="Cross Fit"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr style="height:30px;">
                    <td align="right" valign="top">
                        Select Level:
                    </td>
                    <td align="left" valign="top">
                        <asp:DropDownList ID="ddlLevel" runat="server" CssClass="txtBox">
                            <asp:ListItem Value="Tri" Text="Tri"></asp:ListItem>
                            <asp:ListItem Value="Living" Text="Living"></asp:ListItem>
                            <asp:ListItem Value="Well" Text="Well"></asp:ListItem>
                             
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr style="height:30px;">
                    <td align="right" valign="top">
                        <span class="required">*</span>Question:
                    </td>
                    <td align="left" valign="top">
                        <asp:TextBox CssClass="txtBox" ID="txtQuestion" runat="server" MaxLength="400" Width="350px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtQuestion"
                            CssClass="required" Display="Static" ErrorMessage="*Required" SetFocusOnError="true"
                            ValidationGroup="CreateUserWizard1" Visible="true"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr style="height:30px;">
                    <td align="right" valign="top">
                        <span class="required">*</span>Subject:
                    </td>
                    <td align="left" valign="top">
                        <asp:TextBox CssClass="txtBox" ID="txtsubject" runat="server" MaxLength="250" Width="350px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtsubject"
                            CssClass="required" Display="Static" ErrorMessage="*Required" SetFocusOnError="true"
                            ValidationGroup="CreateUserWizard1" Visible="true"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr style="height:40px;">
                    <td align="right" valign="top">
                        Comments:
                    </td>
                    <td align="left" valign="top">
                        <asp:TextBox CssClass="txtBox" ID="txtComments" runat="server" MaxLength="250" Width="350px"
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:30px;">
                    <td align="right" valign="middle">
                        Question Type:
                    </td>
                    <td align="left" valign="middle">
                        <asp:RadioButtonList Width="200" ID="rdoQuestionType" RepeatColumns="2" RepeatDirection="Horizontal" runat="server" >
                          <asp:ListItem Value="Public" Selected="True" Text="Public"></asp:ListItem>
                            <asp:ListItem Value="Private" Text="Private"></asp:ListItem>
                           
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td align="left" valign="bottom">
                        <asp:LinkButton CssClass="aButtonSmall" ToolTip="Click here to submit your question"
                            CausesValidation="true" ValidationGroup="CreateUserWizard1" Width="65" ID="lnkBtnSearch"
                            runat="server" OnClick="lnkBtnSumit_Click">Submit</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
