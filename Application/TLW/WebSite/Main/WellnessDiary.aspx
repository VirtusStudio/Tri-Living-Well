<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/User.master"
    CodeFile="WellnessDiary.aspx.cs" Inherits="WellnessDiary" Title="Wellness Diary" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Charting" Assembly="Telerik.Web.UI" %>
<%@ Register Src="~/Controls/UC_TextArea.ascx" TagName="UC_TextArea" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<link href="../Styles/users.css" rel="stylesheet" type="text/css" />
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
<div role="main" class="contentarea">
<div class="topmainheadings"><h1>Wellness Diary</h1></div>
<div id="wrapper">
<div id="contentFrame">
<div id="mainContent>
<asp:Label ID="lblMsg" runat="server" CssClass="required"></asp:Label>
<div id="contentHeader"><uc1:UC_TextArea ID="UC_TextArea1" runat="server" TEXTAREA_NAME="WellnessDairy" /></div>
<div id="contentBody">
<iframe id="IFRAME_CONTENT" name="IFRAME_CONTENT" class="IFRAME_CONTENT" runat="server"
        frameborder="0" style="display:none;" src="Content/Home.aspx"></iframe>
<div class="altWellnessRow"><div class="txtQuestion">How would you rate the quality of your sleep last night?</div>
                        <div class="txtAnswer">
                            <asp:DropDownList ID="ddlQualitySleep" runat="server" CssClass="txtBox">
                            <asp:ListItem Value="0" Text="Quality of Sleep"></asp:ListItem>
                            <asp:ListItem Value="6" Text="Excellent"></asp:ListItem>
                            <asp:ListItem Value="5" Text="Very Good"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Good"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Fair"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Poor"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Very Poor"></asp:ListItem>
                        </asp:DropDownList></div>
</div>
<div class="wellnessRow"><div class="txtQuestion">How would you rate your current level of stress?</div>
                        <div class="txtAnswer">
                        <asp:DropDownList ID="ddlLevel" runat="server" CssClass="txtBox">
                            <asp:ListItem Value="0" Text="Level of Stress"></asp:ListItem>
                            <asp:ListItem Value="6" Text="Very low/none"></asp:ListItem>
                            <asp:ListItem Value="5" Text="Low stress"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Moderate/average stress"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Some stress"></asp:ListItem>
                            <asp:ListItem Value="2" Text="High stress"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Extremely Stressed"></asp:ListItem>
                        </asp:DropDownList></div>
</div>
<div class="altWellnessRow"><div class="txtQuestion">How would you describe your perspective or state of happiness?</div>
                        <div class="txtAnswer">
                        <asp:DropDownList ID="ddloutlook" runat="server" CssClass="txtBox">
                            <asp:ListItem Value="0" Text="State of Happiness"></asp:ListItem>
                            <asp:ListItem Value="6" Text="Excited"></asp:ListItem>
                            <asp:ListItem Value="5" Text="Optimistic"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Hopeful"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Concerned/Nervous"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Distressed"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Pessimistic"></asp:ListItem>
                        </asp:DropDownList></div>
</div>
<div class="wellnessRow"><div class="txtQuestion">How would you rate your level of productivity?</div>
                        <div class="txtAnswer">
                        <asp:DropDownList ID="ddlengagement" runat="server" CssClass="txtBox">
                            <asp:ListItem Value="0" Text="Level of Productivity"></asp:ListItem>
                            <asp:ListItem Value="6" Text="Very positive"></asp:ListItem>
                            <asp:ListItem Value="5" Text="Positive"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Somewhat positive"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Average"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Somewhat negative"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Negative"></asp:ListItem>
                        </asp:DropDownList></div>
</div>
<div class="altWellnessRow"><div class="txtQuestion">How much energy do you have today?</div>
                        <div class="txtAnswer">
                        <asp:DropDownList ID="ddlenergylevel" runat="server" CssClass="txtBox">
                            <asp:ListItem Value="0" Text="Energy Level"></asp:ListItem>
                            <asp:ListItem Value="6" Text="I am full of energy"></asp:ListItem>
                            <asp:ListItem Value="5" Text="I have a lot of energy"></asp:ListItem>
                            <asp:ListItem Value="4" Text="Enough to accomplish what I need to do today"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Average"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Feel sluggish or somewhat tired"></asp:ListItem>
                            <asp:ListItem Value="1" Text="None, or not too much"></asp:ListItem>
                        </asp:DropDownList></div>
</div>
<div class="wellnessRow"><div id="continueBtn"><asp:LinkButton CssClass="aButtonSmall" ToolTip="Click here to submit " CausesValidation="true"
                            ValidationGroup="CreateUserWizard1" Width="65" ID="lnkBtnSearch" runat="server"
                            OnClick="lnkBtnSearch_Click">Submit</asp:LinkButton></div>
</div>


    <div style="margin: 0px auto; width: 100%; text-align: Left;">
        <asp:Chart ID="chart1" runat="server" BackColor="#e4e7eb"  Width="825px">
            <Titles>
                <asp:Title Visible="true" />
            </Titles>
            <Legends>
                <asp:Legend Name="DefaultLegend" Docking="Right" />
            </Legends>
            <Series>
                <asp:Series Name="Sleep" YValueType="Int32" ChartType="Line" Color="#4572a7" ChartArea="MainChartArea"
                    IsValueShownAsLabel="true">
                </asp:Series>
                <asp:Series Name="Stress" YValueType="Int32" Color="#aa4643" ChartType="Line"
                    ChartArea="MainChartArea" IsValueShownAsLabel="true">
                  
                </asp:Series>
                <asp:Series Name="Outlook" YValueType="Int32" Color="#89a54e" ChartType="Line"
                    ChartArea="MainChartArea" IsValueShownAsLabel="true">
                  
                </asp:Series>
                <asp:Series Name="Engagement" YValueType="Int32" Color="#71588f" ChartType="Line"
                    ChartArea="MainChartArea" IsValueShownAsLabel="true">
                  
                </asp:Series>
                <asp:Series Name="Energy" YValueType="Int32" Color="#4198af" ChartType="Line" ChartArea="MainChartArea"
                    IsValueShownAsLabel="true">
                   
                </asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="MainChartArea" >
                    <AxisY>
                        <LabelStyle Enabled="true" />
                        <MajorGrid LineWidth="0" />
                        <MajorTickMark Enabled="true" />
                    </AxisY>
                    <AxisX>
                        <MajorGrid LineWidth="0" />
                    </AxisX>
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
        <div class="row"><div id="datePickerRow">From 
                    <asp:DropDownList ID="ddlStartMonth" runat="server" CssClass="monthChange">
                        <asp:ListItem Value="1">January</asp:ListItem>
                        <asp:ListItem Value="2">February</asp:ListItem>
                        <asp:ListItem Value="3">March</asp:ListItem>
                        <asp:ListItem Value="4">April</asp:ListItem>
                        <asp:ListItem Value="5">May</asp:ListItem>
                        <asp:ListItem Value="6">June</asp:ListItem>
                        <asp:ListItem Value="7">July</asp:ListItem>
                        <asp:ListItem Value="8">August</asp:ListItem>
                        <asp:ListItem Value="9">September</asp:ListItem>
                        <asp:ListItem Value="10">October</asp:ListItem>
                        <asp:ListItem Value="11">November</asp:ListItem>
                        <asp:ListItem Value="12">December</asp:ListItem>
                    </asp:DropDownList>
                     <asp:DropDownList ID="ddlStartDay" runat="server"
                        CssClass="dayChange">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="7">7</asp:ListItem>
                        <asp:ListItem Value="8">8</asp:ListItem>
                        <asp:ListItem Value="9">9</asp:ListItem>
                        <asp:ListItem Value="10">10</asp:ListItem>
                        <asp:ListItem Value="11">11</asp:ListItem>
                        <asp:ListItem Value="12">12</asp:ListItem>
                        <asp:ListItem Value="13">13</asp:ListItem>
                        <asp:ListItem Value="14">14</asp:ListItem>
                        <asp:ListItem Value="15">15</asp:ListItem>
                        <asp:ListItem Value="16">16</asp:ListItem>
                        <asp:ListItem Value="17">17</asp:ListItem>
                        <asp:ListItem Value="18">18</asp:ListItem>
                        <asp:ListItem Value="19">19</asp:ListItem>
                        <asp:ListItem Value="20">20</asp:ListItem>
                        <asp:ListItem Value="21">21</asp:ListItem>
                        <asp:ListItem Value="22">22</asp:ListItem>
                        <asp:ListItem Value="23">23</asp:ListItem>
                        <asp:ListItem Value="24">24</asp:ListItem>
                        <asp:ListItem Value="25">25</asp:ListItem>
                        <asp:ListItem Value="26">26</asp:ListItem>
                        <asp:ListItem Value="27">27</asp:ListItem>
                        <asp:ListItem Value="28">28</asp:ListItem>
                        <asp:ListItem Value="29">29</asp:ListItem>
                        <asp:ListItem Value="30">30</asp:ListItem>
                        <asp:ListItem Value="31">31</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlStartYear" runat="server" CssClass="yearChange">
                        <asp:ListItem Value="2012">2012</asp:ListItem>
                        <asp:ListItem Value="2011">2011</asp:ListItem>
                    </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To: <asp:DropDownList ID="ddlEndMonth" runat="server"
                        CssClass="monthChange">
                        <asp:ListItem Value="1">January</asp:ListItem>
                        <asp:ListItem Value="2">February</asp:ListItem>
                        <asp:ListItem Value="3">March</asp:ListItem>
                        <asp:ListItem Value="4">April</asp:ListItem>
                        <asp:ListItem Value="5">May</asp:ListItem>
                        <asp:ListItem Value="6">June</asp:ListItem>
                        <asp:ListItem Value="7">July</asp:ListItem>
                        <asp:ListItem Value="8">August</asp:ListItem>
                        <asp:ListItem Value="9">September</asp:ListItem>
                        <asp:ListItem Value="10">October</asp:ListItem>
                        <asp:ListItem Value="11">November</asp:ListItem>
                        <asp:ListItem Value="12">December</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlEndDay" runat="server"
                        CssClass="dayChange">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                        <asp:ListItem Value="6">6</asp:ListItem>
                        <asp:ListItem Value="7">7</asp:ListItem>
                        <asp:ListItem Value="8">8</asp:ListItem>
                        <asp:ListItem Value="9">9</asp:ListItem>
                        <asp:ListItem Value="10">10</asp:ListItem>
                        <asp:ListItem Value="11">11</asp:ListItem>
                        <asp:ListItem Value="12">12</asp:ListItem>
                        <asp:ListItem Value="13">13</asp:ListItem>
                        <asp:ListItem Value="14">14</asp:ListItem>
                        <asp:ListItem Value="15">15</asp:ListItem>
                        <asp:ListItem Value="16">16</asp:ListItem>
                        <asp:ListItem Value="17">17</asp:ListItem>
                        <asp:ListItem Value="18">18</asp:ListItem>
                        <asp:ListItem Value="19">19</asp:ListItem>
                        <asp:ListItem Value="20">20</asp:ListItem>
                        <asp:ListItem Value="21">21</asp:ListItem>
                        <asp:ListItem Value="22">22</asp:ListItem>
                        <asp:ListItem Value="23">23</asp:ListItem>
                        <asp:ListItem Value="24">24</asp:ListItem>
                        <asp:ListItem Value="25">25</asp:ListItem>
                        <asp:ListItem Value="26">26</asp:ListItem>
                        <asp:ListItem Value="27">27</asp:ListItem>
                        <asp:ListItem Value="28">28</asp:ListItem>
                        <asp:ListItem Value="29">29</asp:ListItem>
                        <asp:ListItem Value="30">30</asp:ListItem>
                        <asp:ListItem Value="31">31</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="ddlEndYear" runat="server"
                        CssClass="yearChange">
                        <asp:ListItem Value="2012">2012</asp:ListItem>
                        <asp:ListItem Value="2013">2013</asp:ListItem>
                    </asp:DropDownList><asp:LinkButton CssClass="aButtonSmall" CausesValidation="true"
                            Width="65" ID="LinkButton1" runat="server"
                            OnClick="UpdateDates_Click">Update</asp:LinkButton>
                    </div></div>
        <div style="text-align: Left;">
            <asp:GridView ID="GVdiary" AllowSorting="true" AutoGenerateColumns="False" runat="server"
                EmptyDataText="<br /><br />No Record Found.<br /><br />" EmptyDataRowStyle-CssClass="required"
                EmptyDataRowStyle-HorizontalAlign="Left" Width="825px" Style="margin: 0px auto; "
                PagerStyle-CssClass="paging" CellPadding="4" border="0" GridLines="None" ForeColor="#333333"
                OnRowDataBound="GVdiary_RowDataBound" ShowFooter="true">
                <PagerStyle CssClass="paging" BackColor="#f3f3f3" ForeColor="White" HorizontalAlign="Left">
                </PagerStyle>
                <RowStyle CssClass="gridItem" BackColor="#f3f3f3" />
                <EditRowStyle BackColor="#f3f3f3" />
                <EmptyDataRowStyle HorizontalAlign="Left" CssClass="required"></EmptyDataRowStyle>
                <FooterStyle Font-Bold="True" BorderStyle="None" HorizontalAlign="Left" />
                <HeaderStyle CssClass="gridHeader" BackColor="#4a74a3" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle CssClass="gridAltItem" BackColor="#e4e7eb" />
                <RowStyle backcolor="#f3f3f3"  CssClass="gridAltItem" />
                <Columns>
                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="200px">
                        <ItemTemplate>
                           <%#Eval("Dates", "{0:d-M-yyyy}").ToString()%>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Height="30px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center" Height="30px"></ItemStyle>
                        <FooterStyle HorizontalAlign="Center" />
                        <FooterTemplate>
                            <asp:Label ID="lblAverage" ForeColor="#000000" Font-Bold="true" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField Visible="true" ItemStyle-HorizontalAlign="Left" HeaderText="Sleep"
                        HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <asp:Label ID="lblslep" runat="server" Visible="false" Text='<%#Eval("Sleep") %>'></asp:Label>
                            <%#AppLib.GetSubString(Eval("Sleep").ToString(), 30)%>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" Height="20px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left" Height="20px"></ItemStyle>
                        <FooterTemplate>
                            <asp:Label ID="lblTotalsleep" ForeColor="#000000" Font-Bold="true" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Height="20" ItemStyle-Height="20" HeaderText="Stress"
                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <asp:Label ID="lblstres" runat="server" Visible="false" Text='<%#Eval("Stress") %>'></asp:Label>
                            <%#AppLib.GetSubString(Eval("Stress").ToString(), 40)%>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" Height="20px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left" Height="20px"></ItemStyle>
                        <FooterTemplate>
                            <asp:Label ID="lblTotalstress" ForeColor="#000000" Font-Bold="true" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Height="20" ItemStyle-Height="20" HeaderText="Outlook"
                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <asp:Label ID="lblout" runat="server" Visible="false" Text='<%#Eval("Outlook") %>'></asp:Label>
                            <%#AppLib.GetSubString(Eval("Outlook").ToString(), 40)%>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" Height="20px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left" Height="20px"></ItemStyle>
                        <FooterTemplate>
                            <asp:Label ID="lblTotalOutlook" ForeColor="#000000" Font-Bold="true" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Height="20" ItemStyle-Height="20" HeaderText="Engagement"
                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <asp:Label ID="lblengage" runat="server" Visible="false" Text='<%#Eval("Engagement") %>'></asp:Label>
                            <%#AppLib.GetSubString(Eval("Engagement").ToString(), 40)%>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" Height="20px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left" Height="20px"></ItemStyle>
                        <FooterTemplate>
                            <asp:Label ID="lblTotalengage" ForeColor="#000000" Font-Bold="true" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Height="20" ItemStyle-Height="20" HeaderText="Energy"
                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <asp:Label ID="lblenergy" runat="server" Visible="false" Text='<%#Eval("Energy") %>'></asp:Label>
                            <%#AppLib.GetSubString(Eval("Energy").ToString(), 40)%>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" Height="20px"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Left" Height="20px"></ItemStyle>
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
</div>
</div>
</div>
</div>
</div>
</asp:Content>
