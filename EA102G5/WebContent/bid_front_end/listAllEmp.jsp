<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.Bid_commodity.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	Bid_commodityService bid_commoditySvc = new Bid_commodityService();
	List<Bid_commodityVO> list = bid_commoditySvc.getAll();
	pageContext.setAttribute("list", list);
	//     Iterator it=list.iterator();
	//     while(it.hasNext()){
	//     	Bid_commodityVO bc=(Bid_commodityVO)it.next();
	//     	 System.out.println(bc.getB_NAME());

	//     }
	//     System.out.println();
%>
<jsp:useBean id="bid_commodity_noSvc" scope="page" class="com.Bid_commodity_no.model.Bid_commodity_noService" />

<html>
<head align='center'>

<style>
img {
	width: 100px;
	height: 100px;
}

table {
	align: 'center';
	width: 100%;
	margin-top: 50px;
	margin-bottom: 50px;
}

table#table-1 {
	background-color: #CCCCFF;
	border: 0px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>
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
<link rel="stylesheet" href="assets/css/default.css" id="option_style">

<!-- Icons -->
<link rel="shortcut icon" href="assets/img/favicon.png">
</head>
<body bgcolor='#CCCCFF' align='center'>

	<table id="table-1" align='center'>
		<tr>
			<td>
				<h3>所有商品資料</h3>
				<h4>
					<a href="<%=request.getContextPath()%>/bid_front_end/Bid.jsp"><img src="jpg/dog.jpeg" width="100" height="100" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<table align='center'>
		<tr>
			<th>商品編號</th>
			<th>商品類別</th>
			<th>商品名稱</th>
			<th>商品起標價格</th>
			<th>每次加價金額</th>
			<th>商品介紹</th>
			<th>開始時間</th>
			<th>結束時間</th>
			<th>商品照片</th>
			<th>商品照片2</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>
		<%@ include file="pages/page1.file"%>
		<c:forEach var="bid_commodityVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">

			<tr>
				<td>${bid_commodityVO.bp_no}</td>
				<td>${bid_commodityVO.bc_no}</td>
				<td>${bid_commodityVO.b_name}</td>
				<td>${bid_commodityVO.bs_price}</td>
				<td>${bid_commodityVO.bplus_price}</td>
				<td>${bid_commodityVO.b_intro}</td>
				<td>${bid_commodityVO.b_startime}</td>
				<td>${bid_commodityVO.b_endtime}</td>
				<td><img src="<%=request.getContextPath() %>/bid_front_end/picture.do?bp_no=${bid_commodityVO.bp_no}" id="pic1"></td>
				<td><img src="<%=request.getContextPath() %>/bid_front_end/picture2.do?bp_no=${bid_commodityVO.bp_no}" id="pic2"></td>
				<td>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/bid_front_end/bid_commodity.do" style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden" name="bp_no" value="${bid_commodityVO.bp_no}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/bid_front_end/bid_commodity.do" style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> <input type="hidden" name="bp_no" value="${bid_commodityVO.bp_no}"> 
						<input type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="pages/page2.file"%>
	<script>
		if ('#pic' == "/bid_front_end/jpg/0.jpeg") {
			$('#pic').hide();
		}
	</script>

</body>
</html>