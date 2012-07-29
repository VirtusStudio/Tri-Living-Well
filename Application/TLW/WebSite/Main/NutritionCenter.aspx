<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/User.master"
    CodeFile="NutritionCenter.aspx.cs" Inherits="NutritionCenter" Title="Nutrition Center" %>
<%@ Register Src="~/Controls/UC_Login_Register.ascx" TagName="UC_Login_Register"
    TagPrefix="uc2" %>
<%@ Register Src="~/Controls/UC_Home_1_Control.ascx" TagName="UC_Home_1_Control"
    TagPrefix="uc3" %>
<%@ Register Src="~/Controls/UC_EnterActivity_PopUp.ascx" TagName="UC_EnterActivity_PopUp" TagPrefix="uc2" %>
<%@ Register Src="~/Controls/UC_ActivityCalendar_PopUp.ascx" TagName="UC_ActivityCalendar_PopUp" TagPrefix="uc3" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="MetaBuilders.WebControls.RollOverLink" Namespace="MetaBuilders.WebControls"
    TagPrefix="mbrol" %>
    <%@ Register Src="~/Controls/UC_TextArea.ascx" TagName="UC_TextArea" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../Scripts/Common.js" type="text/javascript"></script>
    <script type="text/javascript">
        function popupOpen(path, x, y) {
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

    <div style="background: none repeat scroll 0% 0% rgb(255, 255, 255);   margin: 0px auto; padding: 10px; width:886px; overflow:hidden;" >
        <div class="overview">
            <table>
                <tr>
                    <td>
                        <uc1:uc_textarea id="UC_TextArea1" runat="server" textarea_name="NutritionCenter" />
                    </td>
                </tr>
            </table>
        </div>

        <div style="background: none repeat scroll 0% 0% rgb(255, 255, 255);   margin: 0px auto; padding: 10px; width:586px; overflow:hidden;" >
            <div id="pyramid" style="position:relative;width:586px;height:345px;margin-top:25px;background-image:url(<%=AppConfig.GetBaseSiteUrl() %>images/nutrition/nutrition_pyramid.jpg);background-repeat:no-repeat;">
                
                <div id="milk-dairy" name="milk-dairy" style="position:absolute;top:15px;left:190px;width:200px;height:20px;text-align: center;" >
                    <span id="milk-dairy-number" name="milk-dairy-number" ><a style="color:black;font-size:small;font-weight:bolder;" href="">Milk / Dairy</a></span>
                </div>
                
                <div id="fruit" name="fruit" style="position:absolute;top:55px;left:190px;width:200px;height:20px;text-align: center;" >
                    <span id="fruit-number" name="fruit-number" ><a style="color:black;font-size:small;font-weight:bolder;" href="">Fruit</a></span>
                </div>
                
                <div id="vegetables" name="vegetables" style="position:absolute;top:95px;left:190px;width:200px;height:20px;text-align: center;" >
                    <span id="vegetables-number" name="vegetables-number" ><a style="color:black;font-size:small;font-weight:bolder;" href="">Vegetables</a></span>
                </div>
                
                <div id="starch" name="starch" style="position:absolute;top:138px;left:190px;width:200px;height:20px;text-align: center;" >
                    <span id="Span3" name="milk-dairy-number" ><a style="color:black;font-size:small;font-weight:bolder;" href="">Milk / Dairy</a></span>
                </div>
                
                <div id="protein" name="protein" style="position:absolute;top:180px;left:190px;width:200px;height:20px;text-align: center;" >
                    <span id="protein-number" name="protein-number" ><a style="color:black;font-size:small;font-weight:bolder;" href="">Protein</a></span>
                </div>
                
                <div id="fat" name="fat" style="position:absolute;top:222px;left:190px;width:200px;height:20px;text-align: center;" >
                    <span id="fat-number" name="fat-number" ><a style="color:black;font-size:small;font-weight:bolder;" href="">Fat</a></span>
                </div>
                
                <div id="water" name="water" style="position:absolute;top:264px;left:190px;width:200px;height:20px;text-align: center;" >
                    <span id="water-number" name="water-number" ><a style="color:black;font-size:small;font-weight:bolder;" href="">Water</a></span>
                </div>
                
                <div id="calories" name="calories" style="position:absolute;top:307px;left:190px;width:200px;height:20px;text-align: center;" >
                    <span id="calories-number" name="calories-number" ><a style="color:black;font-size:small;font-weight:bolder;" href="">Calories</a></span>
                </div>

            </div>
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
