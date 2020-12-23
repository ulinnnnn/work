<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shop_coupon.model.*"%>
<%@ page import="com.mem.model.*"%>

<%
	MemVO memVO = (MemVO)session.getAttribute("memVO");
%>

<html>
<head>

    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>shopCoup.jsp</title>

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

  <body id="body" class="body-wrapper version1 up-scroll" onload="connect()" onunload="disconnect()">
  
    <!-- header以下 -->
    <div class="main-wrapper" style="overflow:visible;">
    <div class="header clearfix">
   <jsp:include page="/assets/topBar.jsp" flush="true"/>
	</div>
	</div>
  <!-- header以上  -->

    <div class="main-wrapper">

      <!-- LIGHT SECTION -->
      <section class="lightSection clearfix pageHeader">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <div class="page-title">
                <h2>優惠券專區</h2>
              </div>
            </div>
            <div class="col-md-6">
              <ol class="breadcrumb pull-right">
                <li>
                  <a href="<%=request.getContextPath()%>/index1.jsp"
                  style="letter-spacing:1px">首頁</a>
                </li>
                <li class="active" style="letter-spacing:1px">優惠券</li>
              </ol>
            </div>
          </div>
        </div>
      </section>
      
      <!-- MAIN CONTENT SECTION -->
      <!-- <section>
      <div class="container">
      	 <div class="row">
            <div class="col-md-12" style="color:black;">
			 <div class="btn-group" role="group" aria-label="...">
                <a href="shop.jsp" class="btn btn-default"><i class="fa fa-th"></i>購物商城</a>
                <a href="shopOrder.jsp" class="btn btn-default active"><i class="fa fa-list"></i>購買訂單</a>
                <a href="shopTrack.jsp" class="btn btn-default"><i class="fa fa-gift" aria-hidden="true"></i>商品追蹤</a>
                <a href="shopCoup.jsp" class="btn btn-default"><i class="fa fa-ticket" aria-hidden="true"></i>優惠券</a>
         		</div>
            </div>
          </div>
      </div>
      </section> -->

      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix userProfile">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
			 <div class="btn-group" role="group" aria-label="...">
                <a href="shop.jsp" class="btn btn-default"><i class="fa fa-th"></i>購物商城</a>
                <a href="shopOrder.jsp" class="btn btn-default"><i class="fa fa-list"></i>訂單查詢</a>
                <a href="shopTrack.jsp" class="btn btn-default"><i class="fa fa-gift" aria-hidden="true"></i>我的收藏</a>
                <a href="shopCoup.jsp" class="btn btn-default active"><i class="fa fa-ticket" aria-hidden="true"></i>我的優惠券</a>
         		</div>
            </div>
          </div>
          
          
          <div class="row">
            <div class="col-sm-12">
              <div class="innerWrapper">
                <div class="orderBox myAddress wishList">
                  <h2>新增優惠券<p>快來搶券喔～</p></h2>

                </div>

  <div class="row">
  
 <%
 	//用狀態查優惠券
  	CoupService CoupSvc = new CoupService();
	/*  List<CoupVO> list  = CoupSvc.getAll();  */
 	String coup_status = "新增優惠券";
 	List<CoupVO> coupList = CoupSvc.getCoupStatus(coup_status);
 	for(int i = 0; i < coupList.size(); i++){
 		CoupVO coupVO = coupList.get(i);
 		double discount = coupVO.getCoupDiscount()*10;
 %>
	     
 <div class="col-md-4 col-xl-4">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/shop_product/coup.do">
    <div class="card py-3 mb-4">
      <div class="card-body" 
      style="box-shadow:0px 0px 15px rgba(0,0,0,0.15);background-color:#ffd166; border-radius: 6px;">
        <div class="row">
        <div class="col-md-7 col-xl-7">
          <h3>優惠券 <span class="badge badge-square" style="background: #ef476f;color:white;">新增</span></h3>
          <h6 class="card-text">序號:</h6>
          <h6 class="card-text"><%=coupVO.getCoupNo()%></h6>
          <h6 class="card-text">折扣數: <%=discount%> 折</h6>
        </div>
        <div class="col-md-5 col-xl-5">
          <button onclick='sendMessage("<%=coupVO.getCoupNo()%>")' id="<%=coupVO.getCoupNo()%>"  class="btn btn-success change"  type="submit" 
          style="letter-spacing: 5px; font-size: 20px; position: relative;
                 margin-top: 27%; margin-left:10%;background-color:#06d6a0;
                 color:#f7fff7; transition: 0.5s;overflow:hidden;">
           領券</button>
        </div>
      </div>
  
      </div>
    </div>
<input type="hidden" name="coup_no" value="<%=coupVO.getCoupNo()%>">  <!--被領走的優惠卷編號-->
<input type="hidden" name="mem_no"  value="<%=memVO.getMem_no()%>">  <!--這裡領卷的會員先寫死 -->
<input type="hidden" name="coup_status"  value="已領取"> <!--狀態改為已領取 -->
<input type="hidden" name="action"	value="update">
</FORM>
   
</div>


 <%}%> 
  </div>
  



</div>
</div>

                  
                
          
            </div>
          </div>
        </div>
      </section>

      <section class="mainContent clearfix userProfile"  style="margin-top: -100px">
        <div class="container">
          <div class="row">
            <div class="col-sm-12">
              <div class="innerWrapper">
                <div class="orderBox myAddress wishList">
                  <h2>我的優惠券</h2>
                </div>
                 <div class="row">
                 
<%
	String mem_no = memVO.getMem_no();
	List<CoupVO> memList = CoupSvc.getMemCoup(mem_no);
	for(int i =0; i < memList.size(); i++){
	 CoupVO coupVO = memList.get(i);	
	
%>

    <div class="col-md-3 col-xl-3">
    <div class="card py-3 mb-4">
      <div class="card-body" 
      style="box-shadow:0px 0px 15px rgba(0,0,0,0.15);background-color:#FFFDD0; border-radius: 6px;">
        <div class="row">
        <div class="col-md-8 col-xl-8">
          <h3>優惠券</h3>
          <h6 class="card-text">序號:</h6>
           <h6 class="card-text"><%=coupVO.getCoupNo()%></h6>
           <% double discount=coupVO.getCoupDiscount()*10;%>
          <h6 class="card-text">折扣數: <%=discount%>折</h6>
          
          <h6 class="card-text">優惠券狀態:</h6>
          <h4><span class="badge badge-secondary badge-pill" style="margin-top:10px;
          background-color:#DCDCDC;font-size:18px;padding:10px">
          <%=coupVO.getCoupStatus()%></span></h4>
        </div>
      </div>
        
        
      </div>
    </div>
  </div>

<%}%>



              </div>
            </div>
          </div>

        </div>
        </div>
      </section>

<jsp:include page="/assets/footer.jsp" flush="true" />
		
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
		
		<!-- 		LoginModal -->
		<jsp:include page="/assets/loginModal.jsp" flush="true"/>
		<!-- 		MemChat -->
		<%-- <jsp:include page="/assets/memChat3.jsp" flush="true"/> --%>

	
<%-- <jsp:include page="notice.jsp" flush="true" /> --%>
</body>

<script>
	var MyPoint = "/StriveCoupWS/M0001";
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/',1));
	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;

	var webSocket;

	function connect(){
		//create a websocket
		webSocket = new WebSocket(endPointURL);
		
		webSocket.onopen = function(event){
			//這裡可做前端畫面的改變
			console.log("連線到StriveCoupWS");
		};
		
		webSocket.onmessage = function(event){
			/* $(".change").css("background-color","#f24"); */
			var jsonObj = JSON.parse(event.data);
			var changeId = jsonObj.changeId;
			
			document.getElementById(changeId).disabled = true;
			$('#'+changeId).css("background-color","#ced4da");
			$('#'+changeId).css("color","#adb5bd");
			$('#'+changeId).css("border-color","#ced4da");
			$('#'+changeId).css("font-size","20px");
			$('#'+changeId).css("letter-spacing","5px");
			$('#'+changeId).css("height","40px");
			$('#'+changeId).css("padding","0 20px");
			$('#'+changeId).css("overflow","hidden");
			$('#'+changeId).text("已領");
			
			/* var messagesArea = document.getElementById("messagesArea"); */
			//這裡接收到json字串
			/* var message = jsonObj.name + ": " + jsonObj.message + "\n";
			messagesArea.value = messagesArea.value + message; */
			console.log("shopCoup.jsp也有收到通知");
			
		};
		
		webSocket.onclose = function(event){
			//這裡可做前端畫面改變
			updateStatus("目前斷線了");
		};

	}
	
	function sendMessage(changeId){
	
		//把選到的按鈕id也一起傳過去
		var jsonObj = {
			"changeId": changeId, 
			"name" : "M0001",
			"message" : "hello",
			
		}
		
		webSocket.send(JSON.stringify(jsonObj));
		
	}
	
	function disconnect(){
		webSocket.close();
		//這裡可做前端畫面改變
	}



</script>
</html>