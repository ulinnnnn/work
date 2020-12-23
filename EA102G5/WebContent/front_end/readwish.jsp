<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
    <%@ page import="java.util.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page import="com.cptrack.model.*"%>
<%@ page import="com.cproduct.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<%
String mem_No=null;
    CptrackService  CptrackSvc = new  CptrackService();
MemVO memVO=(MemVO)session.getAttribute("memVO");
if(memVO!=null){
mem_No=memVO.getMem_no();
}
pageContext.setAttribute("mem_No",mem_No);
  List< CptrackVO>  list=CptrackSvc.getOneCproduct(mem_No);
  pageContext.setAttribute("list",list);

%>
    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Wishlist - BIGBAG Store</title>

    <!-- PLUGINS CSS STYLE -->
    <link href="../assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet">
    <link href="../assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="../assets/plugins/selectbox/select_option1.css" rel="stylesheet">
    <link href="../assets/plugins/fancybox/jquery.fancybox.min.css" rel="stylesheet">
    <link href="../assets/plugins/rateyo/jquery.rateyo.min.css" rel="stylesheet">
    <link href="../assets/plugins/iziToast/css/iziToast.css" rel="stylesheet">
    <link href="../assets/plugins/prismjs/prism.css" rel="stylesheet">
    <link href="../assets/plugins/revolution/css/settings.css" rel="stylesheet">
    <link href="../assets/plugins/animate/animate.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../assets/plugins/slick/slick.css" media="screen">
    <link rel="stylesheet" type="text/css" href="../assets/plugins/slick/slick-theme.css" media="screen">


    <!-- CUSTOM CSS -->
    <link href="../assets/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/default.css" id="option_style">

    <!-- Icons -->
    <link rel="shortcut icon" href="../assets/img/favicon.png">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>

  <body id="body" onload="connect();" onunload="disconnect();" class="body-wrapper version1 up-scroll">

   <div style="overflow:visible;">
        <jsp:include page="/assets/topBar.jsp" flush="true"/>
</div>

      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix userProfile" style="min-height:680px">
      <input type="hidden" id="mem_No"  value="${mem_No}">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <div class="btn-group" role="group" aria-label="...">
               <a href="/EA102G5/front_end/readrequest.jsp" class="btn btn-default "><i class="fa fa-th" aria-hidden="true"></i>交換申請</a>
                <a href="/EA102G5/front_end/addchange.jsp" class="btn btn-default"><i class="fa fa-user" aria-hidden="true"></i>新增交換商品</a>
                <a href="/EA102G5/front_end/readchange.jsp" class="btn btn-default"><i class="fa fa-map-marker" aria-hidden="true"></i>我的商品</a>
                <a href="/EA102G5/front_end/readrecord.jsp" class="btn btn-default"><i class="fa fa-list" aria-hidden="true"></i>交換紀錄</a>
                <a href="/EA102G5/front_end/readwish.jsp" class="btn btn-default active"><i class="fa fa-gift" aria-hidden="true"></i>Wishlist</a>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-12">
              <div class="innerWrapper">
                <div class="orderBox myAddress wishList">
                  <h2>Wishlist</h2>
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th></th>
                          <th>商品名稱</th>
                          <th>對方會員</th>
                          <th>商品狀態</th>
                          <th></th>
                        </tr>
                      </thead>
                      <tbody>
                      <jsp:useBean id="CproductSvc" scope="page" class="com.cproduct.model.CproductService" />
                      <c:forEach var="CptrackVO" items="${list}">
                     
                        <tr>
                          <td class="">
                          <input type="hidden" name="cp_No"  value="${CptrackVO.cp_No}">
                            <button   type="button" class="close clean" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <span  class="cartImage"><img src="makeimage.jsp?pic1=${CptrackVO.cp_No}&No=1" width="100" height="64" border="0" alt="image"></span>
                          </td>
                          <td>${CproductSvc.getOneCproduct(CptrackVO.getCp_No()).cpname}</td>
                          <td>${CproductSvc.getOneCproduct(CptrackVO.getCp_No()).mem_No}</td>
                          <td>${CproductSvc.getOneCproduct(CptrackVO.getCp_No()).cpState}</td>
                          <td>
                             <a href="getoneCSS.jsp?${CptrackVO.cp_No}"class="btn btn-primary btn-default">go to change<i class="fa fa-angle-right" aria-hidden="true"></i></a>
                          </td>
                        </tr>
                        </c:forEach>  
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      			<!-- FOOTER -->
			<jsp:include page="/assets/footer.jsp" flush="true"/>

		<script src="../assets/plugins/jquery/jquery.min.js"></script>
		<script src="../assets/plugins/jquery/jquery-migrate-3.0.0.min.js"></script>
		<script src="../assets/plugins/jquery-ui/jquery-ui.js"></script>
		<script src="../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="../assets/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
		<script src="../assets/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
		<script src="../assets/plugins/slick/slick.js"></script>
		<script src="../assets/plugins/fancybox/jquery.fancybox.min.js"></script>
		<script src="../assets/plugins/iziToast/js/iziToast.js"></script>
		<script src="../assets/plugins/prismjs/prism.js"></script>
		<script src="../assets/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
		<script src="../assets/plugins/countdown/jquery.syotimer.js"></script>
		<script src="../assets/plugins/velocity/velocity.min.js"></script>
		<script src="../assets/plugins/rateyo/jquery.rateyo.min.js"></script>
		<script src="../assets/js/custom.js"></script>

	</body>
</html>

<script type="text/javascript">
$(document).ready(function(){			
	$(".clean").click(function(){
		console.log('reigjreigjoireg');
	let data = {};
	let message = $(this).parent().children();
	
	url = 'Cproduct.do';
	data.action = "deltr";
	console.log(message[0].value);
	console.log("${mem_No}");
	data.cp_No =message[0].value;
	data.mem_No ="${mem_No}";
	
	
	$(this).parent().parent().hide();
	
	

$.ajax({
	url :url,
	type :"POST" ,
	data :data , 
	success : function(e) {	
	}
});
});
})	


</script>

<script>
	var MyPoint = "/Change/${mem_No}";
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/', 1));
	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;

	var statusOutput = document.getElementById("statusOutput");
	var messagesArea = document.getElementById("messagesArea");
	var self = '${mem_No}';
	var changewebSocket;

	function connect(){
		// create a websocket
		changewebSocket = new WebSocket(endPointURL);

		changewebSocket.onopen = function(event) {
			console.log("Connect Success!");
			
		};
        var mem_No=$("#mem_No").val();
		changewebSocket.onmessage = function(event) {
			console.log(mem_No);
			console.log(event.data);
			if(event.data==mem_No){
				
				 
				Swal.fire('你有一個新的交換申請')
				
			}
			
		}

		changewebSocket.onclose = function(event) {
			console.log("Disconnected!");
		};
	}
	
	
	
	function disconnect() {
		changewebSocket.close();
		document.getElementById('sendMessage').disabled = true;
		document.getElementById('connect').disabled = false;
		document.getElementById('disconnect').disabled = true;
	}
	
	function updateFriendName(name) {
		statusOutput.innerHTML = name;
	}
</script>  

</html>