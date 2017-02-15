
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="physicians.aspx.cs" Inherits="physician" %>
<%-- // I, Bobby Filippopoulos, student number 000338236, certify that this material is my
// original work. No other person's work has been used without due
// acknowledgement and I have not made my work available to anyone else.--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Physicians<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName">
        <ItemStyle Font-Bold="False" Font-Size="Medium" />
        </asp:BoundField>
        <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName">
        <ItemStyle Font-Size="Medium" />
        </asp:BoundField>
        <asp:BoundField DataField="Specialty" HeaderText="Specialty" SortExpression="Specialty">
        <ItemStyle Font-Size="Medium" />
        </asp:BoundField>
        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone">
        <ItemStyle Font-Size="Medium" />
        </asp:BoundField>
    </Columns>
    <EditRowStyle BackColor="#2461BF" />
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" Font-Size="Large" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" Font-Bold="False" Font-Size="Large" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F5F7FB" />
    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
    <SortedDescendingCellStyle BackColor="#E9EBEF" />
    <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CHDBConnectionString %>" SelectCommand="SELECT [LastName], [FirstName], [Specialty], [Phone] FROM [Physicians]"></asp:SqlDataSource>
</h3>

</asp:Content>

