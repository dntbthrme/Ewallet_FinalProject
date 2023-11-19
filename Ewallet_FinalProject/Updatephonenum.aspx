﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Updatephonenum.aspx.cs" Inherits="Ewallet_FinalProject.Updatephonenum" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en" dir="ltr" style="background-color: #0b0c10">
<head runat="server">
    <title>E-wallet | Profile</title>
    <link href="Layout.css" rel="stylesheet" type="text/css" />
    <script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function showpreview(input) {

            if (input.files && input.files[0]) {

                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#Image2').css('visibility', 'visible');
                    $('#Image2').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }

        }

    </script>
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
            <asp:Panel ID="PhonenumUpdatePanel" runat="server" class="container" style="text-align: center; color: #FFFFFF; font-size: 40px; font-family: 'century gothic'; font-weight: bold;" BorderColor="#66FCF1" BorderWidth="2px" Width="797px">
                    <br /><br />UPDATE PHONE NUMBER<br />
                    <div style="text-align: left;">
                        &emsp;
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img/left-arrow (1).png" OnClick="ImageButton1_Click" />
                        </div>
                    <asp:TextBox ID="PhoneUpdateTxtbox" runat="server" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Height="30px" Width="446px"></asp:TextBox>
                    <br />
                    <div style="text-align: center; font-size: 20px;">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Phone number must be 10 digits!!" ControlToValidate="PhoneUpdateTxtbox" ForeColor="Red" MaximumValue="9999999999" MinimumValue="1000000000" Type="Double" ValidationGroup="phone"></asp:RangeValidator>
                    </div><br />
                    <asp:Button ID="PhonenumChangeBtn" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="25px" ForeColor="#C5C6C7" Text="CHANGE PHONE NUMBER" ToolTip="Change phone number" Width="704px" Height="38px" OnClick="PhonenumChangeBtn_Click" ValidationGroup="phone" />
                </asp:Panel>
            <asp:Panel ID="Panel1" runat="server" style="color: #c5c6c7; font-size: 30px; text-align: center;" class="container" BorderColor="#66FCF1" BorderWidth="2px" Width="797px" Visible ="false">
                    <br /><br />PHONE NUMBER UPDATED!!
                    <br /><br />
                    <asp:Button ID="Button1" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="20px" ForeColor="#C5C6C7" Text="DONE" ToolTip="DONE" Width="704px" Height="38px" OnClick="Button1_Click" />
                </asp:Panel>
            </div>
    </form>
</body>
</html>