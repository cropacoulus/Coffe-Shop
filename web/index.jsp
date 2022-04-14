<%-- 
    Document   : index
    Created on : Feb 8, 2022, 12:26:51 AM
    Author     : RIFKI
--%>
<%@page import="java.util.*"%>
<%@page import="model.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    User auth = (User) request.getSession().getAttribute("authUser"); 
    if(auth != null){
        request.setAttribute("authUser", auth);
    }
    
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
    <title>Beranda - BaiCoffee</title>

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
  <body class="w-full overflow-x-hidden bg-center">
    <%@include file="includes/navbar.jsp" %>

    <div class="h-auto px-32">
        <!--Heading Start-->
        <div class="font-poppin my-10 flex justify-between">
            <!--Carousel Start-->
            <div
            id="carouselExampleCrossfade"
            class="carousel slide carousel-fade relative"
            data-bs-ride="carousel"
          >
            <div class="carousel-indicators absolute right-0 bottom-0 left-0 flex justify-center p-0 mb-4">
              <button
                type="button"
                data-bs-target="#carouselExampleCrossfade"
                data-bs-slide-to="0"
                class="active"
                aria-current="true"
                aria-label="Slide 1"
              ></button>
              <button
                type="button"
                data-bs-target="#carouselExampleCrossfade"
                data-bs-slide-to="1"
                aria-label="Slide 2"
              ></button>
              <button
                type="button"
                data-bs-target="#carouselExampleCrossfade"
                data-bs-slide-to="2"
                aria-label="Slide 3"
              ></button>
            </div>
            <div class="carousel-inner relative w-full overflow-hidden">
              <div class="carousel-item active float-left w-full">
                <img
                  src="images/CoffeeLogo3.png"
                  class="block w-full"
                  alt="Wild Landscape"
                />
              </div>
              <div class="carousel-item float-left w-full">
                <img
                  src="images/CoffeeLogo3.png"
                  class="block w-full"
                  alt="Camera"
                />
              </div>
              <div class="carousel-item float-left w-full">
                <img
                  src="images/CoffeeLogo3.png"
                  class="items-center block w-full" alt="Exotic Fruits"
                />
              </div>
            </div>
            <button
              class="carousel-control-prev absolute top-0 bottom-0 flex items-center justify-center p-0 text-center border-0 hover:outline-none hover:no-underline focus:outline-none focus:no-underline left-0"
              type="button"
              data-bs-target="#carouselExampleCrossfade"
              data-bs-slide="prev"
            >
              <span class="carousel-control-prev-icon inline-block bg-no-repeat" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button
              class="carousel-control-next absolute top-0 bottom-0 flex items-center justify-center p-0 text-center border-0 hover:outline-none hover:no-underline focus:outline-none focus:no-underline right-0"
              type="button"
              data-bs-target="#carouselExampleCrossfade"
              data-bs-slide="next"
            >
              <span class="carousel-control-next-icon inline-block bg-no-repeat" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
          <!--Carousel End-->
        </div>
        <div  class="flex flex-col space-x-2">
            <div>
                <strong class="text-3xl leading-tight text-gray-800">
                    New Coffee
                </strong>
            </div>
            <div>
                <h2 class="text-base leading-tight text-gray-800">
                    Satu langkah kecil dari sebuah niat baik mampu membawa kita menuju sesuatu yang diluar imajinasi.
                </h2>
            </div>
        </div>
        
        <!--Heading End-->
        <div  class="grid grid-cols-3 mt-10">
            <!-- Side Bar Kiri Start-->
            <div id="barKiri" class="font-poppin col-span-2 pt-2 pr-20">
                <div class="flex justify-center">
                    <div class="rounded-lg shadow-lg bg-white max-w-sm">
                      <a href="#!">
                        <img class="rounded-t-lg" src="images/cmochacino.png" alt=""/>
                      </a>
                      <div class="p-6">
                        <h5 class="text-gray-900 text-xl font-medium mb-2 text-center">Mocchacino</h5>
                        <p class="text-gray-700 text-base mb-4">
                          Some quick example text to build on the card title and make up the bulk of the card's
                          content.
                        </p>
                        <a href="menu.jsp" class=" inline-block px-6 py-2.5 bg-blue-600 text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-blue-700 hover:shadow-lg focus:bg-blue-700 focus:shadow-lg focus:outline-none focus:ring-0 active:bg-blue-800 active:shadow-lg transition duration-150 ease-in-out">See More</a>
                      </div>
                    </div>
                  </div>
            </div>
            <div id="barKanan">
                <div class="top-20 h-auto p-5">
                    <div class="flex justify-center">
                        <div class="rounded-lg shadow-lg bg-white max-w-sm">
                        <a href="#">
                            <img class="rounded-t-lg" src="images/cexpresso.png" alt=""/>
                        </a>
                        <div class="p-6">
                            <h5 class="text-gray-900 text-center text-xl font-medium mb-2">Expresso</h5>
                            <p class="text-gray-700 text-base mb-4">
                            Some quick example text to build on the card title and make up the bulk of the card's
                            content.
                            </p>
                            <a href="menu.jsp" class=" inline-block px-6 py-2.5 bg-blue-600 text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-blue-700 hover:shadow-lg focus:bg-blue-700 focus:shadow-lg focus:outline-none focus:ring-0 active:bg-blue-800 active:shadow-lg transition duration-150 ease-in-out">See More</a>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="flex flex-col space-x-2 mt-20">
            <div>
                <strong class="text-3xl leading-tight text-gray-800">
                    Iced Coffee
                </strong>
            </div>
            <div>
                <h2 class="text-base leading-tight text-gray-800">
                    Jangan mengeluh kopimu dingin. Karena dia pernah hangat tetapi kamu tinggalkan.
                </h2>
            </div>
        </div>
        <div class="grid grid-cols-3">
            <div class="font-poppin col-start-1 col-end-7 pt-2 pr-20">
                <div class="flex justify-center">
                    <div class="rounded-lg shadow-lg bg-white max-w-sm">
                      <a href="#!">
                        <img class="rounded-t-lg" src="images/cmochacino.png" alt=""/>
                      </a>
                      <div class="p-6">
                        <h5 class="text-gray-900 text-xl font-medium mb-2 text-center">Cold Brew
                            ICED
                            COFFEE</h5>
                        <p class="text-gray-700 text-base mb-4">
                          Some quick example text to build on the card title and make up the bulk of the card's
                          content.
                        </p>
                        <a href="menu.jsp" class=" inline-block px-6 py-2.5 bg-blue-600 text-white font-medium text-xs leading-tight uppercase rounded shadow-md hover:bg-blue-700 hover:shadow-lg focus:bg-blue-700 focus:shadow-lg focus:outline-none focus:ring-0 active:bg-blue-800 active:shadow-lg transition duration-150 ease-in-out">See More</a>
                      </div>
                    </div>
                  </div>
            </div>
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