<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
        <br />
        <asp:DropDownList ID="listUsers" runat="server" OnLoad="listUsers_Load" OnSelectedIndexChanged="listUsers_SelectedIndexChanged" ViewStateMode="Enabled" Width="300px">
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Click Me!" />
    </div>

    <asp:Panel ID="Panel1" runat="server" Height="504px" Width="100%">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <table style="width: 100%; table-layout: fixed; text-align: left; vertical-align: middle; overflow: auto; height: 50%;">
            <tr>
                <td style="width: 20ex">Name</td>
                <td class="modal-sm" style="width: 30%">
                    <asp:TextBox ID="textUMName" runat="server" ReadOnly="True" Width="70%"></asp:TextBox>
                </td>
                <td style="width: 20%">Enabled</td>
                <td class="modal-sm" style="width: 30%">
                    <asp:TextBox ID="textUMEnabled" runat="server" ReadOnly="True" Width="70%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 20ex">Username</td>
                <td class="modal-sm" style="width: 30%">
                    <asp:TextBox ID="textUMUsername" runat="server" ReadOnly="True" Width="70%"></asp:TextBox>
                </td>
                <td aria-expanded="true" style="width: 20%">Last Logon</td>
                <td class="modal-sm" style="width: 30%">
                    <asp:TextBox ID="textUMLastLogon" runat="server" ReadOnly="True" Width="70%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 20ex">Email</td>
                <td class="modal-sm" style="width: 30%">
                    <asp:TextBox ID="textUMEmail" runat="server" ReadOnly="True" Width="70%"></asp:TextBox>
                </td>
                <td style="width: 20%">Employee ID</td>
                <td class="modal-sm" style="width: 30%">
                    <asp:TextBox ID="textUMEmployeeID" runat="server" ReadOnly="True" Width="70%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 20ex">Department</td>
                <td class="modal-sm" style="width: 30%">
                    <asp:TextBox ID="textUMDepartment" runat="server" Width="70%" ReadOnly="True"></asp:TextBox>
                </td>
                <td style="width: 20%">Employee Number</td>
                <td class="modal-sm" style="width: 30%">
                    <asp:TextBox ID="textUMEmployeeNumber" runat="server" Width="70%" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 20ex">Title</td>
                <td class="modal-sm" style="width: 30%">
                    <asp:TextBox ID="textUMTitle" runat="server" Width="70%" ReadOnly="True"></asp:TextBox>
                </td>
                <td style="width: 20%">Pass Last Changed</td>
                <td class="modal-sm" style="width: 30%">
                    <asp:TextBox ID="textUMPassLastChanged" runat="server" Width="70%" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 20ex">Manager</td>
                <td class="modal-sm" style="width: 30%">
                    <asp:TextBox ID="textUMManager" runat="server" Width="70%" ReadOnly="True"></asp:TextBox>
                </td>
                <td style="width: 20%">Pass Expiration</td>
                <td class="modal-sm" style="width: 30%">
                    <asp:TextBox ID="textUMPassExpiration" runat="server" Width="70%" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 20ex; ">Direct Reports</td>
                <td class="modal-sm" style="width: 30%; " rowspan="4">
                    <asp:ListBox ID="listUMDirectReports" runat="server" Height="100%" Width="70%"></asp:ListBox>
                </td>
                <td style="width: 20%; ">Failed Logons</td>
                <td class="modal-sm" style="width: 30%; ">
                    <asp:TextBox ID="textUMNumFailedLogons" runat="server" Width="6%" ReadOnly="True"></asp:TextBox>
                    <asp:TextBox ID="textUMFailedLogons" runat="server" Width="63%" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 20ex; "></td>
                <td style="width: 20%; ">Date of Hire</td>
                <td class="modal-sm" style="width: 30%; ">
                    <asp:TextBox ID="textUMDateOfHire" runat="server" Width="70%" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 20ex; height: 26px;"></td>
                <td style="width: 20%; height: 26px;">Date of Termination</td>
                <td class="modal-sm" style="width: 30%; height: 26px;">
                    <asp:TextBox ID="textUMDateOfTermination" runat="server" Width="70%" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 20ex">&nbsp;</td>
                <td style="width: 20%">Last Modified</td>
                <td class="modal-sm" style="width: 30%">
                    <asp:TextBox ID="textUMLastModified" runat="server" Width="70%" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
        </table>
    </asp:Panel>

</asp:Content>
