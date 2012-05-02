<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/User.master"
    CodeFile="WellnessDiary.aspx.cs" Inherits="WellnessDiary" Title="Wellness Diary" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>
<%@ Register Src="~/Controls/UC_TextArea.ascx" TagName="UC_TextArea" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../Scripts/Common.js" type="text/javascript"></script>
    <script type="text/javascript">
        function popupOpen(path, x, y) {
            var sURL = path;
            var features = 'toolbar=0,location=0,status=1,menubar=0,scrollbars=1,resizable=1,width=' + x + ',height=' + y + ',left=' + top.window.screenLeft + ',top=' + top.window.screenTop;
            var windownew = window.open(sURL, "new_window", features);
            try { windownew.focus(); } catch (err) { }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <iframe id="IFRAME_CONTENT" name="IFRAME_CONTENT" class="IFRAME_CONTENT" runat="server"
        frameborder="0" style="display:none;" src="Content/Home.aspx"></iframe>

<div style="background: none repeat scroll 0% 0% rgb(255, 255, 255);   margin: 0px auto; padding: 10px; width:886px; overflow:hidden;" >
    <div class="demoContent" style="padding: 0px 15px 15px 15px;">
        <table>
            <tr>
                <td>
                    <uc1:UC_TextArea ID="UC_TextArea1" runat="server" TEXTAREA_NAME="WellnessDairy" />
                </td>
            </tr>
        </table>
    </div>

    <div style="width: 100%;">
        <div class="demoContent" style="padding: 0px 15px 15px 15px;">
            <table cellpadding="4" cellspacing="4">
                <tr style="height: 30px;">
                    <td align="left" valign="top">
                        <h3>How would you rate the quality of your sleep last night?</h3>&nbsp;&nbsp;
                    </td>
                    <td align="left" valign="top"><h3>
                            <asp:DropDownList ID="ddlQualitySleep" runat="server" CssClass="txtBox">
                            <asp:ListItem Value="0" Text="Quality of Sleep"></asp:ListItem>
                            <asp:ListItem Value="6" Text="Excellent"></asp:ListItem>
                            <asp:ListItem Value="5" Text="Very Good"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Good"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Fair"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Poor"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Very Poor"></asp:ListItem>
                        </asp:DropDownList></h3>
                    </td>
                </tr>
                <tr style="height: 30px;">
                    <td align="left" valign="top">
                        <h3>How would you rate your current level of stress?</h3>&nbsp;&nbsp;
                    </td>
                    <td align="left" valign="top"><h3>
                        <asp:DropDownList ID="ddlLevel" runat="server" CssClass="txtBox">
                            <asp:ListItem Value="0" Text="Level of Stress"></asp:ListItem>
                            <asp:ListItem Value="6" Text="Very low/none"></asp:ListItem>
                            <asp:ListItem Value="5" Text="Low stress"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Moderate/average stress"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Some stress"></asp:ListItem>
                            <asp:ListItem Value="2" Text="High stress"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Extremely Stressed"></asp:ListItem>
                        </asp:DropDownList></h3>
                    </td>
                </tr>
                <tr style="height: 30px;">
                    <td align="left" valign="top">
                        <h3>How would you describe your perspective or state of happiness?</h3>&nbsp;&nbsp;
                    </td>
                    <td align="left" valign="top"><h3>
                        <asp:DropDownList ID="ddloutlook" runat="server" CssClass="txtBox">
                            <asp:ListItem Value="0" Text="State of Happiness"></asp:ListItem>
                            <asp:ListItem Value="6" Text="Excited"></asp:ListItem>
                            <asp:ListItem Value="5" Text="Optimistic"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Hopeful"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Concerned/Nervous"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Distressed"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Pessimistic"></asp:ListItem>
                        </asp:DropDownList></h3>
                    </td>
                </tr>
                <tr style="height: 30px;">
                    <td align="left" valign="top">
                        <h3>How would you rate your level of productivity?</h3>&nbsp;&nbsp;
                    </td>
                    <td align="left" valign="top"><h3>
                        <asp:DropDownList ID="ddlengagement" runat="server" CssClass="txtBox">
                            <asp:ListItem Value="0" Text="Level of Productivity"></asp:ListItem>
                            <asp:ListItem Value="6" Text="Very positive"></asp:ListItem>
                            <asp:ListItem Value="5" Text="Positive"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Somewhat positive"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Average"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Somewhat negative"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Negative"></asp:ListItem>
                        </asp:DropDownList></h3>
                    </td>
                </tr>
                <tr style="height: 30px;">
                    <td align="left" valign="top">
                        <h3>How much energy do you have today?</h3>&nbsp;&nbsp;
                    </td>
                    <td align="left" valign="top"><h3>
                        <asp:DropDownList ID="ddlenergylevel" runat="server" CssClass="txtBox">
                            <asp:ListItem Value="0" Text="Energy Level"></asp:ListItem>
                            <asp:ListItem Value="6" Text="I am full of energy"></asp:ListItem>
                            <asp:ListItem Value="5" Text="I have a lot of energy"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Enough to accomplish what I need to do today"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Average"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Feel sluggish or somewhat tired"></asp:ListItem>
                            <asp:ListItem Value="1" Text="None, or not too much"></asp:ListItem>
                        </asp:DropDownList></h3>
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
   

    <div style="margin: 0px auto; width: 100%; text-align: center;">
        <asp:Chart ID="chart1" runat="server" BackColor="#f8c599"  Width="885px">
            <Titles>
                <asp:Title Visible="true" />
            </Titles>
            <Legends>
                <asp:Legend Name="DefaultLegend" Docking="Right" />
            </Legends>
            <Series>
                <asp:Series Name="Monday" YValueType="Int32" ChartType="Column" Color="#4572a7" ChartArea="MainChartArea"
                    IsValueShownAsLabel="true">
                    <Points>
                        <asp:DataPoint AxisLabel="Sleep" YValues="" />
                        <asp:DataPoint AxisLabel="Stress" YValues="" />
                        <asp:DataPoint AxisLabel="Outlook" YValues="" />
                        <asp:DataPoint AxisLabel="Engagement" YValues="" />
                        <asp:DataPoint AxisLabel="Energy" YValues="" />
                    </Points>
                </asp:Series>
                <asp:Series Name="Tuesday" YValueType="Int32" Color="#aa4643" ChartType="Column"
                    ChartArea="MainChartArea" IsValueShownAsLabel="true">
                    <Points>
                        <asp:DataPoint AxisLabel="Sleep" YValues="" />
                        <asp:DataPoint AxisLabel="Stress" YValues="" />
                        <asp:DataPoint AxisLabel="Outlook" YValues="" />
                        <asp:DataPoint AxisLabel="Engagement" YValues="" />
                        <asp:DataPoint AxisLabel="Energy" YValues="" />
                    </Points>
                </asp:Series>
                <asp:Series Name="Wednesday" YValueType="Int32" Color="#89a54e" ChartType="Column"
                    ChartArea="MainChartArea" IsValueShownAsLabel="true">
                    <Points>
                        <asp:DataPoint AxisLabel="Sleep" YValues="" />
                        <asp:DataPoint AxisLabel="Stress" YValues="" />
                        <asp:DataPoint AxisLabel="Outlook" YValues="" />
                        <asp:DataPoint AxisLabel="Engagement" YValues="" />
                        <asp:DataPoint AxisLabel="Energy" YValues="" />
                    </Points>
                </asp:Series>
                <asp:Series Name="Thursday" YValueType="Int32" Color="#71588f" ChartType="Column"
                    ChartArea="MainChartArea" IsValueShownAsLabel="true">
                    <Points>
                        <asp:DataPoint AxisLabel="Sleep" YValues="" />
                        <asp:DataPoint AxisLabel="Stress" YValues="" />
                        <asp:DataPoint AxisLabel="Outlook" YValues="" />
                        <asp:DataPoint AxisLabel="Engagement" YValues="" />
                        <asp:DataPoint AxisLabel="Energy" YValues="" />
                    </Points>
                </asp:Series>
                <asp:Series Name="Friday" YValueType="Int32" Color="#4198af" ChartType="Column" ChartArea="MainChartArea"
                    IsValueShownAsLabel="true">
                    <Points>
                        <asp:DataPoint AxisLabel="Sleep" YValues="" />
                        <asp:DataPoint AxisLabel="Stress" YValues="" />
                        <asp:DataPoint AxisLabel="Outlook" YValues="" />
                        <asp:DataPoint AxisLabel="Engagement" YValues="" />
                        <asp:DataPoint AxisLabel="Energy" YValues="" />
                    </Points>
                </asp:Series>
                <asp:Series Name="Saturday" YValueType="Int32" Color="#db843d" ChartType="Column"
                    ChartArea="MainChartArea" IsValueShownAsLabel="true">
                    <Points>
                        <asp:DataPoint AxisLabel="Sleep" YValues="" />
                        <asp:DataPoint AxisLabel="Stress" YValues="" />
                        <asp:DataPoint AxisLabel="Outlook" YValues="" />
                        <asp:DataPoint AxisLabel="Engagement" YValues="" />
                        <asp:DataPoint AxisLabel="Energy" YValues="" />
                    </Points>
                </asp:Series>
                <asp:Series Name="Sunday" YValueType="Int32" Color="#93a9cf" ChartType="Column" ChartArea="MainChartArea"
                    IsValueShownAsLabel="true">
                    <Points>
                        <asp:DataPoint AxisLabel="Sleep" YValues="" />
                        <asp:DataPoint AxisLabel="Stress" YValues="" />
                        <asp:DataPoint AxisLabel="Outlook" YValues="" />
                        <asp:DataPoint AxisLabel="Engagement" YValues="" />
                        <asp:DataPoint AxisLabel="Energy" YValues="" />
                    </Points>
                </asp:Series>
                <asp:Series Name="Average" YValueType="Int32" Color="#d19392" ChartType="Column"
                    ChartArea="MainChartArea" IsValueShownAsLabel="true">
                    <Points>
                        <asp:DataPoint AxisLabel="Sleep" YValues="" />
                        <asp:DataPoint AxisLabel="Stress" YValues="" />
                        <asp:DataPoint AxisLabel="Outlook" YValues="" />
                        <asp:DataPoint AxisLabel="Engagement" YValues="" />
                        <asp:DataPoint AxisLabel="Energy" YValues="" />
                    </Points>
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="MainChartArea" >
                    <AxisY>
                        <LabelStyle Enabled="true" />
                        <MajorGrid LineWidth="1" />
                        <MajorTickMark Enabled="false" />
                    </AxisY>
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        <div style="text-align: center;">
            <asp:GridView ID="GVdiary" AllowSorting="true" AutoGenerateColumns="False" runat="server"
                EmptyDataText="<br /><br />No Record Found.<br /><br />" EmptyDataRowStyle-CssClass="required"
                EmptyDataRowStyle-HorizontalAlign="Center" Width="885px" Style="margin: 0px auto;"
                PagerStyle-CssClass="paging" CellPadding="4" border="0" GridLines="None" ForeColor="#333333"
                OnRowDataBound="GVdiary_RowDataBound" ShowFooter="true">
                <PagerStyle CssClass="paging" BackColor="#f8c599" ForeColor="White" HorizontalAlign="Center">
                </PagerStyle>
                <RowStyle CssClass="gridItem" BackColor="#f8c599" />
                <EditRowStyle BackColor="#f8c599" />
                <EmptyDataRowStyle HorizontalAlign="Center" CssClass="required"></EmptyDataRowStyle>
                <FooterStyle Font-Bold="True" BorderStyle="None" HorizontalAlign="Left" />
                <HeaderStyle CssClass="gridHeader" BackColor="#2e537c" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle CssClass="gridAltItem" BackColor="#FFFFFF" />
                <Columns>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblweekname" runat="server"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" ItemStyle-HorizontalAlign="Left"
                        HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                         <%-- <%#AppLib.GetDayOfWeek("2")%>--%>
                           <%#AppLib.GetSubString(Eval("Day").ToString(), 40)%>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" Height="30px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left" Height="30px"></ItemStyle>
                    </asp:TemplateField>
                    <asp:TemplateField Visible="true" ItemStyle-HorizontalAlign="Left" HeaderText="Sleep"
                        HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblslep" runat="server" Visible="false" Text='<%#Eval("Sleep") %>'></asp:Label>
                            <%#AppLib.GetSubString(Eval("Sleep").ToString(), 30)%>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" Height="30px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left" Height="30px"></ItemStyle>
                        <FooterTemplate>
                            <asp:Label ID="lblTotalsleep" ForeColor="#000000" Font-Bold="true" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Stress"
                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:Label ID="lblstres" runat="server" Visible="false" Text='<%#Eval("Stress") %>'></asp:Label>
                            <%#AppLib.GetSubString(Eval("Stress").ToString(), 40)%>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" Height="30px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left" Height="30px"></ItemStyle>
                        <FooterTemplate>
                            <asp:Label ID="lblTotalstress" ForeColor="#000000" Font-Bold="true" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Outlook"
                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:Label ID="lblout" runat="server" Visible="false" Text='<%#Eval("Outlook") %>'></asp:Label>
                            <%#AppLib.GetSubString(Eval("Outlook").ToString(), 40)%>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" Height="30px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left" Height="30px"></ItemStyle>
                        <FooterTemplate>
                            <asp:Label ID="lblTotalOutlook" ForeColor="#000000" Font-Bold="true" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Engagement"
                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:Label ID="lblengage" runat="server" Visible="false" Text='<%#Eval("Engagement") %>'></asp:Label>
                            <%#AppLib.GetSubString(Eval("Engagement").ToString(), 40)%>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" Height="30px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left" Height="30px"></ItemStyle>
                        <FooterTemplate>
                            <asp:Label ID="lblTotalengage" ForeColor="#000000" Font-Bold="true" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Energy"
                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <asp:Label ID="lblenergy" runat="server" Visible="false" Text='<%#Eval("Energy") %>'></asp:Label>
                            <%#AppLib.GetSubString(Eval("Energy").ToString(), 40)%>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" Height="30px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left" Height="30px"></ItemStyle>
                        <FooterTemplate>
                            <asp:Label ID="lblTotalenergy" ForeColor="#000000" Font-Bold="true" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#F5F7FB" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <br />
            <br />
        </div>
    </div>

</asp:Content>
