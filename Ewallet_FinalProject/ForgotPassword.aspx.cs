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
    public partial class ForgotPassword : System.Web.UI.Page
    {
        string connstring = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\VOYAGER\Downloads\Ewallet_FinalProject\Ewallet_FinalProject\Ewallet_FinalProject\App_Data\FinalProject.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void NextBtn_Click(object sender, EventArgs e)
        {
            var email = VerifyEmailTxtbox.Text;
            using (var DATABASE = new SqlConnection(connstring))
            {
                DATABASE.Open();

                using (var cmd = DATABASE.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT * FROM EWALLET WHERE EMAILADDRESS = '" + email + "'";

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            VerificationPanel.Visible = false;
                            ChangepasswordPanel.Visible = true;
                            Session["resetpassemail"] = reader["EMAILADDRESS"].ToString(); ;
                        }
                        else
                        {
                            Label1.ForeColor = System.Drawing.Color.Red;
                            Label1.Text = "Email not found!!";
                        }
                    }

                }
                DATABASE.Close();
            }

        }

        protected void ResetpassBtn_Click(object sender, EventArgs e)
        {
            using (var DATABASE = new SqlConnection(connstring))
            {
                DATABASE.Open();

                using (var cmd = DATABASE.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT EMAILADDRESS FROM EWALLET WHERE EMAILADDRESS = '" + Session["resetpassemail"] + "' AND PASSWORD = '" + ConfirmpassTxtbox.Text + "'";
                    DataTable DataT = new DataTable();
                    SqlDataAdapter DataA = new SqlDataAdapter(cmd);

                    DataA.Fill(DataT);
                    if (DataT.Rows.Count == 1)
                    {
                        Label2.ForeColor = System.Drawing.Color.Red;
                        Label2.Text = "Please enter a new password!!";
                    }
                    else
                    {
                        using (var cmd2 = DATABASE.CreateCommand())
                        {
                            cmd2.CommandType = CommandType.Text;
                            cmd2.CommandText = "UPDATE EWALLET SET "
                                            + " PASSWORD = @pass "
                                            + " WHERE EMAILADDRESS ='" + Session["resetpassemail"] + "'";
                            cmd2.Parameters.AddWithValue("@pass", ConfirmpassTxtbox.Text);

                            int ctr = cmd2.ExecuteNonQuery();
                            if (ctr >= 1)
                            {
                                Response.Write("<script>alert('YOU RESET YOURE PASSWORD')</script>");
                                Response.Redirect("Login.aspx");
                            }
                            else
                            {
                                Response.Write("<script>alert('Password not change!!')</script>");
                            }

                        }
                    }
                }
                DATABASE.Close();

            }
        }

    }
}