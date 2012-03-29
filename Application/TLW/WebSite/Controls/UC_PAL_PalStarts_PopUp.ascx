<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_PAL_PalStarts_PopUp.ascx.cs" Inherits="UC_PAL_PalStarts_PopUp" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!--"javascript:editPalStart();" will open the popup-->
 
<telerik:RadScriptBlock ID="RadScriptBlock2" runat="server">
<script type="text/javascript">
function hide(objElementID)
{
    document.getElementById(objElementID).style.display = "none";
}
function show(objElementID)
{
    document.getElementById(objElementID).style.display = "";
}

function editPalStart()
{
    document.getElementById('<%= ddlProgramID.ClientID %>').selectedIndex = 0;
    document.getElementById('<%= ddlProgramStartStep.ClientID %>').selectedIndex = 0;

    try {
        document.getElementById('<%= btnEdit.ClientID %>').click(); //user has this Enabled = false;
        //so this event never happens in usermode = true
    }
    catch (ex) {
    }
    
    show('<%= divWin.ClientID %>');
    bWaiting = true; 
}
</script>

<!--Transparency-->
<script type="text/javascript">
function hoverTransparency(sElementName)
{ 
/*
    var obj = document.getElementById(sElementName);
    
    obj.onmouseover = function(){this.className = "";}
    obj.onmouseout = function(){this.className = "transparent";}
    obj.onmouseenter = function(){this.onmouseover = null; this.onmouseout = null; this.className = "";}
    obj.onmouseleave = function(){this.className = "transparent";}
    
    */
}

var bWaiting = false;
var divWinTop_Original;
function move_box() 
{
    if(bWaiting)
    {
        var offset = 000; // set offset (likely equal to your css top)
        var element = document.getElementById('<%= divWin.ClientID %>');

        element.style.top = ( parseInt(divWinTop_Original) + parseInt(top.document.documentElement.scrollTop) + offset) + 'px';
    }
}

function UC_PAL_PalStarts_PopUp()
{
    divWinTop_Original = parseInt(document.getElementById('<%= divWin.ClientID %>').style.top);
    hoverTransparency('<%= divWinTransparent.ClientID %>');
    //window.setInterval(move_box, 100);
}

function setRdpProgramStartDate()
{
    var sDate = document.getElementById('<%= txtProgramStartDate.ClientID %>').value;
    if(sDate != "")
    {
        var rdpProgramStartDate = $find("<%= rdpProgramStartDate.ClientID %>");
        {
            rdpProgramStartDate.set_selectedDate(new Date(sDate));
            document.getElementById('<%= txtProgramStartDate.ClientID %>').value = "";
        }
    }
}
</script>
</telerik:RadScriptBlock>

    <div id="divWin" runat="server" class="fixed" style="left:250px;top:470px;width:380px;z-index:100;display:none;" >
        <div id="divWinTransparent" runat="server" style="background-color:White;" >
             <center class="Round1"><center><center><center><center><center><center><center><center><center>
            
             <img  id="imgProgramInfo" runat="server" /> Program Information<br />
             <br />
             <table class="tblItems" style="background-color:White;">
                <tr id="trProgramStartDate" runat="server">
		            <td>Start Date</td>
		            <td>
                        <telerik:RadDatePicker ID="rdpProgramStartDate" runat="server" Width="90" Skin="WebBlue">
                            <calendar ID="Calendar1" runat="server" ShowRowHeaders="False"></calendar>
                        </telerik:RadDatePicker>
                     </td>
	            </tr>
	            <tr>
		            <td>Program</td>
		            <td><asp:DropDownList ID="ddlProgramID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProgramID_SelectedIndexChanged"></asp:DropDownList>
		                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  CssClass="required" ValidationGroup="UC_PAL_PalStarts_PopUp"
                        ErrorMessage="*Required" ControlToValidate="ddlProgramID" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
	            </tr>
	            <tr>
		            <td>Start Step</td>
		            <td><asp:DropDownList ID="ddlProgramStartStep" runat="server"></asp:DropDownList>
		                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="required" ValidationGroup="UC_PAL_PalStarts_PopUp"
                        ErrorMessage="*Required" ControlToValidate="ddlProgramStartStep" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
	            </tr>
	            <tr>
		            <td colspan="2">

<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
<span class="small">*This change will start the new program today (<%= DateTime.Now.ToString("MM/d/yy") %>).</span>
</telerik:RadCodeBlock></td>
	            </tr>
	            <tr>
		            <td colspan="2">
                        <asp:Label ID="lblMessage" runat="server" EnableViewState="False"></asp:Label><br />
                        
<telerik:RadCodeBlock ID="RadCodeBlock2" runat="server">
			            <a class="aButton" href="javascript:document.getElementById('<%= btnSubmit.ClientID %>').click();">&nbsp;OK&nbsp;</a>
			            <a class="aButton" href="javascript:hide('<%= divWin.ClientID %>');">Cancel</a>
</telerik:RadCodeBlock>
			         </td>
			     </tr>
            </table>
            </center></center></center></center></center></center></center></center></center></center>
        </div>
    </div>


        <div style="visibility:hidden;">
             <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" ValidationGroup="UC_PAL_PalStarts_PopUp"
              OnClientClick="if(!confirm('This change will replace your current program and will start the selected program today.\r\n')) return false;"
             ></asp:Button><br />
              <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click"></asp:Button><br />
            <asp:TextBox ID="txtPostback" runat="server"></asp:TextBox><br />
             <asp:TextBox ID="txtProgramStartDate" runat="server"></asp:TextBox><br />
            <asp:Button ID="btnPostback" runat="server" Text="Postback" OnClick="btnPostback_Click"></asp:Button>
            <asp:Button ID="btnClientValidate" runat="server" Text="ClientValidate" OnClientClick="Page_ClientValidate('UC_PAL_PalStarts_PopUp');return false;"></asp:Button>
        </div>
<!--Init()-->
<script type="text/javascript">
    UC_PAL_PalStarts_PopUp();
</script>

<%--
<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
<!--RadAjaxManager-->
 <script type="text/javascript">
function checkPostback()
{
    setRdpProgramStartDate();
    
    document.getElementById('<%= btnClientValidate.ClientID %>').click();
    if(document.getElementById('<%= txtPostback.ClientID %>').value != "")
    {
        var sUrl = window.location.href;
        window.location.href = "";
        window.location.href = sUrl;
    }
}
</script>
</telerik:RadScriptBlock>
<telerik:RadAjaxLoadingPanel ID="AjaxLoadingPanel1" runat="server" Height="75px" Width="75px">
    <asp:Image ID="Image1" runat="server" AlternateText="Loading..." ImageUrl="~/RadControls/Ajax/Skins/Default/loading2.gif" />
</telerik:RadAjaxLoadingPanel>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <ClientEvents OnResponseEnd="checkPostback" />
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="btnSubmit">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="txtPostback" />
                    <telerik:AjaxUpdatedControl ControlID="lblMessage" />
                </UpdatedControls>
            </telerik:AjaxSetting>
             <telerik:AjaxSetting AjaxControlID="btnEdit">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="ddlProgramID" LoadingPanelID="AjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="ddlProgramStartStep" LoadingPanelID="AjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="txtProgramStartDate" LoadingPanelID="AjaxLoadingPanel1" />
                    <telerik:AjaxUpdatedControl ControlID="lblMessage" />
                </UpdatedControls>
            </telerik:AjaxSetting>
             <telerik:AjaxSetting AjaxControlID="ddlProgramID">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="ddlProgramStartStep" LoadingPanelID="AjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    --%>