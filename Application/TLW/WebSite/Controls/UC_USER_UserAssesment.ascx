<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_USER_UserAssesment.ascx.cs"
    Inherits="UC_USER_UserAssesment" %>
<%@ Register Assembly="MetaBuilders.WebControls.RollOverLink" Namespace="MetaBuilders.WebControls"
    TagPrefix="mbrol" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<span style="visibility: hidden; position: absolute; left: 0px; top: 0px; z-index: -1;">
    <asp:Button ID="btnStep1" runat="server" OnClick="btnStep1_Click" />
    <asp:Button ID="btnStep2" runat="server" OnClick="btnStep2_Click" ValidationGroup="UC_USER_UserAssesment" />
    <asp:Button ID="btnSelectProgram" runat="server" OnClick="btnSelectProgram_Click" />
    <asp:TextBox ID="DIV3_FLG" runat="server" Text="0"></asp:TextBox>
    <asp:TextBox ID="txtLevelID" runat="server" Text="0"></asp:TextBox>
</span>
<div style="width: 550px;">
    <div class="title">
        My Wellness Program</div>
    <div class="description">
        <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <table>
                <tr>
                    <td>
                        <asp:Panel ID="div1" runat="server">
                            <table>
                                <tr>
                                    <td>
                                        <span class="subTitle">Step 1 of 3</span>
                                    </td>
                                    <td style="text-align: right;">
                                       <%-- <img src="../../images/icons/iconPalLevel0.gif"  /> line is commented by Netsmartz--%>
                                       <img  alt="" id="imgPALZeroStepFirst" runat="server" />
                                    </td>
                                </tr>
                            </table>
                            <div id="div1_Instructions_New" runat="server">
                                <span class="subTitle">Getting Started</span><br />
                                Nam consectetur justo. Nulla et mauris non augue suscipit blandit. Integer lacus
                                nulla, sodales vitae, venenatis sit amet, tempor rutrum, velit. Donec vel arcu.
                                Ut nec neque. Vivamus ante enim, pellentesque sit amet, feugiat eget, euismod at,
                                lacus.
                            </div>
                            <div id="div1_Instructions_Return" runat="server">
                                <span class="subTitle">You completed your program!</span><br />
                                Congratulations! You have successfully completed your program, and are able to select
                                a new one. Please take this time to take another Health Risk Assessment, as I'm
                                sure you're fields have changed.
                            </div>
                            <br />
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
                                                                    <table class="Round3_tblHeader">
                                                                        <tr>
                                                                            <td>
                                                                                Health Risk Assessment
                                                                            </td>
                                                                            <td style="text-align: right;">
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    Please chose the health risk assessment you have completed. NOTE: You will need
                                                                    your score for the next step.<br />
                                                                    <br />
                                                                    <table class="tblItems center">
                                                                        <tr>
                                                                            <td style="text-align: center;">
                                                                                <mbrol:RollOverLink ID="RollOverLink2" runat="server" ImageUrl="~/images/buttons/btnTrale_OFF.jpg"
                                                                                    RollOverImageUrl="~/images/buttons/btnTrale_ON.jpg" NavigateUrl=""></mbrol:RollOverLink>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: center;">
                                                                                <span class="subTitle">Trale <span class="small">(Corporate Users)</span></span><br />
                                                                                <br />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: center;">
                                                                                <mbrol:RollOverLink ID="RollOverLink1" runat="server" ImageUrl="~/images/buttons/btnFramingham_OFF.jpg"
                                                                                    RollOverImageUrl="~/images/buttons/btnFramingham_ON.jpg" NavigateUrl="javascript:popUpWin('PopUps/Framingham.html',750,500);"></mbrol:RollOverLink>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: center;">
                                                                                <span class="subTitle">Framingham</span>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <br />
                                                                    <div style="text-align: center;">
                                                                        <a class="aButtonSmall" href="javascript:document.getElementById('<%=btnStep1.ClientID %>').click();">
                                                                            I have my assessment score</a>
                                                                    </div>
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
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="div2" runat="server">
                            <table>
                                <tr>
                                    <td>
                                        <span class="subTitle">Step 2 of 3</span>
                                    </td>
                                    <td style="text-align: right;">
                                       <%-- <img src="../../images/icons/iconPalLevel0.gif" /> line is commented by Netsmartz--%>
                                        <img  alt="" id="imgPALZeroStepSecond" runat="server" />
                                    </td>
                                </tr>
                            </table>
                            <br />
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
                                                                    <table class="Round3_tblHeader">
                                                                        <tr>
                                                                            <td>
                                                                                Health Risk Assessment
                                                                            </td>
                                                                            <td style="text-align: right;">
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    Please enter your Health Score in the box below. It is very important that the information
                                                                    you have entered is accurate.<br />
                                                                    <br />
                                                                    <table class="tblItems center">
                                                                        <tr>
                                                                            <td style="text-align: center; padding-bottom: 10px;">
                                                                         <%--       <img src='../../images/icons/iconPalLevel0.jpg' /> line is commented by Netsmartz--%>
                                                                                  <img  alt="" id="imgHRAScore" runat="server" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: center;">
                                                                                <span class="subTitle">My Health Score is:</span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: center;">
                                                                                <asp:TextBox ID="txtAssesmentScore" runat="server" Width="50px" onkeypress="return UC_USER_UserAssesment_keyPress(event);"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="rfvAssesmentScore" runat="server" ControlToValidate="txtAssesmentScore"
                                                                                    CssClass="required" Display="Dynamic" ErrorMessage="*" SetFocusOnError="True"
                                                                                    ValidationGroup="UC_USER_UserAssesment"></asp:RequiredFieldValidator>
                                                                                <asp:RangeValidator ID="rvAssessmentScore" runat="server" ControlToValidate="txtAssesmentScore"
                                                                                    CssClass="required" Display="Dynamic" ErrorMessage="*(0 to 200)" SetFocusOnError="True"
                                                                                    ValidationGroup="UC_USER_UserAssesment" MinimumValue="0" MaximumValue="200" Type="Integer"></asp:RangeValidator>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: center;">
                                                                                <a class="aButtonSmall" href="javascript:document.getElementById('<%=btnStep2.ClientID %>').click();">
                                                                                    Continue</a>
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
                        </asp:Panel>
                    </td>
                    <td>
                        <asp:Panel ID="div2_5" runat="server">
                            <table>
                                <tr>
                                    <td>
                                        <span class="subTitle">Step 2 of 3</span>
                                    </td>
                                    <td style="text-align: right;">
                                      <%--  <img src="../../images/icons/iconPalLevel0.gif" /> line is added by Netsmartz--%>
                                             <img  alt="" id="imgPALZeroStepSecondofThree" runat="server" />
                                    </td>
                                </tr>
                            </table>
                            <br />
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
                                                                    <table class="Round3_tblHeader">
                                                                        <tr>
                                                                            <td>
                                                                                Health Risk Assessment
                                                                            </td>
                                                                            <td style="text-align: right;">
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    Based on your health score, you are in the living category. Nam consectetur justo.
                                                                    Nulla et mauris non augue suscipit blandit. Integer lacus nulla, sodales vitae,
                                                                    venenatis sit amet, tempor rutrum, velit. Donec vel arcu. Ut nec neque. Vivamus
                                                                    ante enim, pellentesque sit amet, feugiat eget, euismod at, lacus. Maecenas.<br />
                                                                    <br />
                                                                    <table class="tblItems center">
                                                                        <tr>
                                                                            <td style="text-align: center; padding-bottom: 10px;">
                                                                                <asp:Label ID="lblPalLevelID_Step2" runat="server" Text="<img src='../../images/icons/iconPalLevel0.jpg' />"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: center;">
                                                                                <span class="subTitle">My Health Score is:</span>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: center;">
                                                                                <asp:Label ID="lblAssesmentScore" runat="server" Text="0"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: center;">
                                                                                <asp:LinkButton ID="btnStep2_5" runat="server" CssClass="aButtonSmall" OnClick="btnStep2_5_Click">This accurately describes me</asp:LinkButton>
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
                        </asp:Panel>
                    </td>
                    <td>
                        <div id="div3" runat="server" style="display: none;">
                            <table>
                                <tr>
                                    <td>
                                        <span class="subTitle">Step 3 of 3</span>
                                    </td>
                                    <td style="text-align: right;">
                                        <asp:Label ID="lblPalLevelID_Step3" runat="server" Text="<img src='../../images/icons/iconPalLevel0.gif' />"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <span class="subTitle">Choose Your Program</span><br />
                            Nam consectetur justo. Nulla et mauris non augue suscipit blandit. Integer lacus
                            nulla, sodales vitae, venenatis sit amet, tempor rutrum, velit. Donec vel arcu.
                            Ut nec neque. Vivamus ante enim, pellentesque sit amet, feugiat eget, euismod at,
                            lacus. Maecenas egestas rhoncus nunc. Cras aliquam fermentum est. Duis dolor metus,
                            euismod eget, convallis at, semper at, metus.<br />
                            <br />
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
                                                                    <table class="Round3_tblHeader">
                                                                        <tr>
                                                                            <td>
                                                                                Health Risk Assessment
                                                                            </td>
                                                                            <td style="text-align: right;">
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    This is a GENERAL summary that bascially describes what the overall goals of choosing
                                                                    a program actually means. It can be a descriptive as you'd like it to be, or you
                                                                    may keep it short and sweet. Either way, Programs the user may select are below,
                                                                    and when you click on one, you see it's info below it.<br />
                                                                    <br />
                                                                    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" EnableEmbeddedSkins="False"
                                                                        OnClientTabSelected="ClientTabSelectedHandler">
                                                                        <Tabs>
                                                                            <telerik:RadTab Selected="True" Value="1" ImageUrl="~/images/icons/iconProgram1.jpg"
                                                                                HoveredImageUrl="~/images/icons/iconProgram1_ON.jpg" SelectedImageUrl="~/images/icons/iconProgram1_ON.jpg">
                                                                            </telerik:RadTab>
                                                                            <telerik:RadTab Value="2" ImageUrl="~/images/icons/iconProgram2.jpg" HoveredImageUrl="~/images/icons/iconProgram2_ON.jpg"
                                                                                SelectedImageUrl="~/images/icons/iconProgram2_ON.jpg">
                                                                            </telerik:RadTab>
                                                                            <telerik:RadTab Value="3" ImageUrl="~/images/icons/iconProgram3.jpg" HoveredImageUrl="~/images/icons/iconProgram3_ON.jpg"
                                                                                SelectedImageUrl="~/images/icons/iconProgram3_ON.jpg">
                                                                            </telerik:RadTab>
                                                                            <telerik:RadTab Value="4" ImageUrl="~/images/icons/iconProgram4.jpg" HoveredImageUrl="~/images/icons/iconProgram4_ON.jpg"
                                                                                SelectedImageUrl="~/images/icons/iconProgram4_ON.jpg">
                                                                            </telerik:RadTab>
                                                                            <telerik:RadTab Value="5" ImageUrl="~/images/icons/iconProgram5.jpg" HoveredImageUrl="~/images/icons/iconProgram5_ON.jpg"
                                                                                SelectedImageUrl="~/images/icons/iconProgram5_ON.jpg">
                                                                            </telerik:RadTab>
                                                                            <telerik:RadTab Value="6" ImageUrl="~/images/icons/iconProgram6.jpg" HoveredImageUrl="~/images/icons/iconProgram6_ON.jpg"
                                                                                SelectedImageUrl="~/images/icons/iconProgram6_ON.jpg">
                                                                            </telerik:RadTab>
                                                                            <telerik:RadTab Value="7" ImageUrl="~/images/icons/iconProgram7.jpg" HoveredImageUrl="~/images/icons/iconProgram7_ON.jpg"
                                                                                SelectedImageUrl="~/images/icons/iconProgram7_ON.jpg">
                                                                            </telerik:RadTab>
                                                                            <telerik:RadTab Value="8" ImageUrl="~/images/icons/iconProgram8.jpg" HoveredImageUrl="~/images/icons/iconProgram8_ON.jpg"
                                                                                SelectedImageUrl="~/images/icons/iconProgram8_ON.jpg">
                                                                            </telerik:RadTab>
                                                                            <telerik:RadTab Value="9" ImageUrl="~/images/icons/iconProgram9.jpg" HoveredImageUrl="~/images/icons/iconProgram9_ON.jpg"
                                                                                SelectedImageUrl="~/images/icons/iconProgram9_ON.jpg">
                                                                            </telerik:RadTab>
                                                                        </Tabs>
                                                                    </telerik:RadTabStrip>
                                                                    <br />
                                                                    <div style="border: solid 1px #000000; padding: 10px;">
                                                                        This area will change when the selected program changes. Currently waiting on layout
                                                                        files to decide how this will change and appear.
                                                                        <div style="text-align: center;">
                                                                            <div id="divProgramDescription">
                                                                                103
                                                                            </div>
                                                                            <br />
                                                                            <a href="javascript:showProgramSample();">See sample workouts</a><br />
                                                                            <br />
                                                                            <a class="aButtonSmall" href="javascript:document.getElementById('<%=btnSelectProgram.ClientID %>').click();">
                                                                                Begin Program</a>
                                                                        </div>
                                                                    </div>
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
                        </div>
                    </td>
                </tr>
            </table>
        </telerik:RadCodeBlock>
        <telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
            <!--keypress event-->
            <script>
                function UC_USER_UserAssesment_keyPress(e) {
                    var keycode;

                    if (window.event)
                        keycode = window.event.keyCode;
                    else if (e)
                        keycode = e.which;
                    else
                        return true;

                    if (keycode == 13) {
                        document.getElementById('<%=btnStep2.ClientID %>').click();
                        /*
                        var clickbutt = document.getElementById("LoginView1_UC_Login_Register1_Login1_LoginButton");
                        if (clickbutt)
                        {//because the login button is a link and not a button, just do it's js source code
                        //WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions("LoginView1$UC_Login_Register1$Login1$LoginButton", "", true, "ctl00$Login1", "", false, true));
                        //  clickbutt.click();
                  
                        }*/
                        return false;
                    }
                    else {
                        return true;
                    }
                }
            </script>
            <!--TAB system-->
            <script type="text/javascript">
                function ClientTabSelectedHandler(sender, eventArgs) {
                    //var tabStrip = sender;   
                    //var tab = eventArgs.Tab;

                    var tabStrip = $find("<%= RadTabStrip1.ClientID %>");
                    var tab = tabStrip.get_selectedTab();
                    var sProgramID = tab.get_value();

                    document.getElementById("divProgramDescription").innerHTML = sProgramID;
                }
                function showProgramSample() {
                    var tabStrip = $find("<%= RadTabStrip1.ClientID %>");
                    var tab = tabStrip.get_selectedTab();
                    var sProgramValue = tab.get_value();
                    var sLevelID = document.getElementById("<%= txtLevelID.ClientID %>").value;
                    try {
                        popUpWin("<%=AppConfig.GetBaseSiteUrl() %>Main/MyProgram/MyProgram.aspx?programID=" + sProgramValue + "0" + sLevelID, 900, 550);
                    }
                    catch (ex) {
                        alert('Make sure we have a popUpWin()');
                    }
                }


                function CheckDiv3() {
                    if (document.getElementById("<%= DIV3_FLG.ClientID %>").value == "1") {
                        document.getElementById("<%= div3.ClientID %>").style.display = '';
                    }
                    else {
                        document.getElementById("<%= div3.ClientID %>").style.display = 'none';
                    }
                }
            </script>
        </telerik:RadScriptBlock>
    </div>
</div>
<telerik:RadAjaxManager ID="telerikjaxManager1" runat="server" ClientEvents-OnResponseEnd="CheckDiv3()">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="btnStep2_5">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="div1" />
                <telerik:AjaxUpdatedControl ControlID="div2" />
                <telerik:AjaxUpdatedControl ControlID="div2_5" />
                <telerik:AjaxUpdatedControl ControlID="DIV3_FLG" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="btnStep1">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="div1" />
                <telerik:AjaxUpdatedControl ControlID="div2" />
                <telerik:AjaxUpdatedControl ControlID="div2_5" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="btnStep2">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="div1" />
                <telerik:AjaxUpdatedControl ControlID="div2" />
                <telerik:AjaxUpdatedControl ControlID="div2_5" />
                <telerik:AjaxUpdatedControl ControlID="txtLevelID" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManager>
