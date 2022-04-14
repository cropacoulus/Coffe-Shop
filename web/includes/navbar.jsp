<!-- Navbar Start-->
    
    <div class="top-0 flex justify-between border-b bg-white px-32 py-5">
      <!-- Logo Start-->
      <div id="logo" class="font-Outfit flex text-xl font-bold tracking-wide">
        <i class="fas fa-mug-hot text-rebecca-purple mr-1"></i>
        <a href="" class="text-solid-purple"> BaiCoffee </a>
      </div>
      <!-- Logo End-->
      <!-- Menu Start-->
      <div
        id="menu"
        class="font-poppin flex items-center tracking-wide text-gray-600"
      >
        <div class="mx-2 transition duration-100 hover:text-black">
          <a href="index.jsp">Beranda</a>
        </div>
        <div class="mx-2 transition duration-100 hover:text-black">
          <a href="menu.jsp">Menu</a>
        </div>
        <div class="mx-2 transition duration-100 hover:text-black">
          <a href="kontak.jsp">Kontak</a>
        </div>
      </div>
      <!-- Menu End-->
      <!-- Icon Start-->
      <div class="flex gap-2">
        <% if(auth != null) { %>
        <a href="cart.jsp" class="rounded-full" style="height: 25px; width: 25px" loading="lazy">
            <img src="images/cart.svg" class="rounded-full" alt=""/>
            <span class="text-red-600 text-xs font-medium inline-flex items-center px-2.5 py-0.5 rounded mr-2">
                
                ${ cart_list.size() }
            </span>
        </a>
         <script
          src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
          defer
        ></script>
        <div x-data="{ dropdownOpen: false }" class="relative z-40">
            
          <button
            @click="dropdownOpen = !dropdownOpen"
            class="rounded-full"
            style="height: 25px; width: 25px"
          >
            <img src="https://mdbootstrap.com/img/new/avatars/2.jpg" class="rounded-full" alt=""/>
          </button>

          <div
            x-show="dropdownOpen"
            @click="dropdownOpen = false"
            class="fixed inset-0 h-full w-full"
          ></div>

          <div
            x-show="dropdownOpen"
            class="absolute right-0 mt-2 w-48 rounded-md bg-white py-2 shadow-xl"
          >
            <a
              href="#"
              class="block px-4 py-2 text-sm capitalize text-gray-700 hover:bg-blue-500 hover:text-white"
            >
              Your profile
            </a>
            <a
              href="orders.jsp"
              class="block px-4 py-2 text-sm capitalize text-gray-700 hover:bg-blue-500 hover:text-white"
            >
              Your Orders
            </a>
            <a
              href="#"
              class="block px-4 py-2 text-sm capitalize text-gray-700 hover:bg-blue-500 hover:text-white"
            >
              Settings
            </a>
            <a
              href="log-out"
              class="block px-4 py-2 text-sm capitalize text-gray-700 hover:bg-blue-500 hover:text-white"
            >
              Sign Out
            </a>
          </div>
        </div>
        <% } else { %>
        <a href="login.jsp" class=" inline-block px-6 py-2.5 bg-blue-600 text-white text-xs leading-tight uppercase rounded shadow-md hover:bg-blue-700 hover:shadow-lg focus:bg-blue-700 focus:shadow-lg focus:outline-none focus:ring-0 active:bg-blue-800 active:shadow-lg transition duration-150 ease-in-out">Login</a>
        <% } %>
      </div>
      <!-- Icon End-->
    </div>
    <!-- Navbar End-->