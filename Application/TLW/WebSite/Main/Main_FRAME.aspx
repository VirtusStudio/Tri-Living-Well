<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/User.master"
    CodeFile="Main_FRAME.aspx.cs" Inherits="Main_Main_FRAME" Title="Dashboard" %>
    <%@ Register Src="~/controls/UC_DD_Nutrition_Caluclator_PopUp.ascx" TagName="UC_DD_Nutrition_Caluclator_PopUp" TagPrefix="uc5" %>
<%@ Register Src="~/Controls/UC_Visitlog_Visitlog.ascx" TagName="UC_Visitlog_Visitlog"
    TagPrefix="uc5" %>
<%@ Register Src="~/Controls/UC_Login_Register.ascx" TagName="UC_Login_Register"
    TagPrefix="uc2" %>
<%@ Register Src="~/Controls/UC_Home_1_Control.ascx" TagName="UC_Home_1_Control"
    TagPrefix="uc3" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register Assembly="MetaBuilders.WebControls.RollOverLink" Namespace="MetaBuilders.WebControls"
    TagPrefix="mbrol" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
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
    <table>
        <tr>
            <td>
                <table width="100%">
                    <tr>
                        <td>
                            <table width="20%" border="1">
                                <tr>
                                    <td align="center" valign="top">
                                        Water
                                    </td>
                                    <td align="center" valign="top">
                                        <asp:Label ID="lblWaterAmount" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" valign="top">
                                        <a href='#' onclick="javascript:ShowPopup('Welcome/Content/MilkDairy.aspx')" class="lnkBtn">
                                            Milk/ Dairy</a>
                                    </td>
                                    <td align="center" valign="top">
                                        <asp:Label ID="lblDairyAmount" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" valign="top">
                                        <a href='#' onclick="javascript:ShowPopup('Welcome/Content/Fruit.aspx')" class="lnkBtn">
                                            Fruit</a>
                                    </td>
                                    <td align="center" valign="top">
                                        <asp:Label ID="lblFruitAmount" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" valign="top">
                                        <a href='#' onclick="javascript:ShowPopup('Welcome/Content/Vegetables.aspx')" class="lnkBtn">
                                            Vegetables</a>
                                    </td>
                                    <td align="center" valign="top">
                                        <asp:Label ID="lblVegetableAmount" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" valign="top">
                                        <a href='#' onclick="javascript:ShowPopup('Welcome/Content/Starch.aspx')" class="lnkBtn">
                                            Starch</a>
                                    </td>
                                    <td align="center" valign="top">
                                        <asp:Label ID="lblStarchAmount" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" valign="top">
                                        <a href='#' onclick="javascript:ShowPopup('Welcome/Content/Protein.aspx')" class="lnkBtn">
                                            Protein</a>
                                    </td>
                                    <td align="center" valign="top">
                                        <asp:Label ID="lblProteinAmount" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" valign="top">
                                        <a href='#' onclick="javascript:ShowPopup('Welcome/Content/Fats.aspx')" class="lnkBtn">
                                            Fats</a>
                                    </td>
                                    <td align="center" valign="top">
                                        <asp:Label ID="lblFATAmount" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" valign="top">
                                        Calories
                                    </td>
                                    <td align="center" valign="top">
                                        <asp:Label ID="lblCaloriesAmount" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" valign="top">
                                        <a href='<%=AppConfig.GetBaseSiteUrl() %>Users/FoodJournal.aspx' class="lnkBtn">Food
                                            Journal</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" valign="top">
                                        <a href='<%=AppConfig.GetBaseSiteUrl() %>Main/MyNutrition.aspx' class="lnkBtn">My Nutrition</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" valign="top">
                                        <a href="javascript:editCalorie();" class="lnkBtn">Re-Calculate</a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top" align="center">
                            <table width="200" border="1">
                                <tr><td colspan="2"><h2>Physical Fitness</h2></td></tr>
                                <tr><td>Current METS</td><td>500</td></tr>
                                <tr><td>Last Workout Date</td><td>Monday April 14, 2012</td></tr>
                                <tr><td>Last Workout METS</td><td>503</td></tr>
                                <tr><td>Workout History (7 Days)</td><td>4/1/2012, 4/2/2012, 4/4/2012</td></tr
                                <tr><td colspan="2">View Past 2 Weeks Workouts</td></tr>
                                <tr><td>Current Stage</td><td>6</td></tr>
                                <tr><td colspan="2"><asp:LinkButton CssClass="aButtonSmall" CausesValidation="false" ToolTip="Click here to record activity."
                    ID="lnkBtnRecordActivity" runat="server">Record Activity</asp:LinkButton></td></tr>
                                <tr>
                                    <td colspan="2">
                <asp:Panel ID="Panel1" runat="server" Style="display: none; background-color: Black;
                    width: 500px;" CssClass="modalPopup">
                    <table width="100%" cellpadding="3" cellspacing="3" border="0">
                        <tr>
                            <td style="display: none;" align="center">
                                <asp:Button Style='display: none;' ID="OkButton" runat="server" Text="OK" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
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
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <table class="Round3_tblHeader">
                                                                                        <tr>
                                                                                            <td style="vertical-align: middle;">
                                                                                                Date:
                                                                                            </td>
                                                                                            <td align="right">
                                                                                                <asp:TextBox ID="textDate" runat="server" />
                                                                                                <asp:ImageButton ID="buttonDate" runat="server" ImageUrl="../images/icons/iconcalendar.jpg" Width="32" height="32" />
                                                                                                <ajaxToolkit:CalendarExtender ID="calendarButtonExtender" runat="server" TargetControlID="textDate" PopupButtonID="buttonDate" />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="vertical-align: middle;">
                                                                                                Weight (lbs):
                                                                                            </td>
                                                                                            <td align="right">
                                                                                                <asp:TextBox ID="textWeight" runat="server" />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="vertical-align: middle;">
                                                                                                Activity:
                                                                                            </td>
                                                                                            <td align="right">
                                                                                                <asp:DropDownList ID="ddlActivity" />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="vertical-align: middle;">
                                                                                                Duration (minutes):
                                                                                            </td>
                                                                                            <td align="right">
                                                                                                <asp:TextBox ID="textWeight" runat="server" />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="vertical-align: middle;">
                                                                                                MET Minutes:
                                                                                            </td>
                                                                                            <td align="right">
                                                                                                <asp:TextBox ID="textMet" runat="server" />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="vertical-align: middle;">
                                                                                                Energy Expended:
                                                                                            </td>
                                                                                            <td align="right">
                                                                                                <asp:TextBox ID="textEnergy" runat="server" />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="vertical-align: middle;">
                                                                                                Intensity:
                                                                                            </td>
                                                                                            <td align="right">
                                                                                                <asp:DropDownList ID="ddlIntensity" />
                                                                                                <asp:DropDownList ID="DropDownList1" runat="server">
                                                                                                    <asp:ListItem Value="Male" Text="Male"></asp:ListItem>
                                                                                                    <asp:ListItem Value="Female" Text="Female"></asp:ListItem>
                                                                                                </asp:DropDownList>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="vertical-align: middle;">
                                                                                                User Comments:
                                                                                            </td>
                                                                                            <td align="right">
                                                                                                <asp:TextBox id="textareaComments" TextMode="multiline" runat="server" />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr><td colspan="2">Weekly Cumulative</td></tr>
                                                                                        <tr>
                                                                                            <td style="vertical-align: middle;">
                                                                                                Duration:
                                                                                            </td>
                                                                                            <td align="right">
                                                                                                <asp:TextBox id="textWeeklyDuration" runat="server" />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="vertical-align: middle;">
                                                                                                MET Minutes:
                                                                                            </td>
                                                                                            <td align="right">
                                                                                                <asp:TextBox id="textWeeklyMetMinutes" runat="server" />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="vertical-align: middle;">
                                                                                                Calories:
                                                                                            </td>
                                                                                            <td align="right">
                                                                                                <asp:TextBox id="textWeeklyCalories" runat="server" />
                                                                                            </td>
                                                                                        </tr>

                                                                                        <tr><td colspan="2">Total Cumulative</td></tr>
                                                                                        <tr>
                                                                                            <td style="vertical-align: middle;">
                                                                                                Duration:
                                                                                            </td>
                                                                                            <td align="right">
                                                                                                <asp:TextBox id="TextBox1" runat="server" />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="vertical-align: middle;">
                                                                                                MET Minutes:
                                                                                            </td>
                                                                                            <td align="right">
                                                                                                <asp:TextBox id="TextBox2" runat="server" />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="vertical-align: middle;">
                                                                                                Calories:
                                                                                            </td>
                                                                                            <td align="right">
                                                                                                <asp:TextBox id="TextBox3" runat="server" />
                                                                                            </td>
                                                                                        </tr>

                                                                                        <tr>
                                                                                            <td style="display: none;" align="center">
                                                                                                <asp:Button Style='display: none;' ID="buttonOK" runat="server" Text="OK" />
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
                </asp:Panel>
                <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender" runat="server" TargetControlID="lnkBtnRecordActivity"
                    PopupControlID="Panel1" BackgroundCssClass="modalBackground" OkControlID="buttonOK"
                    OnOkScript="onOk()" CancelControlID="imgClose" DropShadow="false" />
                                
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top">
                            Brain Power
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <table><tr style="height:15px;"><td align="center">&nbsp;</td></tr>
                                <tr><td align="center"><b>Information Portal</b></td></tr><tr style="height:15px;"><td align="center">&nbsp;</td></tr>
                                <tr>
                                    <td align="center">
                                       <a href='<%=AppConfig.GetBaseSiteUrl() %>Users/ViewNewsletters.aspx'>
                                        <img alt="newsletter" src='<%=AppConfig.GetBaseSiteUrl() %>images/Dashboard_newsLetter.bmp'
                                       
                                         border="0" />
                                       </a> 
                                    </td>
                                </tr>
                                <tr style="height:50px; vertical-align:middle;">
                                    <td align="center">
                                        Current Icon
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                          <a href='<%=AppConfig.GetBaseSiteUrl() %>Users/ViewLibraries.aspx'>
                                            <img alt="library" src='<%=AppConfig.GetBaseSiteUrl() %>images/Dashboard_library.bmp'
                                       
                                         border="0" />
                                          </a> 
                                 
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                      <a href='<%=AppConfig.GetBaseSiteUrl() %>Forum/default.aspx'>
                                           <img alt="forum" src='<%=AppConfig.GetBaseSiteUrl() %>images/Dashboard_forum.bmp'
                                       
                                         border="0" /><a></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        Visit us on
                                        <br />
                                        <asp:DataList ID="dlLinks" runat="server" RepeatColumns="3" RepeatDirection="Horizontal">
                                            <ItemTemplate>
                                                <table cellpadding="2" cellspacing="2" border="0">
                                                    <tr>
                                                        <td>
                                                            <a href='<%#Eval("StrValue") %>' target="_blank">
                                                                <img runat="server" id="imgLinks" src='<%#GetImagePath(Eval("StrValueCode").ToString()) %>'
                                                                    alt="" height="30" width="30" border="0" /></a>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td colspan="2" align="left">
                            <table>
                                <tr>
                                    <td>
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
                                                                                            What's Hot
                                                                                        </td>
                                                                                        <td style="text-align: right;">
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                                <div class="gridItem">
                                                                                    <asp:DataList ID="dlHotLinks" runat="server" RepeatColumns="1" RepeatDirection="Horizontal">
                                                                                        <ItemTemplate>
                                                                                            <table cellpadding="2" cellspacing="2" border="0">
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        <a href='<%#AppConfig.GetBaseSiteUrl() + "Users/hotsectiondetails.aspx#"+Eval("IntHotSectionId") %>'>
                                                                                                            <%#AppLib.GetSubString(Eval("StrHeading").ToString(), 100)%>
                                                                                                        </a>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </ItemTemplate>
                                                                                    </asp:DataList>
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
                                    </td>


                                </tr>

                                <tr><td>
                                    <table>

                                        <tr><td colspan="4">
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
                                                                                            Quick Links
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

                                        </td></tr>
                                        <tr><td valign="top" align="center">
                                              <a href="javascript:popupOpen('MyProgram/MyProgram.aspx',700,600);">
                                              <img src='<%=AppConfig.GetBaseSiteUrl() %>images/myProgram.bmp' alt="" border="0" /></a>
                                      
                                        </td>
                                        <td valign="top" align="center"><a href="javascript:popupOpen('MyNutrition/MyNutrition.aspx',700,600);"><img src='<%=AppConfig.GetBaseSiteUrl() %>images/myNutrition.bmp' alt="" border="0" /></a>
                                        </td><td valign="top" align="center">
                                            Activity Icon
                                        </td>
                                        <td valign="top" align="center">
                                        <a href="javascript:popupOpen('DDs/MealExchange/HTML_MealExchange.aspx',700,600);"><img src='<%=AppConfig.GetBaseSiteUrl() %>images/meal_exchange.bmp' alt="" border="0" /></a>
                                        </td>
                                        </tr>
                                    </table>
                                </td></tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr><td>      <uc5:UC_DD_Nutrition_Caluclator_PopUp id="UC_DD_Nutrition_Caluclator_PopUp1" runat="server"></uc5:UC_DD_Nutrition_Caluclator_PopUp>
         </td></tr>
        <tr style="display:none;">
            <td class="top">
                <div class="title">
                    What's New?</div>
                <div class="description">
                     
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
                                                                        Announcements
                                                                    </td>
                                                                    <td style="text-align: right;">
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        <%--      <div class="gridItem">
                                                                <asp:GridView ID="GVAnnouncements" AutoGenerateColumns="False" runat="server" EmptyDataText="<br /><br />No Record Found.<br /><br />"
                                                                    EmptyDataRowStyle-CssClass="required" EmptyDataRowStyle-HorizontalAlign="Center"
                                                                    Width="100%" AllowPaging="false" AllowSorting="false" ShowHeader="false" CellSpacing="1"
                                                                    CellPadding="0" BorderWidth="1" GridLines="None" OnRowCommand="GVAnnouncements_RowCommand"
                                                                    OnRowDataBound="GVAnnouncements_RowDataBound">
                                                                    <RowStyle BackColor="White" />
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Title"
                                                                            ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblNewsLetterId" runat="server" Visible="false" Text='<%#Eval("IntNewsLetterId") %>'></asp:Label>
                                                                                <span title='<%#Eval("StrTitle").ToString() %>'>
                                                                                    <%#AppLib.GetSubString(Eval("StrTitle").ToString(), 30)%></span>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Title"
                                                                            ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkFavoriteNewsLetter" CssClass="lnkBtn" runat="server" Text='<%#Eval("AddRemoveFromFavorite") %>'
                                                                                    CommandArgument='<%#Eval("IntNewsLetterId") %>' CommandName="AddToFavorite"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>--%>
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
                                                                        Events
                                                                    </td>
                                                                    <td style="text-align: right;">
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <div class="gridItem">
                                                             <%--   <asp:GridView ID="GVEvents" AutoGenerateColumns="False" runat="server" EmptyDataText="<br /><br />No Record Found.<br /><br />"
                                                                    EmptyDataRowStyle-CssClass="required" EmptyDataRowStyle-HorizontalAlign="Center"
                                                                    Width="100%" AllowPaging="false" AllowSorting="false" ShowHeader="false" CellSpacing="1"
                                                                    CellPadding="0" BorderWidth="1" GridLines="None" OnRowCommand="GVEvents_RowCommand"
                                                                    OnRowDataBound="GVEvents_RowDataBound">
                                                                    <RowStyle BackColor="White" />
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Title"
                                                                            ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblNewsLetterId" runat="server" Visible="false" Text='<%#Eval("IntNewsLetterId") %>'></asp:Label>
                                                                                <span title='<%#Eval("StrTitle").ToString() %>'>
                                                                                    <%#AppLib.GetSubString(Eval("StrTitle").ToString(), 30)%></span>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Title"
                                                                            ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="lnkFavoriteNewsLetter" CssClass="lnkBtn" runat="server" Text='<%#Eval("AddRemoveFromFavorite") %>'
                                                                                    CommandArgument='<%#Eval("IntNewsLetterId") %>' CommandName="AddToFavorite"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>--%>
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
            <td style="width: 3px;">
            </td>
            <td style="display: none;" class="top">
               <%-- <asp:LoginView ID="LoginView1" runat="server">
                    <LoggedInTemplate>
                        <uc3:UC_Home_1_Control ID="UC_Home_1_Control1" runat="server" />
                    </LoggedInTemplate>
                    <AnonymousTemplate>
                        <uc2:UC_Login_Register ID="UC_Login_Register1" runat="server" />
                    </AnonymousTemplate>
                </asp:LoginView>--%>
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        function ShowPopup(varPagePath) {
            var varPath = '<%=AppConfig.GetBaseSiteUrl() %>' + varPagePath;
            OpenPopup(varPath, "Popup", 600, 500);
        }
       
    </script>
</asp:Content>
