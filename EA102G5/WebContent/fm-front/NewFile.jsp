<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.fmarticle.model.*"%>
<%@ page import="com.mem.model.*"%>
<%
fmarticleVO fmarticleVO = (fmarticleVO) request.getAttribute("fmarticleVO");
if(fmarticleVO != null){
	
}else{
String fm_no =  request.getQueryString();
// String fm_no = "1001";

fmarticleService fmsvc =new fmarticleService();
fmarticleVO = fmsvc.getOne(fm_no);
pageContext.setAttribute("fmarticleVO", fmarticleVO);
}
%>


<jsp:useBean id="fmclassSvc" scope="page" class="com.fmclass.model.fmclassService" />
<!DOCTYPE html>
<html lang="zh_TW">
  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>論壇</title>
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
    <link href="assets/css/style.css" rel="stylesheet">
<!--     <link rel="stylesheet" href="assets/css/color-option2.css" id="option_style"> -->
    <link rel="shortcut icon" href="assets/img/favicon.png">
    <link rel="stylesheet" href="assets/css/joe_footer.css" >
    <link rel="shortcut icon" href="./assets/img/favicon.png">
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
	background-color: #47bac1; ;
    opacity: 0;
    transition: all 0.3s ease-in-out;
}

div.try {
    border: 1px double gray;
    width: 100%;
    height: 100%;
    background-color: white;
    margin-bottom: 15px;
    padding: 15px;
    font-size: 16px;
    font-weight: bold;
    line-height: 25px;
    border-radius: 25px;
}
*{
 font-family: 微軟正黑體;
}
h4 {
    font-family: 微軟正黑體;
    font-size: 200px;
}
.modal-content .form-control{
border-radius: 15px !important;
}
button{
border-radius: 15px !important;
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




</style>
</head>

  <body id="body" class="body-wrapper version1 up-scroll">


<%
 MemVO memVO = (MemVO) session.getAttribute("memVO");
%>

<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:orange">${message}</li>
		</c:forEach>
	</ul>
</c:if>

 <!-- header以下 -->
    <div class="main-wrapper" style="overflow:visible;">
    <div class="header clearfix">
   			<c:choose>
		<c:when test="${memVO.mem_no==null}">
			<div class="topBar">
				<div class="container">
					<div class="row">
						<div class="col-md-6 d-none d-md-block"></div>
						<div class="col-md-6 col-12">
							<ul class="list-inline float-right top-right">
								<li class="account-login"> <span><a
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
													<img id="tpMemPic"class="media-left media-object" height="80px"
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
													onclick="location.href='<%=request.getContextPath() %>/index1.jsp';">返回首頁</button>
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
        <nav class="navbar navbar-main navbar-default navbar-expand-md " role="navigation" >
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
		<div class="modal fade login-modal" id="login" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header justify-content-center">
						<button type="button" id="close1"class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h3 class="modal-title">會員登入</h3>
					</div>
					<div class="modal-body">
						<form ACTION="<%= request.getContextPath() %>/Front-mem/mem.do" enctype="multipart/form-data" method="POST" role="form">
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
							<input type="hidden" name="url" value="<%=request.getRequestURI()%>?${fmarticleVO.fm_no}">
							<button type="submit" class="btn btn-primary btn-block">登入</button>
							<button id="fgbtn" type="button" class="btn btn-link btn-block" ><a data-toggle="modal" href='#email' style="color:blue;"><em><u>忘記密碼?</u></em></a></button>
							 <input type="hidden" name="action" value="memLogin">
						</form>
					</div>
				</div>
			</div>
		</div>
		
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
  <!-- header以上  -->
  
  <!-- LIGHT SECTION -->
      <section class="lightSection clearfix pageHeader">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <div class="page-title">
                <h2>論壇</h2>
              </div>
            </div>
            <div class="col-md-6">
              <ol class="breadcrumb pull-right">
                <li>
                  <a href="myfm.jsp" style="font-size:16px;font-weight:bold;">我的文章</a>
                <li class="active">
                <a href="fmarticle.jsp" style="font-size:16px;font-weight:bold;">討論區</a></li>
              </ol>
            </div>
          </div>
        </div>
      </section>
  
  
				<div style="text-align:center;">
				<br></br>
				<h1>${fmarticleVO.fm_head}</h1>
				</div>
				<h1 style="margin-bottom:0px">　　　　　</h1>
<!--       <section class="mainContent clearfix"> -->
        <div class="container">
          <div class="row singleProduct">
            <div class="col-md-12">
              <div class="media flex-wrap mb-10" style="margin-bottom:5px;">
                <div class="media-left productSlider" style="width:629px;height:850px;">
                  <div id="carousel" class="carousel slide" data-ride="carousel">
<!--                     <div class="carousel-inner SingleProductItem"> -->
                    <div style="margin-bottom:8px">
<!--                       <div class="carousel-item active productImage SingleProductImage" data-thumb="0"> -->
                        <img src="<%=request.getContextPath()%>/fm-front/DBGG?fm_no=${fmarticleVO.fm_no}&image_column=fm_pic1" width="500" height="400">
                        <a data-fancybox="images" href="<%=request.getContextPath()%>/fm-front/DBGG?fm_no=${fmarticleVO.fm_no}&image_column=fm_pic1" class="product-content">
                        </a>
                        </div>
<!--                       </div> -->
<!--                       <h1 style="margin-bottom:0px">　　　　　</h1> -->
<!--                       <font size="3">                  </font> -->
<!-- 						<div class="carousel-inner SingleProductItem"> -->
<!--                       <div class="carousel-item SingleProductImage" data-thumb="1"> -->
                        <img src="<%=request.getContextPath()%>/fm-front/DBGG?fm_no=${fmarticleVO.fm_no}&image_column=fm_pic2" width="500" height="400">
                        <a data-fancybox="images" href="<%=request.getContextPath()%>/fm-front/DBGG?fm_no=${fmarticleVO.fm_no}&image_column=fm_pic2" class="product-content">
                        </a>
                      </div>

<!--                     </div> -->
                  </div>
                  
                  
        
<%--  				<jsp:useBean id="bptrSvc" scope="page" class="com.bptrack.model.BptrService"/>	 --%>
<!--                   <div class="clearfix"> -->
<!--                     <div id="thumbcarousel" class="carousel slide" data-interval="false"> -->
<!--                       <div class="carousel-inner"> -->
<%--                           <div data-target="#carousel" data-slide-to="0" class="thumb"><img class="do" src="<%=request.getContextPath()%>/fm-front/DBGG?bp_no=${bpVO.bp_no}&image_column=bp_pic1"></div> --%>
<%--                           <div data-target="#carousel" data-slide-to="2" class="thumb"><img class="do" src="<%=request.getContextPath()%>/fm-front/DBGG?bp_no=${bpVO.bp_no}&image_column=bp_pic2"></div> --%>
<!--                       </div> -->
<!--                       <a class="left carousel-control" href="#thumbcarousel" role="button" data-slide="prev"> -->
<!--                         <span class="glyphicon glyphicon-chevron-left"></span> -->
<!--                       </a> -->
<!--                       <a class="right carousel-control" href="#thumbcarousel" role="button" data-slide="next"> -->
<!--                         <span class="glyphicon glyphicon-chevron-right"></span> -->
<!--                       </a> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--                 <div class="media-body"> -->
<!--                   <ul class="list-inline" style="margin:0 0 15px 0"> -->
<!--                     <li class="mb-4 mb-md-0"> -->
<%--                    <c:if test="${bpVO.mem_no != memVO.mem_no}"> --%>
<%--                 	<c:choose> --%>
<%-- 					 <c:when test="${bptrSvc.findonememtr(memVO.mem_no,bpVO.bp_no).bp_no == bpVO.bp_no}">	  --%>
<!-- 					 	<button id="add" style="width:100px"> -->
<!-- 	                    <i id="show" class="fa fa-check-square" aria-hidden="true">商品已追蹤</i> -->
<!-- 	                    <i id="add" class="fa fa-plus" aria-hidden="true" style="display:none">追蹤商品</i> -->
<!-- 	                   	</button>			 -->
<%-- 				   	 </c:when> --%>

<%-- 				   	 <c:otherwise> --%>
<!-- 				   	   	<button id="add" style="width:100px"> -->
<!-- 	                   	<i id="add" class="fa fa-plus" aria-hidden="true">追蹤商品</i> -->
<!-- 	                   	<i id="show" class="fa fa-check-square" aria-hidden="true" style="display:none">商品已追蹤</i> -->
<!-- 	                    </button> -->
<%-- 				   	 </c:otherwise> --%>
<%-- 					 </c:choose> --%>
<%-- 	                </c:if>	 --%>

<!--                   </ul> -->
                  
<%--                   <h6 style="margin:0 0 15px 0">商品狀況:${bpVO.bp_new}</h6> --%>

<%--                   <h2 style="margin:0 0 15px 0">${bpVO.bp_head}</h2> --%>

<%--                   <h3 style="margin:0 0 15px 0">${bpVO.bp_pri}</h3> --%>
					
					 <div class="col-lg-4 col-md-12 sideBar">
<!--               <div class="input-group"> -->
<!--                 <input type="text" class="form-control" placeholder="Search" aria-describedby="basic-addon2"> -->
<!--                 <a href="#" class="input-group-addon" id="basic-addon2"><i class="fa fa-search"></i></a> -->
<!--               </div> -->


			 <div class="aaccbb" >
                  <p style="margin:0 0 15px 0 ">
<%--                   <fmt:formatDate value="${bpVO.bp_upt}" pattern="yyyy-MM-dd EEE"/><br> --%>
					<h2>　　　　　  </h2>
					<font size="4">  </font>
					<font size="4px" color="gray">版主編號: ${fmarticleVO.mem_no}</font>
					<br></br>
					<font size="4" color="gray">刊登日期: <fmt:formatDate value="${fmarticleVO.fm_ti}" pattern="yyyy-MM-dd EEE"/></font>
					<br></br>
			 </div>
              <div class="panel panel-default">
                <div class="panel-heading" style="background-color: #47bac1">categories</div>
                <div class="panel-body">
                  <ul class="list-unstyle sidebar-list">
                    <li><a href="fmarticle.jsp"><i  aria-hidden="true"></i>所有種類 <span></span></a></li>
                    <li><a href="fmarticle301.jsp"><i  aria-hidden="true"></i>電玩遊戲 <span></span></a></li>
                    <li><a href="fmarticle302.jsp"><i  aria-hidden="true"></i>玩具 <span></span></a></li>
                    <li><a href="fmarticle303.jsp"><i  aria-hidden="true"></i>各類收藏 <span></span></a></li>
                    <li><a href="fmarticle304.jsp"><i  aria-hidden="true"></i>開箱分享 <span></span></a></li>
                    <li><a href="fmarticle305.jsp"><i  aria-hidden="true"></i>其他 <span></span></a></li>
                    <li><a href="fmarticle306.jsp"><i  aria-hidden="true"></i>尋物 <span></span></a></li>
                  </ul>
                </div>
              </div>
<!--               <div class="panel panel-default recentBlogPosts" style="margin-bottom:10px"> -->
<!--                 <div class="panel-heading">recent posts</div> -->
<!--                 <div class="panel-body"> -->
<!--                   <div class="media" style="margin-bottom:5px"> -->
<!--                     <a class="media-left" href="blog-single-right-sidebar.html"> -->
<!--                        <img class="media-object" src="assets/img/blog/blog_1.png" alt="Image"> -->
<!--                     </a> -->
<!--                     <div class="media-body"> -->
<!--                       <h4 class="media-heading"><a href="blog-single-right-sidebar.html">【問題】想問問有沒有人知道這款遊戲</a></h4> -->
<!--                       <p><i class="fa fa-calendar" aria-hidden="true"></i>3 Sep, 2020</p> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                   <div class="media" style="margin-bottom:5px"> -->
<!--                     <a class="media-left" href="blog-single-right-sidebar.html"> -->
<!--                       <img class="media-object" src="assets/img/blog/blog_2.png" alt="Image"> -->
<!--                     </a> -->
<!--                     <div class="media-body"> -->
<!--                       <h4 class="media-heading"><a href="blog-single-right-sidebar.html">【閒聊】有沒人玩King of thieves盜者之王</a></h4> -->
<!--                       <p><i class="fa fa-calendar" aria-hidden="true"></i>3 Sep, 2020</p> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                   <div class="media" style="margin-bottom:5px"> -->
<!--                     <a class="media-left" href="blog-single-right-sidebar.html"> -->
<!--                       <img class="media-object" src="assets/img/blog/blog_3.png" alt="Image"> -->
<!--                     </a> -->
<!--                     <div class="media-body"> -->
<!--                       <h4 class="media-heading"><a href="blog-single-right-sidebar.html">【討論】魔性三國</a></h4> -->
<!--                       <p><i class="fa fa-calendar" aria-hidden="true"></i>3 Sep, 2020</p> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
					
					
<%-- 					會員:${fmmeVO.qmem_no} --%>
<%-- 					<h0>刊登時間  <fmt:formatDate value="${fmarticleVO.fm_ti}" pattern="yyyy-MM-dd EEE"/></h0> --%>
<%--                   	刊登時間  <fmt:formatDate value="${fmarticleVO.fm_ti}" pattern="yyyy-MM-dd EEE"/><br> --%>
<%--                  	<c:if test="${bpVO.bp_dot != null}"> --%>
<%--                  	下架時間<fmt:formatDate value="${bpVO.bp_dot}" pattern="yyyy-MM-dd EEE"/><br> --%>
<%--                  	</c:if> --%>
                  </p>
<%-- 					<c:if test="${memVO.mem_no != bpVO.mem_no}"> --%>
<%-- 				     <c:choose> --%>
<%-- 					 <c:when test="${bpVO.bpst_no.equals(\"上架\")}"> --%>
<!-- 						     <div class="btn-area mb" style="margin-bottom:15px"> -->
<%-- 				                 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/fm-front/BpServlet" enctype="multipart/form-data"> --%>
<%-- 				                 <input type="hidden" name="mem_no" value="${memVO.mem_no}"> --%>
<%-- 				                 <input type="hidden" name="bp_no" value="${bpVO.bp_no}"> --%>
<!-- 								 <input type="hidden" name="action" value="Subscript"> -->
<!-- 								 <input type="submit" class="btn btn-default" style="color:black; background:orange; border:orange ;border-radius: 15px" value="下標"><br> -->
<!-- 								 </FORM> -->
<!-- 								</div>  -->
<%-- 				   	 </c:when> --%>
<%-- 				   	  <c:when test="${bpVO.bpst_no.equals(\"審核中\")}"> --%>
<!-- 						     <div class="btn-area mb" style="margin-bottom:15px"> -->
	
<%-- 				               <input type="submit" class="btn btn-default" style="color:black; background:orange; border:orange; border-radius: 15px" value="<%=(bpVO.getBpst_no().equals("審核中"))?"商品審核中":""%>">	<br>  --%>
<!-- 				             </div> -->
<%-- 				   	 </c:when> --%>
<%-- 					 <c:otherwise> --%>
<!-- 					 		<div class="btn-area mb" style="margin-bottom:15px"> -->
				               
<%-- 				               <input type="submit" class="btn btn-default" style="color:black; background:orange; border:orange; border-radius: 15px" value="<%=(bpVO.getBpst_no().equals("下架"))?"商品已經下架":"已售出"%>"><br>  --%>
<!-- 				            </div> -->
<%-- 					 </c:otherwise> --%>
<%-- 					 </c:choose> --%>
					 
<%-- 				<c:if test="${memVO != null}"> --%>
<!-- 					<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">檢舉</button>					 -->
<!-- 						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
<!-- 						  <div class="modal-dialog"> -->
<!-- 						    <div class="modal-content" style="border-radius: 15px"> -->
<!-- 						      <div class="modal-header"> -->
<!-- 						        <h5 class="modal-title" id="exampleModalLabel">檢舉內容</h5> -->
<!-- 						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!-- 						          <span aria-hidden="true">&times;</span> -->
<!-- 						        </button> -->
<!-- 						      </div> -->
<!-- 						      <div class="modal-body"> -->
						   
<!-- 						      <div class="form-group"> -->
<!-- 						        <label for="recipient-name" class="col-form-label">檢舉類別:</label> -->
<!-- 						        <select  class="form-control" id="recipient-name" name="fmrp_project" style="border:2px solid orange ; margin-bottom:8px"> -->
<!-- 						            <option value="上架不實">上架不實</option> -->
<!-- 									<option value="交易糾紛">交易糾紛</option> -->
<!-- 									<option value="賣家青番">賣家青番</option>				             -->
<!-- 						         </select> -->
<!-- 						      </div> -->
<!-- 						      <div class="form-group"> -->
<!-- 						           <label for="message-text" class="col-form-label">檢舉內容:</label> -->
<!-- 						           <textarea  class="form-control" id="message-text" placeholder="請留下檢舉內文" name="fmrp_text" style="height:100px ; resize:none ; border:2px solid orange ; margin-bottom:0 "></textarea> -->
<!-- 						      </div> -->
<!-- 						      <div class="modal-footer" style="padding:0px 12px"> -->
<!-- 						        <button id="1" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
<%-- 						        <input type="hidden" name="mem_no" value="${memVO.mem_no}"> --%>
<%-- 						        <input type="hidden" name="bp_no" value="${fmarticleVO.fm_no}"> --%>
<!-- 						        <input type="hidden" name="action" value="FmarticleServlet"> -->
<!-- 								<input	type="hidden" name="action" value="insertreport"> -->
<!-- 						        <button id="2" type="button" class="btn btn-secondary" data-dismiss="modal" style="background:orange">送出檢舉</button> -->
<!-- 						      </div> -->
<!-- 						    </div> -->
<!-- 						  </div> -->
<!-- 						</div> -->
<!-- 						</div> -->
<%-- 					</c:if> --%>
<%-- <%-- 					</c:if> --%> 
<%-- 					<c:if test="${memVO == null}"> --%>
<!-- 					<br><button type="button" class="btn btn-secondary" data-dismiss="modal">檢舉請先登入</button> -->
<%-- 					</c:if> --%>
					
                  </div> 
                </div>
         		
         		
  
          <div class="row singleProduct singleProductTab">
            <div class="col-12">
              <div class="media mb-4">
                <div class="media-body">
                  <div class="tabArea">
                    <ul class="nav nav-tabs bar-tabs">
                      <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#OurDetails">文章內文</a></li>
                      <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#OurSizing">留言板</a></li>
                    </ul>
                    <div class="tab-content">
                      <div id="OurDetails" class="tab-pane fade show active">
                        <font size="3">${fmarticleVO.fm_text}</font>
                        <ul class="list-unstyled">
<%--                           <li>物品地點:${bpVO.bp_loc}</li> --%>
<%--                           <li>運送方式:${bpVO.bp_del}</li> --%>
<%--                           <li>賣家編號:${bpVO.mem_no}</li> --%>
<%--                           <li>商品編號:${bpVO.bp_no}</li> --%>
                        </ul>
                      </div>

                      <div id="OurSizing" class="tab-pane fade">
                        <div class="SingleCartListWrapper SingleCartSizing">
                          <div class="cartListInner">
                            <div class="table-responsive">
                              <table class="table">
                           		<jsp:useBean id="fmmeSvc" scope="page" class="com.fmmessage.model.fmmeService" />
									<c:choose>
									<c:when test="${memVO.mem_no != fmarticleVO.mem_no}">
													<div >
														<div class="view">
														<c:forEach var="fmmeVO"
																items="${fmmeSvc.findByfm_no(fmarticleVO.fm_no)}">
																<div class="try">
																	${fmmeVO.qmem_no}：${fmmeVO.qfmme_text}<br>
<%-- 																	內容:${fmmeVO.qfmme_text}<br> --%>
																	版主：${(fmmeVO.fmme_text == null)?"尚未回覆":fmmeVO.fmme_text}
																</div>
															</c:forEach>
														</div>	
														<c:choose>
														    <c:when test="${memVO != null}">
														    	<div class="quest">		
														    	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/fm-front/FmarticleServlet" name="form1">
																	<h2>留言板</h2><textarea id="qfmme_text" style="width: 800px; height: 150px;resize:none; 
																	background-color:white;margin-bottom: 15px;font-size: 16px;color: #b7b7b7;font-weight: bold;line-height: 25px;border-radius: 25px;padding:15px;"
																	name="qfmme_text"  placeholder="Comment"></textarea>
																	<input  type="hidden" name="qmem_no"value="${memVO.mem_no}">
																	<input  type="hidden"name="fm_no" value="<%=fmarticleVO.getFm_no()%>">
																	<input	type="hidden" name="mem_no"	value="<%=fmarticleVO.getMem_no()%>">
																	<input	type="hidden" name="action" value="question">
																	<button type="submit" style="width:70px">送出</button>
																</FORM>	
																</div>
														    </c:when>
														    <c:otherwise>
														  		<h2>留言板</h2><textarea  disabled id="qfmme_text" style="width: 800px; height: 150px;resize:none; 
																	background-color:white;margin-bottom: 15px;font-size: 16px;color: #b7b7b7;font-weight: bold;line-height: 25px;border-radius: 25px;padding:15px;"
																	name="qfmme_text" placeholder="您尚未登入..需登入後才能進行留言！" >您尚未登入..需登入後才能進行留言！</textarea>
														    </c:otherwise>
														</c:choose>				
													</div>	 
			
													</c:when>
													<c:otherwise>
														<c:forEach var="fmmeVO"
															items="${fmmeSvc.findByfm_no(fmarticleVO.fm_no)}">
															<div class="try">
																${fmmeVO.qmem_no}：${fmmeVO.qfmme_text}<br>
<%-- 																內容:${fmmeVO.qfmme_text}<br> --%>
																版主：
																<span class="res">${(fmmeVO.fmme_text == null)?"尚未回覆":fmmeVO.fmme_text}</span> 													
																	<c:choose>
																    <c:when test="${fmmeVO.fmme_text == null}">
																<div class="respon">													
																	<input type="text" name="fmme_text" style="border-radius: 5px">
																	<input type="hidden" name="fmme_no"value="${fmmeVO.fmme_no}">
																	<input type="hidden" name="fm_no"  value="<%=fmarticleVO.getFm_no()%>">																
																	<input type="hidden" name="action" value="FmarticleServlet">
																	<input type="hidden" name="action" value="reply">
																	<button style="width:50px">回應</button>										
																</div>
																    </c:when>
																    <c:otherwise>
																   
																    </c:otherwise>
																</c:choose>		
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
		
		<script>
		$(document).ready(function(){
			$(".respon>button").click(function(){
				let data = {};
				let message = $(this).parent().children();
				let pre = $(this).parent().prev();
				
				data.action = message[4].value;
				url = message[3].value;
				data.fm_no = message[2].value;
				data.fmme_no = message[1].value;
				data.fmme_text = message[0].value;
				
				$(this).hide();
				message.eq(0).hide();
				
				message[0].style.display = 'none';
				pre.empty();
				pre.text(data.fmme_text);
				
				$.ajax({
					url: url,
					type:"POST",
					data:data,
					success:function(){
						alert('回覆成功!');
					}
				});
				
			});
				
			
			$(".quest>button").click(function() {
				
				let data1 = {};
				let me = $(this).parent().children();
				data1.action = me[5].value;
				url = me[4].value;
				data1.mem_no = me[3].value;
				data1.fm_no = me[2].value;
				data1.qmem_no = me[1].value;
				data1.qfmme_text = me[0].value.trim();
//					console.log(data1.qmem_no);
//					var div = document.createElement("div");
//					div.innerHTML=""
				if(data1.qfmme_text != ''){
				let ppr = $(this).parent().parent();
				ppr.prepend("<div style='border: 1px double gray;width: 100%;height: 100%;background-color: white;margin-bottom: 15px;padding: 15px;font-size: 16px;font-weight: bold;line-height: 25px;border-radius: 25px'>"+data1.qmem_no+"："+data1.qfmme_text+"<br>版主：尚未回覆</div>");
				$("#qfmme_text").val('');
				}
				
				
				$.ajax({
					url : url,
					type : "POST",
					data : data1,
					success : function(ga) {
						if(ga.length==0){

							alert('留言成功!');
							
						}else{
							alert(ga);
						}		
					}
				});
			});

			

			
		});
		</script>
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
	</body>
</html>
     