<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Changepassword.aspx.cs" Inherits="Ewallet_FinalProject.Change_password" %>

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
        <div class="content"> <br /><br />
                <asp:Panel ID="ChangepassPanel" runat="server" style="color: #c5c6c7; font-size: 30px; text-align: center;" class="container" BorderColor="#66FCF1" BorderWidth="2px" Width="730px">
                    -- CHANGE PASSWORD --<br />
                    <div style="text-align: left;">
                        &emsp;
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img/left-arrow (1).png" OnClick="ImageButton1_Click" />
                        </div>
                    <asp:Panel ID="Panel6" runat="server" style="color: #c5c6c7; font-size: medium;" class="container" Width="328px">
                        Current Password: <br />
                        <asp:TextBox ID="CurrentpassTxtbox" runat="server" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Height="29px" Width="324px" OnTextChanged="CurrentpassTxtbox_TextChanged" type="password"></asp:TextBox>
                        <br />
                        <div style="text-align: center; font-size: 20px;">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        <br /></div><br />
                        New Password <br />
                        <asp:TextBox ID="NewpassTxtbox" runat="server" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Height="29px" Width="324px" type="password"></asp:TextBox>
                        <br />
                        <div style="text-align: center; font-size: 20px;">
                            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Input password!!" ControlToValidate="NewpassTxtbox" ForeColor="Red" ValidationGroup="pass"></asp:RequiredFieldValidator>
                        </div><br />
                        Confirm Password <br />
                        <asp:TextBox ID="ConfirmpassTxtbox" runat="server" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Height="29px" Width="324px" type="password"></asp:TextBox>
                        <br />
                        <div style="text-align: center; font-size: 20px;">
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password not matched!!" ControlToCompare="NewpassTxtbox" ControlToValidate="ConfirmpassTxtbox" ForeColor="Red" ValidationGroup="pass"></asp:CompareValidator>
                        </div><br />

                    </asp:Panel>
                    
                    <br />
                    <asp:Button ID="ChangepassBtn" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="20px" ForeColor="#C5C6C7" Text="Change Password" ToolTip="Change Password" Height="29px" Width="400px" OnClick="ChangepassBtn_Click" ValidationGroup="pass" />
                     <br /><br />
                </asp:Panel>

                <asp:Panel ID="Panel1" runat="server" style="color: #c5c6c7; font-size: 30px; text-align: center;" class="container" Visible="false" BorderColor="#66FCF1" BorderWidth="2px" Width="730px">
                    PASSWORD CHANGED!!<br /><br />
                    <asp:Button ID="Button1" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="20px" ForeColor="#C5C6C7" Text="DONE" ToolTip="DONE" Height="29px" Width="400px" OnClick="Button1_Click" />
                     <br /><br />
                </asp:Panel>

            </div>
    </form>
</body>
</html>
