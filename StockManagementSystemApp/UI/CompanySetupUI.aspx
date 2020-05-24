<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanySetupUI.aspx.cs" Inherits="StockManagementSystemApp.UI.CompanySetupUI" %>

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
                <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label></td>
            <td>
                <asp:TextBox ID="nameTextBox" runat="server" Width="224px"></asp:TextBox></td>

        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="saveButton" runat="server" Text="Save" style="margin-left: 0px" Width="123px" OnClick="saveButton_Click" /></td>
        </tr>
         <tr>
                <td></td>
                <td>
                    <asp:Label ID="messageLabel" runat="server" Text=""></asp:Label></td>
          </tr>
    </table>
         <asp:GridView ID="companiesGridView" runat="server" AutoGenerateColumns="False" Width="276px">
            <Columns>
                <asp:TemplateField HeaderText="SL">
                   <ItemTemplate>
                       <%#Container.DataItemIndex+1 %>
                   </ItemTemplate>
               </asp:TemplateField>

               <asp:TemplateField HeaderText="Name">
                   <ItemTemplate>
                        <asp:Label runat="server"><%#Eval("CompanyName")%></asp:Label>
                   </ItemTemplate>
               </asp:TemplateField>
           </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
