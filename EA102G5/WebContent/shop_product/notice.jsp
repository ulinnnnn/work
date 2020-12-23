<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shop_product.model.*"%>
<%@ page import="com.shop_track.model.*"%>



<!DOCTYPE html>
<html>
<head>

    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>notice.jsp</title>

    <!-- PLUGINS CSS STYLE -->
    <link href="<%=request.getContextPath()%>/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/plugins/selectbox/select_option1.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/plugins/fancybox/jquery.fancybox.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/plugins/rateyo/jquery.rateyo.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/plugins/iziToast/css/iziToast.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/plugins/prismjs/prism.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/plugins/revolution/css/settings.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/plugins/animate/animate.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/plugins/slick/slick.css" media="screen">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/plugins/slick/slick-theme.css" media="screen">


    <!-- CUSTOM CSS -->
    <link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/color-option5.css" id="option_style">

    <!-- Icons -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/img/favicon.png">

    
  </head>

  <body onload="connect()" onunload="disconnect()">
  
  <!-- 	<h1>這裡是notice.jsp</h1>
	<textarea id="messagesArea"></textarea> -->
	
	<a class="btn btn-default" data-toggle="modal" href=".quick-view" id="notice"></a>
	
	<div class="modal fade quick-view" tabindex="-1" role="dialog">
			<div class="modal-dialog"  style="width:600px">
				<div class="modal-content">
					<div class="modal-body" style="width:600px">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<div class="media flex-wrap">

							<div class="media-body" style="letter-spacing:2px">
								<h2>有最新的優惠券可以領了！！</h2>
								<h3>快來搶券！！</h3>
								<h4><font style="color:#f24;" class="coup_discount"></font>折 優惠券</h4>
								<br>
								<h5>只有 <font style="color:#f24;" class="coup_amount"></font>張</h5>
								<p></p>
								<div class="btn-area">
									<a href="shopCoup.jsp" class="btn btn-primary btn-block">前往優惠券 <i class="fa fa-angle-right" aria-hidden="true"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		
		<script src="<%=request.getContextPath()%>/assets/plugins/jquery/jquery.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/plugins/jquery/jquery-migrate-3.0.0.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/plugins/jquery-ui/jquery-ui.js"></script>
		<script src="<%=request.getContextPath()%>/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/plugins/slick/slick.js"></script>
		<script src="<%=request.getContextPath()%>/assets/plugins/fancybox/jquery.fancybox.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/plugins/iziToast/js/iziToast.js"></script>
		<script src="<%=request.getContextPath()%>/assets/plugins/prismjs/prism.js"></script>
		<script src="<%=request.getContextPath()%>/assets/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/plugins/countdown/jquery.syotimer.js"></script>
		<script src="<%=request.getContextPath()%>/assets/plugins/velocity/velocity.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/plugins/rateyo/jquery.rateyo.min.js"></script>
		<script src="<%=request.getContextPath()%>/assets/js/custom.js"></script>

	

</body>

<script>

	var MyPoint = "/NotificationWS/M0001";
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/',1));
	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;

	var statusOutput = document.getElementById("statusOutput");
	var webSocket;

	function connect(){
		//create a websocket
		webSocket = new WebSocket(endPointURL);
		
		webSocket.onopen = function(event){
			//這裡可做前端畫面的改變
			console.log("連線到了NotificationWS");
		};
		
		webSocket.onmessage = function(event){

			//這裡接收到json字串
			var jsonObj = JSON.parse(event.data);
/* 			var message = jsonObj.coup_discount + ": " + jsonObj.coup_amount + "\n";
			messagesArea.value = messagesArea.value + message; */
			var coup_discount = jsonObj.coup_discount;
			var coup_amount = jsonObj.coup_amount; 
			var discount  = parseFloat(coup_discount)*10;
			$('.coup_discount').html(discount);
			$('.coup_amount').html(coup_amount);
			/* var messagesArea = document.getElementById("messagesArea"); */
			/* console.log("notice.jsp也有收到通知"); */
			document.getElementById("notice").click();
			
		};

		webSocket.onclose = function(event){
			//這裡可做前端畫面改變
			updateStatus("目前斷線了");
		};

	}
	
	
	
	function sendMessage(){
		var jsonObj = {
			"mem_no" : "M0001",
			"message" : "發送了一張優惠卷"
		}
		
		webSocket.send(JSON.stringify(jsonObj));
		
	}
	
	function disconnect(){
		webSocket.close();
		//這裡可做前端畫面改變
	}

</script>
</html>
