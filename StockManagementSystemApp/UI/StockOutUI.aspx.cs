using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystemApp.BLL;
using StockManagementSystemApp.DAL.Model;

namespace StockManagementSystemApp.UI
{
[Serializable]
    public partial class StockOutUI : System.Web.UI.Page
    {
        private StockOutManager aStockOutManager = new StockOutManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Company> companies = aStockOutManager.GetAllCompanies();
                companyDropDownList.DataSource = companies;
                companyDropDownList.DataValueField = "Id";
                companyDropDownList.DataTextField = "CompanyName";
                companyDropDownList.DataBind();

                List<Item> allStockOut = new List<Item>();
                ViewState["Items"] = allStockOut;
            }
            reorderLavelTextBox.Enabled = false;
            availableQuantityTextBox.Enabled = false;
        }

        protected void companyDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<Item> items = aStockOutManager.GetAllItems(Convert.ToInt32(companyDropDownList.SelectedValue));
            itemDropDownList.DataSource = items;
            itemDropDownList.DataValueField = "Id";
            itemDropDownList.DataTextField = "Name";
            itemDropDownList.DataBind();

            PopulateItems();
        }

        protected void itemDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            PopulateItems();
        }

        private void PopulateItems()
        {
            Item aItem = aStockOutManager.GetItemWithQuantity(Convert.ToInt32(itemDropDownList.SelectedValue));

            reorderLavelTextBox.Text = aItem.Reorder.ToString();
            availableQuantityTextBox.Text = aItem.AvailableQuantity.ToString();
            idHiddenField.Value = aItem.Id.ToString();

        }

        protected void addButton_Click(object sender, EventArgs e)
        {
            int stockOutAmount;
            if (companyDropDownList.SelectedValue!=String.Empty && 
                itemDropDownList.SelectedValue!=string.Empty &&
                availableQuantityTextBox.Text!=string.Empty &&
                stockOutQuantityTextBox.Text!=string.Empty &&

                int.TryParse(stockOutQuantityTextBox.Text, out stockOutAmount))
            {
                Item aItem = new Item();

                aItem.Name = itemDropDownList.SelectedItem.Text;
                aItem.Id = Convert.ToInt32(itemDropDownList.SelectedValue);
                aItem.ComapanyId = Convert.ToInt32(companyDropDownList.SelectedValue);
                aItem.CompanyName = companyDropDownList.SelectedItem.Text;
                aItem.OutQuantity = stockOutAmount;
                aItem.Date = DateTime.Today.ToString("yy-MM-dd");

                if (stockOutAmount>0 && stockOutAmount<=Convert.ToInt32(availableQuantityTextBox.Text))
                {
                    List<Item> items = (List<Item>)ViewState["Items"];
                     int f = 0;
                    foreach (Item stockOut in items)
                    {
                        if (stockOut.ComapanyId==aItem.ComapanyId && stockOut.Id==aItem.Id)
                        {
                            stockOut.OutQuantity += aItem.OutQuantity;
                            availableQuantityTextBox.Text =
                                (Convert.ToInt32(availableQuantityTextBox.Text)-stockOutAmount).ToString();

                            stockOutGrid.DataSource = items;
                            stockOutGrid.DataBind();
                            f = 1;
                            break;
                        }
                    }
                    if (f==0)
                    {
                        items.Add(aItem);
                        availableQuantityTextBox.Text =
                               (Convert.ToInt32(availableQuantityTextBox.Text) - stockOutAmount).ToString();

                        stockOutGrid.DataSource = items;
                        stockOutGrid.DataBind();
                    }
                    ViewState["Items"] = items;

                }
                else
                {
                    messageLabel.Text = "Failed";
                }
             
            }
            else
            {
                messageLabel.Text = "Failed";
            }

        }

        protected void sellButton_Click(object sender, EventArgs e)
        {
            List<Item> items=new List<Item>();
            items = (List<Item>)ViewState["Items"];
            foreach (Item stockOut in items)
            {
                stockOut.StockOutType = "Sell";
            }
            messageLabel.Text = aStockOutManager.Save(items);

            List<Item> allStockOut = new List<Item>();
            ViewState["Items"] = allStockOut;

            EmptyAll();

        }

        protected void damageButton_Click(object sender, EventArgs e)
        {
            List<Item> items = new List<Item>();
            items = (List<Item>)ViewState["Items"];
            foreach (Item stockOut in items)
            {
                stockOut.StockOutType = "Damage";
            }
            messageLabel.Text = aStockOutManager.Save(items);

            List<Item> allStockOut = new List<Item>();
            ViewState["Items"] = allStockOut;

           EmptyAll();
        }

        protected void lostButton_Click(object sender, EventArgs e)
        {
            List<Item> items = new List<Item>();
            items = (List<Item>)ViewState["Items"];
            foreach (Item stockOut in items)
            {
                stockOut.StockOutType = "Lost";
            }
            messageLabel.Text = aStockOutManager.Save(items);

            List<Item> allStockOut = new List<Item>();
            ViewState["Items"] = allStockOut;

            
            EmptyAll();
        }

   protected void EmptyAll()
    {
        stockOutGrid.DataSource = null;
        stockOutGrid.DataBind();

        companyDropDownList.Items.Clear();
        itemDropDownList.Items.Clear();
        availableQuantityTextBox.Text = String.Empty;
        reorderLavelTextBox.Text = String.Empty;
        stockOutQuantityTextBox.Text = String.Empty;
    }
    
    }
}