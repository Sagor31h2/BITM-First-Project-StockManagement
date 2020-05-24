using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using StockManagementSystemApp.DAL.Model;

namespace StockManagementSystemApp.DAL.Gateway
{
    public class StockOutGateWay : Gateway
    {
        public List<Company> GetAllCompanies()
        {
            Query = "SELECT * FROM Company";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();

            List<Company> companies = new List<Company>();
            while (Reader.Read())
            {
                Company aCompany = new Company();
                aCompany.Id = (int) Reader["Id"];
                aCompany.CompanyName = Reader["CompanyName"].ToString();

                companies.Add(aCompany);
            }
            Reader.Close();
            Connection.Close();
            return companies;
        }

        public List<Item> GetAllItems(int id)
        {
            Query = "SELECT * FROM Items WHERE CompanyId = '" + id + "'";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();

            List<Item> items = new List<Item>();
            while (Reader.Read())
            {
                Item aItem = new Item();
                aItem.Id = (int) Reader["Id"];
                aItem.Name = Reader["ItemName"].ToString();

                items.Add(aItem);
            }
            Reader.Close();
            Connection.Close();
            return items;
        }

        public Item GetItemsWithQuantity(int id)
        {
            Query = "SELECT * FROM Items WHERE Id = '" + id + "'";
            Command = new SqlCommand(Query, Connection);

            Connection.Open();

            Reader = Command.ExecuteReader();
            Item aItem = null;

            if (Reader.HasRows)
            {
                aItem = new Item();
                Reader.Read();

                aItem.Id = (int) Reader["Id"];
                aItem.Reorder = (int) Reader["Reorder"];
                aItem.AvailableQuantity = (int) Reader["AvailableQuantity"];
            }

            Reader.Close();
            Connection.Close();

            return aItem;
        }

        public int Save(List<Item> items)
        {
            int rowAffect = 0;
            foreach (Item aStock in items)
            {
                Query =
                    "INSERT INTO StockOut (ItemId,ComapnyId,StockOutQuantity,StockOutType,Date,ItemName) VALUES(@itemId,@companyId,@stockOutQuantity,@stockOutType,@date,@itemName)";

                Command = new SqlCommand(Query, Connection);

                Command.Parameters.Clear();

                Command.Parameters.Add("itemId", SqlDbType.Int);
                Command.Parameters["itemId"].Value = aStock.Id;

                Command.Parameters.Add("companyId", SqlDbType.Int);
                Command.Parameters["companyId"].Value = aStock.ComapanyId;

                Command.Parameters.Add("stockOutQuantity", SqlDbType.Int);
                Command.Parameters["stockOutQuantity"].Value = aStock.OutQuantity;

                Command.Parameters.Add("stockOutType", SqlDbType.VarChar);
                Command.Parameters["stockOutType"].Value = aStock.StockOutType;

                Command.Parameters.Add("date", SqlDbType.Date);
                Command.Parameters["date"].Value = aStock.Date;

                Command.Parameters.Add("itemName", SqlDbType.VarChar);
                Command.Parameters["itemName"].Value = aStock.Name;

                Connection.Open();
                rowAffect = Command.ExecuteNonQuery();
                Connection.Close();
            }
            return rowAffect;

        }

        public int StockInDelete(List<Item> items)
        {
            int rowAffect = 0;
            foreach (Item stockOut in items)
            {
                Query =
                    "UPDATE Items SET AvailableQuantity=AvailableQuantity-@stockOut WHERE ItemName=@itemName AND CompanyId=@companyId";
                Command = new SqlCommand(Query, Connection);

                Command.Parameters.Clear();
                Command.Parameters.Add("stockOut", SqlDbType.Int);
                Command.Parameters["stockOut"].Value = stockOut.OutQuantity;

                Command.Parameters.Add("itemName", SqlDbType.VarChar);
                Command.Parameters["itemName"].Value = stockOut.Name;

                Command.Parameters.Add("companyId", SqlDbType.Int);
                Command.Parameters["companyId"].Value = stockOut.ComapanyId;

                Connection.Open();
                rowAffect = Command.ExecuteNonQuery();
                Connection.Close();

            }
            return rowAffect;
        }

        public List<Item> GetSalesBetweenDates(string fromDate, string toDate)
        {
            List<Item> items = new List<Item>();
            Query =
                "SELECT ItemName,SUM(StockOutQuantity) AS TotalSale FROM StockOut WHERE StockOutType='Sell' AND Date BETWEEN @fromDate AND @toDAte Group By ItemName";
            Command = new SqlCommand(Query, Connection);

            Command.Parameters.AddWithValue("@fromDate", fromDate);
            Command.Parameters.AddWithValue("@toDate", toDate);
            Connection.Open();
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {

                while (Reader.Read())
                {
                    Item aItem = new Item();
                    aItem.Name = Reader["ItemName"].ToString();
                    aItem.OutQuantity = Convert.ToInt32(Reader["TotalSale"]);
                    items.Add(aItem);
                }
            }
            Connection.Close();
            return items;
        }
    }
}