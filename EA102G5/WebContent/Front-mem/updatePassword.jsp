<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@page import="java.util.*"%>
<%@page import="com.mem.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	MemVO memVO=(MemVO)session.getAttribute("memVO");
	
%>
<!DOCTYPE html>
<html >
  <head>

    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update Password - ToyAllHot</title>
	  	<!-- JQUERY -->
    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
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
                <h2>會員密碼更改</h2>
              </div>
            </div>
            <div class="col-md-6">
              <ol class="breadcrumb float-right">
                <li>
                  <a href="<%=request.getContextPath() %>/index1.jsp">首頁</a>
                </li>
                <li class="active">更改密碼</li>
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
                <div class="panel-heading"><h3>更改密碼</h3></div>
                <div class="panel-body">
                  <form id="goForm" action="<%=request.getContextPath() %>/Front-mem/mem.do" method="POST" enctype="multipart/form-data" role="form">
                    <p class="help-block" style="font-size:15px;"><b>請輸入您的新密碼 :</b></p>
                    <div class="form-group">
                      <input id="mem_pwd1" class="form-control"type="password" name="mem_pwd1"  placeholder="請輸入新密碼" />
                      <input id="mem_pwd2" class="form-control"type="password" name="mem_pwd2"  placeholder="確認密碼" />
                      <input id="mem_email_forAjax" type="hidden" name="mem_email" value="${memVO==null?mem_email:memVO.mem_email}"  />
                    </div>
                    <input id="submit" type="button" class="btn btn-primary btn-block" value="確認更改" />
                    <input id="goSubmit" type="submit" style="display:none;" />
                    <input type="hidden" name="action" value="memNewPWD">
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

			<!-- COPY RIGHT -->
			<div class="copyRight clearfix">
				<div class="container">
					<div class="row">
						<div class="col-md-7 col-12">
							<p>&copy; 2017 Copyright Bigbag Store Bootstrap Template by <a target="_blank" href="http://www.iamabdus.com/">Abdus</a>.</p>
						</div>
						<div class="col-md-5 col-12">
							<ul class="list-inline">
								<li><img src="<%=request.getContextPath() %>/assets/img/home/footer/card1.png"></li>
								<li><img src="<%=request.getContextPath() %>/assets/img/home/footer/card2.png"></li>
								<li><img src="<%=request.getContextPath() %>/assets/img/home/footer/card3.png"></li>
								<li><img src="<%=request.getContextPath() %>/assets/img/home/footer/card4.png"></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
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
		       		<c:if test="${not empty errorMsgs}">
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
		
		 <!--MemChat -->
		<jsp:include page="/assets/memChat3.jsp" flush="true"/>
		

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
				
		<!--錯誤彈窗 -->
		<script>
		 $(document).ready(function(){
			
			if($("#erroTitle").val()!=null){
				$("#errorMsgs").click();
			}
		 
		 })
		</script>
		<script>
	 	$(document).ready(function(){
		$("#submit").click(function(){
			var pwd1=$("#mem_pwd1").val();
			var pwd2=$("#mem_pwd2").val();
			if(testPWD(/.*[A-Z]+.*[0-9]+.*|.*[0-9]+.*[A-Z]+.*/, pwd1)&&testPWD(/.*[A-Z]+.*[0-9]+.*|.*[0-9]+.*[A-Z]+.*/, pwd2)){
				if(pwd1!==pwd2){
					swal("請重新確認密碼", "","error");
				}else{
					swal('密碼更改成功', "",'success');
					setTimeout(function(){
						$("#goSubmit").click();
					},2000);
				}
			}
		})
		 
		function testPWD(regex, value) {
            if (regex.test(value)) {
                return true;
            } else {
            	swal("密碼至少包含一個大寫英文及一個數字",  "","error");
                return false;
            }
        }
	 })
	</script>
	</body>
</html>
