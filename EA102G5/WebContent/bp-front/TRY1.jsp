<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bp.model.*"%>
<%@ page import="com.mem.model.*"%>
<%
BpVO bpVO = (BpVO) request.getAttribute("bpVO");
if(bpVO != null){
	
}else{
String bp_no =  request.getQueryString();

BpService bpsvc =new BpService();
bpVO =  bpsvc.getOnebp(bp_no);
pageContext.setAttribute("bpVO", bpVO);
}
%>


<jsp:useBean id="bpclassSvc" scope="page" class="com.bpclass.model.BpclassService" />
<!DOCTYPE html>
<html lang="zh_TW">
  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Product</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <link href="<%=request.getContextPath()%>/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/plugins/selectbox/select_option1.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/plugins/fancybox/jquery.fancybox.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/plugins/rateyo/jquery.rateyo.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/plugins/iziToast/css/iziToast.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/plugins/prismjs/prism.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/plugins/revolution/css/settings.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/plugins/animate/animate.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/plugins/slick/slick.css" media="screen">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/plugins/slick/slick-theme.css" media="screen">
    <link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/color-option2.css" id="option_style">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/img/favicon.png">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/joe_footer.css" >
<style>

img.do {
	
	height: 110px;
}
.SingleProductItem .product-content {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
	background-color: rgba(0%, 0%, 100%, 0) ;
    opacity: 0;
    transition: all 0.3s ease-in-out;
}
div.quest{
	font-size:18px;
    text-align: center;
    font-weight: bold;
    color:black;
}
div.try {
	font-family: 微軟正黑體;
    border: 3px double #FFB548;
    width: 100%;
    height: 100%;
    background-color: white;
    margin-bottom: 15px;
    padding: 15px;
    font-size: 16px;
    font-weight: bold;
    line-height: 25px;
    border-radius: 25px;
    color:black;
}

div.q3 {
    padding: 15px 0 0 240px;
}
div.q2 {
    padding: 15px 0 0 109px;
}

span.q5{
	padding:0 0 0 40px;
}
div.respon{
	text-align: right;
    padding-right: 15px;
}
*{
 font-family: 微軟正黑體;
}

.modal-content .form-control{
border-radius: 15px !important;
}
button{
border-radius: 15px !important;
}

        .display {
            text-align: center;
        }
        #map {
            width: 425px;
            height: 390px;
            margin: 10px auto;
        }
        .info_title {
            font-size: 16px;
            font-weight: 600;
        }
        .info_img {
            height: 30px;
            width: auto;
        }

.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active{
    background-color: #FFB548  !important;
    color:white ;
}

.search:focus {
	box-shadow: none !important;
	outline: 0px !important;
}

.type_msg:focus {
	box-shadow: none !important;
	outline: 0px !important;
}

.contacts {
	list-style: none;
	padding: 0;
}

.contacts li {
	width: 100% !important;
	padding: 5px 10px;
	margin-bottom: 15px !important;
}

.offline {
	background-color: #c23616 !important;
}

.Chatuser_info span {
	font-size: 20px;
	color: white;
}

.Chatuser_info p {
	font-size: 10px;
	color: rgba(255, 255, 255, 0.6);
}

.msg_time {
	position: absolute;
	left: 0;
	bottom: -15px;
	color: rgba(255, 255, 255, 0.5);
	font-size: 10px;
}

.msg_time_send {
	position: absolute;
	right: 0;
	bottom: -15px;
	color: rgba(255, 255, 255, 0.5);
	font-size: 10px;
}

.msg_head {
	position: relative;
}

#action_menu_btn {
	position: absolute;
	right: 10px;
	top: 10px;
	color: white;
	cursor: pointer;
	font-size: 20px;
}

@media ( max-width : 576px) {
	.contacts_card {
		margin-bottom: 15px !important;
	}
}
.swal2-icon-content{
	font-size:75px !important;
}

</style>
</head>

 <body id="body" class="body-wrapper version1 up-scroll"onload="connect();" >
<div class="main wrapper" style="overflow:visible;">
<div class="header clearfix">
		<c:choose>
		<c:when test="${memVO.mem_no==null}">
			<div class="topBar">
				<div class="container">
					<div class="row">
						<div class="col-md-6 d-none d-md-block"></div>
						<div class="col-md-6 col-12">
							<ul class="list-inline float-right top-right">
								<li class="account-login"><span> <span><a
											data-toggle="modal" href='.login-modal'>Log in</a><small>or</small>
											<a href='<%=request.getContextPath()%>/Front-mem/signup.jsp'>註冊帳號</a>
									</span></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="topBar">
				<div class="container">
					<div class="row">
						<div class="col-md-6 d-none d-md-block"></div>
						<div class="col-md-6 col-12">
							<ul class="list-inline float-right top-right">
								<li class="account-login"><span>
										<form method="post"
											action="<%=request.getContextPath()%>/Front-mem/mem.do"enctype="multipart/form-data">
											<input type="hidden" name="action" value="memLogout">
											<button id="logout" class="btn btn-success btn-icon btn-mid"
												type="submit" style="height: 36px; width: 90px ;background-color: #495057; border-color: #495057">
												<i class="fa fa-user"></i>登出
											</button>
										</form>
								</span></li>
								<li class="searchBox"><a href="#"><i
										class="fa fa-search"></i></a>
									<ul class="dropdown-menu">
										<li><span class="input-group"> <input type="text"
												class="form-control" placeholder="Search…"
												aria-describedby="basic-addon2">
												<button type="submit" class="input-group-addon">Submit</button>
										</span></li>
									</ul></li>

								<li class="dropdown cart-dropdown">
								<a href="javascript:void(0)" class="dropdown-toggle"
									data-toggle="dropdown" style="border-radius: 15px"> <i class="fa fa-user"></i>我的會員
								</a>
									<ul class="dropdown-menu dropdown-menu-right">
										<li>會員專區</li>
										<li><a href="<%=request.getContextPath() %>/Front-mem/account-profile.jsp">
												<div class="media">
													<img class="media-left media-object" height="80px"
														width="70px"
														src="<%=request.getContextPath() %>/MemPic?mem_account=${memVO.mem_account}">
													<div class="media-body">
														<h5 class="media-heading">
															會員名稱：<span>${memVO.mem_name}</span>
														</h5>
														<h5 class="media-heading">
															剩餘點數：<span>NT$ ${depoVO.depo_point}元</span>
														</h5>
													</div>
												</div>
										</a></li>
										<li>
											<div class="btn-group" role="group" aria-label="...">
												<button type="button" class="btn btn-default"
													onclick="location.href='<%=request.getContextPath() %>/Front-mem/account-profile.jsp';">進入會員首頁</button>
												<button type="button" class="btn btn-default"
													onclick="location.href='<%=request.getContextPath() %>/index.jsp';">返回首頁</button>
											</div>
										</li>
									</ul>
								</li>


								<li class="dropdown cart-dropdown">
								<a href="javascript:void(0)" class="dropdown-toggle"
									data-toggle="dropdown" style="border-radius: 15px"> <i class="far fa-comment-dots"></i>訊息
								</a> 
								<ul  class="dropdown-menu dropdown-menu-right " style="background-color:transparent;"> 
											<div style="margin-top: auto; margin-bottom: auto;width:300px;">
												<div class="card mb-sm-3 mb-md-0 contacts_card"
													style="height: 500px; border-radius: 15px !important; background-color: rgba(0, 0, 0, 0.65) !important;">
													<div class="card-header"
														style="border-radius: 15px 15px 0 0 !important; border-bottom: 0 !important;">
														<div class="input-group">
															<input type="text" placeholder="Search..." name=""
																class="form-control search"
																style="border-radius: 15px 0 0 15px !important; background-color: rgba(0, 0, 0, 0.3) !important; border: 0 !important; color: white !important;">
															<div class="input-group-prepend">
																<span class="input-group-text search_btn"
																	style="border-radius: 0 15px 15px 0 !important; background-color: rgba(0, 0, 0, 0.3) !important; border: 0 !important; color: white !important; cursor: pointer;"><i
																	class="fas fa-search"></i></span>
															</div>
														</div>
													</div>
													<div  id="chatRow" class="card-body contacts_body"
														style="padding: 0.75rem 0 !important; overflow-y: auto; white-space: nowrap;">
														
													</div>
												<div class="card-footer"style="border-radius: 0 0 15px 15px !important; border-top: 0 !important;">
												</div>
											</div>
										</div>
								   </ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
		 <!-- NAVBAR -->
        <nav class="navbar navbar-main navbar-default navbar-expand-md " role="navigation">
          <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->

            <a class="navbar-brand" href="<%=request.getContextPath() %>/index1.jsp">
            	<img src="<%=request.getContextPath() %>/assets/img/index/logo2.png" width="249px" height="46.5px">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".navbar-ex1-collapse" aria-controls="navbar-ex1-collapse" aria-expanded="false" aria-label="Toggle navigation">
              <span class="fa fa-bars"></span>
            </button>
            <!-- Collect the nav links, forms, and other content for toggling -->
             <div class="collapse navbar-collapse navbar-ex1-collapse">
              <ul class="nav navbar-nav ml-auto">
               <li class="nav-item dropdown megaDropMenu ">
                  <a href="<%=request.getContextPath()%>/index1.jsp" class="dropdown-toggle nav-link" data-hover="dropdown" data-delay="300" data-close-others="true" aria-expanded="false" style="font-size:16px;">首頁</b></a>             
                </li>
                <li class="nav-item dropdown megaDropMenu ">
                  <a href="<%=request.getContextPath()%>/shop_product/shop.jsp" class="dropdown-toggle nav-link" data-hover="dropdown" data-delay="300" data-close-others="true" aria-expanded="false" style="font-size:16px;">購物商城</b></a>             
                </li>
       			<li class="nav-item dropdown megaDropMenu ">
                  <a href="<%=request.getContextPath()%>/front_end/changeindex.jsp" class="dropdown-toggle nav-link" data-hover="dropdown" data-delay="300" data-close-others="true" aria-expanded="false" style="font-size:16px;">玩具交換</b></a>             
                </li>
                 <li class="nav-item dropdown megaDropMenu ">
                  <a href="<%=request.getContextPath()%>/bid_front_end/BidHome.jsp" class="dropdown-toggle nav-link" data-hover="dropdown" data-delay="300" data-close-others="true" aria-expanded="false" style="font-size:16px;">玩具競標</b></a>             
                </li>
                <li class="nav-item dropdown megaDropMenu ">
                  <a href="<%=request.getContextPath()%>/bp-front/listallbp.jsp" class="dropdown-toggle nav-link" data-hover="dropdown" data-delay="300" data-close-others="true" aria-expanded="false" style="font-size:16px;">玩具直購</b></a>             
                </li>
                <li class="nav-item dropdown megaDropMenu ">
                  <a href="<%=request.getContextPath()%>/fm-front/fmarticle.jsp" class="dropdown-toggle nav-link" data-hover="dropdown" data-delay="300" data-close-others="true" aria-expanded="false" style="font-size:16px;">論壇</b></a>             
                </li>
              </ul>
            </div>
           
          </div>
        </nav>
      </div>
      <!-- LOGIN MODAL -->
	
		
		<!-- SEND EMAIL MODAL -->
		<div class="modal fade " id="email" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header justify-content-center">
						<button type="button" id="close2" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h3 class="modal-title"><b>忘記密碼</b></h3>
					</div>
					<div class="modal-body">
						<form action="<%=request.getContextPath() %>/Front-mem/mem.do" method="POST" enctype="multipart/form-data" role="form">
							<div class="form-group">
								<label for=""><b>發送驗證信</b></label>
								<input id="PWD_Mem_email" type="email" name="mem_email" class="form-control" placeholder="請輸入您註冊的E-MAIL">
							</div>
							<button id="PwdSendBtn" type="button" class="btn btn-primary btn-block" style="color:black;">確認發送</button>
							<button type="button" class="btn btn-link btn-block">New User?</button>
							<input type="hidden" name="action" value="forgetPWD">
						</form>
					</div>
				</div>
			</div>
		</div>


</div>
</div>


		<div class="modal fade login-modal" id="login" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header justify-content-center">
						<h3 class="modal-title">會員登入</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>	
					<div class="modal-body">
						<form ACTION="<%=request.getContextPath()%>/Front-mem/mem.do" enctype="multipart/form-data" method="POST" role="form">
							<div class="form-group">
								<label for="">帳號</label>
								<input name="mem_account"type="text" class="form-control">
							</div>
							<div class="form-group">
								<label for="">密碼</label>
								<input name="mem_pwd"type="password" class="form-control">
							</div>
							<div class="checkbox">
								<input id="checkbox-1" class="checkbox-custom form-check-input" name="checkbox-1" type="checkbox" checked>
								<label for="checkbox-1" class="checkbox-custom-label form-check-label">Remember me</label>
							</div>
							  <input type="hidden" name="url" value="<%=request.getRequestURI()%>?${bpVO.bp_no}">
							<button type="submit" class="btn btn-primary btn-block">登入</button>
							<button type="button" class="btn btn-link btn-block">Forgot Password?</button>
							<input type="hidden" name="action" value="memLogin">
						</form>
					</div>
				</div>
			</div>
		</div>
  <input type="hidden" name="url" value="<%=request.getRequestURI()%>?${bpVO.bp_no}"> 
      <section class="mainContent clearfix" style="padding:30px 0 50px 0">
        <div class="container">
          <div class="row singleProduct">
            <div class="col-md-12">
              <div class="media flex-wrap mb-5">
                <div class="media-left productSlider" style="width:450px; padding-right:0px ; margin-right:10px">
                  <div id="carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner SingleProductItem">
                    
                      <div class="carousel-item active productImage SingleProductImage" data-thumb="0">
                        <img src="<%=request.getContextPath()%>/bp-front/DBG?bp_no=${bpVO.bp_no}&image_column=bp_pic1" width="430" height="400">
                        <a data-fancybox="images" href="<%=request.getContextPath()%>/bp-front/DBG?bp_no=${bpVO.bp_no}&image_column=bp_pic1" class="product-content">
                        </a>
                      </div>

                      <div class="carousel-item SingleProductImage" data-thumb="1">
                        <img src="<%=request.getContextPath()%>/bp-front/DBG?bp_no=${bpVO.bp_no}&image_column=bp_pic2" width="430" height="400">
                        <a data-fancybox="images" href="<%=request.getContextPath()%>/bp-front/DBG?bp_no=${bpVO.bp_no}&image_column=bp_pic2" class="product-content">
                        </a>
                      </div>

                    </div>
                  </div>
 				<jsp:useBean id="bptrSvc" scope="page" class="com.bptrack.model.BptrService"/>	
                  <div class="clearfix">
                    <div id="thumbcarousel" class="carousel slide" data-interval="false">
                      <div class="carousel-inner">
                          <div data-target="#carousel" data-slide-to="0" class="thumb"><img class="do" src="<%=request.getContextPath()%>/bp-front/DBG?bp_no=${bpVO.bp_no}&image_column=bp_pic1"></div>
                          <div data-target="#carousel" data-slide-to="1" class="thumb"><img class="do" src="<%=request.getContextPath()%>/bp-front/DBG?bp_no=${bpVO.bp_no}&image_column=bp_pic2"></div>
                      </div>
                      <a class="left carousel-control" href="#thumbcarousel" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                      </a>
                      <a class="right carousel-control" href="#thumbcarousel" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                      </a>
                    </div>
                  </div>
                </div>
                <div class="media-body" style="margin:5px">
                  <ul class="list-inline" style="margin:0 0 15px 0">
                    <li class="mb-4 mb-md-0">
                   <c:if test="${bpVO.mem_no != memVO.mem_no}">
                	<c:choose>
					 <c:when test="${bptrSvc.findonememtr(memVO.mem_no,bpVO.bp_no).bp_no == bpVO.bp_no}">	 
					 	<button id="add" style="width:100px ;height: 30px; font-size: 13px">
	                    <i id="show" class="fa fa-check-square" aria-hidden="true">商品已追蹤</i>
	                    <i id="add" class="fa fa-plus" aria-hidden="true" style="display:none">追蹤商品</i>
	                   	</button>			
				   	 </c:when>

				   	 <c:otherwise>
				   	   	<button id="add" style="width:100px ; height: 30px; font-size: 13px">
	                   	<i id="add" class="fa fa-plus" aria-hidden="true">追蹤商品</i>
	                   	<i id="show" class="fa fa-check-square" aria-hidden="true" style="display:none">商品已追蹤</i>
	                    </button>
				   	 </c:otherwise>
					 </c:choose>
	                </c:if>	

                  </ul>
                  
                  <h6 style="margin:0 0 15px 0">商品狀況:${bpVO.bp_new}</h6>

                  <h3 style="color:black;margin:0 0 15px 0 ; word-break:break-word">${bpVO.bp_head}</h3>

                  <h3 style="color:red;margin:0 0 15px 0">${bpVO.bp_pri}</h3>

                  <p style="margin:0 0 15px 0 ">
                  	上架時間<fmt:formatDate value="${bpVO.bp_upt}" pattern="yyyy-MM-dd EEE"/><br>
                 	<c:if test="${bpVO.bp_dot != null}">
                 	下架時間<fmt:formatDate value="${bpVO.bp_dot}" pattern="yyyy-MM-dd EEE"/><br>
                 	</c:if>
                  </p>
					<c:if test="${memVO.mem_no != bpVO.mem_no}">
				     <c:choose>
					 <c:when test="${bpVO.bpst_no.equals(\"上架\")}">
						     <div class="btn-area mb" style="margin-bottom:15px">
				                 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/bp-front/BpServlet" enctype="multipart/form-data">
				                 <input type="hidden" name="mem_no" value="${memVO.mem_no}">
				                 <input type="hidden" name="bp_no" value="${bpVO.bp_no}">
								 <input type="hidden" name="action" value="Subscript">
								 <input type="submit" class="btn btn-default" style="color:black; background:#FFB548 ; border:#FFB548 ;border-radius: 15px ; width: 200px;font-size: 22px" value="下&nbsp&nbsp&nbsp&nbsp標"><br>
								 </FORM>
								</div> 
				   	 </c:when>
				   	  <c:when test="${bpVO.bpst_no.equals(\"審核中\")}">
						     <div class="btn-area mb" style="margin-bottom:15px">
	
				               <input type="submit" class="btn btn-default" style="color:black; background:#FFB548 ; border:#FFB548 ; border-radius: 15px ; width: 200px;font-size: 22px" value="<%=(bpVO.getBpst_no().equals("審核中"))?"商品審核中":""%>">	<br> 
				             </div>
				   	 </c:when>
					 <c:otherwise>
					 		<div class="btn-area mb" style="margin-bottom:15px">
				               
				               <input type="submit" class="btn btn-default" style="color:black; background:#FFB548 ; border:#FFB548 ; border-radius: 15px ; width: 200px;font-size: 22px" value="<%=(bpVO.getBpst_no().equals("下架"))?"商品已經下架":"已&nbsp售&nbsp出"%>"><br> 
				            </div>
					 </c:otherwise>
					 </c:choose>
					 
				<c:if test="${memVO != null}">
					<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">檢舉</button>					
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content" style="border-radius: 15px">
						      <div class="modal-header" style="padding:15px 15px 0px 15px">
						        <h3 class="modal-title" id="exampleModalLabel" style="color:black;margin:0px 0px">檢舉內容</h3>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						   
						      <div class="form-group">
						        <label for="recipient-name" class="col-form-label" style="color:black;font-size:18px">檢舉類別:</label>
						        <select  class="form-control" id="recipient-name" name="bprp_project" style="border:2px solid #FFB548  ; margin-bottom:8px ; color:black;font-size:16px ; font-weight: bold">
						            <option value="上架不實">上架不實</option>
									<option value="交易糾紛">交易糾紛</option>
									<option value="賣家青番">賣家青番</option>				            
						         </select>
						      </div>
						      <div class="form-group">
						           <label for="message-text" class="col-form-label" style="color:black;font-size:18px">檢舉內容:</label>
						           <textarea  class="form-control" id="message-text" placeholder="請留下檢舉內文" name="bprp_text" style="height:100px ; resize:none ; border:2px solid #FFB548  ; margin-bottom:0;color:black;font-size:16px ; font-weight: bold "></textarea>
						      </div>
						      <div class="modal-footer" style="padding:0px 12px">
						        <button id="1" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						        <input type="hidden" name="mem_no" value="${memVO.mem_no}">
						        <input type="hidden" name="bp_no" value="${bpVO.bp_no}">
						        <input type="hidden" name="action" value="BpServlet">
								<input	type="hidden" name="action" value="insertreport">
						        <button id="2" type="button" class="btn btn-secondary" data-dismiss="modal" style="background:#FFB548 ">送出檢舉</button>
						      </div>
						    </div>
						  </div>
						</div>
						</div>
						<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
						
						<br>
						<button id="btn" style="width:100px;height:25px;font-size:16px;margin-top:15px" value="${memSvc.memSelectByPk(bpVO.mem_no).mem_account}">聯絡賣家</button>
						<span id="toFriend" style="display:none">${memSvc.memSelectByPk(bpVO.mem_no).mem_account}</span>
						<span id="toFriendName" style="display:none">${memSvc.memSelectByPk(bpVO.mem_no).mem_name}</span>
						
					</c:if>
					</c:if>
					<c:if test="${memVO == null}">
					<br><button type="button" class="btn btn-secondary" data-dismiss="modal">檢舉請先登入</button>
					</c:if>
					
                  </div> 
                  <div class="display" style="margin:7px">
					      <div id="map"></div>
				  </div>
                </div>	
         	
  
          <div class="row singleProduct singleProductTab">
            <div class="col-12">
              <div class="media mb-4">
                <div class="media-body">
                  <div class="tabArea">
                    <ul class="nav nav-tabs bar-tabs">
                      <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#OurDetails" style="font-size:24px;    border-radius: 15px 15px 0 0;">商品細節</a></li>
                      <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#OurSizing" style="font-size:24px;    border-radius: 15px 15px 0 0;">問與答</a></li>
                    </ul>
                    <div class="tab-content">
                      <div id="OurDetails" class="tab-pane fade show active" >
                        <p style="color:black ;font-size: 20px;">${bpVO.bp_text}</p>
                        <ul class="list-unstyled" >
                          <li style="color:black ;font-size: 19px;letter-spacing: 1.7px">物品地點:${bpVO.bp_loc}</li>
                          <li style="color:black ;font-size: 19px;letter-spacing: 1.5px">運送方式:${bpVO.bp_del}</li>
                          <li style="color:black ;font-size: 19px;letter-spacing: 1.5px">賣家編號:${bpVO.mem_no}</li>
                          <li style="color:black ;font-size: 19px;letter-spacing: 1.5px">商品編號:${bpVO.bp_no}</li>
                        </ul>
                      </div>
                      
                      <div id="OurSizing" class="tab-pane fade">
                        <div class="SingleCartListWrapper SingleCartSizing">
                          <div class="cartListInner">
                            <div class="table-responsive">
                              <table class="table">
                           		<jsp:useBean id="bpmeSvc" scope="page" class="com.bpmessage.model.BpmeService" />
									<c:choose>
									<c:when test="${memVO.mem_no != bpVO.mem_no}">
													<div >
														<div class="view">
														<c:forEach var="bpmeVO"
																items="${bpmeSvc.findBybp_no(bpVO.bp_no)}">
																<div class="try">
																	<div class="q1"></div><span>發問會員:</span><span class="q5">${bpmeVO.qmem_no}</span>
																	<div class="q2">內容:${bpmeVO.qbpme_text}</div>
																	<div class="q3"><strong style="font-size: 18px;font-weight:500;font-family:微軟正黑體;background: rgb(255 237 212 / 95%);margin-bottom:0px !important">賣家回答:${(bpmeVO.bpme_text == null)?"請耐心等待賣家回答":bpmeVO.bpme_text}</strong></div>
																</div>
															</c:forEach>
														</div>	
														<c:choose>
														    <c:when test="${memVO != null}">
														    	<div class="quest">		
																	提出問題<br>
																	<textarea id="qbpme_text" style="width: 500px; height: 100px;resize:none;border:solid 2px black ;"name="qbpme_text" placeholder="請留下問題"></textarea>
																	<input  type="hidden" name="qmem_no"value="${memVO.mem_no}">
																	<input  type="hidden"name="bp_no" value="<%=bpVO.getBp_no()%>">
																	<input	type="hidden" name="mem_no"	value="<%=bpVO.getMem_no()%>">
																	<input type="hidden" name="action" value="BpServlet">
																	<input	type="hidden" name="action" value="question">
																	<br>
																	<button id="quest" style="width: 150px;height: 40px; background: #e21c00; color: white;font-size: 18px;font-family: 微軟正黑體;margin-right:100px">送出留言</button>
																	<button id="clean" style="width: 150px;height: 40px; background: white; color: black;font-size: 18px;font-family: 微軟正黑體;margin-left:100px">重新填寫</button>
																</div>
														    </c:when>
														    <c:otherwise>
														    	<div class="quest">	
														  			提出問題<br><textarea  disabled id="qbpme_text" style="width: 500px; height: 100px;resize:none;"name="qbpme_text" placeholder="請先登入再使用留言功能" >請先登入再使用留言功能</textarea>
																</div>																    
														    </c:otherwise>
														</c:choose>						
													</div>	 
			
													</c:when>
													<c:otherwise>
														<c:forEach var="bpmeVO"
															items="${bpmeSvc.findBybp_no(bpVO.bp_no)}">
															<div class="try">
																	<div class="q1"></div><span>發問會員:</span><span class="q5">${bpmeVO.qmem_no}</span>
																	<div class="q2">內容:${bpmeVO.qbpme_text}</div>
																<div class="q3"><strong style="font-size: 18px;font-weight:500;font-family:微軟正黑體;background: rgb(255 237 212 / 95%);margin-bottom:0px !important">賣家回答:${(bpmeVO.bpme_text == null)?"請耐心等待賣家回答":bpmeVO.bpme_text}</strong>									
																	<c:choose>
																    <c:when test="${bpmeVO.bpme_text == null}">
																<div class="respon">													
																	<input type="text" name="bpme_text" style="border-radius: 5px">
																	<input type="hidden" name="bpme_no"value="${bpmeVO.bpme_no}">
																	<input type="hidden" name="bp_no"  value="<%=bpVO.getBp_no()%>">																
																	<input type="hidden" name="action" value="BpServlet">
																	<input type="hidden" name="action" value="reply">
																	<button style="width:100px">送出回應</button>										
																</div>
																    </c:when>
																    <c:otherwise>
																   
																    </c:otherwise>
																</c:choose>	
																</div>	
															</div>
														</c:forEach>
													</c:otherwise>
											</c:choose>						
								</table>
                            </div>
                          </div>
                        </div>
                      </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          </div>
               </div>
            </div>
          </div>
		</section>
<%@ include file="/assets/footer.jsp" %>
<%@ include file="/bp-front/chat.jsp" %>

		<script src="<%=request.getContextPath()%>/assets/plugins/jquery/jquery.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/plugins/jquery/jquery-migrate-3.0.0.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/plugins/jquery-ui/jquery-ui.js"></script>
		<script src="<%=request.getContextPath()%>/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/plugins/slick/slick.js"></script>
		<script src="<%=request.getContextPath()%>/assets/plugins/fancybox/jquery.fancybox.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/plugins/iziToast/js/iziToast.js"></script>
		<script src="<%=request.getContextPath()%>/assets/plugins/prismjs/prism.js"></script>
		<script src="<%=request.getContextPath()%>/assets/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/plugins/countdown/jquery.syotimer.js"></script>
		<script src="<%=request.getContextPath()%>/assets/plugins/velocity/velocity.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/plugins/rateyo/jquery.rateyo.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/js/custom.js"></script>
		
		<!-- 		MemChat -->
		<jsp:include page="/assets/memChat3.jsp" flush="true"/>
		<script>
		 $(document).ready(function(){
			$("#fgbtn").click(function(){
				$("#login").css("display","none");
// 				$(".modal-backdrop .fade .show").remove();
				$("#close1").click();
				$("#fgbtn").click();
			})
				
			
		 	$("#PwdSendBtn").click(function(){
		 		if($("#PwdSendBtn").text()!=="確認"){
			 		$.ajax({
						url: "<%=request.getContextPath()%>/MemAjax.do",
						type: 'post',
						dataType: 'json',
						data: {
							'action': 'forgetPWD',
							'mem_email': $('#PWD_Mem_email').val(),
						},
						success: function(data) {
							swal('郵件發送成功！', '請去電子信相確認！', 'success');
							$("#PwdSendBtn").text("確認");
							$("#close2").click();
						},
						error: function(){swal("錯誤", "發送失敗", "error");}
						
					});
		 		}
		 	});
		 })
		</script>
		
		<script>
			$(document).ready(function(){
				
				$(".respon>:button").click(function(){
				 
					
					if($(this).prev().prev().prev().prev().prev().val().trim().length==0){
						Swal.fire({
							  position: 'center',
							  icon: 'error',
							  title: '請輸入回復內容',
							  showConfirmButton: false,
							  timer: 1500
							})
					}else{
					let data = {};
					let message = $(this).parent().children();
					let pre = $(this).parent().prev();
					
					data.action = message[4].value;
					url = message[3].value;
					data.bp_no = message[2].value;
					data.bpme_no = message[1].value;
					data.bpme_text = message[0].value;
					
					$(this).hide();
					message.eq(0).hide();
					
					message[0].style.display = 'none';
					pre.empty();
					pre.text('賣家回答:'+data.bpme_text);
					
					$.ajax({
						url: url,
						type:"POST",
						data:data,
						success:function(){
							Swal.fire({
								  position: 'center',
								  icon: 'success',
								  title: '留言回覆成功',
								  showConfirmButton: false,
								  timer: 1500
								})
						}
					});
					}
				});
			$("#qbpme_text").keypress(function(){
				
				if(event.keyCode==13){
					if($(this).val().trim().length==0){
						Swal.fire({
							  position: 'center',
							  icon: 'error',
							  title: '請輸入留言內容',
							  showConfirmButton: false,
							  timer: 1500
							})
					}else{
						let data1 = {};
						let me = $(this).parent().children();
						data1.action = me[6].value;
						url = me[5].value;
						data1.mem_no = me[4].value;
						data1.bp_no = me[3].value;
						data1.qmem_no = me[2].value;
						data1.qbpme_text = me[1].value.trim();;					

						
						let ppr = $(this).parent().parent();
						ppr.prepend(`<div class="try">
								<div class="q1"></div><span>發問會員:</span><span class="q5">`+data1.qmem_no+`</span>
								<div class="q2">內容:`+data1.qbpme_text+`</div>
								<div class="q3"><strong style="font-size: 18px;font-weight:500;font-family:微軟正黑體;background: rgb(255 237 212 / 95%);margin-bottom:0px !important">賣家回答:${(bpmeVO.bpme_text == null)?"請耐心等待賣家回答":bpmeVO.bpme_text}</strong></div>
							</div>`);
						$("#qbpme_text").val('');
						
						$.ajax({
							url : url,
							type : "POST",
							data : data1,
							success : function(ga) {
								if(ga.length==0){
									Swal.fire({
										  position: 'center',
										  icon: 'success',
										  title: '留言成功',
										  showConfirmButton: false,
										  timer: 1500
										})
									
								}else{
									Swal.fire({
										  position: 'center',
										  icon: 'error',
										  title:ga,
										  showConfirmButton: false,
										  timer: 1500
										})
								}		
								
							}
						});
						
					}
				}
			
			});
			
			$("#clean").click(function(){
				$("#qbpme_text").val('');
			});
			
			
			
			$("#quest").click(function() {
				
					let data1 = {};
					let me = $(this).parent().children();
					data1.action = me[6].value;
					url = me[5].value;
					data1.mem_no = me[4].value;
					data1.bp_no = me[3].value;
					data1.qmem_no = me[2].value;
					data1.qbpme_text = me[1].value.trim();

					
					if(data1.qbpme_text != ''){
						let ppr = $(this).parent().parent();
						ppr.prepend(`<div class="try">
							<div class="q1"></div><span>發問會員:</span><span class="q5">`+data1.qmem_no+`</span>
							<div class="q2">內容:`+data1.qbpme_text+`</div>
							<div class="q3"><strong style="font-size: 18px;font-weight:500;font-family:微軟正黑體;background: rgb(255 237 212 / 95%);margin-bottom:0px !important">賣家回答:${(bpmeVO.bpme_text == null)?"請耐心等待賣家回答":bpmeVO.bpme_text}</strong></div>
						</div>`);
					
					
					$("#qbpme_text").val('');
					}
					
					$.ajax({
						url : url,
						type : "POST",
						data : data1,
						success : function(ga) {
							if(ga.length==0){
								Swal.fire({
									  position: 'center',
									  icon: 'success',
									  title: '留言成功',
									  showConfirmButton: false,
									  timer: 1500
									})
								
							}else{
								Swal.fire({
									  position: 'center',
									  icon: 'error',
									  title:ga,
									  showConfirmButton: false,
									  timer: 1500
									})
							}		
						}
					});
				});

			$(".modal-footer>#2").click(function() {
				let data1 = {};
				
				data1.action = $(this).prev().val();
				url = $(this).prev().prev().val();
				data1.bp_no = $(this).prev().prev().prev().val();
				data1.mem_no =$(this).prev().prev().prev().prev().val();
				data1.bprp_text = $("#message-text").val();
				data1.bprp_project = $("select#recipient-name").val();
				
				$.ajax({
					url : url,
					type : "POST",
					data : data1,
					success : function(ga) {
						if(ga.length==0){
							$("#message-text").val("");
							Swal.fire({
								  position: 'center',
								  icon: 'success',
								  title: '檢舉已經成功送出',
								  showConfirmButton: false,
								  timer: 1500
								});
						}else{
							Swal.fire({
								  position: 'center',
								  icon: 'error',
								  title:ga,
								  showConfirmButton: false,
								  timer: 1500
								});
						}		
					}
				});
			});
			
			$("i#add").click(function(){
				console.log('reigjreigjoireg');
				let data1 = {};

				data1.action = 'addtr';
			
				url = 'BpServlet';
		
				data1.bp_no = '${bpVO.bp_no}';

				data1.mem_no = '${memVO.mem_no}';
				
				console.log(data1)
				$.ajax({
					url :url,
					type :"POST" ,
					data :data1 , 
					success : function(e) {
						if(e.length==0){
							$("i#add").hide(500);
							$("i#show").show(500);
							Swal.fire({
								  position: 'center',
								  icon: 'success',
								  title: '追蹤成功',
								  showConfirmButton: false,
								  timer: 1500
								});
							
						}else{
							Swal.fire({
								  position: 'center',
								  icon: 'error',
								  title:e,
								  showConfirmButton: false,
								  timer: 1500
								});
						}	
					}
				});
				
			});
			
			$("i#show").click(function(){
				console.log('reigjreigjoireg');
				let data1 = {};

				data1.action = 'deletebptr';
			
				url = 'BpServlet';
		
				data1.bp_no = '${bpVO.bp_no}';

				data1.mem_no = '${memVO.mem_no}';
				
				console.log(data1)
				
				$.ajax({
					url :url,
					type :"POST" ,
					data :data1 , 
					success : function(e) {
							$("i#show").hide(500);
							$("i#add").show(500);
							Swal.fire({
								  position: 'center',
								  icon: 'info',
								  title: '已取消追蹤',
								  showConfirmButton: false,
								  timer: 1500
								});
					}
				});
			});
			
		});
			
		</script>
		 <script>
		
		 
	     if('${bpVO.lat}'!=''){
	    	var map;
	        // 地圖座標
	        var data = [
	        	
	            { lat:${(bpVO.lat==null)?'1':bpVO.lat}, lng: ${(bpVO.lng==null)?'1':bpVO.lng}, title:'${bpVO.bp_head}',loc:'${bpVO.bp_loc}'}
	        ];

	        // 循環設定座標
	        function point() {
	            for (var i = 0; i < data.length; i++) {
	                generateMarkers(data[i]); // // 使用 function 將 var 宣告出來的變數鎖在 local scope
	            }
	        }

	        // 設定座標
	        function generateMarkers(datum) {
	            // 產生 marker 物件
	            var marker = new google.maps.Marker({
	                position: { lat: datum.lat, lng: datum.lng },
	                map: map,
	                animation: google.maps.Animation.DROP, // DROP掉下來、BOUNCE一直彈跳
	                draggable: false // true、false可否拖拉
	            });
	            // 產生 infowindow 物件
	            var infowindow = new google.maps.InfoWindow({
	                content: '<div class="info_title">' + datum.title + '</div>'+'<div class="info_title">' + datum.loc + '</div>'
	            });
	            // 預設打開 info window
	            infowindow.open(map, marker);
	            // 當 marker 被點擊時觸發
	            marker.addListener('click', function() {
	                infowindow.open(map, marker);
	            });
	        }

	        // 初始化地圖
	        function initMap() {
	            // 地圖預設中心點
	            let location = {
	                lat:${bpVO.lat} , // 經度
	                lng:${bpVO.lng} // 緯度
	            };
	            map = new google.maps.Map(document.getElementById('map'), {
	                center: location,
	                zoom: 15,
	                mapTypeId: 'terrain'
	            });

	            // 地圖的座標點 有則中心位置改變
	            if(data.length) {
	                point();
	            }
	        }       
	        window.onload = initMap;
	     }else{
	    	console.log("88888"); 
	    	 
	     }
	        
	        
	        
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBcTdgBEb7zc8YkmlQnZ3YF23sC7iawWJg&callback=initMap" async defer></script>
		
	</body>
</html>
     