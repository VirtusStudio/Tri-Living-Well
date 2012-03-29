<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PersonalFitness.aspx.cs" Inherits="Welcome_Content_PersonalFitness" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<%@ Register Src="~/Controls/UC_TextArea.ascx" TagName="UC_TextArea" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    
<title>Personal Fitness</title>
</head>
<body>
<form id="form1" runat="server">      
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div style="width:100%;">
                    <center class="Round5"><center><center><center><center><center><center><center><center><center>
                    <table class="Round5_tblHeader"><tr><td>Personal Fitness</td><td style="text-align:right;"></td></tr></table>   
		            </center></center></center></center></center></center></center></center></center></center> 
                    <div class="demoContent" style="padding:0px 15px 15px 15px;">
                    <table>
                    <tr>
                    <td>
                        <uc1:UC_TextArea ID="UC_TextArea1" runat="server" TEXTAREA_NAME="PersonalFitness" />
                    </td>
                    </tr>
                    </table>
                    </div>
    </div>
    </form>
</body>
</html>
