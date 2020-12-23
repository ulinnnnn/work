<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.Bid_record.model.*"%>
<%@ page import="com.Bid_commodity.model.*"%>
<%
String BIDNO = request.getQueryString();
Bid_recordService bid_recordSvc = new Bid_recordService();
Bid_recordVO bidVO = bid_recordSvc.getOnebc_no(BIDNO);
pageContext.setAttribute("bidVO", bidVO);
Bid_commodityService bid_commoditySvc = new Bid_commodityService();
Bid_commodityVO bidVO1 = bid_commoditySvc.getOneBid(BIDNO);
pageContext.setAttribute("bidVO1", bidVO1);
%>
<html lang="en">
  <head>

    <!-- SITE TITTLE -->
    <meta charset="Big5">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Step # 03 - BIGBAG Store</title>

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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/default.css" id="option_style">

    <!-- Icons -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/img/favicon.png">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>

  <body id="body" class="body-wrapper version1 up-scroll">

    <div class="main-wrapper">

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Front-mem/depo.do" name="form2">
     <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix stepsWrapper">						
        <div class="container">
          <div class="row">
            <div class="col-md-8">
              <div class="innerWrapper clearfix stepsPage">
           
                <div class="page-header mb-4">
                  <h4>訂單結帳</h4>
                </div>
                
                <div class="cartListInner review-inner row">               
                    <div class="table-responsive">
                      <table class="table">
                        <thead>
                          <tr>
                            <th>商品照片</th>
                            <th>商品名稱</th>
                            <th>商品價格</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>                            																		
                              <img src="<%=request.getContextPath() %>/bid_front_end/picture.do?bp_no=${bidVO1.bp_no}" id="pic1"  style="height:50px;width:50px;">
                              <img src="<%=request.getContextPath() %>/bid_front_end/picture2.do?bp_no=${bidVO1.bp_no}" id="pic2"style="height:50px;width:50px;">
                            </td>
                            <td>${bidVO1.b_name}</td>
                        <td>$ ${bidVO.b_price}</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>                 
                </div>
                <div class="row shipping-info">
                  <div class="col-md-4">
                    <h5>商品內容</h5>
                    <p>
                      ${bidVO1.b_intro}<br>
                    </p>
                  </div>
                </div>
                <div class="well well-lg clearfix">
                  <ul class="pager">
                  <li class="previous float-left"><a class="btn btn-secondary btn-default float-left" href="checkout-step-2.html">back</a></li>
                    <li class="next">
             
                    <button class="btn btn-primary btn-default float-right" type="submit">付款             
                     <i class="fa fa-angle-right"></i></button>
                    <input type="hidden" name="action" value="bidMemTrans">	
					<input type="hidden" name=buyMem_no value="${bidVO.mem_no}">
     				<input type="hidden" name=sellMem_no value="${bidVO1.mem_no}">
     				<input type="hidden" name=bp_no value="${bidVO.bp_no}">
                    <input type="hidden" name=price value="${bidVO.b_price}"></li>                 
                  </ul>
                </div>
              </div>
            </div>          
          </div>
        </div>
      </section>
      </FORM>

 		</div>



	
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

	</body>
</html>
