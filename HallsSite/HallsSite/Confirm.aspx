<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Confirm.aspx.cs" Inherits="HallsSite.Confirm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
     <br />
     <br />
     <br />
     <br />
   
    <h2 style="text-align:center"> Вы действительно хотите забронироват на эту дату</h2>
    <div style="text-align:center" class="form-group">
                  <asp:Button ID="btnConfirm" CssClass="btn btn-primary" runat="server" Text="Да" OnClick="btnConfirm_Click" />
        </div>
</asp:Content>
