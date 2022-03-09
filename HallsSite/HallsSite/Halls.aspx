<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Halls.aspx.cs" Inherits="HallsSite.Halls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>Залы</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <br />
    <br />
    <br />
     <div  style="text-align:center">
                <%--<div class="col-lg-4" style="text-align:center">--%>
                <asp:TextBox  ID="txtFilterGrid1Record" runat="server" Height="42px" Width="720px" CssClass="col-xs-offset-0"  placeholder=" Поиск ...." AutoPostBack="true"  ontextchanged="txtFilterGrid1Record_TextChanged"
             ></asp:TextBox>
        
                 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:ImageButton ID="ImageButtonFilter" runat="server" CssClass="auto-style1" Height="48px" ImageUrl="~/icons/filter.png" Width="48px" OnClick="ImageButtonFilter_Click" />

                </div>
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
     <hr />

       <asp:repeater ID="rptrHalls" runat="server">
           <ItemTemplate>
        <div class="col-sm-3 col-md-3"  >
            <a href="HallView.aspx?HID=<%# Eval("HID") %>" style="text-decoration:none;">
          <div class="thumbnail" >              
              <img  src="Image/HallImage/<%# Eval("HID") %>/<%# Eval("ImageName") %><%# Eval("Extention") %>" alt="<%# Eval("ImageName") %>"  width="100%" />
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
    

    </asp:Content>
