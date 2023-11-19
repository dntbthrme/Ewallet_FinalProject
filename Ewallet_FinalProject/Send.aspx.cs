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
    public partial class Dashboard : System.Web.UI.Page
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
                            Response.Write("<script>alert('Record is not saved')</script>");
                        }
                    }

                }
                DATABASE.Close();
            }
        }

        protected void NextBtn_Click(object sender, EventArgs e)
        {
            var acct = VerifyAccTxtbox.Text;
            string my_acct = Session["ACCOUNTNUM"].ToString();
            if (acct == my_acct)
            {
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "You can't send an amount in your own account!!";
            }
            else
            {
                using (var db = new SqlConnection(connstring))
                {
                    db.Open();
                    using (var cmd = db.CreateCommand())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "SELECT * FROM EWALLET WHERE ACCOUNTNUM = '" + acct + "'";
                        DataTable DataT = new DataTable();
                        SqlDataAdapter DataA = new SqlDataAdapter(cmd);

                        DataA.Fill(DataT);
                        if (DataT.Rows.Count > 0)
                        {
                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                if (reader.Read())
                                {
                                    LastnameLbl.Text = reader["LASTNAME"].ToString();
                                    FirstnameLbl.Text = reader["FIRSTNAME"].ToString();
                                    AccntnumLbl.Text = reader["ACCOUNTNUM"].ToString();
                                    Session["sender_balance"] = reader["BALANCE"].ToString();

                                    Session["SenderLname"] = LastnameLbl.Text;
                                    Session["SenderFname"] = FirstnameLbl.Text;
                                    Session["SenderAcct"] = AccntnumLbl.Text;

                                    SendmoneyPanel.Visible = false;
                                    SendmoneyPanel2.Visible = true;
                                }
                                else
                                {
                                    Response.Write("<script>alert('Account number does not exist')</script>");
                                }
                            }
                        }
                        else
                        {
                            Label1.ForeColor = System.Drawing.Color.Red;
                            Label1.Text = "Account number not found!!";
                        }


                    }
                    db.Close();
                }
            }
        }

        protected void NextBtn2_Click(object sender, EventArgs e)
        {
            LnameLbl.Text = Session["SenderLname"].ToString();
            FnameLbl.Text = Session["SenderFname"].ToString();
            AccLbl.Text = Session["SenderAcct"].ToString();
            double amount = Convert.ToDouble(AmountTxtbox.Text);
            double balance = Convert.ToDouble(CurrentBalLbl.Text);
            if (amount < balance)
            {
                if (amount % 100 == 0)
                {
                    if (amount < 100.00)
                    {
                        Label2.ForeColor = System.Drawing.Color.Red;
                        Label2.Text = "Minimum amount to be deposited is ₱ 100.00!!";
                    }
                    else if (amount >= 10000.00)
                    {
                        Label2.ForeColor = System.Drawing.Color.Red;
                        Label2.Text = "Maximum amount to be deposited is ₱ 10000.00!!";
                    }
                    else
                    {
                        SendmoneyPanel.Visible = false;
                        SendmoneyPanel2.Visible = false;
                        SupplypassPanel.Visible = true;
                        ConfirmationPanel.Visible = false;
                    }
                }
                else
                {
                    Label2.ForeColor = System.Drawing.Color.Red;
                    Label2.Text = "Amount must be divisible by ₱ 100.00!!";
                }
            }
            else
            {
                Label2.ForeColor = System.Drawing.Color.Red;
                Label2.Text = "Insufficient balance!!";
            }
        }

        protected void NextBtn3_Click(object sender, EventArgs e)
        {
            ConLastnameLbl.Text = Session["SenderLname"].ToString();
            ConFirstnameLbl.Text = Session["SenderFname"].ToString();
            ConAccntLbl.Text = Session["SenderAcct"].ToString();

            ReceiverlnameLbl.Text = Session["SenderLname"].ToString();
            ReceiverfnameLbl.Text = Session["SenderFname"].ToString();
            Label3.Text = Session["SenderAcct"].ToString();


            var acct = VerifyAccTxtbox.Text;
            double send_amount = Convert.ToDouble(AmountTxtbox.Text);
            double balance = Convert.ToDouble(CurrentBalLbl.Text);
            double sent = Convert.ToDouble(Session["sentmoney"]);
            ConAmountLbl.Text = send_amount.ToString();
            Label4.Text = send_amount.ToString();
            Label5.Text = CurrentBalLbl.Text;
            using (var DATABASE = new SqlConnection(connstring))
            {
                DATABASE.Open();

                using (var cmd = DATABASE.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT ACCOUNTNUM FROM EWALLET WHERE ACCOUNTNUM = '" + Session["ACCOUNTNUM"] + "' AND PASSWORD = '" + SupplypassTxtbox.Text + "'";
                    DataTable DataT = new DataTable();
                    SqlDataAdapter DataA = new SqlDataAdapter(cmd);

                    DataA.Fill(DataT);
                    if (DataT.Rows.Count > 0)
                    {
                        using (var cmd2 = DATABASE.CreateCommand())
                        {
                            cmd2.CommandType = CommandType.Text;
                            cmd2.CommandText = "UPDATE EWALLET SET "
                                            + " BALANCE = @bal, "
                                            + " SENTMONEY = @sent "
                                            + " WHERE ACCOUNTNUM ='" + Session["ACCOUNTNUM"] + "'";
                            cmd2.Parameters.AddWithValue("@bal", balance - send_amount);
                            cmd2.Parameters.AddWithValue("@sent", sent + send_amount);

                            int ctr = cmd2.ExecuteNonQuery();
                            if (ctr >= 1)
                            {
                                using (var cmd3 = DATABASE.CreateCommand())
                                {
                                    cmd3.CommandType = CommandType.Text;
                                    cmd3.CommandText = "INSERT INTO [Table] (TRANSDESC, TRANSAMOUNT, ACCOUNTNUM, SENDER, RECIPIENT)"
                                        + "VALUES (@desc, @bal, @id, @s, @r)";//sql statement 

                                    cmd3.Parameters.AddWithValue("@id", Session["ACCOUNTNUM"].ToString());
                                    cmd3.Parameters.AddWithValue("@bal", send_amount);
                                    cmd3.Parameters.AddWithValue("@desc", "Send");
                                    cmd3.Parameters.AddWithValue("@s", Session["ACCOUNTNUM"].ToString());
                                    cmd3.Parameters.AddWithValue("@r", acct);

                                    int ctr3 = cmd3.ExecuteNonQuery();

                                    if (ctr3 >= 1)
                                    {
                                        using (var cmd4 = DATABASE.CreateCommand())
                                        {
                                            cmd4.CommandType = CommandType.Text;
                                            cmd4.CommandText = "SELECT * FROM EWALLET WHERE ACCOUNTNUM = '" + Session["ACCOUNTNUM"] + "'";

                                            using (SqlDataReader reader = cmd4.ExecuteReader())
                                            {
                                                if (reader.Read())
                                                {
                                                    Label5.Text = reader["BALANCE"].ToString();

                                                    SendmoneyPanel.Visible = false;
                                                    SendmoneyPanel2.Visible = false;
                                                    SupplypassPanel.Visible = false;
                                                    ConfirmationPanel.Visible = false;
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
                                Response.Write("<script>alert('Ooopss.. something missing')</script>");
                            }

                        }
                    }
                    else
                    {
                        LBL.ForeColor = System.Drawing.Color.Red;
                        LBL.Text = "Wrong password!!";
                    }
                }
                DATABASE.Close();
            }
        }

        protected void SendBtn_Click(object sender, EventArgs e)
        {
            ReceiverlnameLbl.Text = Session["SenderLname"].ToString();
            ReceiverfnameLbl.Text = Session["SenderFname"].ToString();
            Label3.Text = Session["SenderAcct"].ToString();

            double send_amount = Convert.ToDouble(AmountTxtbox.Text);
            Label4.Text = send_amount.ToString();
            SendmoneyPanel.Visible = false;
            SendmoneyPanel2.Visible = false;
            SupplypassPanel.Visible = false;
            ConfirmationPanel.Visible = false;
            ReceiptPanel.Visible = true;
        }

        protected void BacktohomeBtn_Click(object sender, EventArgs e)
        {
            var acct = VerifyAccTxtbox.Text;
            double send_amount = Convert.ToDouble(AmountTxtbox.Text);
            double balance = Convert.ToDouble(CurrentBalLbl.Text);
            double send_balance = Convert.ToDouble(Session["sender_balance"].ToString());
            using (var DATABASE = new SqlConnection(connstring))
            {
                DATABASE.Open();

                using (var cmd2 = DATABASE.CreateCommand())
                {
                    cmd2.CommandType = CommandType.Text;
                    cmd2.CommandText = "UPDATE EWALLET SET "
                                    + " BALANCE = @bal "
                                    + " WHERE ACCOUNTNUM ='" + acct + "'";
                    cmd2.Parameters.AddWithValue("@bal", send_balance + send_amount);

                    int ctr = cmd2.ExecuteNonQuery();
                    if (ctr >= 1)
                    {
                        using (var cmd3 = DATABASE.CreateCommand())
                        {
                            cmd3.CommandType = CommandType.Text;
                            cmd3.CommandText = "INSERT INTO [Table] (TRANSDESC, TRANSAMOUNT, ACCOUNTNUM, SENDER, RECIPIENT)"
                                + "VALUES (@desc, @bal, @id, @s, @r)";//sql statement 

                            cmd3.Parameters.AddWithValue("@id", acct);
                            cmd3.Parameters.AddWithValue("@bal", send_amount);
                            cmd3.Parameters.AddWithValue("@desc", "Receive");
                            cmd3.Parameters.AddWithValue("@s", Session["ACCOUNTNUM"].ToString());
                            cmd3.Parameters.AddWithValue("@r", acct);


                            int ctr3 = cmd3.ExecuteNonQuery();

                            if (ctr3 >= 1)
                            {
                                Response.Redirect("Home.aspx");
                            }
                            else
                            {
                                Response.Write("<script>alert('Ooopss.. something missing')</script>");
                            }
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Ooopss.. something missing')</script>");
                    }

                }
                DATABASE.Close();
            }
        }
    }
}