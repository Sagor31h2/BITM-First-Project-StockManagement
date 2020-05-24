using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using StockManagementSystemApp.DAL.Model;

namespace StockManagementSystemApp.DAL.Gateway
{
    public class CategoryGateway : Gateway
    {
        public bool CheckSameCategoryName(Category aCategory)
        {

            Query = "SELECT * FROM Category WHERE CategoryName = '" + aCategory.CategoryName + "'";

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
        public int Save(Category aCategory)
        {
            Query = "INSERT INTO Catagory VALUES('" + aCategory.CategoryName + "')";

            Command = new SqlCommand(Query,Connection);
            Connection.Open();

            int rowAffected = Command.ExecuteNonQuery();

            Connection.Close();
            return rowAffected;

        }

        public List<Category> GetAllCategories()
        {
        
            Query = "SELECT * FROM Category";

            Command = new SqlCommand(Query, Connection);

            Connection.Open();

            Reader = Command.ExecuteReader();

            List<Category> categories = new List<Category>();

            while (Reader.Read())
            {
                Category category = new Category();
                category.Id = (int)Reader["Id"];
                category.CategoryName = Reader["CategoryName"].ToString();
                categories.Add(category);
            }
            Reader.Close();
            Connection.Close();

            return categories;
        
        }
        public int Update(Category aCategory)
        {

            Query =
                "UPDATE Category SET CategoryName = '" + aCategory.CategoryName + "' WHERE Id=" + aCategory.Id + "";

            Command = new SqlCommand(Query, Connection);

            Connection.Open();

            int rowAffected = Command.ExecuteNonQuery();

            Connection.Close();

            return rowAffected;
        }
    }
}