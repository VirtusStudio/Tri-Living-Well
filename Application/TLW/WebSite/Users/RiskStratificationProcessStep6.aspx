<%@ Page Title="Risk Stratification Process Step6" Language="C#" MasterPageFile="~/MasterPages/User.master"
    AutoEventWireup="true" CodeFile="RiskStratificationProcessStep6.aspx.cs" Inherits="Users_RiskStratificationProcessStep6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Styles/Table.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/centerRound3.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/Grid.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table>
        <tr id="trContent" runat="server">
            <td>
                <table>
                    <tr>
                        <td align="center">
                            <asp:Label ID="lblError" runat="server" CssClass="required"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="title">
                            Risk Stratification Process Step 5
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
                                                                                            Screen 6
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
                                                                                            <br />
                                                                                            Tutorials & Navigation
                                                                                            <br />
                                                                                            <br />
                                                                                            <br />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="left">
                                                                                            <asp:Label ID="lblTutorialNavigationHTMLText" runat="server"></asp:Label>
                                                                                            <a 
                                                                                            onclick="javascript:return OpenPopup('TutorialandNavigation');" 
                                                                                            href="#"
                                                                                                target="_blank">Read More</a>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr style="height: 30px;">
                                                                                        <td align="left">
                                                                                            <b>Tutorials</b>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr style="height: 40px;">
                                                                                        <td align="left">
                                                                                            <b>Goals & Objectives</b>
                                                                                            <asp:Label ID="lblGoalsObjectives" runat="server"></asp:Label>
                                                                                            <a href="#"
                                                                                                 onclick="javascript:return OpenPopup('GoalsAndObjectives');" 
                                                                                                target="_blank">Read More</a><br />
                                                                                            <br />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr style="height: 40px;">
                                                                                        <td align="left">
                                                                                            <b>Levels of Intensity </b>
                                                                                            <asp:Label ID="lblLevelOfIntensity" runat="server"></asp:Label>
                                                                                            <a href="#" target="_blank"
                                                                                             onclick="javascript:return OpenPopup('GoalsAndObjectives');" 
                                                                                            >
                                                                                                Read More</a><br />
                                                                                            <br />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr style="height: 40px;">
                                                                                        <td align="left">
                                                                                            <b>How we Measure </b>
                                                                                            <asp:Label ID="lblHowWeMeasure" runat="server"></asp:Label>
                                                                                            <a href="#"  
                                                                                            onclick="javascript:return OpenPopup('HowWeMeasure');" 
                                                                                             target="_blank">
                                                                                                Read More</a><br />
                                                                                            <br />
                                                                                            <br />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr style="height: 30px;">
                                                                                        <td align="left">
                                                                                            <b>Navigation </b>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr style="height: 40px;">
                                                                                        <td align="left">
                                                                                            <b>Nutrition Center </b>
                                                                                            <asp:Label ID="lblNutritionCenter" runat="server"></asp:Label>
                                                                                            <a href="#" target="_blank"
                                                                                              onclick="javascript:return OpenPopup('NutritionCenter');" 
                                                                                            
                                                                                            >
                                                                                                Read More</a><br />
                                                                                            <br />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr style="height: 40px;">
                                                                                        <td align="left">
                                                                                            <b>Personal Fitness</b>
                                                                                            <asp:Label ID="lbPersonalFitness" runat="server"></asp:Label>
                                                                                            <a 
                                                                                                onclick="javascript:return OpenPopup('PersonalFitness');" 
                                                                                                href="#"
                                                                                             target="_blank">
                                                                                                Read More</a><br />
                                                                                            <br />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr style="height: 40px;">
                                                                                        <td align="left">
                                                                                            <b>Wellness Diary </b>
                                                                                            <asp:Label ID="lblWellnessDiary" runat="server"></asp:Label>
                                                                                            <a href="#"
                                                                                            
                                                                                                onclick="javascript:return OpenPopup('WellnessDairy');" 
                                                                                             target="_blank">
                                                                                                Read More</a><br />
                                                                                            <br />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr style="height: 40px;">
                                                                                        <td align="left">
                                                                                            <b>Wellness Diary Forum </b>
                                                                                            <asp:Label ID="lblWellnessDairyForum" runat="server"></asp:Label>
                                                                                            <a href="#"
                                                                                               onclick="javascript:return OpenPopup('WellnessDairyForum');" 
                                                                                                target="_blank">Read More</a>
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
                                                                                                ValidationGroup="CompanyRegistration" OnClick="lnkBtnSubmit_Click">Submit</asp:LinkButton>
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
            </td>
        </tr>
        <tr id="trThanks" runat="server">
            <td>
                <table>
                    <tr>
                        <td class="title">
                            Risk Stratification Process
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <br />
                            <br />
                            <br />
                            Thanks For Your information.<br />
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        function OpenPopup(strPageName) {
            var FullUrl = '<%=AppConfig.GetBaseSiteUrl() %>Welcome/Content/' + strPageName + '.aspx';
            var newwindow = window.open(FullUrl, 'AskQuestion', 'height=400,width=600,status=no,toolbar=no,location=no,menubar=no,titlebar=no,scrollbars=yes');

            if (window.focus) { newwindow.focus() }

            return false;
        }

    </script>
</asp:Content>
