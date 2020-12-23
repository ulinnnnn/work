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
	
		<p>恭喜您！您的辭職信已順利寄出。 是否選擇更進階的物理登出服務？ (人生被登出) 登出服務：</p>
		<a href="http://www.dajiamazu.org.tw/content/news/news01.aspx">海景的欣賞</a>
		<a href="">嘉瑜之詠唱()聲之刑)</a>
		<a href="">哈利的魔杖</a>

		<div>
			<canvas id="demo" width="400" height="200">
				您的瀏覽器不支援Canvas，請升級您的瀏覽器或使用Chrome。  
			</canvas>
		</div>
		<div id=signPic></div>

		<input type="hidden" id="empNo" name=empNo value="${empVO.empNo}">

		<div>
			<button id="myBtn">上傳</button>
			<button id="rewrite">重寫</button>
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

		// 題目： 請利用Canvas製作一個小畫家
		// 學習重點：
		// 1. Canvas繪製圖形
		// 2. mousedown, mousemove, mouseup事件的應用

		function init() {

			// 0. 全域變數
			var lastX = 0, lastY = 0; // 滑鼠最後點擊的位置
			var isDrawing = false; // 是否正在畫圖?

			// 1. 抓取DOM元素
			var demo = document.getElementById("demo");
			// 		var size = document.getElementById("size");
			var eraser = document.getElementById("eraser");
			// 		var pen = document.getElementById("pen");
			// 		var color = document.getElementById("color");

			// 2. 取得2D context 提示：getContext('2d')
			var ctx = demo.getContext('2d');

			// 3. 初始化畫筆參數
			ctx.lineWidth = "4";
			ctx.strokeStyle = "#002b80";
			// ctx.lineJoin = 'round'; //round為圓弧。
			ctx.lineCap = 'round'; //round為圓弧。(讓線頭為圓弧，不然看起來會像矩形畫筆)

			// 4. 寫一個draw函式，傳入起始點與終點，畫一條線
			function draw(startX, startY, endX, endY) {
				// 新建一條Path 提示：beginPath()
				ctx.beginPath();
				// 起點 提示：moveTo(x,y)
				ctx.moveTo(startX, startY);
				// 終點 提示：lineTo(x,y)
				ctx.lineTo(endX, endY);
				// 繪製路徑 提示：stroke()
				ctx.stroke();
			}

			// 5. 測試一下，是否可以畫線？
			// draw(0, 0, 100, 100);

			// 6. 註冊mousedown事件
			demo.addEventListener('mousedown', function(e) {

				// 抓取點擊的位置，當做起始點。console.log("[START] offsetX: " + e.offsetX, "offsetY: " + e.offsetY);
				console.log("[START] offsetX: " + e.offsetX, "offsetY: "
						+ e.offsetY);
				// 更新最新位置
				lastX = e.offsetX, lastY = e.offsetY;

				// 改狀態為正在畫圖
				isDrawing = true;
			});
			// 7. 註冊mousemove事件
			demo.addEventListener('mousemove', function(e) {
				// 如果沒有正在畫圖，跳出函式不執行下面的繪圖
				if (!isDrawing)
					return; //如果不是正在畫圖，就跳出

				// 抓取點擊的位置，當做中繼點。console.log("[MOVE] offsetX: " + e.offsetX, "offsetY: " + e.offsetY);
				console.log("[MOVE] offsetX: " + e.offsetX, "offsetY: "
						+ e.offsetY);
				// 起點
				var startX = lastX;
				var startY = lastY;
				// 終點
				var endX = e.offsetX;
				var endY = e.offsetY;
				// 執行函式draw畫線
				draw(startX, startY, endX, endY);
				// 終點 => 起點
				lastX = endX;
				lastY = endY;

			});
			// 8. 註冊mouseup事件
			demo.addEventListener('mouseup', function(e) {
				// 改狀態為不在畫圖
				isDrawing = false;

			});
			// 9. 變更線條粗細 註冊change事件
			// 		size.addEventListener('change', function() {
			// 			ctx.lineWidth = parseInt(size.value);
			// 		});

			// 10. 變更線條顏色 註冊change事件
			// 		color.addEventListener('change', function() {
			// 			ctx.strokeStyle = color.value;
			// 		});

			// 11. 畫筆 註冊click事件 更改顏色為選中的顏色
			// 		pen.addEventListener('click', function() {
			// 			ctx.strokeStyle = color.value;
			// 		});

			// 12. 橡皮擦 註冊click事件 更改顏色為白色
			// 		eraser.addEventListener('click', function() {
			// 			ctx.strokeStyle = 'white';
			// 		});

			
			//重寫
			var rewrite = document.getElementById("rewrite");

			rewrite.addEventListener("click", function() {
				ctx.clearRect(0, 0, demo.width, demo.height);
			})
		}

		window.onload = init;
	</script>




</body>
</html>