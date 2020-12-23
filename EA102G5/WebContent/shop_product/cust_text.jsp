<%@page import="com.serv.model.ServService"%>
<%@ page import="java.util.*"%>
<%@ page import="com.emp.model.*"%>
<%@ page import="com.auth.model.*"%>
<%@ page import="com.serv.model.*"%>
<%@ page import="com.shop_order.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	OrdVO ordVO = (OrdVO) request.getAttribute("ordVO");

	ServService servSvc = new ServService();
	List<ServVO> servList = servSvc.getAll();
	pageContext.setAttribute("servList", servList);
%>

<!DOCTYPE html>
<html>
<head>
<!-- SITE TITTLE -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>聯絡客服</title>

<!-- PLUGINS CSS STYLE -->
<link
	href="<%=request.getContextPath()%>/assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/jquery-ui/jquery-ui.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/selectbox/select_option1.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/fancybox/jquery.fancybox.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/rateyo/jquery.rateyo.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/iziToast/css/iziToast.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/prismjs/prism.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/revolution/css/settings.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/animate/animate.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/plugins/slick/slick.css"
	media="screen">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/plugins/slick/slick-theme.css"
	media="screen">


<!-- CUSTOM CSS -->
<link href="<%=request.getContextPath()%>/assets/css/style.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/color-option5.css"
	id="option_style">

<!-- Icons -->
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/assets/img/favicon.png">


<!-- 第二版css -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/shop_product/assets4/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/shop_product/assets4/dist/css/adminlte.min.css">
<!-- summernote -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/shop_product/assets4/plugins/summernote/summernote-bs4.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">

<style>
.content {
	margin: 40px 0 40px 0;
}

.topBar {
	height: 35px;
}

#logout {
	font-size: 13px;
}

.btn-success {
	background-color: #49c32c;
}

#tableDiv {
	display: table;
	margin: 0 auto 50px auto;
}

#table1 {
	width:100%;
	border: 0px solid red;
}

.center{
	text-align:center;
}

#milos{
  width:35%;
  display:table;
  margin:5px auto 50px auto;
}
}
</style>
</head>

<body id="body" class="body-wrapper version1 up-scroll">

	<div style="overflow: visible">
		<div>
			<jsp:include page="/assets/topBar.jsp"></jsp:include>
		</div>
	</div>

	<!-- 第二版留言板 -->
	<section class="content">
		<div class="row">
			<div class="col-1"></div>

			<div class="col-10">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h2 class="card-title">
							<s><b>X!就你TM問題最多！</b></s> <b>請問您有什麼問題呢？</b><small>(請寫於下方欄位)</small>
						</h2>

					</div>
					<!-- /.card-header -->
					<form method="post" action="toServ">
						<div class="card-body pad">
							<label for="">訂單編號</label>
							<p>${ordVO.ordNo}</p>

							<div class="mb-3">
								<textarea class="textarea" placeholder="Place some text here"
									name="custCont"
									style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;"></textarea>
							</div>
							<input type="hidden" name="action" value="sendCustText">
							<input type="hidden" name="ordNo" value="${ordVO.ordNo}">
							<button type="submit" class="btn btn-primary btn-block">確定送出</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-1"></div>
			<!-- /.col-->
		</div>
		<!-- ./row -->
	</section>
	<!-- /.content -->
<section class="content">
		<div class="row">
		<div class="col-1"></div>	
	<div id="tableDiv" class="col-10">
		<table id="table1" class="table table-striped">
		<col style="width: 15%">
		<col style="width: 70%">
		<col style="width: 15%">
			<c:forEach var="servVO" items="${servList}">
				<c:if test="${ordVO.ordNo == servVO.ordNo}">
					<thead>
						<tr>
							<td class="center"><b>原始訊息：</b></td>
							<td>${servVO.custCont}</td>
							<td class="center">
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${servVO.custContTime}"/>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="center"><b>客服回應：</b></td>
							<td>${servVO.resCont}</td>
							<td class="center">
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${servVO.resContTime}"/>
							</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</c:if>
			</c:forEach>
		</table>
	</div>
		<div class="col-1"></div>	
</div>
</section>
	
	<div >
	<h5 style="text-align:center;font-weight:bold;">辣個客服回覆也許會遲到，但絕不缺席！ 請您耐心等候，謝謝。</h5>
	<img id="milos" src="../empLogin/img/Ricardo_Milos.gif">
	
	</div>

	<!-- FOOTER -->
	<jsp:include page="/assets/footer.jsp"></jsp:include>

	<script
		src="<%=request.getContextPath()%>/assets/plugins/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/jquery/jquery-migrate-3.0.0.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/jquery-ui/jquery-ui.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/slick/slick.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/fancybox/jquery.fancybox.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/iziToast/js/iziToast.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/prismjs/prism.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/countdown/jquery.syotimer.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/velocity/velocity.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/rateyo/jquery.rateyo.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/custom.js"></script>

	<!-- 第二版js -->
	<!-- jQuery -->
	<!-- 	<script src="assets2/plugins/jquery/jquery.min.js"></script> -->
	<!-- Bootstrap 4 -->
	<!-- 	<script -->
	<!-- 		src="assets2/plugins/bootstrap/js/bootstrap.bundle.min.js"></script> -->
	<!-- AdminLTE App -->
	<script src="<%=request.getContextPath()%>/shop_product/assets4/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<%=request.getContextPath()%>/shop_product/assets4/dist/js/demo.js"></script>
	<!-- Summernote -->
	<script
		src="<%=request.getContextPath()%>/shop_product/assets4/plugins/summernote/summernote-bs4.min.js"></script>
	<script>
		$(function() {
			// Summernote
			$('.textarea').summernote()
		})
	</script>


	<jsp:include page="/assets/loginModal.jsp"></jsp:include>
	<jsp:include page="/assets/memChat3.jsp"></jsp:include>
</body>
</html>
