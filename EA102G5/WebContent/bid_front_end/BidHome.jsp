<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.Bid_commodity.model.*"%>
<%	
	Bid_commodityVO bid_commodityVO = (Bid_commodityVO) request.getAttribute("bid_commodityVO");
	String BIDNO = request.getQueryString();
	
	Bid_commodityService bidSvc = new Bid_commodityService();
	if(BIDNO==null){
	List<Bid_commodityVO> list = bidSvc.getAll();
	pageContext.setAttribute("list", list);
	}else if(BIDNO!=null){
	List<Bid_commodityVO> list1 = bidSvc.getOnebc_no(BIDNO);
	pageContext.setAttribute("list1", list1);
	}
%>

<head>
<!-- SITE TITTLE -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Product Grid 4 Col - BIGBAG Store</title>

<!-- PLUGINS CSS STYLE -->
<link href="<%=request.getContextPath()%>/assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/plugins/selectbox/select_option1.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/plugins/fancybox/jquery.fancybox.min.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/plugins/rateyo/jquery.rateyo.min.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/plugins/iziToast/css/iziToast.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/plugins/prismjs/prism.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/plugins/revolution/css/settings.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/plugins/animate/animate.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/plugins/slick/slick.css" media="screen">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/plugins/slick/slick-theme.css" media="screen">


<!-- CUSTOM CSS -->
<link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/default.css" id="option_style">

<!-- Icons -->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/img/favicon.png">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/joe_footer.css" >

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="body" class="body-wrapper version1 up-scroll" >
	
	<div class="main-wrapper" style="overflow:vidible;">
	<div class="header clearfix">
	<jsp:include page="/assets/topBar.jsp" flush="true"/>
	</div>
	</div>


	<!-- MAIN CONTENT SECTION -->
<div class="row" style="border-top-width: 100px;margin-top: 50px;max-width: 1366px;margin: auto;">
	    <div class="col-lg-2 col-md-12 sideBar">
           <div class="panel panel-default">
              <div class="panel-heading">商品類別</div>               
                <div class="panel-body">
                  <ul class="list-unstyle sidebar-list">
                    <li><a type="submit"  href="<%=request.getContextPath()%>/bid_front_end/BidHome.jsp"><i class="fa fa-caret-right" aria-hidden="true" ></i>全部</a></li>                 
                    <li><a type="submit" href="<%=request.getContextPath()%>/bid_front_end/BidHome.jsp?1" ><i class="fa fa-caret-right" aria-hidden="true"></i>兒童類 </a></li>       
                    <li><a type="submit" href="<%=request.getContextPath()%>/bid_front_end/BidHome.jsp?2" ><i class="fa fa-caret-right" aria-hidden="true"></i>電玩 </a></li>   
                    <li><a type="submit" href="<%=request.getContextPath()%>/bid_front_end/BidHome.jsp?3"><i class="fa fa-caret-right" aria-hidden="true"></i>收藏</a></li>
                    <li><a type="submit" href="<%=request.getContextPath()%>/bid_front_end/BidHome.jsp?4"><i class="fa fa-caret-right" aria-hidden="true"></i>其他</a></li>
                    <li><a type="submit" href="<%=request.getContextPath()%>/bid_front_end/BidHome.jsp?5"><i class="fa fa-caret-right" aria-hidden="true"></i>成人</a></li>                 
                  </ul>
                </div>
              </div>
              <div class="panel panel-default">
              <div class="panel-heading">來去新增商品8</div>               
                <div class="panel-body">
                  <ul class="list-unstyle sidebar-list">
                    <li><a type="submit"  href="<%=request.getContextPath()%>/bid_front_end/backBid.jsp"><i class="fa fa-caret-right" aria-hidden="true" ></i>會員專區</a></li>                 
                     </ul>
                </div>
              </div>
              
           </div>
	<div class="col-lg-10 tab-content">	
		<div class="container">
			<div class="row">
			<c:if test="<%=BIDNO==null%>">
				<c:forEach var="bid_commodityVO" items="${list}">
				<c:if test="${bid_commodityVO.b_times==1}">
					<div class="col-lg-3 col-md-4">
						<div class="productBox">
							<div class="productImage clearfix">						
								<img src=<%=request.getContextPath() %>/bid_front_end/picture.do?bp_no=${bid_commodityVO.bp_no} style="height:210px;width:210px" alt="products-img" />	
							</div>
							<div class="productCaption clearfix">
								<a href="<%=request.getContextPath()%>/bid_front_end/listOne.jsp?${bid_commodityVO.bp_no}">
									<h5 style="font-size:13px;">商品名稱:${bid_commodityVO.b_name}</h5>
								</a>
								<h4>現在競標價格:$${(bid_commodityVO.bn_price==0)?bid_commodityVO.bs_price:bid_commodityVO.bn_price}</h4>
							</div>
						</div>
					</div>	
					</c:if>		
				</c:forEach>	
				</c:if>
				<c:if test="<%=BIDNO!=null%>">
				<c:forEach var="bid_commodityVO" items="${list1}">
					<c:if test="${bid_commodityVO.b_times==1}">
					
					<div class="col-lg-3 col-md-4 ">
						<div class="productBox">
							<div class="productImage clearfix">						
								<img src=<%=request.getContextPath() %>/bid_front_end/picture.do?bp_no=${bid_commodityVO.bp_no} style="height:210px;width:210px" alt="products-img" />	
							</div>
							<div class="productCaption clearfix">
								<a href="<%=request.getContextPath()%>/bid_front_end/listOne.jsp?${bid_commodityVO.bp_no}">
									<h5 style="font-size:13px;">商品名稱:${bid_commodityVO.b_name}</h5>
								</a>
								<h4>現在競標價格:$${(bid_commodityVO.bn_price==0)?bid_commodityVO.bs_price:bid_commodityVO.bn_price}</h4>
							</div>
						</div>
					</div>	
					</c:if>		
				</c:forEach>	
				</c:if>
			</div>
		</div>	
	</div>
	
	
	
           </div>
     <jsp:include page="/assets/footer.jsp" flush="true"/>
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
	<jsp:include page="/assets/loginModal.jsp" flush="true"/>
	<jsp:include page="/assets/memChat3.jsp" flush="true"/>
</body>
<script>
console.log(<%=BIDNO%>+"編號");

</script>
</html>

