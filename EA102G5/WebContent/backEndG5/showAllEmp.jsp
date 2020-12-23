
<%@ page import="java.util.*"%>
<%@ page import="com.emp.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	EmpService empSvc = new EmpService();
	List<EmpVO> empList = empSvc.getAll();
	pageContext.setAttribute("empList", empList);
%>

<!DOCTYPE html>
<html>
<head>

<!-- SITE TITTLE -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>後台管理員列表</title>

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
<link rel="stylesheet" href="../assets/css/color-option9.css"
	id="option_style">

<!-- Icons -->
<link rel="shortcut icon" href="../assets/img/favicon.png">

<!-- 緯僑新增的css -->
<link rel="stylesheet" href="../assets/css/joe.css">

<style>
/* .up-scroll .navbar-scrollUp.navbar-sticky.navbar-scrollUp { */
/* 	transform: inherit; */
/* } */

.showPic{ 
	width:100%;
}

.orderBox.myAddress .table-responsive .table tbody tr td.email {
	text-transform: lowercase;
}

.container , .container-fluid, .container-lg, .container-md, .container-sm, .container-xl{
	padding-left:0px;
	padding-right:0px;
} 

.mainContent{
    padding: 5px 0 10px 0;
}

.page-title h3{
	font-family: Microsoft JhengHei;
	font-weight:bold;
	color: #808080;
}

/* input.btn { */
/* 	background-color:#3366ff; */
/* 	border:0px; */
/* 	color:#fff */
/* } */



</style>
</head>


<body id="body" class="body-wrapper version1 up-scroll">
	<jsp:include page="../assets/headerBack.jsp"></jsp:include>

	<div class="joe">
		<div class="main-wrapper">
			<!-- NAVBAR -->
			<nav
				class="navbar navbar-main navbar-default navbar-expand-md navbar-scrollUp navbar-sticky"
				role="navigation">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<table
						style="border: 0px; margin: 0px 0px; padding: 0px 0px; width: 70%">
						<colgroup>
							<col style="width: 20%">
							<col style="width: 80%">
						</colgroup>

						<tr>
							<td><img height=19% src="../assets/img/01.jpg"></td>
							<td class="page-title">
								<h3>管理員</h3>
							</td>
						</tr>
					</table>			
				</div>
			</nav>
		</div>
	</div>

	<!-- LIGHT SECTION -->
	<div class="joe">

		<!-- MAIN CONTENT SECTION -->
		<section class="mainContent clearfix userProfile">
			<div class="container">

				<div class="row">
					<div class="col-sm-12">
						<div class="innerWrapper">
							<div style="float: right">
							
								<input class="btn btn-default btn-primary" type="button"
									value="新增管理員"
									onclick="location.href='<%=request.getContextPath()%>/backEndG5/notFound.jsp'"
									style="font-weight: bold">
							</div>
							<div class="orderBox myAddress wishList">
								<h2>管理員列表</h2>

								<div class="table-responsive">

									<table class="table">
										<col style="width: 20%">
										<col style="width: 7%">
										<col style="width: 13%">
										<col style="width: 15%">
										<col style="width: 25%">
										<col style="width: 10%">
										<col style="width: 10%">
										<thead>
											<tr>
												<th id="pic" ></th>
												<th>編號</th>
												<th>姓名</th>
												<th>電話</th>
												<th>Email</th>
												<th></th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="empVO" items="${empList}">
												<tr>
													<td><span class="cartImage">
													<img class="showPic" src="<%=request.getContextPath()%>/backEndG5/empPic?empNo=${empVO.empNo}"
															alt="image">
													</span></td>
													<td>${empVO.empNo}</td>
													<td>${empVO.empName}</td>
													<td class="phone" style="color:#858796">${empVO.empPhone}</td>
													<td class="email">${empVO.empEmail}</td>
													<td class="">
														<form method="post" action="emp.do">
															<input type="hidden" name="empNo" value="${empVO.empNo}">
															<input type="hidden" name="action" value="getOneUpdate">
															<input class="btn btn-sm btn-secondary-outlined"
																type="submit" value="修改" >
														</form>
													</td>

													<td class="">
														<form method="post" action="emp.do">
															<input id="${empVO.empNo}" type="hidden" name="empNo" value="${empVO.empNo}">
															<input id="action" type="hidden" name="action" value="delete1">
															<input id="myBtn" class="btn btn-sm btn-secondary-outlined"
																type="submit" value="停權">
														</form>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
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
