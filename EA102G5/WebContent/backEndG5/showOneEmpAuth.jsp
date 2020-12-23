<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="Big5"%>
<%@page import="java.util.*"%>
<%@page import="com.auth.model.*"%>
<%@page import="com.emp.model.*"%>
<%@page import="com.func.model.*"%>
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

input {
    display:inline-block;
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
								<h3>設定個人權限</h3>
							</td>
						</tr>
					</table>
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
							<form method="post" action="auth">
								<table>
									<tbody>
										<tr class="row100 body">
											<td class="cell100 column1">${empVO.empNo}</td>
											<td class="cell100 column2">${empVO.empName}</td>
											<td class="cell100 column3">
											<c:forEach var="funcVO"	items="${funcList}">
													<input type="checkbox" name="${funcVO.funcNo}"
														value="${funcVO.funcNo}" class="ch"
													<c:if test="${oneEmpFuncsList.contains(funcVO.funcNo)}">
														checked			
													</c:if>>${funcVO.funcName}
													<br>
												</c:forEach> <br> <input type="checkbox" id="selectAll">全選
											</td>

											<td class="cell100 column4"><input type="hidden"
												name="empNo" value="${empVO.empNo}"> <input
												type="hidden" name="action" value="update">
												<button type="submit" class="btn btn-primary btn-block"
													style="background-color: #6c7ae0">確認</button> <!-- 													<form method="post" action="auth">				 												 -->
												<!-- 													<input type="hidden" name="action" value="getOneEmp"> -->
												<%-- 													<input type="hidden" name="empNo" value="${empVO.empNo}"> --%>
												<!-- 													<button type="submit" class="btn btn-primary btn-block" style="background-color:#6c7ae0">權限設定</button> -->
												<!-- 													</form>  --></td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
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

	<script>
		var selectAll = document.getElementById("selectAll");

		selectAll.addEventListener("click", function() {
			var ch = document.getElementsByClassName('ch');
			if (selectAll.checked) {
				for (var i = 0; i < ch.length; i++) {
					ch[i].checked = true;
				}
			} else {
				for (var i = 0; i < ch.length; i++) {
					ch[i].checked = false;
				}
			}
		})
	</script>

	<!-- FOOTER -->
<jsp:include page="../assets/footerBack.jsp"></jsp:include>	
</body>
</html>