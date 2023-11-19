<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Send.aspx.cs" Inherits="Ewallet_FinalProject.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en" dir="ltr" style="background-color: #0b0c10">
<head runat="server">
    <title>E-wallet | Send</title>
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
            <li><a class="active" href="Send.aspx">Send</a></li>
            <li><a href="DepositWithdraw.aspx">Deposit / Withdraw</a></li>
            <li><a href="Transactions.aspx">Transactions</a></li>
            <li><a href="Profile.aspx">Profile</a></li>
         </ul>
      </nav>
        <div class="content"> <br /><br />
            <div class="container" style="text-align: center;">
                 SEND MONEY
            </div>

            <br /><br />

            <asp:Panel ID="SendmoneyPanel" runat="server" style="color: #c5c6c7; font-size: medium;" class="container" Width="373px">
            &emsp;Account Number: <br />&emsp;
            <asp:TextBox ID="VerifyAccTxtbox" runat="server" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Height="29px" Width="324px" type="number"></asp:TextBox>
            <br />
                &emsp;
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

            <br />&emsp;
            <asp:Button ID="NextBtn" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium" ForeColor="#C5C6C7" Text="Next" ToolTip="Next" Width="331px" Height="38px" OnClick="NextBtn_Click"/>
                        
            </asp:Panel>

            <asp:Panel ID="SendmoneyPanel2" runat="server" style="color: #c5c6c7; font-size: medium;" class="container" Width="373px" Visible="false">
                <asp:Panel ID="Panel1" runat="server" style="font-size:20px;" class="container" Width="371px"> <br />
                    <asp:Label ID="LastnameLbl" runat="server" Text=""></asp:Label>, &nbsp;
                    <asp:Label ID="FirstnameLbl" runat="server" Text=""></asp:Label><br />
                    Account No.:&emsp;
                    <asp:Label ID="AccntnumLbl" runat="server" Text=""></asp:Label><br />

                </asp:Panel>
                <br /><br />
                &emsp;Amount: <br />&emsp;
                <asp:TextBox ID="AmountTxtbox" runat="server" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Height="29px" Width="324px" type="number" min="100.00" max="10000.00"></asp:TextBox>
                <br />
                <asp:Panel ID="Panel4" runat="server" style="font-size: 15px; color: red;">
                    &emsp;&nbsp;Current Balance: &nbsp;
                    <asp:Label ID="CurrentBalLbl" runat="server" Text=""></asp:Label><br />
                </asp:Panel>

                <br />&emsp;
                <asp:Label ID="Label2" runat="server" Text=""></asp:Label>

                <br />&emsp;
                <asp:Button ID="NextBtn2" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium" ForeColor="#C5C6C7" Text="Next" ToolTip="Next" Width="331px" Height="38px" OnClick="NextBtn2_Click"/>
                        
            </asp:Panel>

            <asp:Panel ID="SupplypassPanel" runat="server" style="color: #c5c6c7; font-size: medium;" class="container" Width="373px" Visible="false">
                <asp:Panel ID="Panel7" runat="server" style="font-size:20px;" class="container" Width="371px"> <br />
                    <asp:Label ID="LnameLbl" runat="server" Text=""></asp:Label>, &nbsp;
                    <asp:Label ID="FnameLbl" runat="server" Text=""></asp:Label><br />
                    Account No.:&emsp;
                    <asp:Label ID="AccLbl" runat="server" Text=""></asp:Label><br />

                </asp:Panel>
                <br /><br />
                &emsp;Password: <br />&emsp;
                <asp:TextBox ID="SupplypassTxtbox" runat="server" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Height="29px" Width="324px" type="password"></asp:TextBox>
                <br />&emsp;
                <asp:Label ID="LBL" runat="server" Text=""></asp:Label>
                <asp:Panel ID="Panel6" runat="server" style="font-size: 12px; font-weight: 200" Width="346px">
                   &emsp;&nbsp;&nbsp; Please input your password before sending the money.<br />
                </asp:Panel>

                <br /><br />&emsp;
                <asp:Button ID="NextBtn3" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium" ForeColor="#C5C6C7" Text="Next" ToolTip="Next" Width="331px" Height="38px" OnClick="NextBtn3_Click" />
                
            </asp:Panel>

            <asp:Panel ID="ConfirmationPanel" runat="server" style="color: #c5c6c7; font-size: medium;" class="container" Width="373px" Visible="false">
                <asp:Panel ID="Panel2" runat="server" style="font-size:20px;" class="container"> <br />
                    <asp:Label ID="ConLastnameLbl" runat="server" Text=""></asp:Label>, &nbsp;
                    <asp:Label ID="ConFirstnameLbl" runat="server" Text=""></asp:Label><br />
                    Account No.:&emsp;
                    <asp:Label ID="ConAccntLbl" runat="server" Text=""></asp:Label><br />
                </asp:Panel>
                <br />&emsp;
                Current Balance : &emsp; 
                <asp:Label ID="ConCurrentBalLbl" runat="server" Text=""></asp:Label><br /><br />
                <asp:Panel ID="Panel3" runat="server" style="font-size: 12px; font-weight: 200" Width="137px">
                   &emsp;&nbsp; You're about to send
                </asp:Panel>
                &emsp;
                Amount: &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;
                <asp:Label ID="ConAmountLbl" runat="server" Text=""></asp:Label><br />
                <br />&emsp;
                
                <asp:Button ID="SendBtn" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium" ForeColor="#C5C6C7" Text="SEND" ToolTip="Send" Width="331px" Height="38px" OnClick="SendBtn_Click"/>
                <br />
                <asp:Panel ID="Panel5" runat="server" style="font-size: 12px; font-weight: 200" Width="316px">
                   &emsp;&nbsp;&nbsp; Please make sure the information above is correct.<br />
                    &emsp;&nbsp;&nbsp; Submitted transactions cannot be reversed.
                </asp:Panel>
            </asp:Panel>

            <asp:Panel ID="ReceiptPanel" runat="server" style="color: #c5c6c7; font-size: medium;" class="container" Width="402px" Visible="false">
                <asp:Panel ID="ReceiverPanel" runat="server" style="font-size:20px;" class="container"> <br />
                    <asp:Label ID="ReceiverlnameLbl" runat="server" Text=""></asp:Label>, &nbsp;
                    <asp:Label ID="ReceiverfnameLbl" runat="server" Text=""></asp:Label><br />
                    Account No.:&emsp;
                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label><br />
                </asp:Panel>
                <br />&emsp;
                Amount Sent : &emsp; 
                <asp:Label ID="Label4" runat="server" Text=""></asp:Label><br /><br />
                <asp:Panel ID="Panel8" runat="server" style="font-size: 12px; font-weight: 200" Width="189px">
                   &emsp; You're current balance is: 
                </asp:Panel>
                &emsp;
                Amount: &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;
                <asp:Label ID="Label5" runat="server" Text=""></asp:Label><br />
                <br />&emsp;
                
                <asp:Button ID="BacktohomeBtn" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium" ForeColor="#C5C6C7" Text="BACK TO HOME" ToolTip="Home" Width="331px" Height="38px" OnClick="BacktohomeBtn_Click"/>
            </asp:Panel>
        </div>
    </form>
</body>
</html>

