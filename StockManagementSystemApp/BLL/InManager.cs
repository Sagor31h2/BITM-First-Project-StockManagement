using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemApp.DAL.Gateway;
using StockManagementSystemApp.DAL.Model;

namespace StockManagementSystemApp.BLL
{
    
    public class InManager
    {
        InGateway aInGateway = new InGateway();

        public string Save(Item aItem)
        {
            if (aInGateway.Upadate(aItem) > 0)
            {
                return "Save successful";
            }
            if (aInGateway.Save(aItem) > 0)
            {
                return "Quantity enters successfully";
            }
            else
            {
                return "Entering Failed";
            }
        }

        public List<Item> GetItems(int id)
        {
            return aInGateway.GetItems(id);
        }

        public Item GetItemWithQuantity(int id)
        {
            return aInGateway.GetItemsWithQuantity(id);
        }
    }
    
}