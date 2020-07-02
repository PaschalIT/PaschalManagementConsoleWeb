<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication1.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <h3>Paschal Air, Plumbing & Electric<br />IT Department</h3>
    <address>
        280 N Maestri Rd<br />
        Springdale, AR 72762<br />
        <abbr title="Phone">P:</abbr>
        479-751-0195
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:support@gopaschal.com">Support@gopaschal.com</a><br />
        <strong>Issues:</strong> <a href="https://github.com/PaschalIT/PaschalManagementConsoleWeb/issues" target="_blank">Submit a Ticket</a>
    </address>
</asp:Content>
