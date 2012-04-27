<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MealExchange.aspx.cs" Inherits="Users_MealExchange" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>MealExchange</title>
    <link href="../../../../Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="../../../../Styles/Table.css" rel="stylesheet" type="text/css" />
    <link href="../../../../Styles/Grid.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .boxPadding
        {
            margin-top: 20px;
            padding: 10px 0px 10px 0px;
            border-top: solid 2px navy;
            text-align: center;
        }
    </style>
    <title></title>
</head>
<body style="width: 95%;">
    <form id="form1" runat="server">
    <table>
        <tr>
            <td>
                <a name="1"></a>
                <div class="subTitle boxPadding">
                    MILK</div>
                <table cellspacing="0" cellpadding="0">
                    <tr>
                        <asp:Label ID="lblMilk" runat="server"></asp:Label>
                    </tr>
                    <tr>
                        <td>
                        </td>
                    </tr>
                </table>
                <a name="2"></a>
                <div class="subTitle boxPadding">
                    FRUIT</div>
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td>
                            <asp:Label ID="lblFurit" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                    </tr>
                </table>
                <a name="3"></a>
                <div class="subTitle boxPadding">
                    VEGETABLES</div>
                <table cellspacing ="0" cellpadding ="0">
                    <tr>
                        <td>
                            <asp:Label ID="lblVegetablee" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                    </tr>
                </table>
                <br />
                <a name="4"></a>
                <div class="subTitle boxPadding">
                    STARCH LISTS</div>
                <table >
                    <tr>
                        <td>
                           <asp:Label ID = "lblstarchlists" runat = "server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                    </tr>
                </table>
                <br />
                <a name="5"></a>
                <div class="subTitle boxPadding">
                    PROTEINS</div>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblPROTEINS" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                    </tr>
                </table>
                <br />
                <a name="6"></a>
                <div class="subTitle boxPadding">
                    FATS</div>
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblFats" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                    </tr>
                </table>
                <div class="subTitle boxPadding">
                    SNACKS</div>
                <table cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <asp:Label ID="lblSnacks" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                    </tr>
                </table>
                <p>
                    &nbsp;
                </p>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
