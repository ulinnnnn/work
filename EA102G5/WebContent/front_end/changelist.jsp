<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cproduct.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page  import=" java.util.stream.Collectors" %>
    <%@ page import="com.cptrack.model.*"%>
<%@ page import="java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
<%
    CproductService CproductSvc = new CproductService();
MemVO memVO=(MemVO)session.getAttribute("memVO");
String mem_No="1";
if(memVO!=null){
mem_No=memVO.getMem_no();
}
pageContext.setAttribute("mem_No", mem_No);
session.setAttribute("location", request.getRequestURI());
String searchword =(String)session.getAttribute("searchword");
String cpclass =(String)session.getAttribute("cpclass");
String reversesearchword =(String)session.getAttribute("reversesearchword");
String cpmeetup =(String)session.getAttribute("cpmeetup");


    List<CproductVO> fillist = CproductSvc.getAll();
    List<CproductVO> list1 = fillist.stream() .filter(o -> o.getCpState().equals("已上架")).collect(Collectors.toList());
    System.out.print("----------searchword----------"+searchword);
    System.out.print("---------cpclass-----------"+cpclass);
    if(searchword!=null){
    	list1 = list1.stream() .filter(o -> o.getCpname()!=null&&o.getCpname().toLowerCase().contains(searchword.toLowerCase())).collect(Collectors.toList());
 //   	list1 = list1.stream() .filter(o -> o.getCptext()!=null&&o.getCptext().contains(searchword)).collect(Collectors.toList());
    }
    if(cpclass!=null){
    	list1 = list1.stream() .filter(o -> o.getCpClass_No().contains(cpclass)).collect(Collectors.toList());
    }
    if(reversesearchword!=null){
    	list1 = list1.stream() .filter(o -> o.getemp_NO()!=null&&o.getemp_NO().toLowerCase().contains(reversesearchword.toLowerCase())).collect(Collectors.toList());
    }
    if(cpmeetup!=null){
    	list1 = list1.stream() .filter(o -> o.getCpmeetup()!=null&&o.getCpmeetup().contains(cpmeetup)).collect(Collectors.toList());
    }
    List<CproductVO> list = list1;
    pageContext.setAttribute("list",list);
   
%>
    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Product Grid Sidebar Left - BIGBAG Store</title>

    <!-- PLUGINS CSS STYLE -->
    <link href="../assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet">
    <link href="./../assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
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


            <!-- Collect the nav links, forms, and other content for toggling -->
           

      <!-- LIGHT SECTION -->
      
      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix productsContent">
      <input type="hidden" id="mem_No"  value="${mem_No}">
        <div class="container">
          <div class="row">
            <div class="col-lg-3 col-md-4 sideBar">
              <div class="panel panel-default">
                <div class="panel-heading">Product categories</div>
                <div class="panel-body">
                  <div class="collapse navbar-collapse navbar-ex1-collapse navbar-side-collapse">
                    <ul class="nav navbar-nav side-nav" id="accordion2" role="tablist" aria-multiselectable="true">
                     
                        

                      <li>
                        <div class="" role="tab" id="heading2">
                          <a href="javascript:;" data-toggle="collapse" aria-expanded="false" data-target="#men" aria-controls="men">商品類別<i
                              class="fa fa-plus"></i></a>
                        </div>
                        
                        <ul id="men" class="collapse collapseItem" role="tabpanel" aria-labelledby="heading2" data-parent="#accordion2">
                          <li id="class1"><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>兒童玩具</a></li>
                          <li id="class2"><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>桌上型玩具</a></li>
                          <li id="class3"><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>電動玩具</a></li>
                          <li id="class4"><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>模型玩具</a></li>
                          <li id="class5"><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>懷舊玩具</a></li>
                          <li id="class6"><a href="#"><i class="fa fa-caret-right" aria-hidden="true"></i>玩偶抱枕</a></li>
                        </ul>
                      </li>

                      <li>
                        <div class="" role="tab" id="heading3">
                          <a href="javascript:;" data-toggle="collapse" aria-expanded="false" data-target="#kids" aria-controls="kids">我能換什麼?<i
                              class="fa fa-plus"></i></a>
                        </div>

                        <div id="kids" class="collapse collapseItem" role="tabpanel" aria-labelledby="heading3" data-parent="#accordion2">
                            <form class="input-group" METHOD="post" ACTION="Cproduct.do" name="form1" enctype ="multipart/form-data">
             <input type="hidden" name="action" value="reversesearch">
              <input type="text" class="form-control" name="reversesearchword" placeholder="反向查詢" aria-describedby="basic-addon2">
              <button type="submit" class="input-group-addon" id="basic-addon2"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path style="color: #3dabc8;" fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
  <path     style="color: #3dabc8;" fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
</svg></button>
              </form>
                        </div>
                      </li>

                      <li>
                        <div class="" role="tab" id="heading4">
                          <a href="javascript:;" data-toggle="collapse" aria-expanded="false" data-target="#accessories" aria-controls="accessories">地區搜尋<i
                              class="fa fa-plus"></i></a>
                        </div>
                        
                        <div id="accessories" class="collapse collapseItem" role="tabpanel" aria-labelledby="heading4" data-parent="#accordion2">
                          <form class="input-group" METHOD="post" ACTION="Cproduct.do" name="form1" enctype ="multipart/form-data">
             <input type="hidden" name="action" value="cpmeetup">
              <input type="text" class="form-control" name="cpmeetup" placeholder="地區搜尋" aria-describedby="basic-addon2">
              <button type="submit" class="input-group-addon" id="basic-addon2"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path style="color: #3dabc8;" fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
  <path     style="color: #3dabc8;" fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
</svg></button>
              </form>
                        </div>
                        
                      </li>
                    </ul>
                  </div>
                  
                </div>
              </div>
             <%@ include file="page1.file" %> 
             <%@ include file="page2.file" %> 
            
              
            </div>
            <div class="col-lg-9 col-md-8">
              <div class="row filterArea">
                <div class="col-2">
                <button id="return" style="background-color:#45dce6;" class="btn btn-info btn-rounded ">清空條件</button>
                </div>
                <div class="col-10">
                   <div class="panel panel-default priceRange">
               
                 <form class="input-group" METHOD="post" ACTION="Cproduct.do" name="form1" enctype ="multipart/form-data">
             <input type="hidden" name="action" value="search">
              <input type="text" class="form-control" name="searchword" placeholder="請輸入期望的商品名稱" aria-describedby="basic-addon2">
              <button type="submit" class="input-group-addon" id="basic-addon2"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path style="color: #3dabc8;" fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
  <path     style="color: #3dabc8;" fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
</svg></button>
              </form>
                  <!-- <span class="priceLabel">Price: <strong>$12 - $30</strong></span> -->
                </div>
              </div>
              </div>
                 
              <div class="row">
              <c:forEach var="CproductVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
              
                <div class="col-md-6 col-lg-4">
                  <div class="productBox">
                    <div  class="productCaption clearfix">
                       <h3 style="color:#534141;text-align:center;" style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">${CproductVO.cpname}</h3>
                    </div>  
                    <div  class="productImage clearfix">
                      <img  src="makeimage.jsp?pic1=${CproductVO.cp_No}&No=1" alt="products-img">
                      <div class="productMasking">
                        <ul class="list-inline btn-group" role="group">
                          <li><a onclick ="add${CproductVO.cp_No}()" class="btn btn-default btn-wishlist2 active"><i style="color:#dee2e6;" class="fa fa-heart"></i></a></li>
                          <li><a class="btn btn-default addreport"  ><i  class="fa fa-exclamation "></i></a></li>
                          <li><a class="btn btn-default" data-toggle="modal" href="#A${CproductVO.cp_No}" ><i style="color:blue !important;" class="fa fa-eye"></i></a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="productCaption clearfix">                 
                      
	                    
                      <h3 style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">想換:${CproductVO.emp_NO}</h3>
                      
                    </div>
                   
                  </div>
                </div>
                
                
                      
                
                
                </c:forEach>
                
                 
                
               

      <!-- LIGHT SECTION -->
     

      			<!-- FOOTER -->
			
			<!-- COPY RIGHT -->
			
		<!-- LOGIN MODAL -->
		

		<!-- SIGN UP MODAL -->
	

		<!-- PORDUCT QUICK VIEW MODAL -->
		<c:forEach var="CproductVO" items="${list}">
		<div id="A${CproductVO.cp_No}"class="modal fade quick-view" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<div class="media flex-wrap">
							<div class="media-left px-0">
							  
								<img class="media-object" src="makeimage.jsp?pic1=${CproductVO.cp_No}&No=1" alt="Image">
							</div>
							<div class="media-body">
							<jsp:useBean id="MemSvc" scope="page" class="com.mem.model.MemService" />
								<h2>${CproductVO.cpname}</h2>
								<h3 >所屬會員:${MemSvc.memSelectByPk(CproductVO.mem_No).mem_name}</h3>
								<h3>${CproductVO.cpmeetup}</h3>
								<h4><fmt:formatDate value="${CproductVO.cpontime}" pattern="yyyy/MM/dd" /></h4>
								<p>${CproductVO.cptext}</p>
								
								
								<div class="btn-area">
								
									<a href="getoneCSS.jsp?${CproductVO.cp_No}"class="btn btn-primary btn-block">Go to change <i class="fa fa-angle-right" aria-hidden="true"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
		</div>
		</div>
		</div>
		</div>
		</section>
		
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
<div class="modal fade login-modal" id="login" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header justify-content-center">
						<h3 class="modal-title">會員登入</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<form ACTION="<%= request.getContextPath() %>/Front-mem/mem.do" enctype="multipart/form-data" method="POST" role="form">
							<div class="form-group">
								<label for="">帳號</label>
								<input name="mem_account"type="text" class="form-control">
							</div>
							<div class="form-group">
								<label for="">密碼</label>
								<input name="mem_pwd"type="password" class="form-control">
							</div>
							<div class="checkbox">
								<input id="checkbox-1" class="checkbox-custom form-check-input" name="checkbox-1" type="checkbox" checked>
								<label for="checkbox-1" class="checkbox-custom-label form-check-label">Remember me</label>
							</div>
				
							
							<button type="submit" class="btn btn-primary btn-block">登入</button>
							<button type="button" class="btn btn-link btn-block">Forgot Password?</button>
							 <input type="hidden" name="action" value="memLogin">
						</form>
					</div>
				</div>
			</div>
		</div>

	</body>
<c:forEach var="CproductVO" items="${list}">	
	<script type="text/javascript">

 function add${CproductVO.cp_No}(){
	console.log('reigjreigjoireg');
	let data1 = {};

	data1.action = 'addtr';

	url = 'Cproduct.do';

	data1.cp_No ='${CproductVO.cp_No}';
	var mem_No='${mem_No}';
    if(mem_No == "1"){
    	alert('請先登入');
 }
    else{
    	
	
	data1.mem_No =mem_No;
    
	console.log(data1)
	$.ajax({
		url :url,
		type :"POST" ,
		data :data1 , 
		success : function(e) {
			
				
			
		}
	});}
 }

 
</script>                         
	</c:forEach>
	
	<script>
	$(document).ready(function(){			
		$("#class1").click(function(){
			
			let data = {};				
			url = 'Cproduct.do';
			data.action = "searchclass";
			
			data.cpclass='S1';

			
			
		
		

	$.ajax({
		url :url,
		type :"POST" ,
		data :data , 
		success : function(e) {	
			window.location.reload(); 
		}
	});
	});	
 })	
	   $(document).ready(function(){			
			$("#class2").click(function(){
				
				let data = {};				
				url = 'Cproduct.do';
				data.action = "searchclass";
				
				data.cpclass='S2';

				
				
			
			

		$.ajax({
			url :url,
			type :"POST" ,
			data :data , 
			success : function(e) {	
				window.location.reload(); 
			}
		});
		});	
	 })	
	 $(document).ready(function(){			
			$("#class3").click(function(){
				
				let data = {};				
				url = 'Cproduct.do';
				data.action = "searchclass";
				
				data.cpclass='S3';

				
				
			
			

		$.ajax({
			url :url,
			type :"POST" ,
			data :data , 
			success : function(e) {	
				window.location.reload(); 
			}
		});
		});	
	 })	
	  $(document).ready(function(){			
			$("#class4").click(function(){
				
				let data = {};				
				url = 'Cproduct.do';
				data.action = "searchclass";
				
				data.cpclass='S4';

				
				
			
			

		$.ajax({
			url :url,
			type :"POST" ,
			data :data , 
			success : function(e) {	
				window.location.reload(); 
			}
		});
		});	
	 })	
	  $(document).ready(function(){			
			$("#class5").click(function(){
				
				let data = {};				
				url = 'Cproduct.do';
				data.action = "searchclass";
				
				data.cpclass='S5';

				
				
			
			

		$.ajax({
			url :url,
			type :"POST" ,
			data :data , 
			success : function(e) {	
				window.location.reload(); 
			}
		});
		});	
	 })	
	  $(document).ready(function(){			
			$("#class6").click(function(){
				
				let data = {};				
				url = 'Cproduct.do';
				data.action = "searchclass";
				
				data.cpclass='S6';

				
				
			
			

		$.ajax({
			url :url,
			type :"POST" ,
			data :data , 
			success : function(e) {	
				window.location.reload(); 
			}
		});
		});	
	 })	
	 
	$(document).ready(function(){			
			$("#return").click(function(){
				
				let data = {};				
				url = 'Cproduct.do';
				data.action = "return";
				
				

				
				
			
			

		$.ajax({
			url :url,
			type :"POST" ,
			data :data , 
			success : function(e) {	
				window.location.reload(); 
			}
		});
		});	
	 })	
	</script>
	<script>
	$('.btn-wishlist2').on('click', function() {
		var mem_No='${mem_No}';
	    if(mem_No == "1"){
	    	
	 }
	    else{
		var b = $(this).data('iteration') || 1,
		c = {
			title: '',
			animateInside: !1,
			position: 'topRight',
			progressBar: !1,
			timeout: 3200,
			transitionIn: 'fadeInLeft',
			transitionOut: 'fadeOut',
			transitionInMobile: 'fadeIn',
			transitionOutMobile: 'fadeOut'
		};
	switch (b) {
		case 1:
			$(this).addClass('active'), c.class = 'iziToast-info', c.message = '已加入收藏!', c.icon = 'icon-bell';
			$(this).children().css("color","red");
			break;
		case 2:
			$(this).removeClass('active'), c.class = 'iziToast-danger', c.message = '已從收藏中移除!', c.icon = 'icon-ban';
			$(this).children().css("color","#dee2e6");
	}
	iziToast.show(c), b++, b > 2 && (b = 1), $(this).data('iteration', b);
	
	    }});
	</script>
	<script> 
	$(document).ready(function(){			
		$(".addreport").click(function(){
			console.log('reigjreigjoireg');
			var mem_No='${mem_No}';
		    if(mem_No == "1"){
		    	alert('請先登入');
		 }
		    else{
			Swal.fire({
				  title: 'Are you sure?',
				  text: "這個商品違反了相關規定嗎?",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '是，我要檢舉它!'
				}).then((result) => {
				  if (result.value) {
				    Swal.fire(
				     
				      '很快將有專人進行審核',
				      'success'
				    )
		let data = {};
		let message = $(this).parent().children();
		let ppr = $(this).parent().parent().prev().prev().prev();
		
		url = 'Cproduct.do';
		data.action = "addreport";
		
		
		
  
	$.ajax({
		url :url,
		type :"POST" ,
		data :data , 
		success : function(e) {	
		}
	});
				  }})
		    }})
	})
	</script>   
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
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
