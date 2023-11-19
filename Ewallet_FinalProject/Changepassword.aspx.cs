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
    public partial class Change_password : System.Web.UI.Page
    {
        string connstring = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\VOYAGER\Downloads\Ewallet_FinalProject\Ewallet_FinalProject\Ewallet_FinalProject\App_Data\FinalProject.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ChangepassBtn_Click(object sender, EventArgs e)
        {
            using (var DATABASE = new SqlConnection(connstring))
            {
                DATABASE.Open();

                using (var cmd = DATABASE.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT ACCOUNTNUM FROM EWALLET WHERE ACCOUNTNUM = '" + Session["ACCOUNTNUM"] + "' AND PASSWORD = '" + CurrentpassTxtbox.Text + "'"; //Query that check whether the entered current password is correct.
                    DataTable DataT = new DataTable();
                    SqlDataAdapter DataA = new SqlDataAdapter(cmd);

                    DataA.Fill(DataT);
                    //If the current password is correct.
                    if (DataT.Rows.Count == 1)
                    {
                        using (var cmd1 = DATABASE.CreateCommand())
                        {
                            cmd1.CommandType = CommandType.Text;
                            cmd1.CommandText = "SELECT * FROM EWALLET WHERE ACCOUNTNUM = '" + Session["ACCOUNTNUM"] + "' AND PASSWORD = '" + NewpassTxtbox.Text + "'";//Query that check whether the entered new password is the same of the current password.

                            using (SqlDataReader reader = cmd1.ExecuteReader())
                            {
                                //If it is the same, an error message will appear.
                                if (reader.Read())
                                {
                                    Label2.ForeColor = System.Drawing.Color.Red;
                                    Label2.Text = "Input new password!!";
                                }
                                //Else, it allow the user to change its password.
                                else
                                {
                                    reader.Close();
                                    using (var cmd2 = DATABASE.CreateCommand())
                                    {
                                        cmd2.CommandType = CommandType.Text;
                                        cmd2.CommandText = "UPDATE EWALLET SET "
                                                        + " PASSWORD = @pass "
                                                        + " WHERE ACCOUNTNUM = '" + Session["ACCOUNTNUM"] + "'";
                                        cmd2.Parameters.AddWithValue("@pass", ConfirmpassTxtbox.Text);

                                        int ctr = cmd2.ExecuteNonQuery();
                                        if (ctr >= 1)
                                        {
                                            Response.Write("<script>alert('Password changed..')</script>");
                                            Response.Redirect("profile.aspx");
                                        }
                                        else
                                        {
                                            Response.Write("<script>alert('Password not change!!')</script>");
                                        }

                                    }
                                }
                            }

                        }
                    }
                    //Else, an error message will appear.
                    else
                    {
                        Label1.ForeColor = System.Drawing.Color.Red;
                        Label1.Text = "Wrong current password!!";
                    }
                    DATABASE.Close();
                }
            }
        }
    }
}