<%@ page import="com.serv.model.*"%>
<%@ page import="com.emp.model.*"%>
<%@ page import="com.auth.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="Big5"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	ServService servSvc = new ServService();
	List<ServVO> servList = servSvc.getAll();
	pageContext.setAttribute("servList", servList);

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

	<link rel="stylesheet" type="text/css" href="assets3/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets3/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets3/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets3/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets3/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets3/css/util.css">
	<link rel="stylesheet" type="text/css" href="assets3/css/main.css">
<!--===============================================================================================-->

<style>
 .up-scroll .navbar-scrollUp.navbar-sticky.navbar-scrollUp { 
  transform: inherit;   
 } 

.container-table100 {
  width: 1500px;
}

th, td {
  padding-right: 0px;
}

.joe td.column1,.joe td.column2{
  font-family:Microsoft JhengHei;
  font-weight: bold;
  font-size:15px;
}

.column1{
  text-align:center;
  width:7%;
}

.column2 {
  text-align:center;
  width: 6%;
}

.column3 {
  text-align:left;
  width: 18%;
}

td.cell100.column3{
  padding-left:15px;
}

th.cell100.column3{
  padding-left:15px;
}

.column4 {
  width: 10%;
}

.column5 {
  background-color:#ffffff;
  width: 2%;
}

.column6 {
  text-align:center;
  width: 6%; 
}

.column7 {
	text-align:left;
	width: 18%;
}

td.cell100.column7 { 
  padding-left:15px;

}

th.cell100.column7 {
  padding-left:15px;
  
}

.column8 {
  width: 10%;
}

.column9 {
  text-align:center;
  width: 10%;
}

.column10 {
  width: 7%;

}

.column11 {
  width: 1%;

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
								<h3>客戶反映&回應</h3>
							</td>
						</tr>
					</table>
				
				</div>
			</nav>
		</div>
</div>
<div class="joe">
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100" style="width:100%;min-height:650px">				
				<div class="table100 ver1 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">客服編號</th>
									<th class="cell100 column2">訂單編號</th>
									<th class="cell100 column3">客戶傳送內容</th>
									<th class="cell100 column4">傳送時間</th>
									<th class="cell100 column5"></th>
									<th class="cell100 column6">員工編號</th>
									<th class="cell100 column7">員工回覆內容</th>
									<th class="cell100 column8">回覆時間</th>
									<th class="cell100 column9">回覆狀態</th>
									<th class="cell100 column10"></th>
									<th class="cell100 column11"></th>
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
							<c:forEach var="servVO" items="${servList}">
							
								<tr class="row100 body">
									<td class="cell100 column1">${servVO.servNo}</td>
									<td class="cell100 column2">${servVO.ordNo}</td>
									<td class="cell100 column3">${servVO.custCont}</td>
									<td class="cell100 column4">
										<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${servVO.custContTime}" />
									</td>
									<td class="cell100 column5"></td>
									<td class="cell100 column6">${servVO.empNo}</td>
									<td class="cell100 column7">${servVO.resCont}</td>
									<td class="cell100 column8">
										<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${servVO.resContTime}" />
									</td>
									<td class="cell100 column9"> 
										<c:if test="${empty servVO.resCont}">
											<font color="red">尚未回覆</font>
										</c:if></td>
									</td>
									<td class="cell100 column10">
										<form method="post" action="serv.do">
											<input type="hidden" name="servNo" value="${servVO.servNo}">
											
											<input type="hidden" name="action" value="getOne">
						
											<c:if test="${fn:contains(empAuthList,'f003')}">
												 <button type="submit" class="btn btn-primary btn-block" style="background-color:#6c7ae0">回覆/修改</button>
											</c:if> 
										</form>
									</td>
									<td class="cell100 column11"></td>									
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
			<!-- FOOTER -->
<jsp:include page="../assets/footerBack.jsp"></jsp:include>			
</div>

</div>
</div>

	
	<!-- table js -->


<!--===============================================================================================-->	
	<script src="assets3/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="assets3/vendor/bootstrap/js/popper.js"></script>
	<script src="assets3/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="assets3/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="assets3/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function(){
				ps.update();
			})
		});
				
	</script>
<!--===============================================================================================-->
	<script src="assets3/js/main.js"></script>
	
</body>
</html>