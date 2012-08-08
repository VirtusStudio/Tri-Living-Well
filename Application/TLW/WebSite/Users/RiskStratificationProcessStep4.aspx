<%@ Page Title=" Risk Stratification Process Step 4" Language="C#" MasterPageFile="~/MasterPages/User.master"
    AutoEventWireup="true" CodeFile="RiskStratificationProcessStep4.aspx.cs" Inherits="Users_RiskStratificationProcessStep4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<script src="../js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="../js/jquery.alerts.js" type="text/javascript"></script>
<link href="../Styles/jquery.alerts.css" rel="stylesheet" type="text/css" />
<script src="../Scripts/Common.js" type="text/javascript"></script>
<link href="../Styles/fluid.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">

    function ChangeImageOnMouseOver(objImgId, OriginalImg, HoverImage) {
        document.getElementById(objImgId).src = '<%=AppConfig.GetBaseSiteUrl() %>images/icons/' + HoverImage;
    }

    function ChangeImageOnMouseOut(objImgId, OriginalImg, HoverImage) {
        document.getElementById(objImgId).src = '<%=AppConfig.GetBaseSiteUrl() %>images/icons/' + OriginalImg;
    }

    function SelectCategory(objImgId, OnImg, OffImg, CategoryId, CategoryName) {
        $('img').each(function (index) {
            var info = $(this).attr("onclick");
            var id = $(this).attr("id");
            var info = info.replace("this.id", id);
            var type = info.substring(0, 14);
            if (type == "SelectCategory" && info != null) {

            }
            else {
                var info = info.replace("Unselect(", "");
                var info = info.replace(")", "");
                var i = info.split(",");
                var imgid = i[0];
                var onimg = i[1];
                var onimg = onimg.replace("'", "");
                var onimg = onimg.replace("'", "");
                var onimg = onimg.replace(" ", "");
                var offimg = i[2];
                var offimg = offimg.replace("'", "");
                var offimg = offimg.replace("'", "");
                var offimg = offimg.replace(" ", "");
                var catid = i[3];
                var catname = i[4];
                var catname = catname.replace("'", "");
                var catname = catname.replace("'", "");
                var catname = catname.replace(" ", "");
                Unselect(imgid, onimg, offimg, catid, catname);
            }
        });
        document.getElementById('<%=hfFirstCategoryName.ClientID %>').value = CategoryName.toString();
        document.getElementById('<%=hfCategoryId.ClientID %>').value = CategoryId.toString();
        document.getElementById('<%=ancAskQuestion.ClientID %>').href = '<%=AppConfig.GetBaseSiteUrl() %>AskQuestiontoHealthCoach.aspx?catid=' + CategoryId;
        document.getElementById(objImgId).src = '<%=AppConfig.GetBaseSiteUrl() %>images/icons/' + OnImg;
        var offimg = "Unselect(this.id, '" + OnImg + "','" + OffImg + "'," + CategoryId + ",'" + CategoryName + "')";
        document.getElementById(objImgId).setAttribute("onclick", offimg);
    }

    function Unselect(objImgId, OnImg, OffImg, CategoryId, CategoryName) {
        document.getElementById(objImgId).src = '<%=AppConfig.GetBaseSiteUrl() %>images/icons/' + OffImg;
        var onimg = "SelectCategory(this.id, '" + OnImg + "','" + OffImg + "'," + CategoryId + ",'" + CategoryName + "')";
        document.getElementById(objImgId).setAttribute("onclick", onimg);
    }

    function OpenPopup() {
        var FullUrl = '<%=AppConfig.GetBaseSiteUrl() %>AskQuestiontoHealthCoach.aspx?catid=' + document.getElementById('<%=hfCategoryId.ClientID %>').value;
        var newwindow = window.open(FullUrl, 'AskQuestion', 'height=400,width=600,status=no,toolbar=no,location=no,menubar=no,titlebar=no,scrollbars=yes');

        if (window.focus) { newwindow.focus() }

        return false;
    }

    function OpenPopupForViewGuideLines() {
        var FullUrl = '<%=AppConfig.GetBaseSiteUrl() %>Welcome/Content/ViewCategoryGuideLines.aspx?catid=' + document.getElementById('<%=hfCategoryId.ClientID %>').value;
        var newwindow = window.open(FullUrl, 'ViewGuidLines', 'height=400,width=600,status=no,toolbar=no,location=no,menubar=no,titlebar=no,scrollbars=yes');

        if (window.focus) { newwindow.focus(); }    

        return false;
    }

    function OpenCMSPopupWindow(program) {
        var varCMSTypeName = '';
        
        varCMSTypeName = program + '101';
        var varPageName = '<%=AppConfig.GetBaseSiteUrl() %>' + "Popups/CMSPopup.aspx?cmstype=" + varCMSTypeName;
        OpenPopupCMSPopup(varPageName, varCMSTypeName);

        return false;
    }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div id="wrapper">
<div id="contentFrame">
<div id="mainContent>
<asp:Label ID="lblError" runat="server" CssClass="required"></asp:Label>
<div id="contentHeader"><asp:Label ID="lblCMSText" runat="server"></asp:Label></div>
<div id="contentBody">
<div id="askCoach">Questions? <a href="#" onclick="javascript:return OpenPopup();" id="ancAskQuestion" runat="server" target="_blank" class="lnkBtn">Ask Your Health Coach</a></div>
<div id="activityHeader">Please select an Activity Program below:</div>
<div id="activityWrapper">
<div id="programActivity" class="altRow"><img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram1.png' id="img1" 
                                                                                                            onclick="SelectCategory(this.id,'iconProgram1_ON.png','iconProgram1.png',101,'Walking')" 
                                                                                                            alt="Walking" title="Walking" />&nbsp;<asp:Label ID="lblWalkingText" runat="server"></asp:Label><div id="programInfo"><a href="#" onclick="javascript:return OpenCMSPopupWindow('Walking');" id="a2" target="_blank"
                                                                                                class="lnkBtn">View Details</a></div></div>
<div id="programActivity"><img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram2.png' id="img2"
                                                                                                            
                                                                                                            onclick="SelectCategory(this.id,'iconProgram2_ON.png','iconProgram2.png',201,'Running')" 
                                                                                                            alt="Running" title="Running"/>&nbsp;<asp:Label ID="lblRunningText" runat="server"></asp:Label><div id="programInfo"><a href="#" onclick="javascript:return OpenCMSPopupWindow('Running');" id="a1" target="_blank"
                                                                                                class="lnkBtn">View Details</a></div></div>
<div id="programActivity" class="altRow"><img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram3.png' id="img3"
                                                                                                            
                                                                                                            onclick="SelectCategory(this.id,'iconProgram3_ON.png','iconProgram3.png',301,'Cycling')" 
                                                                                                            alt="Cycling" title="Cycling"/>&nbsp;<asp:Label ID="lblCyclingText" runat="server"></asp:Label><div id="programInfo"><a href="#" onclick="javascript:return OpenCMSPopupWindow('Cycling');" id="a3" target="_blank"
                                                                                                class="lnkBtn">View Details</a></div></div>
<div id="programActivity"><img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram4.png' id="img4"
                                                                                                            
                                                                                                            onclick="SelectCategory(this.id,'iconProgram4_ON.png','iconProgram4.png',401,'Swimming')" 
                                                                                                            alt="Swimming" title="Swimming"/>&nbsp;<asp:Label ID="lblSwimmingText" runat="server"></asp:Label><div id="programInfo"><a href="#" onclick="javascript:return OpenCMSPopupWindow('Swimming');" id="a4" target="_blank"
                                                                                                class="lnkBtn">View Details</a></div></div>
<div id="programActivity" class="altRow"><img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram5.png' id="img5"
                                                                                                            
                                                                                                            onclick="SelectCategory(this.id,'iconProgram5_ON.png','iconProgram5.png',501,'FemaleSpecificHome')" 
                                                                                                           alt="Female Specific Home" title="Female Specific Home" />&nbsp;<asp:Label ID="lblFemaleHomeText" runat="server"></asp:Label><div id="programInfo"><a href="#" onclick="javascript:return OpenCMSPopupWindow('FemaleSpecificHome');" id="a5" target="_blank"
                                                                                                class="lnkBtn">View Details</a></div></div>
<div id="programActivity"><img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram6.png' id="img6"
                                                                                                           
                                                                                                            onclick="SelectCategory(this.id,'iconProgram6_ON.png','iconProgram6.png',601,'FemaleSpecificGym')" 
                                                                                                       alt="Female Specific Gym" title="Female Specific Gym"  />&nbsp;<asp:Label ID="lblFemaleGymText" runat="server"></asp:Label><div id="programInfo"><a href="#" onclick="javascript:return OpenCMSPopupWindow('FemaleSpecificGym');" id="a6" target="_blank"
                                                                                                class="lnkBtn">View Details</a></div></div>
<div id="programActivity" class="altRow"><img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram7.png' id="img7"
                                                                                                            
                                                                                                            onclick="SelectCategory(this.id,'iconProgram7_ON.png','iconProgram7.png',701,'StrengthTrainingHome')" 
                                                                                                           alt="Strength Training Home" title="Strength Training Home" />&nbsp;<asp:Label ID="lblMaleHomeText" runat="server"></asp:Label><div id="programInfo"><a href="#" onclick="javascript:return OpenCMSPopupWindow('StrengthTrainingHome');" id="a7" target="_blank"
                                                                                                class="lnkBtn">View Details</a></div></div>
<div id="programActivity"><img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram8.png' id="img8"
                                                                                                            
                                                                                                            onclick="SelectCategory(this.id,'iconProgram8_ON.png','iconProgram8.png',801,'StrengthTrainingGym')" 
                                                                                                          alt="Strength Training Gym" title="Strength Training Gym" />&nbsp;<asp:Label ID="lblMaleGymText" runat="server"></asp:Label><div id="programInfo"><a href="#" onclick="javascript:return OpenCMSPopupWindow('StrengthTrainingGym');" id="a8" target="_blank"
                                                                                                class="lnkBtn">View Details</a></div></div>
<div id="programActivity" class="altRow"><img src='<%=AppConfig.GetBaseSiteUrl() %>images/icons/iconProgram9.png' id="img9"
                                                                                                            
                                                                                                            onclick="SelectCategory(this.id,'iconProgram9_ON.png','iconProgram9.png',901,'CrossFit')" 
                                                                                                             alt="Cross Fit" title="Cross Fit"  />&nbsp;<asp:Label ID="lblCrossfitText" runat="server"></asp:Label><div id="programInfo"><a href="#" onclick="javascript:return OpenCMSPopupWindow('CrossFit');" id="a9" target="_blank"
                                                                                                class="lnkBtn">View Details</a></div></div>
                                                                   
<div id="continueBtn"><asp:LinkButton CssClass="aButtonSmall" ID="lnkBtnSubmit" runat="server" Width="50" ValidationGroup="CompanyRegistration" OnClick="lnkBtnSubmit_Click">Next</asp:LinkButton><asp:HiddenField ID="hfCategoryId" runat="server" /><asp:HiddenField ID="hfFirstCategoryName" runat="server" /></div>
</div>
</div>
</div>
</div> 
</div>                                                                                                                                             
</asp:Content>