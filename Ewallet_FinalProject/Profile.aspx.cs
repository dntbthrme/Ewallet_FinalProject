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
    public partial class WebForm1 : System.Web.UI.Page
    {
        string connstring = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\VOYAGER\Downloads\Ewallet_FinalProject\Ewallet_FinalProject\Ewallet_FinalProject\App_Data\FinalProject.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            var ACCOUNT = Session["ACCOUNTNUM"];
            using (var DATABASE = new SqlConnection(connstring))
            {
                DATABASE.Open();

                using (var cmd = DATABASE.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT *, CONVERT(varchar, DOB, 107) AS DateOfBirth FROM EWALLET WHERE ACCOUNTNUM = '" + ACCOUNT + "'";

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            byte[] pic = (byte[])reader["IMAGE"];
                            string str = Convert.ToBase64String(pic);
                            Image1.ImageUrl = "data:image/jpg;base64," + str;
                            LastnameLbl.Text = reader["LASTNAME"].ToString();
                            FirstnameLbl.Text = reader["FIRSTNAME"].ToString();
                            AccountnumLbl.Text = reader["ACCOUNTNUM"].ToString();
                            DateregisteredLbl.Text = reader["DATEREGISTERED"].ToString();
                            EmailaddressLbl.Text = reader["EMAILADDRESS"].ToString();
                            UsernameLbl.Text = reader["USERNAME"].ToString();
                            PhonenumLbl.Text = reader["MOBILENUMBER"].ToString();
                            DOBLbl.Text = reader["DateOfBirth"].ToString();

                        }
                        else
                        {
                            Response.Write("<script>alert('Record is not saved')</script>");
                        }
                    }

                }
                DATABASE.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Changepassword.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reports.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Updatephoto.aspx");
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Updateemail.aspx");
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Updateusername.aspx");
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Updatephonenum.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manageacc.aspx");
        }
    }
}