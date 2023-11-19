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
    public partial class DWView : System.Web.UI.Page
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
                    cmd.CommandText = "SELECT * FROM [Table] WHERE Id = '" + Session["gvData"] + "' AND Accountnum = '" + ACCOUNT + "'";

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            AccountnumLbl.Text = reader["ACCOUNTNUM"].ToString();
                            DateTimeLbl.Text = reader["Transdate"].ToString();
                            TypeLbl.Text = reader["Transdesc"].ToString();
                            AmountLbl.Text = reader["Transamount"].ToString();
                        }
                        else
                        {
                            Response.Write("<script>alert('Record is not found')</script>");
                        }
                    }

                }
                DATABASE.Close();
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("DWReports.aspx");
        }
    }
}