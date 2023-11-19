<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Ewallet_FinalProject.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en" dir="ltr" style="background-color: #0b0c10">
<head runat="server">
    <title>E-wallet | Profile</title>
    <link href="Layout.css" rel="stylesheet" type="text/css" />
    <script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
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
            <li><a href="Transactions.aspx">Transactions</a></li>
            <li><a class="active" href="Profile.aspx">Profile</a></li>
         </ul>
      </nav>
        <div> <br /><br />
            <asp:Panel ID="UpdatePhotoPanel" runat="server" style="color: #c5c6c7; font-size: large; text-align: center; position: absolute;" Width="694px" BorderColor="#66FCF1" BorderStyle="Solid" >
                <br />
                    <asp:Image ID="Image1" runat="server" class="img"/>&emsp;
                            <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/img/pen (2).png" OnClick="ImageButton5_Click" />
                <br /><br />
                    <div style="font-size: large; width: 558px; text-align: center;" class="container">
                        &emsp;<asp:Label ID="LastnameLbl" runat="server" Text=""></asp:Label>, &nbsp;
                        <asp:Label ID="FirstnameLbl" runat="server" Text=""></asp:Label><br />
                        &emsp;Date Registered:&emsp;
                        <asp:Label ID="DateregisteredLbl" runat="server" Text=""></asp:Label>
                    </div>
                <br />
                    <div style="font-size: large; width: 557px; margin: auto; text-align: left">
                        &emsp;Account No.:&emsp;
                        <div style="text-align: right; font-size: 25px;">
                            <asp:Label ID="AccountnumLbl" runat="server" Text=""></asp:Label> &emsp;&emsp;&emsp;
                        </div>
                        <br />
                        &emsp;Date of Birth:&emsp;
                        <div style="text-align: right; font-size: 25px;">
                            <asp:Label ID="DOBLbl" runat="server" Text=""></asp:Label>&emsp;&emsp;&emsp;
                        </div>
                        <br />
                        &emsp;Email Address:&emsp;
                        <div style="text-align: right; font-size: 25px;">
                            <asp:Label ID="EmailaddressLbl" runat="server" Text=""></asp:Label>&emsp;
                            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/img/pen (2).png" OnClick="ImageButton2_Click" />
                        </div>
                        <br />
                        &emsp;Username:&emsp;
                        <div style="text-align: right; font-size: 25px;">
                            <asp:Label ID="UsernameLbl" runat="server" Text=""></asp:Label>&emsp;
                            <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/img/pen (2).png" OnClick="ImageButton3_Click" />
                        </div>
                        <br />
                        &emsp;Phone Number:&emsp;
                        <div style="text-align: right; font-size: 25px;">
                            <asp:Label ID="PhonenumLbl" runat="server" Text=""></asp:Label>&emsp;
                            <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/img/pen (2).png" OnClick="ImageButton4_Click" />
                        </div>
                        <br />
                    </div>
            </asp:Panel>
            <br /><br />
            <div style="position: absolute; top: 248px; left: 881px; width: 603px;">
                <asp:Button ID="Button4" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="25px" ForeColor="#C5C6C7" Text="Manage Account" ToolTip="Manage Account" Width="605px" Height="38px" OnClick="Button4_Click"/><br /><br />
                <asp:Button ID="Button1" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="25px" ForeColor="#C5C6C7" Text="Change Password" ToolTip="Change Password" Width="605px" Height="38px" OnClick="Button1_Click" /><br /><br />
                <asp:Button ID="Button2" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="25px" ForeColor="#C5C6C7" Text="Reports" ToolTip="Reports" Width="606px" Height="38px" OnClick="Button2_Click" /><br /><br />
                <asp:Button ID="Button3" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="25px" ForeColor="#C5C6C7" Text="LOG-OUT" ToolTip="Log-out" Width="606px" Height="38px" OnClick="Button3_Click" />
                 
            </div> <br />
        </div>
    </form>
</body>
</html>