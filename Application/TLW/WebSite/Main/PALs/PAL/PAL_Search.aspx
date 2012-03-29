<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PAL_Search.aspx.cs" Inherits="Report_SlideCommnets" %>



<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../../../Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="../../../Styles/centerRound2.css" rel="stylesheet" type="text/css" />
    <link href="../../../Styles/Table.css" rel="stylesheet" type="text/css" />
    <link href="../../../Styles/Grid.css" rel="stylesheet" type="text/css" />
    
<style type="text/css">
.rgCollapse{display:none;}
.GroupHeader_Default p{color:black;border-bottom:solid 1px black;font-size:12px;font-style:italic;}
</style>

<script type="text/javascript">
function grid(iMonthIndex)
{
    document.getElementById('txtMonth').value = iMonthIndex;
    document.getElementById('btnMonth').click();
}
</script>


    <link href="/Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/BGT_Text_Arial.css" rel="stylesheet" type="text/css" />

</head>
<body class="body2">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
<table>
<tr><td>&nbsp</td>
 <td class="top" style="text-align:right; white-space:nowrap;"><div style="display:block; "><img src="../../../images/icons/iconXls.gif" />&nbsp;<asp:LinkButton ID="lbExcel2003" runat="server" OnClick="lbExcel2003_Click">Export as pre-2007</asp:LinkButton>&nbsp;|&nbsp;<img src="../../../images/icons/iconXlsx.gif" />&nbsp;<asp:LinkButton ID="lbExcel2007" runat="server" OnClick="lbExcel2007_Click">Export as 2007</asp:LinkButton></div></td>
</tr>
<tr>
    <td style="white-space:nowrap;" ><img src="../../../images/icons/iconSurveyAnswers.gif" /> <span class="title">Slide Comments</span></td>
    <td  style="text-align:left; width:100%; padding-left:15px;"><asp:Label ID="lblError" CssClass="required" runat="server" Text="" Visible="false"></asp:Label></td>
   
</tr>
</table>




<div id="divMonths" class="divBorder" style="text-align:center;padding: 2px 2px 2px 2px;" >
        <table border="1" id="tblMonths">
            <tr>
                <td style="width:110px;" class="txtSmall">
                    <div style="white-space:nowrap;">Yearly Summary
                        <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="False" ></asp:DropDownList>
                    </div>
                </td>

                <td><a class="aButton" href="javascript:grid(1);">Jan</a></td>
                <td><a class="aButton" href="javascript:grid(2);">Feb</a></td>
                <td><a class="aButton" href="javascript:grid(3);">Mar</a></td>
                <td><a class="aButton" href="javascript:grid(4);">Apr</a></td>
                <td><a class="aButton" href="javascript:grid(5);">May</a></td>
                <td><a class="aButton" href="javascript:grid(6);">Jun</a></td>
                <td><a class="aButton" href="javascript:grid(7);">Jul</a></td>
                <td><a class="aButton" href="javascript:grid(8);">Aug</a></td>
                <td><a class="aButton" href="javascript:grid(9);">Sep</a></td>
                <td><a class="aButton" href="javascript:grid(10);">Oct</a></td>
                <td><a class="aButton" href="javascript:grid(11);">Nov</a></td>
                <td><a class="aButton" href="javascript:grid(12);">Dec</a></td>
                <td><a class="aButton" href="javascript:document.getElementById('btnAll').click();">Total Events</a></td>
            </tr>
        </table>
        </div>

<br />

        <table>
            <tr>
                <td>
                    <span class="subTitle">Search Results:</span> <asp:Label ID="lblAll" runat="server"></asp:Label>
            
                </td>
                <td style="text-align:right; white-space:nowrap;">
                <table class="small">
                    <tr>
                        <td>
                              From:&nbsp;<telerik:raddatepicker id="rdpDateStart" runat="server" Width="130px">
                                   <calendar ID="Calendar1" runat="server" ShowRowHeaders="False" TitleFormat="MMM yyyy"></calendar>
                              
                                </telerik:raddatepicker>
                        </td>
                        <td>
                            To: &nbsp;<telerik:raddatepicker id="rdpDateEnd" runat="server" Width="130px">
                                <calendar ID="Calendar2" runat="server" ShowRowHeaders="False" TitleFormat="MMM yyyy"></calendar>
                             </telerik:raddatepicker>
                        </td>
                        <td>
                            <a class="aButton" href="javascript:document.getElementById('btnSubmit').click();">Search</a>
                        </td>
                    </tr>
                </table>
                <div >  
                              
                    </div>
                       
                       
                </td>
            </tr>
        </table>







<br />
<span class="small">*Search for Comments by the date they were last modified.</span>
<center class="Round2"><center><center><center><center><center><center><center><center><center>
<telerik:RadGrid AllowSorting="true" EnableEmbeddedSkins="False"  id="RadGrid1" runat="server" 
                 BorderWidth="0px" AutoGenerateColumns="False" GridLines="None" onsortcommand="RadGrid1_SortCommand">
<mastertableview>         
    <Columns>
         <telerik:GridTemplateColumn HeaderText="Date"  SortExpression="PAL_ENTRY_DATE" HeaderStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <%# DataBinder.Eval(Container.DataItem, "PAL_ENTRY_DATE").ToString()%>
            </ItemTemplate>
         </telerik:GridTemplateColumn> 
         <telerik:GridTemplateColumn HeaderText="Activity Type"  SortExpression="PAL_ENTRY_TYPE" HeaderStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <%# DataBinder.Eval(Container.DataItem, "PAL_ENTRY_TYPE").ToString()%>
            </ItemTemplate>
         </telerik:GridTemplateColumn> 
         <telerik:GridTemplateColumn HeaderText="PAL_ENTRY_INTENSITY_TEXT"  SortExpression="PAL_ENTRY_INTENSITY_TEXT" HeaderStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <%# DataBinder.Eval(Container.DataItem, "PAL_ENTRY_DATE").ToString()%>
            </ItemTemplate>
         </telerik:GridTemplateColumn> 
         <telerik:GridTemplateColumn HeaderText="Duration"  SortExpression="PAL_ENTRY_DATE" HeaderStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <%# DataBinder.Eval(Container.DataItem, "PAL_ENTRY_DATE").ToString()%>
            </ItemTemplate>
         </telerik:GridTemplateColumn> 
         <telerik:GridTemplateColumn HeaderText="Intensity"  SortExpression="PAL_ENTRY_DATE" HeaderStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <%# DataBinder.Eval(Container.DataItem, "PAL_ENTRY_DATE").ToString()%>
            </ItemTemplate>
         </telerik:GridTemplateColumn> 
         <telerik:GridTemplateColumn HeaderText="Equivalent Met"  SortExpression="MET_EQUIVALENT" HeaderStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <%# DataBinder.Eval(Container.DataItem, "MET_EQUIVALENT").ToString()%>
            </ItemTemplate>
         </telerik:GridTemplateColumn> 
         <telerik:GridTemplateColumn HeaderText="Comment"  SortExpression="PAL_ENTRY_DATE" HeaderStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <%# DataBinder.Eval(Container.DataItem, "PAL_ENTRY_DATE").ToString()%>
            </ItemTemplate>
         </telerik:GridTemplateColumn> 
     </Columns>
    <HeaderStyle CssClass="gridHeader" />
    <ItemStyle CssClass="gridItem" />
    <AlternatingItemStyle CssClass="gridAltItem" />

</mastertableview>
</telerik:RadGrid>   
</center></center></center></center></center></center></center></center></center></center>



  <span style="visibility:hidden;">
  <br />
     <asp:TextBox ID="txtMonth" runat="server"></asp:TextBox>
        <asp:Button ID="btnMonth" runat="server" OnClick="btnMonth_Click"  />
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" />
        <asp:Button ID="btnAll" runat="server" OnClick="btnAll_Click"  />
    </span>
    
    </form>
</body>
</html>
