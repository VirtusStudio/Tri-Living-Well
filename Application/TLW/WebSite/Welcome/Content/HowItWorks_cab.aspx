<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HowItWorks_cab.aspx.cs" Inherits="HowItWorks" %>

<%@ Register Src="~/Controls/UC_TextArea.ascx" TagName="UC_TextArea" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--########################################################
    Copyright 2007 Blue Grotto Technologies, Inc.
    This code is owned by Blue Grotto Technologies, Inc
    It may not be copied, shared or modified.
###########################################################-->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
  <%--  <link href="../Styles/Corporate.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Table.css" rel="stylesheet" type="text/css" />
   <link href="/Styles/centerRound5.css" rel="stylesheet" type="text/css" />
   Above lines are commented by Netsmartz
   --%>
   <!--  <link href="/Styles/centerRound4.css" rel="stylesheet" type="text/css" />
    -->
<title>How It Works</title>
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
<form id="form1" runat="server">      
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

<script type="text/javascript">
    Sys.Application.add_load(Page_Load);
</script> 
    <div style="width:100%; text-align:left; border:solid 1px yellow;">
    <div style="width:657px;">
                    <center class="Round5"><center><center><center><center><center><center><center><center><center>
                    <table class="Round5_tblHeader"><tr><td>How It Works</td><td style="text-align:right;"></td></tr></table> 
		            </center></center></center></center></center></center></center></center></center></center>
    </div>   
                    <div class="demoContent" style="padding:0px 15px 15px 15px;">
                    <table>
                    <tr>
                    <td>
                        <uc1:UC_TextArea ID="UC_TextArea1" runat="server" TEXTAREA_NAME="HowItWorks_1" />
                    </td>
                    </tr>
                    </table>
                    </div>
    </div>
    </form>
</body>
</html>
