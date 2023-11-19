<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manageacc.aspx.cs" Inherits="Ewallet_FinalProject.Manageacc" %>

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
            <div class="container" style="text-align: center; color: #FFFFFF; font-size: 40px; font-family: 'century gothic'; font-weight: bold;">
                 MANAGE ACCOUNT <br /><br /><br />

                <asp:Button ID="ManageBtn" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="25px" ForeColor="#C5C6C7" Text="Deactivate" Width="275px" Height="59px" OnClick="ManageBtn_Click"/>
                  <br /><br />    
            </div>
            </div>
    </form>
</body>
</html>
