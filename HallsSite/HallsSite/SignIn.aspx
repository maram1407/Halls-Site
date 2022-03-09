<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="HallsSite.SignIn" %>

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
             width: 24%;
             height: 442px;
         }
         .auto-style2 {
             height: 98px;
         }
         .auto-style3 {
             height: 86px;
         }
         .auto-style4 {
             width: 141px;
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
                                <li style="color: #E2B823; font-family: Arial"><a style="color: #E2B823; font-family: Arial" href="About.aspx">Города</a> </li>
                       
                                <li style="color: #E2B823; font-family: Arial" ><a style="color: #E2B823; font-family: Arial" href="Products.aspx" >Все залы</a></li >
                                <li style="color: #E2B823; font-family: Arial" ><a style="color: #E2B823; font-family: Arial" href="MyData.aspx" >Личный Кабинет</a></li >
                               
                               <li  style="color: #E2B823; font-family: Arial" id="btnSignUP" runat="server"><a style="color: #E2B823; font-family: Arial" href="SignUp.aspx">Регистрация</a> </li>
                               <li  class ="active" style="color: #E2B823; font-family: Arial" id="btnSignIN" runat="server"><a style="color: #E2B823; font-family: Arial" href="SignIn.aspx">Вход</a> </li>
                              <%-- <li>
                            <asp:Button ID="btnlogout" CssClass="btn btn-defult navbar-btn " runat="server"
                                  Text="Sign Out" OnClick="btnlogout_Click" />
                              </li>--%>
                                 <li>
                        <asp:Button ID="Button1" CssClass ="btn btn-link navbar-btn " runat="server" Text=""  />
                        </li>
                          </ul>
                 </div>
            </div>
        </div>
             <br />

        </div>
         <br />
         <br />
         <br />
   <table  align ="center" class="auto-style1" style="background:#E2B823;" >
        <tr>
            <td colspan="2" align ="center" class="auto-style2"><h2>Авторизация</h2>
            </td>

        </tr>
        <tr>
            <td align ="center" class="auto-style4">
                <asp:Label ID="Label1" runat="server" Text="Логин:"></asp:Label>
            </td>
            <td align ="left">
                <asp:TextBox ID="txtUsername" runat="server" Width="180px"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserName" runat="server" CssClass ="text-danger " ErrorMessage="*пожалуйста, введите имя пользователя" ControlToValidate="txtUsername" ForeColor="Red"></asp:RequiredFieldValidator>
                    
            </td>
        </tr>
        <tr>
            <td align ="center" class="auto-style4">
                <asp:Label ID="Label2" runat="server" Text="Пароль:"></asp:Label>
            </td>
            <td align ="left">
                <asp:TextBox ID="txtPass" runat="server" Width="180px" TextMode="Password"></asp:TextBox>
                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" CssClass ="text-danger " runat="server" ErrorMessage="*поле пароля обязательно" ControlToValidate="txtPass" ForeColor="Red"></asp:RequiredFieldValidator>
                    --%>
            </td>
        </tr>
       <tr>
            <td colspan="2" align ="center" class="auto-style3">
                <asp:Button ID="btnLogin" Class="btn btn-success"  runat="server" Text="Вход" Width="184px " BackColor="Black" OnClick="btnLogin_Click" />
            </td>
        </tr>
       <tr>
            <td colspan="2" align ="center" class="auto-style3"><asp:Label ID="lblError" CssClass ="text-danger " runat="server" ></asp:Label>
            </td>
           </tr>
       </table>
    
        
    </form>
</body>
</html>
