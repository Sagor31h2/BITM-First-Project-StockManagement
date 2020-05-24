using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemApp.DAL.Gateway;
using StockManagementSystemApp.DAL.Model;

namespace StockManagementSystemApp.BLL
{
    public class ItemManager
    {
        ItemGateway aItemGateway = new ItemGateway();
        public string Save(Item aItem)
        {
            if (aItemGateway.CheckSameItemName(aItem))
            {
                return "Item already Exsits";
            }
                if (aItemGateway.Save(aItem) > 0)
                {
                    return "Saved Successful";
                }
                else
                {
                    return "Saving Falied";
                }
            
        }

    }
}