<%@ Page Title="User Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="WebApplication1._Default" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <table class="nav-justified">
            <tr>
                <td colspan="5">
        <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 200px">
        <ajaxToolkit:ComboBox ID="comboUMUsers" runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList" ItemInsertLocation="OrdinalText" AutoPostBack="True" OnLoad="comboUMUsers_Load" OnSelectedIndexChanged="comboUMUsers_SelectedIndexChanged" Width="100%">
        </ajaxToolkit:ComboBox>
                </td>
                <td style="width: 80px">
                    &nbsp;</td>
                <td style="width: 100px">
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Refresh Info" Width="100px" />
                </td>
                <td style="width: 40px">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="buttonUMClear" runat="server" OnClick="buttonUMClear_Click" Text="Clear" Width="100px" />
                </td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>

    <asp:Panel ID="Panel1" runat="server" Height="504px" Width="100%">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <table style="border-style: solid; border-width: thin; width: 100%; table-layout: fixed; text-align: left; vertical-align: middle; overflow: auto; height: 50%;">
            <tr>
                <td style="border: 2px solid #FFFFFF; margin: 2px; width: 15%">Name</td>
                <td class="modal-sm" style="border: 2px solid #FFFFFF; margin: 2px; width: 35%">
                    <asp:TextBox ID="textUMName" runat="server" ReadOnly="True" Width="70%" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                </td>
                <td style="border: 2px solid #FFFFFF; margin: 2px; width: 15%">Enabled</td>
                <td class="modal-sm" style="border: 2px solid #FFFFFF; margin: 2px; width: 35%">
                    <asp:TextBox ID="textUMEnabled" runat="server" ReadOnly="True" Width="70%" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="border: 2px solid #FFFFFF; margin: 2px; width: 15%">Username</td>
                <td class="modal-sm" style="border: 2px solid #FFFFFF; margin: 2px; width: 35%">
                    <asp:TextBox ID="textUMUsername" runat="server" ReadOnly="True" Width="70%" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                </td>
                <td aria-expanded="true" style="border: 2px solid #FFFFFF; margin: 2px; width: 15%">Last Logon</td>
                <td class="modal-sm" style="border: 2px solid #FFFFFF; margin: 2px; width: 35%">
                    <asp:TextBox ID="textUMLastLogon" runat="server" ReadOnly="True" Width="70%" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="border: 2px solid #FFFFFF; margin: 2px; width: 15%">Email</td>
                <td class="modal-sm" style="border: 2px solid #FFFFFF; margin: 2px; width: 35%">
                    <asp:TextBox ID="textUMEmail" runat="server" ReadOnly="True" Width="70%" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                </td>
                <td style="border: 2px solid #FFFFFF; margin: 2px; width: 15%">Employee ID</td>
                <td class="modal-sm" style="border: 2px solid #FFFFFF; margin: 2px; width: 35%">
                    <asp:TextBox ID="textUMEmployeeID" runat="server" ReadOnly="True" Width="70%" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="border: 2px solid #FFFFFF; margin: 2px; width: 15%">Department</td>
                <td class="modal-sm" style="border: 2px solid #FFFFFF; margin: 2px; width: 35%">
                    <asp:TextBox ID="textUMDepartment" runat="server" Width="70%" ReadOnly="True" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                </td>
                <td style="border: 2px solid #FFFFFF; margin: 2px; width: 15%">Employee Number</td>
                <td class="modal-sm" style="border: 2px solid #FFFFFF; margin: 2px; width: 35%">
                    <asp:TextBox ID="textUMEmployeeNumber" runat="server" Width="70%" ReadOnly="True" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                    <asp:Button ID="buttonUMEmployeeNumber" runat="server" OnClick="buttonUMEmployeeNumber_Click" Text="Show" Height="100%" />
                </td>
            </tr>
            <tr>
                <td style="border: 2px solid #FFFFFF; margin: 2px; width: 15%">Title</td>
                <td class="modal-sm" style="border: 2px solid #FFFFFF; margin: 2px; width: 35%">
                    <asp:TextBox ID="textUMTitle" runat="server" Width="70%" ReadOnly="True" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                </td>
                <td style="border: 2px solid #FFFFFF; margin: 2px; width: 15%">Pass Last Changed</td>
                <td class="modal-sm" style="border: 2px solid #FFFFFF; margin: 2px; width: 35%">
                    <asp:TextBox ID="textUMPassLastChanged" runat="server" Width="70%" ReadOnly="True" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="border: 2px solid #FFFFFF; margin: 2px; width: 15%">Manager</td>
                <td class="modal-sm" style="border: 2px solid #FFFFFF; margin: 2px; width: 35%">
                    <asp:TextBox ID="textUMManager" runat="server" Width="70%" ReadOnly="True" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                </td>
                <td style="border: 2px solid #FFFFFF; margin: 2px; width: 15%">Pass Expiration</td>
                <td class="modal-sm" style="border: 2px solid #FFFFFF; margin: 2px; width: 35%">
                    <asp:TextBox ID="textUMPassExpiration" runat="server" Width="70%" ReadOnly="True" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="border: 2px solid #FFFFFF; margin: 2px; width: 15%; ">Direct Reports</td>
                <td class="modal-sm" style="border: 2px solid #FFFFFF; margin: 2px; width: 35%; " rowspan="6">
                    <asp:ListBox ID="listUMDirectReports" runat="server" Height="95%" Width="70%"></asp:ListBox>
                </td>
                <td style="border: 2px solid #FFFFFF; margin: 2px; width: 15%; ">Failed Logons</td>
                <td class="modal-sm" style="border: 2px solid #FFFFFF; margin: 2px; width: 35%; ">
                    <asp:TextBox ID="textUMNumFailedLogons" runat="server" Width="6%" ReadOnly="True" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                    <asp:TextBox ID="textUMFailedLogons" runat="server" Width="62%" ReadOnly="True" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="border: 2px solid #FFFFFF; margin: 2px; width: 15%; "></td>
                <td style="border: 2px solid #FFFFFF; margin: 2px; width: 15%; ">Date of Hire</td>
                <td class="modal-sm" style="border: 2px solid #FFFFFF; margin: 2px; width: 35%; ">
                    <asp:TextBox ID="textUMDateOfHire" runat="server" Width="70%" ReadOnly="True" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="border: 2px solid #FFFFFF; margin: 2px; width: 15%; "></td>
                <td style="border: 2px solid #FFFFFF; margin: 2px; width: 15%; ">Date of Termination</td>
                <td class="modal-sm" style="border: 2px solid #FFFFFF; margin: 2px; width: 35%; ">
                    <asp:TextBox ID="textUMDateOfTermination" runat="server" Width="70%" ReadOnly="True" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="border: 2px solid #FFFFFF; margin: 2px; width: 15%">&nbsp;</td>
                <td style="border: 2px solid #FFFFFF; margin: 2px; width: 15%">Last Modified</td>
                <td class="modal-sm" style="border: 2px solid #FFFFFF; margin: 2px; width: 35%">
                    <asp:TextBox ID="textUMLastModified" runat="server" Width="70%" ReadOnly="True" BorderColor="#CCCCCC" BorderStyle="Solid"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="border: 2px solid #FFFFFF; margin: 2px; width: 15%">&nbsp;</td>
                <td style="border: 2px solid #FFFFFF; margin: 2px; width: 15%">&nbsp;</td>
                <td class="modal-sm" style="border: 2px solid #FFFFFF; margin: 2px; width: 35%">&nbsp;</td>
            </tr>
            <tr>
                <td style="border: 2px solid #FFFFFF; margin: 2px; width: 15%">&nbsp;</td>
                <td style="border: 2px solid #FFFFFF; margin: 2px; width: 15%">&nbsp;</td>
                <td class="modal-sm" style="border: 2px solid #FFFFFF; margin: 2px; width: 35%; ">
                    <asp:Button ID="buttonUMUnlockAccount1" runat="server" Height="100%" Text="Unlock Account" Width="34%" OnClick="buttonUMUnlockAccount1_Click" />
                    &nbsp;<asp:Button ID="buttonUMResetPassword1" runat="server" Height="100%" Text="Reset Password" Width="34%" Enabled="False" />
                </td>
            </tr>
            <tr>
                <td style="border: 2px solid #FFFFFF; margin: 2px; width: 15%">&nbsp;</td>
                <td class="modal-sm" style="border: 2px solid #FFFFFF; margin: 2px; width: 35%; ">&nbsp;</td>
                <td style="border: 2px solid #FFFFFF; margin: 2px; width: 15%">&nbsp;</td>
                <td class="modal-sm" style="border: 2px solid #FFFFFF; margin: 2px; width: 35%">&nbsp;</td>
            </tr>
        </table>
    </asp:Panel>

</asp:Content>
