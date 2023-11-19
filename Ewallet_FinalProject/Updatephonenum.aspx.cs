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
    public partial class Updatephonenum : System.Web.UI.Page
    {
        string connstring = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\VOYAGER\Downloads\Ewallet_FinalProject\Ewallet_FinalProject\Ewallet_FinalProject\App_Data\FinalProject.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }

        protected void PhonenumChangeBtn_Click(object sender, EventArgs e)
        {

            using (var DATABASE = new SqlConnection(connstring))
            {
                DATABASE.Open();

                using (var cmd = DATABASE.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT ACCOUNTNUM FROM EWALLET WHERE ACCOUNTNUM = '" + Session["ACCOUNTNUM"] + "' AND MOBILENUMBER = '" + PhoneUpdateTxtbox.Text + "'";
                    DataTable DataT = new DataTable();
                    SqlDataAdapter DataA = new SqlDataAdapter(cmd);

                    DataA.Fill(DataT);
                    if (DataT.Rows.Count == 1)
                    {
                        Label1.ForeColor = System.Drawing.Color.Red;
                        Label1.Text = "Please enter new phone number!!";
                    }
                    else
                    {
                        using (var cmd2 = DATABASE.CreateCommand())
                        {
                            cmd2.CommandType = CommandType.Text;
                            cmd2.CommandText = "UPDATE EWALLET SET "
                                            + " MOBILENUMBER = @num "
                                            + " WHERE ACCOUNTNUM = '" + Session["ACCOUNTNUM"] + "'";
                            cmd2.Parameters.AddWithValue("@num", PhoneUpdateTxtbox.Text);

                            int ctr = cmd2.ExecuteNonQuery();
                            if (ctr >= 1)
                            {
                                PhonenumUpdatePanel.Visible = false;
                                Panel1.Visible = true;
                            }
                            else
                            {
                                Response.Write("<script>alert('Ooopss.. something missing')</script>");
                            }

                        }
                    }
                }
                DATABASE.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }
    }
}