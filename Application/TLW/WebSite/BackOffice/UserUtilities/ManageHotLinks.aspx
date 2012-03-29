<%@ Page Title="Manage Hot Section details" Language="C#" MasterPageFile="~/MasterPages/BackOffice.master"
 AutoEventWireup="true" CodeFile="ManageHotLinks.aspx.cs" Inherits="BackOffice_UserUtilities_ManageHotLinks"
 ValidateRequest="false"
  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../../Scripts/Common.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="90%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <table class="title">
                    <tr>
                        <td align="left">
                            What's Hot
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="lblMsg" runat="server" CssClass="required"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <div class="">
                    <center class="Round3">
                        <center>
                            <center>
                                <center>
                                    <center>
                                        <center>
                                            <center>
                                                <center>
                                                    <center>
                                                        <center>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <table class="Round3_tblHeader">
                                                                            <tr>
                                                                                <td>
                                                                                    Add/Edit Section
                                                                                </td>
                                                                                <td style="text-align: right;">
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table border="0" width="100%" cellpadding="2" cellspacing="2">
                                                                            <tr style="height: 40px; width: 20%;">
                                                                                <td align="left" valign="middle">
                                                                                    <span class="keyword">Enter Heading:</span>&nbsp;
                                                                                </td>
                                                                                <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                    <asp:TextBox runat="server" CssClass="txtBox" ID="txtHeading" MaxLength="500" Width="350px"></asp:TextBox>
                                                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtHeading" Display="Static"
                                                                                        ValidationGroup="News" ID="RequiredFieldValidator1" ErrorMessage="Please Enter Heading."
                                                                                        CssClass="required"></asp:RequiredFieldValidator>
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="height: 40px;">
                                                                                <td align="left" valign="middle">
                                                                                    <span class="keyword">Enter Description:</span>&nbsp;
                                                                                </td>
                                                                                <td align="left" valign="middle" style="white-space: nowrap;">
                                                                                    <asp:TextBox runat="server" CssClass="txtBox" ID="txtDescription" MaxLength="500"
                                                                                    Rows="7" Columns="7"
                                                                                        TextMode="MultiLine" Width="350px"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                               <tr>
                                                                                <td>
                                                                                &nbsp;
                                                                                </td>
                                                                                <td >
                                                                                    
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="height: 40px; ">
                                                                                <td>
                                                                                </td>
                                                                                <td align="left" valign="bottom">
                                                                                    <asp:LinkButton CssClass="aButtonSmall" ValidationGroup="News" CausesValidation="true"
                                                                                        ToolTip="Click here to add/update" ID="lnkbtnSave" runat="server" 
                                                                                        onclick="lnkbtnSave_Click" >Add/Update</asp:LinkButton>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
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
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="">
                    <center class="Round3">
                        <center>
                            <center>
                                <center>
                                    <center>
                                        <center>
                                            <center>
                                                <center>
                                                    <center>
                                                        <center>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <table class="Round3_tblHeader">
                                                                            <tr>
                                                                                <td>
                                                                                    Section Details
                                                                                </td>
                                                                                <td style="text-align: right;">
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left">
                                                                        <asp:Label ID="lblResultMsg" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                          <tr>
                                                                    <td>
                                                                        <div class="divBorder">
                                                                            <asp:GridView ID="GVLinks" AutoGenerateColumns="False" runat="server" EmptyDataText="<br /><br />No Record Found.<br /><br />"
                                                                                EmptyDataRowStyle-CssClass="required" EmptyDataRowStyle-HorizontalAlign="Center"
                                                                                Width="100%" AllowPaging="false" AllowSorting="false" PagerStyle-CssClass="paging"
                                                                                CellSpacing="1" CellPadding="0" border="0" GridLines="None" 
                                                                                BorderWidth="0" onrowcommand="GVLinks_RowCommand" >
                                                                                <RowStyle CssClass="gridItem" />
                                                                                <HeaderStyle CssClass="gridHeader" />
                                                                                <AlternatingRowStyle CssClass="gridAltItem" />
                                                                                <Columns>
                                                                                    <asp:TemplateField Visible="false" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lbQuestionnaireId" runat="server" Visible="false" Text='<%#Eval("IntHotSectionId") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Heading"
                                                                                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <%#AppLib.GetSubString(Eval("StrHeading").ToString(), 70)%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Description"
                                                                                        ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                                                                                        <ItemTemplate>
                                                                                            <%#AppLib.GetSubString(Eval("StrDescription").ToString(), 100)%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                   
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Date Created"
                                                                                        ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <%# AppLib.GetFormattedDate(Eval("DtCreatedOn").ToString())%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                   
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Edit"
                                                                                        ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <asp:LinkButton ID="lnkEditQuestionnaire" CssClass="lnkBtn" runat="server" Text="Edit"
                                                                                                CommandArgument='<%#Eval("IntHotSectionId") %>' CommandName="EditLinks"></asp:LinkButton>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Delete"
                                                                                        ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <asp:LinkButton ID="lnkDeleteQuestionnaire" CssClass="lnkBtn" runat="server" Text="Delete"
                                                                                             OnClientClick="return ConfirmDelete('record')"
                                                                                                CommandArgument='<%#Eval("IntHotSectionId") %>' CommandName="DeleteLinks"></asp:LinkButton>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </div>
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
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
