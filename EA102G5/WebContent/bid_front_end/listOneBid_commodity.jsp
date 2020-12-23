<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.Bid_commodity.model.*"%>
<%@ page import="com.Bid_commodity_no.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%-- 取出 Concroller EmpServlet.java已存入request的EmpVO物件--%>
<%
	Bid_commodityVO bid_commodityVO = (Bid_commodityVO) request.getAttribute("bid_commodityVO");

	Bid_commodity_noService bid_commodity_noSvc = new Bid_commodity_noService();
	Bid_commodity_noVO bid_commodity_noVO = bid_commodity_noSvc.getOnebc_no(bid_commodityVO.getBc_no());
%>

<html>
<head>
<title>員工資料 - listOneBid.jsp</title>

<style>
table {
	background-color: #FFFF3B;
}

table#table-1 {
	background-color: #FFFF3B;
	border: 2px solid black;
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
img {
	width: 100px;
	height: 100px;
}

table {
	width: 1000px;
	margin-top: 50px;
	margin-bottom: 50px;
}

table, th, td {
	background-color: #FFFF3B;
	border: 1px solid #CCCCFF;
}

th, td {
	width: 100px;
	padding: 5px;
	text-align: center;
}
</style>

</head>
<body bgcolor='#D4FFFF'>


	<table id="table-1">
		<tr>
			<td>
				<h3>商品資料</h3>
				<h4>
					<a href="<%=request.getContextPath()%>/bid_front_end/Bid.jsp"><img src="jpg/dog.jpeg" width="100" height="100" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>競標商品名稱</th>
			<th>商品起標價格</th>
			<th>競標商品介紹</th>
			<th>每次加價金額</th>
			<th>競標開始時間</th>
			<th>競標結束時間</th>
			<th>競標商品類別</th>
			<th>競標商品照片</th>
			<th>競標商品照片2</th>
		</tr>

		<tr>
			<td><%=bid_commodityVO.getB_name()%></td>
			<td><%=bid_commodityVO.getBs_price()%></td>
			<td><%=bid_commodityVO.getB_intro()%></td>
			<td><%=bid_commodityVO.getBplus_price()%></td>
			<td><%=bid_commodityVO.getB_startime()%></td>
			<td><%=bid_commodityVO.getB_endtime()%></td>
			<td>【<%=bid_commodity_noVO.getBc_no()%> - <%=bid_commodity_noVO.getBc_commodity()%>】
			</td>
			<td><img src="<%=request.getContextPath()%>/bid_front_end/picture.do?bp_no=<%=bid_commodityVO.getBp_no()%>"></td>
			<td><img src="<%=request.getContextPath()%>/bid_front_end/picture2.do?bp_no=<%=bid_commodityVO.getBp_no()%>"></td>

		</tr>
	</table>

</body>
</html>