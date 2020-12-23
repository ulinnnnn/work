<%@page import="com.mem.model.MemVO"%>
<%@page import="com.bptrack.model.BptrVO"%>
<%@page import="com.bptrack.model.BptrService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bp.model.*"%>
<%@ page import="com.bpreport.model.*"%>
<%@ page import="com.mem.model.MemVO"%>
<%@page import="com.mem.model.MemService"%>
<%@page import="sun.misc.BASE64Encoder"%>


<%
 MemVO memVO = (MemVO) session.getAttribute("memVO");
%>
<%
 	BptrService bptrSvc = new BptrService();
    List<BptrVO> list = bptrSvc.findBymen_no(memVO.getMem_no());
    pageContext.setAttribute("list",list);
%>

<!DOCTYPE html>
<jsp:useBean id="bpclassSvc" scope="page" class="com.bpclass.model.BpclassService" />
<html lang="zh_TW">
  <head>

    <!-- SITE TITTLE -->
    <meta charset="Big5">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>All track </title>

    <!-- PLUGINS CSS STYLE -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
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
    <link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/color-option2.css" id="option_style">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/img/favicon.png">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/joe_footer.css" >
	
<style>


.table a {
	color: blue !important;
}
.cartListInner .table-responsive .table tbody tr td, .orderBox .table-responsive .table tbody tr td {
    vertical-align: middle;
    text-transform: uppercase;
    font-weight: 700;
    border-bottom: 0px solid #f0f0f0;
    border-top: none;
    position: relative;
}

tr{
border:solid 2px black !important;
}

h1, h2, h3, h4, h5,
* {
    font-family: 微軟正黑體;
}
table * {
    font-size: 16px;
}

select {
    margin-right: 10px;
    margin-bottom: 10px;
}

button {
    width: 100%;
    padding: 4px 5px;
    border-radius: 15px;
}

.table-responsive select {
    padding: 0 5px;
}

@media (min-width: 1200px) {
  body .container {
    width: 1336px !important;
  }
}
th {
    background-color: #FFB548;
    color: white;
}

@media (min-width: 768px){
.orderBox .table-responsive .table tbody tr td {
   padding-left: 10px;
   }
}
th {
	padding:12px 12px 12px 12px !important;
	text-align: left !important;
}

.search:focus {
	box-shadow: none !important;
	outline: 0px !important;
}

.type_msg:focus {
	box-shadow: none !important;
	outline: 0px !important;
}

.contacts {
	list-style: none;
	padding: 0;
}

.contacts li {
	width: 100% !important;
	padding: 5px 10px;
	margin-bottom: 15px !important;
}

.offline {
	background-color: #c23616 !important;
}

.Chatuser_info span {
	font-size: 20px;
	color: white;
}

.Chatuser_info p {
	font-size: 10px;
	color: rgba(255, 255, 255, 0.6);
}

.msg_time {
	position: absolute;
	left: 0;
	bottom: -15px;
	color: rgba(255, 255, 255, 0.5);
	font-size: 10px;
}

.msg_time_send {
	position: absolute;
	right: 0;
	bottom: -15px;
	color: rgba(255, 255, 255, 0.5);
	font-size: 10px;
}

.msg_head {
	position: relative;
}

#action_menu_btn {
	position: absolute;
	right: 10px;
	top: 10px;
	color: white;
	cursor: pointer;
	font-size: 20px;
}

@media ( max-width : 576px) {
	.contacts_card {
		margin-bottom: 15px !important;
	}
}
.swal2-icon-content{
	font-size:75px !important;
}
</style>
</head>
 <body id="body">
 
<div class="main wrapper" style="overflow:visible">
	<div class="header clearfix">
	<jsp:include page="/assets/topBar.jsp" flush="true"/>
	</div>
	</div>

        <div class="container">
          <div class="row">
            <div class="col-md-12" style="min-height: 700px">
              <div class="innerWrapper">
                <div class="orderBox">
                  <div class="table-responsive">
                  	<h3>我的追蹤</h3>
                    <table class="table"     style="border: 3px solid">
                      <thead >
                        <tr>
                          <th>預覽圖</th>
                          <th>追蹤商品</th>
                          <th>商品標題</th>
                          <th>商品狀態</th>
                          <th>商品價格</th>
					      <th>到期日期</th>
					      <th style="text-align: center !important;">取消追蹤</th>
	
                        </tr>
                      </thead>
                  
                   
				<c:forEach var="bptrVO" items="${list}">
					<jsp:useBean id="bpSvc" scope="page" class="com.bp.model.BpService"/>
                    	    <tbody>
                         		 <tr>
                         		 	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/bp-front/BpServlet">
	                         		 	<td style="width: 10px">
		                         		 	<a data-fancybox="images" href="<%=request.getContextPath()%>/bp-front/DBG?bp_no=${bpSvc.getOnebp(bptrVO.bp_no).bp_no}&image_column=bp_pic1" class="product-content">
		                         		 	<img style="width: 90px" src="<%=request.getContextPath()%>/bp-front/DBG?bp_no=${bpSvc.getOnebp(bptrVO.bp_no).bp_no}&image_column=bp_pic1"/>
		                         		 	</a>
	                         		 	</td>	
	            			 			<td><a href="<%=request.getContextPath()%>/bp-front/TRY1.jsp?${bpSvc.getOnebp(bptrVO.bp_no).bp_no}">${bpSvc.getOnebp(bptrVO.bp_no).bp_no}</a></td>
	            			 			<td style="word-break:break-word ; width:250px">${bpSvc.getOnebp(bptrVO.bp_no).bp_head}</td>
	            			 			<td>${bpSvc.getOnebp(bptrVO.bp_no).bpst_no}</td>
	            			 			<td style="color:red">${bpSvc.getOnebp(bptrVO.bp_no).bp_pri}</td>
	            			 			<td>${bpSvc.getOnebp(bptrVO.bp_no).bp_dot}</td>
	            			 			<td>
		            			 			<input type="hidden" name="mem_no" value="${bptrVO.mem_no}">
		            			 			<input type="hidden" name="bp_no" value="${bptrVO.bp_no}">
		            			 			<input type="hidden" name="action" value="deletebptr">
		            			 			<button type="submit">取消追蹤</button>
	            			 			</td>	
            			 			</FORM>
                       			</tr>
                      		</tbody>
                     	</c:forEach>  
                    </table>
	
                  </div>
                </div>
              </div>	
            </div>
            </div>
            </div>
   
 <%@ include file="/assets/footer.jsp" %>  
 <%@ include file="/bp-front/chat.jsp" %>		
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
		<jsp:include page="/assets/loginModal.jsp" flush="true"/>
		<!-- 		MemChat -->
	
		
	<script>
	 $(document).ready(function(){
		 connect();	
			$("#fgbtn").click(function(){
				$("#login").css("display","none");
//				$(".modal-backdrop .fade .show").remove();
				$("#close1").click();
				$("#fgbtn").click();	
			})
				
			
		 	$("#PwdSendBtn").click(function(){
		 		if($("#PwdSendBtn").text()!=="確認"){
			 		$.ajax({
						url: "<%=request.getContextPath()%>/MemAjax.do",
						type: 'post',
						dataType: 'json',
						data: {
							'action': 'forgetPWD',
							'mem_email': $('#PWD_Mem_email').val(),
						},
						success: function(data) {
							swal('郵件發送成功！', '請去電子信相確認！', 'success');
							$("#PwdSendBtn").text("確認");
							$("#close2").click();
						},
						error: function(){swal("錯誤", "發送失敗", "error");}
						
					});
		 		}
		 	});
		 });
  
	</script>
	

	</body>
</html>

