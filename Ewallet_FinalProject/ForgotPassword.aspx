<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Ewallet_FinalProject.ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color: #0b0c10;">
<head runat="server">
    <title>E-wallet | Forgot Password </title>
      <link href="Layout.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" class="container"> 
        <nav></nav>
        <div style="font-family: 'Arial Black'; font-size: 100px; text-transform: capitalize; color: #66fcf1; text-align: center; height: 116px;">
            E-WALLET
        </div>
            
        <br /><br /><br />

        <div style="color: #c5c6c7; font-size: 30px; font-weight: 700; text-align: center;">
                    CHANGE PASSWORD
        </div> <br />

        <asp:Panel ID="VerificationPanel" runat="server" style="color: #c5c6c7; font-size: medium;" class="container" Width="373px">
            &emsp;Registered Email Address:<br />&emsp;
            <asp:TextBox ID="VerifyEmailTxtbox" runat="server" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Height="29px" Width="324px"></asp:TextBox>
            <br />
            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
            <asp:Label ID="Label1" runat="server"></asp:Label>

            <br />&emsp;
            <asp:Button ID="NextBtn" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium" ForeColor="#C5C6C7" Text="Next" ToolTip="Next" Width="62px" OnClick="NextBtn_Click" />
                        
        </asp:Panel>

        <asp:Panel ID="ChangepasswordPanel" runat="server" style="color: #c5c6c7; font-size: medium;" class="container" Width="373px" Visible="false">
            &emsp;New Password: <br />&emsp;
            <asp:TextBox ID="NewpassTxtbox" runat="server" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Height="29px" Width="324px" type="Password"></asp:TextBox>
            <br />
            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            <br />
            &emsp;Confirm Password <br />&emsp;
            <asp:TextBox ID="ConfirmpassTxtbox" runat="server" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Height="29px" Width="324px" type="Password"></asp:TextBox>
            <br />
            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Not Matched!!" ControlToCompare="NewpassTxtbox" ControlToValidate="ConfirmpassTxtbox" ForeColor="Red" ValidationGroup="PASS"></asp:CompareValidator>

            <br />&emsp;
            <asp:Button ID="ResetpassBtn" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium" ForeColor="#C5C6C7" Text="Reset Password" ToolTip="Reset Password" Width="136px" OnClick="ResetpassBtn_Click" ValidationGroup="PASS" />
                        
        </asp:Panel>

    </form>
</body>
</html>
