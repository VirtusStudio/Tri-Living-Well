<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_PAL_PalEntries_PopUp.ascx.cs"
    Inherits="UC_PAL_PalEntries_PopUp" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!--"javascript:addEntry(sDate);" will open the popup-->
<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
    <script type="text/javascript">
        function hide(objElementID) {
            document.getElementById(objElementID).style.display = "none";
        }
        function show(objElementID) {
            document.getElementById(objElementID).style.display = "";
        }

        function addEntry(sDate) {
            document.getElementById('<%= txtPalEntryID.ClientID %>').value = "";
            document.getElementById('<%= txtPalEntryWeight.ClientID %>').value = "";
            document.getElementById('<%= txtPalEntryComment.ClientID %>').value = "";

            document.getElementById('<%= ddlPalEntryType.ClientID %>').selectedIndex = 0;
            document.getElementById('<%= ddlPalEntryTime.ClientID %>').selectedIndex = 0;
            document.getElementById('<%= ddlPalEntryDuration.ClientID %>').selectedIndex = 0;
            document.getElementById('<%= ddlPalEntryIntensity.ClientID %>').selectedIndex = 0;

            document.getElementById('<%= lblMessage.ClientID %>').innerHTML = "";

            var rdpPalEntryDate = $find("<%= rdpPalEntryDate.ClientID %>");
            if (sDate != "") {
                rdpPalEntryDate.set_selectedDate(new Date(sDate));
            }
            else {
                rdpPalEntryDate.set_selectedDate(new Date());
            }
            document.getElementById('<%= btnClientValidate.ClientID %>').click();
            show('divWin');
            bWaiting = true;
        }

        function editEntry(sPalEntryID, sDate) {
            var rdpPalEntryDate = $find("<%= rdpPalEntryDate.ClientID %>");

            if (sDate != "") {
                rdpPalEntryDate.set_selectedDate(new Date(sDate));
            }
            document.getElementById('<%= txtPalEntryID.ClientID %>').value = sPalEntryID;
            document.getElementById('<%= btnEdit.ClientID %>').click();

            show('divWin');
            bWaiting = true;
        }
    </script>
</telerik:RadScriptBlock>
<!--Transparency-->
<script type="text/javascript">
    function hoverTransparency(sElementName) {
        var obj = document.getElementById(sElementName);

        obj.onmouseover = function () { this.className = ""; }
        obj.onmouseout = function () { this.className = "transparent"; }
        obj.onmouseenter = function () { this.onmouseover = null; this.onmouseout = null; this.className = ""; }
        obj.onmouseleave = function () { this.className = "transparent"; }

    }

    var bWaiting = false;
    var divWinTop_Original;
    function move_box() {
        if (bWaiting) {
            var offset = 000; // set offset (likely equal to your css top)
            var element = document.getElementById('divWin');

            element.style.top = (parseInt(divWinTop_Original) + parseInt(top.document.documentElement.scrollTop) + offset) + 'px';
        }
    }

    function UC_PAL_PalEntries_PopUp() {
        divWinTop_Original = parseInt(document.getElementById('divWin').style.top);
        //hoverTransparency("divWinTransparent");
        //window.setInterval(move_box, 100);
    }
</script>
<div id="divWin" class="fixed" style="left: 250px; top: 30px; width: 500px; z-index: 100;
    display: none;">
    <div id="divWinTransparent" style="background-color: White;">
        <center class="Round1">
            <center>
                <center>
                    <center>
                        <center>
                            <center>
                                <center>
                                    <center>
                                        <center>
                                            <center>
                                                <img id="imgPAL" alt="" runat="server" />Personal Activity Log<br />
                                                <br />
                                                <table class="tblItems" style="background-color: White;">
                                                    <tr>
                                                        <td>
                                                            Date
                                                        </td>
                                                        <td>
                                                            <telerik:RadDatePicker ID="rdpPalEntryDate" runat="server" Width="90" Skin="WebBlue">
                                                                <Calendar runat="server" ShowRowHeaders="False">
                                                                </Calendar>
                                                            </telerik:RadDatePicker>
                                                            <asp:CompareValidator ID="compareV_rdpPalEntryDate" runat="server" CssClass="required"
                                                                ValidationGroup="PalEntries_PopUp" ControlToValidate="rdpPalEntryDate" SetFocusOnError="True"
                                                                Operator="LessThanEqual" Type="Date"></asp:CompareValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Activity Type
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlPalEntryType" onchange="DisplayNutrition(this);" runat="server">
                                                            </asp:DropDownList>
                                                            <a href="#" onclick="javascript:return OpenCMSPopupWindow();" id="ancViewNutrition" style="display: none;">View Nutrition 101</a>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="required"
                                                                ValidationGroup="PalEntries_PopUp" ErrorMessage="*Required" ControlToValidate="ddlPalEntryType"
                                                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Activity
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlPalCycling" runat="server" Width="150">
                                                            </asp:DropDownList>
                                                            <asp:DropDownList ID="ddlPalRunning" style="display:none;" runat="server" Width="150">
                                                            </asp:DropDownList>
                                                            <asp:DropDownList ID="ddlPalSwimming" style="display:none;" runat="server" Width="150">
                                                            </asp:DropDownList>
                                                            <asp:DropDownList ID="ddlPalConditioningExercises" style="display:none;" runat="server" Width="150">
                                                            </asp:DropDownList>
                                                            <asp:DropDownList ID="ddlPalSports" style="display:none;" runat="server" Width="150">
                                                            </asp:DropDownList>
                                                            <asp:DropDownList ID="ddlPalWalking" style="display:none;" runat="server" Width="150">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Time
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlPalEntryTime" runat="server">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="required"
                                                                ValidationGroup="PalEntries_PopUp" ErrorMessage="*Required" ControlToValidate="ddlPalEntryTime"
                                                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Duration
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlPalEntryDuration" runat="server">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="required"
                                                                ValidationGroup="PalEntries_PopUp" ErrorMessage="*Required" ControlToValidate="ddlPalEntryDuration"
                                                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Intensity
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlPalEntryIntensity" runat="server">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="required"
                                                                ValidationGroup="PalEntries_PopUp" ErrorMessage="*Required" ControlToValidate="ddlPalEntryIntensity"
                                                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Weight
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtPalEntryWeight" runat="server" Width="50"></asp:TextBox>&nbsp;<span
                                                                class="small">lbs.</span>
                                                            <asp:CompareValidator ID="CompareValidator2" runat="server" CssClass="required" ValidationGroup="PalEntries_PopUp"
                                                                ErrorMessage="*Must be > 0" ControlToValidate="txtPalEntryWeight" SetFocusOnError="True"
                                                                Operator="GreaterThan" ValueToCompare="0" Type="Integer"></asp:CompareValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="vertical-align: top;">
                                                            Comment
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtPalEntryComment" runat="server" Width="200"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <asp:Label ID="lblMessage" runat="server" EnableViewState="False"></asp:Label><br />
                                                            <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
                                                                <a class="aButton" href="javascript:document.getElementById('<%= btnSubmit.ClientID %>').click();">
                                                                    &nbsp;OK&nbsp;</a> <a class="aButton" href="javascript:hide('divWin');">Cancel</a>
                                                            </telerik:RadCodeBlock>
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
    </div>
</div>
<div style="visibility: hidden;">
    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit"
        ValidationGroup="PalEntries_PopUp"></asp:Button><br />
    PAL_ENTRY_ID<asp:TextBox ID="txtPalEntryID" runat="server"></asp:TextBox>
    <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click"></asp:Button><br />
    <asp:TextBox ID="txtPostback" runat="server"></asp:TextBox><br />
    <asp:Button ID="btnPostback" runat="server" Text="Postback" OnClick="btnPostback_Click">
    </asp:Button>
    <asp:Button ID="btnClientValidate" runat="server" Text="ClientValidate" OnClientClick="Page_ClientValidate('UC_PAL_PalEntries_PopUp');return false;">
    </asp:Button>
</div>
<asp:HiddenField ID="hfCategoryName" Value="Walking" runat="server" />
<!--Init()-->
<script type="text/javascript">
    UC_PAL_PalEntries_PopUp();
</script>
<telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
    <!--RadAjaxManager-->
    <script type="text/javascript">
        function checkPostback() {
            document.getElementById('<%= btnClientValidate.ClientID %>').click();
            if (document.getElementById('<%= txtPostback.ClientID %>').value != "") {
                document.getElementById('<%= txtPostback.ClientID %>').value = "";
                document.getElementById('<%= btnPostback.ClientID %>').click();
            }
        }

        function DisplayNutrition(ddlControl) {
            var ddlText = ddlControl.options[ddlControl.selectedIndex].text;

            var ddlVal = ddlControl.options[ddlControl.selectedIndex].value;
            if (ddlVal != ' ') {
                document.getElementById('<%=hfCategoryName.ClientID %>').value = ddlText.toString().replace(' ', '');
                document.getElementById("ancViewNutrition").style.display = '';
            }
            else {
                document.getElementById('<%=hfCategoryName.ClientID %>').value = "0";
                document.getElementById("ancViewNutrition").style.display = "none";
            }

            // handle activity type change by showing the selected type
            // hide them all first
            document.getElementById('<%=ddlPalCycling.ClientID %>').style.display = 'none';
            document.getElementById('<%=ddlPalRunning.ClientID %>').style.display = 'none';
            document.getElementById('<%=ddlPalSwimming.ClientID %>').style.display = 'none';
            document.getElementById('<%=ddlPalConditioningExercises.ClientID %>').style.display = 'none';
            document.getElementById('<%=ddlPalSports.ClientID %>').style.display = 'none';
            document.getElementById('<%=ddlPalWalking.ClientID %>').style.display = 'none';
            // then display the activity that the user has selected
            var sType = document.getElementById('<%=ddlPalEntryType.ClientID %>').value.toString();
            switch (sType) {
                case '1':
                    {
                        document.getElementById('<%=ddlPalWalking.ClientID %>').style.display = 'inline';
                        break;
                    }
                case '2':
                    {
                        document.getElementById('<%=ddlPalRunning.ClientID %>').style.display = 'inline';
                        break;
                    }
                case '3':
                    {
                        document.getElementById('<%=ddlPalSwimming.ClientID %>').style.display = 'inline';
                        break;
                    }
                case '4':
                    {
                        document.getElementById('<%=ddlPalCycling.ClientID %>').style.display = 'inline';
                        break;
                    }
                case '5':
                    {
                        document.getElementById('<%=ddlPalConditioningExercises.ClientID %>').style.display = 'inline';
                        break;
                    }
                case '6':
                    {
                        document.getElementById('<%=ddlPalSports.ClientID %>').style.display = 'inline';
                        break;
                    }
            }

        }
        function OpenCMSPopupWindow() {
            var varCMSTypeName = '';
            varCMSTypeName = document.getElementById('<%=hfCategoryName.ClientID %>').value;
            varCMSTypeName = varCMSTypeName.replace(' ', '');
            varCMSTypeName = varCMSTypeName + '101';
            var varPageName = '<%=AppConfig.GetBaseSiteUrl() %>' + "Popups/CMSPopup.aspx?cmstype=" + varCMSTypeName;
          
            var newwindow = window.open(varPageName, varCMSTypeName, 'height=600,width=700,status=no,toolbar=no,location=no,menubar=no,titlebar=no,scrollbars=yes');
            if (window.focus) { newwindow.focus() }
        
            return false;
        }

    </script>
</telerik:RadScriptBlock>
<telerik:RadAjaxLoadingPanel ID="AjaxLoadingPanel1" runat="server" Height="75px"
    Width="75px">
    <asp:Image ID="Image1" runat="server" AlternateText="Loading..." ImageUrl="~/RadControls/Ajax/Skins/Default/loading2.gif" />
</telerik:RadAjaxLoadingPanel>
<%-- <telerik:RadAjaxManagerProxy ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="btnSubmit">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="txtPostback" />
                    <telerik:AjaxUpdatedControl ControlID="lblMessage" />
                </UpdatedControls>
            </telerik:AjaxSetting>
             <telerik:AjaxSetting AjaxControlID="btnEdit">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="ddlPalEntryType" LoadingPanelID="AjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="ddlPalEntryTime" LoadingPanelID="AjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="ddlPalEntryDuration" LoadingPanelID="AjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="ddlPalEntryIntensity" LoadingPanelID="AjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="txtPalEntryWeight" LoadingPanelID="AjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="txtPalEntryComment" LoadingPanelID="AjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="lblMessage" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManagerProxy>
--%>