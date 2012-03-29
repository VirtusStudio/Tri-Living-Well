<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TryLivingWellFormula.aspx.cs"
  MasterPageFile="~/MasterPages/TLWSite.master"  Title="Try living formula"
    Inherits="Welcome_Content_TryLivingWellFormula" %>
    

 <%@ Register Src="~/Controls/UC_TextArea.ascx" TagName="UC_TextArea" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                                                          Tri Living Well Formula
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
                        <uc1:uc_textarea id="UC_TextArea1" runat="server" textarea_name="TriLivingWellFormula_1" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
