<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>

<%
	EmpVO empVO = (EmpVO) request.getAttribute("empVO");
%>

<!DOCTYPE html>
<html lang="zh_TW">
<head>

<!-- SITE TITTLE -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>管理員登入</title>

<!-- PLUGINS CSS STYLE -->
<link href="../assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet">
<link href="../assets/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="../assets/plugins/selectbox/select_option1.css"
	rel="stylesheet">
<link href="../assets/plugins/fancybox/jquery.fancybox.min.css"
	rel="stylesheet">
<link href="../assets/plugins/rateyo/jquery.rateyo.min.css"
	rel="stylesheet">
<link href="../assets/plugins/iziToast/css/iziToast.css"
	rel="stylesheet">
<link href="../assets/plugins/prismjs/prism.css" rel="stylesheet">
<link href="../assets/plugins/revolution/css/settings.css"
	rel="stylesheet">
<link href="../assets/plugins/animate/animate.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="../assets/plugins/slick/slick.css" media="screen">
<link rel="stylesheet" type="text/css"
	href="../assets/plugins/slick/slick-theme.css" media="screen">


<script href="../assets/plugins/slick/slick-theme.css"></script>
<script
	src="//revs.iamabdus.com/revslider/public/assets/js/extensions/revolution.extension.layeranimation.min.js"></script>
<script
	src="//revs.iamabdus.com/revslider/public/assets/js/extensions/revolution.extension.navigation.min.js"></script>

<!-- CUSTOM CSS -->
<link href="../assets/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="../assets/css/color-option9.css"
	id="option_style">

<link rel="stylesheet" href="../assets/css/joe_footer.css">

<!-- 緯僑新增的css -->
<link rel="stylesheet" href="../assets/css/joe.css">


<!-- Icons -->
<link rel="shortcut icon" href="../assets/img/favicon.png">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<style>
/* #body.joe.mainContent clearfix logIn { */
/* 	style="padding: 0px 0px"; */
/* } */

.lightSection{
	background-color:#252526;
}

.pageHeader ol.breadcrumb li a{
	font-size:18px;
	text-transform:capitalize;
}
</style>
</head>

<body id="body" class="body-wrapper version1 up-scroll">

	<div class="main-wrapper">

		<!-- HEADER -->
		<div class="header clearfix">

		<!-- LIGHT SECTION -->
		<div class="joe">
			<section class="lightSection clearfix pageHeader">
				<div class="container">
					<div class="row">
						<div class="col-md-6">
							<div class="page-title">
<!-- 								<h2>Toy All Hot 後台管理系統</h2> -->
								<!--style.css 6325行起 ，6330行改過字體-->
								<img style="position:absolute;top:0;bottom:0;margin:auto;width:50%" src="../assets/vendor/logo3.png">
							</div>
						</div>
						<div class="col-md-6">
							<ol class="breadcrumb float-right">
								<li><a href="empLogin.jsp">Toy All Hot 後台管理系統</a> <!-- style.css 6427行起  -->
								</li>
								<!--                   <li class="active">登入一波</li> style.css 6379行起 -->
							</ol>
						</div>
					</div>
				</div>
			</section>
		</div>


		<!-- MAIN CONTENT SECTION -->
		<div class="joe">
			<section class="mainContent clearfix logIn" style="padding: 0px 0px 10% 0px">
				<div class="container">
				<div style=" text-align: center">
				<img style="width: 30%" src="img/emp.gif">
				<p style="color:#666666;font-size:18px;font-family: Microsoft JhengHei ;padding: 5px 0px 0 0px"><b>▲本月最佳員工</b></p>
				<p style="color:#666666;font-size:18px;font-family: Microsoft JhengHei"><b>表揚事蹟：落實真正的「送貨到家」政策！</b></p>
				</div>				
					<div class="row justify-content-center">					
						<div class="col-md-7 col-lg-8 col-xl-7 col-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h3>登入</h3>
								</div>

								<%-- 錯誤表列 --%>
								<c:if test="${not empty errMessages}">
									<center>
										<font style="color: red">請修正以下錯誤:</font>
										<ul>
											<c:forEach var="message" items="${errMessages}">
												<li style="color: red">${errMessages}</li>
											</c:forEach>
										</ul>
									</center>
								</c:if>
								
							<!-- 嘴離職列表 -->
<%-- 								<c:if test="${not empty getOutMsg}"> --%>
<%-- 									<center> --%>
<!-- 										<ul> -->
<%-- 											<c:forEach var="message" items="${getOutMsg}"> --%>
<%-- 												<li style="color: red">${getOutMsg}</li> --%>
<%-- 											</c:forEach> --%>
<!-- 										</ul> -->
<%-- 									</center> --%>
<%-- 								</c:if> --%>

								<div class="panel-body">

									<form action="empLogin" method="POST" role="form" id="form1">
										<div class="form-group">
											<label for="">請輸入員工編號</label> <input type="text"
												class="form-control" id="empNo" name="empNo"
												value="${param.empNo}">
										</div>
										<div class="form-group">
											<label for="">輸入密碼</label> <input type="password"
												class="form-control" id="empPsd" name="empPsd">
										</div>

										<input type="hidden" name="action" value="login">
										<button type="button"
											class="btn btn-primary btn-default btn-block" id="send">登入</button>

										<button onclick="location.href='forgetPsd.jsp'" type="button"
											class="btn btn-link btn-block">忘記本網站密碼?
											幹!那你怎麼不會忘記PornHub的密碼???蛤?說話啊!</button>
									</form>

								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
</div>


		<script>
			var send = document.getElementById("send");
			var form1 = document.getElementById("form1");

			send.addEventListener("click", function() {
				var empNo = document.getElementById("empNo").value;
				var empPsd = document.getElementById("empPsd").value;

				if (empNo == "" || empNo.trim() == "") {
					alert("請填寫員工編號")
				} else if (empPsd == "" || empPsd.trim() == "") {
					alert("請填寫密碼")
				} else {
					form1.submit();
				}
			})
		</script>

		<script src="../assets/plugins/jquery/jquery.min.js"></script>
		<script src="../assets/plugins/jquery/jquery-migrate-3.0.0.min.js"></script>
		<script src="../assets/plugins/jquery-ui/jquery-ui.js"></script>
		<script src="../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script
			src="../assets/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
		<script
			src="../assets/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
		<script src="../assets/plugins/slick/slick.js"></script>
		<script src="../assets/plugins/fancybox/jquery.fancybox.min.js"></script>
		<script src="../assets/plugins/iziToast/js/iziToast.js"></script>
		<script src="../assets/plugins/prismjs/prism.js"></script>
		<script
			src="../assets/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
		<script src="../assets/plugins/countdown/jquery.syotimer.js"></script>
		<script src="../assets/plugins/velocity/velocity.min.js"></script>
		<script src="../assets/plugins/rateyo/jquery.rateyo.min.js"></script>
		<script src="../assets/js/custom.js"></script>

		<!-- FOOTER -->
		<jsp:include page="../assets/footerBack.jsp"></jsp:include>
</body>
</html>
