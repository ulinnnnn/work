<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shop_coupon.model.*"%>
 

<%
	CoupService coupSvc = new CoupService();
	List<CoupVO> list = coupSvc.getAll();
	pageContext.setAttribute("list",list);
	
	CoupVO coupVO = (CoupVO) request.getAttribute("coupVO");
	String coup_status = "";
%>

<html>
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <title>listAllCoup.jsp</title>

  <!-- GOOGLE FONTS -->
  <link href="https://fonts.googleapis.com/css?family=Karla:400,700|Roboto" rel="stylesheet">
  <link href="assets2/plugins/material/css/materialdesignicons.min.css" rel="stylesheet" />
  <link href="assets2/plugins/simplebar/simplebar.css" rel="stylesheet" />

  <!-- PLUGINS CSS STYLE -->
  <link href="assets2/plugins/nprogress/nprogress.css" rel="stylesheet" />
  
  
  <link href="assets2/plugins/prism/prism.css" rel="stylesheet" />
  
  
  <!-- MONO CSS -->
  <link id="main-css-href" rel="stylesheet" href="assets2/css/mono.css" />

  


  <!-- FAVICON -->
  <link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/img/favicon.png">

  <script src="assets2/plugins/nprogress/nprogress.js"></script>
  
<style>

.sidebar{
	overflow:visible;
}

</style> 
  
  
</head>


  <body class="navbar-fixed sidebar-fixed" id="body" onload="connect()" onunload="disconnect()">
  
  <jsp:include page="/assets/headerBack.jsp"></jsp:include> 

<div class="content-wrapper">
<div class="content">
<div class="card card-default">
  <div class="px-6 py-4">
    <div class="card-header">
    <h3>優惠卷管理</h3>
  </div>

  </div>
</div>


<FORM METHOD="post" ACTION="coup.do">
<div class="card card-default">
  <div class="card-header">
    <h2>新增優惠券</h2>
  </div>
  <div class="card-body">
    <div class="row">
    


      <div class="col-md-3 col-xl-3">
          <div class="row mb-2">
            <div class="col-md-12 col-xl-12">
              <div class="form-group">
                <label for="firstName">優惠券序號</label>
                <span class="d-block mt-1">*隨機產生不重複</span>
              </div>
            </div>
            <div class="col-md-12 col-xl-12">
              <div class="form-group">
                <label for="lastName">折扣數：</label>
                <input type="text" class="form-control" id="coup_discount"
                name="coup_discount" value="0.5">
              </div>
            </div>

            <div class="col-md-12 col-xl-12">
            <div class="form-group">
              <label for="userName">新增數量：</label>
              <input type="text" class="form-control" id="coup_amount"
              name="coup_amount" value="2">
            </div>
          </div>

          </div>

          <div class="d-flex justify-content-end mt-6">
          	<input type="hidden" name="action" value="insert">
            <button onclick="sendMessage();" type="submit" class="btn btn-primary mb-2 btn-pill" 
            style="background:#ffb703;border-color: #ffb703;">新增優惠券</button>
          </div>
 
      </div>

       <div class="col-md-1 col-xl-1">
      </div> 
  </FORM> 
 
      
<!-- 這裡是“新增優惠券” -->
<%
	//用coup_status查詢優惠券
	coup_status = "新增優惠券";
	List<CoupVO> createList = coupSvc.getCoupStatus(coup_status);
   	for(int i = 0; i < createList.size(); i++){
   		coupVO = createList.get(i);
%>
      <div class="col-md-2 col-xl-2">
        <div class="card py-3 mb-4">
          <div class="card-body">
            <h5 class="card-title ">優惠卷</h5>
            <ul>
              <li>序號:</li>
               <li><%=coupVO.getCoupNo()%></li>
              <li>折扣數: <%=coupVO.getCoupDiscount()%></li>
              <li>領取會員: 無</li>
              <li>狀態：</li>
            </ul>
            
            <h4><span class="badge badge-secondary badge-pill" style="margin-top:15px;background:#ef476f;">
            <%=coupVO.getCoupStatus()%></span></h4>
          </div>
        </div>
      </div>
<%}%>

    </div>

</div>
</div>




<!-- 這裡是“未領取” -->
<div class="card card-default">
  <div class="card-header">
    <h2>未領取優惠券</h2>
  </div>

  <div class="card-body">
    <div class="row">
    
<%
	coup_status = "未領取";
	createList = coupSvc.getCoupStatus(coup_status);
	for(int i = 0; i < createList.size(); i++){
		coupVO = createList.get(i);
%>

      <div class="col-md-3 col-xl-2">
        <div class="card py-3 mb-4">
          <div class="card-body">
            <h5 class="card-title ">優惠卷</h5>
            <ul>
              <li>序號:</li>
               <li><%=coupVO.getCoupNo()%></li>
              <li>折扣數: <%=coupVO.getCoupDiscount()%></li>
              <li>領取會員: 無</li>
              <li>狀態：</li>
            </ul>
            
            <h4><span class="badge badge-light badge-pill" style="margin-top:15px;"><%=coupVO.getCoupStatus()%></span></h4>
          </div>
        </div>
      </div>

<%}%>

    </div>
  </div>
</div>



<!-- 這裡是“已領取” -->
<div class="card card-default">
  <div class="card-header">
    <h2>已領取優惠券</h2>
  </div>
  <div class="card-body">
    <div class="row">
    
 <%
 	coup_status = "已領取";
	createList = coupSvc.getCoupStatus(coup_status);
	for(int i = 0; i < createList.size(); i++){
		coupVO = createList.get(i);
 %>   
 
      <div class="col-md-3 col-xl-2">
        <div class="card py-3 mb-4">
          <div class="card-body">
            <h5 class="card-title ">優惠卷</h5>
            <ul>
              <li>序號:</li>
              <li><%=coupVO.getCoupNo()%></li>
              <li>折扣數: <%=coupVO.getCoupDiscount()%></li>
              <li>領取會員: <%=coupVO.getMemNo()%></li>
              <li>狀態：</li>
            </ul>
            
            <h4><span class="badge badge-success badge-pill" style="margin-top:15px;"><%=coupVO.getCoupStatus()%></span></h4>
          </div>
        </div>
      </div>
      
  <%}%>
    </div>

  </div>
</div>


<!-- 這裡是“使用完畢” -->
<div class="card card-default">
  <div class="card-header">
    <h2>使用完畢優惠券</h2>
  </div>
  <div class="card-body">
    <div class="row">
 <%
	coup_status = "使用完畢";
	createList = coupSvc.getCoupStatus(coup_status);
	for(int i = 0; i < createList.size(); i++){
		coupVO = createList.get(i);
 %>
    
      <div class="col-md-3 col-xl-2">
        <div class="card py-3 mb-4">
          <div class="card-body">
            <h5 class="card-title ">優惠卷</h5>
            <ul>
              <li>序號:</li>
               <li><%=coupVO.getCoupNo()%></li>
              <li>折扣數: <%=coupVO.getCoupDiscount()%></li>
              <li>領取會員: <%=coupVO.getMemNo()%></li>
              <li>狀態：</li>
            </ul>
            
            <h4><span class="badge badge-warning badge-pill" style="margin-top:15px;"><%=coupVO.getCoupStatus()%></span></h4>
          </div>
        </div>
      </div>
      
 <%}%>

    </div>

  </div>
</div>



</div>




    

                    <script src="assets2/plugins/jquery/jquery.min.js"></script>
                    <script src="assets2/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
                    <script src="assets2/plugins/simplebar/simplebar.min.js"></script>
                    <script src="https://unpkg.com/hotkeys-js/dist/hotkeys.min.js"></script>

                    
                    
                    <script src="assets2/plugins/prism/prism.js"></script>
                    
                    
                    <script src="assets2/js/mono.js"></script>
                    <script src="assets2/js/chart.js"></script>
                    <script src="assets2/js/map.js"></script>
                    <script src="assets2/js/custom.js"></script>

<jsp:include page="/assets/footerBack.jsp"></jsp:include> 

</div>
</div>
</div>

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
			/* var messagesArea = document.getElementById("messagesArea"); */
			//這裡接收到json字串
			var jsonObj = JSON.parse(event.data);
			/* var message = jsonObj.mem_no + ": " + jsonObj.message + "\r\n";
			messagesArea.value = messagesArea.value + message; */
			console.log("這裡收到通知不做事");
		};
		
		webSocket.onclose = function(event){
			//這裡可做前端畫面改變
			console.log("斷線了！！NotificationWS");
		};

	}
	
	function sendMessage(){
		console.log("通知已發送");
		var coup_discount = $('#coup_discount').val();
		var coup_amount = $('#coup_amount').val();
		var jsonObj = {
			"coup_discount" : coup_discount,
			"coup_amount" : coup_amount
		}
		
		webSocket.send(JSON.stringify(jsonObj));
	
	}
	
	function disconnect(){
		webSocket.close();
		//這裡可做前端畫面改變
	}

</script>
</html>