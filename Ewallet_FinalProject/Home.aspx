<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Ewallet_FinalProject.Menu_Navigation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en" dir="ltr" style="background-color: #0b0c10">
<head runat="server">
      <title>E-wallet | Home</title>
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
            <li><a class="active" href="Home.aspx">Home</a></li>
            <li><a href="Send.aspx">Send</a></li>
            <li><a href="DepositWithdraw.aspx">Deposit / Withdraw</a></li>
            <li><a href="Transactions.aspx">Transactions</a></li>
            <li><a href="Profile.aspx">Profile</a></li>
         </ul>
      </nav>
        <div> <br /><br /><br />
            <asp:Panel ID="PhotoPanel" runat="server" style="color: #c5c6c7; font-size: large; text-align: center;" Width="694px" BorderColor="#66FCF1" BorderStyle="Solid">
                <br />
                    <asp:Image ID="Image1" runat="server" class="img"/>
                <br /><br />
                    <div style="font-size: large; width: 461px;" class="container">
                        &emsp;<asp:Label ID="LastnameLbl" runat="server" Text=""></asp:Label>, &nbsp;
                        <asp:Label ID="FirstnameLbl" runat="server" Text=""></asp:Label><br />
                        &emsp;Account No.:&emsp;
                        <asp:Label ID="AccntnumLbl" runat="server" Text=""></asp:Label><br />
                        &emsp;Date Registered:&emsp;
                        <asp:Label ID="DateregisteredLbl" runat="server" Text=""></asp:Label>
                    </div>
                <br />
            </asp:Panel>
            <br /><br />
            <div style="position: absolute; top: 264px; left: 770px; color: #FFFFFF; text-align: center; color: #FFFFFF; font-size: 40px; font-family: 'century gothic'; font-weight: bold;">
                 CURRENT BALANCE:&emsp;&emsp;₱
                 <asp:Label ID="CurrentBalLbl" runat="server" Text="0.00" ForeColor="#66fcf1"></asp:Label><br />
                 <div class="container" style="font-weight: 300; font-size: 30px; color: #FFFFFF;">
                  Total sent money: &emsp;₱
                  <asp:Label ID="TotalsendLbl" runat="server" Text="0.00" ForeColor="#66fcf1"></asp:Label>
                  </div>
            </div> <br />
        </div>
    </form>
</body>
</html>
