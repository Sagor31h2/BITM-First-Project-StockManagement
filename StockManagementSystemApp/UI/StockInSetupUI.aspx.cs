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
    public partial class StockInSetupUI : System.Web.UI.Page
    {
        CompanyManager aCompanyManager = new CompanyManager();
        InManager aInManager = new InManager();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                List<Company> companies = aCompanyManager.GetAllCompanies();
                companyDropDownList.DataSource = companies;
                companyDropDownList.DataValueField = "Id";
                companyDropDownList.DataTextField = "CompanyName";
                companyDropDownList.DataBind();
            }

            showReorderLebelTextBox.Enabled = false;
            showAvailableQuantityTextBox.Enabled = false;

        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            Item aItem = new Item();
            aItem.InQuantiy = Convert.ToInt32(stockInQuantityTextBox.Text);
            aItem.AvailableQuantity = Convert.ToInt32(stockInQuantityTextBox.Text);
            aItem.Id = Convert.ToInt32(idHiddenField.Value);

            messageLabel.Text = aInManager.Save(aItem);

        }

        protected void companyDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<Item> items = aInManager.GetItems(Convert.ToInt32(companyDropDownList.SelectedValue));

                itemDropDownList.DataSource = items;
                itemDropDownList.DataValueField = "Id";
                itemDropDownList.DataTextField = "Name";
                itemDropDownList.DataBind();
            
        }

        protected void itemDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            Item aItem = aInManager.GetItemWithQuantity(Convert.ToInt32(itemDropDownList.SelectedValue));

            showReorderLebelTextBox.Text = aItem.Reorder.ToString();
            showAvailableQuantityTextBox.Text = aItem.AvailableQuantity.ToString();
            idHiddenField.Value = aItem.Id.ToString();

        }
    }
}