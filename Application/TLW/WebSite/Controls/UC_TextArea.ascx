<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_TextArea.ascx.cs" Inherits="UC_TextArea" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<%--<link href="/welcome/Styles/Corporate_text.css" rel="stylesheet" type="text/css" />
Commented by Netsmartz
--%>


<!--popUpWin-->
<script type="text/javascript">
function popUpWin_UC_TextArea(path, x, y)
{ 
    var sURL =  path;
	var features = 'toolbar=0,location=0,status=1,menubar=0,scrollbars=1,resizable=1,width='+x+',height='+y+',left=' + top.window.screenLeft + ',top=' + top.window.screenTop;
	var windownew = window.open(sURL,"new_window",features);
	try { windownew.focus(); } catch(err) { }
}
</script>

<!-- END TO BE DELETED -->
<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
<script type="text/javascript">
    function popUpClosing()//
    {

    }

    function popUpOpening()//
    {
        //alert("popupOpening()");
    }

    function btnCancel_Clicked()//Delete the preview template
    {
        
    }

    function btnEdit_Clicked()//Edit the preview template
    {
   
    }

    function btnSave_Clicked()//Update the preview template to go live
    {
       
    }
    
</script>
</telerik:RadScriptBlock>
<style>
.aSmallButton
{
   display:inline-table;
  padding:4px 4px 4px 4px;
  /*border:solid 2px #1F000A;*/
    border:solid 2px #1581AE;
  text-align:center;
  color:#ffffff;
  text-decoration:none;
  vertical-align:middle;
  line-height:12px;
  font-weight:bold;
  font-size:10px;
  background-color:#000000;
}
.aSmallButton:hover {
    border:solid 2px #1581AE;
  background-color:#ffffff;
  color:#1581AE;
   text-decoration:none;
 }
</style>
    <div style="position:relative; top:-35px; "  id="divModeEdit" runat="server">
<%--    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server"></telerik:RadCodeBlock>
        <table>
            <tr>
                <td style="width:100%;"></td>
                <td><div id="divCancelBtn" style="padding-right:3px;" runat="server"><a class="aSmallButton" href="javascript:document.getElementById('<%= btnCancel.ClientID %>').click();">Cancel</a></div></td>
                <td><div id="divEditBtn" runat="server"><a class="aSmallButton" href="javascript:popUpWin_UC_TextArea('../../Textarea/popup.aspx?TextAreaName=<%= txtTextAreaName.Text %>&refreshButtonId=<%= btnRefresh.ClientID %>', 1300, 1000);">Edit</a></div></td>
                <td><div id="divSaveBtn" style="padding-left:3px;" runat="server"><a class="aSmallButton" href="javascript:document.getElementById('<%= btnSave.ClientID %>').click();">Save</a></div></td>
            </tr>
        </table>--%>
    </div>
<asp:Label ID="lblTextAreaHtml" runat="server"></asp:Label><br />

<%--                
<div style="display:none; border:solid 1px red; ">
HIDDEN AREA<br /><br />
<table>
<tr><td>TextAreaId: </td><td><asp:TextBox Visible="false"  ID="txtTextAreaId" runat="server" ></asp:TextBox></td></tr>
<tr><td>TextAreaName: </td><td><asp:TextBox Visible="false"  ID="txtTextAreaName" runat="server" ></asp:TextBox></td></tr>
<tr><td>Control Mode: </td><td><asp:TextBox Visible="false"  ID="txtIsPreview" runat="server" ></asp:TextBox></td></tr>
</table>
    <asp:Button ID="btnSave" Visible="false" runat="server" Text="btnSave" OnClick="btnSave_Click" />
    <asp:Button ID="btnRefresh" Visible="false"  runat="server" Text="btnSave" OnClick="btnRefresh_Click" />
    <asp:Button ID="btnCancel" Visible="false"  runat="server" Text="btnCancel" OnClick="btnCancel_Click" /><br />
    <br />
    --%>
    <%--
<telerik:RadAjaxLoadingPanel ID="Ajaxloadingpanel1" runat="server" Height="100%" Width="100%" Transparency="50" BackColor="Gray">
    <asp:Image ID="Image1" runat="server" AlternateText="Loading..." ImageUrl="~/RadControls/Ajax/Skins/Default/loading2.gif" />
</telerik:RadAjaxLoadingPanel>
    

    <telerik:RadAjaxManagerProxy ID="RadAjaxManagerProxy1" runat="server" >
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="btnChangeModeBack">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="lblTextAreaHtml" LoadingPanelID="Ajaxloadingpanel1" />
                    <telerik:AjaxUpdatedControl ControlID="txtTextAreaId" />
                    <telerik:AjaxUpdatedControl ControlID="divCancelBtn" />
                    <telerik:AjaxUpdatedControl ControlID="divEditBtn" />
                    <telerik:AjaxUpdatedControl ControlID="divSaveBtn" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="btnChangeMode">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="lblTextAreaHtml" LoadingPanelID="Ajaxloadingpanel1" />
                    <telerik:AjaxUpdatedControl ControlID="txtTextAreaId" />
                    <telerik:AjaxUpdatedControl ControlID="divCancelBtn" />
                    <telerik:AjaxUpdatedControl ControlID="divEditBtn" />
                    <telerik:AjaxUpdatedControl ControlID="divSaveBtn" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="btnRefresh">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="lblTextAreaHtml" LoadingPanelID="Ajaxloadingpanel1" />
                    <telerik:AjaxUpdatedControl ControlID="txtTextAreaId" />
                    <telerik:AjaxUpdatedControl ControlID="divCancelBtn" />
                    <telerik:AjaxUpdatedControl ControlID="divEditBtn" />
                    <telerik:AjaxUpdatedControl ControlID="divSaveBtn" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="btnSave">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="lblTextAreaHtml" LoadingPanelID="Ajaxloadingpanel1" />
                    <telerik:AjaxUpdatedControl ControlID="txtTextAreaId" />
                    <telerik:AjaxUpdatedControl ControlID="divCancelBtn" />
                    <telerik:AjaxUpdatedControl ControlID="divEditBtn" />
                    <telerik:AjaxUpdatedControl ControlID="divSaveBtn" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="btnCancel">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="lblTextAreaHtml" LoadingPanelID="Ajaxloadingpanel1" />
                    <telerik:AjaxUpdatedControl ControlID="txtTextAreaId" />
                    <telerik:AjaxUpdatedControl ControlID="divCancelBtn" />
                    <telerik:AjaxUpdatedControl ControlID="divEditBtn" />
                    <telerik:AjaxUpdatedControl ControlID="divSaveBtn" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManagerProxy>--%>

</div>