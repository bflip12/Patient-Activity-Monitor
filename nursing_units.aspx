<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="nursing_units.aspx.cs" Inherits="nursingUnits" %>
<%-- // I, Bobby Filippopoulos, student number 000338236, certify that this material is my
// original work. No other person's work has been used without due
// acknowledgement and I have not made my work available to anyone else.--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Nursing Units<asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="NursingUnitID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:BoundField DataField="NursingUnitID" HeaderText="NursingUnitID" ReadOnly="True" SortExpression="NursingUnitID" />
        <asp:BoundField DataField="Specialty" HeaderText="Specialty" SortExpression="Specialty" />
        <asp:BoundField DataField="Beds" HeaderText="Beds" SortExpression="Beds" />
        <asp:BoundField DataField="Extension" HeaderText="Extension" SortExpression="Extension" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CHDBConnectionString %>" SelectCommand="SELECT [NursingUnitID], [Specialty], [Beds], [Extension] FROM [NursingUnits]"></asp:SqlDataSource>
</h2>
</asp:Content>

