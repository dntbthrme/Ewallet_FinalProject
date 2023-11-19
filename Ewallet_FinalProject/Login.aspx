<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Ewallet_FinalProject.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color: #0b0c10;">
<head runat="server">
    <title>E-wallet | Login</title>
    <link href="Layout.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" class="container"> 
        <nav>
         <div class="logo">
            E-wallet
         </div>
         <input type="checkbox" id="click"/>
         <label for="click" class="menu-btn">
         <i class="fas fa-bars"></i>
         </label>
      </nav>
        <div style="font-family: 'Arial Black'; font-size: 100px; text-transform: capitalize; color: #66fcf1; text-align: center; height: 116px;">
            E-WALLET
        </div>
            
        <br /><br /><br />
        <asp:Panel ID="Panel1" runat="server" Width="149px" class="container">
            <asp:Image ID="Image1" runat="server" class="img" ImageUrl="~/img/user.png"/>
        </asp:Panel>
        <div style="text-align: left; color: #c5c6c7; font-size: medium; width: 333px;" class="container">
            Username:<br />
            <asp:TextBox ID="UsernameTxtbox" runat="server" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Height="29px" Width="324px"></asp:TextBox>
            <br />&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UsernameTxtbox" ErrorMessage="Input username!!" ForeColor="Red" ValidationGroup="Login"></asp:RequiredFieldValidator>
            <br />
            Password:<br />
            <asp:TextBox ID="PasswordTxtbox" runat="server" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Height="29px" Width="324px" type="Password"></asp:TextBox>
            
            <div style="text-align: right; "> 
                <asp:Button ID="ForgotpassBtn" runat="server" Text="Forgot Password??" BackColor="#0B0C10" ForeColor="#66FCF1" BorderStyle="None" Width="150px" OnClick="ForgotpassBtn_Click" />
            </div><br />
            <div style="text-align: center">
                <asp:Label ID="StatusLbl" runat="server" Text="" ForeColor="Red" style="text-align: left"></asp:Label>
            </div>
            <br />

            <div style="color: #c5c6c7; text-align: center; font-size: medium;">
                <asp:Button ID="LoginBtn" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium" ForeColor="#C5C6C7" Text="Log In" ToolTip="Log In" Width="190px" OnClick="LoginBtn_Click" ValidationGroup="Login" />
                <br /><br /><br />
                Don't have an account? 
                <asp:Button ID="RegisterBtn" runat="server" Text="Register" BackColor="#0B0C10" ForeColor="#66FCF1" style="font-weight: 700;" BorderStyle="None" Height="16px" OnClick="RegisterBtn_Click" />
            </div>
                    
            <br /><br />

        </div>

    </form>
</body>
</html>
