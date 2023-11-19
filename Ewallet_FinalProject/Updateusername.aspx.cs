﻿using System;
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
    public partial class Updateusername : System.Web.UI.Page
    {
        string connstring = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\VOYAGER\Downloads\Ewallet_FinalProject\Ewallet_FinalProject\Ewallet_FinalProject\App_Data\FinalProject.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }

        protected void UsernameChangeBtn_Click(object sender, EventArgs e)
        {

            using (var DATABASE = new SqlConnection(connstring))
            {
                DATABASE.Open();

                using (var cmd = DATABASE.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT USERNAME FROM EWALLET WHERE USERNAME = '" + UsernameTxtbox.Text + "'";
                    DataTable DataT = new DataTable();
                    SqlDataAdapter DataA = new SqlDataAdapter(cmd);

                    DataA.Fill(DataT);
                    if (DataT.Rows.Count == 1)
                    {
                        Label1.ForeColor = System.Drawing.Color.Red;
                        Label1.Text = "Username already exist!!";
                    }
                    else
                    {
                        using (var cmd2 = DATABASE.CreateCommand())
                        {
                            cmd2.CommandType = CommandType.Text;
                            cmd2.CommandText = "UPDATE EWALLET SET "
                                            + " USERNAME = @user "
                                            + " WHERE ACCOUNTNUM = '" + Session["ACCOUNTNUM"] + "'";
                            cmd2.Parameters.AddWithValue("@user", UsernameTxtbox.Text);

                            int ctr = cmd2.ExecuteNonQuery();
                            if (ctr >= 1)
                            {
                                UpdateUsernamePanel.Visible = false;
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