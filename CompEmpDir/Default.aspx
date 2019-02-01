<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CompEmpDir._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="FirstName">First Name</label>
                <input type="text"  runat="server" class="form-control" id="FirstName" required placeholder="First Name"/>
            </div>
            <div class="form-group col-md-6">
                <label for="LastName">Last Name</label>
                <input type="text" runat="server" class="form-control" id="LastName" required placeholder="Last Name"/>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="birthDay">Address</label>
                <input type="date" runat="server" class="form-control"  min='1960-01-01' max='2000-12-12' id="birthDay" required placeholder=""/>
            </div>
            <div class="form-group col-md-6">
                <label for="empId">Employee Id</label>
                <input type="number" min="1" class="form-control" runat="server" id="empid" required placeholder="Employee ID"   />
            </div>
        </div>
    <div class="col-sm-9 btn-toolbar " style="margin: 20px">
        <asp:Button class="btn btn-success pull-right " id="Submit" type="submit" Text="Add Employee"  runat="server" OnClick="Submit_Click"   />
    </div>   <span id="errorSum" class="text-danger panel-danger" runat="server">*</span><br/>
  <asp:SqlDataSource ID="SqlDataEmployee" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:EmployeeDatabase %>" DeleteCommand="DELETE FROM [EmployeeMaster] WHERE [EmployeeID] = @original_EmployeeID AND [EmployeeLastName] = @original_EmployeeLastName AND [EmployeeFirstName] = @original_EmployeeFirstName AND (([EmployeeBDay] = @original_EmployeeBDay) OR ([EmployeeBDay] IS NULL AND @original_EmployeeBDay IS NULL))" InsertCommand="INSERT INTO [EmployeeMaster] ([EmployeeLastName], [EmployeeFirstName], [EmployeeBDay]) VALUES (@EmployeeLastName, @EmployeeFirstName, @EmployeeBDay)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [EmployeeMaster]" UpdateCommand="UPDATE [EmployeeMaster] SET [EmployeeLastName] = @EmployeeLastName, [EmployeeFirstName] = @EmployeeFirstName, [EmployeeBDay] = @EmployeeBDay WHERE [EmployeeID] = @original_EmployeeID AND [EmployeeLastName] = @original_EmployeeLastName AND [EmployeeFirstName] = @original_EmployeeFirstName AND (([EmployeeBDay] = @original_EmployeeBDay) OR ([EmployeeBDay] IS NULL AND @original_EmployeeBDay IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_EmployeeID" Type="Int32" />
            <asp:Parameter Name="original_EmployeeLastName" Type="String" />
            <asp:Parameter Name="original_EmployeeFirstName" Type="String" />
            <asp:Parameter Name="original_EmployeeBDay" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="EmployeeLastName" Type="String" />
            <asp:Parameter Name="EmployeeFirstName" Type="String" />
            <asp:Parameter Name="EmployeeBDay" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="EmployeeLastName" Type="String" />
            <asp:Parameter Name="EmployeeFirstName" Type="String" />
            <asp:Parameter Name="EmployeeBDay" Type="String" />
            <asp:Parameter Name="original_EmployeeID" Type="Int32" />
            <asp:Parameter Name="original_EmployeeLastName" Type="String" />
            <asp:Parameter Name="original_EmployeeFirstName" Type="String" />
            <asp:Parameter Name="original_EmployeeBDay" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="EmployeeID" DataSourceID="SqlDataEmployee" CellPadding="4" ForeColor="#333333" GridLines="None" BorderStyle="Solid" CssClass="table-responsive-lg" CellSpacing="2" Font-Names="Times New Roman" Font-Size="20px" Width="1165px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField  DataField="EmployeeID" HeaderText="EmployeeID" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
            <asp:BoundField DataField="EmployeeLastName" HeaderText="EmployeeLastName" SortExpression="EmployeeLastName" />
            <asp:BoundField DataField="EmployeeFirstName" HeaderText="EmployeeFirstName" SortExpression="EmployeeFirstName" />
            <asp:BoundField DataField="EmployeeBDay" HeaderText="EmployeeBDay" SortExpression="EmployeeBDay" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
&nbsp;&nbsp;&nbsp; 
</asp:Content>
