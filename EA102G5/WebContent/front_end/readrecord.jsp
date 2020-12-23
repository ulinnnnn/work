<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="big5"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.CPRECORD.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page  import=" java.util.stream.Collectors" %>
<%@ page import="java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
  <%
    CprecordService  CprecordSvc = new  CprecordService();

 
  MemVO memVO=(MemVO)session.getAttribute("memVO");
  String mem_No=memVO.getMem_no();
  pageContext.setAttribute("mem_No", mem_No);
  List< CprecordVO> fillist =  CprecordSvc.findCprecordByMEM1(mem_No);
  List<CprecordVO> list1 = fillist.stream() .filter(o -> o.getCprstate().equals("ユ传い")|| o.getCprstate().equals("ユ传ЧΘ")|| o.getCprstate().equals("ユ传")).collect(Collectors.toList());
          
  
  pageContext.setAttribute("list1",list1);
  List< CprecordVO>  fillist2 =  CprecordSvc.findCprecordByMEM2(mem_No);
  List<CprecordVO> list2 = fillist2.stream() .filter(o -> o.getCprstate().equals("ユ传い")|| o.getCprstate().equals("ユ传ЧΘ")|| o.getCprstate().equals("ユ传")).collect(Collectors.toList());
  pageContext.setAttribute("list2",list2);
%>

    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>All Orders - BIGBAG Store</title>

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

  <body onload="connect();" onunload="disconnect();" id="body" class="body-wrapper version1 up-scroll">

   <div style="overflow:visible;">
        <jsp:include page="/assets/topBar.jsp" flush="true"/>
</div>

      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix userProfile">
      <input type="hidden" id="mem_No"  value="${mem_No}">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div class="btn-group" role="group" aria-label="...">
               <a href="/EA102G5/front_end/readrequest.jsp" class="btn btn-default "><i class="fa fa-th" aria-hidden="true"></i>ユ传ビ叫</a>
                <a href="/EA102G5/front_end/addchange.jsp" class="btn btn-default"><i class="fa fa-user" aria-hidden="true"></i>穝糤ユ传坝珇</a>
                <a href="/EA102G5/front_end/readchange.jsp" class="btn btn-default"><i class="fa fa-map-marker" aria-hidden="true"></i>и坝珇</a>
                <a href="/EA102G5/front_end/readrecord.jsp" class="btn btn-default  active"><i class="fa fa-list" aria-hidden="true"></i>ユ传魁</a>
                <a href="/EA102G5/front_end/readwish.jsp" class="btn btn-default"><i class="fa fa-gift" aria-hidden="true"></i>Wishlist</a>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="innerWrapper">
                <div class="orderBox">
                  <h2>All Orders</h2>
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>Order ID</th>
                          <th>и坝珇</th>
                          <th>ユ传坝珇</th>
                          <th>癸よ穦</th>
                          <th>ユ传篈</th>
                          <th></th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                           <jsp:useBean id="CproductSvc" scope="page" class="com.cproduct.model.CproductService" />
                      <c:forEach var="CprecordVO" items="${list1}">
                        <tr>
                          <td>${CprecordVO.cpr_No}</td>
                          <td><a  style="color:rgb(71, 186, 193)" href="getoneCSS.jsp?${CprecordVO.getCp_No1()}">${CproductSvc.getOneCproduct(CprecordVO.getCp_No1()).cpname}</a></td>
                          <td><a  style="color:rgb(71, 186, 193)" href="getoneCSS.jsp?${CprecordVO.getCp_No2()}">${CproductSvc.getOneCproduct(CprecordVO.getCp_No2()).cpname}</a></td>
                          <td>${CprecordVO.mem_No2}</td>
                          <td><span class="badge badge-primary">${CprecordVO.cprstate}</span></td>
                          <td><a href="changeorder.jsp?${CprecordVO.cpr_No}" class="btn btn-sm btn-secondary-outlined">View</a></td>
                            </tr>
                </c:forEach>          
                          <c:forEach var="CprecordVO" items="${list2}">
                        <tr>
                          <td>${CprecordVO.cpr_No}</td>
                          <td><a  style="color:rgb(71, 186, 193)" href="getoneCSS.jsp?${CprecordVO.getCp_No2()}">${CproductSvc.getOneCproduct(CprecordVO.getCp_No2()).cpname}</a></td>
                          <td><a  style="color:rgb(71, 186, 193)" href="getoneCSS.jsp?${CprecordVO.getCp_No1()}">${CproductSvc.getOneCproduct(CprecordVO.getCp_No1()).cpname}</a></td>
                          <td>
   <!--                     <button id="btn">${CprecordVO.mem_No1}</button><span type="hidden" id="toFriend">${CprecordVO.mem_No1}</span><span id="toFriendName">${CprecordVO.mem_No1}</span> -->
                         ${CprecordVO.mem_No1}
                          </td>
                          <td><span class="badge badge-primary">${CprecordVO.cprstate}</span></td>
                          <td><a href="changeorder.jsp?${CprecordVO.cpr_No}" class="btn btn-sm btn-secondary-outlined">View</a></td>
                            </tr>
                </c:forEach>       
                        <tr>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                        </tr>
                        <tr>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                        </tr>
                        <tr>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                        </tr>
                        <tr>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                        </tr>
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
				
				 
				Swal.fire('Τ穝ユ传ビ叫')
				
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

