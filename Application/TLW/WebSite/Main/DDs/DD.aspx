<%@ Page  MasterPageFile="~/MasterPages/TLWSite.master"  Language="C#" AutoEventWireup="true" CodeFile="DD.aspx.cs" 
Inherits="PAL_Recent" %>

<%@ Register Src="~/Controls/UC_DD_DdEntries_PopUp.ascx" TagName="UC_DD_DdEntries_PopUp" TagPrefix="uc2" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
<script type="text/javascript">
function nextWeek()
{
    var curDate = new Date(document.getElementById('<%= txtPostback.ClientID %>').value);
    var newDate = addDays(curDate,7);
    ViewWeek((newDate.getMonth()+1)+"/"+newDate.getDate()+"/"+newDate.getFullYear());
}
function previousWeek()
{
    var curDate = new Date(document.getElementById('<%= txtPostback.ClientID %>').value);
    var newDate = addDays(curDate,-7);
    ViewWeek((newDate.getMonth()+1)+"/"+newDate.getDate()+"/"+newDate.getFullYear());
}
function addDays(myDate,days) {
    return new Date(myDate.getTime() + days*24*60*60*1000);
}

function ViewWeek(sDateView)
{
    document.getElementById('<%= txtPostback.ClientID %>').value = sDateView;  
    document.getElementById('<%= btnSubmit.ClientID %>').click();
}

function RadCalendar1_SelectDate(sender, eventArgs)
{
   var date = eventArgs.get_renderDay().get_date();
   var dfi = sender.DateTimeFormatInfo;
   var formattedDate = dfi.FormatDate(date, dfi.ShortDatePattern);
   ViewWeek(String(formattedDate));
}
</script>
</telerik:RadCodeBlock>

        <table>
            <tr>
                <td>
                    <div class="title">Daily Diary</div>
                </td>
                <td>

                </td>
            </tr>
        </table>
        <div class="description">
            <table>
            <tr>
                <td>
                    <center class="Round3"><center><center><center><center><center><center><center><center><center>
                        <table class="Round3_tblHeader"><tr><td>My Daily Diary</td><td style="text-align:right;"></td></tr></table>
                        <table class="tblItems">
                        <tr>
                            <td style="width:16%;text-align:right;"><a href="javascript:previousWeek();"><img alt="" src="~/Images/icons/iconPrevious.gif" runat="server" id="imgBack" /></a></td>
                            <td style="width:12%;"><asp:Label runat="server" ID="lblSunday"></asp:Label></td>
                            <td style="width:12%;"><asp:Label runat="server" ID="lblMonday"></asp:Label></td>
                            <td style="width:12%;"><asp:Label runat="server" ID="lblTuesday"></asp:Label></td>
                            <td style="width:12%;"><asp:Label runat="server" ID="lblWednesday"></asp:Label></td>
                            <td style="width:12%;"><asp:Label runat="server" ID="lblThursday"></asp:Label></td>
                            <td style="width:12%;"><asp:Label runat="server" ID="lblFriday"></asp:Label></td>
                            <td style="width:12%;"><asp:Label runat="server" ID="lblSaturday"></asp:Label></td>
                            <td><a href="javascript:nextWeek();"><img src="~/Images/icons/iconNext.gif" runat="server" id="imgNect"  alt=""/></a></td>
                        </tr>
                        <tr class="trAlt">
                            <td><asp:Label id="lblField_01Type" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_01Sunday"  Text="lblField_01Sunday" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_01Monday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_01Tuesday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_01Wednesday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_01Thursday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_01Friday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_01Saturday"  Text="12" runat="server"></asp:Label></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><asp:Label id="lblField_02Type" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_02Sunday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_02Monday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_02Tuesday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_02Wednesday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_02Thursday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_02Friday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_02Saturday" Text="12"  runat="server"></asp:Label></td>
                            <td></td>
                        </tr>
                        <tr class="trAlt">
                            <td><asp:Label id="lblField_03Type" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_03Sunday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_03Monday"  Text="lblField_03Monday" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_03Tuesday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_03Wednesday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_03Thursday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_03Friday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_03Saturday"  Text="12" runat="server"></asp:Label></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><asp:Label id="lblField_04Type" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_04Sunday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_04Monday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_04Tuesday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_04Wednesday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_04Thursday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_04Friday" Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_04Saturday" Text="12"  runat="server"></asp:Label></td>
                            <td></td>
                        </tr>
                        <tr class="trAlt">
                            <td><asp:Label id="lblField_05Type" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_05Sunday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_05Monday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_05Tuesday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_05Wednesday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_05Thursday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_05Friday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_05Saturday" Text="12"  runat="server"></asp:Label></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><asp:Label id="lblField_06Type" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_06Sunday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_06Monday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_06Tuesday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_06Wednesday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_06Thursday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_06Friday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_06Saturday" Text="12"  runat="server"></asp:Label></td>
                            <td></td>
                        </tr>
                        <tr class="trAlt">
                            <td><asp:Label id="lblField_07Type" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_07Sunday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_07Monday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_07Tuesday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_07Wednesday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_07Thursday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_07Friday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_07Saturday" Text="12"  runat="server"></asp:Label></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="9">
                                <br />
                                <hr />
                                <br />
                            </td>
                        </tr>
                        <tr class="trAlt">
                            <td><asp:Label id="lblLVField_01Type" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_08Sunday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_08Monday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_08Tuesday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_08Wednesday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_08Thursday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_08Friday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_08Saturday" Text="12"  runat="server"></asp:Label></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><asp:Label id="lblLVField_02Type" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_09Sunday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_09Monday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_09Tuesday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_09Wednesday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_09Thursday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_09Friday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_09Saturday" Text="12"  runat="server"></asp:Label></td>
                            <td></td>
                        </tr>
                        <tr class="trAlt" style="display:none;">
                            <td><asp:Label id="lblLVField_03Type" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_10Sunday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_10Monday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_10Tuesday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_10Wednesday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_10Thursday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_10Friday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_10Saturday" Text="12"  runat="server"></asp:Label></td>
                            <td></td>
                        </tr>
                        <tr style="display:none;">
                            <td><asp:Label id="lblLVField_04Type" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_11Sunday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_11Monday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_11Tuesday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_11Wednesday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_11Thursday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_11Friday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_11Saturday" Text="12"  runat="server"></asp:Label></td>
                            <td></td>
                        </tr>
                        <tr class="trAlt" style="display:none;">
                            <td><asp:Label id="lblLVField_05Type" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_12Sunday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_12Monday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_12Tuesday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_12Wednesday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_12Thursday"  Text="12" runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_12Friday" Text="12"  runat="server"></asp:Label></td>
                            <td><asp:Label ID="lblField_12Saturday" Text="12"  runat="server"></asp:Label></td>
                            <td></td>
                        </tr>
                        </table>
                    </center></center></center></center></center></center></center></center></center></center>
                </td>
               <td class="top" style="padding-left:10px;">
                    <div style="text-align:right;">
                        <a href="javascript:popUpWin('Main/DDs/MealExchange/HTML_MealExchange.aspx',700,600);"><img src="../../Images/icons/iconMealExchange.gif" /> Meal Exchange</a>
                    </div>
                    <br />
                   <telerik:RadCalendar ID="RadCalendar1" runat="server" EnableMultiSelect="False" 
                          ShowRowHeaders="false"  >
                       <ClientEvents OnDateSelected="RadCalendar1_SelectDate" />
                    </telerik:RadCalendar>
                </td>
            </tr>
            </table>
        </div>
    
    
  
    <div style="visibility:hidden;">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
        <asp:TextBox ID="txtPostback" runat="server"></asp:TextBox>
        <asp:Label ID="lblDate" runat="server"></asp:Label>
    </div>
    
        
        
        
          <%-- Commented by Netsmartz <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                <AjaxSettings>
                    <telerik:AjaxSetting AjaxControlID="btnEdit">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="txtBField_01" LoadingPanelID="RadAjaxLoadingPanel1" />
                            <telerik:AjaxUpdatedControl ControlID="txtBField_02" />
                            <telerik:AjaxUpdatedControl ControlID="txtBField_03" />
                            <telerik:AjaxUpdatedControl ControlID="txtBField_04" />
                            <telerik:AjaxUpdatedControl ControlID="txtBField_05" />
                            <telerik:AjaxUpdatedControl ControlID="txtBField_06" />
                            <telerik:AjaxUpdatedControl ControlID="txtBField_07" />
                            <telerik:AjaxUpdatedControl ControlID="txtLField_01" />
                            <telerik:AjaxUpdatedControl ControlID="txtLField_02" />
                            <telerik:AjaxUpdatedControl ControlID="txtLField_03" />
                            <telerik:AjaxUpdatedControl ControlID="txtLField_04" />
                            <telerik:AjaxUpdatedControl ControlID="txtLField_05" />
                            <telerik:AjaxUpdatedControl ControlID="txtLField_06" />
                            <telerik:AjaxUpdatedControl ControlID="txtLField_07" />
                            <telerik:AjaxUpdatedControl ControlID="txtDField_01" />
                            <telerik:AjaxUpdatedControl ControlID="txtDField_02" />
                            <telerik:AjaxUpdatedControl ControlID="txtDField_03" />
                            <telerik:AjaxUpdatedControl ControlID="txtDField_04" />
                            <telerik:AjaxUpdatedControl ControlID="txtDField_05" />
                            <telerik:AjaxUpdatedControl ControlID="txtDField_06" />
                            <telerik:AjaxUpdatedControl ControlID="txtDField_07" />
                            <telerik:AjaxUpdatedControl ControlID="txtTotalField_01" />
                            <telerik:AjaxUpdatedControl ControlID="txtTotalField_02" />
                            <telerik:AjaxUpdatedControl ControlID="txtTotalField_03" />
                            <telerik:AjaxUpdatedControl ControlID="txtTotalField_04" />
                            <telerik:AjaxUpdatedControl ControlID="txtTotalField_05" />
                            <telerik:AjaxUpdatedControl ControlID="txtTotalField_06" />
                            <telerik:AjaxUpdatedControl ControlID="txtTotalField_07" />
                            <telerik:AjaxUpdatedControl ControlID="txtLVField_01" />
                            <telerik:AjaxUpdatedControl ControlID="txtLVField_02" />
                            <telerik:AjaxUpdatedControl ControlID="txtLVField_03" />
                            <telerik:AjaxUpdatedControl ControlID="txtLVField_04" />
                            <telerik:AjaxUpdatedControl ControlID="txtLVField_05" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="btnSubmit">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCalendar1" />
                            <telerik:AjaxUpdatedControl ControlID="txtPostback" />
                            <telerik:AjaxUpdatedControl ControlID="lblWeekBack" />
                            <telerik:AjaxUpdatedControl ControlID="lblWeekForward" />
                            <telerik:AjaxUpdatedControl ControlID="lblSunday" />
                            <telerik:AjaxUpdatedControl ControlID="lblMonday" />
                            <telerik:AjaxUpdatedControl ControlID="lblTuesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblWednesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblThursday" />
                            <telerik:AjaxUpdatedControl ControlID="lblFriday" />
                            <telerik:AjaxUpdatedControl ControlID="lblSaturday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_01Type" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_01Sunday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_01Monday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_01Tuesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_01Wednesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_01Thursday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_01Friday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_01Saturday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_02Type" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_02Sunday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_02Monday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_02Tuesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_02Wednesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_02Thursday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_02Friday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_02Saturday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_03Type" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_03Sunday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_03Monday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_03Tuesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_03Wednesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_03Thursday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_03Friday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_03Saturday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_04Type" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_04Sunday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_04Monday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_04Tuesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_04Wednesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_04Thursday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_04Friday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_04Saturday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_05Type" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_05Sunday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_05Monday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_05Tuesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_05Wednesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_05Thursday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_05Friday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_05Saturday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_06Type" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_06Sunday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_06Monday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_06Tuesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_06Wednesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_06Thursday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_06Friday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_06Saturday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_07Type" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_07Sunday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_07Monday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_07Tuesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_07Wednesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_07Thursday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_07Friday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_07Saturday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_08Type" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_08Sunday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_08Monday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_08Tuesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_08Wednesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_08Thursday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_08Friday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_08Saturday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_09Type" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_09Sunday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_09Monday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_09Tuesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_09Wednesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_09Thursday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_09Friday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_09Saturday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_10Type" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_10Sunday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_10Monday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_10Tuesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_10Wednesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_10Thursday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_10Friday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_10Saturday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_11Type" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_11Sunday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_11Monday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_11Tuesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_11Wednesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_11Thursday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_11Friday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_11Saturday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_12Type" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_12Sunday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_12Monday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_12Tuesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_12Wednesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_12Thursday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_12Friday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_12Saturday" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="RadCalendar1">
                        <UpdatedControls>
                            <telerik:AjaxUpdatedControl ControlID="RadCalendar1" />
                            <telerik:AjaxUpdatedControl ControlID="lblWeekBack" />
                            <telerik:AjaxUpdatedControl ControlID="lblWeekForward" />
                            <telerik:AjaxUpdatedControl ControlID="lblSunday" />
                            <telerik:AjaxUpdatedControl ControlID="lblMonday" />
                            <telerik:AjaxUpdatedControl ControlID="lblTuesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblWednesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblThursday" />
                            <telerik:AjaxUpdatedControl ControlID="lblFriday" />
                            <telerik:AjaxUpdatedControl ControlID="lblSaturday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_01Type" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_01Sunday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_01Monday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_01Tuesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_01Wednesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_01Thursday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_01Friday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_01Saturday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_02Type" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_02Sunday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_02Monday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_02Tuesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_02Wednesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_02Thursday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_02Friday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_02Saturday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_03Type" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_03Sunday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_03Monday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_03Tuesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_03Wednesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_03Thursday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_03Friday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_03Saturday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_04Type" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_04Sunday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_04Monday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_04Tuesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_04Wednesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_04Thursday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_04Friday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_04Saturday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_05Type" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_05Sunday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_05Monday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_05Tuesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_05Wednesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_05Thursday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_05Friday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_05Saturday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_06Type" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_06Sunday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_06Monday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_06Tuesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_06Wednesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_06Thursday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_06Friday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_06Saturday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_07Type" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_07Sunday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_07Monday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_07Tuesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_07Wednesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_07Thursday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_07Friday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_07Saturday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_08Type" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_08Sunday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_08Monday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_08Tuesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_08Wednesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_08Thursday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_08Friday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_08Saturday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_09Type" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_09Sunday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_09Monday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_09Tuesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_09Wednesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_09Thursday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_09Friday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_09Saturday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_10Type" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_10Sunday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_10Monday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_10Tuesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_10Wednesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_10Thursday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_10Friday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_10Saturday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_11Type" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_11Sunday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_11Monday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_11Tuesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_11Wednesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_11Thursday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_11Friday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_11Saturday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_12Type" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_12Sunday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_12Monday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_12Tuesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_12Wednesday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_12Thursday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_12Friday" />
                            <telerik:AjaxUpdatedControl ControlID="lblField_12Saturday" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                </AjaxSettings>
            </telerik:RadAjaxManager>
       --%>

    
        
        
    
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
      
        <uc2:UC_DD_DdEntries_PopUp id="UC_DD_DdEntries_PopUp1" runat="server"></uc2:UC_DD_DdEntries_PopUp>
    

        </asp:Content>