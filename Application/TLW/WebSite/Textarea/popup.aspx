<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PopUp.aspx.cs" Inherits="PopUp" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<link href="../welcome/Styles/Corporate_text.css" rel="stylesheet" type="text/css" />
<link href="../Styles/Main.css" rel="stylesheet" type="text/css" />
<link href="../Styles/centerRound1.css" rel="stylesheet" type="text/css" />

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Popup</title>
    
<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
<script type="text/javascript">

function Cancel()//
{
    //window.opener.popUpClosing();
    window.close();
}

function init()
{
    window.focus();
}

function UpdateWindowOpener()
{ 
    if(document.getElementById('txtSuccess').value == "1")
    {
        
        window.opener.document.getElementById('<%= txtBtnRefreshID.Text%>').click();
        //window.opener.popUpClosing();
        window.close();
    }
}

</script>
<script type="text/javascript">
    var gbIsPostBack = false;
    function Page_Load()//
    {
        if (!gbIsPostBack)//
        {
            gbIsPostBack = true;
            init();
            window.opener.popUpOpening();
        }

        if (document.getElementById('txtSuccess').value == "1")//
        {
            UpdateWindowOpener();
        }
    }
</script>
</telerik:RadScriptBlock>
</head>
<body onunload="javascript:UpdateWindowOpener()">
    <form id="form1" runat="server">
    
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
      
<script type="text/javascript">
    Sys.Application.add_load(Page_Load);
</script> 
<div class="title">
Text Area Editor
</div>
            <center class="Round1"><center><center><center><center><center><center><center><center><center>

        <div style="width:1250px; height:850px;">
        <asp:Label ID="lblTextAreaName" class="subTitle" runat="server"></asp:Label>
                <telerik:RadEditor ID="RadEditor1" runat="server"  Height="850px" Width="1250px" Style="overflow:scroll;"  ImageManager-MaxUploadFileSize="2100000" DocumentManager-MaxUploadFileSize="2100000"  >
                    <Content></Content>
                </telerik:RadEditor>
             </div>
        <br />
        <br /><br />
             <a href="javascript:document.getElementById('btnSubmit').click();" class="aButton" >Preview</a>&nbsp;&nbsp;
             <a href="javascript:Cancel();" class="aButton" >Cancel</a>
    <div style="display:none;">
        <br />
        <br />
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" onclick="btnSubmit_Click" />
        txtSuccess: <asp:TextBox ID="txtSuccess" runat="server"></asp:TextBox>
        txtBtnRefreshID: <asp:TextBox ID ="txtBtnRefreshID" runat="server"></asp:TextBox>
    </div>
    
            </center></center></center></center></center></center></center></center></center></center>
    
     <telerik:RadAjaxManager id="RadAjaxManager1" runat="server" UpdatePanelsRenderMode="Inline">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="btnSubmit">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="txtSuccess" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
         </telerik:RadAjaxManager>
    </form>
</body>
</html>
