<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SRReports.aspx.cs" Inherits="Ewallet_FinalProject.SRReports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="en" dir="ltr" style="background-color: #0b0c10">
<head runat="server">
    <title>E-wallet | Transactions</title>
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
            <li><a href="Send.aspx">Send</a></li>
            <li><a href="DepositWithdraw.aspx">Deposit / Withdraw</a></li>
            <li><a href="Transactions.aspx">Transactions</a></li>
            <li><a class="active" href="Profile.aspx">Profile</a></li>
         </ul>
      </nav>
        <div> <br /><br />
            <div class="container" style="text-align: center; color: #FFFFFF; font-size: 40px; font-family: 'century gothic'; font-weight: bold;">
                 <strong>TRANSACTION HISTORY (SEND & RECEIVE)
            </strong>
            </div>
            <asp:Panel ID="Datespanel" runat="server" style="color: #c5c6c7; font-size: 25px;" Width="1228px" Height="139px">
                <strong>CHOOSE DATE: </strong><br /><br />
                <div class="container" style="position: absolute; top: 222px; left: 115px; width: 873px;">
                    From:
                    <asp:TextBox ID="FromTxtbox" runat="server" type="date" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Width="169px" placeholder="FROM " AutoPostBack="True" OnTextChanged="FromTxtbox_TextChanged1"></asp:TextBox> &nbsp;
                     <div style="width: 33px; position: absolute; top: 10px; left: 267px;" >
                         <asp:Image ID="Image1" runat="server" Height="31px" ImageUrl="~/img/right-arrow (1).png" />
                     </div>&emsp;&emsp;
                    To:
                    <asp:TextBox ID="ToTxtbox" runat="server" type="date" BackColor="#0B0C10" BorderColor="#66FCF1" BorderWidth="2px" ForeColor="#C5C6C7" Width="169px" placeholder="TO" AutoPostBack="True" OnTextChanged="ToTxtbox_TextChanged1"></asp:TextBox> &nbsp;
                    <div style="width: 37px; position: absolute; top: 11px; left: 543px;">
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="31px" ImageUrl="~/img/search (1).png" Width="31px" OnClick="ImageButton1_Click" Enabled="False" />
                    </div>
                    <div style="width: 196px; position: absolute; top: 0px; left: 675px; height: 24px;">
                    <asp:DropDownList ID="ChooseCategory" runat="server" AutoPostBack="True" Height="33px" AppendDataBoundItems="True">
                        <asp:ListItem>All</asp:ListItem>
                        <asp:ListItem>Send</asp:ListItem>
                        <asp:ListItem>Receive</asp:ListItem>
                    </asp:DropDownList>
                    </div>
                </div>
                <div style="width: 488px; position: absolute; top: 266px; left: 187px;">
                    <asp:Label ID="Label2" runat="server" Font-Size="Medium"></asp:Label>
                </div>
                <div style="width: 488px; position: absolute; top: 266px; left: 187px;">
                    <asp:Label ID="Label3" runat="server" Font-Size="Medium"></asp:Label>
                </div>
                <div style="width: 488px; position: absolute; top: 266px; left: 187px;">
                    <asp:Label ID="Label4" runat="server" Font-Size="Medium"></asp:Label>
                </div>
                <div style="width: 488px; position: absolute; top: 266px; left: 187px;">
                    <asp:Label ID="Label5" runat="server" Font-Size="Medium"></asp:Label>
                </div>
            </asp:Panel>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" style="color: #c5c6c7; font-size: medium; text-align: center; margin: auto;" Width="878px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowCommand="GridView1_RowCommand">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Transaction Number"/>
                    <asp:BoundField DataField="Transamount" HeaderText="Transaction Amount" />
                    <asp:BoundField DataField="Transdate" HeaderText="Transaction Date &amp; Time" />
                    <asp:BoundField DataField="Transdesc" HeaderText="Transaction Type" />
                    <asp:ButtonField CommandName="View" HeaderText="View Details" Text="VIEW" ButtonType="Button" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
            <br />
            <div style="margin: auto; font-family: 'century Gothic'; font-size: 25px; font-weight: bold; color: #FFFFFF; width: 875px; height: 169px;">
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>