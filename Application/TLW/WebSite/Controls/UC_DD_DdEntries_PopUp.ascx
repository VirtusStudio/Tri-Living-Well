<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_DD_DdEntries_PopUp.ascx.cs" Inherits="UC_DD_DdEntries_PopUp" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%--<link href="../../Styles/Table.css" rel="stylesheet" type="text/css" />
<link href="../../Styles/centerRound1.css" rel="stylesheet" type="text/css" />
Above lines are commented by Netsmartz
--%>

<!--"Init();" must be placed for body onload-->
<!--"javascript:addEntry(sDate);" will open the popup-->
<!--"javascript:editEntry(sDate);" will open the popup-->

<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
<script type="text/javascript">
var cbEditTotals;
var txtDdEntryID;
var rdpDdEntryDate;


var radTxtBField_01;
var radTxtBField_02;
var radTxtBField_03;
var radTxtBField_04;
var radTxtBField_05;
var radTxtBField_06;
var radTxtBField_07;

var radTxtLField_01;
var radTxtLField_02;
var radTxtLField_03;
var radTxtLField_04;
var radTxtLField_05;
var radTxtLField_06;
var radTxtLField_07;

var radTxtDField_01;
var radTxtDField_02;
var radTxtDField_03;
var radTxtDField_04;
var radTxtDField_05;
var radTxtDField_06;
var radTxtDField_07;

var radTxtTotalField_01;
var radTxtTotalField_02;
var radTxtTotalField_03;
var radTxtTotalField_04;
var radTxtTotalField_05;
var radTxtTotalField_06;
var radTxtTotalField_07;


var radTxtLVField_01;
var radTxtLVField_02;
var radTxtLVField_03;
var radTxtLVField_04;
var radTxtLVField_05; 

Sys.Application.add_load(InitControls);

function InitControls()
{
       
    cbEditTotals = $get("<%= cbEditTotals.ClientID %>");
    txtDdEntryID= $get("<%= txtDdEntryID.ClientID %>");
    rdpDdEntryDate = $find("<%= rdpDdEntryDate.ClientID %>");
     
//alert(txtDdEntryID);
//alert(rdpDdEntryDate);
     
     
     radTxtBField_01 = $find("<%= txtBField_01.ClientID %>");
     radTxtBField_02 = $find("<%= txtBField_02.ClientID %>");
     radTxtBField_03 = $find("<%= txtBField_03.ClientID %>");
     radTxtBField_04 = $find("<%= txtBField_04.ClientID %>");
     radTxtBField_05 = $find("<%= txtBField_05.ClientID %>");
     radTxtBField_06 = $find("<%= txtBField_06.ClientID %>");
     radTxtBField_07 = $find("<%= txtBField_07.ClientID %>");
     
     radTxtLField_01 = $find("<%= txtLField_01.ClientID %>");
     radTxtLField_02 = $find("<%= txtLField_02.ClientID %>");
     radTxtLField_03 = $find("<%= txtLField_03.ClientID %>");
     radTxtLField_04 = $find("<%= txtLField_04.ClientID %>");
     radTxtLField_05 = $find("<%= txtLField_05.ClientID %>");
     radTxtLField_06 = $find("<%= txtLField_06.ClientID %>");
     radTxtLField_07 = $find("<%= txtLField_07.ClientID %>");
     
     radTxtDField_01 = $find("<%= txtDField_01.ClientID %>");
     radTxtDField_02 = $find("<%= txtDField_02.ClientID %>");
     radTxtDField_03 = $find("<%= txtDField_03.ClientID %>");
     radTxtDField_04 = $find("<%= txtDField_04.ClientID %>");
     radTxtDField_05 = $find("<%= txtDField_05.ClientID %>");
     radTxtDField_06 = $find("<%= txtDField_06.ClientID %>");
     radTxtDField_07 = $find("<%= txtDField_07.ClientID %>");
     
     radTxtTotalField_01 = $find("<%= txtTotalField_01.ClientID %>");
     radTxtTotalField_02 = $find("<%= txtTotalField_02.ClientID %>");
     radTxtTotalField_03 = $find("<%= txtTotalField_03.ClientID %>");
     radTxtTotalField_04 = $find("<%= txtTotalField_04.ClientID %>");
     radTxtTotalField_05 = $find("<%= txtTotalField_05.ClientID %>");
     radTxtTotalField_06 = $find("<%= txtTotalField_06.ClientID %>");
     radTxtTotalField_07 = $find("<%= txtTotalField_07.ClientID %>");
     
     radTxtLVField_01 = $find("<%= txtLVField_01.ClientID %>");
     radTxtLVField_02 = $find("<%= txtLVField_02.ClientID %>");
     radTxtLVField_03 = $find("<%= txtLVField_03.ClientID %>");
     radTxtLVField_04 = $find("<%= txtLVField_04.ClientID %>");
     radTxtLVField_05 = $find("<%= txtLVField_05.ClientID %>");      
}

function hide(objElementID)
{
    document.getElementById(objElementID).style.display = "none";
}
function show(objElementID)
{
    document.getElementById(objElementID).style.display = "";
}

function addEntry(sDate)
{
     radTxtBField_01.set_value(0);
     radTxtBField_02.set_value(0);
     radTxtBField_03.set_value(0);
     radTxtBField_04.set_value(0);
     radTxtBField_05.set_value(0);
     radTxtBField_06.set_value(0);
     radTxtBField_07.set_value(0);
     
     radTxtLField_01.set_value(0);
     radTxtLField_02.set_value(0);
     radTxtLField_03.set_value(0);
     radTxtLField_04.set_value(0);
     radTxtLField_05.set_value(0);
     radTxtLField_06.set_value(0);
     radTxtLField_07.set_value(0);
     
     radTxtDField_01.set_value(0);
     radTxtDField_02.set_value(0);
     radTxtDField_03.set_value(0);
     radTxtDField_04.set_value(0);
     radTxtDField_05.set_value(0);
     radTxtDField_06.set_value(0);
     radTxtDField_07.set_value(0);
     
     radTxtTotalField_01.set_value(0);
     radTxtTotalField_02.set_value(0);
     radTxtTotalField_03.set_value(0);
     radTxtTotalField_04.set_value(0);
     radTxtTotalField_05.set_value(0);
     radTxtTotalField_06.set_value(0);
     radTxtTotalField_07.set_value(0);
     
     radTxtLVField_01.set_value(0);
     radTxtLVField_02.set_value(0);
     radTxtLVField_03.set_value(0);
     radTxtLVField_04.set_value(0);
     radTxtLVField_05.set_value(0);
    
    

    txtDdEntryID.value = "";

    if(sDate != "")
    {
        rdpDdEntryDate.set_selectedDate(new Date(sDate));
    }
    else
    {
        rdpDdEntryDate.set_selectedDate(new Date());
    }
    show('divWin');
    bWaiting = true; 
    
}




function editEntry(sDdEntryID, sDate)
{

    document.getElementById('<%= txtDdEntryID.ClientID %>').value = sDdEntryID;
    
    var rdpDdEntryDate = $find("<%= rdpDdEntryDate.ClientID %>");
    if(sDate != "")
    {
        rdpDdEntryDate.set_selectedDate(new Date(sDate));
    }
    else
    {
        rdpDdEntryDate.set_selectedDate(new Date());
    }
    
    
    
    document.getElementById('<%= btnEdit.ClientID %>').click();
    
    show('divWin');
    
    bWaiting = true; 
}


function addRows()
{

    radTxtTotalField_01.set_value(radTxtBField_01.get_value() + radTxtLField_01.get_value() + radTxtDField_01.get_value());
    radTxtTotalField_02.set_value(radTxtBField_02.get_value() + radTxtLField_02.get_value() + radTxtDField_02.get_value());
    radTxtTotalField_03.set_value(radTxtBField_03.get_value() + radTxtLField_03.get_value() + radTxtDField_03.get_value());
    radTxtTotalField_04.set_value(radTxtBField_04.get_value() + radTxtLField_04.get_value() + radTxtDField_04.get_value());
    radTxtTotalField_05.set_value(radTxtBField_05.get_value() + radTxtLField_05.get_value() + radTxtDField_05.get_value());
    radTxtTotalField_06.set_value(radTxtBField_06.get_value() + radTxtLField_06.get_value() + radTxtDField_06.get_value());
    radTxtTotalField_07.set_value(radTxtBField_07.get_value() + radTxtLField_07.get_value() + radTxtDField_07.get_value());
}


function fillTotals(field_01,field_02,field_03,field_04,field_05,field_06,field_07)
{
     radTxtBField_01.set_value(field_01);
     radTxtBField_02.set_value(field_02);
     radTxtBField_03.set_value(field_03);
     radTxtBField_04.set_value(field_04);
     radTxtBField_05.set_value(field_05);
     radTxtBField_06.set_value(field_06);
     radTxtBField_07.set_value(field_07);
     addRows();
}



</script>

<!--Transparency-->
<script type="text/javascript">
function hoverTransparency(sElementName)
{ 
    var obj = document.getElementById(sElementName);
    
    obj.onmouseover = function(){this.className = "";}
    obj.onmouseout = function(){this.className = "transparent";}
    obj.onmouseenter = function(){this.onmouseover = null; this.onmouseout = null; this.className = "";}
    obj.onmouseleave = function(){this.className = "transparent";}
    
}

var bWaiting = false;
var divWinTop_Original;
function move_box() 
{
    if(bWaiting)
    {
        var offset = 000; // set offset (likely equal to your css top)
        var element = document.getElementById('divWin');

        element.style.top = ( parseInt(divWinTop_Original) + parseInt(top.document.documentElement.scrollTop) + offset) + 'px';
    }
}

function Init()
{
    divWinTop_Original = parseInt(document.getElementById('divWin').style.top);
   //hoverTransparency("divWinTransparent");
    //window.setInterval(move_box, 100);
}
function submit()
{
document.getElementById('<%= btnSubmit.ClientID %>').click();
}
</script>
</telerik:RadScriptBlock>
        
        <style type="text/css">
        .tblStyle {width:auto;}
        .tblStyle td {width:70px;height:31px;padding:0px 2px 0px 5px;vertical-align:middle;}
        </style>
          
    <div id="divWin" class="fixed" style="left:100px;top:30px;width:600px;z-index:100;display:none;" >
        <div id="divWinTransparent" style="background-color:White;" >
<div style="visibility:hidden;position:absolute;top:0px;z-index:-1;">
            <asp:TextBox ID="txtDdEntryID" style="text-align:right;"   runat="server"></asp:TextBox>
            <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click"></asp:Button>
             <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click"  Text="Submit" ValidationGroup="UC_DD_CreateEntry"></asp:Button>
             
</div>
             <center class="Round1"><center><center><center><center><center><center><center><center><center>
            
             <img id="imgDDLog" alt="" runat="server"/> Daily Diary Log<br />
             <br />
             <table class="tblItems" style="background-color:White;">
	            <tr>
		            <td>Date</td>
		            <td>
                        <telerik:RadDatePicker ID="rdpDdEntryDate" runat="server" Width="130" Skin="WebBlue">
                            <calendar ShowRowHeaders="False"></calendar>
                        </telerik:RadDatePicker>
                        &nbsp;
                    </td>
                    <td>
                    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
                 <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Height="75px"
                     Width="75px" IsSticky="True">
                     <img alt="Loading..." src='<%= RadAjaxLoadingPanel.GetWebResourceUrl(Page, "Telerik.Web.UI.Skins.Default.Ajax.loading.gif") %>'
                         style="border: 0px;" />
                 </telerik:RadAjaxLoadingPanel>
                   </telerik:RadCodeBlock>
                    </td>
	            </tr>
	         </table>
                     
            
            <table style="width:auto;background-color:White;">
            <tr>
	            <td class="top">
                    <table class="tblStyle" style="background-color:White;">
                        <tr><td><br /></td></tr>
                        <tr class="trAlt"><td><asp:Label ID="lblField_01Type"  Text="Starch" runat="server"></asp:Label></td></tr>
                        <tr><td><asp:Label ID="lblField_02Type"  Text="Fruit" runat="server"></asp:Label></td></tr>
                        <tr class="trAlt"><td><asp:Label ID="lblField_03Type"  Text="Milk" runat="server"></asp:Label></td></tr>
                        <tr><td><asp:Label ID="lblField_04Type"  Text="Vege." runat="server"></asp:Label></td></tr>
                        <tr class="trAlt"><td><asp:Label ID="lblField_05Type"  Text="Meats" runat="server"></asp:Label></td></tr>
                        <tr><td><asp:Label ID="lblField_06Type"  Text="Fat" runat="server"></asp:Label></td></tr>
                        <tr class="trAlt"><td><asp:Label ID="lblField_07Type"  Text="Other" runat="server"></asp:Label></td></tr>
                    </table>
                </td>
	            <td class="top">
                    <table class="tblStyle" style="background-color:White;">
	                    <tr><td>Breakfast</td></tr>
	                    <tr class="trAlt">
	                        <td>
	                            <telerik:RadNumericTextBox ID="txtBField_01"  MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                     <EnabledStyle HorizontalAlign="Right" />
                                     <ClientEvents OnValueChanged="addRows"/>
                                     <NumberFormat DecimalDigits="0" />
                                 </telerik:RadNumericTextBox>
                            </td>
	                    </tr>
	                    <tr>
		                       <td><telerik:RadNumericTextBox ID="txtBField_02"  MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                 <EnabledStyle HorizontalAlign="Right" />
                                 <ClientEvents OnValueChanged="addRows"/>
                                 <NumberFormat DecimalDigits="0" />
                             </telerik:RadNumericTextBox>
                            </td>
	                    </tr>
	                    <tr class="trAlt">
		                    <td><telerik:RadNumericTextBox ID="txtBField_03"  MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                 <EnabledStyle HorizontalAlign="Right" />
                                 <ClientEvents OnValueChanged="addRows"/>
                                 <NumberFormat DecimalDigits="0" />
                             </telerik:RadNumericTextBox>
                            </td>
	                    </tr>
	                    <tr>
		                    <td><telerik:RadNumericTextBox ID="txtBField_04"   MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                 <EnabledStyle HorizontalAlign="Right" />
                                 <ClientEvents OnValueChanged="addRows"/>
                                 <NumberFormat DecimalDigits="0" />
                             </telerik:RadNumericTextBox>
                            </td>
	                    </tr>
	                    <tr class="trAlt">
		                    <td><telerik:RadNumericTextBox ID="txtBField_05"   MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                 <EnabledStyle HorizontalAlign="Right" />
                                 <ClientEvents OnValueChanged="addRows"/>
                                 <NumberFormat DecimalDigits="0" />
                             </telerik:RadNumericTextBox>
                            </td>
	                    </tr>
	                    <tr>
		                    <td><telerik:RadNumericTextBox ID="txtBField_06"  MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                 <EnabledStyle HorizontalAlign="Right" />
                                 <ClientEvents OnValueChanged="addRows"/>
                                 <NumberFormat DecimalDigits="0" />
                             </telerik:RadNumericTextBox>
                            </td>
	                    </tr>
	                    <tr class="trAlt">
		                    <td><telerik:RadNumericTextBox ID="txtBField_07"  MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                 <EnabledStyle HorizontalAlign="Right" />
                                 <ClientEvents OnValueChanged="addRows"/>
                                 <NumberFormat DecimalDigits="0" />
                             </telerik:RadNumericTextBox>
		                    </td>
	                    </tr>
                  </table>
                  
	            
                            </td>
	            
	            
	                 <td class="top">
		        <table class="tblStyle" style="background-color:White;">
                    <tr><td>Lunch</td></tr>
	                <tr class="trAlt">
		                <td><telerik:RadNumericTextBox ID="txtLField_01"   MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                 <EnabledStyle HorizontalAlign="Right" />
                                 <ClientEvents OnValueChanged="addRows"/>
                                 <NumberFormat DecimalDigits="0" />
                             </telerik:RadNumericTextBox>
                        </td>
	                </tr>
	                <tr>
		               <td><telerik:RadNumericTextBox ID="txtLField_02"   MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                     <EnabledStyle HorizontalAlign="Right" />
                                     <ClientEvents OnValueChanged="addRows"/>
                                     <NumberFormat DecimalDigits="0" />
                                 </telerik:RadNumericTextBox>
                        </td>
	                </tr>
	                <tr class="trAlt">
		                <td><telerik:RadNumericTextBox ID="txtLField_03"  MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                     <EnabledStyle HorizontalAlign="Right" />
                                     <ClientEvents OnValueChanged="addRows"/>
                                     <NumberFormat DecimalDigits="0" />
                                 </telerik:RadNumericTextBox>
                        </td>
	                </tr>
	                <tr>
		                <td><telerik:RadNumericTextBox ID="txtLField_04"  MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                     <EnabledStyle HorizontalAlign="Right" />
                                     <ClientEvents OnValueChanged="addRows"/>
                                     <NumberFormat DecimalDigits="0" />
                                 </telerik:RadNumericTextBox>
                        </td>
	                </tr>
	                <tr class="trAlt">
		                <td><telerik:RadNumericTextBox ID="txtLField_05"   MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                     <EnabledStyle HorizontalAlign="Right" />
                                     <ClientEvents OnValueChanged="addRows"/>
                                     <NumberFormat DecimalDigits="0" />
                                 </telerik:RadNumericTextBox>
                        </td>
	                </tr>
	                <tr>
		               <td><telerik:RadNumericTextBox ID="txtLField_06"   MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                     <EnabledStyle HorizontalAlign="Right" />
                                     <ClientEvents OnValueChanged="addRows"/>
                                     <NumberFormat DecimalDigits="0" />
                                 </telerik:RadNumericTextBox>
                        </td>
	                </tr>
	                <tr class="trAlt">
		                <td><telerik:RadNumericTextBox ID="txtLField_07"  MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                     <EnabledStyle HorizontalAlign="Right" />
                                     <ClientEvents OnValueChanged="addRows"/>
                                     <NumberFormat DecimalDigits="0" />
                                 </telerik:RadNumericTextBox>
                         </td>
                     </tr>
                 </table>
                   
                    </td>
	            
	                <td class="top">
                     <table class="tblStyle" style="background-color:White;">
                     
	                    <tr><td>Dinner</td></tr>
	                    <tr class="trAlt">
		                    <td><telerik:RadNumericTextBox ID="txtDField_01"   MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                 <EnabledStyle HorizontalAlign="Right" />
                                 <ClientEvents OnValueChanged="addRows"/>
                                 <NumberFormat DecimalDigits="0" />
                             </telerik:RadNumericTextBox>
                            </td>
	                    </tr>
	                    <tr>
		                    <td><telerik:RadNumericTextBox ID="txtDField_02"   MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                 <EnabledStyle HorizontalAlign="Right" />
                                 <ClientEvents OnValueChanged="addRows"/>
                                 <NumberFormat DecimalDigits="0" />
                             </telerik:RadNumericTextBox>
                            </td>
	                    </tr>
	                    <tr class="trAlt">
		                    <td><telerik:RadNumericTextBox ID="txtDField_03"   MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                 <EnabledStyle HorizontalAlign="Right" />
                                 <ClientEvents OnValueChanged="addRows"/>
                                 <NumberFormat DecimalDigits="0" />
                             </telerik:RadNumericTextBox>
                            </td>
	                    </tr>
	                    <tr>
		                    <td><telerik:RadNumericTextBox ID="txtDField_04"  MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                 <EnabledStyle HorizontalAlign="Right" />
                                 <ClientEvents OnValueChanged="addRows"/>
                                 <NumberFormat DecimalDigits="0" />
                             </telerik:RadNumericTextBox>
                            </td>
	                    </tr>
	                    <tr class="trAlt">
		                     <td><telerik:RadNumericTextBox ID="txtDField_05"   MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                 <EnabledStyle HorizontalAlign="Right" />
                                 <ClientEvents OnValueChanged="addRows"/>
                                 <NumberFormat DecimalDigits="0" />
                             </telerik:RadNumericTextBox>
                            </td>
	                    </tr>
	                    <tr>
		                    <td><telerik:RadNumericTextBox ID="txtDField_06"   MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                 <EnabledStyle HorizontalAlign="Right" />
                                 <ClientEvents OnValueChanged="addRows"/>
                                 <NumberFormat DecimalDigits="0" />
                             </telerik:RadNumericTextBox>
                            </td>
	                    </tr>
	                    <tr class="trAlt">
		                    <td><telerik:RadNumericTextBox ID="txtDField_07"   MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                 <EnabledStyle HorizontalAlign="Right" />
                                 <ClientEvents OnValueChanged="addRows"/>
                                 <NumberFormat DecimalDigits="0" />
                             </telerik:RadNumericTextBox>
                            </td>
	                    </tr>
                    </table>
                     </td>

                     
            <td class="top">
             <table class="tblStyle" style="background-color:White;">
                <tr><td>Totals</td></tr>
	            <tr class="trAlt">
		           <td><telerik:RadNumericTextBox ID="txtTotalField_01"  MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                 <EnabledStyle HorizontalAlign="Right" />
                                 <NumberFormat DecimalDigits="0" />
                             </telerik:RadNumericTextBox>
                    </td>
	            </tr>
	            <tr>
		           <td><telerik:RadNumericTextBox ID="txtTotalField_02"   MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                 <EnabledStyle HorizontalAlign="Right" />
                                 <NumberFormat DecimalDigits="0" />
                             </telerik:RadNumericTextBox>
                    </td>
	            </tr>
	            <tr class="trAlt">
		            <td><telerik:RadNumericTextBox ID="txtTotalField_03"   MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                 <EnabledStyle HorizontalAlign="Right" />
                                 <NumberFormat DecimalDigits="0" />
                             </telerik:RadNumericTextBox>
                    </td>
	            </tr>
	            <tr>
		            <td><telerik:RadNumericTextBox ID="txtTotalField_04"   MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                 <EnabledStyle HorizontalAlign="Right" />
                                 <NumberFormat DecimalDigits="0" />
                             </telerik:RadNumericTextBox>
                    </td>
	            </tr>
	            <tr class="trAlt">
		            <td><telerik:RadNumericTextBox ID="txtTotalField_05"  MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                 <EnabledStyle HorizontalAlign="Right" />
                                 <NumberFormat DecimalDigits="0" />
                             </telerik:RadNumericTextBox>
                    </td>
	            </tr>
	            <tr>
		             <td><telerik:RadNumericTextBox ID="txtTotalField_06"   MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                 <EnabledStyle HorizontalAlign="Right" />
                                 <NumberFormat DecimalDigits="0" />
                             </telerik:RadNumericTextBox>
                    </td>
	            </tr>
	            <tr class="trAlt">
		            <td><telerik:RadNumericTextBox ID="txtTotalField_07"   MaxValue="20" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                 <EnabledStyle HorizontalAlign="Right" />
                                 <NumberFormat DecimalDigits="0" />
                             </telerik:RadNumericTextBox>
                    </td>
	            </tr>
	            </table>
                     <br />
                     <div style="display:none;">
	             Edit Totals
                       <asp:CheckBox  ID="cbEditTotals" runat="server" Text="" onchange="EnableFields();" />
                       </div>
                       </td>
                       <td  style="vertical-align:top;">
                       
                       
                       
	            <table class="tblStyle" style="background-color:White;">
	                <tr><td><asp:Label ID="lblCalorieDiet" runat="server"></asp:Label></td></tr>
	                <tr class="trAlt">
	                    <td>
	                        <asp:TextBox ID="txtFillField_01" Enabled="false" Width="40px" runat="server" Height="20px"></asp:TextBox>
	                    </td>
	                </tr>
	                <tr>
	                    <td>
	                        <asp:TextBox ID="txtFillField_02" Enabled="false" Width="40px" runat="server" Height="20px"></asp:TextBox>
	                    </td>
	                </tr>
	                <tr class="trAlt">
	                    <td>
	                        <asp:TextBox ID="txtFillField_03" Enabled="false" Width="40px" runat="server" Height="20px"></asp:TextBox>
	                    </td>
	                </tr>
	                <tr>
	                    <td>
	                        <asp:TextBox ID="txtFillField_04" Enabled="false" Width="40px" runat="server" Height="20px"></asp:TextBox>
	                    </td>
	                </tr>
	                <tr class="trAlt">
	                    <td>
	                        <asp:TextBox ID="txtFillField_05" Enabled="false" Width="40px" runat="server" Height="20px"></asp:TextBox>
	                    </td>
	                </tr>
	                <tr>
	                    <td>
	                        <asp:TextBox ID="txtFillField_06" Enabled="false" Width="40px" runat="server" Height="20px"></asp:TextBox>
	                    </td>
	                </tr>
	                <tr class="trAlt">
	                    <td>
	                        <asp:TextBox ID="txtFillField_07" Enabled="false" Width="40px" runat="server" Height="20px"></asp:TextBox>
	                    </td>
	                </tr>
	            </table>
                       </td>
	            </tr>
            </table>
	            <span class="small">*Valid Values: 0 - 20</span>  
            <br />
            <hr />
            <br />
            <table style="width:auto;background-color:White;">
            <tr>
                <td>
                  <table class="tblStyle" style="background-color:White;">
	            <tr class="trAlt">
		            <td>
                        <asp:Label ID="lblLVField_01Type"  Text="Life Value 1" runat="server"></asp:Label>
                    </td>
	            </tr>
	            <tr>
		            <td>
	                   <asp:Label ID="lblLVField_02Type"  Text="Life Value 2" runat="server"></asp:Label>
	                </td>
	            </tr>
	            <tr class="trAlt" style="display:none;">
		            <td>
	                   <asp:Label ID="lblLVField_03Type" Text="Life Value 3" runat="server"></asp:Label>
	                </td>
	            </tr>
	            <tr style="display:none;">
		            <td>
	                   <asp:Label ID="lblLVField_04Type" Text="Life Value 4" runat="server"></asp:Label>
	                </td>
	            </tr>
	            <tr style="display:none;">
		            <td>
	                   <asp:Label ID="lblLVField_05Type" Text="Life Value 5" runat="server"></asp:Label>
	                </td>
	            </tr>
	            </table> 
                </td> 
		        <td>

                    <table class="tblStyle" style="background-color:White;">
	            <tr class="trAlt">
		            <td><telerik:RadNumericTextBox ID="txtLVField_01"   MaxValue="5" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                 <EnabledStyle HorizontalAlign="Right" />
                                 <NumberFormat DecimalDigits="0" />
                             </telerik:RadNumericTextBox>
                    </td>
	            </tr>
	            <tr>
		            <td><telerik:RadNumericTextBox ID="txtLVField_02"   MaxValue="5" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                 <EnabledStyle HorizontalAlign="Right" />
                                 <NumberFormat DecimalDigits="0" />
                             </telerik:RadNumericTextBox>
                    </td>
	            </tr>
	            <tr class="trAlt" style="display:none;">
		             <td><telerik:RadNumericTextBox ID="txtLVField_03"    MaxValue="5" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                 <EnabledStyle HorizontalAlign="Right" />
                                 <NumberFormat DecimalDigits="0" />
                             </telerik:RadNumericTextBox>
                    </td>
	            </tr>
	            <tr style="display:none;">
		            <td>
		                     <telerik:RadNumericTextBox ID="txtLVField_04"     MaxValue="5" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                 <EnabledStyle HorizontalAlign="Right" />
                                 <NumberFormat DecimalDigits="0" />
                             </telerik:RadNumericTextBox>
                    </td>
	            </tr>
	            <tr style="display:none;">
		            <td>
		                    <telerik:RadNumericTextBox ID="txtLVField_05"   MaxValue="5" MinValue="0" Width="60px"  NumberFormat-DecimalDigits="0"  runat="server"   ShowSpinButtons="True">
                                 <EnabledStyle HorizontalAlign="Right" />
                                 <NumberFormat DecimalDigits="0" />
                             </telerik:RadNumericTextBox>
                    </td>
	            </tr>
	            </table>  
                
                </td>
		        <td style="text-align:right;padding:25px;">
		            <a class="aButton" href="javascript:submit();">&nbsp;OK&nbsp;</a>
		            <a class="aButton" href="javascript:hide('divWin');">Cancel</a>
		         </td>
             </tr>
             </table>
            <span class="small">Valid Values 0 - 5</span>
            </center></center></center></center></center></center></center></center></center></center>
        </div>
    </div>

    