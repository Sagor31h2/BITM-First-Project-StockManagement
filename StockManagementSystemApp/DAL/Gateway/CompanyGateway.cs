using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using StockManagementSystemApp.DAL.Model;

namespace StockManagementSystemApp.DAL.Gateway
{
    public class CompanyGateway : Gateway
    {
        public bool CheckSameCompanyName(Company aCompany)
        {

            Query = "SELECT * FROM Company WHERE CompanyName = '" + aCompany.CompanyName + "'";

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
        public int Save(Company aCompany)
        {
            Query = "INSERT INTO Company VALUES('" + aCompany.CompanyName + "')";

            Command = new SqlCommand(Query, Connection);
            Connection.Open();

            int rowAffected = Command.ExecuteNonQuery();

            Connection.Close();
            return rowAffected;

        }

        public List<Company> GetAllCompanies()
        {

            Query = "SELECT * FROM Company";

            Command = new SqlCommand(Query, Connection);

            Connection.Open();

            Reader = Command.ExecuteReader();

            List<Company> companies = new List<Company>();

            while (Reader.Read())
            {
               Company aCompany  =new Company();
                aCompany.Id = (int)Reader["Id"];
                aCompany.CompanyName = Reader["CompanyName"].ToString();
                companies.Add(aCompany);
            }
            Reader.Close();
            Connection.Close();

            return companies;

        }
    }
}