<%-- 
    Document   : menu
    Created on : Feb 11, 2022, 9:24:48 PM
    Author     : RIFKI
--%>

<%@page import="java.util.*"%>
<%@page import="model.*" %>
<%@page import="dao.CoffeDao" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    User auth = (User) request.getSession().getAttribute("authUser"); 
    if(auth != null){
        request.setAttribute("authUser", auth);
    }
    
    CoffeDao cd = new CoffeDao();
    List<Coffe> coffes = cd.getAllCoffe();
    
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if(cart_list != null){
        request.setAttribute("cart_list", cart_list);
    }
%>
<!DOCTYPE html>
<html lang="en" class="scroll-auto">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Menu - BaiCoffee</title>

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

    <div class="h-auto bg-white px-32">
        <!--Heading Start-->
        <div class="flex my-10 space-x-2 justify-center">
            <strong class="text-3xl leading-tight text-gray-800">
                Menu
            </strong>
        </div>
        <!--Heading End-->
        
        <div class="grid grid-cols-3 mt-10">
            <!-- Side Bar Start-->
            <% if( !coffes.isEmpty()){
                for(Coffe c:coffes){ %>
                    <div id="bar" class="font-poppin col-span-1 pt-2 pr-20">
                        <div class="flex justify-center">
                            <div class="rounded-lg shadow-lg bg-white max-w-sm">
                              <a href="#!">
                                <img class="rounded-t-lg w-24 h-24" src="images/<%= c.getImage() %>" alt=""/>
                              </a>
                              <div class="p-6">
                                <h5 class="text-gray-900 text-xl font-medium mb-2 text-center"><%= c.getCoffname() %></h5>
                                <p class="text-gray-700 text-base mb-4">
                                    Rp.<span class="text-black"><%= c.getCoffprice()%></span>
                                </p>
                                <a href="add-to-cart?id=<%= c.getIdcoffe() %>" class=" inline-block px-6 py-2.5 bg-blue-600 text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-blue-700 hover:shadow-lg focus:bg-blue-700 focus:shadow-lg focus:outline-none focus:ring-0 active:bg-blue-800 active:shadow-lg transition duration-150 ease-in-out">Add To Cart</a>
                              </div>
                            </div>
                          </div>
                    </div>
                <% }
                }
            %>
            <!-- Side Bar End -->
        </div>
    </div>
    
    <footer class="bg-rebecca-purple text-center mt-20 lg:text-left">
        <div class="text-white text-center p-4 text-solid-purple" style="padding: 1rem;">
          © 2021 Copyright:
          <a class="text-black font-bold" href="menu.html">BaiCoffeshop</a>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/tw-elements/dist/js/index.min.js"></script>
  </body>
</html>    