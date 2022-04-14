<%-- 
    Document   : cart
    Created on : Feb 12, 2022, 7:02:21 AM
    Author     : RIFKI
--%>


<%@page import="dao.CoffeDao"%>
<%@page import="java.util.*"%>
<%@page import="model.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    User auth = (User) request.getSession().getAttribute("authUser"); 
    if(auth != null){
        request.setAttribute("authUser", auth);
    }else{
        response.sendRedirect("login.jsp");
    }
    
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
    if(cart_list != null){
        CoffeDao cdao = new CoffeDao();
        cartProduct = cdao.getCartProducts(cart_list);
        double total = cdao.getTotalCartPrice(cart_list);
        request.setAttribute("cart_list", cart_list);
        request.setAttribute("total", total);
    }
%>
<!DOCTYPE html>
<html lang="en" class="scroll-auto">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cart - BaiCoffee</title>

    <link rel="stylesheet" href="css/style.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;900&family=Raleway:wght@400;700;800&family=Montserrat:wght@400;700&family=Poppins:wght@400;500;700;800&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
    />
    
  </head>
  <body class="w-full overflow-x-hidden bg-white bg-center">
    <%@include file="includes/navbar.jsp" %>

    <!--Keranjang Start-->
    <div class="h-screen bg-white px-32">
      <!--Heading Start-->
      <div class="font-poppin my-10 flex justify-between">
        <a class="text-solid-purple text-2xl font-normal tracking-wide">cart</a>
        <a class="text-solid-purple text-2xl font-normal tracking-wide">
		<i class="fas fa-bars"></i>
        </a>
      </div>
      <!--Heading End-->
      <div class="grid">
        <!-- item 1 start-->
        <% 
            if(cart_list != null){
                for(Cart c:cartProduct){ %>
                    <div class="font-poppin grid grid-cols-5">
                        <div class="border-medium-purple col-span-1 flex h-24 max-h-24 w-24 items-center rounded-lg border-2 bg-white">
                          <img
                            src="images/<%= c.getImage() %>"
                            alt="katalog"
                            class="h-auto w-auto p-2"
                          />
                        </div>
                        <div class="text-rebecca-purple col-span-1 ml-2 font-medium">
                          <p><%= c.getCoffname() %></p>
                        </div>
                        <div class="col-span-1 ml-3 justify-self-center">
                          <p class="text-xl">Rp<%= c.getCoffprice() %></p>
                        </div>
                        <div class="col-span-1 ml-3">
                            <form action="" method="post">
                                <input type="hidden" name="id" value="<%= c.getIdcoffe() %>"/>
                                <div class="flex justify-center items-center">
                                    <div class="pr-8 flex"> 
                                        <a href="quantity?action=dec&id=<%= c.getIdcoffe() %>"><span class="font-semibold">-</span></a> 
                                        <input type="text" class="focus:outline-none bg-gray-100 border h-6 w-8 rounded text-sm px-2 mx-2" value="<%= c.getQuantity() %>"> 
                                        <a href="quantity?action=inc&id=<%= c.getIdcoffe() %>"><span class="font-semibold">+</span></a>
                                    </div>
                                </div>
                            </form>
                          
                        </div>
                        <div class="col-span-1 ml-3 justify-self-end">
                          <a href="remove-from-cart?id=<%= c.getIdcoffe() %>" class="bg-rebecca-purple hover:bg-medium-purple rounded-lg p-2 pl-5 pr-5 text-base text-gray-100 transition duration-100 active:bg-purple-900">
                            Discard
                          </a>
                        </div>
                      </div>
                <% }
            }
        %>
        
        <!-- item 1 end-->
        <!-- Total Start-->
        <div class="mt-10 grid grid-cols-3">
          <div class="col-start-3 h-auto rounded-md border p-5">
            <div class="grid">
              <div class="flex justify-between pt-2">
                <a href="" class="font-poppin">Total:</a>
                <a href="" class="font-poppin font-semibold">Rp${ (total > 0) ? total:0 }</a>
              </div>
              <div class="w-full place-self-end pt-5">
                <a
                  href="payment.jsp"
                  class="bg-rebecca-purple text-center hover:bg-medium-purple focus:bg-mendium-purple mb-2 inline-block w-full rounded px-6 py-2.5 text-xs font-medium uppercase leading-normal tracking-wide text-white shadow-md transition duration-150 ease-in-out hover:shadow-lg focus:shadow-lg focus:outline-none focus:ring-0 active:bg-purple-900 active:shadow-lg"
                >
                  Selesaikan Pembayaran
                </a>
              </div>
            </div>
          </div>
        </div>
        <!-- Total End-->
      </div>
    </div>
    <!--Keranjang End-->
  </body>
</html>