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
    <h3>�u�f���޲z</h3>
  </div>

  </div>
</div>


<FORM METHOD="post" ACTION="coup.do">
<div class="card card-default">
  <div class="card-header">
    <h2>�s�W�u�f��</h2>
  </div>
  <div class="card-body">
    <div class="row">
    


      <div class="col-md-3 col-xl-3">
          <div class="row mb-2">
            <div class="col-md-12 col-xl-12">
              <div class="form-group">
                <label for="firstName">�u�f��Ǹ�</label>
                <span class="d-block mt-1">*�H�����ͤ�����</span>
              </div>
            </div>
            <div class="col-md-12 col-xl-12">
              <div class="form-group">
                <label for="lastName">�馩�ơG</label>
                <input type="text" class="form-control" id="coup_discount"
                name="coup_discount" value="0.5">
              </div>
            </div>

            <div class="col-md-12 col-xl-12">
            <div class="form-group">
              <label for="userName">�s�W�ƶq�G</label>
              <input type="text" class="form-control" id="coup_amount"
              name="coup_amount" value="2">
            </div>
          </div>

          </div>

          <div class="d-flex justify-content-end mt-6">
          	<input type="hidden" name="action" value="insert">
            <button onclick="sendMessage();" type="submit" class="btn btn-primary mb-2 btn-pill" 
            style="background:#ffb703;border-color: #ffb703;">�s�W�u�f��</button>
          </div>
 
      </div>

       <div class="col-md-1 col-xl-1">
      </div> 
  </FORM> 
 
      
<!-- �o�̬O���s�W�u�f�顨 -->
<%
	//��coup_status�d���u�f��
	coup_status = "�s�W�u�f��";
	List<CoupVO> createList = coupSvc.getCoupStatus(coup_status);
   	for(int i = 0; i < createList.size(); i++){
   		coupVO = createList.get(i);
%>
      <div class="col-md-2 col-xl-2">
        <div class="card py-3 mb-4">
          <div class="card-body">
            <h5 class="card-title ">�u�f��</h5>
            <ul>
              <li>�Ǹ�:</li>
               <li><%=coupVO.getCoupNo()%></li>
              <li>�馩��: <%=coupVO.getCoupDiscount()%></li>
              <li>����|��: �L</li>
              <li>���A�G</li>
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




<!-- �o�̬O��������� -->
<div class="card card-default">
  <div class="card-header">
    <h2>������u�f��</h2>
  </div>

  <div class="card-body">
    <div class="row">
    
<%
	coup_status = "�����";
	createList = coupSvc.getCoupStatus(coup_status);
	for(int i = 0; i < createList.size(); i++){
		coupVO = createList.get(i);
%>

      <div class="col-md-3 col-xl-2">
        <div class="card py-3 mb-4">
          <div class="card-body">
            <h5 class="card-title ">�u�f��</h5>
            <ul>
              <li>�Ǹ�:</li>
               <li><%=coupVO.getCoupNo()%></li>
              <li>�馩��: <%=coupVO.getCoupDiscount()%></li>
              <li>����|��: �L</li>
              <li>���A�G</li>
            </ul>
            
            <h4><span class="badge badge-light badge-pill" style="margin-top:15px;"><%=coupVO.getCoupStatus()%></span></h4>
          </div>
        </div>
      </div>

<%}%>

    </div>
  </div>
</div>



<!-- �o�̬O���w����� -->
<div class="card card-default">
  <div class="card-header">
    <h2>�w����u�f��</h2>
  </div>
  <div class="card-body">
    <div class="row">
    
 <%
 	coup_status = "�w���";
	createList = coupSvc.getCoupStatus(coup_status);
	for(int i = 0; i < createList.size(); i++){
		coupVO = createList.get(i);
 %>   
 
      <div class="col-md-3 col-xl-2">
        <div class="card py-3 mb-4">
          <div class="card-body">
            <h5 class="card-title ">�u�f��</h5>
            <ul>
              <li>�Ǹ�:</li>
              <li><%=coupVO.getCoupNo()%></li>
              <li>�馩��: <%=coupVO.getCoupDiscount()%></li>
              <li>����|��: <%=coupVO.getMemNo()%></li>
              <li>���A�G</li>
            </ul>
            
            <h4><span class="badge badge-success badge-pill" style="margin-top:15px;"><%=coupVO.getCoupStatus()%></span></h4>
          </div>
        </div>
      </div>
      
  <%}%>
    </div>

  </div>
</div>


<!-- �o�̬O���ϥΧ����� -->
<div class="card card-default">
  <div class="card-header">
    <h2>�ϥΧ����u�f��</h2>
  </div>
  <div class="card-body">
    <div class="row">
 <%
	coup_status = "�ϥΧ���";
	createList = coupSvc.getCoupStatus(coup_status);
	for(int i = 0; i < createList.size(); i++){
		coupVO = createList.get(i);
 %>
    
      <div class="col-md-3 col-xl-2">
        <div class="card py-3 mb-4">
          <div class="card-body">
            <h5 class="card-title ">�u�f��</h5>
            <ul>
              <li>�Ǹ�:</li>
               <li><%=coupVO.getCoupNo()%></li>
              <li>�馩��: <%=coupVO.getCoupDiscount()%></li>
              <li>����|��: <%=coupVO.getMemNo()%></li>
              <li>���A�G</li>
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
			//�o�̥i���e�ݵe��������
			console.log("�s�u��FNotificationWS");
		};
		
		webSocket.onmessage = function(event){
			/* var messagesArea = document.getElementById("messagesArea"); */
			//�o�̱�����json�r��
			var jsonObj = JSON.parse(event.data);
			/* var message = jsonObj.mem_no + ": " + jsonObj.message + "\r\n";
			messagesArea.value = messagesArea.value + message; */
			console.log("�o�̦���q��������");
		};
		
		webSocket.onclose = function(event){
			//�o�̥i���e�ݵe������
			console.log("�_�u�F�I�INotificationWS");
		};

	}
	
	function sendMessage(){
		console.log("�q���w�o�e");
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
		//�o�̥i���e�ݵe������
	}

</script>
</html>