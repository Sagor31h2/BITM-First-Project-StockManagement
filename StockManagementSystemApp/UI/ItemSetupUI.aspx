<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemSetupUI.aspx.cs" Inherits="StockManagementSystemApp.UI.ItemSetupUI" %>

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
                <asp:Label ID="Label1" runat="server" Text="Category"></asp:Label></td>
            <td>
                <asp:DropDownList ID="categoryDropDownList" runat="server" Width="166px"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Company"></asp:Label></td>
            <td>
                <asp:DropDownList ID="companyDropDownList" runat="server" Width="167px"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Item Name"></asp:Label></td>
            <td>
                <asp:TextBox ID="itemNameTextBox" runat="server" Width="159px"></asp:TextBox></td>
        </tr>
       <tr>
           <td>
               <asp:Label ID="Label4" runat="server" Text="Reorder Label"></asp:Label></td>
           <td>
               <asp:TextBox ID="reorderTextBox" runat="server" Width="158px"></asp:TextBox></td>
       </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="saveButton" runat="server" Text="Save" OnClick="saveButton_Click" Width="125px" /></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Label ID="messageLabel" runat="server" Text=""></asp:Label></td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
