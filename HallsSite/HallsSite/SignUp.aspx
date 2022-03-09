<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="HallsSite.SignUp" %>

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
             width: 26%;
             height: 483px;
         }
         .auto-style2 {
             height: 98px;
         }
         .auto-style3 {
             height: 64px;
         }
         .auto-style4 {
             height: 72px;
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
                               
                               <li  class ="active" style="color: #E2B823; font-family: Arial" id="btnSignUP" runat="server"><a style="color: #E2B823; font-family: Arial" href="SignUp.aspx">Регистрация</a> </li>
                               <li style="color: #E2B823; font-family: Arial" id="btnSignIN" runat="server"><a style="color: #E2B823; font-family: Arial" href="SignIn.aspx">Вход</a> </li>
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
            <td colspan="2" align ="center" class="auto-style2"><h2>Регистрация</h2>
            </td>

        </tr>
        <tr>
            <td align ="center">
                <asp:Label ID="Label1" runat="server" Text="Логин:"></asp:Label>
            </td>
            <td align ="left">
                <asp:TextBox ID="txtUname" runat="server" Width="180px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align ="center">
                <asp:Label ID="Label2" runat="server" Text="Пароль:"></asp:Label>
            </td>
            <td align ="left">
                <asp:TextBox ID="txtPass" TextMode="Password" runat="server" Width="180px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align ="center">
                <asp:Label ID="Label3" runat="server"  Text="Подтверждение пароля:" ></asp:Label>
            </td>
            <td align ="left">
                <asp:TextBox ID="txtCPass" TextMode="Password" runat="server" Width="180px" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align ="center">
                <asp:Label ID="Label4" runat="server" Text="Имя:"></asp:Label>
            </td>
            <td align ="left">
                <asp:TextBox ID="txtName" runat="server" Width="180px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align ="center" class="auto-style3">
                <asp:Label ID="Label5" runat="server" Text="Email:"></asp:Label>
            </td>
            <td align ="left" class="auto-style3">
                <asp:TextBox ID="txtEmail" runat="server" Width="180px"></asp:TextBox>
            </td>
        </tr>
           
        <tr>
            <td colspan="2" align ="center" class="auto-style4">
                <asp:Button ID="txtsignup" Class="btn btn-success"  runat="server" Text="Зарегистрироваться" Width="184px " BackColor="Black" OnClick="txtsignup_Click" />
            </td>
        </tr>

         <tr>
            <td colspan="2" align ="center" class="auto-style4"><asp:Label ID="lblMsg" runat="server" ></asp:Label>
            </td>

        </tr>
    </table>
         </form>
</body>
</html>
