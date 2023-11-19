using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ewallet_FinalProject
{
    public partial class CashInOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CashInBtn_Click(object sender, EventArgs e)
        {
            // Redirecting into the deposit page.
            Response.Redirect("Deposit.aspx");
        }

        protected void CashOutBtn_Click(object sender, EventArgs e)
        {
            // Redirecting into the withdrawal page
            Response.Redirect("Withdraw.aspx");
        }
    }
}