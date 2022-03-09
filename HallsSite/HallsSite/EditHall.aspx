<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="EditHall.aspx.cs" Inherits="HallsSite.EditHall" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
  <h2></h2>  
  <br /><br />
    <div class="container">
      <h2>Редактирование зала</h2>
        <hr />
      <div class="panel-body">
          <div class="row">
               <div class="col-sm-6">
                  <div class="form-group">
                       <label> Введите ID:</label>
                       <asp:TextBox ID="txtID" CssClass="form-control" runat="server" AutoPostBack="true"  ontextchanged="txtID_TextChanged"></asp:TextBox>
                  </div>

                  <div class="form-group">
                       <label> Введите Название зала </label>
                       <asp:TextBox ID="txtSize" CssClass="form-control" runat="server"></asp:TextBox>
                  </div>
                     <div class ="form-group">
                         <label> Введите Цену</label>
               
              
                   <asp:TextBox ID="txtPrice" CssClass ="form-control" runat="server"></asp:TextBox>
               </div>
       

                  <div class="form-group">
                       <label> Выберите Город</label>
                       <asp:DropDownList ID="ddlType" CssClass ="form-control" runat="server" AutoPostBack="true"  ></asp:DropDownList>
                 
          
                    <div class ="form-group">
                        <label> Выберите Количество</label>
               
                   <asp:TextBox ID="txtQuantity" CssClass ="form-control" runat="server"></asp:TextBox>
               </div>
                      <div class ="form-group">
                         <label> Введите Место</label>
               
              
                   <asp:TextBox ID="txtPlace" CssClass ="form-control" runat="server"></asp:TextBox>
               </div>
                      <div class ="form-group">
                         <label> Введите Номер Телефон</label>
               
              
                   <asp:TextBox ID="txtphone" CssClass ="form-control" runat="server"></asp:TextBox>
               </div>
        
        

                  <div class="form-group">
                  <asp:Button ID="btnUpdateSubCategory" CssClass="btn btn-primary" runat="server" Text="ОБНОВИТЬ" onclick="btnUpdateSubCategory_Click" />
                  </div>

               
               </div>

               <div class="container">

                <div class="row">
                <div class="col-md-12">
                <h4 class="alert-info text-center"> Все Залы</h4>
                <br />
                 <asp:TextBox ID="txtFilterGrid1Record" style="border:2px solid blue" CssClass="form-control" runat="server" placeholder="Поиск...." onkeyup="Search_Gridview(this)"></asp:TextBox>
                <hr />
                  
              <div class="form-group">
                    <div class="table table-responsive">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="false">
                    <Columns>  
                        <asp:BoundField DataField="HID" HeaderText="S.No." />  
                        <asp:BoundField DataField="HName" HeaderText="Название зала" />  
                        <asp:BoundField DataField="HPrice" HeaderText="Цена" />  
                       
                      <asp:BoundField DataField="City" HeaderText="Город" />  
                       
                       <asp:BoundField DataField="Number" HeaderText="Количество" />
                        <asp:BoundField DataField="Place" HeaderText="Место" />  
                        <asp:BoundField DataField="NumberPhone" HeaderText="Номер телефон" />
                        </Columns>

                        </asp:GridView>
                </div>
             </div>
               
               </div>
          </div>
          </div>
                  
</div>
      </div>
      <div class="panel-footer">Panel Footer</div>
    </div>
    
</div>

    </div>


<script type="text/javascript">
    function Search_Gridview(strKey) {
        var strData = strKey.value.toLowerCase().split(" ");
        var tblData = document.getElementById("<%=GridView1.ClientID %>");
        var rowData;
        for (var i = 1; i < tblData.rows.length; i++) {
            rowData = tblData.rows[i].innerHTML;
            var styleDisplay = 'none';
            for (var j = 0; j < strData.length; j++) {
                if (rowData.toLowerCase().indexOf(strData[j]) >= 0)
                    styleDisplay = '';
                else {
                    styleDisplay = 'none';
                    break;
                }
            }
            tblData.rows[i].style.display = styleDisplay;
        }
    }  
</script>

</asp:Content>
