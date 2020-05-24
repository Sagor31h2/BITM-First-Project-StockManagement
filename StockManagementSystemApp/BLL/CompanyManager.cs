using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemApp.DAL.Gateway;
using StockManagementSystemApp.DAL.Model;

namespace StockManagementSystemApp.BLL
{
    public class CompanyManager
    {
        CompanyGateway aCompanyGateway = new CompanyGateway();
        public string Save(Company aCompany)
        {
            if (aCompanyGateway.CheckSameCompanyName(aCompany))
            {
                return "Company already Exsits";
            }
            else
            {
                if (aCompanyGateway.Save(aCompany) > 0)
                {
                    return "Saved Successful";
                }
                else
                {
                    return "Saving Falied";
                }
            }
        }

        public List<Company> GetAllCompanies()
        {
            return aCompanyGateway.GetAllCompanies();
        }
    }
}