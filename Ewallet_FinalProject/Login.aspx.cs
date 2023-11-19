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
    public partial class Login : System.Web.UI.Page
    {
        string connstring = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\VOYAGER\Downloads\Ewallet_FinalProject\Ewallet_FinalProject\Ewallet_FinalProject\App_Data\FinalProject.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ForgotpassBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgotPassword.aspx");
        }

        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            using (var DATABASE = new SqlConnection(connstring))
            {
                DATABASE.Open();

                using (var cmd = DATABASE.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT * FROM EWALLET WHERE USERNAME = '" + UsernameTxtbox.Text + "' AND PASSWORD = '" + PasswordTxtbox.Text + "' AND IsDeactivated = '" + 0 + "'";
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            Session["ACCOUNTNUM"] = reader["ACCOUNTNUM"].ToString();
                            Response.Redirect("Home.aspx");
                        }
                        else
                        {
                            StatusLbl.Text = "The username or the password you  entered did not match our records. Please doublecheck and try again.";
                        }
                    }
                }
                DATABASE.Close();
            }
        }
    }
}