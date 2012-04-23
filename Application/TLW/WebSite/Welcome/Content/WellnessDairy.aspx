<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WellnessDairy.aspx.cs" Inherits="Welcome_Content_WellnessDairy" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>
<%@ Register Src="~/Controls/UC_TextArea.ascx" TagName="UC_TextArea" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Wellness Dairy</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div style="width: 100%;">
        <center class="Round5">
            <center>
                <center>
                    <center>
                        <center>
                            <center>
                                <center>
                                    <center>
                                        <center>
                                            <center>
                                                <table class="Round5_tblHeader">
                                                    <tr>
                                                        <td>
                                                            Wellness Dairy
                                                        </td>
                                                        <td style="text-align: right;">
                                                        </td>
                                                    </tr>
                                                </table>
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
        <div class="demoContent" style="padding: 0px 15px 15px 15px;">
            <table>
                <tr>
                    <td>
                        <uc1:UC_TextArea ID="UC_TextArea1" runat="server" TEXTAREA_NAME="WellnessDairy" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div style="width: 100%;">
        <%--   <center class="Round5">
            <center>
                <center>
                    <center>
                        <center>
                            <center>
                                <center>
                                    <center>
                                        <center>
                                            <center>
                                                <table class="Round5_tblHeader">
                                                    <tr>
                                                        <td>
                                                           Wellness Diary
                                                        </td>
                                                        <td style="text-align: right;">
                                                        </td>
                                                    </tr>
                                                </table>
                                            </center>
                                        </center>
                                    </center>
                                </center>
                            </center>
                        </center>
                    </center>
                </center>
            </center>
        </center>--%>
        <div class="demoContent" style="padding: 0px 15px 15px 15px;">
            <table cellpadding="4" cellspacing="4">
                <tr>
                    <td align="right" colspan="2">
                        <input style="height: 30px;" type="button" class="aButtonSmall" value="Close" onclick="javascript:window.close();" />
                    </td>
                </tr>
                <tr style="height: 30px;">
                    <td align="right" valign="top">
                        Quality of Sleep – How would you rate the quality of your sleep last night?:&nbsp;&nbsp;
                    </td>
                    <td align="left" valign="top">
                        <asp:DropDownList ID="ddlQualitySleep" runat="server" CssClass="txtBox">
                            <asp:ListItem Value="1" Text="Very Poor"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Poor"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Fair"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Good"></asp:ListItem>
                            <asp:ListItem Value="5" Text="Very Good"></asp:ListItem>
                            <asp:ListItem Value="6" Text="Excellent"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr style="height: 30px;">
                    <td align="right" valign="top">
                        Level of Stress – How would you rate your current level of stress?:&nbsp;&nbsp;
                    </td>
                    <td align="left" valign="top">
                        <asp:DropDownList ID="ddlLevel" runat="server" CssClass="txtBox">
                            <asp:ListItem Value="1" Text="Extremely Stressed"></asp:ListItem>
                            <asp:ListItem Value="2" Text="High stress"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Some stress"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Moderate/average stress"></asp:ListItem>
                            <asp:ListItem Value="5" Text="Low stress"></asp:ListItem>
                            <asp:ListItem Value="6" Text="Very low/none"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr style="height: 30px;">
                    <td align="right" valign="top">
                        Outlook on Life – How would you describe your perspective or state of happiness?:&nbsp;&nbsp;
                    </td>
                    <td align="left" valign="top">
                        <asp:DropDownList ID="ddloutlook" runat="server" CssClass="txtBox">
                            <asp:ListItem Value="1" Text="Pessimistic"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Distressed"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Concerned/Nervous"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Hopeful"></asp:ListItem>
                            <asp:ListItem Value="5" Text="Optimistic"></asp:ListItem>
                            <asp:ListItem Value="6" Text="Excited"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr style="height: 30px;">
                    <td align="right" valign="top">
                        Level of Engagement – How would you rate your level of productivity?:&nbsp;&nbsp;
                    </td>
                    <td align="left" valign="top">
                        <asp:DropDownList ID="ddlengagement" runat="server" CssClass="txtBox">
                            <asp:ListItem Value="1" Text="Negative"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Somewhat negative"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Average"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Somewhat positive"></asp:ListItem>
                            <asp:ListItem Value="5" Text="Positive"></asp:ListItem>
                            <asp:ListItem Value="6" Text="Very positive"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr style="height: 30px;">
                    <td align="right" valign="top">
                        Energy Level – How much energy do you have today?:&nbsp;&nbsp;
                    </td>
                    <td align="left" valign="top">
                        <asp:DropDownList ID="ddlenergylevel" runat="server" CssClass="txtBox">
                            <asp:ListItem Value="1" Text="None, or not too much"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Feel sluggish or somewhat tired"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Average"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Enough to accomplish what I need to do today"></asp:ListItem>
                            <asp:ListItem Value="5" Text="I have a lot of energy"></asp:ListItem>
                            <asp:ListItem Value="6" Text="I am full of energy"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td align="left" valign="bottom">
                        <asp:LinkButton CssClass="aButtonSmall" ToolTip="Click here to submit " CausesValidation="true"
                            ValidationGroup="CreateUserWizard1" Width="65" ID="lnkBtnSearch" runat="server"
                            OnClick="lnkBtnSearch_Click">Submit</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Label ID="lblMsg" runat="server" CssClass="required"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div>
        <div id="MainPlaceHolder">
            <div id="ChartArea">
                <div id="chartPlaceholder">
                    <telerik:RadChart ID="RadChart1" SkinsOverrideStyles="true" Height="500" runat="server"
                        Palette="Colorful" ShadowColor="180, 0, 0, 0" Width="900px" style="margin:0px auto;" Margins-Left="25px"
                        Margins-Right="105px">
                        <PlotArea>
                            <XAxis MaxValue="5" MinValue="1" Step="1">
                            </XAxis>
                            <YAxis MaxValue="3" Step="0.5" AxisMode="Extended">
                            </YAxis>
                            <YAxis2 MaxValue="5" MinValue="1" Step="1">
                            </YAxis2>
                        </PlotArea>
                        <Series>
                            <telerik:ChartSeries Name="Monday" Appearance-FillStyle-FillType="Solid" Appearance-FillStyle-MainColor="#4572a7">
                                <Appearance BarWidthPercent="80">
                                    <FillStyle MainColor="#4572a7">
                                    </FillStyle>
                                </Appearance>
                                <Items>
                                    <telerik:ChartSeriesItem YValue="1" Name="Item 1">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="2" Name="Item 2">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="1" Name="Item 3">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="3" Name="Item 4">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="2" Name="Item 5">
                                    </telerik:ChartSeriesItem>
                                </Items>
                            </telerik:ChartSeries>
                            <telerik:ChartSeries Name="Tuesday" Appearance-FillStyle-FillType="Solid" Appearance-FillStyle-MainColor="#aa4643">
                                <Appearance BarWidthPercent="80">
                                    <FillStyle MainColor="#aa4643">
                                    </FillStyle>
                                </Appearance>
                                <Items>
                                    <telerik:ChartSeriesItem YValue="3" Name="Item 1">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="1" Name="Item 2">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="3" Name="Item 3">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="1" Name="Item 4">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="2" Name="Item 5">
                                    </telerik:ChartSeriesItem>
                                </Items>
                            </telerik:ChartSeries>
                            <telerik:ChartSeries Name="Wednesday" Appearance-FillStyle-FillType="Solid" Appearance-FillStyle-MainColor="#89a54e">
                                <Appearance BarWidthPercent="80">
                                    <FillStyle MainColor="#89a54e">
                                    </FillStyle>
                                </Appearance>
                                <Items>
                                    <telerik:ChartSeriesItem YValue="3" Name="Item 1">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="1" Name="Item 2">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="3" Name="Item 3">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="1" Name="Item 4">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="2" Name="Item 5">
                                    </telerik:ChartSeriesItem>
                                </Items>
                            </telerik:ChartSeries>
                            <telerik:ChartSeries Name="Thursday" Appearance-FillStyle-FillType="Solid" Appearance-FillStyle-MainColor="#71588f">
                                <Appearance BarWidthPercent="80">
                                    <FillStyle MainColor="#71588f">
                                    </FillStyle>
                                </Appearance>
                                <Items>
                                    <telerik:ChartSeriesItem YValue="3" Name="Item 1">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="1" Name="Item 2">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="3" Name="Item 3">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="1" Name="Item 4">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="2" Name="Item 5">
                                    </telerik:ChartSeriesItem>
                                </Items>
                            </telerik:ChartSeries>
                            <telerik:ChartSeries Name="Friday">
                                <Appearance BarWidthPercent="80">
                                    <FillStyle MainColor="#4198af">
                                    </FillStyle>
                                </Appearance>
                                <Items>
                                    <telerik:ChartSeriesItem YValue="3" Name="Item 1">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="1" Name="Item 2">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="3" Name="Item 3">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="1" Name="Item 4">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="2" Name="Item 5">
                                    </telerik:ChartSeriesItem>
                                </Items>
                            </telerik:ChartSeries>
                            <telerik:ChartSeries Name="Saturday" Appearance-FillStyle-FillType="Solid" Appearance-FillStyle-MainColor="#db843d">
                                <Appearance BarWidthPercent="80">
                                    <FillStyle MainColor="#db843d">
                                    </FillStyle>
                                </Appearance>
                                <Items>
                                    <telerik:ChartSeriesItem YValue="3" Name="Item 1">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="1" Name="Item 2">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="3" Name="Item 3">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="1" Name="Item 4">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="2" Name="Item 5">
                                    </telerik:ChartSeriesItem>
                                </Items>
                            </telerik:ChartSeries>
                            <telerik:ChartSeries Name="Sunday" Appearance-FillStyle-FillType="Solid" Appearance-FillStyle-MainColor="#93a9cf">
                                <Appearance BarWidthPercent="80">
                                    <FillStyle MainColor="#93a9cf">
                                    </FillStyle>
                                </Appearance>
                                <Items>
                                    <telerik:ChartSeriesItem YValue="3" Name="Item 1">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="1" Name="Item 2">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="3" Name="Item 3">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="1" Name="Item 4">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="2" Name="Item 5">
                                    </telerik:ChartSeriesItem>
                                </Items>
                            </telerik:ChartSeries>
                            <telerik:ChartSeries Name="Average" Appearance-FillStyle-FillType="Solid" Appearance-FillStyle-MainColor="#d19392">
                                <Appearance BarWidthPercent="80">
                                    <FillStyle MainColor="#d19392">
                                    </FillStyle>
                                </Appearance>
                                <Items>
                                    <telerik:ChartSeriesItem YValue="3" Name="Item 1">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="1" Name="Item 2">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="3" Name="Item 3">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="1" Name="Item 4">
                                    </telerik:ChartSeriesItem>
                                    <telerik:ChartSeriesItem YValue="2" Name="Item 5">
                                    </telerik:ChartSeriesItem>
                                </Items>
                            </telerik:ChartSeries>
                        </Series>
                    </telerik:RadChart>
                </div>
            </div>
            <%-- <div id="ThumbsArea">
<asp:RadioButtonList ID="ThumbsList" AutoPostBack="true" runat="server" RepeatColumns="3"
RepeatDirection="Horizontal" OnSelectedIndexChanged="ThumbsList_SelectedIndexChanged">
                </asp:RadioButtonList>
            </div>--%>
        </div>
     
     <%--    <telerik:Footer ShowCodeViewer="true" runat="server" ID="Footer1"></telerik:Footer>--%>

                                                                <div style="text-align:center" >
                                                                    <asp:GridView ID="GVdiary" AllowSorting="true" AutoGenerateColumns="False" runat="server" EmptyDataText="<br /><br />No Record Found.<br /><br />"
                                                                        EmptyDataRowStyle-CssClass="required" EmptyDataRowStyle-HorizontalAlign="Center"
                                                                        Width="700px" style="margin:0px auto;" PagerStyle-CssClass="paging" CellPadding="4" border="0" GridLines="None"
                                                                        ForeColor="#333333" OnRowDataBound="GVdiary_RowDataBound" 
                                                                        ShowFooter="true">
                                                                        <PagerStyle CssClass="paging" BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center">
                                                                        </PagerStyle>
                                                                        <RowStyle CssClass="gridItem" BackColor="#EFF3FB" />
                                                                        <EditRowStyle BackColor="#2461BF" />
                                                                        <EmptyDataRowStyle HorizontalAlign="Center" CssClass="required"></EmptyDataRowStyle>
                                                                        <FooterStyle  Font-Bold="True" BorderStyle="None"   HorizontalAlign="Left" />
                                                                        <HeaderStyle CssClass="gridHeader" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <AlternatingRowStyle CssClass="gridAltItem" BackColor="White" />
                                                                        <Columns>
                                                                           <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                <ItemTemplate>
                                                                                   <asp:Label ID="lblweekname" runat="server"></asp:Label>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                                            </asp:TemplateField>

                                                                             <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" 
                                                                                ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Left">
                                                                                <ItemTemplate>
                                                                                
                                                                                    <%#AppLib.GetSubString(Eval("Day").ToString(), 40)%>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle HorizontalAlign="Left" Height="30px"></HeaderStyle>
                                                                                <ItemStyle HorizontalAlign="Left" Height="30px"></ItemStyle>
                                                                            </asp:TemplateField>

                                                                            <asp:TemplateField Visible="true" ItemStyle-HorizontalAlign="Center"  HeaderText="Sleep" HeaderStyle-HorizontalAlign="Center">
                                                                                <ItemTemplate >
                                                                                   <asp:Label ID="lblslep" runat="server" Visible="false" Text='<%#Eval("Sleep") %>'></asp:Label>
                                                                                    <%#AppLib.GetSubString(Eval("Sleep").ToString(), 30)%>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle HorizontalAlign="Left" Height="30px"></HeaderStyle>
                                                                                <ItemStyle HorizontalAlign="Left" Height="30px"></ItemStyle>
                                                                                <FooterTemplate>
                                                                                  <asp:Label ID="lblTotalsleep" runat="server" />
                                                                                     </FooterTemplate> 
                                                                            </asp:TemplateField>
                                                                           
                                                                            <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Stress"
                                                                                ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Left">
                                                                                <ItemTemplate>
                                                                                  <asp:Label ID="lblstres" runat="server" Visible="false" Text='<%#Eval("Stress") %>'></asp:Label>
                                                                                    <%#AppLib.GetSubString(Eval("Stress").ToString(), 40)%>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle HorizontalAlign="Left" Height="30px"></HeaderStyle>
                                                                                <ItemStyle HorizontalAlign="Left" Height="30px"></ItemStyle>
                                                                                <FooterTemplate>
                                                                                 <asp:Label ID="lblTotalstress" runat="server" />
                                                                                     </FooterTemplate> 
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Outlook"
                                                                                ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Left">
                                                                                <ItemTemplate>
                                                                                    <%#AppLib.GetSubString(Eval("Outlook").ToString(), 40)%>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle HorizontalAlign="Left" Height="30px"></HeaderStyle>
                                                                                <ItemStyle HorizontalAlign="Left" Height="30px"></ItemStyle>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Engagement"
                                                                                ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                <ItemTemplate>
                                                                                    <%#AppLib.GetSubString(Eval("Engagement").ToString(), 40)%>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle HorizontalAlign="Center" Height="30px"></HeaderStyle>
                                                                                <ItemStyle HorizontalAlign="Center" Height="30px"></ItemStyle>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Energy"
                                                                                ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                <ItemTemplate>
                                                                                    <%#AppLib.GetSubString(Eval("Energy").ToString(), 40)%>
                                                                                </ItemTemplate>
                                                                                <HeaderStyle HorizontalAlign="Center" Height="30px"></HeaderStyle>
                                                                                <ItemStyle HorizontalAlign="Center" Height="30px"></ItemStyle>
                                                                           
                                                                            </asp:TemplateField>
                                                                         <%-- <asp:TemplateField >
                                                                            <FooterTemplate>
                                                                           <div >
                                                                             <span style="float:left">Average: </span>
                                                                                 </div>
                                                                                
                                                                            </FooterTemplate>
                                                                            </asp:TemplateField>--%>
                                                                           

                                                                        </Columns>
                                                                        
                                                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                                                    </asp:GridView>
                                                                </div>
                                                           
        </div>
  
    </form>
</body>
</html>
