<%-- 
    Document   : orders
    Created on : Feb 14, 2022, 10:01:23 AM
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
    if(cart_list != null){
        request.setAttribute("cart_list", cart_list);
    }
%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Payment - BaiCoffee</title>

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

    <!--Main Payment Start-->
    <div class="h-auto bg-white px-32">
      <!--Heading Start-->
      <div class="font-poppin my-10 flex justify-between">
        <a class="text-solid-purple text-2xl font-normal tracking-wide"
          >Payment area</a
        >
        <a class="text-solid-purple text-2xl font-normal tracking-wide"
          ><i class="fas fa-bars"></i>
        </a>
        
      </div>
      <!--Heading End-->
        <div class="flex flex-col">
            <table class="min-w-full divide-y divide-gray-200 table-fixed">
                <thead class="bg-gray-100">
                    <tr>
                        <th scope="col"
                            class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                            Product Name
                        </th>
                        <th scope="col"
                            class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                            Category
                        </th>
                        <th scope="col"
                            class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                            Price
                        </th>
                        <th scope="col"
                            class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                            Price
                        </th>
                        <th scope="col"
                            class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                            Price
                        </th>
                        <th scope="col"
                            class="py-3 px-6 text-xs font-medium tracking-wider text-left text-gray-700 uppercase">
                            Price
                        </th>
                        <th scope="col" class="p-4">
                            <span class="sr-only">Edit</span>
                        </th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200 ">
                    <tr class="hover:bg-gray-100 ">
                        <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">Apple Imac 27"
                        </td>
                        <td class="py-4 px-6 text-sm font-medium text-gray-500 whitespace-nowrap">Desktop PC</td>
                        <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">$1999</td>
                        <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">$1999</td>
                        <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">$1999</td>
                        <td class="py-4 px-6 text-sm font-medium text-gray-900 whitespace-nowrap">$1999</td>
                        <td class="py-4 px-6 text-sm font-medium text-right whitespace-nowrap">
                            <a href="#" class="text-blue-600  hover:underline">Edit</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>
    <!--Main Payment End-->
  </body>
</html>
