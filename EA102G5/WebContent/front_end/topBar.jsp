<%@page import="java.util.*"%>
<%@page import="com.mem.model.MemService"%>
<%@page import="sun.misc.BASE64Encoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="Big5"%>
<%@ page import="com.mem.model.MemVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Top Bar</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>
<style>
	
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
<body >
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
										<li><a href="single-product.html">
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
        <nav class="navbar navbar-main navbar-default navbar-expand-md navbar-scrollUp navbar-sticky" role="navigation" style="display: contents">
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
							<input type="hidden" name="url" value="${urll}">
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