using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagementSystemApp.DAL.Model
{
    [Serializable]
    public class Item
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int CategoryId { get; set; }
        public int ComapanyId { get; set; }
        public string CompanyName { get; set; }
        public int Reorder { get; set; }
        public int AvailableQuantity { get; set; }
        public int InQuantiy { get; set; }
       public int OutQuantity { get; set; }
        public string Date { get; set; }
        public string StockOutType { get; set; }

        public Item()
        {
            Reorder = 0;
            AvailableQuantity = 0;
        }
    }
}