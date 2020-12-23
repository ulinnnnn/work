<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shop_product.model.*"%>
<%@ page import="com.shop_track.model.*"%>
<%@ page import="com.mem.model.*"%>


<%
	MemVO memVO = (MemVO)session.getAttribute("memVO");
	String mem_no = memVO.getMem_no();
	
	TrackService trackSvc = new TrackService();
	List<TrackVO> list = trackSvc.getMemTrack(mem_no);
	pageContext.setAttribute("list",list);
	/* System.out.println(list.get(1).getProdNo()); */
%>
<jsp:useBean id="prodSvc" scope="page"
 class="com.shop_product.model.ProdService">
</jsp:useBean>

<!DOCTYPE html>
<html>
<head>

    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>shopTrack.jsp</title>

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

    <div class="main-wrapper">

    

      <!-- LIGHT SECTION -->
      <section class="lightSection clearfix pageHeader">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <div class="page-title">
                <h2>商品收藏</h2>
              </div>
            </div>
            <div class="col-md-6">
              <ol class="breadcrumb pull-right">
                <li>
                   <a href="<%=request.getContextPath()%>/index1.jsp"
                  style="letter-spacing:1px">首頁</a>
                </li>
                <li class="active" style="letter-spacing:1px">商品收藏</li>
              </ol>
            </div>
          </div>
        </div>
      </section>

      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix userProfile">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <div class="btn-group" role="group" aria-label="...">
                <a href="shop.jsp" class="btn btn-default"><i class="fa fa-th" aria-hidden="true"></i>購物商城</a>
                <a href="shopOrder.jsp" class="btn btn-default"><i class="fa fa-list" aria-hidden="true"></i>訂單查詢</a>
                <a href="shopTrack.jsp" class="btn btn-default active"><i class="fa fa-gift" aria-hidden="true"></i>我的收藏</a>
                <a href="shopCoup.jsp" class="btn btn-default"><i class="fa fa-ticket" aria-hidden="true"></i>我的優惠券</a>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-12">
              <div class="innerWrapper">
                <div class="orderBox myAddress wishList">
                  <h2>商品收藏</h2>
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th></th>
                          <th>商品名稱</th>
                          <th>價格</th>
                          <th>庫存狀態</th>
                          <th></th>
                        </tr>
                      </thead>
                      <tbody>
                      
                      	<% 
							for(int i =0; i <list.size(); i++){
								TrackVO trackVO = list.get(i);
								ProdVO prodVO = prodSvc.getOneProd(trackVO.getProdNo());

						%>
                      
                        <tr>
                          <td>
	                          <Form method="post" action="track.do">
								<input type="hidden" name="prod_no"  value="<%=trackVO.getProdNo() %>">
								<input type="hidden" name="mem_no"  value="<%=trackVO.getMemNo() %>">
								<input type="hidden" name="action" value="delete_track">
								<button type="submit" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button> 
							</Form>	
                          
								<img src="<%=request.getContextPath()%>/getPictureServlet?prod_no=<%=prodVO.getProdNo()%>"
								width="68px" height="74px">
						</td>
                        <td><%=prodVO.getProdName() %></td>
                        <!-- 價錢去小數 -->
                        <% int price =  prodVO.getProdPrice().intValue(); %>
                        <td>NT$ <%=price %></td>
                        <td>有庫存</td>
                        <td>
                        
                        <Form METHOD="post" ACTION="item.do"> 
								<input type="hidden" name="item_quantity" value="1">
								<input type="hidden" name="prod_no"  value="<%=prodVO.getProdNo() %>">
								<input type="hidden" name="prod_price"  value="<%=prodVO.getProdPrice() %>">
								<!--送出當前路徑，回來的時候才知道要回到哪-->
								<input type="hidden" name="requestURL" value="<%=request.getContextPath()%>/shop_product/shop.jsp"> 
								<input type="hidden" name="action" value="ADD">
								<button type="submit" class="btn btn-sm btn-secondary-outlined">
									<i class="fa fa-shopping-basket"></i>
								</button>
							</Form>
                         
                        </td>
                        </tr>
                       
                        
                        
                        <%}%>
                         
                      
                        
                        
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

	</div>
	
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
	
<jsp:include page="notice.jsp" flush="true" />
</body>
</html>
