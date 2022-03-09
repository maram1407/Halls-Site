<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddCity.aspx.cs" Inherits="HallsSite.AddCity" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">            
    <div class ="container ">
            <div class ="form-horizontal ">
                <br />
                <br />

                <h2>Добавить Город</h2>
                <hr />
                <div class ="form-group">
                    <asp:Label ID="Label1" CssClass ="col-md-2 control-label " runat="server" Text="Название города"></asp:Label>
                    <div class ="col-md-3 ">

                        <asp:TextBox ID="txtType" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtCategoryName" runat="server" CssClass ="text-danger " ErrorMessage="*пожалуйста, введите тип" ControlToValidate="txtType" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                


                <div class ="form-group">
                    <div class ="col-md-2 "> </div>
                    <div class ="col-md-6 ">

                        <asp:Button ID="btnAddtxtType" CssClass ="btn btn-success " runat="server" Text="Добавить город" OnClick="btnAddtxtType_Click"   />
                        
                    </div>
                </div>
                

            </div>

           <h1>Города:</h1>
        <hr />

 <div class="panel panel-default">

               <div class="panel-heading"> Все типы</div>


     <asp:repeater ID="rptrCategory" runat="server">

         <HeaderTemplate>
             <table class="table">
                  <thead>
                    <tr>
                        <th>#</th>
                        <th> Города</th>
                        

                    </tr>

                </thead>

            <tbody>
         </HeaderTemplate>


         <ItemTemplate>
             <tr>
                    <th> <%# Eval("CityID") %> </th>
                    <td><%# Eval("Name") %>   </td>

                   
                </tr>
         </ItemTemplate>


         <FooterTemplate>
             </tbody>

              </table>
         </FooterTemplate>
           </asp:repeater>
     </div>
</asp:Content>
