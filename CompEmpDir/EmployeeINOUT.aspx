<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeINOUT.aspx.cs" Inherits="CompEmpDir.About" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-row">
    <div class="form-group col-md-4">
        <label for="EmployeeID"> Employee Id</label>
        <input type="number" min="1"  runat="server" class="form-control" id="EmployeeID" required placeholder="Employee Id"/>
       
    </div>
    <div class="col-md-4" style="margin-top: 30px; font-size: 17px">
    <div class="form-check form-check-inline" >
        <input runat="server" class="form-check-input" type="radio" name="TIME" id="login" value="IN" checked/>
        <label class="form-check-label" for="login">
            Sign IN
        </label>
    </div>
    <div class="form-check form-check-inline">
        <input runat="server" class="form-check-input" type="radio" name="TIME" id="logout" value="OUT"/>
        <label class="form-check-label" for="logout">
            Sign Out
        </label>
    </div>
   
    </div>
<div class="col-md-4 btn-toolbar " style="margin:15px 0px">
    <asp:Button class="btn btn-success pull-right " id="enter" type="submit" Text="Enter"  runat="server" OnClick="enter_OnClick" />
</div> </div>
    
    <br/>
    <div > 
<span class="text-danger" runat="server" clientidmode="AutoID" id="err"></span></div>
    <br/>
    <div class="form-group col-md-4">
        <label for="EmployeeID"> Check Hours</label>
        <input type="number" min="1"  runat="server" class="form-control" id="empid" required placeholder="Employee Id"/>
       
    </div><div class="col-md-4 btn-toolbar " style="margin:15px 0px">
        <asp:LinkButton class="btn btn-success pull-right " id="calhrs" type="submit" Text="Enter"  runat="server" OnClick="calhrs_OnClick" />
    </div><span class="text-info" runat="server" clientidmode="AutoID" id="hrs"></span> Hrs
</asp:Content>