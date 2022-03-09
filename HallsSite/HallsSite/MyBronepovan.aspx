<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="MyBronepovan.aspx.cs" Inherits="HallsSite.MyBronepovan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
                <br />
                <br />
                  
                    <div style="padding-top: 50px">
                        <div class="col-md-9">
                            <h4 class="proNameViewCart" runat="server" id="h4NoItems"></h4>
                            
                            <asp:Repeater ID="RptrCartProducts" OnItemCommand="RptrCartProducts_ItemCommand" runat="server">
                                <ItemTemplate>
                                    <%--Show cart details start--%>
                                    <div class="media" style="border: 1px solid black;">
                                        <div class="media-left">
                                            <a href="HallView.aspx?HID=<%# Eval("HallID") %>" target="_blank">
                                                <img  width="100px" src="Image/HallImage/<%# Eval("HallID") %>/<%# Eval("Name") %><%# Eval("Extention") %>" alt="<%# Eval("Name") %>"  />
                                            </a>
                                        </div>
                                        <div class="media-body">
                                            <%--<h4 class="media-heading proNameViewCart"><%# Eval("Halls") %></h4>--%>
                                              <span class="proPrice" >Дата Бронирование  <%# Eval ("DateBook") %> </span><br />
                  
                                            <%--<span class="proPrice">Цена.&nbsp <%# Eval("HPrice") %></span> <br />--%>
                                         
                                           
                                            <p>
                                              
                                                
                                                <%--<span class="proNameViewCart pull-right">Итог: &nbsp <%# Eval("SubPAmount") %> Руб</span>--%>
                                            </p>
                                        </span>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <%--Show cart details Ending--%>
                        </div>

                      
                        </div>
                    </div>
</asp:Content>
