<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>�t�αN��20������q������</title>

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

#escape{
  width:80%;
  display:table;
  margin:5px auto;
}

#notice{
	color:blue;
}

#countdown{
	color:red;
	font-size:30px;
	font-weight:bold;
}

</style>
</head>
<body class="hold-transition sidebar-mini">

	<jsp:include page="../assets/headerBack.jsp"></jsp:include>


	<div class="joe">
		<div class="wrapper">

			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-8">
							<h1>
								<b>�g�I</b> ���z�n�X�w����
<!-- 								<samll id="subtitle">(�n�X�H��)</samll> -->
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
								<h4 id="notice">
									<i class="fas fa-info"></i> �t�αN��<b style="color:red;font-size:30px">20����</b>��A�N�z��¾�������q������I
								</h4>
								<h5 >�бz�Y���ʨ��A�ⴤ����20�������]���ɶ��C</h5>         
							</div>

							<div id="showInfo">
								<!-- Main content -->
								<div class="invoice p-3 mb-3">
									<!-- title row -->
									<div class="row">
										<div class="col-12">
											<h4>
												<i class="fas fa-globe"></i> �z���]���ɶ� �ٳѤU <font id="countdown">20:00:00</font>
											</h4>
										</div>
										<!-- /.col -->
									</div>
									<!--info row -->

									<%-- 								<input type="hidden" id="empNo" name=empNo value="${empVO.empNo}"> --%>

									<div id="infoTable" class="row invoice-info">
										<div class="col-sm-12 invoice-col">
											
										</div>

										<!-- /.col -->
									</div>
									<!-- /.row -->

									<div id="rowText" class="row">
										<!-- accepted payments column -->
										<div class="col-8">
										<br>
											<p class="lead">  �̨����}���q�覡��ĳ�G</p>
											<img id=escape src="<%=request.getContextPath()%>/backEndG5/img/escape.jpg">
											<br>
											<p class="text-muted well well-sm shadow-none"
												style="margin-top: 10px;">���n��q��T�G</p>
												<ul>
													<li>�x�W�j�����G55688</li>
													<li>�j���|�����G(03)355-8000</li>
													<li><a href="https://www.railway.gov.tw">�O�W�K��</a></li>
													<li><a href="https://www.thsrc.com.tw">�x�W���K</a></li>
													<li><a href="https://www.taoyuan-airport.com">����ھ���</a></li>												
												</ul>												
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
										onclick="location.href='resign4.jsp'">�n ���D�F</button>
								</div>
							</div>
						</div>
						<!-- /.col -->
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
		//countdown
		let startMin = 20;
		let timeSeconds = startMin * 60;
		let timeCent = timeSeconds*100;
		
		let countdown = document.getElementById("countdown");
		
		setInterval(updateTimer,10);
		
		function updateTimer(){
			let minutes = Math.floor(timeCent/100/60);
			let seconds = Math.floor(timeCent/100%60);
			let centSeconds = timeCent % 100;
						
			seconds = seconds<10 ? '0'+seconds : seconds;
			centSeconds = centSeconds<10 ? '0'+centSeconds : centSeconds;
			
			countdown.innerHTML = minutes+":"+seconds+":"+centSeconds;
			
			timeCent--;
// 			timeSeconds--;	
			
			timeCent = timeCent<0 ? 0 : timeCent;
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