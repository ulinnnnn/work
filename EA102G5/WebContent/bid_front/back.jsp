<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.Bid_commodity.model.*"%>
<%@ page import="com.Bid_content.model.*"%>
<%@ page import="com.Bid_record.model.*"%>
<%@ page import="com.Bid_commodity_track.model.*"%>
<%@ page import="com.Bid_commodity_Report.model.*"%>
<%@ page import="com.mem.model.*"%>

<%
	Bid_commodityService bid_commoditySvc = new Bid_commodityService();
	List<Bid_commodityVO> list = bid_commoditySvc.getAll();
	pageContext.setAttribute("list", list);
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	Bid_contentService Bid_contentSvc = new Bid_contentService();
	List<Bid_contentVO> contentlist = Bid_contentSvc.getcontentAll();
	pageContext.setAttribute("contentlist", contentlist);

	Bid_recordService Bid_recordSvc = new Bid_recordService();
	List<Bid_recordVO> recordlist = Bid_recordSvc.getAll();
	pageContext.setAttribute("recordlist", recordlist);

	Bid_commodity_trackService Bid_commodity_trackSvc = new Bid_commodity_trackService();
	List<Bid_commodity_trackVO> tracklist = Bid_commodity_trackSvc.getAll();
	pageContext.setAttribute("tracklist", tracklist);

	Bid_commodity_ReportService Bid_commodity_ReportSvc = new Bid_commodity_ReportService();
	List<Bid_commodity_ReportVO> reportlist = Bid_commodity_ReportSvc.getAll();
	pageContext.setAttribute("reportlist", reportlist);
%>
<jsp:useBean id="bid_commodity_noSvc" scope="page"
	class="com.Bid_commodity_no.model.Bid_commodity_noService" />

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>競標會員的檢舉</title>
<!-- SITE TITTLE -->
<meta charset="ms-950">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Address - BIGBAG Store</title>

<!-- PLUGINS CSS STYLE -->
<link
	href="<%=request.getContextPath()%>/assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/jquery-ui/jquery-ui.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/selectbox/select_option1.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/fancybox/jquery.fancybox.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/rateyo/jquery.rateyo.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/iziToast/css/iziToast.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/prismjs/prism.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/revolution/css/settings.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/animate/animate.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/plugins/slick/slick.css"
	media="screen">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/plugins/slick/slick-theme.css"
	media="screen">
<!-- CUSTOM CSS -->
<link href="<%=request.getContextPath()%>/assets/css/style.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/default.css"
	id="option_style">
<!-- Icons -->
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/assets/img/favicon.png">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<style>
.orderBox .table-responsive .table tbody tr td:last-child {
	text-align: left;
}

.orderBox.myAddress .table-responsive .table tbody tr td {
	font-size: 1px;
}

.orderBox.myAddress .table-responsive .table thead tr th {
	font-size: 8px;
}

.orderBox myAddress.table-responsive.table {
	padding-left: 10px !important;
	width: auto !important;
}

svg.bi.bi-plus-circle {
	font-size: 20px;
	position: relative;
	right: -95px;
	top: -1px;
}

#bdtitle{
	margin:20px auto auto auto;
}
</style>
<body id="body" class="body-wrapper version1 up-scroll">
<jsp:include page="../assets/headerBack.jsp"></jsp:include>
	<!-- onload="connect();" onunload="disconnect();" -->
	<div class="main-wrapper" style="overflow: vidible;">
		
		<section class="mainContent clearfix" style="padding: 0 0 0 0">
			<div class="container">
				<div class="row singleProduct singleProductTab">
					<div class="col-12">
						<div class="media mb-4">
							<div class="media-body">
								<div class="tabArea">
									
										<div id="getreport" class="tab-pane fade show ">
											<div class="container">
												<div class="row">
													<div class="col-12">
														<div class="innerWrapper">
															<div class="orderBox myAddress" id="bdtitle">
																<h2>會員的檢舉</h2>
																<div class="table-responsive">
																	<table class="table">
																		<thead>
																			<tr>
																				<th style="text-align: center;">商品編號</th>
																				<th>檢舉會員編號</th>
																				<th>商品名稱</th>
																				<th>競標檢舉項目</th>
																				<th>檢舉內容</th>
																				<th>檢舉時間</th>
																				<th>目前檢舉狀態</th>
																				<th>更改檢舉狀態</th>
																			</tr>
																		</thead>
																		<tbody>
																			<!-- 得標商品區塊 start -->
																			<c:forEach var="Bid_reportVO" items="${reportlist}">
																					<tr>
																						<c:forEach var="bidVO" items="${list}">
																							<c:if test="${bidVO.bp_no==Bid_reportVO.bp_no}">
																								<td
																									style="text-align: center; line-height: 100px;"><a
																									href="<%=request.getContextPath()%>/bid_front_end/listOne.jsp?${Bid_reportVO.bp_no}"
																									style="color: blue" target="_blank">${Bid_reportVO.bp_no}</a></td>
																								<td>${Bid_reportVO.mem_no}</td>
																								<td>${bidVO.b_name}</td>
																								<td>${Bid_reportVO.br_project}</td>
																								<td>${Bid_reportVO.br_content}</td>
																								<td>${Bid_reportVO.br_time}</td>
																								<c:if test="${Bid_reportVO.bap_status==01}">
																									<td>待處理</td>
																								</c:if>
																								<c:if test="${Bid_reportVO.bap_status==02}">
																									<td>處理中</td>
																								</c:if>
																								<c:if test="${Bid_reportVO.bap_status==03}">
																									<td>已處理</td>
																								</c:if>
																								<c:if test="${Bid_reportVO.bap_status==04}">
																									<td>檢舉成功</td>
																								</c:if>
																								<c:if test="${Bid_reportVO.bap_status==05}">
																									<td>檢舉失敗</td>
																								</c:if>
																								<td>
																								<FORM METHOD="post" ACTION="/EA102G5/bid_front_end/bid_commodity_Report.do" name="form1" enctype="multipart/form-data">
																								<select size="1" name="bap_status" >
																										<option value="01">待處理</option>
																										<option value="02">處理中</option>
																										<option value="03">已處理</option>
																										<option value="04">檢舉成功(商品下架)</option>
																										<option value="05">檢舉失敗</option>
																										<option value="06">取消下架</option>
																								</select>
																								<button type="submit" style="height:20px;width:30px">修改</button>
																								<input type="hidden" name="bp_no" value="${Bid_reportVO.bp_no}">
																								<input type="hidden" name="bre_no" value="${Bid_reportVO.bre_no}">
																								<input type="hidden" name="action" value="getOne_For_Update">
																								</FORM>
																								</td>
																							</c:if>
																						</c:forEach>
																					</tr>
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
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		</section>

	</div>
	
<!-- FOOTER -->
<jsp:include page="../assets/footerBack.jsp"></jsp:include>		
	</div>
	</div>
	</div>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/jquery/jquery-migrate-3.0.0.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/jquery-ui/jquery-ui.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/slick/slick.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/fancybox/jquery.fancybox.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/iziToast/js/iziToast.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/prismjs/prism.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/countdown/jquery.syotimer.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/velocity/velocity.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/rateyo/jquery.rateyo.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/custom.js"></script>
	<jsp:include page="/assets/memChat3.jsp" flush="true" />
	<script>
		
	</script>
</body>
</html>