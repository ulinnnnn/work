<%@page import="com.func.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="Big5"%>
<%@page import="java.util.*"%>
<%@page import="com.auth.model.*"%>
<%@page import="com.emp.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	AuthService authSvc = new AuthService();
	List<AuthVO> authList = authSvc.getAll();
	pageContext.setAttribute("authList", authList);

	EmpService empSvc = new EmpService();
	List<EmpVO> empList = empSvc.getAll();
	pageContext.setAttribute("empList", empList);

	FuncService funcSvc = new FuncService();
	List<FuncVO> funcList = funcSvc.getAll();
	pageContext.setAttribute("funcList", funcList);

	AuthService authSvc2 = new AuthService();

	AuthVO authVO = (AuthVO) request.getAttribute("authVO");
	List<AuthVO> oneEmpList = (List<AuthVO>) request.getAttribute("oneEmpList");

	List<String> oneEmpFuncsList = (List<String>) request.getAttribute("oneEmpFuncsList");
%>

<!DOCTYPE html>
<html>
<head>
<title>權限總覽</title>

<!-- SITE TITTLE -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>廢到笑後台首頁</title>

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


<!-- table css -->
<!--===============================================================================================-->

<link rel="stylesheet" type="text/css"
	href="assets3/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="assets3/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="assets3/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="assets3/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="assets3/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="assets3/css/util.css">
<link rel="stylesheet" type="text/css" href="assets3/css/main.css">
<!--===============================================================================================-->



<style>
/* .up-scroll .navbar-scrollUp.navbar-sticky.navbar-scrollUp { */
/* 	transform: inherit; */
/* } */

.container-table100 {
  margin-left: auto;
  margin-right: auto;
  width: 70%;
}

.column1{
  text-align:center;
  width:20%; 
  padding-left:20px;
}

.joe td.cell100.column1{
  font-family: Microsoft JhengHei; 
  font-size:20px;
}

.column2 {
  text-align:center;
  width: 20%; 
}

.joe td.cell100.column2{
  font-family: Microsoft JhengHei;
  font-size:20px;
}

.column3 {
  text-align:left;
  width: 35%;
}

td.cell100.column3{
  font-family: Microsoft JhengHei;
  padding-left:30px;
}

th.cell100.column3{
  padding-left:30px;
}

.column4 {
  width: 25%;
  padding-right:30px;
}

#body ,html{
	white-space: normal; 
}
</style>

</head>
<body id="body" class="body-wrapper version1 up-scroll">
	<jsp:include page="../assets/headerBack.jsp"></jsp:include>

	<div class="joe">
		<div class="main-wrapper">
			<!-- NAVBAR-->
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
								<h3>權限管理列表</h3>
							</td>
						</tr>
					</table>

					<!-- 					<button class="navbar-toggler" type="button" data-toggle="collapse" -->
					<!-- 						data-target=".navbar-ex1-collapse" -->
					<!-- 						aria-controls="navbar-ex1-collapse" aria-expanded="false" -->
					<!-- 						aria-label="Toggle navigation"> -->
					<!-- 						<span class="fa fa-bars"></span> -->
					<!-- 					</button> -->


					<!-- 					Collect the nav links, forms, and other content for toggling -->
					<!-- 					<div class="collapse navbar-collapse navbar-ex1-collapse"> -->

					<!-- 						<ul class="nav navbar-nav ml-auto"> -->

					<!-- 							<li class="nav-item dropdown active"><a -->
					<!-- 								href="javascript:void(0)" class="dropdown-toggle nav-link" -->
					<!-- 								data-toggle="dropdown" role="button" aria-haspopup="true" -->
					<!-- 								aria-expanded="false">管理員</a> -->
					<!-- 								<ul class="dropdown-menu dropdown-menu-left"> -->
					<%-- 																		<c:if test="${empAuthList.contains(\"f001\")}"> --%>
					<%-- 									<c:if test="${fn:contains(empAuthList,'f001')}"> --%>
					<!-- 										<li class=""> -->
					<%-- 										<a href="<%=request.getContextPath()%>/emp/showAll.jsp">管理員列表</a></li> --%>
					<%-- 									</c:if> --%>

					<%-- 									<c:if test="${fn:contains(empAuthList,'f002')}"> --%>
					<%-- 										<li><a href="<%=request.getContextPath()%>/serv/showAll.jsp">客服列表</a></li> --%>
					<%-- 									</c:if> --%>

					<%-- 									<c:if test="${fn:contains(empAuthList,'f004')}"> --%>
					<%-- 										<li><a href="<%=request.getContextPath()%>/func/showAll.jsp">功能列表</a></li> --%>
					<%-- 									</c:if> --%>

					<%-- 									<c:if test="${fn:contains(empAuthList,'f005')}"> --%>
					<%-- 										<li><a href="<%=request.getContextPath()%>/auth/showAll.jsp">權限管理列表</a></li> --%>
					<%-- 									</c:if> --%>

					<!-- 								</ul></li> -->

					<!-- 							<li class="nav-item dropdown"><a href="javascript:void(0)" -->
					<!-- 								class="dropdown-toggle nav-link" data-toggle="dropdown" -->
					<!-- 								role="button" aria-haspopup="true" aria-expanded="false">交換</a> -->
					<!-- 								<ul class="dropdown-menu dropdown-menu-left"> -->
					<!-- 									<li class=""><a href="about-us.html">About Us</a></li> -->
					<!-- 									<li class=""><a href="signup.html">Register</a></li> -->
					<!-- 									<li class=""><a href="signup-login.html">Register or -->
					<!-- 											Login</a></li> -->
					<!-- 									<li class=""><a href="login.html">Login</a></li> -->
					<!-- 									<li class="active"><a href="lost-password.html">Password -->
					<!-- 											Recovery</a></li> -->
					<!-- 									<li class=""><a href="privacy-policy.html">Privacy -->
					<!-- 											Policy</a></li> -->
					<!-- 									<li class=""><a href="terms-and-conditions.html">Terms -->
					<!-- 											&amp; Conditions</a></li> -->
					<!-- 									<li><a href="404.html">404 Not Found</a></li> -->
					<!-- 									<li><a href="coming-soon.html">Coming Soon</a></li> -->
					<!-- 								</ul></li> -->
					<!-- 							<li class="nav-item dropdown"><a href="javascript:void(0)" -->
					<!-- 								class="dropdown-toggle nav-link" data-toggle="dropdown" -->
					<!-- 								role="button" aria-haspopup="true" aria-expanded="false">直購</a> -->
					<!-- 								<ul class="dropdown-menu dropdown-menu-left"> -->
					<!-- 									<li class=""><a href="about-us.html">About Us</a></li> -->
					<!-- 									<li class=""><a href="signup.html">Register</a></li> -->
					<!-- 									<li class=""><a href="signup-login.html">Register or -->
					<!-- 											Login</a></li> -->
					<!-- 									<li class=""><a href="login.html">Login</a></li> -->
					<!-- 									<li class="active"><a href="lost-password.html">Password -->
					<!-- 											Recovery</a></li> -->
					<!-- 									<li class=""><a href="privacy-policy.html">Privacy -->
					<!-- 											Policy</a></li> -->
					<!-- 									<li class=""><a href="terms-and-conditions.html">Terms -->
					<!-- 											&amp; Conditions</a></li> -->
					<!-- 									<li><a href="404.html">404 Not Found</a></li> -->
					<!-- 									<li><a href="coming-soon.html">Coming Soon</a></li> -->
					<!-- 								</ul></li> -->
					<!-- 							<li class="nav-item dropdown"><a href="javascript:void(0)" -->
					<!-- 								class="dropdown-toggle nav-link" data-toggle="dropdown" -->
					<!-- 								role="button" aria-haspopup="true" aria-expanded="false">競標</a> -->
					<!-- 								<ul class="dropdown-menu dropdown-menu-left"> -->
					<!-- 									<li class=""><a href="about-us.html">About Us</a></li> -->
					<!-- 									<li class=""><a href="signup.html">Register</a></li> -->
					<!-- 									<li class=""><a href="signup-login.html">Register or -->
					<!-- 											Login</a></li> -->
					<!-- 									<li class=""><a href="login.html">Login</a></li> -->
					<!-- 									<li class="active"><a href="lost-password.html">Password -->
					<!-- 											Recovery</a></li> -->
					<!-- 									<li class=""><a href="privacy-policy.html">Privacy -->
					<!-- 											Policy</a></li> -->
					<!-- 									<li class=""><a href="terms-and-conditions.html">Terms -->
					<!-- 											&amp; Conditions</a></li> -->
					<!-- 									<li><a href="404.html">404 Not Found</a></li> -->
					<!-- 									<li><a href="coming-soon.html">Coming Soon</a></li> -->
					<!-- 								</ul></li> -->
					<!-- 							<li class="nav-item dropdown"><a href="javascript:void(0)" -->
					<!-- 								class="dropdown-toggle nav-link" data-toggle="dropdown" -->
					<!-- 								role="button" aria-haspopup="true" aria-expanded="false">商城</a> -->
					<!-- 								<ul class="dropdown-menu dropdown-menu-left"> -->
					<!-- 									<li class=""><a href="about-us.html">About Us</a></li> -->
					<!-- 									<li class=""><a href="signup.html">Register</a></li> -->
					<!-- 									<li class=""><a href="signup-login.html">Register or -->
					<!-- 											Login</a></li> -->
					<!-- 									<li class=""><a href="login.html">Login</a></li> -->
					<!-- 									<li class="active"><a href="lost-password.html">Password -->
					<!-- 											Recovery</a></li> -->
					<!-- 									<li class=""><a href="privacy-policy.html">Privacy -->
					<!-- 											Policy</a></li> -->
					<!-- 									<li class=""><a href="terms-and-conditions.html">Terms -->
					<!-- 											&amp; Conditions</a></li> -->
					<!-- 									<li><a href="404.html">404 Not Found</a></li> -->
					<!-- 									<li><a href="coming-soon.html">Coming Soon</a></li> -->
					<!-- 								</ul></li> -->

					<!-- 							<li class="nav-item dropdown"><a href="javascript:void(0)" -->
					<!-- 								class="dropdown-toggle nav-link" data-toggle="dropdown" -->
					<!-- 								role="button" aria-haspopup="true" aria-expanded="false">論壇</a> -->
					<!-- 							</li> -->
					<!-- 							<li><a href=""> </a></li> -->
					<!-- 							<li><a href=""> </a></li> -->
					<!-- 							<li><a href="" class="dropdown-toggle nav-link" -->
					<%-- 								style="font-size: 6px">安安~ ${empVO.empName} </a></li> --%>
					<!-- 							<li> -->
					<%-- 								                	<a class="dropdown-toggle nav-link">安安~ ${empVO.empName}</a>   --%>
					<%-- 								<a href="<%=request.getContextPath()%>/empLogin/logout" --%>
					<!-- 								class="dropdown-toggle nav-link" style="font-size: 6px">登出</a> -->
					<!-- 							</li> -->
					<!-- 							               
<!--               </ul> -->
					<!--             </div>/.navbar-collapse -->
				</div>
			</nav>
		</div>
	</div>

	<div class="joe">
		<div class="limiter">
			<div class="container-table100">
				<div class="wrap-table100">
					<div class="table100 ver1 m-b-110">
						<div class="table100-head">
							<table>
								<thead>
									<tr class="row100 head">
										<th class="cell100 column1">員工編號</th>
										<th class="cell100 column2">員工姓名</th>
										<th class="cell100 column3">功能權限</th>
										<th class="cell100 column4"></th>
									</tr>
								</thead>
							</table>
						</div>


						<div class="table100-body js-pscroll">
							<table>
								<tbody>
									<c:forEach var="empVO" items="${empList}">

										<tr class="row100 body">
											<td class="cell100 column1">${empVO.empNo}</td>
											<td class="cell100 column2">${empVO.empName}</td>
											<td class="cell100 column3">
												<%
													String empNo = ((EmpVO) pageContext.findAttribute("empVO")).getEmpNo();
														List<AuthVO> funcsList = authSvc2.getOneEmp(empNo);
														pageContext.setAttribute("funcsList", funcsList);
												%> <c:forEach var="authVO" items="${funcsList}">
													 	${authVO.funcName}
													 	<br>
												</c:forEach>

											</td>
											<td class="cell100 column4">
												<form method="post" action="auth">
													<input type="hidden" name="action" value="getOneEmp">
													<input type="hidden" name="empNo" value="${empVO.empNo}">
													<button type="submit" class="btn btn-primary btn-block"
														style="background-color: #6c7ae0;font-family: Microsoft JhengHei">權限設定</button>
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


	<!-- 	<!-- Modal -->
	<!-- 	<div class="modal fade" id="exampleModal" tabindex="-1" -->
	<!-- 		aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
	<!-- 		<div class="modal-dialog"> -->
	<!-- 			<div class="modal-content"> -->
	<!-- 				<div class="modal-header"> -->
	<!-- 					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5> -->
	<!-- 					<button type="button" class="close" data-dismiss="modal" -->
	<!-- 						aria-label="Close"> -->
	<!-- 						<span aria-hidden="true">&times;</span> -->
	<!-- 					</button> -->
	<!-- 				</div> -->
	<!-- 				<div class="modal-body"> -->
	<!-- 					<form method="post" action="auth"> -->
	<!-- 						<table> -->
	<!-- 							<tr> -->
	<!-- 								<th>員工編號</th> -->
	<!-- 								<th>員工姓名</th> -->
	<!-- 								<th>功能列表</th> -->
	<!-- 							</tr> -->

	<!-- 							<tr> -->
	<%-- 								<td>${empVO.empNo}</td> --%>
	<%-- 								<td>${empVO.empName}</td> --%>
	<%-- 								<td><c:forEach var="funcVO" items="${funcList}"> --%>
	<%-- 										<input type="checkbox" name="${funcVO.funcNo}" --%>
	<%-- 											value="${funcVO.funcNo}" class="ch" --%>
	<%-- 											<c:if test="${oneEmpFuncsList.contains(funcVO.funcNo)}"> --%>
	<!-- 																							checked			 -->
	<%-- 																						</c:if>>${funcVO.funcName} --%>
	<!-- 																						<br> -->
	<%-- 									</c:forEach> <br> <input type="checkbox" id="selectAll">全選</td> --%>

	<!-- 								<td><input type="hidden" name="empNo" -->
	<%-- 									value="${empVO.empNo}"> <input type="hidden" --%>
	<!-- 									name="action" value="update"> <input type="submit" -->
	<!-- 									value="修改確認"></td> -->
	<!-- 							</tr> -->
	<!-- 						</table> -->
	<!-- 					</form> -->
	<!-- 				</div> -->
	<!-- 				<div class="modal-footer"> -->
	<!-- 					<button type="button" class="btn btn-secondary" -->
	<!-- 						data-dismiss="modal">Close</button> -->
	<!-- 					<button type="button" class="btn btn-primary">Save changes</button> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->

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

	<!-- table js -->

	<!--===============================================================================================-->
	<script src="assets3/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="assets3/vendor/bootstrap/js/popper.js"></script>
	<script src="assets3/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="assets3/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="assets3/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function() {
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function() {
				ps.update();
			})
		});
	</script>
	<!--===============================================================================================-->
	<script src="assets3/js/main.js"></script>

	
</body>
</html>