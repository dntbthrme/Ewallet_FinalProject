using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ewallet_FinalProject
{
    public partial class Reports1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DWBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("DWReports.aspx");
        }

        protected void SRBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("SRReports.aspx");
        }
    }
}