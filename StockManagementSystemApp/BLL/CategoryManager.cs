using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemApp.DAL.Gateway;
using StockManagementSystemApp.DAL.Model;

namespace StockManagementSystemApp.BLL
{
    public class CategoryManager
    {
        CategoryGateway aCategoryGateway = new CategoryGateway();

        public string Save(Category aCategory)
        {
            if (aCategoryGateway.CheckSameCategoryName(aCategory))
            {
                return "Category already Exsits";
            }
            else
            {
                if (aCategoryGateway.Save(aCategory) > 0)
                {
                    return "Saved Successful";
                }
                else
                {
                    return "Saving Falied";
                }
            }
        }

        public List<Category> GetAllCategories()
        {
            return aCategoryGateway.GetAllCategories();
        }

        public string Upadate(Category aCategory)
        {
            if (aCategoryGateway.CheckSameCategoryName(aCategory))
            {
                return "Category already Exsits";
            }
            else
            {
                if (aCategoryGateway.Update(aCategory) > 0)
                {
                    return "Update Successful";
                }
                else
                {
                    return "Update Failed";
                }  
            }
           
        }
    }
}