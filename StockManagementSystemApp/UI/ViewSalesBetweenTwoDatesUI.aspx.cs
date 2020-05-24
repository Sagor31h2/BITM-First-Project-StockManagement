using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystemApp.BLL;

namespace StockManagementSystemApp.UI
{
    public partial class ViewSalesBetweenTwoDatesUI : System.Web.UI.Page
    { StockOutManager aStockOutManager=new StockOutManager();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
             string fromDate = fromDayDropDownList.SelectedValue + "/" + fromMonthDropDownList.SelectedValue + "/" + fromYearDropDownList.SelectedValue;
            DateTime fromDateTime = Convert.ToDateTime(fromDate);
            string toDate = toDayDropDownList.SelectedValue + "/" + toMonthDropDownList.SelectedValue + "/" + toYearDropDownList.SelectedValue;
            DateTime toDateTime = Convert.ToDateTime(toDate);
            int result = DateTime.Compare(fromDateTime, toDateTime);

            if (result <= 0)
            {
                viewSalesGridView.DataSource = aStockOutManager.GetAllSalesBetweenDates(fromDateTime.ToString("yyyy-MM-dd"),
                        toDateTime.ToString("yyyy-MM-dd"));
                viewSalesGridView.DataBind();
            }
            else
            {
                messageLabel.Text = "No sales record found";
            }
        }
    }
}