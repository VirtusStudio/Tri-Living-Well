<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
   <%-- <link href="/Styles/Corporate.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Table.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/centerRound6.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/centerRound5.css" rel="stylesheet" type="text/css" />
    Commented by Netsmartz
    --%>
    
<script type="text/javascript">
    bIsPostBack = false;
    function Page_Load()//
    {
        if (!bIsPostBack)//
        {
            bIsPostBack = true;
        }
        
    }
</script>
</head>
<body>
<form id="form2" runat="server">      
<asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>

<script type="text/javascript">
    Sys.Application.add_load(Page_Load);
</script> 

        <table>
        <tr>
            <td class="top">
                <img src="../../Images/dashboard/dashboard.png" />
            </td>

        </table>
            
        <div class="BarHorizontal"></div>
        
        <table>
        <tr>
            <td style="width:100%;">
            
            </td>
            <td class="Round5Container">
                <center class="Round5"><center><center><center><center><center><center><center><center><center>
                    <table class="Round5_tblHeader"><tr><td>What's Hot</td><td style="text-align:right;"></td></tr></table>          
           
                    <a href="javascript:alert('Currently Unavailable');">Maecenas cursus nisl nec metus sollicitudin tempus.</a><br />
                    <br /><a href="javascript:alert('Currently Unavailable');">Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</a><br />
                    <br /><a href="javascript:alert('Currently Unavailable');">Integer sem sapien, lacinia sed volutpat sit amet, vehicula et lacus. Nam sollicitudin nisi eu mi cursus quis placerat nunc adipiscing.</a><br />
                    <br /><a href="javascript:alert('Currently Unavailable');">Curabitur in magna est. Vestibulum convallis lacus in lectus volutpat aliquet. Sed non arcu vitae tellus eleifend vehicula id ut est.</a><br />
                    <br /><a href="javascript:alert('Currently Unavailable');">Quisque tincidunt rhoncus lacus, non cursus purus imperdiet quis. Vestibulum porta pretium condimentum.</a><br />
                    <br />
                </center></center></center></center></center></center></center></center></center></center>
            </td>
        </tr>
        </table>
           


   

        
    </form>
</body>
</html>
