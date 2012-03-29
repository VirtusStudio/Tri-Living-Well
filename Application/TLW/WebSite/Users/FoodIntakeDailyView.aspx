<%@ Page Title="Food Intake Daily View" Language="C#" MasterPageFile="~/MasterPages/User.master"
    AutoEventWireup="true" CodeFile="FoodIntakeDailyView.aspx.cs" Inherits="Users_FoodIntakeDailyView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  <table>
   <tr>
        <td align="left">
            <table class="title">
                <tr>
                    <td align="left">
                     Daily View of Food Intake
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td align="right">
            <a class="aButtonSmall" href="javascript:history.back();">Back</a>
        </td>
    </tr>
    <tr><td>
      <asp:DataList ID="DLFILob" AutoGenerateColumns="False" runat="server" EmptyDataText="<br /><br />No Log Found.<br /><br />"
        EmptyDataRowStyle-CssClass="required" EmptyDataRowStyle-HorizontalAlign="Center"
         AllowPaging="false" AllowSorting="false" PagerStyle-CssClass="paging"
        RepeatColumns="4" RepeatDirection="Horizontal" CellSpacing="4" CellPadding="4"
         GridLines="Both" Width="40%" BorderWidth="0">
        <ItemTemplate>
            <table class="tblItems" align="left" border="1">
                <tr class="trAlt">
                    <td>
                        Date
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 10px;">
                        <%#Convert.ToDateTime(Eval("dtFoodIntakeDate")).ToString("MM/dd/yyyy")%>
                    </td>
                </tr>
                <tr class="trAlt">
                    <td>
                        Calorie
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 10px;">
                        <%#Eval("IntCalorie")%>
                    </td>
                </tr>
                <tr class="trAlt">
                    <td>
                        Milk
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 10px;">
                        <%#GetSplitedDetailsofActivity(Eval("StrMilkDetails").ToString())%>
                    </td>
                </tr>
                <tr class="trAlt">
                    <td>
                        Fruit
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 10px;">
                    <%#GetSplitedDetailsofActivity(Eval("StrFruitDetails").ToString())%>
                        
                    </td>
                </tr>
                <tr class="trAlt">
                    <td>
                        Vegetables
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 10px;">
                      <%#GetSplitedDetailsofActivity(Eval("StrVegetablesDetails").ToString())%>
                        
                    </td>
                </tr>
                <tr class="trAlt">
                    <td>
                        Starch
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 10px;">
                        <%#GetSplitedDetailsofActivity(Eval("StrStarchDetails").ToString())%>
                        
                    </td>
                </tr>
                <tr class="trAlt">
                    <td>
                        Protein
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 10px;">
                      <%#GetSplitedDetailsofActivity(Eval("StrProteinDetails").ToString())%>
                        
                    </td>
                </tr>
                <tr class="trAlt">
                    <td>
                        FAT
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 10px;">
                    <%#GetSplitedDetailsofActivity(Eval("StrFATDetails").ToString())%>
                        
                    </td>
                </tr>
                <tr class="trAlt">
                    <td>
                        Water
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 10px;">
                        <%#GetSplitedDetailsofActivity(Eval("StrWaterDetails").ToString())%>
                    </td>
                </tr>
                <tr class="trAlt">
                    <td>
                        Created On
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 10px;">
                         <%# Convert.ToDateTime(Eval("DtFoodIntakeDate")).ToString("MM/dd/yyyy")%>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    </td></tr>
  </table>
</asp:Content>
