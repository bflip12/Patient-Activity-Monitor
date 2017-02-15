
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="patients_by_nursing_unit.aspx.cs" Inherits="main" %>
<%-- // I, Bobby Filippopoulos, student number 000338236, certify that this material is my
// original work. No other person's work has been used without due
// acknowledgement and I have not made my work available to anyone else.--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Patients by Nursing Unit - Current Patients only</h3>
    <p>Nursing Unit:<asp:DropDownList 
            ID="DropDownList1" 
            runat="server" 
            style="margin-left: 15px" 
            Width="111px"
            DataSourceID="NursingUnits"
            DataTextField="NursingUnitID"
            DataValueField="NursingUnitID" AutoPostBack="True">
           
        </asp:DropDownList>
        <asp:SqlDataSource
             ID="NursingUnits"
             runat="server"
             ConnectionString ="<%$ ConnectionStrings:CHDBConnectionString %>"
             SelectCommand="SELECT [NursingUnitID] FROM [NursingUnits]">

         </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" EmptyDataText="No patients admitted to this unit at this time." DataKeyNames="PatientID" style="margin-top: 0px" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="PatientID" HeaderText="PatientID" SortExpression="PatientID" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="PhysiciansLastName" HeaderText="PhysiciansLastName" SortExpression="PhysiciansLastName" />
                <asp:BoundField DataField="Room" HeaderText="Room" SortExpression="Room" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Bed" HeaderText="Bed" SortExpression="Bed" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CHDBConnectionString %>" SelectCommand="SELECT DISTINCT [PatientID], [LastName], [FirstName], [Gender], [PhysiciansLastName], [Room], [Bed] FROM [PatientsByNursingUnit] WHERE ([NursingUnitID] = @NursingUnitID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="1EAST" Name="NursingUnitID" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>

    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateEditButton ="True" AutoGenerateRows="False" DataSourceID="individualPatient" Height="50px" Width="125px" DataKeyNames="PatientID" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="PatientID" HeaderText="PatientID" SortExpression="PatientID" ReadOnly="True" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="BirthDate" HeaderText="BirthDate" SortExpression="BirthDate" />
                <asp:BoundField DataField="StreetAddress" HeaderText="StreetAddress" SortExpression="StreetAddress" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="ProvinceID" HeaderText="ProvinceID" SortExpression="ProvinceID" />
                <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" SortExpression="PostalCode" />
                <asp:BoundField DataField="HealthCardNo" HeaderText="HealthCardNo" SortExpression="HealthCardNo" />
                <asp:BoundField DataField="Allergies" HeaderText="Allergies" SortExpression="Allergies" />
                <asp:BoundField DataField="PatientHeight" HeaderText="PatientHeight" SortExpression="PatientHeight" />
                <asp:BoundField DataField="PatientWeight" HeaderText="PatientWeight" SortExpression="PatientWeight" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="individualPatient" runat="server" ConnectionString="<%$ ConnectionStrings:CHDBConnectionString %>" SelectCommand="SELECT * FROM [Patients] WHERE ([PatientID] = @PatientID)" DeleteCommand="DELETE FROM [Patients] WHERE [PatientID] = @PatientID" InsertCommand="INSERT INTO [Patients] ([PatientID], [FirstName], [LastName], [Gender], [BirthDate], [StreetAddress], [City], [ProvinceID], [PostalCode], [HealthCardNo], [Allergies], [PatientHeight], [PatientWeight]) VALUES (@PatientID, @FirstName, @LastName, @Gender, @BirthDate, @StreetAddress, @City, @ProvinceID, @PostalCode, @HealthCardNo, @Allergies, @PatientHeight, @PatientWeight)" UpdateCommand="UPDATE [Patients] SET [FirstName] = @FirstName, [LastName] = @LastName, [Gender] = @Gender, [BirthDate] = @BirthDate, [StreetAddress] = @StreetAddress, [City] = @City, [ProvinceID] = @ProvinceID, [PostalCode] = @PostalCode, [HealthCardNo] = @HealthCardNo, [Allergies] = @Allergies, [PatientHeight] = @PatientHeight, [PatientWeight] = @PatientWeight WHERE [PatientID] = @PatientID">
            <DeleteParameters>
                <asp:Parameter Name="PatientID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PatientID" Type="Int32" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter DbType="Date" Name="BirthDate" />
                <asp:Parameter Name="StreetAddress" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="ProvinceID" Type="String" />
                <asp:Parameter Name="PostalCode" Type="String" />
                <asp:Parameter Name="HealthCardNo" Type="Int64" />
                <asp:Parameter Name="Allergies" Type="String" />
                <asp:Parameter Name="PatientHeight" Type="Decimal" />
                <asp:Parameter Name="PatientWeight" Type="Decimal" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="PatientID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="Gender" Type="String" />
                <asp:Parameter DbType="Date" Name="BirthDate" />
                <asp:Parameter Name="StreetAddress" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="ProvinceID" Type="String" />
                <asp:Parameter Name="PostalCode" Type="String" />
                <asp:Parameter Name="HealthCardNo" Type="Int64" />
                <asp:Parameter Name="Allergies" Type="String" />
                <asp:Parameter Name="PatientHeight" Type="Decimal" />
                <asp:Parameter Name="PatientWeight" Type="Decimal" />
                <asp:Parameter Name="PatientID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>

</asp:Content>

