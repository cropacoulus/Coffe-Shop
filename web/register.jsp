<%-- 
    Document   : login
    Created on : Feb 7, 2022, 10:44:30 PM
    Author     : RIFKI
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.*" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<% 
    User auth = (User) request.getSession().getAttribute("authUser"); 
    if(auth != null){
        response.sendRedirect("index.jsp");
    }
    
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if(cart_list != null){
        request.setAttribute("cart_list", cart_list);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <title>Login Page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- style css -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Responsive-->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- fevicon -->
        <link rel="icon" href="images/fevicon.png" type="image/gif" />
        <!-- Scrollbar Custom CSS -->
        <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
        <!-- Tweaks for older IEs-->
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
        <!-- owl stylesheets --> 
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    </head>
    <body>
        <div class="header_section header_main">
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					
				</div>
				<div class="col-sm-9">
					<nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                        </button>
                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <div class="navbar-nav">
                           <a class="nav-item nav-link" href="index.jsp">Home</a>
                           <a class="nav-item nav-link" href="Menu.jsp">Menu</a>
                           <a class="nav-item nav-link" href="Contact.jsp">Contact</a>
                           <% 
                           if(auth != null){%>
                               <a class="nav-item nav-link last" href="log-out">Logout</a>
                               <a class="nav-item nav-link last" href="contact.jsp"><img src="images/shop_icon.png"></a>
                           <%}else{%>
                               <a class="nav-item nav-link last" href="login.jsp">Login</a>
                           <%}
                           %>
                        </div>
                    </div>
                    </nav>
				</div>
			</div>
		</div>
	</div>
        
        <div class="row">
            <div class="container">
                <div class="card w-50 mx-auto my-5 mt-64">
                    <div class="card-header text-center">User Register</div>
                    <div class="card-body">
                        <form action="user-register" method="post">
                            <div class="form-group">
                                <label>Nama</label>
                                <input type="text" class="form-control" name="nama" placeholder="Nama">
                            </div>
                            <div class="form-group">
                                <label>Username</label>
                                <input type="text" class="form-control" name="username" placeholder="Username">
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" class="form-control" name="password" placeholder="••••••">
                            </div>
                            <div class="text-center">
                                <button type="sbumit" class="btn btn-primary">Register</button> 
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            
        </div>
    </body>
</html>
