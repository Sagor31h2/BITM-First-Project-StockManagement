using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using StockManagementSystemApp.DAL.Model;

namespace StockManagementSystemApp.DAL.Gateway
{
    public class ItemGateway : Gateway
    {
        public bool CheckSameItemName(Item aItem)
        {

            Query = "SELECT * FROM Items WHERE ItemName = '" + aItem.Name + "'";

            Command = new SqlCommand(Query, Connection);

            Connection.Open();

            Reader = Command.ExecuteReader();

            bool hasRow = false;

            if (Reader.HasRows)
            {
                hasRow = true;
            }

            Reader.Close();
            Connection.Close();

            return hasRow;
        }
        public int Save(Item aItem)
        {
            Query = "INSERT INTO Items VALUES('" + aItem.Name + "','"+ aItem.CategoryId +"','"+ aItem.ComapanyId +"','"+ aItem.Reorder +"')";

            Command = new SqlCommand(Query, Connection);
            Connection.Open();

            int rowAffected = Command.ExecuteNonQuery();

            Connection.Close();
            return rowAffected;

        }

       
    }
}