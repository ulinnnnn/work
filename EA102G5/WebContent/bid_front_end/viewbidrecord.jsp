<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.Bid_record.model.*"%>
<%@ page import="com.Bid_commodity.model.*"%>
<%
Bid_commodityVO bid_commodityVO = (Bid_commodityVO) request.getAttribute("bid_commodityVO");
	Bid_recordService bid_recordSvc = new Bid_recordService();
	List<Bid_recordVO> list = bid_recordSvc.getAll();
	pageContext.setAttribute("list", list);
	Bid_commodityService bid_commoditySvc = new Bid_commodityService();
	List<Bid_commodityVO> list1 = bid_commoditySvc.getAll();
	pageContext.setAttribute("list1", list1);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
<!-- SITE TITTLE -->
<meta charset="ms-950">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Address - BIGBAG Store</title>

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
<style>

.orderBox .table-responsive .table tbody tr td:last-child{
    text-align:left;
}

.orderBox.myAddress .table-responsive .table tbody tr td {
    font-size: 1px;
}
.orderBox.myAddress .table-responsive .table thead tr th {
    font-size: 8px;
}
.orderBox myAddress.table-responsive.table{
    padding-left: 10px !important;
    width: auto !important;
}
</style>
<body id="body" class="body-wrapper version1 up-scroll" style="width:100%;">



	<!-- MAIN CONTENT SECTION -->
	<section class="mainContent clearfix userProfile">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="innerWrapper">
						<div class="orderBox myAddress">
							<h2>我得標的商品</h2>
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th style="text-align:center;">商品編號</th>
											<th>名稱</th>
											<th>結標價格</th>
											<th>商品介紹</th>
											<th>結帳</th>
										</tr>
									</thead>
									<tbody>
										<!-- 得標商品區塊 start -->
										<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />									
									    <c:forEach var="bid_recordVO" items="${list}" >
											<c:if test="${bid_recordVO.mem_no==memVO.mem_no&&bid_recordVO.bo_statusno==01}">
												<tr>
													<td style="text-align:center;line-height:100px;">${bid_recordVO.bp_no}</td>
													<c:forEach var="bidVO" items="${list1}">
														<c:if test="${bidVO.bp_no==bid_recordVO.bp_no}"> 
												            <td>${bidVO.b_name}</td>
															<td>${bid_recordVO.b_price}</td>
															<td>${bidVO.b_intro}</td>
														</c:if>
													</c:forEach>
													<td>
														<input type="button" value="付款"  onclick="location.href='<%=request.getContextPath()%>/bid_front_end/bidtransaction1.jsp?${bid_recordVO.bp_no}'" >
													</td>
												</tr>
											</c:if>		
									    </c:forEach>
									    <!-- 得標商品區塊 end -->
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

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

