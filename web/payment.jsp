<%-- 
    Document   : payment
    Created on : Feb 12, 2022, 11:39:46 AM
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
      <div class="grid grid-cols-3">
        <!-- Side Bar Kiri Start-->
        <div id="barKiri" class="font-poppin col-span-2 pt-2 pr-20">
            <form action="check-out" method="post">
            <!-- Form Alamat Start-->
            <div>
              <span class="text-md text-gray-900">Masukan Data</span>
              <h1 class="text-2xl font-bold">Alamat Pengiriman</h1>
            </div>
            <div class="mt-5">
              <label class="text-md mb-2 block">Alamat Lengkap</label>
              <textarea required name="alamat" placeholder="Cth. Jl. Contoh No. 44 (Samping Warung blablabla)" class="w-full rounded-md border-2 px-4 py-2 text-sm outline-none"></textarea>
            </div>
            <div class="mt-5">
              <label class="text-md mb-2 block">Provinsi</label>
              <input
                class="w-full rounded-md border-2 px-4 py-2 text-sm outline-none"
                type="text"
                name="provinsi"
                placeholder="Provinsi"
                required
              />
            </div>

            <div class="mt-5">
              <label class="text-md mb-2 block">Kabupaten / Kota</label>
              <select 
                  name="kota" 
                  id="kota" 
                  class="w-full rounded-md border-2 px-4 py-2 text-sm outline-none"
              >
                  <option value="">Pilih Kota</option>
              </select>
            </div>
            
            <div class="mt-5">
              <label class="text-md mb-2 block">Kecamatan</label>
              <select 
                  name="kecamatan" 
                  id="kecamatan" 
                  class="w-full rounded-md border-2 px-4 py-2 text-sm outline-none"
              >
                  <option value="">Pilih Kecamatan</option>
              </select>
            </div>
            <!-- Form Alamat End-->
            
            <!-- Form Payment Start-->
            <div class="mt-20">
              <span class="text-md text-gray-900">Apa yang kamu punya</span>
              <h1 class="text-2xl font-bold">Metode Pembayaran</h1>
            </div>

            <div
              class="border-rebecca-purple mb-4 flex items-center rounded-md border p-2"
            >
              <input
                id="payment-1"
                type="radio"
                name="payment"
                value="transfer-bank"
                class="h-4 w-4 border-gray-300"
                aria-labelledby="payment-1"
                aria-describedby="payment-1"
                checked=""
              />
              <div class="flex w-full justify-between">
                <label
                  for="payment-1"
                  class="text-md ml-2 block font-medium text-gray-900"
                >
                  Transfer Bank
                </label>
              </div>
            </div>

            <div
              class="border-rebecca-purple mb-4 flex items-center rounded-md border p-2"
            >
              <input
                id="payment-2"
                type="radio"
                name="payment"
                value="cod"
                class="h-4 w-4 border-gray-300"
                aria-labelledby="payment-2"
                aria-describedby="payment-2"
              />
              <div class="flex w-full justify-between">
                <label
                  for="payment-2"
                  class="text-md ml-2 block font-medium text-gray-900"
                >
                  Cash On Delivery ( COD )
                </label>
              </div>
            </div>
            <div
              class="border-rebecca-purple mb-4 flex items-center rounded-md border p-2"
            >
              <input
                id="payment-3"
                type="radio"
                name="payment"
                value="gopay"
                class="h-4 w-4 border-gray-300"
                aria-labelledby="payment-3"
                aria-describedby="payment-3"
              />
              <div class="flex w-full justify-between">
                <label
                  for="payment-3"
                  class="text-md ml-2 block font-medium text-gray-900"
                >
                  Go-Pay
                </label>
              </div>
            </div>
            <div
              class="border-rebecca-purple mb-4 flex items-center rounded-md border p-2"
            >
              <input
                id="payment-4"
                type="radio"
                name="payment"
                value="ovo"
                class="h-4 w-4 border-gray-300"
                aria-labelledby="payment-4"
                aria-describedby="payment-4"
              />
              <div class="flex w-full justify-between">
                <label
                  for="payment-4"
                  class="text-md ml-2 block font-medium text-gray-900"
                >
                  OVO
                </label>
              </div>
            </div>
            <div
              class="border-rebecca-purple mb-4 flex items-center rounded-md border p-2"
            >
              <input
                id="payment-5"
                type="radio"
                name="payment"
                value="dana"
                class="h-4 w-4 border-gray-300"
                aria-labelledby="payment-5"
                aria-describedby="payment-5"
              />
              <div class="flex w-full justify-between">
                <label
                  for="payment-5"
                  class="text-md ml-2 block font-medium text-gray-900"
                >
                    DANA
                </label>
              </div>
            </div>
            <!-- Form Payment End-->

            <!-- Button Submit-->
            <div class="">
                <button type="submit"
                class="bg-rebecca-purple hover:bg-medium-purple mt-4 mb-3 w-full rounded-md py-2 tracking-wide text-white transition duration-100"
              >
                Submit
              </button>
            </div>
            <!-- Button Submit-->
          </form>
        </div>
        <!-- Side Bar Kiri End-->
        <!-- Side Bar Kanan Start-->
        <div id="barKanan">
           <div class="border-rebecca-purple border p-5 top-20 h-auto">
            <div class="font-poppin grid">
                <a
                class="text-rebecca-purple font-poppin text-2xl font-medium tracking-wide"
                >Detail Order
              </a>
                <% 
                    if(cart_list != null){
                        for(Cart c:cartProduct){ %>
                            <div><h2 class="font-semibold "><%= c.getCoffname() %></h2></div>
                            <div class="grid grid-cols-2 gap-3 pb-2">
                              <img src="images/<%= c.getImage() %>" alt="" class="border-rebecca-purple rounded border p-1"/>
                              <div class="grid text-sm font-medium">
                                <div class="">
                                  <p>Quantity:</p>
                                  <a href="#"><%= c.getQuantity() %> <b>Pcs</b></a>
                                </div>
                                <div class="">
                                  <p>Harga:</p>
                                  <a href="#"><b>Rp</b><%= c.getCoffprice() %></a>
                                </div>
                              </div>
                            </div>
                        <% }
                    }
                %>
            </div>
          </div>
            <div class="bg-rebecca-purple text-white top-20 h-auto p-5">
                <a
                class="font-poppin text-2xl font-medium tracking-wide"
                >Detail Pembayaran
              </a>
              <div class="flex justify-between py-2">
                <a href="" class="font-poppin">Sub Total</a>
                <a href="" class="font-poppin font-medium"><b>Rp</b>${ (total > 0) ? total:0 }</a>
              </div>
              <div class="flex justify-between py-2">
                <a href="" class="font-poppin">Biaya Pengiriman:</a>
                <a href="" class="font-poppin font-medium">10</a>
              </div>
              <div class="flex justify-between pt-2">
                <a href="" class="font-poppin">Total:</a>
                <a href="" class="font-poppin font-semibold"><b>Rp</b>${ (total > 0) ? total:0 }</a>
              </div>
            </div>
        </div>
        <!-- Side Bar Kanan End-->
      </div>
    </div>
    <!--Main Payment End-->
    
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function() {
            $.ajax({
                type: "GET",
                url: "https://dev.farizdotid.com/api/daerahindonesia/kota?id_provinsi=31",
                dataType: "json",
                success:function(result){
                    var content = result.kota_kabupaten;
                    for(var i=0; i < content.length; i++) {
                        $('#kota').append('<option value="'+ content[i].id +'" >' + content[i].nama + '</option>');
                    }
                }
            });  
            $('#kota').change(function() {
                var kota_id = $(this).val();
                $.ajax({
                    type: "GET",
                    url: "https://dev.farizdotid.com/api/daerahindonesia/kecamatan?id_kota=",
                    data: {id_kota:kota_id},
                    dataType: "json",
                    success:function(result) {
                        var content = result.kecamatan;
                        console.log(content);
                        for(k in content) {
                            $('#kecamatan').append('<option value="'+ content[k].id +'" >' + content[k].nama + '</option>');
                        }
                    }
                });
            });
        });
        
    </script>
  </body>
</html>