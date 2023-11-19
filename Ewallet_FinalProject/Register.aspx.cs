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
    public partial class Register : System.Web.UI.Page
    {
        string connstring = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\VOYAGER\Downloads\Ewallet_FinalProject\Ewallet_FinalProject\Ewallet_FinalProject\App_Data\FinalProject.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisteredBtn_Click(object sender, EventArgs e)
        {
            string lname = LastnameTxtbox.Text;
            string fname = FirstnameTxtbox.Text;
            string email = EmailTxtbox.Text;
            string username = UsernameRTxtbox.Text;
            string password = PasswordRTxtbox.Text;
            string mobilenum = MobilenumTxtbox.Text;
            string dob = DOBTxtbox.Text;

            HttpPostedFile postedFile = FileUpload1.PostedFile;
            string Picture = Path.GetFileName(postedFile.FileName);
            string PicTxt = Path.GetExtension(Picture).ToLower();
            int PicSize = postedFile.ContentLength;
            byte[] Pic = new byte[FileUpload1.PostedFile.ContentLength];
            FileUpload1.PostedFile.InputStream.Read(Pic, 0, FileUpload1.PostedFile.ContentLength);


            using (var DATABASE = new SqlConnection(connstring))
            {
                DATABASE.Open();

                using (var cmd = DATABASE.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT * FROM EWALLET WHERE USERNAME = '" + UsernameRTxtbox.Text + "'";
                    DataTable DataT = new DataTable();
                    SqlDataAdapter DataA = new SqlDataAdapter(cmd);

                    DataA.Fill(DataT);
                    if (DataT.Rows.Count > 0)
                    {
                        Label1.ForeColor = System.Drawing.Color.Red;
                        Label1.Text = "Username Already Exist!!";
                    }
                    else
                    {

                        if (PicTxt == ".jpg")
                        {
                            using (var cmd2 = DATABASE.CreateCommand())
                            {
                                cmd2.CommandType = CommandType.Text;
                                cmd2.CommandText = "INSERT INTO EWALLET (LASTNAME, FIRSTNAME, EMAILADDRESS, USERNAME, PASSWORD, MOBILENUMBER, DOB, IMAGE)"
                                            + "VALUES (@l, @f, @email, @user, @pass, @mobile, @dob, @image)";//sql statement 

                                cmd2.Parameters.AddWithValue("@l", lname);
                                cmd2.Parameters.AddWithValue("@f", fname);
                                cmd2.Parameters.AddWithValue("@email", email);
                                cmd2.Parameters.AddWithValue("@user", username);
                                cmd2.Parameters.AddWithValue("@pass", password);
                                cmd2.Parameters.AddWithValue("@mobile", mobilenum);
                                cmd2.Parameters.AddWithValue("@dob", dob);
                                cmd2.Parameters.AddWithValue("@image", Pic);

                                var ctr = cmd2.ExecuteNonQuery();

                                if (ctr >= 1)
                                {
                                    Response.Write("<script>alert('REGISTERED SUCCESSFULLY')</script>");
                                }
                                else
                                {
                                    Response.Write("<script>alert('REGISTER UNSUCCESSFULL')</script>");
                                }
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Image is not supported')</script>");
                        }
                    }
                }
                DATABASE.Close();
                Response.Redirect(Request.RawUrl);
            }



        }
        protected void BacktoLoginBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

    }
}