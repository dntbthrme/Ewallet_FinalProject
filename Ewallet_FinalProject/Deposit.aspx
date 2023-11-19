<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Deposit.aspx.cs" Inherits="Ewallet_FinalProject.CashIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en" dir="ltr" style="background-color: #0b0c10">
<head runat="server">
    <title>E-wallet | Deposit</title>
      <link href="Layout.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <nav>
         <div class="logo">
            E-wallet
         </div>
         <input type="checkbox" id="click"/>
         <label for="click" class="menu-btn">
         <i class="fas fa-bars"></i>
         </label>
         <ul>
            <li><a href="Home.aspx">Home</a></li>
            <li><a href="Send.aspx">Send</a></li>
            <li><a class="active" href="DepositWithdraw.aspx">Deposit / Withdraw</a></li>
            <li><a href="Transactions.aspx">Transactions</a></li>
            <li><a href="Profile.aspx">Profile</a></li>
         </ul>
      </nav>
        <div class="content"> <br /><br />
            <div class="container" style="text-align: center;">
                 DEPOSIT <br /><br />

                <asp:Panel ID="CashinPanel" runat="server" style="font-size: 25px; color: #66fcf1; text-align: center;">
                    &emsp;&nbsp;Current Balance: &nbsp;₱ 
                    <asp:Label ID="CurrentBalLbl" runat="server" Text=""></asp:Label><br />

                    <br /><br />

                    <asp:Panel ID="Panel1" runat="server" class="container" style="font-size: medium; text-align: center;">
                        ENTER AN AMOUNT: <br />
                        <asp:TextBox ID="AmountTxtbox" runat="server" BackColor="#0B0C10" BorderWidth="2px" ForeColor="#C5C6C7" Height="29px" Width="500px" BorderStyle="None" type="number"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        <br />&emsp;
                        <asp:Button ID="CashInBtn" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="large" ForeColor="#C5C6C7" Text="DEPOSIT" ToolTip="Deposit" Width="704px" Height="38px" OnClick="CashInBtn_Click"/>
                
                    </asp:Panel>
                </asp:Panel>

                <asp:Panel ID="ReceiptPanel" runat="server" style="font-size: 25px; color: #66fcf1; text-align: center;" Visible="false">
                    &emsp;&nbsp;Deposit Amount: &nbsp;₱
                    <asp:Label ID="DepositAmountLbl" runat="server" Text=""></asp:Label><br />

                    
                    
                    &emsp;&nbsp;Your Balance: &nbsp;₱
                    <asp:Label ID="UpdatedBalanceLbl" runat="server" Text=""></asp:Label>

                    

                    <br /><br />

                    <asp:Button ID="DoneBtn" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="large" ForeColor="#C5C6C7" Text="DONE" ToolTip="Done" Width="704px" Height="38px" OnClick="DoneBtn_Click"/>
                
                </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>

