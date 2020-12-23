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
<jsp:useBean id="bid_commodity_noSvc" scope="page" class="com.Bid_commodity_no.model.Bid_commodity_noService" />

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
.ellipsis {
overflow:hidden;
white-space: nowrap;
text-overflow: ellipsis;
}
.mainContent clearfix{
font-size:15px !important;
}
</style>
<body id="body" class="body-wrapper version1 up-scroll" >
<!-- onload="connect();" onunload="disconnect();" -->
	<div class="main-wrapper" style="overflow:visible;">
		<div class="header clearfix">
			<jsp:include page="/assets/topBar.jsp" flush="true" />
		</div>

			<section class="mainContent clearfix" style="padding: 0 0 0 0">
				<div class="container">
					<div class="row singleProduct singleProductTab">
						<div class="col-12">
							<div class="media mb-4">
								<div class="media-body">
									<div class="tabArea">
										<ul class="nav nav-tabs bar-tabs" style="font-size:20px">
											<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#details"style="font-weight: bold">我的商品留言</a></li>
											<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#OurDetails" style="font-weight: bold">未競標商品</a></li>
											<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#Reviews" style="font-weight: bold">交易中商品</a></li>
											<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#bidover" style="font-weight: bold">我的追蹤</a></li>
											<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#getbid" style="font-weight: bold">我得標的商品</a></li>
											<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#getreport" style="font-weight: bold">我的檢舉</a></li>
											<li class="nav-item"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
</svg><a class="nav-link"  href="<%=request.getContextPath()%>/bid_front_end/addBid_1.jsp">新增商品</a></li>			
										</ul>
										<div class="tab-content" style="min-height: 550px">

											<div id="details" class="tab-pane fade show active">
												<div class="container">
													<div class="row">
														<div class="col-md-12">
															<div class="innerWrapper clearfix stepsPage">
																<div class="orderBox myAddress">
																	<h2>我的商品留言</h2>
																	<div class="table-responsive">
																		<table class="table">
																			<thead>
																				<tr>
																					<th>商品編號</th>
																					<th>發問會員編號</th>
																					<th>留言時間</th>
																					<th class="ellipsis">留言內容</th>
																				</tr>
																			</thead>
																			<tbody>
																			<c:forEach var="bid_commodityVO" items="${list}">
																				<c:forEach var="bid_contentVO" items="${contentlist}">
																					<c:if test="${bid_commodityVO.mem_no==memVO.mem_no&&bid_contentVO.bp_no==bid_commodityVO.bp_no}">
																						<tr>
																							<td style="text-align: center; line-height: 100px;"><a  href="<%=request.getContextPath()%>/bid_front_end/listOne.jsp?${bid_commodityVO.bp_no}" style="color:blue" target="_blank">${bid_commodityVO.bp_no}</a></td>
																							<td>${bid_contentVO.mem_no}</td>
																							<td>${bid_contentVO.br_time}</td>
																							<td>${bid_contentVO.br_content}</td>
																					</c:if>
																				</c:forEach>
																				</c:forEach>
																			</tbody>
																		</table>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>

											<div id="OurDetails" class="tab-pane fade show ">
												<div class="container">
													<div class="row">
														<div class="col-12">
															<div class="innerWrapper">
																<div class="orderBox myAddress">
																	<h2>未競標商品</h2>
																	<div class="table-responsive">
																		<table class="table">
																			<thead>
																				<tr>
																					<th>編號</th>
																					<th>類別</th>
																					<th>名稱</th>
																					<th>起標價格</th>
																					<th>每次加價金額</th>
																					<th>商品介紹</th>
																					<th>開始時間</th>
																					<th>結束時間</th>
																					<th>照片</th>
																					<th>修改</th>
																					<th>刪除</th>
																				</tr>
																			</thead>
																			<tbody>
																				<c:forEach var="bid_commodityVO" items="${list}">
																					<c:if test="${bid_commodityVO.mem_no==memVO.mem_no&&bid_commodityVO.b_times==0}">
																						<tr>
																							<td style="text-align: center; line-height: 100px;"><a  href="<%=request.getContextPath()%>/bid_front_end/listOne.jsp?${bid_commodityVO.bp_no}" style="color:blue" target="_blank">${bid_commodityVO.bp_no}</a></td>
																							<td>${bid_commodityVO.bc_no}</td>
																							<td>${bid_commodityVO.b_name}</td>
																							<td>${bid_commodityVO.bs_price}</td>
																							<td>${bid_commodityVO.bplus_price}</td>
																							<td class="ellipsis">${bid_commodityVO.b_intro}</td>
																							<td>${bid_commodityVO.b_startime}</td>
																							<td>${bid_commodityVO.b_endtime}</td>
																							<td><img
																								src="<%=request.getContextPath() %>/bid_front_end/picture.do?bp_no=${bid_commodityVO.bp_no}"
																								id="pic1" style="width: 50px;"> <img
																								src="<%=request.getContextPath() %>/bid_front_end/picture2.do?bp_no=${bid_commodityVO.bp_no}"
																								id="pic2" style="width: 50px;"></td>
																							<td>
																								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/bid_front_end/bid_commodity.do"
																									style="margin-bottom: 0px;">
																									<input type="submit" value="修改"> <input type="hidden" name="bp_no"
																										value="${bid_commodityVO.bp_no}"> <input type="hidden" name="action"
																										value="getOne_For_Update">
																								</FORM>
																							</td>
																							<td>
																								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/bid_front_end/bid_commodity.do"
																									style="margin-bottom: 0px;">
																									<input type="submit" value="刪除"> <input type="hidden" name="bp_no"
																										value="${bid_commodityVO.bp_no}"> <input type="hidden" name="action" value="delete">
																								</FORM>
																							</td>
																					</c:if>
																				</c:forEach>
																			</tbody>
																		</table>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div id="Reviews" class="tab-pane fade show ">
												<div class="container">
													<div class="row">
														<div class="col-12">
															<div class="innerWrapper">
																<div class="orderBox myAddress">
																	<h2>交易中商品</h2>
																	<div class="table-responsive">
																		<table class="table">
																			<thead>
																				<tr>
																					<th>編號</th>
																					<th>狀態</th>
																					<th>名稱</th>
																					<th>價格</th>
																					<th>開始時間</th>
																					<th>結束時間</th>
																					<th>照片</th>
																				</tr>
																			</thead>
																			<tbody>
																				<c:forEach var="bid_commodityVO" items="${list}">
																					<c:if test="${bid_commodityVO.mem_no==memVO.mem_no&&bid_commodityVO.b_times!=0}">
																						<tr>
																							<td style="text-align: center; line-height: 100px;"><a  href="<%=request.getContextPath()%>/bid_front_end/listOne.jsp?${bid_commodityVO.bp_no}" style="color:blue" target="_blank">${bid_commodityVO.bp_no}</a></td>
																								<c:if test="${bid_commodityVO.b_times==0}">
																									<td>未競標</td>
																									</c:if>
																								<c:if test="${bid_commodityVO.b_times==01}">
																									<td >競標中</td>
																									</c:if>
																							 		<c:if test="${bid_commodityVO.b_times==02}">
																									<td><a data-toggle="tab"  style="color:black;">截標(待付款)</a></td>
																									</c:if>
																									
																									<c:if test="${bid_commodityVO.b_times==03}">																				
																									<td>
																									<a href='bid_commodity.do?action=getOne_Update&bp_no=${bid_commodityVO.bp_no}&b_times=4' style="color:blue" target="_blank">待運送(點我送出)</a>
																									</td>																									
																									</c:if>																			
																									<c:if test="${bid_commodityVO.b_times==04}">
																									<td>待領收</td>																	
																									</c:if>
																									<c:if test="${bid_commodityVO.b_times==05}">
																									<td>交易完成</td>
																									</c:if>
																									<c:if test="${bid_commodityVO.b_times==88}">
																			                         <td>被檢舉下架了</td>
																			                         </c:if>
																							<td>${bid_commodityVO.b_name}</td>
																							<td>${bid_commodityVO.bn_price}</td>
																							<td>${bid_commodityVO.b_startime}</td>
																							<td>${bid_commodityVO.b_endtime}</td>
																							<td><img src="<%=request.getContextPath() %>/bid_front_end/picture.do?bp_no=${bid_commodityVO.bp_no}" id="pic1" style="width: 50px;"> 
																								<img src="<%=request.getContextPath() %>/bid_front_end/picture2.do?bp_no=${bid_commodityVO.bp_no}" id="pic2" style="width: 50px;"></td>
																					</c:if>
																				</c:forEach>
																			</tbody>
																		</table>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div id="bidover" class="tab-pane fade show ">
												<div class="container">
													<div class="row">
														<div class="col-12">
															<div class="innerWrapper">
																<div class="orderBox myAddress">
																	<h2>我的追蹤</h2>
																	<div class="table-responsive">
																		<table class="table">
																			<thead>
																				<tr>
																					<th>編號</th>
																					<th>類別</th>
																					<th>名稱</th>
																					<th>起標價格</th>
																					<th>每次加價金額</th>
																					<th>商品介紹</th>
																					<th>開始時間</th>
																					<th>結束時間</th>
																					<th>照片</th>
																				</tr>
																			</thead>
																			<tbody>
																			<c:forEach var="bid_commodityVO" items="${list}">
																				<c:forEach var="bid_trackVO" items="${tracklist}">
																					<c:if test="${bid_trackVO.mem_no==memVO.mem_no&&bid_commodityVO.bp_no==bid_trackVO.bp_no}">
																						<tr>
																							<td style="text-align: center; line-height: 100px;"><a  href="<%=request.getContextPath()%>/bid_front_end/listOne.jsp?${bid_commodityVO.bp_no}" style="color:blue" target="_blank">${bid_commodityVO.bp_no}</a></td>
																							<td>${bid_commodityVO.bc_no}</td>
																							<td>${bid_commodityVO.b_name}</td>
																							<td>${bid_commodityVO.bs_price}</td>
																							<td>${bid_commodityVO.bplus_price}</td>
																							<td>${bid_commodityVO.b_intro}</td>
																							<td>${bid_commodityVO.b_startime}</td>
																							<td>${bid_commodityVO.b_endtime}</td>
																							<td><img
																								src="<%=request.getContextPath() %>/bid_front_end/picture.do?bp_no=${bid_commodityVO.bp_no}"
																								id="pic1" style="width: 50px;"> <img
																								src="<%=request.getContextPath() %>/bid_front_end/picture2.do?bp_no=${bid_commodityVO.bp_no}"
																								id="pic2" style="width: 50px;"></td>
																			
																							
																					</c:if>
																				</c:forEach>
																				</c:forEach>
																			</tbody>
																		</table>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div id="getbid" class="tab-pane fade show ">
												<div class="container">
													<div class="row">
														<div class="col-12">
															<div class="innerWrapper">
																<div class="orderBox myAddress">
																	<h2>我得標的商品</h2>
																	<div class="table-responsive">
																		<table class="table">
																			<thead>
																				<tr>
																					<th style="text-align: center;">商品編號</th>
																					<th>競標</th>
																					<th>名稱</th>
																					<th>結標價格</th>
																				</tr>
																			</thead>
																			<tbody>
																				<!-- 得標商品區塊 start -->
																				<c:forEach var="Bid_recordVO" items="${recordlist}">
																					<c:if test="${Bid_recordVO.mem_no==memVO.mem_no}">
																						<tr>
																							<c:forEach var="bidVO" items="${list}">
																							
																								<c:if test="${bidVO.bp_no==Bid_recordVO.bp_no}">
																									<td style="text-align: center; line-height: 100px;"><a  href="<%=request.getContextPath()%>/bid_front_end/listOne.jsp?${bidVO.bp_no}" style="color:blue" target="_blank">${bidVO.bp_no}</a></td>
																					
																								<c:if test="${bidVO.b_times==02}">
																									<td><a type="button" onclick="location.href='<%=request.getContextPath()%>/bid_front_end/bidtransaction1.jsp?${Bid_recordVO.bp_no}'">已得標(點我付款)</a></td>
																									</c:if>
																									<c:if test="${bidVO.b_times==03}">
																									<td>待運送</td>
																									</c:if>																				
																									<c:if test="${bidVO.b_times==04}">
																									<td><a href='bid_commodity.do?action=getOne_Update&bp_no=${bidVO.bp_no}&b_times=5' style="color:blue" target="_blank">待領收(點我領收)</a></td>																	
																									</c:if>
																									<c:if test="${bidVO.b_times==05}">
																									<td>交易完成</td>
																									</c:if>
																							<td>${bidVO.b_name}</td>
																							<td>${bidVO.bs_price}</td>
																								</c:if>
																							</c:forEach>
																							
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
											</div>
											<div id="getreport" class="tab-pane fade show ">
												<div class="container">
													<div class="row">
														<div class="col-12">
															<div class="innerWrapper">
																<div class="orderBox myAddress">
																	<h2>我檢舉的商品</h2>
																	<div class="table-responsive">
																		<table class="table">
																			<thead>
																				<tr>
																					<th style="text-align: center;">商品編號</th>
																					<th>商品名稱</th>
																					<th>競標檢舉項目</th>
																					<th>檢舉內容</th>
																					<th>檢舉時間</th>
																					<th>檢舉狀態</th>
																				</tr>
																			</thead>
																			<tbody>
																				<!-- 得標商品區塊 start -->
																				<c:forEach var="Bid_reportVO" items="${reportlist}">
																					<c:if test="${Bid_reportVO.mem_no==memVO.mem_no}">
																						<tr>
																							<c:forEach var="bidVO" items="${list}">
																								<c:if test="${bidVO.bp_no==Bid_reportVO.bp_no}">
																									<td style="text-align: center; line-height: 100px;"><a  href="<%=request.getContextPath()%>/bid_front_end/listOne.jsp?${Bid_reportVO.bp_no}" style="color:blue" target="_blank">${Bid_reportVO.bp_no}</a></td>
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
																									<td>檢舉成功(商品下架)</td>
																									</c:if>
																									<c:if test="${Bid_reportVO.bap_status==05}">
																									<td>檢舉失敗</td>
																									</c:if>
																									<c:if test="${Bid_reportVO.bap_status==06}">
																									<td>取消下架</td>
																									</c:if>
																								</c:if>
																							</c:forEach>
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
	<jsp:include page="/assets/memChat3.jsp" flush="true" />
<script>


</script>
</body>
</html>