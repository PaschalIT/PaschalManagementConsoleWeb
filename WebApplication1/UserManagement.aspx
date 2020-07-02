<%@ Page Title="User Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="WebApplication1._Default" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <table class="nav-justified">
            <tr>
                <td colspan="3">
        <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 184px">
        <ajaxToolkit:ComboBox ID="comboUMUsers" runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList" ItemInsertLocation="OrdinalText" AutoPostBack="True" OnLoad="comboUMUsers_Load" OnSelectedIndexChanged="comboUMUsers_SelectedIndexChanged" RenderMode="Block">
        </ajaxToolkit:ComboBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Refresh Info" />
                </td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
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
                    <asp:Button ID="buttonUMEmployeeNumber" runat="server" OnClick="buttonUMEmployeeNumber_Click" Text="Show" Height="100%" />
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
                <td class="modal-sm" style="width: 30%; " rowspan="6">
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
            <tr>
                <td style="width: 20ex">&nbsp;</td>
                <td style="width: 20%">&nbsp;</td>
                <td class="modal-sm" style="width: 30%">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 20ex">&nbsp;</td>
                <td style="width: 20%">&nbsp;</td>
                <td class="modal-sm" style="width: 30%; text-align: justify;">
                    <asp:Button ID="buttonUMUnlockAccount1" runat="server" Height="100%" Text="Unlock Account" Width="34%" OnClick="buttonUMUnlockAccount1_Click" />
                    &nbsp;<asp:Button ID="buttonUMResetPassword1" runat="server" Height="100%" Text="Reset Password" Width="34%" Enabled="False" />
                </td>
            </tr>
            <tr>
                <td style="width: 20ex">&nbsp;</td>
                <td class="modal-sm" style="width: 30%; ">&nbsp;</td>
                <td style="width: 20%">&nbsp;</td>
                <td class="modal-sm" style="width: 30%">&nbsp;</td>
            </tr>
        </table>
    </asp:Panel>

</asp:Content>
