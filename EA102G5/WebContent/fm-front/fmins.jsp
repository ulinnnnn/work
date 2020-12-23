<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.fmarticle.model.*"%>
<%@ page import="com.mem.model.*"%>
<%
 MemVO memVO = (MemVO) session.getAttribute("memVO");

%>
<%
  fmarticleVO fmarticleVO = (fmarticleVO) request.getAttribute("fmarticleVO");
//   fmclassVO fmclassVO = (fmclassVO) request.getAttribute("fmclassVO");
//   fmclassService fmclassService = new fmclassService();
//   List<fmclassVO> list = fmclassService.getAll();
//   pageContext.setAttribute("list",list);
	
%>
<!DOCTYPE html>
<html lang="zh_TW">
  <head>
    <meta charset="Big5">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>刊登文章</title>
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet">
    <link href="assets/plugins/selectbox/select_option1.css" rel="stylesheet">
    <link href="assets/plugins/fancybox/jquery.fancybox.min.css" rel="stylesheet">
    <link href="assets/plugins/rateyo/jquery.rateyo.min.css" rel="stylesheet">
    <link href="assets/plugins/iziToast/css/iziToast.css" rel="stylesheet">
    <link href="assets/plugins/prismjs/prism.css" rel="stylesheet">
    <link href="assets/plugins/revolution/css/settings.css" rel="stylesheet">
    <link href="assets/plugins/animate/animate.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="assets/plugins/slick/slick.css" media="screen">
    <link rel="stylesheet" type="text/css" href="assets/plugins/slick/slick-theme.css" media="screen">
    <link href="assets/css/style.css" rel="stylesheet">
<!--     <link rel="stylesheet" href="assets/css/color-option2.css" id="option_style"> -->
    <link rel="shortcut icon" href="assets/img/favicon.png">
    <link rel="stylesheet" href="assets/css/joe_footer.css" >
    <!-- Icons -->
    <link rel="shortcut icon" href="./assets/img/favicon.png">

<style>

.form-control {
	border:1px gray solid !important;
	padding: 6px 8px !important;
	font-size:16px !important; 
}
label{
	font-size:16px !important; 
}

textarea{
width:100%;
height:585px !important;
resize:none;
line-height: 25px !important;
}
input.rad{

width:55px !important;
}

section.mainContent.clearfix.signUp {
    padding-top: 50px;
    padding-bottom: 50px;
}
.panel-body{
	padding: 5px 15px !important;
}
.panel-heading{
    border-radius: 15px !important;
}
</style>

</head>
  <body id="body" class="body-wrapper version1 up-scroll">

您好:${memVO.mem_name}
您的編號${memVO.mem_no}

		 <p><a href="<%=request.getContextPath()%>/fm-front/select_page.js	p">回首頁</a></p>
							<c:if test="${not empty errorMsgs}">
							<font style="color:red">請修正以下錯誤:</font>
							<ul>
							<c:forEach var="message" items="${errorMsgs}">
							<li style="color:red">${message}</li>
							</c:forEach>
							</ul>
							</c:if>				

<!-- header以下 -->
    <div class="main-wrapper" style="overflow:visible;">
    <div class="header clearfix">
   <jsp:include page="/fm-front/assets/topBar.jsp" flush="true"/>
	</div>
	</div>
  <!-- header以上  -->
  
  <!-- LIGHT SECTION -->
      <section class="lightSection clearfix pageHeader">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <div class="page-title">
                <h2>論壇</h2>
              </div>
            </div>
            <div class="col-md-6">
              <ol class="breadcrumb pull-right">
                <li>
                  <a href="myfm.jsp" style="font-size:16px;font-weight:bold;">我的文章</a>
                </li>
                <li class="active">
                <a href="fmarticle.jsp" style="font-size:16px;font-weight:bold;">討論區</a></li>
              </ol>
            </div>
          </div>
        </div>
      </section>

								
      <section class="mainContent clearfix signUp ">
		<div class="container">
			<div class="row">
				<div class="col-md-6 mb-sm-4 mb-md-0">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3>刊登資訊</h3>
						</div>
						
						<div class="panel-body">
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/fm-front/FmarticleServlet" enctype="multipart/form-data">
								<div class="form-group">
									<label for="">標題</label>
									<input type="TEXT" name="fm_head" size="45"
									value="<%= (fmarticleVO==null)? "" : fmarticleVO.getFm_head()%>" class="form-control" id="" style="border-radius: 15px !important">
								</div>
								
								<div class="form-group">
								<label for="">總類</label>
								<jsp:useBean id="fmclassService" scope="page" class="com.fmclass.model.fmclassService" />
									<select name="fmcl_no" class="form-control" style="border-radius: 15px !important">
										<c:forEach var="fmclassVO" items="${fmclassService.all}">	
											<option style="border-radius: 15px !important" value="${fmclassVO.fmcl_no}">${fmclassVO.fmcl_na}
											</option>
										</c:forEach>
									</select>				
								</div>
								<div class="form-group">
									<label for="">內文</label> 
								<textarea class="form-control" name="fm_text" style="border-radius: 15px !important">${(fmarticleVO == null)?"":fmarticleVO.fm_text}</textarea>
								</div>
						</div>
					</div>
				</div>

				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3>add</h3>
						</div>
						<div class="panel-body">
							<div>
								<label>上傳圖1:</label>
								<div class="form-control" style="border-radius: 15px !important"><input type="file" id="fm_pic1" name="fm_pic1"
									class="myFile"></div>
							</div>
							<div>
								<label>上傳圖2:</label>
								<div class="form-control" style="border-radius: 15px !important"><input type="file" id="fm_pic2" name="fm_pic2"
									class="myFile"></div>
							</div>
<!-- 							<div> -->
<!-- 								<label>上傳圖3:</label> -->
<!-- 								<div class="form-control" style="border-radius: 15px !important"><input type="file" id="fm_pic3" name="fm_pic3" -->
<!-- 									class="myFile"></div> -->
<!-- 							</div> -->
							<div>
								<label>預覽內容:</label>
								<div>
									<div id="preview">
										<img 
										src="<%=request.getContextPath()%>/img/3.png"
										id="gro_pic_preview1" style=max-width:100% > 
										<img
										src="<%=request.getContextPath()%>/img/3.png"
										id="gro_pic_preview2" style=max-width:100% >
<!-- 										<img -->
<%-- 										src="<%=request.getContextPath()%>/img/3.png" --%>
<!-- 										id="gro_pic_preview3" style=max-width:100% > -->
									</div>
								</div>
							</div>
							<input type="hidden" name="mem_no" value="${memVO.mem_no}">
							<input type="hidden" name="action" value="insert">
<!-- 							<input type="submit" value="送出"> -->
							<button type="submit"  value="送出新增" class="btn btn-primary btn-block" style="border-radius: 15px !important">Submit</button>
						</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
<%@ include file="/fm-front/footer.jsp" %>
		<script src="assets/plugins/jquery/jquery.min.js"></script>
		<script src="assets/plugins/jquery/jquery-migrate-3.0.0.min.js"></script>
		<script src="assets/plugins/jquery-ui/jquery-ui.js"></script>
		<script src="assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="assets/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
		<script src="assets/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
		<script src="assets/plugins/slick/slick.js"></script>
		<script src="assets/plugins/fancybox/jquery.fancybox.min.js"></script>
		<script src="assets/plugins/iziToast/js/iziToast.js"></script>
		<script src="assets/plugins/prismjs/prism.js"></script>
		<script src="assets/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
		<script src="assets/plugins/countdown/jquery.syotimer.js"></script>
		<script src="assets/plugins/velocity/velocity.min.js"></script>
		<script src="assets/plugins/rateyo/jquery.rateyo.min.js"></script>
<!-- 		<script src="assets/js/custom.js"></script> -->

    
	</body>
	
<% 
  java.sql.Date hiredate = null;
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
$(document).ready(function(){
   $("#fm_pic1").change(function(){
         readURL(this);
     });
   function readURL(input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();

          reader.onload = function (e) {
              $('#gro_pic_preview1').attr('src', e.target.result).fadeIn('slow');
          }
          reader.readAsDataURL(input.files[0]);
      }
  }
});
$(document).ready(function(){
	   $("#fm_pic2").change(function(){
	         readURL(this);
	     });
	   function readURL(input) {
	      if (input.files && input.files[0]) {
	          var reader = new FileReader();

	          reader.onload = function (e) {
	              $('#gro_pic_preview2').attr('src', e.target.result).fadeIn('slow');
	          }
	          reader.readAsDataURL(input.files[0]);
	      }
	  }
	});
// $(document).ready(function(){
// 	   $("#fm_pic3").change(function(){
// 	         readURL(this);
// 	     });
// 	   function readURL(input) {
// 	      if (input.files && input.files[0]) {
// 	          var reader = new FileReader();

// 	          reader.onload = function (e) {
// 	              $('#gro_pic_preview3').attr('src', e.target.result).fadeIn('slow');
// 	          }
// 	          reader.readAsDataURL(input.files[0]);
// 	      }
// 	  }
// 	});
</script>
</html>
     