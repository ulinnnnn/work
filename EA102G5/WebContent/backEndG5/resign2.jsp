<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>進階物理登出</title>

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
								<b>完全物理</b>登出
								<samll id="subtitle">(登出人生)</samll>
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
									<i class="fas fa-info"></i> 進階功能解鎖！！！
								</h5>
								感謝您選用物理登出功能。您已解鎖更進階的「完全物理登出」(登出人生)了！是否考慮使用服務呢？
							</div>
							<div>
								<button type="button" class="btn btn-primary" id="showMore">了解詳情</button>
							</div>

							<div id="showInfo">
								<!-- Main content -->
								<div class="invoice p-3 mb-3">
									<!-- title row -->
									<div class="row">
										<div class="col-12">
											<h4>
												<i class="fas fa-globe"></i> 一條龍<b>登出</b>服務：
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
														<td class=imgText>資深法師 物理超渡</td>
														<td class=imgText>專業團隊 護送直達</td>
														<td class=imgText>與海為鄰 清幽長伴</td>
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
											<p class="lead">您值得信賴的好選擇：</p>

											<p class="text-muted well well-sm shadow-none"
												style="margin-top: 10px;">1. 凡本公司員工，皆可享有一條龍服務「八折」優惠。</p>
											<p class="text-muted well well-sm shadow-none"
												style="margin-top: 10px;">2.
												使用物理登出之員工，不用再說，剩下的八成費用由公司支付，請您一定要體驗一次！</p>
											<p class="text-muted well well-sm shadow-none"
												style="margin-top: 10px;">3.
												我們消波塊採用國產高級水泥，並聘雇具合格執照之專業技師加工製作，品質優良，冬暖夏涼。</p>
											<p class="text-muted well well-sm shadow-none"
												style="margin-top: 10px;">4. 欲了解更多詳情，請與我們聯繫。</p>
										</div>
										<!-- /.col -->
									</div>
									<!-- /.row -->
								<div>
								<br>
								<div class="col-4">
											<p class="lead">合作夥伴：</p>
									<table>
										<thead>
											<tr>
												<td><img class=resign2Img src="img/r04.jpg"></td>																									
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class=imgText>霍格華茲學院 台中分校</td>
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
										onclick="location.href='http://www.dajiamazu.org.tw/'">立即使用</button>
									<button type="button" class="btn btn-primary"
										onclick="location.href='resign3.jsp'">以後再說</button>
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