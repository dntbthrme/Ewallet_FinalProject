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
    public partial class CashOut : System.Web.UI.Page
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
                            CurrentBalLbl.Text = reader["BALANCE"].ToString();
                        }
                        else
                        {
                            Response.Write("<script>alert('Record not found')</script>");
                        }
                    }

                }
                DATABASE.Close();
            }
        }

        protected void CashOutBtn_Click(object sender, EventArgs e)
        {
            double withdraw_amount = Convert.ToDouble(AmountTxtbox.Text);
            double balance = Convert.ToDouble(CurrentBalLbl.Text);

            if (withdraw_amount < balance)
            {
                if (withdraw_amount % 100 == 0)
                {
                    if (withdraw_amount < 100.00)
                    {
                        Label1.ForeColor = System.Drawing.Color.Red;
                        Label1.Text = "Minimum amount to be deposited is ₱ 100.00!!";
                    }
                    else if (withdraw_amount >= 10000.00)
                    {
                        Label1.ForeColor = System.Drawing.Color.Red;
                        Label1.Text = "Maximum amount to be deposited is ₱ 10,000.00!!";
                    }
                    else
                    {
                        CashoutPanel.Visible = false;
                        SupplypassPanel.Visible = true;
                        ReceiptPanel.Visible = false;
                    }
                }
                else
                {
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "Amount must be divisible by ₱ 100.00!!";
                }
            }
            else
            {
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Insufficient balance!!";
            }

        }

        protected void NextBtn3_Click(object sender, EventArgs e)
        {
            double withdraw_amount = Convert.ToDouble(AmountTxtbox.Text);
            double balance = Convert.ToDouble(CurrentBalLbl.Text);
            WithdrawAmountLbl.Text = withdraw_amount.ToString();
            using (var DATABASE = new SqlConnection(connstring))
            {
                DATABASE.Open();

                using (var cmd = DATABASE.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT * FROM EWALLET WHERE PASSWORD = '" + SupplypassTxtbox.Text + "'";

                    DataTable DataT = new DataTable();
                    SqlDataAdapter DataA = new SqlDataAdapter(cmd);

                    DataA.Fill(DataT);
                    if (DataT.Rows.Count > 0)
                    {
                        using (var cmd2 = DATABASE.CreateCommand())
                        {
                            cmd2.CommandType = CommandType.Text;
                            cmd2.CommandText = "UPDATE EWALLET SET "
                                            + " BALANCE = @bal "
                                            + " WHERE ACCOUNTNUM ='" + Session["ACCOUNTNUM"] + "'";
                            cmd2.Parameters.AddWithValue("@bal", balance - withdraw_amount);

                            int ctr = cmd2.ExecuteNonQuery();
                            if (ctr >= 1)
                            {
                                using (var cmd3 = DATABASE.CreateCommand())
                                {
                                    cmd3.CommandType = CommandType.Text;
                                    cmd3.CommandText = "SELECT * FROM EWALLET WHERE ACCOUNTNUM = '" + Session["ACCOUNTNUM"] + "'";

                                    using (SqlDataReader reader = cmd3.ExecuteReader())
                                    {
                                        if (reader.Read())
                                        {
                                            UpdatedbalanceLbl.Text = reader["BALANCE"].ToString();
                                            CashoutPanel.Visible = false;
                                            SupplypassPanel.Visible = false;
                                            ReceiptPanel.Visible = true;
                                        }
                                        else
                                        {
                                            Response.Write("<script>alert('Record not found')</script>");
                                        }
                                    }

                                }
                            }
                            else
                            {
                                Response.Write("<script>alert('Ooopss.. something missing')</script>");
                            }

                        }

                    }
                    else
                    {
                        Label2.ForeColor = System.Drawing.Color.Red;
                        Label2.Text = "Wrong password!!";
                    }
                }
                DATABASE.Close();
            }
        }
        protected void DoneBtn_Click(object sender, EventArgs e)
        {
            double withdraw_amount = Convert.ToDouble(AmountTxtbox.Text);
            string desc = "Withdraw";
            using (var db = new SqlConnection(connstring))
            {
                db.Open();

                using (var cmd2 = db.CreateCommand())
                {
                    cmd2.CommandType = CommandType.Text;
                    cmd2.CommandText = "INSERT INTO [Table] (TRANSDESC, TRANSAMOUNT, ACCOUNTNUM)"
                        + "VALUES (@desc, @bal, @id)";//sql statement 

                    cmd2.Parameters.AddWithValue("@id", Session["ACCOUNTNUM"].ToString());
                    cmd2.Parameters.AddWithValue("@bal", withdraw_amount);
                    cmd2.Parameters.AddWithValue("@desc", desc);

                    int ctr2 = cmd2.ExecuteNonQuery();

                    if (ctr2 >= 1)
                    {
                        Response.Write("<script>alert('Withdraw Successfully')</script>");
                        Response.Redirect("DepositWithdraw.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Ooopss.. something missing')</script>");
                    }
                }
                db.Open();
            }
        }
    }
}