<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Ebb.aspx.cs" Inherits="HallsSite.Ebb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br />
             <br />
    <br />
    <br />

            <div class="container">
  

    <div >
      <div class="panel-heading"></div>
      <div class="panel-body">
           <asp:repeater ID="rptrProducts" runat="server">
           <ItemTemplate>
        <div class="col-sm-3 col-md-3" >
            <a href="HallView.aspx?HID=<%# Eval("HID") %>" style="text-decoration:none;">
          <div class="thumbnail" >              
              <img src="Image/HallImage/<%# Eval("HID") %>/<%# Eval("ImageName") %><%# Eval("Extention") %>" alt="<%# Eval("ImageName") %>"/>
              <div class="caption"> 
                  
                   <div class="proNameView"> <%# Eval ("HName") %> </div>
                  <hr />
                   <div class="proPrice">  <%# Eval ("HPrice") %> Р</div> 
                   
              </div>
          </div>
                </a>
        </div>
               
               </ItemTemplate>
       </asp:repeater>
          </div>
        </div>
        </div>
</asp:Content>
