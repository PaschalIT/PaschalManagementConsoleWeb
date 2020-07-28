<%@ Page Title="User Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="WebApplication1._Default" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        input[type=submit] {
            text-align: center;
            line-height: 10px;
        }
        input[type=text], input[type=password] {
            text-indent: 3px;
        }
        input[type=radio] {
            margin: 0px;
            margin-bottom: 0px;
            margin-top: 0px;
            font-size: 12px;
            font-style: normal;
        }
        label {
            margin-bottom: 0px;
            font-weight: normal;
        }
    </style>
    <div class="jumbotron">
        <table style="width:100%;">
            <tr>
                <td style="width: 200px">
        <asp:Label ID="labelUMUsernameList" runat="server" Text="Username" Height="20px"></asp:Label>
                </td>
                <td class="auto-style3" style="width: 80px"></td>
                <td style="width: 100px">&nbsp;</td>
                <td class="auto-style3" style="width: 80px"></td>
                <td class="auto-style3">
                    <asp:RadioButton ID="radioUMSiteGlobals" runat="server" Text="Globals" Enabled="False" />
                </td>
                <td class="auto-style3"></td>
                <td class="auto-style3"></td>
                <td class="auto-style3"></td>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td colspan="2">
        <ajaxToolkit:ComboBox ID="comboUMUsers" runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDownList" ItemInsertLocation="OrdinalText" AutoPostBack="True" OnLoad="comboUMUsers_Load" OnSelectedIndexChanged="comboUMUsers_SelectedIndexChanged" Width="100%" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Height="20px" RenderMode="Block">
        </ajaxToolkit:ComboBox>
                </td>
                <td style="width: 100px">
        <asp:Button ID="buttonUMRefreshInfo" runat="server" OnClick="Button1_Click" Text="Refresh Info" Width="100px" Height="20px" />
                </td>
                <td class="auto-style3" style="width: 80px"></td>
                <td class="auto-style3">
                    <asp:RadioButton ID="radioUMSiteAR01" runat="server" Text="AR01" Enabled="False" />
                </td>
                <td class="auto-style3"></td>
                <td class="auto-style3"></td>
                <td class="auto-style3"></td>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td style="width: 200px">
                    <asp:CheckBox ID="checkUMIncludeTerminatedUsers" runat="server" AutoPostBack="True" OnCheckedChanged="checkUMIncludeTerminatedUsers_CheckedChanged" Text="Include Terminated Users" />
                </td>
                <td style="width: 80px">&nbsp;</td>
                <td style="width: 100px">
                    <asp:Button ID="buttonUMClear" runat="server" OnClick="buttonUMClear_Click" Text="Clear" Width="100px" Height="20px" />
                </td>
                <td style="width: 80px">&nbsp;</td>
                <td>
                    <asp:RadioButton ID="radioUMSiteMO01" runat="server" Text="MO01" Font-Bold="false" Enabled="False" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
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
                    <asp:Button ID="buttonUMUnlockAccount" runat="server" Height="100%" Text="Unlock Account" Width="33.5%" OnClick="buttonUMUnlockAccount_Click" />
                    &nbsp;<asp:Button ID="buttonUMResetPassword" runat="server" Height="100%" Text="Reset Password" Width="33.5%" OnClick="buttonUMResetPassword_Click" />
                    <ajaxToolkit:ConfirmButtonExtender ID="buttonUMResetPassword_ConfirmButtonExtender" runat="server" BehaviorID="buttonUMResetPassword1_ConfirmButtonExtender" ConfirmText="Confirm Reset Password" TargetControlID="buttonUMResetPassword" />
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
