<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockInSetupUI.aspx.cs" Inherits="StockManagementSystemApp.UI.StockInSetupUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Comapny"></asp:Label></td>
            <td>
                <asp:DropDownList ID="companyDropDownList" runat="server" AutoPostBack="True" Height="17px" OnSelectedIndexChanged="companyDropDownList_SelectedIndexChanged" Width="220px"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Item"></asp:Label></td>
            <td>
                <asp:DropDownList ID="itemDropDownList" runat="server" AutoPostBack="True" Height="16px" OnSelectedIndexChanged="itemDropDownList_SelectedIndexChanged" Width="219px"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Reorder Lebel"></asp:Label></td>
            <td>
                <asp:TextBox ID="showReorderLebelTextBox" runat="server" Width="211px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Available Quantity"></asp:Label></td>
            <td>
                <asp:TextBox ID="showAvailableQuantityTextBox" runat="server" Width="209px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Stock In Quantity"></asp:Label></td>
            <td>
                <asp:TextBox ID="stockInQuantityTextBox" runat="server" Width="210px"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="saveButton" runat="server" Text="Save" OnClick="saveButton_Click" Width="139px" /></td>
        </tr>
        <tr>
            <td>
                <asp:HiddenField ID="idHiddenField" runat="server" />
            </td>
            <td>
                <asp:Label ID="messageLabel" runat="server" Text=""></asp:Label></td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
