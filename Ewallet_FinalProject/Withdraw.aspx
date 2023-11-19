<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Withdraw.aspx.cs" Inherits="Ewallet_FinalProject.CashOut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en" dir="ltr" style="background-color: #0b0c10">
<head runat="server">
    <title>E-wallet | Withdraw</title>
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
        <div> <br /><br />
            <div class="container" style="text-align: center; color: #FFFFFF; font-size: 40px; font-family: 'century gothic'; font-weight: bold;">
                 WITHDRAW <br /><br />

                <asp:Panel ID="CashoutPanel" runat="server" style="font-size: 25px; color: #66fcf1; text-align: center;">
                    &emsp;&nbsp;Current Balance: &nbsp;₱
                    <asp:Label ID="CurrentBalLbl" runat="server" Text=""></asp:Label><br />

                    <br /><br />

                    <asp:Panel ID="Panel1" runat="server" class="container" style="font-size: medium; text-align: center;">
                        ENTER AN AMOUNT:<br />
                        <asp:TextBox ID="AmountTxtbox" runat="server" BackColor="#0B0C10" BorderStyle="None" BorderWidth="2px" ForeColor="#C5C6C7" Height="29px" Width="500px"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="AmountTxtbox" ErrorMessage="Enter an amount to withdraw!!" ForeColor="Red" ValidationGroup="withdraw"></asp:RequiredFieldValidator>
                        <br />
                         
                        <asp:Button ID="CashOutBtn" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="large" ForeColor="#C5C6C7" Text="WITHDRAW" ToolTip="Withdraw" Width="704px" Height="38px" OnClick="CashOutBtn_Click" ValidationGroup="withdraw"/>
                    </asp:Panel>
                </asp:Panel>

                <asp:Panel ID="SupplypassPanel" runat="server" style="color: #c5c6c7; font-size: medium;" class="container" Width="373px" Visible="false">
                &emsp;Password: <br />&emsp;
                <asp:TextBox ID="SupplypassTxtbox" runat="server" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Height="29px" Width="324px" type="password"></asp:TextBox>
                <br />
                <asp:Panel ID="Panel6" runat="server" style="font-size: 12px; font-weight: 200" Width="346px">
                   &emsp;&nbsp;&nbsp; Please input your password before withdraw.<br />
                </asp:Panel>&emsp;
                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                <br /><br />&emsp;
                <asp:Button ID="NextBtn3" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium" ForeColor="#C5C6C7" Text="Next" ToolTip="Next" Width="331px" Height="38px" OnClick="NextBtn3_Click"/>
                
            </asp:Panel>

                <asp:Panel ID="ReceiptPanel" runat="server" style="font-size: 25px; color: #66fcf1; text-align: center;" Visible="false">
                    &emsp;&nbsp;Withdraw Amount:  &nbsp;₱
                    <asp:Label ID="WithdrawAmountLbl" runat="server" Text=""></asp:Label><br />

                    &emsp;&nbsp;Your Balance: &nbsp;₱
                    <asp:Label ID="UpdatedbalanceLbl" runat="server" Text=""></asp:Label><br />

                    <br /><br />

                    <asp:Button ID="DoneBtn" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="large" ForeColor="#C5C6C7" Text="DONE" ToolTip="Done" Width="704px" Height="38px" OnClick="DoneBtn_Click"/>

                </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>