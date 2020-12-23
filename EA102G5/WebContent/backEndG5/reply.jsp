<%@ page import="com.emp.model.*"%>
<%@ page import="com.shop_order.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="Big5"%>
<%@ page import="com.serv.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	ServVO servVO = (ServVO) request.getAttribute("servVO");
	EmpVO empVO = (EmpVO) session.getAttribute("EmpVO");

	OrdService ordSvc = new OrdService();
	List<OrdVO> ordList = ordSvc.getAll();
	pageContext.setAttribute("ordList", ordList);

	MemService memSvc = new MemService();
	List<MemVO> memList = memSvc.selectAllMem();
	pageContext.setAttribute("memList", memList);

	// 	OrdVO ordVO = (OrdVO) request.getAttribute("ordVO");
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


<!-- 第二版css -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="assets2/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="assets2/dist/css/adminlte.min.css">
<!-- summernote -->
<link rel="stylesheet"
	href="assets2/plugins/summernote/summernote-bs4.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">


<style>
.up-scroll .navbar-scrollUp.navbar-sticky.navbar-scrollUp {
	transform: inherit;
}

.bg-gradient-primary {
	background: rgba(0, 0, 0, 0.85) linear-gradient(180deg, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0)) repeat-x !important;
}

.sidebar {
	overflow-y: visible;
}
</style>

</head>
<body>
	<jsp:include page="../assets/headerBack.jsp"></jsp:include>

	<!-- 	<form method="post" action="serv.do"> -->
	<!-- ./col -->
	<div class="content">
		<div class="row">
			<div class="col-md-2"
				style="margin: auto; text-align: center; padding-right: 2px; padding-left: 5px">
				<div>
					<img src="../assets/img/pinwei2.gif" style="width: 80%">
				</div>
				<div style="font-size: 15px; font-weight: bold">▲優良客服態度示範</div>
			</div>
			<div class="col-md-10" style="padding-left: 0px">

				<div class="card">
					<div class="card-header">
						<h3 class="card-title">
							<i class="fas fa-text-width"></i> <b>客戶回應表單</b>
						</h3>
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<dl class="row">
							<dt class="col-sm-2">訂單編號</dt>
							<dd class="col-sm-2">${servVO.ordNo}</dd>
							<dt class="col-sm-8"></dt>

							<dt class="col-sm-2">會員編號</dt>
							<c:forEach var="ordVO" items="${ordList}">
								<c:if test="${ordVO.ordNo == servVO.ordNo}">
									<dd class="col-sm-2">${ordVO.memNo}</dd>
									<dt class="col-sm-8"></dt>
									<c:forEach var="memVO" items="${memList}">
										<c:if test="${memVO.mem_no == ordVO.memNo}">
											<dt class="col-sm-2">會員姓名</dt>
											<dd class="col-sm-2">${memVO.mem_name}</dd>
											<dt class="col-sm-8"></dt>
										</c:if>
									</c:forEach>
								</c:if>
							</c:forEach>

							<dt class="col-sm-2">反應內容</dt>
							<dd class="col-sm-10">${servVO.custCont}</dd>

							<dt class="col-sm-2">反應時間</dt>
							<dd class="col-sm-10">
								<fmt:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${servVO.custContTime}" />

							</dd>
						</dl>
					</div>
					<!-- /.card-body -->
				</div>
				<!-- /.card -->
			</div>
			<!-- ./col -->
		</div>
	</div>

	<br>
	<section class="content">
		<div class="row">
			<div class="col-1"></div>

			<div class="col-12">

				<div class="card card-outline card-info">
					<div class="card-header">
						<h2 class="card-title">
							<b>就你他媽意見最多！</b><small>所以到底是有什麼問題，請問???</small>
						</h2>
					</div>
					<!-- /.card-header  -->
					<form method="post" action="serv.do">

						<div class="card-body pad">
							<label for="">回覆人：</label> <font>${empVO.empName}</font>

							<%-- <font>${empVO.empNo}</font>  --%>
							<div class="mb-3">
								<textarea class="textarea" placeholder="Place some text here"
									name="replyCont"
									style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">${servVO.resCont}</textarea>
							</div>
							<input type="hidden" name="action" value="sendCustText">
							<input type="hidden" name="servNo" value="${servVO.servNo}">
							<input type="hidden" name="empNo" value="${empVO.empNo}">
							<button type="submit" class="btn btn-primary btn-block">確定送出</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>


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

	<!-- 	sweet alert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<!-- 第二版js -->
	<!-- jQuery -->
	<!-- 	<script src="assets2/plugins/jquery/jquery.min.js"></script> -->
	<!-- Bootstrap 4 -->
	<!-- 	<script src="assets2/plugins/bootstrap/js/bootstrap.bundle.min.js"></script> -->
	<!-- AdminLTE App -->
	<script src="assets2/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="assets2/dist/js/demo.js"></script>
	<!-- Summernote -->
	<script src="assets2/plugins/summernote/summernote-bs4.min.js"></script>
	<script>
		$(function() {
			// Summernote
			$('.textarea').summernote()
		})
	</script>
	<script>
		let replyCont = document.querySelectorAll('[name="replyCont"]')[0];
		// 	replyCont.innerHTML = "${servVO.resCont}";
		data = {};
		data.replyCont = "${servVO.resCont}";

		// 	console.log(REPLYCONT.TRIM());
	</script>

	<!-- FOOTER -->
	<jsp:include page="../assets/footerBack.jsp"></jsp:include>
</body>
</html>