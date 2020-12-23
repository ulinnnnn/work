<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shop_product.model.*"%>
<%@ page import="com.shop_order.model.*"%>
<%@ page import="com.shop_item.model.*"%>
<%@ page import="com.shop_coupon.model.*"%>

<%
	List<ItemVO> list = (List<ItemVO>) request.getAttribute("itemlist");
	pageContext.setAttribute("list",list);
%>
<jsp:useBean id="prodSvc" scope="page" class="com.shop_product.model.ProdService" />   
    
    
<!DOCTYPE html>
<html>
<head>

    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>oneOrdItem.jsp</title>

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
        font-size: 14px;
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

  

      <!-- LIGHT SECTION -->
      <section class="lightSection clearfix pageHeader">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <div class="page-title">
                <h2>訂單明細</h2>
              </div>
            </div>
            <div class="col-md-6">
              <ol class="breadcrumb float-right">
                <li>
                  <a href="<%=request.getContextPath()%>/index1.jsp"
                  style="letter-spacing:1px">首頁</a>
                </li>
                <li class="active"
                style="letter-spacing:1px">訂單明細</li>
              </ol>
            </div>
          </div>
        </div>
      </section>
      
          <%
          	OrdService ordSvc = new OrdService();
          	OrdVO ordVO = ordSvc.getOneOrd(list.get(0).getOrdNo());
          %>

      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix userProfile">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <div class="btn-group" role="group" aria-label="...">
                 <a href="shop.jsp" class="btn btn-default"><i class="fa fa-th" aria-hidden="true"></i>購物商城</a>
                <a href="shopOrder.jsp" class="btn btn-default active"><i class="fa fa-list" aria-hidden="true"></i>訂單查詢</a>
                <a href="shopTrack.jsp" class="btn btn-default"><i class="fa fa-gift" aria-hidden="true"></i>我的收藏</a>
                <a href="shopCoup.jsp" class="btn btn-default"><i class="fa fa-ticket" aria-hidden="true"></i>我的優惠券</a>
				<div style=" float: right">
              	<form method="post" action="toServ">  
              	    <input type="hidden" name="action" value="toCustText">
                	<input type="hidden" name="ordNo" value="<%=ordVO.getOrdNo()%>">
                	<input class="btn btn-default btn-primary" type="submit" value="聯絡客服" style="font-weight:bold">                                    
              	</form>
              	</div>
            </div>
          </div>
         </div>
          

          
          <div class="row">
            <div class="col-12">
              <div class="innerWrapper singleOrder">
                <div class="orderBox">
                  <h2>訂單編號 <%=ordVO.getOrdNo()%></h2> 
                </div>
                <div class="row">
                  <div class="col-md-6 col-12">
                    <div class="panel panel-default">
                      <div class="panel-heading">
                        <h4 class="panel-title">收件人資訊</h4>
                      </div>
                      <div class="panel-body">
                        <address>
                          <strong><%=ordVO.getOrdName()%></strong>
                          <br>
                          電話： <%=ordVO.getOrdPhone()%>
                          <br>
                          信箱: <%=ordVO.getOrdMail()%>
                         
                        </address>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6 col-12">
                    <div class="panel panel-default">
                      <div class="panel-heading">
                        <h4 class="panel-title">收件地址</h4>
                      </div>
                      <div class="panel-body">
                        <address>
                          <strong><%=ordVO.getOrdCity()%></strong>
                          <br>
                          <%=ordVO.getOrdCode()%><%=ordVO.getOrdSection()%>
                          <br>
                         <%=ordVO.getOrdAddress()%>
                        </address>
                      </div>
                    </div>
                  </div>
                
                  <div class="col-12">
                    <div class="panel panel-default">
                      <div class="panel-heading">
                        <h4 class="panel-title">購買商品明細</h4>
                      </div>
                      <div class="panel-body">
                        <div class="row">
                          <div class="col-md-12 col-12">
                            <table class="table">
                      <thead>
                        <tr>
                          <th></th>
                          <th>商品名稱</th>
                          <th>價錢</th>
                          <th>數量</th>
                          <th>小計</th>
                        </tr>
                      </thead>
                      <tbody>
                  <c:forEach var="itemVO" items="${list}">
                        <tr>
                          <td class="">
                            <span class="cartImage">
                            <img src="<%=request.getContextPath()%>/getPictureServlet?prod_no=${prodSvc.getOneProd(itemVO.getProdNo()).getProdNo()}"
                            height="100px" width="80px"
                             alt="image"></span>
                          </td>
                          <td class="">${prodSvc.getOneProd(itemVO.getProdNo()).getProdName()}</td>
                          <td class="">NT$ ${prodSvc.getOneProd(itemVO.getProdNo()).getProdPrice()}</td>
                          <td class="">${itemVO.getItemQuantity()}</td>
                          <td class="">NT$ ${itemVO.getProdPrice()*itemVO.getItemQuantity()}</td>
                        </tr>
				</c:forEach>
						
                      </tbody>
                    </table>
					<hr>
                    <div class="row totalAmountArea">
                    <div class="col-sm-4 ml-sm-auto">
                      <ul class="list-unstyled">
                      	<li style="font-size:16px;margin-top:10px">使用優惠券:  
                      	<%
                      		String discount = "無";
                      		String ord_coup = ordVO.getOrdCoup();
                      		if(!"無".equals(ord_coup)){
                      			double ord_discount =  new CoupService().getOneCoup(ord_coup).getCoupDiscount();
                      			discount = String.valueOf(ord_discount*10);
                      			discount += "折";
                      		}
                      	%>
                      	<%=discount%></li>
                        <li style="font-size:18px;margin-top:20px">總付款金額 
                        <!-- 價錢去小數 -->
                        <%
                        	int price = Double.valueOf(ordVO.getOrdPrice()).intValue();
                        %>
                        NT$ <%=price %></li>
                      </ul>
                    </div>
                  </div>
                          </div>
                         
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="col-12">
                    <div class="btn-group" role="group" aria-label="...">
                      <a href="shopOrder.jsp" class="btn btn-default"
                      style="left:30%;font-size:14px">
                          返回購買訂單
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

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
		
<%-- <jsp:include page="notice.jsp" flush="true" /> --%>
</body>
</html>
