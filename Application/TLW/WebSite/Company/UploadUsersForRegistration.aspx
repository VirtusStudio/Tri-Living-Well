<%@ Page Title="Upload Users For Registration" Language="C#" MasterPageFile="~/MasterPages/User.master"
    AutoEventWireup="true" CodeFile="UploadUsersForRegistration.aspx.cs" Inherits="Company_UploadUsersForRegistration" %>

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
                        <td>
                            Request for User Registration
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
          <tr>
                                                                    <td align="left" class="required">
                                                                        Duplicate Email Ids are not allowed.
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
                                                                                <td align="left">
                                                                                   Choose File 
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table border="0" width="100%" cellpadding="2" cellspacing="2">
                                                                         
                                                                            <tr style="height: 40px;">
                                                                                <td align="right" valign="middle" style="width: 15%;">
                                                                                    <span class="keyword">Select Files:</span>&nbsp;
                                                                                </td>
                                                                                <td align="left" valign="middle" style="width: 25%;">
                                                                                    <asp:FileUpload ID="fuUser" Height="22" CssClass="txtBox" runat="server" />
                                                                                </td>
                                                                                <td align="left" valign="middle">
                                                                                    <asp:LinkButton ID="btnUpload" CssClass="aButtonSmall" runat="server" Text="Upload"
                                                                                        OnClick="btnUpload_Click" />
                                                                                </td>
                                                                                <td align="right">
                                                                                           <asp:LinkButton ID="lntBtnDownload" CssClass="aButtonSmall" runat="server" Text="&nbsp;Download Request Template&nbsp;"
                                                                                        OnClick="lntBtnDownload_Click" />
                                                                                </td>
                                                                            </tr> <tr>
                                                                                <td align="center" colspan="4">
                                                                                    &nbsp;
                                                                                    <asp:Label ID="lblMsg" ForeColor="Red" runat="server" CssClass="required"></asp:Label>
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
      
        <tr id="trGVGridRecords" runat="server">
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
                                                                                    Company Details
                                                                                </td>
                                                                                <td style="text-align: right;">
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                               
                                                                <tr>
                                                                    <td>
                                                                        <div class="divBorder">
                                                                            <asp:GridView ID="gvRequestedUser" runat="server" AutoGenerateColumns="false" OnRowDataBound="gvRequestedUser_RowDataBound">
                                                                                <RowStyle CssClass="gridItem" />
                                                                                <HeaderStyle CssClass="gridHeader" />
                                                                                <AlternatingRowStyle CssClass="gridAltItem" />
                                                                                <Columns>
                                                                                <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Emp Code"
                                                                                        ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="gridItem" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblEmpCode" runat="server" Text='<%# Eval("EmployeeCode") %>'></asp:Label></ItemTemplate>
                                                                                    </asp:TemplateField>

                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="First Name"
                                                                                        ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblEmpfName" runat="server" Text='<%# Eval("EmployeeFirstName") %>'></asp:Label></ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Middle Name"
                                                                                        ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblEmpMName" runat="server" Text='<%# Eval("EmployeeMiddleName") %>'></asp:Label></ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Last Name"
                                                                                        ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblEmpLName" runat="server" Text='<%# Eval("EmployeeLastName") %>'></asp:Label></ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Email"
                                                                                        ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblEmpEmail" runat="server" Text='<%# Eval("EmployeeEmail") %>'></asp:Label></ItemTemplate>
                                                                                    </asp:TemplateField>

                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Date of Birth"
                                                                                        ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblEmpDateofBirth" runat="server" Text='<%# GetDateOfBirth(Eval("EmpDateofBirth").ToString()) %>'></asp:Label></ItemTemplate>
                                                                                    </asp:TemplateField>

                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Relationship Code"
                                                                                        ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblEmpRelationshipCode" runat="server" Text='<%# Eval("RelationShipCode") %>'></asp:Label></ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                      <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Family Status"
                                                                                        ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblEmpFamilyStatus" runat="server" Text='<%# Eval("FamilyStatus") %>'></asp:Label></ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Gender"
                                                                                        ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblEmpGender" runat="server" Text='<%# Eval("Gender") %>'></asp:Label></ItemTemplate>
                                                                                    </asp:TemplateField>

                                                                                          <asp:TemplateField HeaderStyle-Height="30" ItemStyle-Height="30" HeaderText="Phone OR Cell No."
                                                                                        ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblEmpPhoneORCellNumber" runat="server" Text='<%# Eval("PhoneORCellNumber") %>'></asp:Label></ItemTemplate>
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                            </asp:GridView>
                                                                        </div>
                                                                    </td>
                                                                </tr> <tr style="height:16px;">
                                                                    <td align="left">
                                                                       &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">
                                                                        <asp:LinkButton CssClass="aButtonSmall" ToolTip="Click here to send request" ID="btnSaveRecord"
                                                                            runat="server" OnClick="btnSaveRecord_Click">Send Request To TLW</asp:LinkButton>
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

        <tr><td style="height:30px;"><br /><br /><br /><br /><br /><br /><br /><br /><br />
        </td></tr>
    </table>
</asp:Content>
