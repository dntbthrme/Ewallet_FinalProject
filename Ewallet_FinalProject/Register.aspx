<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Ewallet_FinalProject.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-color: #0b0c10;">
<head runat="server">
    <title>E-wallet | Register</title>
    <link href="Layout.css" rel="stylesheet" type="text/css" />
    <script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function showpreview(input) {

            if (input.files && input.files[0]) {

                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#Image1').css('visibility', 'visible');
                    $('#Image1').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }

        }

    </script>
</head>
<body>
    <form id="form1" runat="server" class="container"> 
        <nav></nav>
        <div style="font-family: 'Arial Black'; font-size: 100px; text-transform: capitalize; color: #66fcf1; text-align: center; height: 116px;">
            E-WALLET
        </div>
            
        <br /><br /><br />
        <div style="color: #c5c6c7; font-size: medium;" class="container">
            <div style="font-size: 30px; font-weight: 700; text-align: center;">
                    Create an account
            </div> <br />
            
            <div style="text-align: left; width: 732px;" class="container">
                    &emsp;Last name: &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp; First name:<br />
                    &emsp;<asp:TextBox ID="LastnameTxtbox" runat="server" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Height="29px" Width="324px"></asp:TextBox>
                    &emsp;&emsp;
                    <asp:TextBox ID="FirstnameTxtbox" runat="server" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Height="29px" Width="324px"></asp:TextBox>
                    <br />

                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LastnameTxtbox" ErrorMessage="Input Lastname!!" ForeColor="Red" ValidationGroup="Register"></asp:RequiredFieldValidator>
                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="FirstnameTxtbox" ErrorMessage="Input Firstname!!" ForeColor="Red" ValidationGroup="Register"></asp:RequiredFieldValidator>
                    
                    <br />
                    &emsp;Email Address &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp; Username:<br />
                    &emsp;<asp:TextBox ID="EmailTxtbox" runat="server" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Height="29px" Width="324px"></asp:TextBox>
                    &emsp;&emsp;
                    <asp:TextBox ID="UsernameRTxtbox" runat="server" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Height="29px" Width="324px"></asp:TextBox>
                    <br />
                
                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email Address Reqiured!!" ControlToValidate="EmailTxtbox" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Register"></asp:RegularExpressionValidator>
                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    
                    <br />
                    &emsp;Password: &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp; Confirm Password:<br />
                    &emsp;<asp:TextBox ID="PasswordRTxtbox" runat="server" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Height="29px" Width="324px" type="Password"></asp:TextBox>
                    &emsp;&emsp;
                    <asp:TextBox ID="ConfirmpassTxtbox" runat="server" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Height="29px" Width="324px" type="Password"></asp:TextBox>
                    <br />
                
                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="PasswordRTxtbox" ErrorMessage="Input Password!!" ForeColor="Red" ValidationGroup="Register"></asp:RequiredFieldValidator>
                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Password does not match!!" ForeColor="Red" ControlToCompare="ConfirmpassTxtbox" ControlToValidate="PasswordRTxtbox" ValidationGroup="Register"></asp:CompareValidator>
                    <br />
                    &emsp;Mobile Number: &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp; Date of Birth:<br />
                    &emsp;<asp:TextBox ID="MobilenumTxtbox" runat="server" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Height="29px" Width="324px"></asp:TextBox>
                    &emsp;&emsp;
                    <asp:TextBox ID="DOBTxtbox" runat="server" type="date" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Height="29px" Width="324px"></asp:TextBox>
                    <br />
                    
                    &emsp;&emsp;&emsp;&emsp;
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Phone number must be 10 digits!!" ControlToValidate="MobilenumTxtbox" ForeColor="Red" MaximumValue="9999999999" MinimumValue="1000000000" Type="Double" ValidationGroup="Register"></asp:RangeValidator>
                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="DOBTxtbox" ErrorMessage="Input Date of Birth!!" ForeColor="Red" ValidationGroup="Register"></asp:RequiredFieldValidator>
                    
                    <br />
                    <div style="margin: auto; text-align: center">
                        <asp:Image ID="Image1" runat="server" src="" class="img" /> <br />
                        <div style="font-size:20px; text-align: left; margin: auto; width: 370px;">
                            &emsp;<asp:FileUpload ID="FileUpload1" runat="server" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Height="29px" Width="456px" onchange="showpreview(this);"/>
                            
                        </div>
                    </div>
                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="FileUpload1" ErrorMessage="Upload photo!!" ForeColor="Red" ValidationGroup="Register"></asp:RequiredFieldValidator>
                    
                    <br />
                    <br />
                    <div style="color: #c5c6c7; text-align: center; font-size: medium;">
                        <asp:Button ID="RegisteredBtn" runat="server" BackColor="#0b0c10" BorderColor="#66FCF1" BorderWidth="2px" Font-Bold="True" Font-Names="Century Gothic" Font-Size="Medium" ForeColor="#C5C6C7" Text="Register" ToolTip="Register" Width="190px" OnClick="RegisteredBtn_Click" ValidationGroup="Register" />
                        <br /><br />Already have an account?
                        <asp:Button ID="BacktoLoginBtn" runat="server" Text="Back to Log-in"  BackColor="#0B0C10" ForeColor="#66FCF1" style="font-weight: 700;" BorderStyle="None" Height="16px" Width="106px" ToolTip="Back to Log-in" OnClick="BacktoLoginBtn_Click" />
                    </div>
                    <br /><br />
                </div>
            </div>
    </form>
</body>
</html>
