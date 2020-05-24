using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystemApp.BLL;
using StockManagementSystemApp.DAL.Model;

namespace StockManagementSystemApp.UI
{
    public partial class ItemSetupUI : System.Web.UI.Page
    {
        ItemManager aItemManager = new ItemManager();
        CategoryManager aCategoryManager = new CategoryManager();
        CompanyManager aCompanyManager = new CompanyManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Category> categories = aCategoryManager.GetAllCategories();
                categoryDropDownList.DataSource = categories;
                categoryDropDownList.DataValueField = "Id";
                categoryDropDownList.DataTextField = "CategoryName";
                categoryDropDownList.DataBind();

                List<Company> companies = aCompanyManager.GetAllCompanies();
                companyDropDownList.DataSource = companies;
                companyDropDownList.DataValueField = "Id";
                companyDropDownList.DataTextField = "CompanyName";
                companyDropDownList.DataBind();
            }


        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            Item aItem = new Item();

            aItem.Name = itemNameTextBox.Text;
            aItem.CategoryId = Convert.ToInt32(categoryDropDownList.SelectedValue);
            aItem.ComapanyId = Convert.ToInt32(companyDropDownList.SelectedValue);
            aItem.Reorder = Convert.ToInt32(reorderTextBox.Text);

            messageLabel.Text = aItemManager.Save(aItem);
        }
    }
}