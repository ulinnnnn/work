<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.shop_product.model.*"%>
<%@ page import="com.shop_order.model.*"%>
<%@ page import="com.mem.model.*"%>


<%
	MemVO memVO = (MemVO)session.getAttribute("memVO");
	String mem_no = memVO.getMem_no();
	
	OrdService ordSvc = new OrdService();
	List<OrdVO> list = ordSvc.getMemOrd(mem_no);
	pageContext.setAttribute("list",list);
%>

<!DOCTYPE html>
<html>
<head>

    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>shopOrder.jsp</title>

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
    <style>
      *{
        font-size: 16px;
      }

    </style>

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
                <h2>購買訂單</h2>
              </div>
            </div>
            <div class="col-md-6">
              <ol class="breadcrumb float-right">
                <li>
                  <a href="<%=request.getContextPath()%>/index1.jsp"
                  style="letter-spacing:1px">首頁</a>
                </li>
                <li class="active" style="letter-spacing:1px">購買訂單</li>
              </ol>
            </div>
          </div>
        </div>
      </section>

      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix userProfile">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div class="btn-group" role="group" aria-label="...">
                <a href="shop.jsp" class="btn btn-default"><i class="fa fa-th" aria-hidden="true"></i>購物商城</a>
                <a href="shopOrder.jsp" class="btn btn-default active"><i class="fa fa-list" aria-hidden="true"></i>訂單查詢</a>
                <a href="shopTrack.jsp" class="btn btn-default"><i class="fa fa-gift" aria-hidden="true"></i>我的收藏</a>
                <a href="shopCoup.jsp" class="btn btn-default"><i class="fa fa-ticket" aria-hidden="true"></i>我的優惠券</a>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="innerWrapper">
                <div class="orderBox">
                  <h2>全部訂單</h2>
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>訂單編號</th>
                          <th>購買日期</th>
                          <th>寄往</th>
                          <th>總金額</th>
                          <th>訂單狀態</th>
                          <th></th>
                          <th></th>
                        </tr>
                      </thead>
                      <tbody>
                      
                <%
                		for(int i = 0; i < list.size(); i++){
                			OrdVO ordVO = list.get(i);
                %>        
                        <tr>
                          <td><%=ordVO.getOrdNo()%></td>
                          <td>
                          	<fmt:formatDate pattern="yyyy-MM-dd" value="<%=ordVO.getOrdDate()%>"></fmt:formatDate>
                      		</td>
                          <td><%=ordVO.getOrdAddress()%></td>
                          <!-- 價格去小數 -->
                          <%int price = Double.valueOf(ordVO.getOrdPrice()).intValue();%>
                          <td>NT$ <%=price%></td>
                          <td><div class="badge badge-primary badge-pill ord_status"
                           style="font-size: 18px;padding:7px 10px">
                           <%=ordVO.getOrdStatus()%></div></td>
                          
                          <td>
                          
                          <%
                          		if("未付款".equals(ordVO.getOrdStatus())){
                          %>
                          	<Form METHOD="post" ACTION="order.do">
								<input type="hidden" name="ord_no" value="<%=ordVO.getOrdNo()%>">
								<input type="hidden" name="action" value="payOrder">
								<button type="submit" class="btn btn-sm btn-secondary-outlined" >
									前往付款
								</button>
							</Form>

                          <%}else if("已出貨".equals(ordVO.getOrdStatus())){%>
                          
                          	<Form METHOD="post" ACTION="order.do">
								<input type="hidden" name="ord_status" value="訂單完成">
								<input type="hidden" name="ord_no" value="<%=ordVO.getOrdNo()%>">
								<input type="hidden" name="action" value="Update_Status">
								<button type="submit" class="btn btn-sm btn-secondary-outlined" >
									收到商品
								</button>
							</Form>
                          
                          <%}%>
                          
                          </td>
                          
                          <td>
                          	<Form METHOD="post" ACTION="item.do">
								<input type="hidden" name="ord_no" value="<%=ordVO.getOrdNo()%>">
								<input type="hidden" name="action" value="orderItem">
								<button type="submit" class="btn btn-sm btn-secondary-outlined"
								style="width:100px">
									查看訂單明細
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

<%-- <jsp:include page="notice.jsp" flush="true" /> --%>

</body>
</html>
