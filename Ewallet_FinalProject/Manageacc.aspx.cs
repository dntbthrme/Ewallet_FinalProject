using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Imaging;
using System.IO;

namespace Ewallet_FinalProject
{
    public partial class Manageacc : System.Web.UI.Page
    {
        string connstring = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\VOYAGER\Downloads\Ewallet_FinalProject\Ewallet_FinalProject\Ewallet_FinalProject\App_Data\FinalProject.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ManageBtn_Click(object sender, EventArgs e)
        {
            using (var DATABASE = new SqlConnection(connstring))
            {
                DATABASE.Open();

                using (var cmd2 = DATABASE.CreateCommand())
                {
                    cmd2.CommandType = CommandType.Text;
                    cmd2.CommandText = "UPDATE EWALLET SET "
                                    + " IsDeactivated = @deact "
                                    + " WHERE ACCOUNTNUM = '" + Session["ACCOUNTNUM"] + "'";
                    cmd2.Parameters.AddWithValue("@deact", 1);

                    int ctr = cmd2.ExecuteNonQuery();
                    if (ctr >= 1)
                    {
                        Session.Clear();
                        Response.Redirect("Login.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Ooopss.. something missing')</script>");
                    }

                }
                DATABASE.Close();
            }
        }
    }
}