<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shop_product.model.*"%>

<%
	ProdService prodSvc = new ProdService();
	List<ProdVO> list = prodSvc.getAll();
	pageContext.setAttribute("list",list);
%>

<!DOCTYPE html>
<head>

    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>shopFinish</title>

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

 <body id="body" class="body-wrapper version1 up-scroll">
 
   <!-- header以下 -->
    <div class="main-wrapper" style="overflow:visible;">
    <div class="header clearfix">
   <jsp:include page="/assets/topBar.jsp" flush="true"/>
	</div>
	</div>
  <!-- header以上  -->

      <!-- LIGHT SECTION -->
      <section class="lightSection clearfix pageHeader">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <div class="page-title">
                <h2>訂單完成</h2>
              </div>
            </div>
            <div class="col-md-6">
              <ol class="breadcrumb float-right">
                <li>
                  <a href="<%=request.getContextPath()%>/index1.jsp"
                  style="letter-spacing:1px">首頁</a>
                </li>
                <li class="active"
                style="letter-spacing:1px">訂單完成</li>
              </ol>
            </div>
          </div>
        </div>
      </section>

      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix stepsWrapper">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div class="innerWrapper clearfix stepsPage">
                <div class="row justify-content-center order-confirm">
                  <div class="col-md-8 col-lg-6 text-center">
                    <h2>付款成功</h2>
                    <span>您將會收到email裡面包含您的訂單明細</span>
                    <p class="">
                      你的訂單編號: #95475261 <br>
                      有任何問題請聯絡客服: iii@ntu.com <br>
                      感謝您的購買
                      toy all hot 
                    </p>
                    <a href="shop.jsp" class="btn btn-primary btn-default">Back to shop</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      
<a class="media text-secondary" data-toggle="modal" data-target="#modal-contact">modal</a>
      
<!-- pay Modal -->
<div class="modal fade" id="modal-contact" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header justify-content-end border-bottom-0">
      
		<h5><a type="button" class="btn-close-icon" data-dismiss="modal" aria-label="Close">
          x
        </a></h5>
	</div>
			
      <div class="modal-body">
        <div class="row">
          <div class="col-md-12">
          		
              <div class="card text-center px-0 border-0">
				<h2>確定付款</h2>
               <div class="card-body"> 
                  
                  <br>
                  <h4>使用點數支付NT$ 100元</h4>
                  <br>
                  <br>
                  <form method="post" action="<%=request.getContextPath() %>/Front-mem/depo.do"
                   style="display:inline-block;">
                     	 <input type="hidden" name="action" value="shopMemTrans">
                     	 <%-- <input type="hidden" name="buyMem_no" value="<%=memVO.getMem_no()%>">
                     	 <input type="hidden" name="price" value="<%=ordVO.getOrdPrice()%>" >
                     	 <input type="hidden" name="ord_no" value="<%=ordVO.getOrdNo()%>"> --%>
                     	<button id="pointBtn" type="submit" class="btn btn-primary-outlined"
                     	style="color:black">確定付款</button>
                   </form>
                  <button class="btn btn-primary-outlined" data-dismiss="modal"
                  style="color:black;background:#88B04B;color:white;">取消付款</button>
                </div>
			</div>

		</div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- 以上是payModal -->      
     
      
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
<%-- 		<jsp:include page="/assets/memChat3.jsp" flush="true"/> --%>
 
</body>
</html>