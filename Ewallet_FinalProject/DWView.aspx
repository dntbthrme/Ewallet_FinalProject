<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DWView.aspx.cs" Inherits="Ewallet_FinalProject.DWView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en" dir="ltr" style="background-color: #0b0c10">
<head runat="server">
    <title>E-wallet | Transactions</title>
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
            <li><a href="DepositWithdraw.aspx">Deposit / Withdraw</a></li>
            <li><a class="active" href="Transactions.aspx">Transactions</a></li>
            <li><a href="Profile.aspx">Profile</a></li>
         </ul>
      </nav>
        <br /><br /><br />
        <asp:Panel ID="Panel1" runat="server" class="container" style="color: #c5c6c7; font-size: 35px; text-align: center;" Width="864px" BorderColor="#66FCF1" BorderStyle="Solid" Height="795px">
            <div style="text-align:left; width: 562px; position: absolute; top: 186px; left: 157px;" class="container">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img/left-arrow (1).png" OnClick="ImageButton1_Click" />
            </div>
                            
            <br />
                    <strong>TRANSACTION DETAILS
                <br />
                </strong><br />
                    <div style="font-size: large; width: 557px; margin: auto; text-align: left">
                        &emsp;Account No.:&emsp;
                        <div style="text-align: right; font-size: 25px;">
                            <asp:Label ID="AccountnumLbl" runat="server" Text=""></asp:Label> &emsp;
                        </div>
                        <br />
                        &emsp;Date & Time:&emsp;
                        <div style="text-align: right; font-size: 25px;">
                            <asp:Label ID="DateTimeLbl" runat="server" Text=""></asp:Label>&emsp;
                        </div>
                        <br />
                        &emsp;Transaction Type:&emsp;
                        <div style="text-align: right; font-size: 25px;">
                            <asp:Label ID="TypeLbl" runat="server" Text=""></asp:Label>&emsp;
                        </div>
                        <br />
                        &emsp;Amount:&emsp;
                        <div style="text-align: right; font-size: 25px;">
                            ₱&nbsp;<asp:Label ID="AmountLbl" runat="server" Text=""></asp:Label>&emsp;
                        </div>
                       <br /><br />
                    </div>
                <br />
            </asp:Panel>
    </form>
</body>
</html>
