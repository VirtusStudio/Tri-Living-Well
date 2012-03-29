<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DD_test.aspx.cs" Inherits="PAL_Recent" %>

<%@ Register Src="~/Controls/UC_DD_DdEntries_PopUp.ascx" TagName="UC_DD_DdEntries_PopUp" TagPrefix="uc2" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>

   <%-- <link href="/Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Table.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Grid.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/centerRound1.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/centerRound2.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Table.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Table.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/centerRound1.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Table.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Table.css" rel="stylesheet" type="text/css" />
    Above lines are commented by Netsmartz
--%>
</head>
<body onload="Init();parent.setIframeHeight_NoTopScroll();top.setIframeHeight_NoTopScroll();" class="body2">
    <form id="form1" runat="server">
    
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
<script type="text/javascript">
function ViewWeek(sDateView)
{
    document.getElementById('<%= txtBackDate.ClientID %>').value = "False";
    document.getElementById('<%= txtForwardDate.ClientID %>').value = "False"; 
        
    document.getElementById('<%= txtPostback.ClientID %>').value = sDateView;  
    document.getElementById('<%= btnSubmit.ClientID %>').click();
 }
 
function ViewWeek(sDateView, sdirection)
{   
    if(sdirection == "Back")
    {
        document.getElementById('<%= txtBackDate.ClientID %>').value = "True";
        document.getElementById('<%= txtForwardDate.ClientID %>').value = "False";
        document.getElementById('<%= txtPostback.ClientID %>').value = sDateView;  
        document.getElementById('<%= btnSubmit.ClientID %>').click();
    }
    else if(sdirection == "Forward")
    {
        document.getElementById('<%= txtForwardDate.ClientID %>').value = "True"; 
        document.getElementById('<%= txtBackDate.ClientID %>').value = "False";  
        document.getElementById('<%= txtPostback.ClientID %>').value = sDateView;  
        document.getElementById('<%= btnSubmit.ClientID %>').click();
    }
    else
    {
        document.getElementById('<%= txtForwardDate.ClientID %>').value = ""; 
        document.getElementById('<%= txtBackDate.ClientID %>').value = ""; 
        document.getElementById('<%= txtPostback.ClientID %>').value = sDateView;  
        document.getElementById('<%= btnSubmit.ClientID %>').click();
    }
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


<span class="subTitle">Daily Diary</span>
        <br />
        <br />
        <div style="width:650px;">
        <table><tr>
        <td style="text-align:left;"><asp:Label ID="lblWeekBack" runat="server"></asp:Label> </td>
        <td style="text-align:right;"><asp:Label ID="lblWeekForward" runat="server"></asp:Label></td>
        </tr></table>
       </div>
       <table>
           <tr>
               <td> 
                    <table class="tblItems" style="width:100%;">
                    <tr>
                        <td style="width:14%;"></td>
                        <td style="width:14%;"><asp:Label runat="server" ID="lblSunday"></asp:Label></td>
                        <td style="width:14%;"><asp:Label runat="server" ID="lblMonday"></asp:Label></td>
                        <td style="width:14%;"><asp:Label runat="server" ID="lblTuesday"></asp:Label></td>
                        <td style="width:14%;"><asp:Label runat="server" ID="lblWednesday"></asp:Label></td>
                        <td style="width:14%;"><asp:Label runat="server" ID="lblThursday"></asp:Label></td>
                        <td style="width:14%;"><asp:Label runat="server" ID="lblFriday"></asp:Label></td>
                        <td style="width:14%;"><asp:Label runat="server" ID="lblSaturday"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width:14%;"><asp:Label ID="lblField_01Type" Text="Grains" runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_01Sunday"  Text="lblField_01Sunday" runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_01Monday" Text="12"  runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_01Tuesday"  Text="12" runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_01Wednesday" Text="12"  runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_01Thursday" Text="12"  runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_01Friday" Text="12"  runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_01Saturday"  Text="12" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width:14%;"><asp:Label ID="lblField_02Type"  Text="Vegetables" runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_02Sunday"  Text="12" runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_02Monday" Text="12"  runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_02Tuesday"  Text="12" runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_02Wednesday" Text="12"  runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_02Thursday" Text="12"  runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_02Friday" Text="12"  runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_02Saturday" Text="12"  runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width:14%;"><asp:Label ID="lblField_03Type" Text="Fruits"  runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_03Sunday" Text="12"  runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_03Monday"  Text="lblField_03Monday" runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_03Tuesday"  Text="12" runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_03Wednesday"  Text="12" runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_03Thursday" Text="12"  runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_03Friday" Text="12"  runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_03Saturday"  Text="12" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width:14%;"><asp:Label ID="lblField_04Type"  Text="Dairys" runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_04Sunday"  Text="12" runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_04Monday"  Text="12" runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_04Tuesday"  Text="12" runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_04Wednesday" Text="12"  runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_04Thursday" Text="12"  runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_04Friday" Text="12" runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_04Saturday" Text="12"  runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width:14%;"><asp:Label ID="lblField_05Type" Text="Meats/Beans"  runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_05Sunday" Text="12"  runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_05Monday" Text="12"  runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_05Tuesday"  Text="12" runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_05Wednesday" Text="12"  runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_05Thursday" Text="12"  runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_05Friday"  Text="12" runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_05Saturday" Text="12"  runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width:14%;"><asp:Label ID="lblField_06Type"  Text="Fats" runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_06Sunday"  Text="12" runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_06Monday"  Text="12" runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_06Tuesday" Text="12"  runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_06Wednesday"  Text="12" runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_06Thursday"  Text="12" runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_06Friday" Text="12"  runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_06Saturday" Text="12"  runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="width:14%;"><asp:Label ID="lblField_07Type" Text="Other"  runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_07Sunday" Text="12"  runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_07Monday"  Text="12" runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_07Tuesday"  Text="12" runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_07Wednesday" Text="12"  runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_07Thursday" Text="12"  runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_07Friday"  Text="12" runat="server"></asp:Label></td>
                        <td style="width:14%;"><asp:Label ID="lblField_07Saturday" Text="12"  runat="server"></asp:Label></td>
                    </tr>
                    </table>
                        <br />
                        <hr />
                        <br />
                        
                    <table class="tblItems"  style="width:91%;">
                        <tr>
                            <td style="width:14%;"><asp:Label ID="lblField_08Type"  Text="Sleep" runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_08Sunday"  Text="12" runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_08Monday"  Text="12" runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_08Tuesday" Text="12"  runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_08Wednesday"  Text="12" runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_08Thursday"  Text="12" runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_08Friday" Text="12"  runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_08Saturday" Text="12"  runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width:14%;"><asp:Label ID="lblField_09Type" Text="Stress"  runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_09Sunday" Text="12"  runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_09Monday"  Text="12" runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_09Tuesday"  Text="12" runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_09Wednesday" Text="12"  runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_09Thursday" Text="12"  runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_09Friday"  Text="12" runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_09Saturday" Text="12"  runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width:14%;"><asp:Label ID="lblField_10Type"  Text="Dejected" runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_10Sunday"  Text="12" runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_10Monday"  Text="12" runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_10Tuesday" Text="12"  runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_10Wednesday"  Text="12" runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_10Thursday"  Text="12" runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_10Friday" Text="12"  runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_10Saturday" Text="12"  runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width:14%;"><asp:Label ID="lblField_11Type" Text="Annoyed"  runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_11Sunday" Text="12"  runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_11Monday"  Text="12" runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_11Tuesday"  Text="12" runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_11Wednesday" Text="12"  runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_11Thursday" Text="12"  runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_11Friday"  Text="12" runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_11Saturday" Text="12"  runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width:14%;"><asp:Label ID="lblField_12Type"  Text="Confident&nbsp;&nbsp;&nbsp;&nbsp;" runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_12Sunday"  Text="12" runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_12Monday"  Text="12" runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_12Tuesday" Text="12"  runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_12Wednesday"  Text="12" runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_12Thursday"  Text="12" runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_12Friday" Text="12"  runat="server"></asp:Label></td>
                            <td style="width:14%;"><asp:Label ID="lblField_12Saturday" Text="12"  runat="server"></asp:Label></td>
                        </tr>
                    </table>
               </td>
               <td>
               <telerik:RadCalendar ID="RadCalendar1" runat="server" Font-Names="Arial,Verdana,Tahoma"  EnableMultiSelect="False" 
                       ForeColor="Black" Style="border-left-color: #ececec; border-bottom-color: #ececec;
                       border-top-color: #ececec; border-right-color: #ececec"  SelectedDate="" ViewSelectorText="x">
                   <ClientEvents OnDateSelected="RadCalendar1_SelectDate" />
                </telerik:RadCalendar>
     
               </td>
           </tr>
       </table>
    
    
    <br />
    <br />
    <br />
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
        <asp:TextBox ID="txtPostback" runat="server"></asp:TextBox>
        <asp:Label ID="lblDate" runat="server"></asp:Label>
        <asp:TextBox ID="txtBackDate" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtForwardDate" runat="server"></asp:TextBox>
        <br />
        
        
        
            <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
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
                            <telerik:AjaxUpdatedControl ControlID="RadCalendar1" />
                        </UpdatedControls>
                    </telerik:AjaxSetting>
                    <telerik:AjaxSetting AjaxControlID="btnSubmit">
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
       

    
        
        
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
      
        <uc2:UC_DD_DdEntries_PopUp id="UC_DD_DdEntries_PopUp1" runat="server"></uc2:UC_DD_DdEntries_PopUp>
    

        
    </form>
</body>
</html>
