<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.master" AutoEventWireup="true" CodeFile="Main_FRAME.aspx.cs" Inherits="Main_Main_FRAME" %>
<%@ Register Src="~/Controls/UC_TextArea.ascx" TagName="UC_TextArea" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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
                                                        Tri Living Well
                                                    </td>
                                                    <td style="text-align: right;">
                                                    </td>
                                                </tr>
                                            </table>
                                            <uc3:uc_textarea id="UC_TextArea_TriLivingWell" runat="server" textarea_name="HOME_1" />
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
    <br />
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
                                                        Why Wellness
                                                    </td>
                                                    <td style="text-align: right;">
                                                    </td>
                                                </tr>
                                            </table>
                                            <uc3:uc_textarea id="UC_TextArea_WhyWellness" runat="server" textarea_name="HOME_2" />
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
    <br />
    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="https://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,30,0"
    width="650" height="275">
    <param name="movie" value="Content/swf/HomeFlash.swf" />
    <param name="quality" value="best" />
    <param name="LOOP" value="true" />
    <param name="menu" value="false" />
    <embed src="Content/swf/HomeFlash.swf" quality="best" pluginspage="https://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"
        type="application/x-shockwave-flash" width="650" height="275" loop="true"></embed>
    </object>

</asp:Content>


