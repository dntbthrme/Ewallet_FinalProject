<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepositWithdraw.aspx.cs" Inherits="Ewallet_FinalProject.CashInOut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en" dir="ltr" style="background-color: #0b0c10">
<head runat="server">
    <title>E-wallet | Deposit/Withdraw</title>
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
            <div class="container" style="text-align: center">
                 YOUR CHOICE <br /><br /><br />

                <asp:Button ID="CashInBtn" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="35px" ForeColor="#C5C6C7" Text="DEPOSIT" ToolTip="Deposit" Width="275px" Height="140px" OnClick="CashInBtn_Click"/>
                &emsp;&emsp;
                <asp:Button ID="CashOutBtn" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="35px" ForeColor="#C5C6C7" Text="WITHDRAW" ToolTip="Withdraw" Width="275px" Height="140px" OnClick="CashOutBtn_Click"/>
                        
            </div>
            <br /><br />
        </div>
    </form>
</body>
</html>
