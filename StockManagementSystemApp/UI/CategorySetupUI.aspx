<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="CategorySetupUI.aspx.cs" Inherits="StockManagementSystemApp.UI.CatagorySetupUI" %>

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
            <td>  <asp:HiddenField ID="storeHiddenField" runat="server"/> </td>

        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="saveButton" runat="server" Text="Save" OnClick="saveButton_Click" style="margin-left: 0px" Width="123px" /></td>
        </tr>
         <tr>
                <td></td>
                <td>
                    <asp:Label ID="messageLabel" runat="server" Text=""></asp:Label></td>
          </tr>
    </table>
         <asp:GridView ID="categoriesGridView"  OnRowDataBound="categoriesGridView_OnRowDataBound" runat="server" AutoGenerateColumns="False" Width="276px" OnSelectedIndexChanged="categoriesGridView_SelectedIndexChanged">
            <Columns>
                <asp:TemplateField HeaderText="SL">
                   <ItemTemplate>
                       <%#Container.DataItemIndex+1 %>
                   </ItemTemplate>
               </asp:TemplateField>

               <asp:TemplateField HeaderText="Name">
                   <ItemTemplate>
                       <asp:HiddenField ID="idHiddenfield" runat="server" Value='<%#Eval("Id")%>'/>
                        <asp:Label ID="categoryNameLabel" Text='<%#Eval("CategoryName")%>' runat="server"></asp:Label>
                   </ItemTemplate>
               </asp:TemplateField>
           </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
