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
    public partial class CashIn : System.Web.UI.Page
    {
        string connstring = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\VOYAGER\Downloads\Ewallet_FinalProject\Ewallet_FinalProject\Ewallet_FinalProject\App_Data\FinalProject.mdf;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            // To access the currently signed-in user's balance.
            var ACCOUNT = Session["ACCOUNTNUM"];
            using (var db = new SqlConnection(connstring))
            {
                db.Open();

                using (var cmd = db.CreateCommand())
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
                db.Close();
            }
        }
        // The button click event that will deposit the amount entered.
        protected void CashInBtn_Click(object sender, EventArgs e)
        {
            double dep_amount = Convert.ToDouble(AmountTxtbox.Text);
            double balance = Convert.ToDouble(CurrentBalLbl.Text);
            DepositAmountLbl.Text = dep_amount.ToString();
            // Depositor's total current balance must not exceed to ₱ 50,000.00.
            if (balance < 50000.00)
            {
                // Amount must be divisible ₱ 100.00.
                if (dep_amount % 100 == 0)
                {
                    // Minimum amount to be deposited is ₱ 100.00.
                    if (dep_amount < 100.00)
                    {
                        Label1.ForeColor = System.Drawing.Color.Red;
                        Label1.Text = "Minimum amount to be deposited is ₱ 100.00!!";
                    }
                    // Maximum amount to be deposited is ₱ 10,000.00.
                    else if (dep_amount >= 10000.00)
                    {
                        Label1.ForeColor = System.Drawing.Color.Red;
                        Label1.Text = "Maximum amount to be deposited is ₱ 10,000.00!!";
                    }
                    // If amount is qualified then updating it's balance will occur
                    else
                    {
                        using (var db = new SqlConnection(connstring))
                        {
                            db.Open();

                            using (var cmd1 = db.CreateCommand())
                            {
                                cmd1.CommandType = CommandType.Text;
                                cmd1.CommandText = "UPDATE EWALLET SET "
                                                + " BALANCE = @bal "
                                                + " WHERE ACCOUNTNUM ='" + Session["ACCOUNTNUM"] + "'";
                                cmd1.Parameters.AddWithValue("@bal", balance + dep_amount); // Currently signed-in user's balance plus the amount deposited

                                int ctr = cmd1.ExecuteNonQuery();
                                if (ctr >= 1)
                                {
                                    //Accessing the updated currently signed-in user's balance
                                    using (var cmd2 = db.CreateCommand())
                                    {
                                        cmd2.CommandType = CommandType.Text;
                                        cmd2.CommandText = "SELECT * FROM EWALLET WHERE ACCOUNTNUM = '" + Session["ACCOUNTNUM"] + "'";

                                        using (SqlDataReader reader = cmd2.ExecuteReader())
                                        {
                                            if (reader.Read())
                                            {
                                                UpdatedBalanceLbl.Text = reader["BALANCE"].ToString();
                                                CashinPanel.Visible = false;
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
                            db.Close();
                        }
                    }
                }
                //Else, an error message will appear.
                else
                {
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "Amount must be divisible by ₱ 100.00!!";
                }
            //Else, an error message will appear.
            }
            else
            {
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "Unable to deposit. Current balance must not exceed to ₱ 50,000.00!!";
            }
        }
        // Inserting a new transaction record.
        protected void DoneBtn_Click(object sender, EventArgs e)
        {
            double dep_amount = Convert.ToDouble(AmountTxtbox.Text);
            string desc = "Deposit";
            using (var db = new SqlConnection(connstring))
            {
                db.Open();

                using (var cmd2 = db.CreateCommand())
                {
                    cmd2.CommandType = CommandType.Text;
                    cmd2.CommandText = "INSERT INTO [Table] (TRANSDESC, TRANSAMOUNT, ACCOUNTNUM)"
                        + "VALUES (@desc, @bal, @id)";//sql statement 

                    cmd2.Parameters.AddWithValue("@id", Session["ACCOUNTNUM"].ToString());
                    cmd2.Parameters.AddWithValue("@bal", dep_amount);
                    cmd2.Parameters.AddWithValue("@desc", desc);

                    int ctr2 = cmd2.ExecuteNonQuery();

                    if (ctr2 >= 1)
                    {
                        Response.Redirect("DepositWithdraw.aspx");
                        Response.Write("<script>alert('Deposit Successfully')</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Ooopss.. something missing')</script>");
                    }
                }
                db.Close();
            }
        }
    }
}