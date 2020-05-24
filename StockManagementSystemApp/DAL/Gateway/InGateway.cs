using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using StockManagementSystemApp.DAL.Model;

namespace StockManagementSystemApp.DAL.Gateway
{
    public class InGateway : Gateway
    {
        public int Save(Item aItem)
        {
            Query = "UPDATE Items SET AvailableQuantity = '"+ aItem.AvailableQuantity+"', InQuantity = '"+ aItem.InQuantiy+"' WHERE Id = '"+ aItem.Id +"'";

            Command = new SqlCommand(Query, Connection);
            Connection.Open();

            int rowAffected = Command.ExecuteNonQuery();

            Connection.Close();
            return rowAffected;

        }
        public List<Item> GetItems(int id)
        {

            Query = "SELECT * FROM Items WHERE CompanyId = '"+ id +"'";

            Command = new SqlCommand(Query, Connection);

            Connection.Open();

            Reader = Command.ExecuteReader();

            List<Item> items = new List<Item>();

            while (Reader.Read())
            {
                Item aItem = new Item();
                aItem.Id = (int)Reader["Id"];
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
                aItem.AvailableQuantity = (int)Reader["AvailableQuantity"];
            }

            Reader.Close();
            Connection.Close();

            return aItem;
        }
        public int UpdateSameItems(Item aItem)
        {

            Query = "SELECT * FROM Items WHERE Id = '" + aItem.Id + "'";

            Command = new SqlCommand(Query, Connection);

            Connection.Open();

            Reader = Command.ExecuteReader();

            int totalInQuantity = aItem.InQuantiy;
            //int totalAvailableQuantity = aItem.AvailableQuantity;
            while (Reader.Read())
            {
                aItem = new Item();
                aItem.Id = (int)Reader["Id"];
               
                totalInQuantity += aItem.InQuantiy;
                //totalAvailableQuantity += aItem.AvailableQuantity;
            }
            Reader.Close();
            Connection.Close();

            return totalInQuantity;
        }

        public int Upadate(Item aItem)
        {
            Query = "UPDATE Items SET InQuantity ='" + UpdateSameItems(aItem) + "',AvailableQuantity = '"+UpdateSameItems(aItem)+"' WHERE Id = '" + aItem.Id + "'";

            Command = new SqlCommand(Query, Connection);
            Connection.Open();

            int rowAffected = Command.ExecuteNonQuery();

            Connection.Close();

            return rowAffected;
        }
    }
}