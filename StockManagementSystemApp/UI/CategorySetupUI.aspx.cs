using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mime;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystemApp.BLL;
using StockManagementSystemApp.DAL.Model;

namespace StockManagementSystemApp.UI
{
    public partial class CatagorySetupUI : System.Web.UI.Page
    {
        CategoryManager aCategoryManager = new CategoryManager();
        protected void Page_Load(object sender, EventArgs e)
        {

            PopulateGridView();
        }
        private void PopulateGridView()
        {
            List<Category> categories = aCategoryManager.GetAllCategories();
            categoriesGridView.DataSource = categories;
            categoriesGridView.DataBind();
        }


        protected void saveButton_Click(object sender, EventArgs e)
        {
            if (saveButton.Text == "Save")
            {
                Category category = new Category();

                category.CategoryName = nameTextBox.Text;

                messageLabel.Text = aCategoryManager.Save(category);
            }
            else if (saveButton.Text == "Update")
            {
                Category aCategory=new Category();
                aCategory.Id = Convert.ToInt32(storeHiddenField.Value);
                aCategory.CategoryName = nameTextBox.Text;

                messageLabel.Text = aCategoryManager.Upadate(aCategory);
            }


            //if (nameTextBox.Text == "")
            //{
            //    PopulateGridView();
            //}
            
        }


        protected void categoriesGridView_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["ondblclick"] = ClientScript.GetPostBackClientHyperlink(categoriesGridView,
                    "Select$" + e.Row.DataItemIndex);
            }

        }

        protected void categoriesGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = categoriesGridView.SelectedRow;
            if (row!=null)
            {
                HiddenField hiddenField = (HiddenField)row.FindControl("idHiddenfield");
                storeHiddenField.Value = hiddenField.Value;

                Label aLabel = (Label)row.FindControl("categoryNameLabel");

                nameTextBox.Text = aLabel.Text;

                saveButton.Text = "Update";
            }

        }
    }
}