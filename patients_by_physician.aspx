
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="patients_by_physician.aspx.cs" Inherits="patientsByPhysicians" %>
<%-- // I, Bobby Filippopoulos, student number 000338236, certify that this material is my
// original work. No other person's work has been used without due
// acknowledgement and I have not made my work available to anyone else.--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Patients by Physician</h3>
    <p>Physician:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dropdownPhysician" DataTextField="PhysFull" DataValueField="PhysicianID" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="dropdownPhysician" runat="server" ConnectionString="<%$ ConnectionStrings:CHDBConnectionString %>" SelectCommand="SELECT PhysicianID, LastName + ', ' + FirstName AS PhysFull FROM Physicians ORDER BY PhysFull"></asp:SqlDataSource>
</p>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="hgridPhysician" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="PatientID" HeaderText="PatientID" SortExpression="PatientID" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
            <asp:BoundField DataField="AdmissionDate" HeaderText="AdmissionDate" SortExpression="AdmissionDate" />
            <asp:BoundField DataField="PrimaryDiagnosis" HeaderText="PrimaryDiagnosis" SortExpression="PrimaryDiagnosis" />
            <asp:BoundField DataField="AttendingPhysicianID" HeaderText="AttendingPhysicianID" SortExpression="AttendingPhysicianID" Visible ="false"/>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="hgridPhysician" runat="server" ConnectionString="<%$ ConnectionStrings:CHDBConnectionString %>" SelectCommand="SELECT * FROM [PatientsByPhysician] WHERE ([AttendingPhysicianID] = @AttendingPhysicianID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="AttendingPhysicianID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

