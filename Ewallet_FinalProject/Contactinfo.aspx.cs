using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ewallet_FinalProject
{
    public partial class Contactinfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ContactInfoRadioButtonList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ContactInfoRadioButtonList.SelectedIndex == 0)
            {
                EmailUpdatePanel.Visible = true;
                PhonenumUpdatePanel.Visible = false;
            }
            if (ContactInfoRadioButtonList.SelectedIndex == 1)
            {
                EmailUpdatePanel.Visible = false;
                PhonenumUpdatePanel.Visible = true;
            }
        }
    }
}