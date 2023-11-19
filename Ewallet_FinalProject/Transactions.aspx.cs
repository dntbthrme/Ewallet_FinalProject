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
    public partial class Transactions : System.Web.UI.Page
    {
        string connstring = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\VOYAGER\Downloads\Ewallet_FinalProject\Ewallet_FinalProject\Ewallet_FinalProject\App_Data\FinalProject.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            bool isValid = (bool)(ViewState["IsValid"] ?? true); // Retrieve the validity status from ViewState or Session
            string from = FromTxtbox.Text;
            string to = ToTxtbox.Text;
            DateTime startDate = DateTime.Parse(from);
            DateTime endDate = DateTime.Parse(to).AddDays(1);
            string type = " ";
            var ACCOUNT = Session["ACCOUNTNUM"];

            if (isValid && Page.IsValid)
            {
                GridView1.Visible = true;
                if (ChooseCategory.SelectedIndex == 0)
                {
                    using (var DATABASE = new SqlConnection(connstring))
                    {
                        DATABASE.Open();

                        using (var cmd = DATABASE.CreateCommand())
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.CommandText = "SELECT Id, Transamount, Transdate, Transdesc FROM [Table] WHERE Transdate >= '" + startDate + "' AND Transdate < '" + endDate + "' AND ACCOUNTNUM = '" + ACCOUNT + "' ORDER BY Transdate DESC";

                            DataTable dt = new DataTable();
                            SqlDataAdapter sda = new SqlDataAdapter(cmd);
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                            if (GridView1.Rows.Count == 0)
                            {
                                Label1.Visible = true;
                                Label1.ForeColor = System.Drawing.Color.Red;
                                Label1.Text = "No data found!!";
                            }
                            else
                            {
                                Label1.Visible = false;
                            }

                        }
                    }
                }
                else
                {
                    type = ChooseCategory.SelectedItem.Text;

                    using (var DATABASE = new SqlConnection(connstring))
                    {
                        DATABASE.Open();

                        using (var cmd = DATABASE.CreateCommand())
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.CommandText = "SELECT Id, Transamount, Transdate, Transdesc FROM [Table] WHERE Transdate >= '" + startDate + "' AND Transdate < '" + endDate + "' AND ACCOUNTNUM = '" + ACCOUNT + "' AND Transdesc = '" + type + "' ORDER BY Transdate DESC";

                            DataTable dt = new DataTable();
                            SqlDataAdapter sda = new SqlDataAdapter(cmd);
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                            if (GridView1.Rows.Count == 0)
                            {
                                Label1.Visible = true;
                                Label1.ForeColor = System.Drawing.Color.Red;
                                Label1.Text = "No data found!!";
                            }
                            else
                            {
                                Label1.Visible = false;
                            }

                        }
                    }
                }
            }
            else
            {
                GridView1.Visible = false;
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "From and to dates must not a future dates <br> Or To date must not before in from date!!";

            }

            
        }


        protected void FromTxtbox_TextChanged1(object sender, EventArgs e)
        {
            string from = FromTxtbox.Text;
            string to = ToTxtbox.Text;
            DateTime startDate = DateTime.Parse(from);
            DateTime currentDate = DateTime.Now.Date;
            bool isValid = false;

            if (startDate < currentDate)
            {
                Label2.Visible = false;
                ImageButton1.Enabled = true;
                isValid = true;
            }
            else
            {
                Label2.ForeColor = System.Drawing.Color.Red;
                Label2.Text = "From date must not a future dates!!";
                isValid = false;
            }
            ViewState["IsValid"] = isValid;
        }

        protected void ToTxtbox_TextChanged1(object sender, EventArgs e)
        {
            string from = FromTxtbox.Text;
            string to = ToTxtbox.Text;
            DateTime startDate = DateTime.Parse(from);
            DateTime endDate = DateTime.Parse(to);
            DateTime currentDate = DateTime.Now.Date;
            DateTime futureDate = currentDate.AddDays(1);
            bool isValid = false;

            if (startDate < endDate)
            {
                if (endDate < futureDate)
                {
                    Label3.Visible = false;
                    ImageButton1.Enabled = true;
                    isValid = true;
                }
                else
                {
                    Label3.ForeColor = System.Drawing.Color.Red;
                    Label3.Text = "To date must not a future dates!!";
                    isValid = false;
                }
            }
            else
            {
                Label3.ForeColor = System.Drawing.Color.Red;
                Label3.Text = "To date must not before in from date!!";
                isValid = false;
            }

            ViewState["IsValid"] = isValid;

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "View")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                string data = GridView1.Rows[rowIndex].Cells[0].Text;
                string type = GridView1.Rows[rowIndex].Cells[3].Text;
                Session["gvData"] = data;
                Session["gvType"] = type;
                Response.Redirect("View.aspx");
            }
        }

    }
}