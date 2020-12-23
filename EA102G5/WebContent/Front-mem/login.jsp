<%@page import="java.util.*"%>
<%@page import="com.mem.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
  <head>
	<!-- JQUERY -->
    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login - ToyAllHot Store</title>

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
    <!-- Footer新增的css -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/joe_footer.css" > 
	<!--sweet alert -->
   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>
	
  </head>

  <body id="body" class="body-wrapper version1 up-scroll">
	
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
                <h2>會員登入</h2>
              </div>
            </div>
            <div class="col-md-6">
              <ol class="breadcrumb float-right">
                <li>
                  <a href="<%=request.getContextPath() %>/index1.jsp">首頁</a>
                </li>
                <li class="active">登入</li>
              </ol>
            </div>
          </div>
        </div>
      </section>

      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix logIn">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-md-7 col-lg-8 col-xl-7 col-12">
              <div class="panel panel-default">
                <div class="panel-heading"><h3>會員登入</h3></div>
                <div class="panel-body">
                  <form  method="POST" role="form" ACTION="<%= request.getContextPath() %>/Front-mem/mem.do" enctype="multipart/form-data" >
                    <div class="form-group">
                      
                      <label for="">帳號</label>
                      
                      <input type="text"name="mem_account" class="form-control" id="" placeholder="請輸入帳號">
                    
                    </div>
                    <div class="form-group">
                    
                      <label for="">密碼</label>
                    
                      <input type="password"name="mem_pwd" class="form-control" id="" placeholder="請輸入密碼">
                    
                    </div>
                    <div class="form-check ">
                      <input id="checkbox-1" class="checkbox-custom form-check-input" name="checkbox-1" type="checkbox">
                      <label for="checkbox-1" class="checkbox-custom-label form-check-label">Remember me</label>
                    </div>
                    <button type="submit" class="btn btn-primary btn-default btn-block">登入</button>
                    <button type="button" class="btn btn-link btn-block" ><a data-toggle="modal" href='#email' style="color:blue;"><em><u>忘記密碼?</u></em></a></button>
                   	
                    <input type="hidden" name="action" value="memLogin" >
                	
                  </form>
                  
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      	<!-- FOOTER -->
  		<jsp:include page="/assets/footer.jsp" flush="true"/>


		<!-- 錯誤訊息按鈕 -->
         <button id="errorMsgs" type="button"  data-toggle="modal" data-target="#errorModal" style="display:none"></button>
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
		
		
		<script>
		 $(document).ready(function(){
			
			if($("#erroTitle").val()!=null){
				$("#errorMsgs").click();
			}
		 
		 
		 })
		</script>
	</body>
</html>
