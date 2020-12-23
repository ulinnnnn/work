<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.Bid_commodity.model.*"%>
<%@ page import="com.Bid_content.model.*"%>
<%@ page import="com.Bid_content.controller.*"%>
<%@ page import="com.Bid_record.model.*"%>
<%@ page import="com.Bid_record.controller.*"%>
<%@ page import="java.util.*"%>
<%@page import="com.mem.model.MemService"%>
<%@page import="sun.misc.BASE64Encoder"%>
<%@ page import="com.mem.model.MemVO"%>

<%
	Bid_commodityVO bid_commodityVO = (Bid_commodityVO) request.getAttribute("bid_commodityVO");
	String BIDNO = request.getQueryString();
	pageContext.setAttribute("BIDNO", BIDNO);
	if (bid_commodityVO != null) {
	} else {
		Bid_commodityService bid_commoditySvc = new Bid_commodityService();
		Bid_commodityVO bidVO = bid_commoditySvc.getOneBid(BIDNO);
		pageContext.setAttribute("bidVO", bidVO);
	}
	Bid_contentService bid_contentSvc = new Bid_contentService();
	List<Bid_contentVO> list = bid_contentSvc.getAll(BIDNO);
	pageContext.setAttribute("list", list);

	Bid_recordService bid_recordSvc = new Bid_recordService();
	List<Bid_recordVO> list1 = bid_recordSvc.getAll();
	pageContext.setAttribute("list1", list1);
%>


<%-- 取出 對應的DeptVO物件--%>
<!DOCTYPE html>
<html lang="zh_TW">
<head>

<!-- SITE TITTLE -->
<meta charset="Big5">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Single Product - BIGBAG Store</title>

<!-- PLUGINS CSS STYLE -->
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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/plugins/slick/slick.css"
	media="screen">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/plugins/slick/slick-theme.css"
	media="screen">
<!-- CUSTOM CSS -->
<link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/default.css" id="option_style">
<!-- Icons -->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/img/favicon.png">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<style>
.row.rr-time {
	margin-top: 18px;
}

.rr-time .mb-5 {
	margin-bottom: 24px !important;
}

input.form-control, textarea.form-control, select.form-control {
	margin-bottom: 0px;
}

form {
	margin: 0px;
	display: inline
}
#area{
	line-height: 40px;
    font-size:30px;
    font-weight:bold;
}
textarea.message-area {
	height: 70% !important;
	width: 100% !important;
	resize: none !important;
	box-sizing: border-box !important;
	overflow: auto;
	background-color: #ffffff !important;
}

/*   .container {    */
/*   	align-content: center;    */
/*    }    */
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
<body id="body" class="body-wrapper version1 up-scroll" onload="clock();return true" onunload="disconnect();">
	<c:choose>
		<c:when test="${memVO.mem_no==null}">
			<div class="topBar">
				<div class="container">
					<div class="row">
						<div class="col-md-6 d-none d-md-block"></div>
						<div class="col-md-6 col-12">
							<ul class="list-inline float-right top-right">
								<li class="account-login"><span><a data-toggle="modal" href='.login-modal'>Log in</a><small>or</small>
										<a href='<%=request.getContextPath()%>/Front-mem/signup.jsp'>註冊帳號</a> </span></li>
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
										<form method="post" action="<%=request.getContextPath()%>/Front-mem/mem.do" enctype="multipart/form-data">
											<input type="hidden" name="action" value="memLogout">
											<button id="logout" class="btn btn-success btn-icon btn-mid" type="submit"
												style="height: 36px; width: 90px; background-color: #495057; border-color: #495057">
												<i class="fa fa-user"></i>登出
											</button>
										</form>
								</span></li>
								<li class="searchBox"><a href="#"><i class="fa fa-search"></i></a>
									<ul class="dropdown-menu">
										<li><span class="input-group"> <input type="text" class="form-control" placeholder="Search…"
												aria-describedby="basic-addon2">
												<button type="submit" class="input-group-addon">Submit</button>
										</span></li>
									</ul></li>

								<li class="dropdown cart-dropdown"><a href="javascript:void(0)" class="dropdown-toggle"
									data-toggle="dropdown" style="border-radius: 15px"> <i class="fa fa-user"></i>我的會員
								</a>
									<ul class="dropdown-menu dropdown-menu-right">
										<li>會員專區</li>
										<li><a href="<%=request.getContextPath()%>/Front-mem/account-profile.jsp">
												<div class="media">
													<img id="tpMemPic" class="media-left media-object" height="80px" width="70px"
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
													onclick="location.href='<%=request.getContextPath()%>/Front-mem/account-profile.jsp';">進入會員首頁</button>
												<button type="button" class="btn btn-default"
													onclick="location.href='<%=request.getContextPath()%>/index1.jsp';">返回首頁</button>
											</div>
										</li>
									</ul></li>


								<li class="dropdown cart-dropdown"><a href="javascript:void(0)" class="dropdown-toggle"
									data-toggle="dropdown" style="border-radius: 15px"> <i class="far fa-comment-dots"></i>訊息
								</a>
									<ul class="dropdown-menu dropdown-menu-right " style="background-color: transparent;">
										<div style="margin-top: auto; margin-bottom: auto; width: 300px;">
											<div class="card mb-sm-3 mb-md-0 contacts_card"
												style="height: 500px; border-radius: 15px !important; background-color: rgba(0, 0, 0, 0.65) !important;">
												<div class="card-header" style="border-radius: 15px 15px 0 0 !important; border-bottom: 0 !important;">
													<div class="input-group">
														<input type="text" placeholder="Search..." name="" class="form-control search"
															style="border-radius: 15px 0 0 15px !important; background-color: rgba(0, 0, 0, 0.3) !important; border: 0 !important; color: white !important;">
														<div class="input-group-prepend">
															<span class="input-group-text search_btn"
																style="border-radius: 0 15px 15px 0 !important; background-color: rgba(0, 0, 0, 0.3) !important; border: 0 !important; color: white !important; cursor: pointer;"><i
																class="fas fa-search"></i></span>
														</div>
													</div>
												</div>
												<div id="chatRow" class="card-body contacts_body"
													style="padding: 0.75rem 0 !important; overflow-y: auto; white-space: nowrap;"></div>
												<div class="card-footer" style="border-radius: 0 0 15px 15px !important; border-top: 0 !important;"></div>
											</div>
										</div>
									</ul></li>
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

			<a class="navbar-brand" href="<%=request.getContextPath()%>/index1.jsp"> <img
				src="<%=request.getContextPath()%>/assets/img/index/logo2.png" width="249px" height="46.5px">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".navbar-ex1-collapse"
				aria-controls="navbar-ex1-collapse" aria-expanded="false" aria-label="Toggle navigation">
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
					<button type="button" id="close1" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h3 class="modal-title">會員登入</h3>
				</div>
				<div class="modal-body">
					<form ACTION="<%=request.getContextPath()%>/Front-mem/mem.do" enctype="multipart/form-data" method="POST"
						role="form">
						<div class="form-group">
							<label for="">帳號</label> <input name="mem_account" type="text" class="form-control">
						</div>
						<div class="form-group">
							<label for="">密碼</label> <input name="mem_pwd" type="password" class="form-control">
						</div>
						<div class="checkbox">
							<input id="checkbox-1" class="checkbox-custom form-check-input" name="checkbox-1" type="checkbox" checked>
							<label for="checkbox-1" class="checkbox-custom-label form-check-label">Remember me</label>
						</div>
						<input type="hidden" name="url" value="<%=request.getRequestURI() + "?" + BIDNO%>">
						<button type="submit" class="btn btn-primary btn-block">登入</button>
						<button id="fgbtn" type="button" class="btn btn-link btn-block">
							<a data-toggle="modal" href='#email' style="color: blue;"><em><u>忘記密碼?</u></em></a>
						</button>
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
					<h3 class="modal-title">
						<b>忘記密碼</b>
					</h3>
				</div>
				<div class="modal-body">
					<form action="<%=request.getContextPath()%>/Front-mem/mem.do" method="POST" enctype="multipart/form-data"
						role="form">
						<div class="form-group">
							<label for=""><b>發送驗證信</b></label> <input id="PWD_Mem_email" type="email" name="mem_email" class="form-control"
								placeholder="請輸入您註冊的E-MAIL">
						</div>
						<button id="PwdSendBtn" type="button" class="btn btn-primary btn-block" style="color: black;">確認發送</button>
						<button type="button" class="btn btn-link btn-block">New User?</button>
						<input type="hidden" name="action" value="forgetPWD">
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- MAIN CONTENT SECTION -->
	<section class="mainContent clearfix">
		<div class="container">
			<div class="row singleProduct">
				<div class="col-md-12">
					<div class="media flex-wrap mb-5">
						<div class="media-left productSlider">
							<div id="carousel" class="carousel slide" data-ride="carousel">
								<div class="carousel-inner SingleProductItem">

									<div class="carousel-item active productImage SingleProductImage" data-thumb="0">
										<img src="<%=request.getContextPath()%>/bid_front_end/picture.do?bp_no=${bidVO.bp_no}" height="400px"
											width="500px"> <a data-fancybox="images"
											href="<%=request.getContextPath()%>/bid_front_end/picture.do?bp_no=${bidVO.bp_no}" class="product-content"
											style="height: 100px; width: 100px"> </a>
									</div>
									<div class="carousel-item SingleProductImage" data-thumb="1">
										<img src="<%=request.getContextPath()%>/bid_front_end/picture2.do?bp_no=${bidVO.bp_no}" height="400px"
											width="500px"> <a data-fancybox="images"
											href="<%=request.getContextPath()%>/bid_front_end/picture2.do?bp_no=${bidVO.bp_no}" class="product-content"
											style="height: 100px; width: 100px"> </a>
									</div>
								</div>
							</div>

							<div class="clearfix">
								<div id="thumbcarousel" class="carousel slide" data-interval="false">
									<div class="carousel-inner">
										<div data-target="#carousel" data-slide-to="0" class="thumb">
											<img src="<%=request.getContextPath()%>/bid_front_end/picture.do?bp_no=${bidVO.bp_no}" height="100px"
												width="100px">
										</div>
										<div data-target="#carousel" data-slide-to="1" class="thumb">
											<img src="<%=request.getContextPath()%>/bid_front_end/picture2.do?bp_no=${bidVO.bp_no}" height="100px"
												width="100px">
										</div>
									</div>
									<a class="left carousel-control" href="#thumbcarousel" role="button" data-slide="prev"> <span
										class="glyphicon glyphicon-chevron-left"></span>
									</a> <a class="right carousel-control" href="#thumbcarousel" role="button" data-slide="next"> <span
										class="glyphicon glyphicon-chevron-right"></span>
									</a>
								</div>
							</div>
						</div>
						<div class="media-body">
							<ul class="list-inline">

								<li class="mb-4 mb-md-0"><c:if test="${memVO.mem_no==null}">
										<a class="btn btn-primary" type="button" style="border: white; background-color: white;"> <i
											class="fa fa-reply" aria-hidden="true"></i> 檢舉
										</a>
									</c:if> <c:if test="${memVO.mem_no!=null}">
										<c:if test="${memVO.mem_no!=null&&bidVO.mem_no!=memVO.mem_no}">
											<a class="btn btn-primary" type="button" data-toggle="modal" data-target="#jumpout"
												style="border: white; background-color: white;"> <i class="fa fa-reply" aria-hidden="true"></i> 檢舉
											</a>
										</c:if>
										<c:if test="${memVO.mem_no!=null&&bidVO.mem_no==memVO.mem_no}">
											<a class="btn btn-primary" type="button" style="border: white; background-color: white;"> <i
												class="fa fa-reply" aria-hidden="true"></i> 檢舉
											</a>
										</c:if>
									</c:if></li>
								<jsp:useBean id="trackSvc" scope="page" class="com.Bid_commodity_track.model.Bid_commodity_trackService"/>
								
								<c:if test="${bidVO.mem_no != memVO.mem_no}">
								<c:choose>
									<c:when test="${trackSvc.get_one(bidVO.bp_no,memVO.mem_no).bp_no==bidVO.bp_no}">
										<button id="add">
										<i id="show" class="fa fa-check-square" aria-hidden="true">商品已收藏</i> 
										<i id="add" class="fa fa-plus" aria-hidden="true" style="display: none">加入收藏</i>
										</button>
									</c:when>
									<c:otherwise>
									<button id="add">
										<i id="show" class="fa fa-check-square" aria-hidden="true" style="display: none">商品已收藏</i>
										<i id="add" class="fa fa-plus" aria-hidden="true">加入收藏</i>
									</button>
									</c:otherwise>
								</c:choose>
								</c:if>

							</ul>

							<div class="modal fade" id="jumpout" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">檢舉</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>

										<div class="modal-body">
											<FORM METHOD="post" ACTION="bid_commodity_Report.do" name="form1" enctype="multipart/form-data">
												<div class="form-group">
													<label for="recipient-name" class="col-form-label">檢舉原因:</label> <input type="text" class="form-control"
														id="recipient-name" name="br_project"
														style="padding-top: 0px; padding-bottom: 0px; margin-bottom: 10px; height: 32px;">
												</div>
												<div class="form-group">
													<label for="message-text" class="col-form-label" style="margin-bottom: 0px;">檢舉細節:</label>
													<textarea class="form-control" id="message-text" name="br_content"></textarea>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary" data-dismiss="modal">關閉</button>
													<button type="submit" class="btn btn-primary">送出</button>
													<input type="hidden" name="action" value="reportinsert">
												</div>
												<input type="hidden" name=mem_no value="${memVO.mem_no}"> <input type="hidden" name=bp_no
													value="${bidVO.bp_no}">
											</FORM>
										</div>
									</div>
								</div>
							</div>
							<h2>${bidVO.b_name}</h2>
							<h3 style="display:inline-block;color:red;">NT$</h3>
							<h3 style="margin-bottom: 16px; display:inline-block;color:red;" id="psp">${bidVO.bs_price}</h3>

							<c:if test="${bidVO.b_times!=88}">
       <div class="row  rr-time">
        <h2 style="margin-left: 15px;">競標倒數時間</h2>
        <br>
        <fieldset>
         <form name="formnow">
          <input type="text" name="dd" size="1" readonly="readonly">天 <input type="text" name="hh" size="2"
           readonly="readonly">時 <input type="text" name="mm" size="2" readonly="readonly">分 <input
           type="text" name="ss" size="2" readonly="readonly">秒
         </form>
        </fieldset>
        <br>
       </div>
       <!--          <FORM METHOD="post" ACTION="bid_record.do" name="form1">         -->
       <div class="col-12">
        <h4>競拍每次加價金額$${bidVO.bplus_price}</h4>
        <div class="d-flex align-items-center mb-5 pt-3" style="margin-bottom: 1px; margin-top: 24px;">
         <h5 class="mr-4">加價金額:</h5>
         <div class="SingleCartListInner cartListInner pl-1">
          <div class="table-responsive">
           <table class="table">
            <tbody>
             <tr class="border-0">
              <td class="count-input border-0 p-0"><a class="incr-btn" data-action="decrease" href="#"> <i
                class="fa fa-minus"></i>
              </a> <input class="quantity" id="message" type="number" name="b_price" value="0" style="width: 100px">
               <a class="incr-btn" data-action="increase" href="#"> <i class="fa fa-plus"></i>
              </a></td>
             </tr>
            </tbody>
           </table>
          </div>
         </div>
        </div>
       </div>
       <div class="btn-area mb-0">
        <c:if test="${memVO.mem_no!=null}">
         <c:if test="${memVO.mem_no!=bidVO.mem_no}">
          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"
           style="margin-top: 7px; text-align: center; line-height: 50px; font-size: 20px;" id="button1">出價</button>
         </c:if>
        </c:if>
        <c:if test="${memVO.mem_no==null}">
         <button type="button" class="btn btn-primary"  data-toggle="modal" href=".login-modal"
          style="margin-top: 7px; text-align: center; line-height: 50px; font-size: 20px;" id="button1">出價請登入</button>
        </c:if>

       </div>
       <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
         <div class="modal-content">
          <div class="modal-header">
           <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
           </button>
          </div>
          <div class="modal-body">確定出價嗎?</div>
          <div class="modal-footer">
           <button type="button" class="btn btn-secondary" data-dismiss="modal">我再想想</button>
           <button type="button" class="btn btn-primary" data-dismiss="modal" value="${bidVO.bs_price}"
            style="width: 98px; height: 40px;" onclick="sendMessagebid();">對</button>
          </div>
         </div>
        </div>
       </div>
</c:if>
<c:if test="${bidVO.b_times==88}"><h1 style="font-color:red;font-weight:bold">此商品被檢舉下架摟</h1></c:if>

						</div>
					</div>
				</div>
			</div>
			<div class="row singleProduct singleProductTab">
				<div class="col-12">
					<div class="media mb-4">
						<div class="media-body">
							<div class="tabArea">
								<ul class="nav nav-tabs bar-tabs">
									<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#details">競標紀錄</a></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#OurDetails">商品介紹</a></li>
									<c:if test="${memVO.mem_no!=bidVO.mem_no}">
										<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#Reviews">留言板</a></li>
									</c:if>

								</ul>
								<div class="tab-content">
									<div id="details" class="tab-pane fade show active">
										<c:forEach var="bid_recordVO" items="${list1}">
											<c:if test="${bid_recordVO.bp_no==bidVO.bp_no}">
												<div class="media mb-5">
													<div class="media-body">
														<h4 class="mt-0 mb-2">競標會員:${(bid_recordVO.mem_no==memVO.mem_no)?'我':''}(${bid_recordVO.mem_no})</h4>
														<em>競標加價:${bid_recordVO.b_price}</em><br> <em>出價時間${bid_recordVO.b_time}</em>
													</div>
												</div>
											</c:if>
										</c:forEach>
										<div id="messagesArea" class="message-area"></div>
									</div>
									<div id="OurDetails" class="tab-pane fade">

										<p>${bidVO.b_intro}</p>
									</div>
									<div id="Reviews" class="tab-pane fade">
										<div class="media-body">

											<c:forEach var="bid_contentVO" items="${list}">
												<div class="media mb-5">

													<img class="mr-4 rounded rounded-circle" src="jpg/p.jpeg" alt="Generic placeholder image" height="100px"
														width="100px">
													<div class="media-body">
														<h4 class="mt-0 mb-2">${(bid_contentVO.mem_no==memVO.mem_no)?'我':''}(${bid_contentVO.mem_no})</h4>
														<em>${bid_contentVO.br_time}</em><br> <em>${bid_contentVO.br_content}</em>
													</div>
												</div>
											</c:forEach>
										</div>
										<c:if test="${memVO.mem_no!=null}">
											<div class="mt-5 mb-2 border p-4 p-md-5">
												<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/bid_front_end/bid_content.do" name="form2">
													<div class="media flex-column flex-md-row mb-0">
														<img class="m-auto m-md-0 mr-md-4 rounded rounded-circle" src="jpg/p.jpeg" alt="Generic placeholder image"
															height="200px" width="200px">
														<div class="media-body mt-4 mt-md-0">
															<h6 class="text-center text-md-left text-capitalize mt-0">
																<em>${memVO.mem_name}(${memVO.mem_no})</em>
															</h6>
															<h6 class="text-center text-md-left ReviewsPost mt-0"></h6>
															<div class="row">

																<div class="form-group col-md-12">
																	<textarea class="form-control" id="exampleTextarea" rows="5" name="br_content" placeholder="來討論價錢吧"></textarea>
																</div>
															</div>
															<div class="reply_text">
																<input type="hidden" name=mem_no value="${memVO.mem_no}"> <input type="hidden" name=bp_no
																	value="${bidVO.bp_no}"> <input type="hidden" name="action" value="insert">
																<button type="submit" id="my_reply" name="reply" class="btn btn-default btn-primary custom-btn">留言
																</button>
															</div>
														</div>
													</div>
												</FORM>
										</c:if>
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
	<%-- 			<jsp:include page="/assets/memChat3.jsp" flush="true"/> --%>
	<jsp:include page="/assets/footer.jsp" flush="true" />
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


	<script type="text/javascript">
			
			 $(document).ready(function(){
				 connect();	
					})
			
			
			var hid=document.getElementsByClassName('mt-5 mb-2 border p-4 p-md-5');
			var my_reply = document.getElementById('exampleTextarea');
			var reply = document.getElementsByClassName('nav-item')[0];
			var reply_text = document.getElementsByClassName('mt-5 mb-2 border p-4 p-md-5')[0];
			var remove = document.getElementsByClassName('remove');		

		 for(var i = 0; i < remove.length; i++){
		    remove[i].addEventListener('click', function(){ 
		      var parentNode = this.closest('.media-body');
		      parentNode.remove();
		    });
		   }

		 var DifferenceHour = -1
		 var DifferenceMinute = -1
		 var DifferenceSecond = -1
		 var Tday = ${bidVO.b_endtime.getTime()};
		 var daysms = 24 * 60 * 60 * 1000
		 var hoursms = 60 * 60 * 1000
		 var Secondms = 60 * 1000
		 var microsecond = 1000
		

		 
		function clock(){
			var time = new Date();
			var hour = time.getHours();
			var minute = time.getMinutes();
			var second = time.getSeconds();
			var timevalue = ""+((hour > 12) ? hour-12:hour);
			timevalue +=((minute < 10) ? ":0":":")+minute;
			timevalue +=((second < 10) ? ":0":":")+second;
			timevalue +=((hour >12 ) ? " PM":" AM");
			var convertHour = DifferenceHour;
			var convertMinute = DifferenceMinute;
			var convertSecond = DifferenceSecond;	
			var Diffms = Tday - time.getTime();
			if(Diffms<0){
				$("#button1").attr('disabled',true);
				$("#button1").attr('disabled','disabled');
				$("#button1").prop('disabled','disabled');
				$("#button1").text("競標結束摟")
				Diffms=0
			}
			if(Diffms>0){
			DifferenceHour = Math.floor(Diffms / daysms);
			Diffms -= DifferenceHour * daysms;
			DifferenceMinute = Math.floor(Diffms / hoursms);
			Diffms -= DifferenceMinute * hoursms;
			DifferenceSecond = Math.floor(Diffms / Secondms);
			Diffms -= DifferenceSecond * Secondms;			
			}
			
			if(convertHour != DifferenceHour){
				document.formnow.dd.value=DifferenceHour
			}
			
			if(convertMinute != DifferenceMinute) {
				document.formnow.hh.value=DifferenceMinute
			}
			if(convertSecond != DifferenceSecond) {
				document.formnow.mm.value=DifferenceSecond
			}
			var dSecs = Math.floor(Diffms / microsecond)
			document.formnow.ss.value=dSecs
			
			setTimeout("clock()",1000)}	
		$('.count-input a:nth-child(1)').click(function(){
		$('.quantity').val(parseInt($('.quantity').val())-${bidVO.bplus_price-1})
		}) 
		$('.count-input a:nth-child(3)').click(function(){ 
		$('.quantity').val(parseInt($('.quantity').val())+${bidVO.bplus_price-1})
			})
		
		$('a.social-link').click(function(){	
			$("a.social-link").text("收藏成功")
		}) 
	var MyPoint3 ="/mem/${memVO.mem_no}";
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/', 1));
	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint3;
	var messagesArea = document.getElementById("messagesArea");
	var self = '${bidVO.bp_no}';
	var psp3 = document.getElementById("psp");
	var webSocket2;
	var bnp;

	function connect() {
		webSocket2 = new WebSocket(endPointURL);
		webSocket2.onopen = function(event){
		var jsonObj = {
				"type" : "history",
				"sender" : self,
				"message" : "",

			};
		webSocket2.send(JSON.stringify(jsonObj));}
		
		webSocket2.onmessage = function(event) {
			var jsonObj = JSON.parse(event.data);
			 if ("history" === jsonObj.type) {
				messagesArea.innerHTML = '';
				var ul = document.createElement('ul');
				ul.id = "area";
				messagesArea.prepend(ul);
				var messages = JSON.parse(jsonObj.message);
				console.log(messages);
				var bns=0;	
				for (var i = 0; i < messages.length; i++) {
					var historyData = JSON.parse(messages[i]);
					var showMsg = "出價會員:"+historyData.mem+"出價金額:"+historyData.nprice;
					var li = document.createElement('li');				
					li.innerHTML = showMsg;
					ul.prepend(li);
					lastprice=historyData.nprice;
				    psp3.innerText=lastprice; 
				}
			    console.log(lastprice);
				messagesArea.scrollTop = messagesArea.scrollHeight;
			}else if ("chat" === jsonObj.type) {
				
				var li = document.createElement('li');
				li.innerHTML = "出價會員:"+jsonObj.mem+"出價金額:"+jsonObj.nprice;
				document.getElementById("area").prepend(li);
				messagesArea.scrollTop = messagesArea.scrollHeight;
				if(messagesArea.scrollHeight!=0){
				psp=$('#psp').text()
				me2=parseInt(jsonObj.nprice);//me2為加價		
				psp3.innerText=me2;	}
						
			}
			
		};
	}
	function sendMessagebid() {
		
		var inputMessage = document.getElementById("message");
		var message = inputMessage.value.trim();	
		psp=$('#psp').text()
		if(message>0){
		ps2=parseInt(psp);//ps2為底價	
		me2=parseInt(message);//me2為加價	
		psp=ps2+me2;//psp為現在金額	
		if(psp<100000000){
			var jsonObj = {
				"type" : "chat",
				"sender" : self,
				"mem":'${memVO.mem_no}',
				"message" : message,
				"nprice" : psp,
				"session":"0",
			};
			
		console.log(psp);
	
			webSocket2.send(JSON.stringify(jsonObj));}else{
				alert("出那麼多你是要買豪宅是不是?");
			}
			inputMessage.value = "0";
	}else if(message<0){
		alert("給我輸入金額哦==");
	}
		}
	function disconnect() {
// 		List<Bid_commodityVO> list = new ArrayList<Bid_commodityVO>();
// 	    list.add(data1.bp_no);
// 	    list.add(data1.mem_no);
// 	    list.add(data1.bs_price);
// 	    list.add(data1.bn_price);
// 	    let data1 = {};			   
// 	    data1.action = 'Bidinsert';			   
// 	    url = 'Bid_recordServlet';			  
// 	    data1.bp_no = '${bidVO.bp_no}';
// 	    data1.mem_no = '${memVO.mem_no}';
// 	    data1.bn_price = '${bidVO.bn_price}';
// 	    $.ajax({
// 	     url :url,
// 	     type :"POST" ,
// 	     data :data1 , 	     
// 	    });

	    webSocket2.close();
	}
	 $(document).ready(function(){
		$("#fgbtn").click(function(){
			$("#login").css("display","none");
//			$(".modal-backdrop .fade .show").remove();
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
			$("i#add").click(function(){
				let data1 = {};
				data1.action = 'insert';
				url = 'bid_commodity_track.do';
		
				data1.bp_no = '${bidVO.bp_no}';
				
				data1.mem_no = '${memVO.mem_no}';
				$.ajax({
					url :url,
					type :"POST" ,
					data :data1 , 
					success : function(e) {
							$("i#add").hide(500);
							$("i#show").show(500);
							
					}
				});
				
			});
		$("i#show").click(function(){
			console.log("show")
			let data1 = {};

			data1.action = 'delete';
		
			url = 'bid_commodity_track.do';
	
			data1.bp_no = '${bidVO.bp_no}';
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
	
</script>
</body>
</html>

