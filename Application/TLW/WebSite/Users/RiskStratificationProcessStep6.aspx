<%@ Page Title="Risk Stratification Process Step6" Language="C#" MasterPageFile="~/MasterPages/User.master"
    AutoEventWireup="true" CodeFile="RiskStratificationProcessStep6.aspx.cs" Inherits="Users_RiskStratificationProcessStep6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<link href="../Styles/fluid.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div id="wrapper">
<div id="mainContent>
<asp:Label ID="lblError" runat="server" CssClass="required"></asp:Label>
<div id="contentHeader"><asp:Label ID="lblTutorialNavigationHTMLText" runat="server"></asp:Label> <a onclick="javascript:return OpenPopup('TutorialandNavigation');" href="#" target="_blank">Read More</a></asp:Label></div>
<div id="contentBody">
<div class="resourceHeader" class="altRow">Goals & Objectives</div>
<div class="resourceDetails" class="altRow"><asp:Label ID="lblGoalsObjectives" runat="server"></asp:Label>
                                                                                            <a href="#"
                                                                                                 onclick="javascript:return OpenPopup('GoalsAndObjectives');" 
                                                                                                target="_blank">Read More</a></div>
<div class="resourceHeader" class="topRow">Levels of Intensity</div>
<div class="resourceDetails" class="topRow"><asp:Label ID="lblLevelOfIntensity" runat="server"></asp:Label>
                                                                                            <a href="#" target="_blank"
                                                                                             onclick="javascript:return OpenPopup('GoalsAndObjectives');" 
                                                                                            >
                                                                                                Read More</a></div>

<div class="resourceHeader" class="altRow">How we Measure</div>
<div class="resourceDetails" class="altRow"><asp:Label ID="lblHowWeMeasure" runat="server"></asp:Label>
                                                                                            <a href="#"  
                                                                                            onclick="javascript:return OpenPopup('HowWeMeasure');" 
                                                                                             target="_blank">
                                                                                                Read More</a></div>

<div class="resourceHeader" class="topRow">Nutrition Center</div>
<div class="resourceDetails" class="topRow"><asp:Label ID="lblNutritionCenter" runat="server"></asp:Label>
                                                                                            <a href="#" target="_blank"
                                                                                              onclick="javascript:return OpenPopup('NutritionCenter');" 
                                                                                            
                                                                                            >
                                                                                                Read More</a></div>

<div class="resourceHeader" class="altRow">Personal Fitness</div>
<div class="resourceDetails" class="altRow"><asp:Label ID="lbPersonalFitness" runat="server"></asp:Label>
                                                                                            <a 
                                                                                                onclick="javascript:return OpenPopup('PersonalFitness');" 
                                                                                                href="#"
                                                                                             target="_blank">
                                                                                                Read More</a></div>

<div class="resourceHeader" class="topRow">Wellness Diary</div>
<div class="resourceDetails" class="topRow"><asp:Label ID="lblWellnessDiary" runat="server"></asp:Label>
                                                                                            <a href="#"
                                                                                            
                                                                                                onclick="javascript:return OpenPopup('WellnessDairy');" 
                                                                                             target="_blank">
                                                                                                Read More</a></div>

<div class="resourceHeader" class="altRow">Wellness Diary Forum</div>
<div class="resourceDetails" class="altRow"><asp:Label ID="lblWellnessDairyForum" runat="server"></asp:Label>
                                                                                            <a href="#"
                                                                                               onclick="javascript:return OpenPopup('WellnessDairyForum');" 
                                                                                                target="_blank">Read More</a></div>
                                                                                                                                                                                                                                                                              
                                                                                   
<div id="continueBtn"><asp:LinkButton CssClass="aButtonSmall" ID="lnkBtnSubmit" runat="server" Width="50" ValidationGroup="CompanyRegistration" OnClick="lnkBtnSubmit_Click">Finish</asp:LinkButton></div>                                                                                    
</div>
</div>
</div>                                                                                                                                             
<script language="javascript" type="text/javascript">
    function OpenPopup(strPageName) {
        var FullUrl = '<%=AppConfig.GetBaseSiteUrl() %>Welcome/Content/' + strPageName + '.aspx';
        var newwindow = window.open(FullUrl, 'AskQuestion', 'height=600,width=900,status=no,toolbar=no,location=no,menubar=no,titlebar=no,scrollbars=yes');

        if (window.focus) { newwindow.focus() }

        return false;
    }

    </script>
    
</asp:Content>
