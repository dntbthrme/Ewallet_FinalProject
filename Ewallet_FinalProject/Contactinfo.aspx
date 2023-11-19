<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contactinfo.aspx.cs" Inherits="Ewallet_FinalProject.Contactinfo" %>

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

                <asp:Panel ID="ContactInfoPanel" runat="server" style="color: #c5c6c7; font-size: large; text-align: center;" class="container" Width="373px" Visible="true">
                    -- CONTACT INFORMATION  -- <br />
                    <asp:Panel ID="panel2" runat="server" style="color: #c5c6c7; font-size: medium;" class="container" Width="373px">
                        <asp:RadioButtonList ID="ContactInfoRadioButtonList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ContactInfoRadioButtonList_SelectedIndexChanged">
                            <asp:ListItem>Update email address</asp:ListItem>
                            <asp:ListItem>Update mobile number</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:Panel>
                </asp:Panel>

                <asp:Panel ID="EmailUpdatePanel" runat="server" style="color: #c5c6c7; font-size: large; text-align: center;" class="container" Visible="false">
                    <br /><br />UPDATE EMAIL ADDRESS<br /><br />
                    <asp:TextBox ID="UpdateEmailTxtbox" runat="server" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Height="29px" Width="324px" ></asp:TextBox>
                    <br /><br />
                    <asp:Button ID="EmailChangeBtn" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="large" ForeColor="#C5C6C7" Text="CHANGE EMAIL ADDRESS" ToolTip="Change email address" Width="704px" Height="38px" />
                </asp:Panel>

                <asp:Panel ID="PhonenumUpdatePanel" runat="server" style="color: #c5c6c7; font-size: large; text-align: center;" class="container" Visible="false">
                    <br /><br />UPDATE PHONE NUMBER<br /><br />
                    <asp:TextBox ID="PhoneUpdateTxtbox" runat="server" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Height="29px" Width="324px"></asp:TextBox>
                    <br /><br />
                    <asp:Button ID="PhonenumChangeBtn" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="large" ForeColor="#C5C6C7" Text="CHANGE PHONE NUMBER" ToolTip="Change phone number" Width="704px" Height="38px" />
                </asp:Panel>
            </div>
    </form>
</body>
</html>
