<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HealthNews.aspx.cs" 
MasterPageFile="~/MasterPages/User.master"  Title="Health News"
Inherits="Welcome_Content_HealthNews" %>

  <%@ Register Src="~/Controls/UC_TextArea.ascx" TagName="UC_TextArea" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<script type="text/javascript">
    function popUpWin(path, x, y) {

        var sURL = '<%=AppConfig.GetBaseSiteUrl() %>' + path;
        var features = 'toolbar=0,location=0,status=1,menubar=0,scrollbars=1,resizable=1,width=' + x + ',height=' + y + ',left=' + top.window.screenLeft + ',top=' + top.window.screenTop;
        var windownew = window.open(sURL, "new_window", features);
        try { windownew.focus(); } catch (err) { }
    }
    function load(Filepath) {
        if (Filepath.indexOf("//") > -1) {
            window.location = Filepath;
        }
        else {
            window.location = '<%=AppConfig.GetBaseSiteUrl() %>' + Filepath;
        }
    }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <div style="background: none repeat scroll 0% 0% rgb(255, 255, 255); margin: 0px auto; padding: 10px; width: 886px; overflow:hidden;">
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
                                                         Health News
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
                        <uc1:uc_textarea id="UC_TextArea1" runat="server" textarea_name="HealthNews_1" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
