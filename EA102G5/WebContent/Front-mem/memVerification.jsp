<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@page import="java.util.*"%>
<%@page import="com.mem.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	MemVO memVO=(MemVO)session.getAttribute("memVO");
%>
<!DOCTYPE html>
<html lang="en">
  <head>

    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Lost Password - BIGBAG Store</title>

    <!-- PLUGINS CSS STYLE -->
    <link href="<%=request.getContextPath() %>/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/assets/plugins/selectbox/select_option1.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/assets/plugins/fancybox/jquery.fancybox.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/assets/plugins/rateyo/jquery.rateyo.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/assets/plugins/iziToast/css/iziToast.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/assets/plugins/prismjs/prism.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/assets/plugins/revolution/css/settings.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/assets/plugins/animate/animate.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/plugins/slick/slick.css" media="screen">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/plugins/slick/slick-theme.css" media="screen">


    <!-- CUSTOM CSS -->
    <link href="<%=request.getContextPath() %>/assets/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/default.css" id="option_style">

    <!-- Icons -->
    <link rel="shortcut icon" href="<%=request.getContextPath() %>/assets/img/favicon.png">
	<!--Sweet Alert -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>

  </head>

  <body id="body" class="body-wrapper version1 up-scroll"onload="connect();" onunload="disconnect();">

    <div class="main-wrapper">

      <!-- HEADER -->
      <div class="header clearfix">

      <!-- TOPBAR NAVBAR -->
      <jsp:include page="/assets/topBar.jsp" flush="true"/>

      <!-- LIGHT SECTION -->
      <section class="lightSection clearfix pageHeader">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <div class="page-title">
                <h2>會員認證</h2>
              </div>
            </div>
            <div class="col-md-6">
              <ol class="breadcrumb float-right">
                <li>
                  <a href="<%=request.getContextPath() %>/index1.jsp">首頁</a>
                </li>
                <li class="active">會員認證</li>
              </ol>
            </div>
          </div>
        </div>
      </section>

      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix lostPassword">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-md-6 col-sm-12">
              <div class="panel panel-default">
                <div class="panel-heading"><h3>帳號認證</h3></div>
                <div class="panel-body">
                  <table>
	               <tr>
	                  <form action="<%=request.getContextPath() %>/Front-mem/mem.do" method="POST" enctype="multipart/form-data" role="form">
	                    <p class="help-block" style="font-size:15px;"><b>請輸入您的認證碼</b></p>
	                    <div class="form-group">
	                      <input type="text" name="openCode" class="form-control" placeholder="請輸入驗證碼" id="" value="${mem_verification_code}">
	                    </div>
	                    <button id="VerSendBtn" type="${mem_verification_code==null?'button':'submit'}" class="btn btn-primary btn-block" style="color:black;">${mem_verification_code==null?'發認證信':'確認'}</button>
	                    <input type="hidden" name="action" value="memOpenAcc">
	                    <input id="Ver_Mem_email" type="hidden" name="mem_email" value="${memVO.mem_email}">
	                    <input id="Ver_Mem_Account" type="hidden" name="mem_account" value="${memVO.mem_account}">
	                  </form>
                  </tr>
                  <tr>
                  	<button type="button" class="btn btn-link btn-block" ><a  href='<%=request.getContextPath() %>/index1.jsp' style="color:blue;"><em><u>先去逛逛?</u></em></a></button>
                  </tr>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      	<!-- FOOTER -->
  		<jsp:include page="/assets/footer.jsp" flush="true"/>

		

		<!-- ERROR MODAL -->
		<div class="modal fade" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h3 class="modal-title" id="exampleModalLongTitle">錯誤訊息!</h3>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body" style="text-align:center;">
		       		<c:if test="${not empty param.errorMsgs}">
						<font id="erroTitle" style="display:none;">請修正以下資訊:</font>
						<ul >
							<c:forEach var="message" items="${errorMsgs}">
								<li  style="color:red;font-size:15px;">${message}</li>
							</c:forEach>
						</ul>
					  </c:if>
		      </div>
		      <div class="modal-footer">
		        <button  type="button" class="btn btn-primary" data-dismiss="modal">關閉</button>
		      </div>
		    </div>
		  </div>
		</div>
		

		<script src="<%=request.getContextPath() %>/assets/plugins/jquery/jquery.min.js"></script>
		<script src="<%=request.getContextPath() %>/assets/plugins/jquery/jquery-migrate-3.0.0.min.js"></script>
		<script src="<%=request.getContextPath() %>/assets/plugins/jquery-ui/jquery-ui.js"></script>
		<script src="<%=request.getContextPath() %>/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="<%=request.getContextPath() %>/assets/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
		<script src="<%=request.getContextPath() %>/assets/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
		<script src="<%=request.getContextPath() %>/assets/plugins/slick/slick.js"></script>
		<script src="<%=request.getContextPath() %>/assets/plugins/fancybox/jquery.fancybox.min.js"></script>
		<script src="<%=request.getContextPath() %>/assets/plugins/iziToast/js/iziToast.js"></script>
		<script src="<%=request.getContextPath() %>/assets/plugins/prismjs/prism.js"></script>
		<script src="<%=request.getContextPath() %>/assets/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
		<script src="<%=request.getContextPath() %>/assets/plugins/countdown/jquery.syotimer.js"></script>
		<script src="<%=request.getContextPath() %>/assets/plugins/velocity/velocity.min.js"></script>
		<script src="<%=request.getContextPath() %>/assets/plugins/rateyo/jquery.rateyo.min.js"></script>
		<script src="<%=request.getContextPath() %>/assets/js/custom.js"></script>
		<!--MemChat -->
		<jsp:include page="/assets/memChat3.jsp" flush="true"/>
		<!--錯誤彈窗 -->
		<script>
		 $(document).ready(function(){
			if($("#erroTitle").val()!=null){
				$("#errorMsgs").click();
			}
		 	$("#VerSendBtn").click(function(){
		 		if($("#VerSendBtn").text()!=="確認"){
			 		$.ajax({
						url: "<%=request.getContextPath()%>/MemAjax.do",
						type: 'post',
						dataType: 'json',
						data: {
							'action': 'send_verification_code',
							'mem_email': $('#Ver_Mem_email').val(),
							'mem_account':$('#Ver_Mem_Account').val()
						},
						success: function(data) {
							swal('郵件發送成功！', '請去電子信相確認！', 'success');
							$("#VerSendBtn").text("確認");
							$("#VerSendBtn").attr("type","submit");
						},
						error: function(){swal("錯誤", "發送失敗", "error");}
						
					});
		 		}
		 	});
		 })
		</script>
	</body>
</html>
