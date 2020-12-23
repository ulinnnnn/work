<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>�i�����z�n�X</title>

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


<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>


<style type="text/css">
#demo {
	border: 3px solid brown;
	background: #f2f2f2;
	display: table;
	margin: 5px auto;
}

#mybtn_rewrite {
	display: table;
	margin: 5px auto;
}

#myBtn, #rewrite {
	margin: 5px 5px;
}

.panel .region {
	display: inline-block;
	margin: 5px;
}

.bg-gradient-primary {
	background: rgba(0, 0, 0, 0.85) linear-gradient(180deg, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0)) repeat-x !important;
}

.sidebar {
	overflow-y: visible;
}

.content {
	margin: 0px 0px 5% 0px;
}

.joe.wrapper {
	height: 100%;
}

button.btn-primary {
	background-color: #3366ff;
	border: 0px;
	color: #fff
}

body #confirm {
	text-align: center;
}

#subtitle {
	font-size: 20px;
}

.resign2Img {
	width: 330px;
	margin: 10px 3px;
}

table {
	width: 100%;
	text-align: center;
	margin: 20px 0;
}

.imgText {
	margin: 0 auto;
	font-size: 15px;
	font-weight: bold;
	text-align: center;
	font-weight: bold;
}

#rowText{
	margin:30px 0 20px 20px;
}

#showInfo {
	display: none;
}
</style>
</head>
<body class="hold-transition sidebar-mini">

	<jsp:include page="../assets/headerBack.jsp"></jsp:include>


	<div class="joe">
		<div class="wrapper" style="min-height: 750px">

			<!-- Content Wrapper. Contains page content -->
			<!--   <div class="content-wrapper"> -->
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>
								<b>�������z</b>�n�X
								<samll id="subtitle">(�n�X�H��)</samll>
							</h1>
						</div>

						<div class="col-sm-6"></div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<div class="callout callout-info">
								<h5>
									<i class="fas fa-info"></i> �i���\�����I�I�I
								</h5>
								�P�±z��Ϊ��z�n�X�\��C�z�w�����i�����u�������z�n�X�v(�n�X�H��)�F�I�O�_�Ҽ{�ϥΪA�ȩO�H
							</div>
							<div>
								<button type="button" class="btn btn-primary" id="showMore">�F�ѸԱ�</button>
							</div>

							<div id="showInfo">
								<!-- Main content -->
								<div class="invoice p-3 mb-3">
									<!-- title row -->
									<div class="row">
										<div class="col-12">
											<h4>
												<i class="fas fa-globe"></i> �@���s<b>�n�X</b>�A�ȡG
												<!--                     <small class="float-right">Date: 2/10/2014</small> -->
											</h4>
										</div>
										<!-- /.col -->
									</div>
									<!--info row -->

									<%-- 								<input type="hidden" id="empNo" name=empNo value="${empVO.empNo}"> --%>

									<div id="infoTable" class="row invoice-info">
										<div class="col-sm-12 invoice-col">
											<table>
												<thead>
													<tr>
														<td><a href="https://youtu.be/0F1wwin0e3Q?t=173">
																<img class=resign2Img src="img/r01.jpg">
														</a></td>
														<td><a
															href="https://www.youtube.com/watch?v=j9V78UbdzWI&ab_channel=DigiNeko">
																<img class=resign2Img src="img/r02.jpg">
														</a></td>
														<td><a href="http://www.dajiamazu.org.tw/"> <img
																class=resign2Img src="img/r03.jpg"></a></td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td class=imgText>��`�k�v ���z�W��</td>
														<td class=imgText>�M�~�ζ� �@�e���F</td>
														<td class=imgText>�P�����F �M�ժ���</td>
													</tr>
												</tbody>
											</table>
										</div>

										<!-- /.col -->
									</div>
									<!-- /.row -->

									<div id="rowText" class="row">
										<!-- accepted payments column -->
										<div class="col-8">
											<p class="lead">�z�ȱo�H�઺�n��ܡG</p>

											<p class="text-muted well well-sm shadow-none"
												style="margin-top: 10px;">1. �Z�����q���u�A�ҥi�ɦ��@���s�A�ȡu�K��v�u�f�C</p>
											<p class="text-muted well well-sm shadow-none"
												style="margin-top: 10px;">2.
												�ϥΪ��z�n�X�����u�A���ΦA���A�ѤU���K���O�ΥѤ��q��I�A�бz�@�w�n����@���I</p>
											<p class="text-muted well well-sm shadow-none"
												style="margin-top: 10px;">3.
												�ڭ̮��i���ĥΰ겣���Ť��d�A�øu����X����Ӥ��M�~�ޮv�[�u�s�@�A�~���u�}�A�V�x�L�D�C</p>
											<p class="text-muted well well-sm shadow-none"
												style="margin-top: 10px;">4. ���F�ѧ�h�Ա��A�лP�ڭ��pô�C</p>
										</div>
										<!-- /.col -->
									</div>
									<!-- /.row -->
								<div>
								<br>
								<div class="col-4">
											<p class="lead">�X�@�٦�G</p>
									<table>
										<thead>
											<tr>
												<td><img class=resign2Img src="img/r04.jpg"></td>																									
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class=imgText>�N��د��ǰ| �x������</td>
											</tr>
										</tbody>
									</table>

								</div>
							</div>
								
								</div>
								<!-- /.invoice -->															<!-- 	/showInfo	 -->
							
						</div>
						<!-- /.col -->
						<!-- this row will not appear when printing -->
							<div class="row">
								<div class="col-12" id="confirm">
									<button type="button" class="btn btn-primary"
										onclick="location.href='http://www.dajiamazu.org.tw/'">�ߧY�ϥ�</button>
									<button type="button" class="btn btn-primary"
										onclick="location.href='resign3.jsp'">�H��A��</button>
								</div>
							</div>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->



	</div>
	<!-- ./wrapper -->
	<!-- FOOTER -->
	<jsp:include page="../assets/footerBack.jsp"></jsp:include>
	</div>
	</div>
	</div>

	<script type="text/javascript">
		// 	var showMore = document.getElementById("showMore");
		// 	showMore.addEventListener("click", function() {
		// 	});

		$("#showMore").click(function() {
			$("#showInfo").show();
		})
	</script>
	<!-- jQuery -->
	<script src="assets2/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="assets2/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="assets2/dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="assets2/dist/js/demo.js"></script>
</body>
</html>