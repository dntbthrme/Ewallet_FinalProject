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
    public partial class Profile2 : System.Web.UI.Page
    {
        string connstring = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\VOYAGER\Downloads\Ewallet_FinalProject\Ewallet_FinalProject\Ewallet_FinalProject\App_Data\FinalProject.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }

        protected void PhotoChangeBtn_Click(object sender, EventArgs e)
        {
            HttpPostedFile postedFile = FileUpload1.PostedFile;
            string Picture = Path.GetFileName(postedFile.FileName);
            string PicTxt = Path.GetExtension(Picture).ToLower();
            int PicSize = postedFile.ContentLength;
            byte[] Pic = new byte[FileUpload1.PostedFile.ContentLength];
            FileUpload1.PostedFile.InputStream.Read(Pic, 0, FileUpload1.PostedFile.ContentLength);

            using (var DATABASE = new SqlConnection(connstring))
            {
                DATABASE.Open();

                using (var cmd2 = DATABASE.CreateCommand())
                {
                    cmd2.CommandType = CommandType.Text;
                    cmd2.CommandText = "UPDATE EWALLET SET "
                                    + " IMAGE = @image "
                                    + " WHERE ACCOUNTNUM = '" + Session["ACCOUNTNUM"] + "'";
                    cmd2.Parameters.AddWithValue("@image", Pic);

                    int ctr = cmd2.ExecuteNonQuery();
                    if (PicTxt == ".jpg")
                    {
                        if (ctr >= 1)
                        {
                            UpdatePhotoPanel.Visible = false;
                            Panel1.Visible = true;
                        }
                        else
                        {
                            Response.Write("<script>alert('Ooopss.. something missing')</script>");
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