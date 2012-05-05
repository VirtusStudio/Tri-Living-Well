<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_ActivityCalendar_PopUp.ascx.cs"
    Inherits="UC_EnterActivity_PopUp" %>
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

        function showCalendar() {
            show('divWinCalendar');
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

    function UC_EnterActivity_PopUp() {
        divWinTop_Original = parseInt(document.getElementById('divWin').style.top);
        //hoverTransparency("divWinTransparent");
        //window.setInterval(move_box, 100);
    }
</script>
<div id="divWinCalendar" class="fixed" style="left: 250px; top: 150px; width: 900px; z-index: 1000;
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
                                                

                                            
        <br />
        <telerik:RadCalendar ID="RadCalendar1" runat="server" EnableMultiSelect="False" 
            ShowRowHeaders="False" UseRowHeadersAsSelectors="False" Skin="WebBlue" Width="100%" OnDayRender="RadCalendar1_DayRender" AutoPostBack="True" OnSelectionChanged="RadCalendar1_SelectionChanged">
            <WeekendDayStyle BackColor="WhiteSmoke" BorderColor="#69798C" />
            <DayOverStyle BackColor="#CCCCFF" BorderColor="#69798C" />
            <SelectedDayStyle BackColor="#FFCCCC" BorderColor="#69798C"/>
            <OtherMonthDayStyle BackColor="WhiteSmoke" BorderColor="#69798C" /> 
            <DayStyle BorderColor="#69798C" />
            <SpecialDays>
                <telerik:RadCalendarDay Date="">
                    <ItemStyle BackColor="#CCFFCC" BorderColor="#69798C" />
                </telerik:RadCalendarDay>
            </SpecialDays>         
           
        </telerik:RadCalendar>
        <br />
        <br />

        <asp:Label ID="lblMessage" runat="server" EnableViewState="False"></asp:Label><br />
        <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <a class="aButton" href="javascript:hide('divWinCalendar');">Close</a>
        </telerik:RadCodeBlock>
    


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
<%-- <telerik:RadAjaxManagerProxy ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadCalendar1">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="RadCalendar1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManagerProxy>
--%>