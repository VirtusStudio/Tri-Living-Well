<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyProgram_Exercises.aspx.cs" Inherits="MyProgram_Exercises" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <%--<link href="/Styles/Main.css" rel="stylesheet" type="text/css" />Line is commented by Netsmartz--%>
<script type="text/javascript">
function Init()
{
    window.focus();
}
</script>

</head>
<body onload="Init();" class="body2">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
<a name="0"></a>

<div style="text-align:right;padding-right:100px;"><a href="javascript:window.print();"><img src="../../images/icons/iconPrint.gif" /> Print</a></div><br />
<br />
    
<telerik:RadGrid EnableEmbeddedSkins="False" id="RadGrid1" runat="server" BorderWidth="0px" AutoGenerateColumns="False" GridLines="None" 
                OnItemDataBound="RadGrid1_ItemDataBound">
    <mastertableview>         
        <Columns>
            <telerik:GridBoundColumn Visible="False" DataField="EXERCISE_ID" UniqueName="EXERCISE_ID"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn Visible="False" DataField="NAME" UniqueName="NAME"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn Visible="False" DataField="IMAGE1" UniqueName="IMAGE1"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn Visible="False" DataField="IMAGE2" UniqueName="IMAGE2"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn Visible="False" DataField="HTML_TEXT" UniqueName="HTML_TEXT"></telerik:GridBoundColumn>
             
             <telerik:GridTemplateColumn HeaderText="Exercises" HeaderStyle-HorizontalAlign="Left" HeaderStyle-CssClass="title" UniqueName="tcCustom">
                <ItemTemplate>
                    
                </ItemTemplate>
             </telerik:GridTemplateColumn> 
         </Columns>
    </mastertableview>
</telerik:RadGrid>   

<telerik:RadGrid EnableEmbeddedSkins="False" id="RadGrid2" runat="server" BorderWidth="0px" AutoGenerateColumns="False" GridLines="None" 
                OnItemDataBound="RadGrid2_ItemDataBound">
    <mastertableview>         
        <Columns>
            <telerik:GridBoundColumn Visible="False" DataField="EXERCISE_ID" UniqueName="EXERCISE_ID"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn Visible="False" DataField="NAME" UniqueName="NAME"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn Visible="False" DataField="IMAGE1" UniqueName="IMAGE1"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn Visible="False" DataField="IMAGE2" UniqueName="IMAGE2"></telerik:GridBoundColumn>
            <telerik:GridBoundColumn Visible="False" DataField="HTML_TEXT" UniqueName="HTML_TEXT"></telerik:GridBoundColumn>
             
             <telerik:GridTemplateColumn HeaderText="Excersie Details" HeaderStyle-CssClass="title" HeaderStyle-HorizontalAlign="Left" UniqueName="tcCustom">
                <ItemTemplate>
                    
                </ItemTemplate>
             </telerik:GridTemplateColumn> 
         </Columns>
    </mastertableview>
</telerik:RadGrid>   


    </form>
</body>
</html>
