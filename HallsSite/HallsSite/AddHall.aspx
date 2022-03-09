<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddHall.aspx.cs" Inherits="HallsSite.AddHall" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class ="container">
       <div class ="form-horizontal">
           
           <br />
           <br />
           <h2>Добавить зал</h2>
           <hr />

           <div class ="form-group">
               <asp:Label ID="Label1" runat="server" CssClass ="col-md-2 control-label" Text="Название зала "></asp:Label>
               <div class ="col-md-3">
                   <asp:TextBox ID="txtProductName" CssClass ="form-control" runat="server"></asp:TextBox>


               </div>
           </div>

           <div class ="form-group">
               <asp:Label ID="Label2" runat="server" CssClass ="col-md-2 control-label" Text="Цена"></asp:Label>
               <div class ="col-md-3">
                   <asp:TextBox ID="txtPrice" CssClass ="form-control" runat="server"></asp:TextBox>
               </div>
           </div>


          


           <div class ="form-group">
               <asp:Label ID="Label4" runat="server" CssClass ="col-md-2 control-label" Text="Город"></asp:Label>
               <div class ="col-md-3">
                   <asp:DropDownList ID="ddlType" CssClass ="form-control" runat="server"></asp:DropDownList>
               </div>
           </div>            

           <div class ="form-group">
               <asp:Label ID="Label20" runat="server" CssClass ="col-md-2 control-label" Text="Количество люди"></asp:Label>
               <div class ="col-md-3">
                   <asp:TextBox ID="txtQuantity" CssClass ="form-control" runat="server"></asp:TextBox>
               </div>
           </div>

           <div class ="form-group">
               <asp:Label ID="Label3" runat="server" CssClass ="col-md-2 control-label" Text="Место"></asp:Label>
               <div class ="col-md-3">
                   <asp:TextBox ID="txtPlace" CssClass ="form-control" runat="server"></asp:TextBox>
               </div>
           </div>

            <div class ="form-group">
               <asp:Label ID="Label5" runat="server" CssClass ="col-md-2 control-label" Text="Номер телефон"></asp:Label>
               <div class ="col-md-3">
                   <asp:TextBox ID="txtPhone" CssClass ="form-control" runat="server"></asp:TextBox>
               </div>
           </div>

            <div class ="form-group">
               <asp:Label ID="Label11" runat="server" CssClass ="col-md-2 control-label" Text="Upload Image"></asp:Label>
               <div class ="col-md-3">
                   <asp:FileUpload ID="fuImg01" CssClass ="form-control" runat="server" />
               </div>
           </div>

           <div class ="form-group">
               <asp:Label ID="Label12" runat="server" CssClass ="col-md-2 control-label" Text="Upload Image"></asp:Label>
               <div class ="col-md-3">
                   <asp:FileUpload ID="fuImg02" CssClass ="form-control" runat="server" />
               </div>
           </div>

           <div class ="form-group">
               <asp:Label ID="Label13" runat="server" CssClass ="col-md-2 control-label" Text="Upload Image"></asp:Label>
               <div class ="col-md-3">
                   <asp:FileUpload ID="fuImg03" CssClass ="form-control" runat="server" />
               </div>
           </div>
  
           <div class ="form-group">
                    <div class ="col-md-2 "> </div>
                    <div class ="col-md-6 ">

                        <asp:Button ID="btnAdd" CssClass ="btn btn-success " runat="server" Text="Добавить зал" OnClick="btnAdd_Click"  />
                        
                    </div>
                </div>

       </div>

    </div>

    <div class="container">
   
   <hr style="margin-left: 0px" />
    <div class="panel ">
      <div class="panel-heading"><h2>Отчет о зале</h2> </div>
      <div class="panel-body">
           <div class="col-md-12">
              <div class="form-group">
                <div class="table table-responsive">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="false">
                    <Columns>  
                        <asp:BoundField DataField="HID" HeaderText="S.No." />  
                        <asp:BoundField DataField="HName" HeaderText="Название зала" />  
                        <asp:BoundField DataField="HPrice" HeaderText="Цена" />  
                       
                      <asp:BoundField DataField="City" HeaderText="Город" />  
                        <asp:BoundField DataField="Number" HeaderText="Количество людей" />  
                       

                       
                        <asp:BoundField DataField="Place" HeaderText="Место" />  
                        <asp:BoundField DataField="NumberPhone" HeaderText="Номер телефон" />
                        
                     
                        
                         </Columns> 
                    </asp:GridView>
                </div>
              
              </div>
           
           </div>
      
      
      </div>
      <div class="panel-footer">Panel Footer</div>
    </div>
    
</div>
</asp:Content>
