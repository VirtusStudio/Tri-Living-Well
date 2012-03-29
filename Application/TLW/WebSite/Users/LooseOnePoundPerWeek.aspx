<%@ Page Language="C#" AutoEventWireup="true" Title="Loose One Pound Per Week" CodeFile="LooseOnePoundPerWeek.aspx.cs" Inherits="Users_LooseOnePoundPerWeek" %>

<%@ Register src="../Controls/wucLooseOnePoundPerWeek.ascx" tagname="wucLooseHalfPoundPerWeek" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <uc1:wucLooseHalfPoundPerWeek ID="wucLooseHalfPoundPerWeek1" runat="server" />
    </div>
    </form>
</body>
</html>
