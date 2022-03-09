<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="HallView.aspx.cs" Inherits="HallsSite.HallView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>
<br />
    <br />

    <br /><br /><br />
    <div class="col-md-5">
            <div style="max-width:480px" class="thumbnail">
             <%--   for proImage slider--%>
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
     

  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">

      <asp:repeater ID="rptrImage" runat="server">
          <ItemTemplate>
    <div class="item <%# GetActiveImg (Container.ItemIndex)%> " >
      <img src="Image/HallImage/<%# Eval("HID") %>/<%# Eval("Name") %><%# Eval("Extention") %>" alt="<%# Eval("Name") %>" onerror="this.src='Image/ImageNotAvailable.jpg'" width="100%">
      
    </div>
             </ItemTemplate>
    </asp:repeater>s


  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Предыдущий</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Следующий</span>
  </a>
</div>

              <%--  for proimage slider ending--%>
            </div>
        </div>
        <div class="col-md-5">
            <asp:Repeater ID="rptrHallDetails" runat="server" >
                <ItemTemplate>
            <div class="divDet1">
                 <h1 class="proNameView" style="font-weight: bold; color: #000000; font-size: large"><%# Eval("HName") %> </h1>
                <span class="proPrice">Цена: <%#Eval("HPrice") %> Р </span> 
                <br />
            </div>
            <div class="divDet1">
                <h5 class="h5size">Место</h5>
                <p>   <%#Eval("Place") %>          </p>   
            </div>

                    <div class="divDet1">
                <h5 class="h5size">Количество люди</h5>
                <p>   <%#Eval("Number") %>          </p>   
            </div>
                    <div class="divDet1">
                <h5 class="h5size">Номер телефон</h5>
                <p>   <%#Eval("NumberPhone") %>          </p>

                
            </div>
                     <div class="divDet1">
                <h4 class="h5size" style="background-color: #000000; color: #E2B823"> Если вы хотите забронировать пожалуйсто выберите дату бронирования</h4>
               

                
            </div>
            
           
           
           
                   
                    <asp:HiddenField ID="hfTypeID" runat="server" Value='<%# Eval("HCityID") %>' />
                   


</ItemTemplate>
</asp:Repeater>

            <div >

        <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="400px" OnLoad="Calendar1_Load">
            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
            <DayStyle Width="14%" />
            <NextPrevStyle Font-Size="8pt" ForeColor="White" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
            <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
            <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
            <TodayDayStyle BackColor="#CCCC99" />
                </asp:Calendar>
                <label>Цветом показаны уже занятые дни.</label>
        <br />

                <!--confirm('Вы точно хотите забронировать данный зал?');-->
        <asp:TextBox ID="TextDate" runat="server" Height="36px" Width="187px"></asp:TextBox>
&nbsp;<asp:Button ID="btnAddtoCart" CssClass="mainButton" runat="server" text="БРОНИРОВАНИЕ" OnClick="btnAddtoCart_Click" Height="36px" Width="187px" 
        OnClientClick="return confirm('Вы точно хотите забронировать данный зал?');"  />
            </div>
            <div>
            </div>
        
             <div>
                                <asp:GridView ID="gvHalls" runat="server" CssClass="col-md-12"  AutoGenerateColumns="false" Visible="false" CellPadding="6"
                                    ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
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
                                    <Columns>
                                        <asp:BoundField DataField="HID" HeaderText="Продукт ID" />
                                        <asp:BoundField DataField="HName" HeaderText="название продукта" />
                                        
                                    </Columns>
                                </asp:GridView>                                
                            </div>
        </div>
   

    
</asp:Content>
