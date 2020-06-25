<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
        <br />
        <asp:DropDownList ID="listUsers" runat="server" OnLoad="listUsers_Load" OnSelectedIndexChanged="listUsers_SelectedIndexChanged" ViewStateMode="Enabled" Width="300px">
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Click Me!" />
    </div>

    <asp:Panel ID="Panel1" runat="server" Height="504px">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <table style="width: 40%; table-layout: fixed; text-align: left; vertical-align: middle; overflow: auto;">
            <tr>
                <td style="width: 123px">Name</td>
                <td class="modal-sm" style="width: 253px">
                    <asp:TextBox ID="textUMName" runat="server" ReadOnly="True" Width="200px"></asp:TextBox>
                </td>
                <td style="width: 134px">Enabled</td>
                <td class="modal-sm" style="width: 522px">
                    <asp:TextBox ID="textUMEnabled" runat="server" ReadOnly="True" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 123px">Username</td>
                <td class="modal-sm" style="width: 253px">
                    <asp:TextBox ID="textUMUsername" runat="server" ReadOnly="True" Width="200px"></asp:TextBox>
                </td>
                <td aria-expanded="true" style="width: 134px">Last Logon</td>
                <td class="modal-sm" style="width: 522px">
                    <asp:TextBox ID="textUMLastLogon" runat="server" ReadOnly="True" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 123px">Email</td>
                <td class="modal-sm" style="width: 253px">
                    <asp:TextBox ID="textUMEmail" runat="server" ReadOnly="True" Width="200px"></asp:TextBox>
                </td>
                <td style="width: 134px">Employee ID</td>
                <td class="modal-sm" style="width: 522px">
                    <asp:TextBox ID="textUMEmployeeID" runat="server" ReadOnly="True" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 123px">Department</td>
                <td class="modal-sm" style="width: 253px">
                    <asp:TextBox ID="textUMDepartment" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td style="width: 134px">Employee Number</td>
                <td class="modal-sm" style="width: 522px">
                    <asp:TextBox ID="textUMEmployeeNumber" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 123px">Title</td>
                <td class="modal-sm" style="width: 253px">
                    <asp:TextBox ID="textUMTitle" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td style="width: 134px">Pass Last Changed</td>
                <td class="modal-sm" style="width: 522px">
                    <asp:TextBox ID="textUMPassLastChanged" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 123px">Manager</td>
                <td class="modal-sm" style="width: 253px">
                    <asp:TextBox ID="textUMManager" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td style="width: 134px">Pass Expiration</td>
                <td class="modal-sm" style="width: 522px">
                    <asp:TextBox ID="textUMPassExpiration" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 123px; height: 22px"></td>
                <td class="modal-sm" style="width: 253px; height: 22px"></td>
                <td style="width: 134px; height: 22px">Failed Logons</td>
                <td class="modal-sm" style="width: 522px; height: 22px">
                    <asp:TextBox ID="textUMNumFailedLogons" runat="server" Width="21px"></asp:TextBox>
                    <asp:TextBox ID="textUMFailedLogons" runat="server" Width="175px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 123px; height: 20px"></td>
                <td class="modal-sm" style="width: 253px; height: 20px"></td>
                <td style="width: 134px; height: 20px">Date of Hire</td>
                <td class="modal-sm" style="width: 522px; height: 20px">
                    <asp:TextBox ID="textUMDateOfHire" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 123px">&nbsp;</td>
                <td class="modal-sm" style="width: 253px">&nbsp;</td>
                <td style="width: 134px">Date of Termination</td>
                <td class="modal-sm" style="width: 522px">
                    <asp:TextBox ID="textUMDateOfTermination" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 123px">&nbsp;</td>
                <td class="modal-sm" style="width: 253px">&nbsp;</td>
                <td style="width: 134px">Last Modified</td>
                <td class="modal-sm" style="width: 522px">
                    <asp:TextBox ID="textUMLastModified" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
        </table>
    </asp:Panel>

</asp:Content>
