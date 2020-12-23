<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>

<style type="text/css">
#demo {
	border: 3px solid brown;
}

.panel .region {
	display: inline-block;
	margin: 5px;
}
</style>
</head>
<body>
	
		<p>���߱z�I�z����¾�H�w���Q�H�X�C �O�_��ܧ�i�������z�n�X�A�ȡH (�H�ͳQ�n�X) �n�X�A�ȡG</p>
		<a href="http://www.dajiamazu.org.tw/content/news/news01.aspx">�������Y��</a>
		<a href="">�ŷ줧����()�n���D)</a>
		<a href="">���Q���]��</a>

		<div>
			<canvas id="demo" width="400" height="200">
				�z���s�������䴩Canvas�A�Фɯűz���s�����Ψϥ�Chrome�C  
			</canvas>
		</div>
		<div id=signPic></div>

		<input type="hidden" id="empNo" name=empNo value="${empVO.empNo}">

		<div>
			<button id="myBtn">�W��</button>
			<button id="rewrite">���g</button>
		</div>
	
	<script type="text/javascript">
		var myBtn = document.getElementById("myBtn");

		myBtn.addEventListener("click", function() {
			var dataURL = demo.toDataURL();

			$.ajax({
				url : "resign",
				type : "post",
				data : {
					dataa : dataURL
				}
			})

		});

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




</body>
</html>