<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.func.model.*" %>

<%
	FuncVO funcVO = (FuncVO) request.getAttribute("funcVO"); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>新增權限項目</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="assets2/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="assets2/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">

<!-- Icons -->
<link rel="shortcut icon" href="../assets/img/favicon.png">
	
<style>
/* .up-scroll .navbar-scrollUp.navbar-sticky.navbar-scrollUp { */
/* 	transform: inherit; */
/* } */

.bg-gradient-primary {
    background: rgba(0,0,0,0.85) linear-gradient(180deg,rgba(0,0,0,0),rgba(0,0,0,0)) repeat-x!important;
}

.sidebar{
overflow-y:visible;
}   

.content{
	margin:0px 0px 13% 0px;
}

.joe.wrapper{
	height:100%;
}

</style>

	
</head>
<body class="hold-transition sidebar-mini">
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
								<h3>權限資料管理</h3>
							</td>
						</tr>
					</table>
				
				</div>
			</nav>
		</div>
	</div>
	
<div class="joe">		
	<div class="wrapper">
		<!-- Content Wrapper. Contains page content -->
<!-- 		<div class="content-wrapper"> -->
		<div>

			<!-- Main content -->
			<section class="content">
				<div class="container">
					<div class="row">
						<div class="col-2"></div>
						<!-- left column -->
						<div class="col-8">
							<!-- general form elements -->
							<div class="card card-primary">
								<div class="card-header">
									<h3 class="card-title">新增權限資料</h3>
								</div>
								<!-- /.card-header -->
								<!-- form start -->
								<c:if test="${not empty errMessages}">
									<font style="color: red">請修正錯誤:</font>
									<c:forEach var="mes" items="${errMessages}">
										<font style="color: red">${mes}</font>
									</c:forEach>
								</c:if>

								<form role="form" method=post action="func">
									<div class="card-body">
										<div class="form-group">
											<label for="exampleInputEmail1">權限名稱</label> 
											<input type="text" class="form-control" name="funcName" value="${funcVO.funcName}">
										</div>
										<div class="form-group">
											<label for="exampleInputPassword1">內容概述</label> 
											<input type="text" class="form-control" name="funcDesc" value="${funcVO.funcDecs}">												
											
										</div>

										<!-- /.card-body -->

										<div class="card-footer">
											<input type="hidden" name="action" value="add">
											<button type="submit" class="btn btn-primary">確認新增</button>
										</div>
								</form>

								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
						<!--/.col (right) -->
						<div class="col-2"></div>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->
</div>
		
			<!-- FOOTER -->
<jsp:include page="../assets/footerBack.jsp"></jsp:include>		
</div>
</div>
</div>
	<!-- jQuery -->
	<script src="assets2/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="assets2/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- bs-custom-file-input -->
	<script
		src="assets2/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
	<!-- AdminLTE App -->
	<script src="assets2/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="assets2/dist/js/demo.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			bsCustomFileInput.init();
		});
	</script>
	

</body>
</html>
