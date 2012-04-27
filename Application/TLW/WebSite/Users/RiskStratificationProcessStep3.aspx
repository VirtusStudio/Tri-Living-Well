<%@ Page Title="Risk Stratification Process Step3" Language="C#" MasterPageFile="~/MasterPages/User.master"
    AutoEventWireup="true" CodeFile="RiskStratificationProcessStep3.aspx.cs" Inherits="Users_RiskStratificationProcessStep3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="../Styles/BGT_Text_Arial.css" />
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
                Risk Stratification Process Step 3
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
                                                                                Screen 3
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
                                                                                Explaination for the Tri/Living/Well<br />
                                                                                <br />
                                                                                <br />
                                                                                <br />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="center">
                                                                                Waiting for Contents for the Explaination for the Tri/Living/Well
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="top" align="left">
                                                                                <br />
                                                                                <br />
                                                                                <br />
                                                                                Guidelines for the Tri/Living/Well<br />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="center">
                                                                                Waiting for Contents for the Guidelines for the Tri/Living/Well
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <br />
                                                                                <br />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="center">
                                                                                Your score: <b><asp:Label ID="lblScore" runat="server"></asp:Label></b>,
                                                                                Based on your health score, below is the category in which you lies.
                                                                                   
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 40px;">
                                                                            <td align="center">
                                                                                <img alt="" id="imgCategory" runat="server" src="~/images/icons/iconPalLevel1.jpg" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="left">
                                                                    <asp:CheckBox ID="chkWaiverAgreement" runat="server" Text="I accept the Waiver Agreement" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right"> <asp:LinkButton CssClass="aButtonSmall" ID="lnkBack" runat="server" Width="50"
                                                                                    CausesValidation="false" OnClick="lnkBack_Click">Back</asp:LinkButton>
                                                                      &nbsp;
                                                                    <asp:LinkButton CssClass="aButtonSmall" ID="lnkBtnSubmit" runat="server" Width="50"
                                                                        ValidationGroup="CompanyRegistration" OnClick="lnkBtnSubmit_Click">Next</asp:LinkButton>
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
