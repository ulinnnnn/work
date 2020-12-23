
<%@page import="java.util.*"%>
<%@page import="com.func.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	FuncService funcSvc = new FuncService();
	List<FuncVO> funcList = funcSvc.getAll();
	pageContext.setAttribute("funcList", funcList);
%>

<!DOCTYPE html>
<html>
<head>

<!-- SITE TITTLE -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>權限項目管理列表</title>

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

.mainContent{
    padding: 5px 0 10px 0;
}

.page-title h3{
	font-family: Microsoft JhengHei;
	font-weight:bold;
	color: #808080;
}
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
								<h3>權限項目列表</h3>
							</td>
						</tr>
					</table>
				</div>
			</nav>
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
										value="新增"
										onclick="location.href='<%=request.getContextPath()%>/backEndG5/addFunc.jsp'"
										style="font-weight: bold">
								</div>
								<div class="orderBox myAddress wishList">
									<h2>權限項目</h2>
									<div class="table-responsive">
										<table class="table">
											<thead>
												<tr>
													<th>編號</th>
													<th>權限名稱</th>
													<th>內容概述</th>
													<th></th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="funcVO" items="${funcList}">
													<tr>
														<td>${funcVO.funcNo}</td>
														<td>${funcVO.funcName}</td>
														<td>${funcVO.funcDesc}</td>

														<td class="">
															<form method="post" action="func">
																<input type="hidden" name="funcNo"
																	value="${funcVO.funcNo}"> <input type="hidden"
																	name="action" value="getOneUpdate"> <input
																	class="btn btn-sm btn-secondary-outlined" type="submit"
																	value="修改">
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
	<!-- FOOTER -->
	<jsp:include page="../assets/footerBack.jsp"></jsp:include>
</body>
</html>

