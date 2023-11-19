<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Updatephoto.aspx.cs" Inherits="Ewallet_FinalProject.Profile2" %>

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
                <asp:Panel ID="UpdatePhotoPanel" runat="server" class="container" style="text-align: center; color: #FFFFFF; font-size: 40px; font-family: 'century gothic'; font-weight: bold;" BorderColor="#66FCF1" BorderWidth="2px" Width="805px">
                    <br /><br />UPDATE PROFILE PHOTO<br />
                    <div style="text-align: left;">
                        &emsp;
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img/left-arrow (1).png" OnClick="ImageButton1_Click" />
                        </div>
                    <div style="margin: auto; text-align: center">
                        <asp:Image ID="Image2" runat="server" class="img" src=" "/> <br />
                        <div style="font-size:20px; text-align: left; margin: auto; width: 370px;">
                            &emsp;<asp:FileUpload ID="FileUpload1" runat="server" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Height="30px" Width="446px" onchange="showpreview(this);"/>
                        </div>
                    </div>
                    <br />
                    <div style="text-align: center; font-size: 20px;">
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Input photo!!" ControlToValidate="FileUpload1" ForeColor="Red" ValidationGroup="photo"></asp:RequiredFieldValidator>
                    </div><br />
                    <asp:Button ID="PhotoChangeBtn" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="25px" ForeColor="#C5C6C7" Text="CHANGE PHOTO" ToolTip="Change photo" Width="704px" Height="38px" OnClick="PhotoChangeBtn_Click" ValidationGroup="photo" />
                </asp:Panel>
                <asp:Panel ID="Panel1" runat="server" style="color: #c5c6c7; font-size: 30px; text-align: center;" class="container" BorderColor="#66FCF1" BorderWidth="2px" Width="805px" Visible="false">
                    <br /><br />PROFILE PHOTO UPDATED!!<br /><br />
                    <asp:Button ID="Button1" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="20px" ForeColor="#C5C6C7" Text="DONE" ToolTip="DONE" Width="704px" Height="38px" OnClick="Button1_Click" />
                </asp:Panel>

            </div>
    </form>
</body>
</html>
