<%@ page import="java.util.*"%>
<%@ page import="com.emp.model.*"%>
<%@ page import="com.auth.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<%
	EmpService empSvc = new EmpService();
	List<EmpVO> empList = empSvc.getAll();
	pageContext.setAttribute("empList", empList);

	EmpVO empVO = (EmpVO) session.getAttribute("empVO");

	AuthService authSvc = new AuthService();
	List<String> empAuthList = authSvc.getOneEmpFuncs(empVO.getEmpNo());
	session.setAttribute("empAuthList", empAuthList);
%>

<!DOCTYPE html>
<html>
<head>

<!-- SITE TITTLE -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>後台首頁</title>

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

<!-- CUSTOM CSS -->
<link href="../assets/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="../assets/css/default.css"
	id="option_style">

<!-- Icons -->
<link rel="shortcut icon" href="../assets/img/favicon.png">

<!-- 緯僑新增的css -->
<link rel="stylesheet" href="../assets/css/joe.css">


<style>
.up-scroll .navbar-scrollUp.navbar-sticky.navbar-scrollUp {
	transform: inherit;	
}

.whiteSection, .mainContent{
	padding:15px 0px 60px 0px;
}
</style>

</head>

<body id="body" class="body-wrapper version1 up-scroll">
<jsp:include page="../assets/headerBack.jsp"></jsp:include>	
	
	<!-- LIGHT SECTION -->
	<div class="joe">

		<!-- MAIN CONTENT SECTION -->
		<section class="mainContent clearfix userProfile">
			<div class="container">				
				<div class="row">
					<div class="col-12">
						<div class="innerWrapper" style="background-color:#fbfbfb">
							<div class="orderBox myAddress wishList" style="vertical-align:middle; text-align:center">
								<h2 style="font-family: Microsoft JhengHei"><b>歡迎蒞臨後台系統唷~</b></h2>
								<img height=100% src="../assets/img/Ram&Rem.gif">
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	
	<!-- FOOTER -->
<jsp:include page="../assets/footerBack.jsp"></jsp:include>
	
</div>
</div>
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

</body>
</html>

