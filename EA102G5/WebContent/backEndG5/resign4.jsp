<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>讚！我們法院見</title>

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

#court{
  width:60%;
  display:table;
  margin:5px auto;
}

#notice{
	color:red;
}

</style>
</head>
<body class="hold-transition sidebar-mini">

	<jsp:include page="../assets/headerBack.jsp"></jsp:include>


	<div class="joe">
		<div class="wrapper">
			<section class="content-header">
			<img id="court" src="<%=request.getContextPath()%>/backEndG5/img/court.jpg">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6"></div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							

							<div id="showInfo">
								<!-- Main content -->
								<div class="invoice p-3 mb-3">
									<!-- title row -->
									<div class="row">
										<div class="col-12">
											<h4>
<!-- 												<i class="fas fa-globe"></i> 小叮嚀： -->
											</h4>
										</div>
										<!-- /.col -->
									</div>
									<!--info row -->
									
									<div id="infoTable" class="row invoice-info">
										<div class="col-sm-12 invoice-col">
											
										</div>
										<!-- /.col -->
									</div>
									<!-- /.row -->

									<div id="rowText" class="row">
										<!-- accepted payments column -->
										<div class="col-12">
											<p class="lead">親愛的  ${empVO.empName}  您好：</p>
											<p class="lead">感謝您物理登出，我們將盡快了解您所捅出來的包有多大，並會盡速向您提告，請您耐心等候法院傳票，謝謝您。</p>
										</div>
										<!-- /.col -->
									</div>
									<!-- /.row -->
								<div>								
								<div class="col-4">
											
								</div>
							</div>
								
								</div>
								<!-- /.invoice -->															<!-- 	/showInfo	 -->
							<!-- this row will not appear when printing -->
							<div class="row">
								<div class="col-12" id="confirm">							
									<button type="button" class="btn btn-primary"
										onclick="location.href='<%=request.getContextPath()%>/empLogin/logout'">坐等一波法院傳票</button>
								</div>
							</div>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
				</div>
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
		//countdown
		let startMin = 20;
		let timeSeconds = startMin * 60;
		
		let countdown = document.getElementById("countdown");
		
		setInterval(updateTimer,1000);
		
		function updateTimer(){
			let minutes = Math.floor(timeSeconds/60);
			let seconds = timeSeconds % 60;
			
			seconds = seconds<10 ? '0'+seconds : seconds;
			
			countdown.innerHTML = minutes+":"+seconds;
			timeSeconds--;	
			
			timeSeconds = timeSeconds<0 ? 0 : timeSeonds;
		}
		

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