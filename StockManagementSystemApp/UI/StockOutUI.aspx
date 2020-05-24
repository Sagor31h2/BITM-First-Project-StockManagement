<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockOutUI.aspx.cs" Inherits="StockManagementSystemApp.UI.StockOutUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 238px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
        
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label1" runat="server" Text="Company"></asp:Label></td>
            <td>
                <asp:DropDownList ID="companyDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="companyDropDownList_SelectedIndexChanged" Width="165px"></asp:DropDownList></td>
        </tr>
        
         
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label2" runat="server" Text="Item"></asp:Label></td>
            <td>
                <asp:DropDownList ID="itemDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="itemDropDownList_SelectedIndexChanged" Width="165px"></asp:DropDownList></td>
        </tr>
        
<tr>
    <td class="auto-style1">
        <asp:Label ID="Label4" runat="server" Text="Reorder Lavel"></asp:Label></td>
    <td>
        <asp:TextBox ID="reorderLavelTextBox" runat="server" Width="165px"></asp:TextBox></td>
</tr>
       
<tr>
    <td class="auto-style1">
        <asp:Label ID="Label5" runat="server" Text="Available Quantity"></asp:Label></td>
    <td>
        <asp:TextBox ID="availableQuantityTextBox" runat="server" Width="165px"></asp:TextBox></td>
</tr>
       
<tr>
    <td class="auto-style1">
        <asp:Label ID="Label3" runat="server" Text="Stoct Out Quantity"></asp:Label></td>
    <td>
        <asp:TextBox ID="stockOutQuantityTextBox" runat="server" Width="165px"></asp:TextBox></td>
</tr>
        
        <tr>
            <td class="auto-style1">
                <asp:HiddenField ID="idHiddenField" runat="server" />
            </td>
            <td>
                <asp:Button ID="addButton" runat="server" Text="Add" style="margin-left: 110px" Width="60px" OnClick="addButton_Click" /></td>
        </tr>
        
        <tr>
            <td>
                <asp:Label ID="messageLabel" runat="server" Text=""></asp:Label></td>
        </tr>

    </table>
        <br/>
        <br/>

        <table>
            <asp:GridView ID="stockOutGrid" runat="server" AutoGenerateColumns="False" ShowHeader="True">
                 <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#242121" />
                <Columns>
                <asp:TemplateField HeaderText="SL">
                    <ItemTemplate>
                       <%#Container.DataItemIndex+1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Item">
                    <ItemTemplate>
                        <asp:Label runat="server"><%#Eval("Name") %></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Company">
                    <ItemTemplate>
                        <asp:Label runat="server"><%#Eval("CompanyName") %></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quantity">
                    <ItemTemplate>
                        <asp:Label runat="server"><%#Eval("OutQuantity") %></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        </table>
        
        <table>
            <tr>
                <td></td>
                <td><asp:Button ID="sellButton" runat="server" Text="Sell" OnClick="sellButton_Click" /></td>
                <td><asp:Button ID="damageButton" runat="server" Text="Damage" OnClick="damageButton_Click" /></td>
                <td><asp:Button ID="lostButton" runat="server" Text="Lost" OnClick="lostButton_Click" /></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
