<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="HallsSite.UserHome" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>
    <script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
        crossorigin="anonymous">   </script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
   
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
     <link href="css/Bag.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
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
                                <li style="color: #E2B823; font-family: Arial"><a style="color: #E2B823; font-family: Arial" href="Citys.aspx">Города</a> </li>
                       
                                <li style="color: #E2B823; font-family: Arial" ><a style="color: #E2B823; font-family: Arial" href="Halls.aspx" > Все зал</a></li >
                                <li style="color: #E2B823; font-family: Arial" ><a style="color: #E2B823; font-family: Arial" href="MyData.aspx" >Личный кабинет</a></li >
                               
                               <li > <asp:Button ID="btnlogout" CssClass ="btn btn-default navbar-btn " runat="server" Text="Выход" OnClick="btnlogout_Click" /> </li>
                                 <li>
                        <asp:Button ID="Button1" CssClass ="btn btn-link navbar-btn " runat="server" Text=""  />
                        </li>   
                                </ul>
                          
                              <%-- <li>
                            <asp:Button ID="btnlogout" CssClass="btn btn-defult navbar-btn " runat="server"
                                  Text="Sign Out" OnClick="btnlogout_Click" />
                              </li>--%>
                                
                 </div>
            </div>
        </div>
            
           
        </div>
          <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:Label  ID="lblSuccess" runat="server"   style="font-size:40px ;color: #000000; text-align: center
   "></asp:Label>
         <hr />     
    </form>
</body>
</html>
