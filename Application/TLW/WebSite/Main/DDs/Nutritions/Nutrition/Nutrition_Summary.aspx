<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Nutrition_Summary.aspx.cs" Inherits="Nutrition_Summary" %>
<%--Commented by Netsmartz for resolving compile time issues 
<%@ Register Assembly="RadMenu.Net2" Namespace="Telerik.WebControls" TagPrefix="radM" %>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
<%--
    <link href="/Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Table.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/centerRound1.css" rel="stylesheet" type="text/css" />
    <link href="/Styles/Table.css" rel="stylesheet" type="text/css" />
    Above lines are commented by Netsmartz
    --%>

</head>
<body onload="parent.setIframeHeight_NoTopScroll();top.setIframeHeight_NoTopScroll();" class="body2">
    <form id="form1" runat="server">
   
 
<table>
<tr>
    <td><span class="subTitle">Summary</span></td>
    <td style="text-align:right;"></td>
</tr>
</table>

<table>
<tr>
    <td class="top" style="width:100px;padding-right:20px;">
     <%--  Commented by Netsmartz for resolving compile time issues 
      <radM:RadMenu ID="RadMenu1"  runat="server" SkinID="Web20" Skin="" Flow="Vertical" Width="100%">
        <Items>
            <radM:RadMenuItem ID="RadMenuItem1" runat="server" NavigateUrl="#milk" Text="Milk" Width="100%"></radM:RadMenuItem>
            <radM:RadMenuItem ID="RadMenuItem4" runat="server" NavigateUrl="#fats" Text="Fats"></radM:RadMenuItem>
            <radM:RadMenuItem ID="RadMenuItem2" runat="server" NavigateUrl="#protein" Text="Protein"></radM:RadMenuItem>
        </Items>
        </radM:RadMenu>--%>
    </td>
    <td class="top">
        <hr />
        <div style="text-align:center;"><a name="milk"><b>MILK</b></a></div>
        <br />
        Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Ut odio. Nam sed est. Nam a risus et est iaculis adipiscing. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Integer ut justo. In tincidunt viverra nisl. Donec dictum malesuada magna. Curabitur id nibh auctor tellus adipiscing pharetra. Fusce vel justo non orci semper feugiat. Cras eu leo at purus ultrices tristique.
        <br /><br />
        Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
        <br /><br />
        <hr />
        <br />
        <div style="text-align:center;"><a name="fats"><b>FATS</b></a></div>
        <br />
        Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Ut odio. Nam sed est. Nam a risus et est iaculis adipiscing. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Integer ut justo. In tincidunt viverra nisl. Donec dictum malesuada magna. Curabitur id nibh auctor tellus adipiscing pharetra. Fusce vel justo non orci semper feugiat. Cras eu leo at purus ultrices tristique.
        <br /><br />
        Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
        <br /><br />
        <hr />
        <br />
        <div style="text-align:center;"><a name="protein"><b>PROTEIN</b></a></div>
        <br />
        Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Ut odio. Nam sed est. Nam a risus et est iaculis adipiscing. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Integer ut justo. In tincidunt viverra nisl. Donec dictum malesuada magna. Curabitur id nibh auctor tellus adipiscing pharetra. Fusce vel justo non orci semper feugiat. Cras eu leo at purus ultrices tristique.
        <br /><br />
        Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
        <br /><br />
        <hr />
        <br />
    </td>
</tr>
</table>

    </form>



</body>
</html>
