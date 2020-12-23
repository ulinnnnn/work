<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.fmarticle.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>
<%@ page import="com.mem.model.*"%>
<%
 MemVO memVO = (MemVO) session.getAttribute("memVO");
%>

<%
 	fmarticleService fmSvc = new fmarticleService();
    List<fmarticleVO> list = fmSvc.getmemAll(memVO.getMem_no());
    pageContext.setAttribute("list",list);
    
// 	fmarticleService fmSvc2 = new fmarticleService();
//     List<fmarticleVO> list2 = fmSvc.getmemsile(memVO.getMem_no());
//     pageContext.setAttribute("list2",list2);
    
// 	fmarticleService fmSvc3 = new fmarticleService();
//     List<fmarticleVO> list3 = fmSvc.getmembuy(memVO.getMem_no());
//     pageContext.setAttribute("list3",list3);
    
    
    
%>

<jsp:useBean id="fmclassSvc" scope="page" class="com.fmclass.model.fmclassService" />
<!DOCTYPE html>
<html lang="zh_TW">
  <head>
    <!-- SITE TITTLE -->
    <meta charset="Big5">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>會員文章區</title>
    
    <!-- PLUGINS CSS STYLE -->
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet">
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/plugins/selectbox/select_option1.css" rel="stylesheet">
    <link href="assets/plugins/fancybox/jquery.fancybox.min.css" rel="stylesheet">
    <link href="assets/plugins/rateyo/jquery.rateyo.min.css" rel="stylesheet">
    <link href="assets/plugins/iziToast/css/iziToast.css" rel="stylesheet">
    <link href="assets/plugins/prismjs/prism.css" rel="stylesheet">
    <link href="assets/plugins/revolution/css/settings.css" rel="stylesheet">
    <link href="assets/plugins/animate/animate.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="assets/plugins/slick/slick.css" media="screen">
    <link rel="stylesheet" type="text/css" href="assets/plugins/slick/slick-theme.css" media="screen">
    <!-- CUSTOM CSS -->
    <link href="assets/css/style.css" rel="stylesheet">
<!--     <link rel="stylesheet" href="assets/css/color-option2.css" id="option_style"> -->
    <!-- Icons -->
    <link rel="shortcut icon" href="assets/img/favicon.png">
	<style>
}
.stepsWrapper .innerWrapper {
    border: 3px solid #f0f0f0;
    display: block;
    padding: 0px 0px 0px !important;
    width: 100%;
}
.h5{
	margin-buttom:8px !important;
} 

.page-header {
    margin: 0 0 5px 0;
    padding-bottom: 5px;
    border-bottom: 3px solid gray !important;
}
.joe .form-body .panel .panel-heading h3, .signUp .panel .panel-heading h3, .lostPassword .panel .panel-heading h3, .logIn .panel .panel-heading h3 {
  font-family:Microsoft JhengHei;
  font-weight:bold;
}
.singleProduct .media .media-body .tabArea .nav-tabs li a.nav-link:before {
    bottom: -1px;
    border-bottom: 2px solid orange;
}
div.try {
    border: 3px double gray-dark;
    width: 100%;
    height: 100%;
    background-color: white;
    margin-bottom: 15px;
    padding: 15px;
    font-size: 16px;
    font-weight: bold;
    line-height: 25px;
    border-radius: 25px;
}
	</style>
  </head>
 <body id="body" class="body-wrapper version1 up-scroll">
<%-- 錯誤表列 --%>
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
                  <a href="myfm.jsp"style="font-size:16px;font-weight:bold;">我的文章</a>
                </li>
                <li class="active">
                <a href="fmarticle.jsp" style="font-size:16px;font-weight:bold;">討論區</a></li>
              </ol>
            </div>
          </div>
        </div>
      </section>


    <div class="main-wrapper">
      <section class="mainContent clearfix" style="padding:0 0 0 0">
        <div class="container">
          <div class="row singleProduct singleProductTab">
            <div class="col-12" style="padding:0 0 0 0">
              <div class="media mb-4">
                <div class="media-body">
                  <div class="tabArea">
                    <ul class="nav nav-tabs bar-tabs">
<!--                       <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#OurDetails">我的商品</a></li> -->
<!--                       <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#OurSizing">已賣出商品</a></li> -->
<!--                       <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#Reviews">已得標商品</a></li> -->
<!--                       <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#Rain">我的問題</a></li> -->
                    </ul>
                    <div class="tab-content" style="min-height:550px">
                    
                    
                      <div id="OurDetails" class="tab-pane fade show active"> 
    		<div class="container">
            <div class="row">
              <div class="col-md-12" style="padding:0 0 0 0">
                <div class="innerWrapper clearfix stepsPage" style="padding: 0px 0px 0px !important">
                  <div class="page-header">
                    <h3 style="margin-bottom:0px">MyArticle</h3>
                  </div>
                  <c:forEach var="fmarticleVO" items="${list}">
                  
                  <h3 style="margin-bottom:0px">標題:${fmarticleVO.fm_head}</h3>
                  <div class="row shipping-info" style="padding:0 0 0 0">
                   <div class="col-4">
                     <h4 style="margin:8px"><a href="<%=request.getContextPath()%>/fm-front/NewFile.jsp?${fmarticleVO.fm_no}" style="color:blue" target="_blank">文章編號${fmarticleVO.fm_no}</a></h4>
<%--                      <h4 style="margin:8px"><a href="<%=request.getContextPath()%>/fm-front/TRY1.jsp?${bpVO.bp_no}" style="color:blue" target="_blank">商品編號:${fmarticleVO.fm_no}</a></h4> --%>
<%--                      <h4 style="margin:8px">商品價格:${bpVO.bp_pri}</h4> --%>
                     <h4 style="margin:8px"><fmt:formatDate value="${fmarticleVO.fm_ti}" pattern="yyyy-MM-dd EEE"/></h4>
                   </div>
                   <div class="col-4">
                     <h4 style="margin:8px">總類:${fmclassSvc.getOnefmclass(fmarticleVO.getFmcl_no()).fmcl_na}</h4>
<%--                      <h4 style="margin:8px">文章類別:${fmclassSvc.getOnefmclass(bpVO.getBpcl_no()).bpcl_name}</h4> --%>
<%--                      <h4 style="margin:8px">商品狀態:${bpVO.bp_new}</h4> --%>
<%--                      <h4 style="margin:8px"><fmt:formatDate value="${bpVO.bp_dot}" pattern="yyyy-MM-dd EEE"/></h4> --%>
                   </div>
                    <div class="col-4">
<%--                      <h4 style="margin:8px">運送方式:${bpVO.bp_del}</h4> --%>
<%--                      <h4 style="margin:8px">商品狀態:${bpVO.bpst_no}</h4> --%>
                     <h4 style="margin:8px 8px 4px 8px">
                     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/fm-front/FmarticleServlet" style="margin-bottom: 0px;">
					     <input type="hidden" name="fm_no"  value="${fmarticleVO.fm_no}">
					     <input type="hidden" name="action"	value="getOne_For_Update">
					     <input  style="margin-left:20px"type="submit" value="修改">
                   	</FORM>
                   
<%--                      <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/fm-front/FmarticleServlet" style="margin-bottom: 0px;"> --%>
<%-- 					     <input type="hidden" name="fm_no"  value="${fmarticleVO.fm_no}"> --%>
<!-- 					     <input type="hidden" name="action"	value="delete"> -->
<!-- 					     <input  style="margin-left:20px"type="submit" value="刪除"> -->
<!-- 					 </FORM> -->
					     
					  </h4>
                    </div>
                  </div>
				<div class="page-header"></div>
				</c:forEach>
                </div>
              </div>
            </div>
          </div>
                      </div>

            </div>
          </div>
         </div>
         
         
         
</div>
</div></div></div></section></div>
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
		<script src="assets/js/custom.js"></script>
		
		<script>
		
		$(document).ready(function(){			
			$(".change>button").click(function(){
	
			let data = {};
			let message = $(this).parent().children();
			let ppr = $(this).parent().prev();
			
			data.action = message[3].value;
			url = message[2].value;
			data.bpst_no = message[1].value;
			data.bp_no = message[0].value;
			
			$(this).hide();
			
			ppr.empty();
			ppr.text("商品狀態:"+data.bpst_no);

			
				$.ajax({
					url: url,
					type:"POST",
					data:data,
					success:function(){
						alert('修改成功!');
					}
				});
			});
			
			
			$(".end>button").click(function(){
				
				let data = {};
				let message = $(this).parent().children();
				let ppp = $(this).parent().prev();			

				data.action = message[3].value;
				url = message[2].value;
				data.bpst_no = message[1].value;
				data.bp_no = message[0].value;
				
				$(this).hide();
				
				ppp.empty();
				ppp.text("商品狀態:"+data.bpst_no);

				
					$.ajax({
						url: url,
						type:"POST",
						data:data,
						success:function(){
							alert('修改成功!');
						}
					});
					
					
					
				});

		});
		
		
		</script>

	</body>
</html>