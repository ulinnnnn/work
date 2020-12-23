<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.fmarticle.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>
<%
 	fmarticleService fmSvc = new fmarticleService();
	String fmcl_no = "302";
    List<fmarticleVO> list = fmSvc.getfmclAll(fmcl_no);
    pageContext.setAttribute("list",list);
%>

  <head>

    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ToyAllHot-�׾­���</title>

    <!-- PLUGINS CSS STYLE -->
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet">
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/plugins/selectbox/select_option1.css" rel="stylesheet">
    <link href="assets/plugins/fancybox/jquery.fancybox.min.css" rel="stylesheet">
    <link href="assets/plugins/rateyo/jquery.rateyo.min.css" rel="stylesheet">
    <link href="assets/plugins/iziToast/css/iziToast.css" rel="stylesheet">
    <link href="assets/plugins/prismjs/prism.css" rel="stylesheet">
    <link href="assets/plugins/revolution/css/settings.css" rel="stylesheet">
    <link href="assets/plugins/animate/animate.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="assets/plugins/slick/slick.css" media="screen">
    <link rel="stylesheet" type="text/css" href="assets/plugins/slick/slick-theme.css" media="screen">


    <!-- CUSTOM CSS -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/default.css" id="option_style">

    <!-- Icons -->
    <link rel="shortcut icon" href="assets/img/favicon.png">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
    a{
    	color:black;
    }
    
    </style>

  </head>

  <body id="body" class="body-wrapper version1 up-scroll">

    <div class="main-wrapper">

 <!-- header�H�U -->
    <div class="main-wrapper" style="overflow:visible;">
    <div class="header clearfix">
   <jsp:include page="/fm-front/assets/topBar.jsp" flush="true"/>
	</div>
	</div>
  <!-- header�H�W  -->


      <!-- HEADER -->
      <div class="header clearfix">

        <!-- TOPBAR -->
<!--         <div class="topBar"> -->
<!--           <div class="container"> -->
<!--             <div class="row"> -->
<!--               <div class="col-md-6 d-none d-md-block"> -->
<!--                 <ul class="list-inline"> -->
<!--                   <li><a href="#"><i class="fa fa-twitter"></i></a></li> -->
<!--                   <li><a href="#"><i class="fa fa-facebook"></i></a></li> -->
<!--                   <li><a href="#"><i class="fa fa-dribbble"></i></a></li> -->
<!--                   <li><a href="#"><i class="fa fa-vimeo"></i></a></li> -->
<!--                   <li><a href="#"><i class="fa fa-tumblr"></i></a></li> -->
<!--                 </ul> -->
<!--               </div> -->
<!--               <div class="col-md-6 col-12"> -->
<!--                 <ul class="list-inline float-right top-right"> -->
<!--                   <li class="account-login"><span><a data-toggle="modal" href='.login-modal'>Log in</a><small>or</small><a data-toggle="modal" href='#signup'>Create an account</a></span></li> -->
<!--                   <li class="searchBox"> -->
<!--                     <a href="#"><i class="fa fa-search"></i></a> -->
<!--                     <ul class="dropdown-menu dropdown-menu-right"> -->
<!--                       <li> -->
<!--                         <span class="input-group"> -->
<!--                           <input type="text" class="form-control" placeholder="Search?? aria-describedby="basic-addon2"> -->
<!--                           <button type="submit" class="input-group-addon">Submit</button> -->
<!--                         </span> -->
<!--                       </li> -->
<!--                     </ul> -->
<!--                   </li> -->
<!--                   <li class="dropdown cart-dropdown"> -->
<!--                     <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-shopping-cart"></i>$0</a> -->
<!--                     <ul class="dropdown-menu dropdown-menu-right"> -->
<!--                       <li>Item(s) in your cart</li> -->
<!--                       <li> -->
<!--                         <a href="single-product.html"> -->
<!--                           <div class="media"> -->
<!--                             <img class="media-left media-object" src="assets/img/home/cart-items/cart-item-01.jpg" alt="cart-Image"> -->
<!--                             <div class="media-body"> -->
<!--                               <h5 class="media-heading">INCIDIDUNT UT <br><span>2 X $199</span></h5> -->
<!--                             </div> -->
<!--                           </div> -->
<!--                         </a> -->
<!--                       </li> -->
<!--                       <li> -->
<!--                         <a href="single-product.html"> -->
<!--                           <div class="media"> -->
<!--                             <img class="media-left media-object" src="assets/img/home/cart-items/cart-item-01.jpg" alt="cart-Image"> -->
<!--                             <div class="media-body"> -->
<!--                               <h5 class="media-heading">INCIDIDUNT UT <br><span>2 X $199</span></h5> -->
<!--                             </div> -->
<!--                           </div> -->
<!--                         </a> -->
<!--                       </li> -->
<!--                       <li> -->
<!--                         <div class="btn-group" role="group" aria-label="..."> -->
<!--                           <button type="button" class="btn btn-default" onclick="location.href='cart-page.html';">Shopping Cart</button> -->
<!--                           <button type="button" class="btn btn-default" onclick="location.href='checkout-step-1.html';">Checkout</button> -->
<!--                         </div> -->
<!--                       </li> -->
<!--                     </ul> -->
<!--                   </li> -->
<!--                 </ul> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->

        <!-- NAVBAR -->
<!--         <nav class="navbar navbar-main navbar-default navbar-expand-md navbar-scrollUp navbar-sticky" role="navigation"> -->
<!--           <div class="container"> -->
<!--             Brand and toggle get grouped for better mobile display -->

<!--             <a class="navbar-brand" href="index.html"> -->
<!--               <svg -->
<!--               xmlns="http://www.w3.org/2000/svg" -->
<!--               xmlns:xlink="http://www.w3.org/1999/xlink" -->
<!--               width="166px" height="31px"> -->
<!--              <path class="logo-pl" fill-rule="evenodd"  fill="rgb(71, 186, 193)" -->
<!--               d="M157.432,17.855 L157.573,15.904 L166.011,15.904 L166.011,27.436 C164.581,28.174 163.195,28.687 161.853,28.974 C160.511,29.261 158.921,29.404 157.081,29.404 C155.487,29.404 154.019,29.179 152.678,28.728 C151.336,28.277 150.178,27.646 149.206,26.838 C148.233,26.029 147.410,25.066 146.736,23.946 C146.062,22.827 145.558,21.597 145.224,20.255 C144.890,18.913 144.723,17.492 144.723,15.992 C144.723,13.355 145.216,11.021 146.200,8.987 C147.184,6.954 148.652,5.346 150.603,4.162 C152.554,2.979 154.866,2.387 157.538,2.387 C160.467,2.387 163.069,3.061 165.343,4.408 L164.341,6.219 C163.380,5.633 162.293,5.161 161.080,4.804 C159.867,4.446 158.692,4.268 157.555,4.268 C155.844,4.268 154.318,4.572 152.976,5.182 C151.634,5.791 150.548,6.632 149.716,7.704 C148.883,8.776 148.254,10.010 147.826,11.404 C147.398,12.799 147.184,14.316 147.184,15.957 C147.184,17.703 147.401,19.279 147.835,20.686 C148.268,22.092 148.919,23.308 149.786,24.333 C150.653,25.359 151.766,26.150 153.126,26.706 C154.485,27.263 156.055,27.541 157.837,27.541 C159.676,27.541 161.704,27.102 163.919,26.223 L163.919,17.855 L157.432,17.855 ZM137.244,20.123 L126.398,20.123 L122.917,29.000 L120.685,29.000 L130.898,2.844 L133.060,2.844 L142.904,29.000 L140.583,29.000 L137.244,20.123 ZM131.953,5.111 C131.812,5.627 131.349,6.998 130.564,9.225 C129.779,11.451 129.029,13.549 128.314,15.518 L127.259,18.471 L136.435,18.471 C133.798,10.901 132.304,6.447 131.953,5.111 ZM118.250,17.398 C119.223,18.594 119.709,20.006 119.709,21.635 C119.709,23.944 118.977,25.748 117.512,27.049 C116.047,28.350 113.797,29.000 110.762,29.000 L101.902,29.000 L101.902,2.844 L109.039,2.844 C112.285,2.844 114.655,3.383 116.149,4.461 C117.644,5.539 118.391,7.180 118.391,9.383 C118.391,9.641 118.388,9.834 118.382,9.963 C118.376,10.092 118.350,10.347 118.303,10.728 C118.256,11.108 118.183,11.428 118.083,11.686 C117.983,11.943 117.828,12.263 117.617,12.644 C117.406,13.025 117.151,13.355 116.853,13.637 C116.554,13.918 116.164,14.202 115.684,14.489 C115.203,14.777 114.658,15.014 114.049,15.201 C115.877,15.471 117.277,16.203 118.250,17.398 ZM114.357,13.540 C114.901,13.183 115.312,12.673 115.587,12.011 C115.862,11.349 116.000,10.525 116.000,9.541 C116.000,7.713 115.435,6.445 114.304,5.735 C113.173,5.026 111.383,4.672 108.934,4.672 L104.152,4.672 L104.152,14.498 L110.147,14.498 C111.072,14.498 111.869,14.428 112.537,14.287 C113.205,14.146 113.812,13.898 114.357,13.540 ZM109.162,16.221 L104.152,16.221 L104.152,27.242 L110.182,27.242 C114.928,27.242 117.301,25.373 117.301,21.635 C117.301,19.608 116.644,18.198 115.332,17.407 C114.020,16.616 111.963,16.221 109.162,16.221 Z"/> -->
<!--              <path class="logo-pm" fill-rule="evenodd"  fill="rgb(51, 51, 51)" -->
<!--               d="M86.846,18.752 L86.882,15.008 L96.725,15.008 L96.725,27.436 C95.131,28.092 93.623,28.578 92.199,28.895 C90.775,29.211 89.231,29.369 87.567,29.369 C83.641,29.369 80.574,28.186 78.365,25.818 C76.156,23.451 75.051,20.211 75.051,16.098 C75.051,13.485 75.567,11.185 76.598,9.198 C77.629,7.212 79.147,5.662 81.151,4.549 C83.155,3.436 85.522,2.879 88.253,2.879 C91.382,2.879 94.065,3.553 96.303,4.900 L94.757,8.451 C92.624,7.303 90.485,6.729 88.341,6.729 C85.739,6.729 83.694,7.572 82.206,9.260 C80.717,10.947 79.973,13.244 79.973,16.150 C79.973,19.033 80.635,21.313 81.960,22.988 C83.284,24.664 85.223,25.502 87.778,25.502 C89.419,25.502 90.907,25.244 92.243,24.729 L92.243,18.752 L86.846,18.752 ZM65.972,3.248 L70.736,3.248 L70.736,29.000 L65.972,29.000 L65.972,3.248 ZM60.760,17.478 C61.604,18.573 62.025,19.924 62.025,21.529 C62.025,23.955 61.167,25.807 59.450,27.084 C57.733,28.361 55.357,29.000 52.322,29.000 L42.777,29.000 L42.777,3.248 L50.811,3.248 C54.221,3.248 56.763,3.746 58.439,4.742 C60.115,5.738 60.953,7.396 60.953,9.717 C60.953,10.092 60.930,10.461 60.883,10.824 C60.836,11.188 60.730,11.601 60.566,12.063 C60.402,12.527 60.185,12.945 59.916,13.320 C59.646,13.695 59.271,14.062 58.791,14.419 C58.310,14.777 57.748,15.055 57.104,15.254 C58.697,15.641 59.916,16.382 60.760,17.478 ZM54.985,7.502 C54.077,6.998 52.633,6.746 50.652,6.746 L47.541,6.746 L47.541,13.883 L51.619,13.883 C54.771,13.883 56.348,12.682 56.348,10.279 C56.348,8.932 55.893,8.006 54.985,7.502 ZM55.785,18.154 C54.871,17.521 53.459,17.205 51.549,17.205 L47.541,17.205 L47.541,25.555 L51.672,25.555 C55.328,25.555 57.156,24.125 57.156,21.266 C57.156,19.824 56.699,18.787 55.785,18.154 Z"/> -->
<!--              <path class="logo-pf" fill-rule="evenodd"  opacity="0.6" fill="rgb(71, 186, 193)" -->
<!--               d="M18.000,9.000 L10.000,9.000 L6.000,9.000 L2.000,9.000 C0.900,9.000 -0.000,9.900 -0.000,11.000 L-0.000,23.000 C-0.000,27.400 3.600,31.000 8.000,31.000 L20.000,31.000 C24.400,31.000 28.000,27.400 28.000,23.000 L28.000,11.000 C28.000,9.900 27.100,9.000 26.000,9.000 L22.000,9.000 L18.000,9.000 ZM22.000,13.000 L24.000,13.000 L24.000,23.000 C24.000,25.206 22.205,27.000 20.000,27.000 L8.000,27.000 C5.794,27.000 4.000,25.206 4.000,23.000 L4.000,13.000 L6.000,13.000 L10.000,13.000 L18.000,13.000 L22.000,13.000 Z"/> -->
<!--              <path class="logo-pf" fill-rule="evenodd"  opacity="0.6" fill="rgb(71, 186, 193)" -->
<!--               d="M6.000,10.334 L6.000,14.000 L6.000,16.000 C6.000,17.103 6.896,18.000 8.000,18.000 C9.104,18.000 10.000,17.103 10.000,16.000 L10.000,14.000 L10.000,10.000 L10.000,8.000 C10.000,5.791 11.791,4.000 14.000,4.000 C16.209,4.000 18.000,5.791 18.000,8.000 L18.000,10.000 L18.000,14.000 L18.000,16.000 C18.000,17.103 18.896,18.000 20.000,18.000 C21.103,18.000 22.000,17.103 22.000,16.000 L22.000,14.000 L22.000,10.000 L22.000,8.000 C22.000,3.582 18.418,-0.000 14.000,-0.000 C9.582,-0.000 6.000,3.582 6.000,8.000 L6.000,10.000 "/> -->
<!--              </svg> -->
<!--             </a> -->
<!--             <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".navbar-ex1-collapse" aria-controls="navbar-ex1-collapse" aria-expanded="false" aria-label="Toggle navigation"> -->
<!--               <span class="fa fa-bars"></span> -->
<!--             </button> -->


<!--             Collect the nav links, forms, and other content for toggling -->
<!--             <div class="collapse navbar-collapse navbar-ex1-collapse"> -->
<!--               <ul class="nav navbar-nav ml-auto"> -->
<!--                 <li class="nav-item dropdown "> -->
<!--                   <a href="javascript:void(0)" class="dropdown-toggle nav-link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Home</a> -->
<!--                   <ul class="dropdown-menu dropdown-menu-left"> -->
<!--                     <li class=""><a href="index.html">Home Default</a></li> -->
<!--                     <li><a href="index-v2.html">Home Classic</a></li> -->
<!--                     <li><a href="index-v3.html">Home Deals</a></li> -->
<!--                     <li><a href="index-v4.html">Home Mega</a></li> -->
<!--                     <li><a href="index-v5.html">Home Onepage</a></li> -->
<!--                   </ul> -->
<!--                 </li> -->
<!--                 <li class="nav-item dropdown megaDropMenu "> -->
<!--                   <a href="javascript:void(0)" class="dropdown-toggle nav-link" data-toggle="dropdown" data-hover="dropdown" data-delay="300" data-close-others="true" aria-expanded="false">Shop</b></a> -->
<!--                   <ul class="dropdown-menu row"> -->
<!--                     <li class="col-md-3 col-12"> -->
<!--                       <ul class="list-unstyled"> -->
<!--                         <li>Products Grid View</li> -->
<!--                         <li class=""><a href="product-grid-left-sidebar.html">Products Sidebar Left</a></li> -->
<!--                         <li class=""><a href="product-grid-right-sidebar.html">Products Sidebar Right</a></li> -->
<!--                         <li class=""><a href="product-grid-3-col-filter.html">Products 3 Columns V1</a></li> -->
<!--                         <li class=""><a href="product-grid-3-col.html">Products 3 Columns V2</a></li> -->
<!--                         <li class=""><a href="product-grid-4-col.html">Products 4 Columns</a></li> -->
<!--                       </ul> -->
<!--                     </li> -->
<!--                     <li class="col-md-3 col-12"> -->
<!--                       <ul class="list-unstyled"> -->
<!--                         <li>Products List View</li> -->
<!--                         <li class=""><a href="product-list-left-sidebar.html">Products Sidebar Left</a></li> -->
<!--                         <li class=""><a href="product-list-right-sidebar.html">Products Sidebar Right</a></li> -->
<!--                         <li class="listHeading">Others</li> -->
<!--                         <li class=""><a href="single-product.html">Single Product</a></li> -->
<!--                         <li class=""><a href="cart-page.html">Cart Page</a></li> -->
<!--                       </ul> -->
<!--                     </li> -->
<!--                     <li class="col-md-3 col-12"> -->
<!--                       <ul class="list-unstyled"> -->
<!--                         <li>Checkout</li> -->
<!--                         <li class=""><a href="checkout-step-1.html">Step 1 - Shipping</a></li> -->
<!--                         <li class=""><a href="checkout-step-2.html">Step 2 - Payment</a></li> -->
<!--                         <li class=""><a href="checkout-step-3.html">Step 3 - Review</a></li> -->
<!--                         <li class=""><a href="checkout-step-4.html">Step 4 - Complete</a></li> -->
<!--                       </ul> -->
<!--                     </li> -->
<!--                     <li class="col-md-3 col-12"> -->
<!--                       <a href="#" class="menu-photo"><img src="assets/img/menu-photo.jpg" alt="menu-img"></a> -->
<!--                     </li> -->
<!--                   </ul> -->
<!--                 </li> -->
<!--                 <li class="nav-item dropdown "> -->
<!--                   <a href="javascript:void(0)" class="dropdown-toggle nav-link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">pages</a> -->
<!--                   <ul class="dropdown-menu dropdown-menu-left"> -->
<!--                     <li class=""><a href="about-us.html">About Us</a></li> -->
<!--                     <li class=""><a href="signup.html">Register</a></li> -->
<!--                     <li class=""><a href="signup-login.html">Register or Login</a></li> -->
<!--                     <li class=""><a href="login.html">Login</a></li> -->
<!--                     <li class=""><a href="lost-password.html">Password Recovery</a></li> -->
<!--                     <li class=""><a href="privacy-policy.html">Privacy Policy</a></li> -->
<!--                     <li class=""><a href="terms-and-conditions.html">Terms &amp; Conditions</a></li> -->
<!--                     <li><a href="404.html">404 Not Found</a></li> -->
<!--                     <li><a href="coming-soon.html">Coming Soon</a></li> -->
<!--                   </ul> -->
<!--                 </li> -->
<!--                 <li class="nav-item dropdown "> -->
<!--                   <a href="javascript:void(0)" class="dropdown-toggle nav-link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">blog</a> -->
<!--                   <ul class="dropdown-menu dropdown-menu-right"> -->
<!--                     <li class=""><a href="blog-right-sidebar.html">Right Sidebar</a></li> -->
<!--                     <li class=""><a href="blog-left-sidebar.html">Left Sidebar</a></li> -->
<!--                     <li class=""><a href="blog-fullwidth.html">Full Width</a></li> -->
<!--                     <li class=""><a href="blog-single-fullwidth.html">Single Post</a></li> -->
<!--                     <li class=""><a href="blog-single-right-sidebar.html">Single Right Sidebar</a></li> -->
<!--                     <li class=""><a href="blog-single-left-sidebar.html">Single Left Sidebar</a></li> -->
<!--                   </ul> -->
<!--                 </li> -->
<!--                 <li class="nav-item dropdown active"> -->
<!--                   <a href="javascript:void(0)" class="dropdown-toggle nav-link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">My Account</a> -->
<!--                   <ul class="dropdown-menu dropdown-menu-right"> -->
<!--                     <li class=""><a href="account-dashboard.html">Dashboard</a></li> -->
<!--                     <li class=""><a href="account-profile.html">Profile</a></li> -->
<!--                     <li class=""><a href="account-all-orders.html">All Orders</a></li> -->
<!--                     <li class=""><a href="account-single-order.html">Single Order</a></li> -->
<!--                     <li class="active"><a href="account-wishlist.html">Wishlist</a></li> -->
<!--                     <li class=""><a href="account-address.html">Address</a></li> -->
<!--                   </ul> -->
<!--                 </li> -->
<!--                 <li class="nav-item dropdown megaDropMenu "> -->
<!--                   <a href="javascript:void(0)" class="dropdown-toggle nav-link" data-toggle="dropdown" data-hover="dropdown" data-delay="300" data-close-others="true" aria-expanded="false">Components</b></a> -->
<!--                   <ul class="dropdown-menu row"> -->
<!--                     <li class="col-md-4 col-12"> -->
<!--                       <ul class="list-unstyled"> -->
<!--                         <li>Basic Elements</li> -->
<!--                         <li class=""><a href="basic-accordions.html">Accordions</a></li> -->
<!--                         <li class=""><a href="basic-alert.html">Alert</a></li> -->
<!--                         <li class=""><a href="basic-badge.html">Badge</a></li> -->
<!--                         <li class=""><a href="basic-buttons.html">Buttons </a></li> -->
<!--                         <li class=""><a href="basic-buttons-group.html">Button Group</a></li> -->
<!--                         <li class=""><a href="basic-card.html">Cards</a></li> -->
<!--                       </ul> -->
<!--                     </li> -->
<!--                     <li class="col-md-4 col-12"> -->
<!--                       <ul class="list-unstyled"> -->
<!--                         <li>Basic Elements</li> -->
<!--                         <li class=""><a href="basic-countdown.html">Countdown </a></li> -->
<!--                         <li class=""><a href="basic-divider.html">Divider </a></li> -->
<!--                         <li class=""><a href="basic-forms.html">Forms</a></li> -->
<!--                         <li class=""><a href="basic-heading.html">Heading </a></li> -->
<!--                         <li class=""><a href="basic-icon-style.html">Icon Style </a></li> -->
<!--                         <li class=""><a href="basic-iconset.html">Iconset (Font Awesome)</a></li> -->
<!--                       </ul> -->
<!--                     </li> -->
<!--                     <li class="col-md-4 col-12"> -->
<!--                       <ul class="list-unstyled"> -->
<!--                         <li>Basic Elements</li> -->
<!--                         <li class=""><a href="basic-modal.html">Modal </a></li> -->
<!--                         <li class=""><a href="basic-progressbar.html">Progressbar</a></li> -->
<!--                         <li class=""><a href="basic-tables.html">Tables </a></li> -->
<!--                         <li class=""><a href="basic-tabs.html">Tabs</a></li> -->
<!--                         <li class=""><a href="basic-typography.html">Typography </a></li> -->
<!--                         <li class=""><a href="basic-video.html">Video </a></li> -->
<!--                       </ul> -->
<!--                     </li> -->
<!--                   </ul> -->
<!--                 </li> -->
<!--               </ul> -->
<!--             </div>/.navbar-collapse -->
<!--             <div class="version2"> -->
<!--               <div class="dropdown cart-dropdown"> -->
<!--                 <a href="javascript:void(0)" class="dropdown-toggle shop-cart" data-toggle="dropdown"> -->
<!--                   <i class="fa fa-shopping-cart"></i> -->
<!--                   <span class="badge">3</span> -->
<!--                 </a> -->
<!--                 <ul class="dropdown-menu dropdown-menu-right"> -->
<!--                   <li>Item(s) in your cart</li> -->
<!--                   <li> -->
<!--                     <a href="single-product.html"> -->
<!--                       <div class="media"> -->
<!--                         <img class="media-left media-object" src="assets/img/home/cart-items/cart-item-01.jpg" alt="cart-Image"> -->
<!--                         <div class="media-body"> -->
<!--                           <h5 class="media-heading">INCIDIDUNT UT <br><span>2 X $199</span></h5> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </a> -->
<!--                   </li> -->
<!--                   <li> -->
<!--                     <a href="single-product.html"> -->
<!--                       <div class="media"> -->
<!--                         <img class="media-left media-object" src="assets/img/home/cart-items/cart-item-01.jpg" alt="cart-Image"> -->
<!--                         <div class="media-body"> -->
<!--                           <h5 class="media-heading">INCIDIDUNT UT <br><span>2 X $199</span></h5> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                     </a> -->
<!--                   </li> -->
<!--                   <li> -->
<!--                     <div class="btn-group" role="group" aria-label="..."> -->
<!--                       <button type="button" class="btn btn-default" onclick="location.href='cart-page.html';">Shopping Cart</button> -->
<!--                       <button type="button" class="btn btn-default" onclick="location.href='checkout-step-1.html';">Checkout</button> -->
<!--                     </div> -->
<!--                   </li> -->
<!--                 </ul> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--         </nav> -->
<!--       </div> -->

            <!-- LIGHT SECTION -->
      <section class="lightSection clearfix pageHeader">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <div class="page-title">
                <h2>�׾�</h2>
              </div>
            </div>
            <div class="col-md-6">
              <ol class="breadcrumb pull-right">
                <li>
                  <a href="myfm.jsp" style="font-size:16px;font-weight:bold;">�ڪ��峹</a>
                </li>
                <li class="active">
                <a href="fmarticle.jsp" style="font-size:16px;font-weight:bold;">�Q�װ�</a></li>
              </ol>
            </div>
          </div>
        </div>
      </section>

      <!-- MAIN CONTENT SECTION -->
      
      <section class="mainContent clearfix userProfile">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <div class="btn-group" role="group" aria-label="...">
                <a href="fmarticle.jsp" class="btn btn-default"><i class="fa fa-th" aria-hidden="true"></i>�Ҧ��`��</a>
                <a href="fmarticle301.jsp" class="btn btn-default"><i class="fa fa-th" aria-hidden="true"></i>�q���C��</a>
                <a href="fmarticle302.jsp" class="btn btn-default active"><i class="fa fa-th" aria-hidden="true"></i>����</a>
                <a href="fmarticle303.jsp" class="btn btn-default"><i class="fa fa-th" aria-hidden="true"></i>�U������</a>
                <a href="fmarticle304.jsp" class="btn btn-default"><i class="fa fa-th" aria-hidden="true"></i>�}�c����</a>
                <a href="fmarticle305.jsp" class="btn btn-default"><i class="fa fa-th" aria-hidden="true"></i>��L</a>
                <a href="fmarticle306.jsp" class="btn btn-default"><i class="fa fa-th" aria-hidden="true"></i>�M��</a>
              </div>
            </div>
          </div>
		
		
<!-- 		 <div class="panel panel-default recentBlogPosts"> -->
<!--                 <div class="panel-heading">recent posts</div> -->
<!--                 <div class="panel-body"> -->
<!--                   <div class="media"> -->
<!--                     <a class="media-left" href="blog-single-right-sidebar.html"> -->
<!--                        <img class="media-object" src="assets/img/blog/blog_1.png" alt="Image"> -->
<!--                     </a> -->
<!--                     <div class="media-body"> -->
<!--                       <h4 class="media-heading"><a href="blog-single-right-sidebar.html">�i���D�j�Q�ݰݦ��S���H���D�o�ڹC��</a></h4> -->
<!--                       <p><i class="fa fa-calendar" aria-hidden="true"></i>3 Sep, 2020</p> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                   <div class="media"> -->
<!--                     <a class="media-left" href="blog-single-right-sidebar.html"> -->
<!--                       <img class="media-object" src="assets/img/blog/blog_2.png" alt="Image"> -->
<!--                     </a> -->
<!--                     <div class="media-body"> -->
<!--                       <h4 class="media-heading"><a href="blog-single-right-sidebar.html">�i����j���S�H��King of thieves�s�̤���</a></h4> -->
<!--                       <p><i class="fa fa-calendar" aria-hidden="true"></i>3 Sep, 2020</p> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                   <div class="media"> -->
<!--                     <a class="media-left" href="blog-single-right-sidebar.html"> -->
<!--                       <img class="media-object" src="assets/img/blog/blog_3.png" alt="Image"> -->
<!--                     </a> -->
<!--                     <div class="media-body"> -->
<!--                       <h4 class="media-heading"><a href="blog-single-right-sidebar.html">�i�Q�סj�]�ʤT��</a></h4> -->
<!--                       <p><i class="fa fa-calendar" aria-hidden="true"></i>3 Sep, 2020</p> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->

		 <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div class="innerWrapper">
                <div class="orderBox">
                  <div class="table-responsive">
                  	<h3>�Q�װ�</h3>
                  	

                    <table class="table" >
                      <thead>
                        <tr>
                          <th>�峹�s��</th>
                          <th>�峹���D</th>
                          <th>�|���s��</th>
                          <th>�Ыؤ��</th>
						  <th></th>
						  <th></th>
                        </tr>
                      </thead>
    <%@ include file="page1.file" %> 
					<c:forEach var="fmarticleVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                      <tbody >
                        <tr>
                          <td>${fmarticleVO.fm_no}</td>
                          <td>${fmarticleVO.fm_head}</td>
                          <td>${fmarticleVO.mem_no}</td>
                          <td><fmt:formatDate value="${fmarticleVO.fm_ti}" pattern="yyyy-MM-dd EEE"/></td>
                   		  <td class="up">
                   		   <input type="hidden" name="fmcl_no"  value="${fmVO.fmcl_no}">
						     <input type="hidden" name="action" value="<%=request.getContextPath()%>/fm-front/FmarticleServlet">
						     <input type="hidden" name="action"	value="update">
						     <button type="submit"  value="�e�X�s�W"  onclick="location.href='NewFile.jsp?${fmarticleVO.fm_no}'" class="btn btn-primary btn-block" style="border-radius: 15px !important">�i�J</button>
<%-- 						     "<%=request.getContextPath()%>/fm-front/NewFile.jsp?${fmarticleVO.fm_no}" --%>
<!-- 									 onclick="location.href='TRY2.jsp'" -->
                   		  </td>	
                          <td class="down">
		                 <input type="hidden" name="fmcl_no"  value="${fmVO.fmcl_no}">
					     <input type="hidden" name="action" value="<%=request.getContextPath()%>/fm-front/FmarticleServlet">
					     <input type="hidden" name="action"	value="delete">
                          </td>
                        </tr>
                      </tbody>
                      </c:forEach>  
                    </table>
<%@ include file="page2.file" %>
			

		<script src="assets/plugins/jquery/jquery.min.js"></script>
		<script src="assets/plugins/jquery/jquery-migrate-3.0.0.min.js"></script>
		<script src="assets/plugins/jquery-ui/jquery-ui.js"></script>
		<script src="assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="assets/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
		<script src="assets/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
		<script src="assets/plugins/slick/slick.js"></script>
		<script src="assets/plugins/fancybox/jquery.fancybox.min.js"></script>
		<script src="assets/plugins/iziToast/js/iziToast.js"></script>
		<script src="assets/plugins/prismjs/prism.js"></script>
		<script src="assets/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
		<script src="assets/plugins/countdown/jquery.syotimer.js"></script>
		<script src="assets/plugins/velocity/velocity.min.js"></script>
		<script src="assets/plugins/rateyo/jquery.rateyo.min.js"></script>
		<script src="assets/js/custom.js"></script>
		
		<script src="assets/plugins/jquery/jquery.min.js"></script>
		<script src="assets/plugins/jquery/jquery-migrate-3.0.0.min.js"></script>
		<script src="assets/plugins/jquery-ui/jquery-ui.js"></script>
		<script src="assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="assets/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
		<script src="assets/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
		<script src="assets/plugins/slick/slick.js"></script>
		<script src="assets/plugins/fancybox/jquery.fancybox.min.js"></script>
		<script src="assets/plugins/iziToast/js/iziToast.js"></script>
		<script src="assets/plugins/prismjs/prism.js"></script>
		<script src="assets/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
		<script src="assets/plugins/countdown/jquery.syotimer.js"></script>
		<script src="assets/plugins/velocity/velocity.min.js"></script>
		<script src="assets/plugins/rateyo/jquery.rateyo.min.js"></script>
		<script src="assets/js/custom.js"></script>
		<h3>�@�@�@�@�@�@�@�@�@�@�@�@</h3>
	<ul>
<%-- 	  <li><a href='<%=request.getContextPath()%>/fm-front/TRY2.jsp'>Add</a> a new bp.</li> --%>
	
<%-- 	  <li><a href='<%=request.getContextPath()%>/bpclass-back/listbackbp.jsp'>Add</a>���|�`��</li> --%>
	
<%-- 	  <li><a href='<%=request.getContextPath()%>/fm-front/mybp.jsp'>Add</a>�dM0001�|������</li> --%>
	  
	  <button type="submit"  value="�e�X�s�W" onclick="location.href='fmins.jsp'" class="btn btn-primary btn-block" style="border-radius: 15px !important">�Z�n�峹</button>
	</ul>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</section>
	</div>
	</div>
	<jsp:include page="/fm-front/assets/footer.jsp" flush="true" />
	
	</body>
</html>
