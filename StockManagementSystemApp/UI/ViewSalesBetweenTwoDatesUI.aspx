<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSalesBetweenTwoDatesUI.aspx.cs" Inherits="StockManagementSystemApp.UI.ViewSalesBetweenTwoDatesUI" %>

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
                <asp:Label ID="Label1" runat="server" Text="From Date"></asp:Label></td>
            <td><asp:DropDownList ID="fromDayDropDownList" runat="server">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>11</asp:ListItem>
            <asp:ListItem>12</asp:ListItem>
            <asp:ListItem>13</asp:ListItem>
            <asp:ListItem>14</asp:ListItem>
            <asp:ListItem>15</asp:ListItem>
            <asp:ListItem>16</asp:ListItem>
            <asp:ListItem>17</asp:ListItem>
            <asp:ListItem>18</asp:ListItem>
            <asp:ListItem>19</asp:ListItem>
            <asp:ListItem>20</asp:ListItem>
            <asp:ListItem>21</asp:ListItem>
            <asp:ListItem>22</asp:ListItem>
            <asp:ListItem>23</asp:ListItem>
            <asp:ListItem>24</asp:ListItem>
            <asp:ListItem>25</asp:ListItem>
            <asp:ListItem>26</asp:ListItem>
            <asp:ListItem>27</asp:ListItem>
            <asp:ListItem>28</asp:ListItem>
            <asp:ListItem>29</asp:ListItem>
            <asp:ListItem>30</asp:ListItem>
            <asp:ListItem>31</asp:ListItem>
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="fromMonthDropDownList" runat="server">
        <asp:ListItem>Jan</asp:ListItem>
        <asp:ListItem>Feb</asp:ListItem>
        <asp:ListItem>Mar</asp:ListItem>
        <asp:ListItem>Apr</asp:ListItem>
        <asp:ListItem>May</asp:ListItem>
        <asp:ListItem>Jun</asp:ListItem>
        <asp:ListItem>Jul</asp:ListItem>
        <asp:ListItem>Aug</asp:ListItem>
        <asp:ListItem>Sep</asp:ListItem>
        <asp:ListItem>Oct</asp:ListItem>
        <asp:ListItem>Nov</asp:ListItem>
        <asp:ListItem>Dec</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="fromYearDropDownList" runat="server">

         <asp:ListItem>2010</asp:ListItem>
         <asp:ListItem>2011</asp:ListItem>
         <asp:ListItem>2012</asp:ListItem>
         <asp:ListItem>2013</asp:ListItem>
         <asp:ListItem>2014</asp:ListItem>
          <asp:ListItem>2015</asp:ListItem>
         <asp:ListItem>2016</asp:ListItem>
         <asp:ListItem>2017</asp:ListItem>
         <asp:ListItem>2018</asp:ListItem>
         <asp:ListItem>2019</asp:ListItem>
        </asp:DropDownList></td>
        </tr>
        
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="To Date"></asp:Label></td>
            <td><asp:DropDownList ID="toDayDropDownList" runat="server">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>11</asp:ListItem>
            <asp:ListItem>12</asp:ListItem>
            <asp:ListItem>13</asp:ListItem>
            <asp:ListItem>14</asp:ListItem>
            <asp:ListItem>15</asp:ListItem>
            <asp:ListItem>16</asp:ListItem>
            <asp:ListItem>17</asp:ListItem>
            <asp:ListItem>18</asp:ListItem>
            <asp:ListItem>19</asp:ListItem>
            <asp:ListItem>20</asp:ListItem>
            <asp:ListItem>21</asp:ListItem>
            <asp:ListItem>22</asp:ListItem>
            <asp:ListItem>23</asp:ListItem>
            <asp:ListItem>24</asp:ListItem>
            <asp:ListItem>25</asp:ListItem>
            <asp:ListItem>26</asp:ListItem>
            <asp:ListItem>27</asp:ListItem>
            <asp:ListItem>28</asp:ListItem>
            <asp:ListItem>29</asp:ListItem>
            <asp:ListItem>30</asp:ListItem>
            <asp:ListItem>31</asp:ListItem>
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="toMonthDropDownList" runat="server">
        <asp:ListItem>Jan</asp:ListItem>
        <asp:ListItem>Feb</asp:ListItem>
        <asp:ListItem>Mar</asp:ListItem>
        <asp:ListItem>Apr</asp:ListItem>
        <asp:ListItem>May</asp:ListItem>
        <asp:ListItem>Jun</asp:ListItem>
        <asp:ListItem>Jul</asp:ListItem>
        <asp:ListItem>Aug</asp:ListItem>
        <asp:ListItem>Sep</asp:ListItem>
        <asp:ListItem>Oct</asp:ListItem>
        <asp:ListItem>Nov</asp:ListItem>
        <asp:ListItem>Dec</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="toYearDropDownList" runat="server">

         <asp:ListItem>2010</asp:ListItem>
         <asp:ListItem>2011</asp:ListItem>
         <asp:ListItem>2012</asp:ListItem>
         <asp:ListItem>2013</asp:ListItem>
         <asp:ListItem>2014</asp:ListItem>
          <asp:ListItem>2015</asp:ListItem>
         <asp:ListItem>2016</asp:ListItem>
         <asp:ListItem>2017</asp:ListItem>
         <asp:ListItem>2018</asp:ListItem>
         <asp:ListItem>2019</asp:ListItem>
        </asp:DropDownList></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="searchButton" runat="server" Text="Search" OnClick="searchButton_Click" style="margin-left: 83px" /></td>
        </tr>
    </table>
        <br/>
        <br/>
        <asp:Label ID="messageLabel" runat="server" Text=""></asp:Label>
        <br/>
        <br/>
        <asp:GridView ID="viewSalesGridView" AutoGenerateColumns="False" runat="server">
            
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
                 <asp:TemplateField HeaderText="Quantity">
                    <ItemTemplate>
                        <asp:Label runat="server"><%#Eval("OutQuantity") %></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
       </div>
    </form>
</body>
</html>
