<%@ Page Title=" Risk Stratification Process Step 4" Language="C#" MasterPageFile="~/MasterPages/User.master"
    AutoEventWireup="true" CodeFile="RiskStratificationProcessStep4.aspx.cs" Inherits="Users_RiskStratificationProcessStep4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
 <script src="../js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script src="../js/jquery.alerts.js" type="text/javascript"></script>
    <link href="../Styles/jquery.alerts.css" rel="stylesheet" type="text/css" />
      <script src="../Scripts/Common.js" type="text/javascript"></script>
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
                Risk Stratification Process Step 4
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
                                                                                Screen 4
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
                                                                                <br />
                                                                                <br />
                                                                                Overview of the physical activity program
                                                                                <br />
                                                                                <br />
                                                                                <br />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="right">
                                                                                <a href="#" onclick="javascript:return OpenPopup();" id="ancAskQuestion" runat="server"
                                                                                    target="_blank" class="lnkBtn">Ask Question to Health Coach</a>
                                                                            </td>
                                                                        </tr><tr><td>&nbsp;</td></tr>
                                                                        <tr>
                                                                            <td style="border: 1px black solid;">
                                                                                <table cellpadding="2" cellspacing="2" style="margin: 5px;">
                                                                                    <tr>
                                                                                        <td>
                                                                                            &nbsp;
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="left">
                                                                                            <b>Please Select First Activity Program from the following:</b><br />
                                                                                            <br />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="left">
                                                                                            <table border="0" width="100%" cellpadding="2" cellspacing="2">
                                                                                                <tr>
                                                                                                    <td align="left" valign="middle">
                                                                                                        <img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram1_ON.jpg' id="imgProg1"
                                                                                                            onmouseover="ChangeImageOnMouseOver(this.id,'iconProgram1.jpg','iconProgram1_ON.jpg')"
                                                                                                            onclick="SelectCategory(this.id,'iconProgram1.jpg',101,'Walking')" onmouseout="ChangeImageOnMouseOut(this.id,'iconProgram1.jpg','iconProgram1_ON.jpg')"
                                                                                                            alt="Walking" title="Walking" />
                                                                                                    </td>
                                                                                                    <td align="left" valign="middle">
                                                                                                        <img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram2.jpg' id="img1"
                                                                                                            onmouseover="ChangeImageOnMouseOver(this.id,'iconProgram2.jpg','iconProgram2_ON.jpg')"
                                                                                                            onclick="SelectCategory(this.id,'iconProgram2.jpg',201,'Running')" onmouseout="ChangeImageOnMouseOut(this.id,'iconProgram2.jpg','iconProgram2_ON.jpg')"
                                                                                                            alt="Running" title="Running"/>
                                                                                                    </td>
                                                                                                    <td align="left" valign="middle">
                                                                                                        <img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram3.jpg' id="img2"
                                                                                                            onmouseover="ChangeImageOnMouseOver(this.id,'iconProgram3.jpg','iconProgram3_ON.jpg')"
                                                                                                            onclick="SelectCategory(this.id,'iconProgram3.jpg',301,'Cycling')" onmouseout="ChangeImageOnMouseOut(this.id,'iconProgram3.jpg','iconProgram3_ON.jpg')"
                                                                                                            alt="Cycling" title="Cycling"/>
                                                                                                    </td>
                                                                                                    <td align="left" valign="middle">
                                                                                                        <img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram4.jpg' id="img3"
                                                                                                            onmouseover="ChangeImageOnMouseOver(this.id,'iconProgram4.jpg','iconProgram4_ON.jpg')"
                                                                                                            onclick="SelectCategory(this.id,'iconProgram4.jpg',401,'Swimming')" onmouseout="ChangeImageOnMouseOut(this.id,'iconProgram4.jpg','iconProgram4_ON.jpg')"
                                                                                                            alt="Swimming" title="Swimming"/>
                                                                                                    </td>
                                                                                                    <td align="left" valign="middle">
                                                                                                        <img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram5.jpg' id="img4"
                                                                                                            onmouseover="ChangeImageOnMouseOver(this.id,'iconProgram5.jpg','iconProgram5_ON.jpg')"
                                                                                                            onclick="SelectCategory(this.id,'iconProgram5.jpg',501,'FemaleSpecificHome')" onmouseout="ChangeImageOnMouseOut(this.id,'iconProgram5.jpg','iconProgram5_ON.jpg')"
                                                                                                           alt="Female Specific Home" title="Female Specific Home" />
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td align="left" valign="middle">
                                                                                                        <img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram6.jpg' id="img5"
                                                                                                            onmouseover="ChangeImageOnMouseOver(this.id,'iconProgram6.jpg','iconProgram6_ON.jpg')"
                                                                                                            onclick="SelectCategory(this.id,'iconProgram6.jpg',601,'FemaleSpecificGym')" onmouseout="ChangeImageOnMouseOut(this.id,'iconProgram6.jpg','iconProgram6_ON.jpg')"
                                                                                                       alt="Female Specific Gym" title="Female Specific Gym"  />
                                                                                                    </td>
                                                                                                    <td align="left" valign="middle">
                                                                                                        <img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram7.jpg' id="img6"
                                                                                                            onmouseover="ChangeImageOnMouseOver(this.id,'iconProgram7.jpg','iconProgram7_ON.jpg')"
                                                                                                            onclick="SelectCategory(this.id,'iconProgram7.jpg',701,'StrengthTrainingHome')" onmouseout="ChangeImageOnMouseOut(this.id,'iconProgram7.jpg','iconProgram7_ON.jpg')"
                                                                                                           alt="Strength Training Home" title="Strength Training Home" />
                                                                                                    </td>
                                                                                                    <td align="left" valign="middle">
                                                                                                        <img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram8.jpg' id="img7"
                                                                                                            onmouseover="ChangeImageOnMouseOver(this.id,'iconProgram8.jpg','iconProgram8_ON.jpg')"
                                                                                                            onclick="SelectCategory(this.id,'iconProgram8.jpg',801,'StrengthTrainingGym')" onmouseout="ChangeImageOnMouseOut(this.id,'iconProgram8.jpg','iconProgram8_ON.jpg')"
                                                                                                          alt="Strength Training Gym" title="Strength Training Gym" />
                                                                                                    </td>
                                                                                                    <td align="left" valign="middle" colspan="2">
                                                                                                        <img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram9.jpg' id="img8"
                                                                                                            onmouseover="ChangeImageOnMouseOver(this.id,'iconProgram9.jpg','iconProgram9_ON.jpg')"
                                                                                                            onclick="SelectCategory(this.id,'iconProgram9.jpg',901,'CrossFit')" onmouseout="ChangeImageOnMouseOut(this.id,'iconProgram9.jpg','iconProgram9_ON.jpg')"
                                                                                                             alt="Cross Fit" title="Cross Fit"  />
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr style="height: 30px;">
                                                                                        <td align="center">
                                                                                            __________________________________________________________
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr id="trSelectedCategoryDetails">
                                                                                        <td>
                                                                                            <table width="100%" cellpadding="2" cellspacing="2" border="0">
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        Category Selected
                                                                                                        <img src="<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram1_ON.jpg" id="imgSelected"
                                                                                                            alt="" />
                                                                                                        <a href="#" onclick="javascript:return OpenPopupForViewGuidLines();" id="ancViewGuidelines"
                                                                                                            target="_blank" class="lnkBtn">View Guidelines</a>&nbsp;
                                                                                                            <a href="#" onclick="javascript:return OpenCMSPopupWindow(1);" id="a2" target="_blank"
                                                                                                class="lnkBtn">View Nutrition 101 Information</a>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            &nbsp;
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 30px;">
                                                                            <td align="center">
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="border: 1px black solid;">
                                                                                <table cellpadding="2" cellspacing="2" style="margin: 5px;">
                                                                                    <tr>
                                                                                        <td>
                                                                                            &nbsp;
                                                                                        </td>
                                                                                    </tr>

                                                                                     <tr>
                                                                            <td align="left">
                                                                                <b>Please Select Second Activity Program from the following:</b><br />
                                                                                <br />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="left">
                                                                                <table border="0" width="100%" cellpadding="2" cellspacing="2">
                                                                                    <tr>
                                                                                        <td align="left" valign="middle">
                                                                                            <img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram1_ON.jpg' id="img9"
                                                                                                onmouseover="ChangeImageOnMouseOver(this.id,'iconProgram1.jpg','iconProgram1_ON.jpg')"
                                                                                                onclick="SelectSecondCategory(this.id,'iconProgram1.jpg',101,'Walking')" onmouseout="ChangeImageOnMouseOut(this.id,'iconProgram1.jpg','iconProgram1_ON.jpg')"
                                                                                                  alt="Walking" title="Walking"  />
                                                                                        </td>
                                                                                        <td align="left" valign="middle">
                                                                                            <img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram2.jpg' id="img10"
                                                                                                onmouseover="ChangeImageOnMouseOver(this.id,'iconProgram2.jpg','iconProgram2_ON.jpg')"
                                                                                                onclick="SelectSecondCategory(this.id,'iconProgram2.jpg',201,'Running')" onmouseout="ChangeImageOnMouseOut(this.id,'iconProgram2.jpg','iconProgram2_ON.jpg')"
                                                                                               alt="Running" title="Running"  />
                                                                                        </td>
                                                                                        <td align="left" valign="middle">
                                                                                            <img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram3.jpg' id="img11"
                                                                                                onmouseover="ChangeImageOnMouseOver(this.id,'iconProgram3.jpg','iconProgram3_ON.jpg')"
                                                                                                onclick="SelectSecondCategory(this.id,'iconProgram3.jpg',301,'Cycling')" onmouseout="ChangeImageOnMouseOut(this.id,'iconProgram3.jpg','iconProgram3_ON.jpg')"
                                                                                                     alt="Cycling" title="Cycling"  />
                                                                                        </td>
                                                                                        <td align="left" valign="middle">
                                                                                            <img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram4.jpg' id="img12"
                                                                                                onmouseover="ChangeImageOnMouseOver(this.id,'iconProgram4.jpg','iconProgram4_ON.jpg')"
                                                                                                onclick="SelectSecondCategory(this.id,'iconProgram4.jpg',401,'Swimming')" onmouseout="ChangeImageOnMouseOut(this.id,'iconProgram4.jpg','iconProgram4_ON.jpg')"
                                                                                                  alt="Swimming" title="Swimming"  />
                                                                                        </td>
                                                                                        <td align="left" valign="middle">
                                                                                            <img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram5.jpg' id="img13"
                                                                                                onmouseover="ChangeImageOnMouseOver(this.id,'iconProgram5.jpg','iconProgram5_ON.jpg')"
                                                                                                onclick="SelectSecondCategory(this.id,'iconProgram5.jpg',501,'FemaleSpecificHome')" onmouseout="ChangeImageOnMouseOut(this.id,'iconProgram5.jpg','iconProgram5_ON.jpg')"
                                                                                                  alt="Female Specific Home" title="Female Specific Home"  />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="left" valign="middle">
                                                                                            <img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram6.jpg' id="img14"
                                                                                                onmouseover="ChangeImageOnMouseOver(this.id,'iconProgram6.jpg','iconProgram6_ON.jpg')"
                                                                                                onclick="SelectSecondCategory(this.id,'iconProgram6.jpg',601,'FemaleSpecificGym')" onmouseout="ChangeImageOnMouseOut(this.id,'iconProgram6.jpg','iconProgram6_ON.jpg')"
                                                                                                     alt="Female Specific Gym" title="Female Specific Gym" />
                                                                                        </td>
                                                                                        <td align="left" valign="middle">
                                                                                            <img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram7.jpg' id="img15"
                                                                                                onmouseover="ChangeImageOnMouseOver(this.id,'iconProgram7.jpg','iconProgram7_ON.jpg')"
                                                                                                onclick="SelectSecondCategory(this.id,'iconProgram7.jpg',701,'StrengthTrainingHome')" onmouseout="ChangeImageOnMouseOut(this.id,'iconProgram7.jpg','iconProgram7_ON.jpg')"
                                                                                                     alt="Strength Training Home" title="Strength Training Home" />
                                                                                        </td>
                                                                                        <td align="left" valign="middle">
                                                                                            <img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram8.jpg' id="img16"
                                                                                                onmouseover="ChangeImageOnMouseOver(this.id,'iconProgram8.jpg','iconProgram8_ON.jpg')"
                                                                                                onclick="SelectSecondCategory(this.id,'iconProgram8.jpg',801,'StrengthTrainingGym')" onmouseout="ChangeImageOnMouseOut(this.id,'iconProgram8.jpg','iconProgram8_ON.jpg')"
                                                                                                  alt="Strength Training Gym" title="Strength Training Gym" />
                                                                                        </td>
                                                                                        <td align="left" valign="middle" colspan="2">
                                                                                            <img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram9.jpg' id="img17"
                                                                                                onmouseover="ChangeImageOnMouseOver(this.id,'iconProgram9.jpg','iconProgram9_ON.jpg')"
                                                                                                onclick="SelectSecondCategory(this.id,'iconProgram9.jpg',901,'CrossFit')" onmouseout="ChangeImageOnMouseOut(this.id,'iconProgram9.jpg','iconProgram9_ON.jpg')"
                                                                                                  alt="Cross Fit" title="Cross Fit" />
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="height: 30px;">
                                                                            <td align="center">
                                                                                __________________________________________________________
                                                                            </td>
                                                                        </tr>
                                                                        <tr id="trSecondSelectedCategoryDetails">
                                                                            <td>
                                                                                <table width="100%" cellpadding="2" cellspacing="2" border="0">
                                                                                    <tr>
                                                                                        <td>
                                                                                            Category Selected
                                                                                            <img src="<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram1_ON.jpg" id="imgSecondCategory"
                                                                                                alt="" />
                                                                                            <a href="#" onclick="javascript:return OpenPopupForViewGuidLinesForSecondCategory();" id="ancSecondViewGuidelines" target="_blank"
                                                                                                class="lnkBtn">View Guidelines</a>&nbsp;
                                                                                                <a href="#" onclick="javascript:return OpenCMSPopupWindow(2);" id="a1" target="_blank"
                                                                                                class="lnkBtn">View Nutrition 101 Information</a>

                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr><tr><td>&nbsp;</td></tr>
                                                                        <tr>
                                                                            <td align="right">
                                                                                <asp:LinkButton CssClass="aButtonSmall" ID="lnkBack" runat="server" Width="50" CausesValidation="false"
                                                                                    OnClick="lnkBack_Click">Back</asp:LinkButton>
                                                                                &nbsp;
                                                                                <asp:LinkButton CssClass="aButtonSmall" ID="lnkBtnSubmit" runat="server" Width="50"
                                                                                    ValidationGroup="CompanyRegistration" OnClick="lnkBtnSubmit_Click">Next</asp:LinkButton>
                                                                                <asp:HiddenField ID="hfCategoryId" Value="101" runat="server" />
                                                                                <asp:HiddenField ID="hfSecondCategoryId" Value="101" runat="server" />
                                                                                <asp:HiddenField ID="hfFirstCategoryName" Value="Walking" runat="server" />
                                                                                <asp:HiddenField ID="hfSecondCategoryName" Value="Walking" runat="server" />
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
    <script language="javascript" type="text/javascript">

       


        function ChangeImageOnMouseOver(objImgId, OriginalImg, HoverImage) {
            document.getElementById(objImgId).src = '<%=AppConfig.GetBaseSiteUrl() %>images/icons/' + HoverImage;
        }

        function ChangeImageOnMouseOut(objImgId, OriginalImg, HoverImage) {
            document.getElementById(objImgId).src = '<%=AppConfig.GetBaseSiteUrl() %>images/icons/' + OriginalImg;
        }

        function SelectSecondCategory(objImgId, OriginalImg, CategoryId, CategoryName) {

            document.getElementById('<%=hfSecondCategoryName.ClientID %>').value = CategoryName.toString();
            document.getElementById('<%=hfSecondCategoryId.ClientID %>').value = CategoryId.toString();
            document.getElementById("ancSecondViewGuidelines").href = '<%=AppConfig.GetBaseSiteUrl() %>Welcome/Content/ViewCategoryGuideLines.aspx?catid=' + CategoryId;
            document.getElementById("trSecondSelectedCategoryDetails").style.display = '';
            document.getElementById("imgSecondCategory").src = '<%=AppConfig.GetBaseSiteUrl() %>images/icons/' + OriginalImg;
            document.getElementById('<%=ancAskQuestion.ClientID %>').href = '<%=AppConfig.GetBaseSiteUrl() %>AskQuestiontoHealthCoach.aspx?catid=' + CategoryId;

            jConfirm('Are you sure want to Review Details?', 'Review Details', function (r) {

                if (r == true) {
                    OpenCMSPopupWindow(2);
                }
            });
     
     
        }

        function SelectCategory(objImgId, OriginalImg, CategoryId, CategoryName) {
            document.getElementById('<%=hfFirstCategoryName.ClientID %>').value = CategoryName.toString();
            document.getElementById('<%=hfCategoryId.ClientID %>').value = CategoryId.toString();
            document.getElementById("ancViewGuidelines").href = '<%=AppConfig.GetBaseSiteUrl() %>Welcome/Content/ViewCategoryGuideLines.aspx?catid=' + CategoryId;
            document.getElementById("trSelectedCategoryDetails").style.display = '';
            document.getElementById("imgSelected").src = '<%=AppConfig.GetBaseSiteUrl() %>images/icons/' + OriginalImg;
            document.getElementById('<%=ancAskQuestion.ClientID %>').href = '<%=AppConfig.GetBaseSiteUrl() %>AskQuestiontoHealthCoach.aspx?catid=' + CategoryId;

            jConfirm('Are you sure want to Review Details?', 'Review Details', function (r) {

                if (r == true) {
                    OpenCMSPopupWindow(1);
                }
               
            });
        }

        function OpenPopup() {
            var FullUrl = '<%=AppConfig.GetBaseSiteUrl() %>AskQuestiontoHealthCoach.aspx?catid=' + document.getElementById('<%=hfCategoryId.ClientID %>').value;
            var newwindow = window.open(FullUrl, 'AskQuestion', 'height=400,width=600,status=no,toolbar=no,location=no,menubar=no,titlebar=no,scrollbars=yes');

            if (window.focus) { newwindow.focus() }

            return false;
        }

        function OpenPopupForViewGuidLines() {
            var FullUrl = '<%=AppConfig.GetBaseSiteUrl() %>Welcome/Content/ViewCategoryGuideLines.aspx?catid=' + document.getElementById('<%=hfCategoryId.ClientID %>').value;
            var newwindow = window.open(FullUrl, 'ViewGuidLines', 'height=400,width=600,status=no,toolbar=no,location=no,menubar=no,titlebar=no,scrollbars=yes');

            if (window.focus) {newwindow.focus(); }

            return false;
        }

        function OpenPopupForViewGuidLinesForSecondCategory() {
            var FullUrl = '<%=AppConfig.GetBaseSiteUrl() %>Welcome/Content/ViewCategoryGuideLines.aspx?catid=' + document.getElementById('<%=hfSecondCategoryId.ClientID %>').value;
            var newwindow = window.open(FullUrl, 'ViewGuidLines', 'height=400,width=600,status=no,toolbar=no,location=no,menubar=no,titlebar=no,scrollbars=yes');

            if (window.focus) {newwindow.focus(); }

            return false;
        }
        function OpenCMSPopupWindow(Categoryno) {
            var varCMSTypeName = '';
            if (Number(Categoryno) == Number(1))
                varCMSTypeName = document.getElementById('<%=hfFirstCategoryName.ClientID %>').value;
            else
                varCMSTypeName = document.getElementById('<%=hfSecondCategoryName.ClientID %>').value;

            varCMSTypeName = varCMSTypeName + '101';
            var varPageName = '<%=AppConfig.GetBaseSiteUrl() %>' + "Popups/CMSPopup.aspx?cmstype=" + varCMSTypeName;
            OpenPopupCMSPopup(varPageName, varCMSTypeName);


            return false;
        }
    </script>
</asp:Content>
