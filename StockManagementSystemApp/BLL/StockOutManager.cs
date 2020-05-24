using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemApp.DAL.Gateway;
using StockManagementSystemApp.DAL.Model;

namespace StockManagementSystemApp.BLL
{ 
    public class StockOutManager
    {
        StockOutGateWay aStockOutGateWay=new StockOutGateWay();

        public List<Company> GetAllCompanies()
        {
            return aStockOutGateWay.GetAllCompanies();
        }
        public List<Item> GetAllItems(int id)
        {
            return aStockOutGateWay.GetAllItems(id);
        }

        public Item GetItemWithQuantity(int id)
        {
            return aStockOutGateWay.GetItemsWithQuantity(id);
        }

        public string Save(List<Item> items)
        {
            int rowAffect1 = aStockOutGateWay.Save(items);
            int rowAffect2 = aStockOutGateWay.StockInDelete(items);
            if (rowAffect1 > 0 && rowAffect2 > 0)
            {
                return "Successful";
            }
            return "Failed";
        }

        public List<Item> GetAllSalesBetweenDates(string fromDate, string toDate)
        {
          return  aStockOutGateWay.GetSalesBetweenDates(fromDate, toDate);
        }
    }
}