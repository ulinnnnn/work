<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>


<!DOCTYPE html>
<html lang="zh_TW">
<head>

<!-- SITE TITTLE -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>出去，現在</title>

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
<link rel="stylesheet" href="../assets/css/default.css"
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
.lightSection {
	background-color: #252526;
}

.pageHeader ol.breadcrumb li a {
	font-size: 18px;
	text-transform: capitalize;
}

#getOut1 {
	display: block;
	margin: 10px auto 20px auto;
	width: 45%;
}

#btn1 {
	display: block;
	margin: 2px auto 100px auto;
	background: #ff8000;
	border: 1px solid #ff8000;
	font-weight: bold;
	font-size: 20px;
}

#text1 {
	padding:;
	text-align: center;
	margin: 5px auto 0px auto;
	padding: 0 0 0 30px;
	color: red;
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
									<img
										style="position: absolute; top: 0; bottom: 0; margin: auto; width: 50%"
										src="../assets/vendor/logo3.png">
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
		</div>
	</div>

	<div>
		<h2 id="text1">
			<b> 離職了就給我快滾！ </b>
	</h2>
		<img id="getOut1" src="img/getOut1.jpg">
	</div>
	<div>
		<input type="button" id="btn1"
			class="btn btn-success btn-icon btn-mid" value="喔,好"
			onclick="location.href='<%=request.getContextPath()%>/empLogin/getOut2.jsp'">
	</div>

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
	<script src="../assets/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
	<script src="../assets/plugins/countdown/jquery.syotimer.js"></script>
	<script src="../assets/plugins/velocity/velocity.min.js"></script>
	<script src="../assets/plugins/rateyo/jquery.rateyo.min.js"></script>
	<script src="../assets/js/custom.js"></script>

	<!-- FOOTER -->
	<jsp:include page="../assets/footerBack.jsp"></jsp:include>
</body>
</html>
