<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>���z�n�X</title>

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
  background:#f2f2f2;
  display: table;
  margin: 5px auto;
}

#mybtn_rewrite{ 
  display: table; 
  margin: 5px auto; 
 } 

#myBtn, #rewrite{
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

body #confirm{
    text-align: center;
}

</style>
</head>
<body class="hold-transition sidebar-mini">

	<jsp:include page="../assets/headerBack.jsp"></jsp:include>

	<!-- 	<p> -->
	<%-- 		�˷R��<b>${empVO.empName}</b> --%>
	<!-- 	</p> -->
	<!-- 	<p>���߱z�I�z����¾�H�w���Q�H�X�C �O�_��ܧ�i�������z�n�X�A�ȡH (�H�ͳQ�n�X) �n�X�A�ȡG</p> -->
	<!-- 	<a href="http://www.dajiamazu.org.tw/content/news/news01.aspx">�������Y��</a> -->
	<!-- 	<a href="">�ŷ줧����()�n���D)</a> -->
	<!-- 	<a href="">���Q���]��</a> -->

	<!-- 	<div> -->
	<%-- 		<canvas id="demo" width="400" height="200"> --%>
	<!-- 			�z���s�������䴩Canvas�A�Фɯűz���s�����Ψϥ�Chrome�C   -->
	<%-- 		</canvas> --%>
	<!-- 	</div> -->
	<!-- 	<div id=signPic></div> -->

	<%-- 	<input type="hidden" id="empNo" name=empNo value="${empVO.empNo}"> --%>

	<!-- 	<div> -->
	<!-- 		<button id="myBtn">�W��</button> -->
	<!-- 		<button id="rewrite">���g</button> -->
	<!-- 	</div> -->
	<div class="joe">
		<div class="wrapper">

			<!-- Content Wrapper. Contains page content -->
			<!--   <div class="content-wrapper"> -->
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>
								<b>�n�X</b>���q�@�i�I
							</h1>
<!-- 							<samll>�ֳt�{�H�A���]�A��</samll> -->
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
									<i class="fas fa-info"></i> �ֳt��¾�A���]�A��
								</h5>
								�X�j�]�F�ܡH���z�n�X�A���z����¾�{�H�A�K�h�P���󭱹ﭱ�������C
							</div>


							<!-- Main content -->
							<div class="invoice p-3 mb-3">
								<!-- title row -->
								<div class="row">
									<div class="col-12">
										<h4>
											<i class="fas fa-globe"></i> �Щ�U��ñ�W�G
											<!--                     <small class="float-right">Date: 2/10/2014</small> -->
										</h4>
									</div>
									<!-- /.col -->
								</div>
								<!--info row -->
								<div class="row invoice-info">
									<div class="col-sm-12 invoice-col">

										<canvas id="demo" width="800" height="300">
										�z���s�������䴩Canvas�A�Фɯűz���s�����Ψϥ�Chrome�C  
										</canvas>

										<div id=signPic></div>
										<input type="hidden" id="empNo" name=empNo
											value="${empVO.empNo}">

										<div id="mybtn_rewrite">
											<button class="btn btn-primary" id="myBtn">�W��</button>
											<button class="btn btn-primary" id="rewrite">���g</button>
										</div>

									</div>

									<!-- /.col -->
								</div>
								<!-- /.row -->

								<div class="row">
									<!-- accepted payments column -->
									<div class="col-6">
										<p class="lead">�`�N�ƶ�:</p>
									
										<p class="text-muted well well-sm shadow-none"
											style="margin-top: 10px;">�T�w��A�t�αN��20������A�N�z��¾�]���������ǰe������A�бz�ⴤ�o����20�������]���ɶ��C </p>
									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->

								<!-- this row will not appear when printing -->
								<div class="row">
									<div class="col-12" id="confirm" >
										<input type="button" value="�T�w�n�X(���z)" class="btn btn-primary" onclick="location.href='resign2.jsp'">
									</div>
								</div>
							</div>
							<!-- /.invoice -->
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
	var myBtn = document.getElementById("myBtn");
	var empNo = document.getElementById("empNo").value;
	myBtn.addEventListener("click", function() {
		var dataURL = demo.toDataURL();

		$.ajax({
			url : "resign",
			type : "post",
			data : {
				empNo:empNo,
				signPic : dataURL
			},
			success: function(){
				showSignPic()
			}
		})
	});
	
		function showSignPic(){
<%-- 			var txt =  <img src="<%=request.getContextPath()%>/backEndG5/signPic?empNo=empNo">  --%>
			$('#demo').hide();
			$('#mybtn_rewrite').hide();
<%-- 			$('#signPic').html('<img src="<%=request.getContextPath()%>/backEndG5/signPic?empNo='+'e005">') --%>
			$('#signPic').html('<img height=30% src="<%=request.getContextPath()%>/backEndG5/signPic?empNo='+ empNo +'">')
		}
		

		// �D�ءG �ЧQ��Canvas�s�@�@�Ӥp�e�a
		// �ǲ߭��I�G
		// 1. Canvasø�s�ϧ�
		// 2. mousedown, mousemove, mouseup�ƥ�����

		function init() {

			// 0. �����ܼ�
			var lastX = 0, lastY = 0; // �ƹ��̫��I������m
			var isDrawing = false; // �O�_���b�e��?

			// 1. ���DOM����
			var demo = document.getElementById("demo");
			// 		var size = document.getElementById("size");
			var eraser = document.getElementById("eraser");
			// 		var pen = document.getElementById("pen");
			// 		var color = document.getElementById("color");

			// 2. ���o2D context ���ܡGgetContext('2d')
			var ctx = demo.getContext('2d');

			// 3. ��l�Ƶe���Ѽ�
			ctx.lineWidth = "4";
			ctx.strokeStyle = "#002b80";
			// ctx.lineJoin = 'round'; //round���꩷�C
			ctx.lineCap = 'round'; //round���꩷�C(���u�Y���꩷�A���M�ݰ_�ӷ|���x�εe��)

			// 4. �g�@��draw�禡�A�ǤJ�_�l�I�P���I�A�e�@���u
			function draw(startX, startY, endX, endY) {
				// �s�ؤ@��Path ���ܡGbeginPath()
				ctx.beginPath();
				// �_�I ���ܡGmoveTo(x,y)
				ctx.moveTo(startX, startY);
				// ���I ���ܡGlineTo(x,y)
				ctx.lineTo(endX, endY);
				// ø�s���| ���ܡGstroke()
				ctx.stroke();
			}

			// 5. ���դ@�U�A�O�_�i�H�e�u�H
			// draw(0, 0, 100, 100);

			// 6. ���Umousedown�ƥ�
			demo.addEventListener('mousedown', function(e) {

				// ����I������m�A���_�l�I�Cconsole.log("[START] offsetX: " + e.offsetX, "offsetY: " + e.offsetY);
				console.log("[START] offsetX: " + e.offsetX, "offsetY: "
						+ e.offsetY);
				// ��s�̷s��m
				lastX = e.offsetX, lastY = e.offsetY;

				// �窱�A�����b�e��
				isDrawing = true;
			});
			// 7. ���Umousemove�ƥ�
			demo.addEventListener('mousemove', function(e) {
				// �p�G�S�����b�e�ϡA���X�禡������U����ø��
				if (!isDrawing)
					return; //�p�G���O���b�e�ϡA�N���X

				// ����I������m�A�����~�I�Cconsole.log("[MOVE] offsetX: " + e.offsetX, "offsetY: " + e.offsetY);
				console.log("[MOVE] offsetX: " + e.offsetX, "offsetY: "
						+ e.offsetY);
				// �_�I
				var startX = lastX;
				var startY = lastY;
				// ���I
				var endX = e.offsetX;
				var endY = e.offsetY;
				// ����禡draw�e�u
				draw(startX, startY, endX, endY);
				// ���I => �_�I
				lastX = endX;
				lastY = endY;

			});
			// 8. ���Umouseup�ƥ�
			demo.addEventListener('mouseup', function(e) {
				// �窱�A�����b�e��
				isDrawing = false;

			});
			// 9. �ܧ�u���ʲ� ���Uchange�ƥ�
			// 		size.addEventListener('change', function() {
			// 			ctx.lineWidth = parseInt(size.value);
			// 		});

			// 10. �ܧ�u���C�� ���Uchange�ƥ�
			// 		color.addEventListener('change', function() {
			// 			ctx.strokeStyle = color.value;
			// 		});

			// 11. �e�� ���Uclick�ƥ� ����C�⬰�襤���C��
			// 		pen.addEventListener('click', function() {
			// 			ctx.strokeStyle = color.value;
			// 		});

			// 12. ����� ���Uclick�ƥ� ����C�⬰�զ�
			// 		eraser.addEventListener('click', function() {
			// 			ctx.strokeStyle = 'white';
			// 		});

			
			//���g
			var rewrite = document.getElementById("rewrite");

			rewrite.addEventListener("click", function() {
				ctx.clearRect(0, 0, demo.width, demo.height);
			})
		}

		window.onload = init;
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