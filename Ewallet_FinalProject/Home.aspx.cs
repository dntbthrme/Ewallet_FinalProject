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
    public partial class Menu_Navigation : System.Web.UI.Page
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
                    cmd.CommandText = "SELECT * FROM EWALLET WHERE ACCOUNTNUM = '" + ACCOUNT + "'";

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            byte[] pic = (byte[])reader["IMAGE"];
                            string str = Convert.ToBase64String(pic);
                            Image1.ImageUrl = "data:image/jpg;base64," + str;
                            LastnameLbl.Text = reader["LASTNAME"].ToString();
                            FirstnameLbl.Text = reader["FIRSTNAME"].ToString();
                            AccntnumLbl.Text = reader["ACCOUNTNUM"].ToString();
                            DateregisteredLbl.Text = reader["DATEREGISTERED"].ToString();
                            CurrentBalLbl.Text = reader["BALANCE"].ToString();
                            TotalsendLbl.Text = reader["SENTMONEY"].ToString();

                            Session["sentmoney"] = reader["SENTMONEY"].ToString();


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
    }
}