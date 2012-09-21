<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/User.master"
    CodeFile="ControlTester.aspx.cs" Inherits="ControlTester" Title="Control Tester" %>

<%@ Register Src="~/Controls/UC_Login_Register.ascx" TagName="UC_Login_Register" TagPrefix="uc1" %>
<%@ Register Src="~/controls/UC_Nutrition_CalorieCalculator_PopUp.ascx" TagName="UC_Nutrition_CalorieCalculator_PopUp" TagPrefix="uc2" %>
<%@ Register Src="~/controls/UC_Nutrition_FoodJournal_Popup.ascx" TagName="UC_Nutrition_FoodJournal_Popup" TagPrefix="uc3" %>
<%@ Register Src="~/controls/UC_Nutrition_BodyFatCalculator_PopUp.ascx" TagName="UC_Nutrition_BodyFatCalculator_PopUp" TagPrefix="uc4" %>
<%@ Register Src="~/controls/UC_Nutrition_Scorecard_PopUp.ascx" TagName="UC_Nutrition_Scorecard_PopUp" TagPrefix="uc5" %>
<%@ Register Src="~/controls/UC_Nutrition_IndividualReport_PopUp.ascx" TagName="UC_Nutrition_IndividualReport_PopUp" TagPrefix="uc6" %>
<%@ Register Src="~/controls/UC_Nutrition_HealthScale_PopUp.ascx" TagName="UC_Nutrition_HealthScale_PopUp" TagPrefix="uc7" %>
<%@ Register Src="~/controls/UC_Nutrition_HealthyWeightCalculator_PopUp.ascx" TagName="UC_Nutrition_HealthyWeightCalculator_PopUp" TagPrefix="uc8" %>


<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="MetaBuilders.WebControls.RollOverLink" Namespace="MetaBuilders.WebControls"
    TagPrefix="mbrol" %>
    <%@ Register Src="~/Controls/UC_TextArea.ascx" TagName="UC_TextArea" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../Scripts/Common.js" type="text/javascript"></script>
    <script type="text/javascript">
        function popupOpen(path, x, y) {
            alert("duh");
            var sURL = path;
            var features = 'toolbar=0,location=0,status=1,menubar=0,scrollbars=1,resizable=1,width=' + x + ',height=' + y + ',left=' + top.window.screenLeft + ',top=' + top.window.screenTop;
            var windownew = window.open(sURL, "new_window", features);
            try { windownew.focus(); } catch (err) { }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <iframe id="IFRAME_CONTENT" name="IFRAME_CONTENT" class="IFRAME_CONTENT" runat="server"
        frameborder="0" style="display:none;" src="Content/Home.aspx"></iframe>
        <uc2:UC_Nutrition_CalorieCalculator_PopUp id="UC_Nutrition_CalorieCalculator_PopUp1" runat="server"></uc2:UC_Nutrition_CalorieCalculator_PopUp>
        <uc3:UC_Nutrition_FoodJournal_Popup id="UC_Nutrition_FoodJournal_Popup1" runat="server"></uc3:UC_Nutrition_FoodJournal_Popup>
        <uc4:UC_Nutrition_BodyFatCalculator_PopUp id="UC_Nutrition_BodyFatCalculator_PopUp1" runat="server"></uc4:UC_Nutrition_BodyFatCalculator_PopUp>
        <uc5:UC_Nutrition_Scorecard_PopUp id="UC_Nutrition_Scorecard_PopUp1" runat="server"></uc5:UC_Nutrition_Scorecard_PopUp>
        <uc6:UC_Nutrition_IndividualReport_PopUp id="UC_Nutrition_IndividualReport_PopUp2" runat="server"></uc6:UC_Nutrition_IndividualReport_PopUp>
        <uc7:UC_Nutrition_HealthScale_PopUp id="UC_Nutrition_HealthScale_PopUp1" runat="server"></uc7:UC_Nutrition_HealthScale_PopUp>
        <uc8:UC_Nutrition_HealthyWeightCalculator_PopUp id="UC_Nutrition_HealthyWeightCalculator_PopUp1" runat="server"></uc8:UC_Nutrition_HealthyWeightCalculator_PopUp>

        <div style="background: none repeat scroll 0% 0% rgb(255, 255, 255);margin: 0px auto; padding: 10px; width:886px; overflow:hidden;" >
 
            <p><a style="color:black;font-size:small;font-weight:bolder;"  onclick="popupCalorieCalculator();" >Show Calorie Calculator</a></p>
            <p><a style="color:black;font-size:small;font-weight:bolder;"  onclick="popupFoodJournal();" >Show Food Journal</a></p>
            <p><a style="color:black;font-size:small;font-weight:bolder;"  onclick="popupBodyFat();" >Show Body Fat Calculator</a></p>
            <p><a style="color:black;font-size:small;font-weight:bolder;"  onclick="popupScorecard();" >Show Scorecard</a></p>
            <p><a style="color:black;font-size:small;font-weight:bolder;"  onclick="popupIndividualReport();" >Show Individual Report</a></p>
            <p><a style="color:black;font-size:small;font-weight:bolder;"  onclick="popupHealthScale();" >Show Health Scale</a></p>
            <p><a style="color:black;font-size:small;font-weight:bolder;"  onclick="popupHealthyWeightCalculator();" >Show Healthy Weight Calculator</a></p>

        </div>

        <script language="javascript" type="text/javascript">
            function ShowPopup(varPagePath) {
                var varPath = '<%=AppConfig.GetBaseSiteUrl() %>' + varPagePath;
                OpenPopup(varPath, "Popup", 600, 500);
            }
       
        </script>
        <div style="height:100px;"></div>
    </div>

</asp:Content>
