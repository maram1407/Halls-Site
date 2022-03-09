<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="HallsSite.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Мазая Сайт</title>
    <script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
        crossorigin="anonymous">   </script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
   
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
     <link href="css/Bag.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
     <style type="text/css">
         .auto-style1 {
             margin-right: 0px;
         }
     </style>
    
</head>
<body>
    <form id="form1" runat="server">
        <div >
            <div class="navbar navbar-default navbar-fixed-top" role="navigation" style="background-color: #000000">
             <div class="container " style="background-color: #000000">
                <div class="navbar-header" style="background-color: #000000">
                    <button type="button" class="navbar-toggle " data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span><span
                            class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="Index.aspx" style="color: #E2B823; font-family: Arial; font-size: small;"><span>
                        </span> Мазая Сайт
                    
                    </a>
                  </div>
                        <div class="navbar-collapse collapse" style="background-color: #000000; ">
                            <ul class="nav navbar-nav navbar-right" style="color: #E2B823; font-family: Arial" >
                        
                                <li style="color: #E2B823; font-family: Arial"><a style="color: #E2B823; font-family: Arial" href="Index.aspx">Главная</a> </li>
                                <li style="color: #E2B823; font-family: Arial"><a style="color: #E2B823; font-family: Arial" href="About.aspx">Городы</a> </li>
                       
                                <li style="color: #E2B823; font-family: Arial" ><a style="color: #E2B823; font-family: Arial" href="Halls.aspx" >Все залы</a></li >
                                <li style="color: #E2B823; font-family: Arial" ><a style="color: #E2B823; font-family: Arial" href="MyData.aspx" >Личный Кабинет</a></li >
                               
                               <li style="color: #E2B823; font-family: Arial" id="btnSignUP" runat="server"><a style="color: #E2B823; font-family: Arial" href="SignUp.aspx">Регистрация</a> </li>
                               <li style="color: #E2B823; font-family: Arial" id="btnSignIN" runat="server"><a style="color: #E2B823; font-family: Arial" href="SignIn.aspx">Вход</a> </li>
                               <li>
                            <asp:Button ID="btnlogout" CssClass="btn btn-defult navbar-btn " runat="server"
                                  Text="Sign Out" OnClick="btnlogout_Click" />
                              </li>
                                 <li>
                        <asp:Button ID="Button1" CssClass ="btn btn-link navbar-btn " runat="server" Text=""  />
                        </li>
                          </ul>
                 </div>
            </div>
        </div>
             <br />
             <br />
             <br />
           
            <div  style="text-align:center">
                <%--<div class="col-lg-4" style="text-align:center">--%>
                <asp:TextBox  ID="txtFilterGrid1Record" runat="server" Height="42px" Width="720px" CssClass="col-xs-offset-0"  placeholder=" Поиск ...." AutoPostBack="true" ontextchanged="txtFilterGrid1Record_TextChanged"
             ></asp:TextBox>
        
                 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButtonFilter" runat="server" CssClass="auto-style1" Height="48px" ImageUrl="~/icons/filter.png" Width="48px" OnClick="ImageButtonFilter_Click" />

                </div>
      
             <br />
       <%-- <div class="container"  style="text-align:center">
                         
                    <div class="item">
                        <img src="ImgSlider/Sana1.png"  style="width: 85%; text-align:center ">
                        
                    </div>
                    
              
        </div>--%>
      <br />
            <asp:Panel ID="PanelFilters" runat="server" Visible="false" Width="50%">
                <label>Город: </label>
                 <asp:DropDownList ID="ddlType" AutoPostBack = "true" CssClass ="form-control" runat="server" OnSelectedIndexChanged="ddlType_SelectedIndexChanged"> 
                </asp:DropDownList>

                <label>Цена: с </label>
                 <asp:TextBox ID="PriceStart" runat="server" TextMode="Number"></asp:TextBox>

                <label> по </label>
                  <asp:TextBox ID="PriceEnd" runat="server" TextMode="Number"></asp:TextBox><br/>
                 
                <label>Количество людей: </label>
                  <asp:TextBox ID="CountPeople" runat="server" TextMode="Number"></asp:TextBox><br/><br/>
                <asp:Button ID="ButtonFind" runat="server" Text="Найти" OnClick="ButtonFind_Click" />
            </asp:Panel>
             <br />
             <br />
          
             <asp:repeater ID="rptrHalls" runat="server">
           <ItemTemplate>
        <div class="col-sm-3 col-md-3"  >
            <a href="HallView.aspx?HID=<%# Eval("HID") %>" style="text-decoration:none;">
          <div class="thumbnail" >              
              <img  src="Image/HallImage/<%# Eval("HID") %>/<%# Eval("ImageName") %><%# Eval("Extention") %>" alt="<%# Eval("ImageName") %>"  width="100%" />
              <div class="caption"> 
                  
                   <div class="proNameView"> <%# Eval ("HName") %> </div>
                  <hr />
                    <div class="proPrice">  <%# Eval ("HPrice") %> Руб</div> 
                   
              </div>
          </div>
                </a>
        </div>
               
               </ItemTemplate>
       </asp:repeater>
        <br />
         <br />
         <br />
         <br />
         <br />
        
         <br />
         <br />
        <hr />
    <footer>
            <div class ="container" >
               
               <p class ="pull-right "><a href ="#">&nbsp; &nbsp; Back to top &nbsp; &nbsp;</a></p>
                
                <p>&copy;2022 Марам Аль-Саиди </p>
            </div>
               
                
           

        </footer>
    <!---Footer COntents End---->
    </form>
</body>
</html>


