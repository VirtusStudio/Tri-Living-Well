<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/User.master"
    CodeFile="NutritionCenter.aspx.cs" Inherits="NutritionCenter" Title="Nutrition Center" %>

<%@ Register Src="~/Controls/UC_Login_Register.ascx" TagName="UC_Login_Register" TagPrefix="uc1" %>
<%@ Register Src="~/Controls/UC_TextArea.ascx" TagName="UC_TextArea" TagPrefix="uc2" %>
<%@ Register Src="~/controls/UC_Nutrition_CalorieCalculator_PopUp.ascx" TagName="UC_Nutrition_CalorieCalculator_PopUp" TagPrefix="uc3" %>
<%@ Register Src="~/controls/UC_Nutrition_FoodJournal_Popup.ascx" TagName="UC_Nutrition_FoodJournal_Popup" TagPrefix="uc4" %>
<%@ Register Src="~/controls/UC_Nutrition_Scorecard_PopUp.ascx" TagName="UC_Nutrition_Scorecard_PopUp" TagPrefix="uc5" %>
<%@ Register Src="~/controls/UC_Nutrition_HealthScale_PopUp.ascx" TagName="UC_Nutrition_HealthScale_PopUp" TagPrefix="uc6" %>
<%@ Register Src="~/controls/UC_Nutrition_BodyFatCalculator_PopUp.ascx" TagName="UC_Nutrition_BodyFatCalculator_PopUp" TagPrefix="uc7" %>
<%@ Register Src="~/controls/UC_Nutrition_IndividualReport_PopUp.ascx" TagName="UC_Nutrition_IndividualReport_PopUp" TagPrefix="uc8" %>
<%@ Register Src="~/controls/UC_Nutrition_HealthyWeightCalculator_PopUp.ascx" TagName="UC_Nutrition_HealthyWeightCalculator_PopUp" TagPrefix="uc9" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="MetaBuilders.WebControls.RollOverLink" Namespace="MetaBuilders.WebControls"
    TagPrefix="mbrol" %>
    
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
        <uc3:UC_Nutrition_CalorieCalculator_PopUp id="UC_Nutrition_CalorieCalculator_PopUp1" runat="server"></uc3:UC_Nutrition_CalorieCalculator_PopUp>
        <uc4:UC_Nutrition_FoodJournal_Popup id="UC_Nutrition_FoodJournal_Popup2" runat="server"></uc4:UC_Nutrition_FoodJournal_Popup>
        <uc5:UC_Nutrition_Scorecard_PopUp id="UC_Nutrition_Scorecard_PopUp1" runat="server"></uc5:UC_Nutrition_Scorecard_PopUp>
        <uc6:UC_Nutrition_HealthScale_PopUp id="UC_Nutrition_HealthScale_PopUp1" runat="server"></uc6:UC_Nutrition_HealthScale_PopUp>        
        <uc7:UC_Nutrition_BodyFatCalculator_PopUp id="UC_Nutrition_BodyFatCalculator_PopUp1" runat="server"></uc7:UC_Nutrition_BodyFatCalculator_PopUp>
        <uc8:UC_Nutrition_IndividualReport_PopUp id="UC_Nutrition_IndividualReport_PopUp2" runat="server"></uc8:UC_Nutrition_IndividualReport_PopUp>
        <uc9:UC_Nutrition_HealthyWeightCalculator_PopUp id="UC_Nutrition_HealthyWeightCalculator_PopUp1" runat="server"></uc9:UC_Nutrition_HealthyWeightCalculator_PopUp>
        <div style="background: none repeat scroll 0% 0% rgb(255, 255, 255);margin: 0px auto; padding: 10px; width:886px; overflow:hidden;" >
        <div class="overview">
            <table>
                <tr>
                    <td>
                        <uc2:uc_textarea id="UC_TextArea1" runat="server" textarea_name="NutritionCenter" /></uc2:UC_TextArea>
                    </td>
                </tr>
            </table>
        </div>

        <div style="background: none repeat scroll 0% 0% rgb(255, 255, 255);   margin: 0px auto; padding: 10px; width:586px; overflow:hidden;" >
            
            <!-- Nutrition Center Pyramid -->
            <div id="nutritioncenter-pyramid" style="position:relative;width:586px;height:345px;margin-top:25px;
                background-image:url(<%=AppConfig.GetBaseSiteUrl() %>images/nutrition/nutrition_pyramid.jpg);background-repeat:no-repeat;">
                
                <div id="milk-dairy" name="milk-dairy" style="position:absolute;top:15px;left:192px;width:200px;height:20px;text-align: center;" >
                    <span id="milk-dairy-number" name="milk-dairy-number" ><a style="color:black;font-size:small;font-weight:bolder;" 
                        href="#" onclick="window.location = 'FoodExchange.aspx#1';" >Milk / Dairy</a></span>
                </div>
                
                <div id="fruit" name="fruit" style="position:absolute;top:55px;left:192px;width:200px;height:20px;text-align: center;" >
                    <span id="fruit-number" name="fruit-number" ><a style="color:black;font-size:small;font-weight:bolder;" 
                        href="#" onclick="window.location = 'FoodExchange.aspx#2';" >Fruit</a></span>
                </div>
                
                <div id="vegetables" name="vegetables" style="position:absolute;top:95px;left:192px;width:200px;height:20px;text-align: center;" >
                    <span id="vegetables-number" name="vegetables-number" ><a style="color:black;font-size:small;font-weight:bolder;" 
                        href="#" onclick="window.location = 'FoodExchange.aspx#3';" >Vegetables</a></span>
                </div>
                
                <div id="starch" name="starch" style="position:absolute;top:138px;left:192px;width:200px;height:20px;text-align: center;" >
                    <span id="starch-number" name="starch-number" ><a style="color:black;font-size:small;font-weight:bolder;" 
                        href="#" onclick="window.location = 'FoodExchange.aspx#4';" >Starch</a></span>
                </div>
                
                <div id="protein" name="protein" style="position:absolute;top:180px;left:192px;width:200px;height:20px;text-align: center;" >
                    <span id="protein-number" name="protein-number" ><a style="color:black;font-size:small;font-weight:bolder;" 
                        href="#" onclick="window.location = 'FoodExchange.aspx#5';" >Protein</a></span>
                </div>
                
                <div id="fat" name="fat" style="position:absolute;top:222px;left:192px;width:200px;height:20px;text-align: center;" >
                    <span id="fat-number" name="fat-number" ><a style="color:black;font-size:small;font-weight:bolder;" 
                        href="#" onclick="window.location = 'FoodExchange.aspx#6';" >Fat</a></span>
                </div>
                
                <div id="water" name="water" style="position:absolute;top:264px;left:192px;width:200px;height:20px;text-align: center;" >
                    <span id="water-number" name="water-number" ><a style="color:black;font-size:small;font-weight:bolder;" 
                        href="#" onclick="window.location = 'FoodExchange.aspx#7';" >Water</a></span>
                </div>
                
                <div id="calories" name="calories" style="position:absolute;top:307px;left:192px;width:200px;height:20px;text-align: center;" >
                    <span id="calories-number" name="calories-number" >
                        <a style="color:black;font-size:small;font-weight:bolder;"  onclick="popupCalorieCalculator();" >Calories</a>
                    </span>
                </div>

            </div><!-- End Nutrition Center Pyramid -->

            <!-- Nutrition Center Action Buttons -->
            <div style="background: none repeat scroll 0% 0% rgb(255, 255, 255);   margin: 0px auto; padding: 10px; width:113px; overflow:hidden;" >
            
                <div id="nutritioncenter-buttons" style="position:relative;width:113px;height:71px;
                    background-image:url(<%=AppConfig.GetBaseSiteUrl() %>images/nutrition/NutritionCenterButtons.jpg);background-repeat:no-repeat;">
                    
                    <div id="nutritioncenter-button-foodjournal" name="nutritioncenter-button-foodjournal" 
                        style="position:absolute;top:2px;left:2px;width:105px;height:16px;text-align:center;" 
                        onclick="popupFoodJournal();" ></div>

                    <div id="nutritioncenter-button-scorecard" name="nutritioncenter-button-scorecard" 
                        style="position:absolute;top:25px;left:2px;width:105px;height:16px;text-align:center;" 
                        onclick="popupScorecard();" ></div>

                    <div id="nutritioncenter-button-healthscale" name="nutritioncenter-button-healthscale" 
                        style="position:absolute;top:50px;left:2px;width:105px;height:16px;text-align:center;" 
                        onclick="popupHealthScale();" ></div>

                </div>
            
            </div><!-- End Nutrition Center Action Buttons -->

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
