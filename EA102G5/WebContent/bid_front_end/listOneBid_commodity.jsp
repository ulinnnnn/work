<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.Bid_commodity.model.*"%>
<%@ page import="com.Bid_commodity_no.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%-- ���X Concroller EmpServlet.java�w�s�Jrequest��EmpVO����--%>
<%
	Bid_commodityVO bid_commodityVO = (Bid_commodityVO) request.getAttribute("bid_commodityVO");

	Bid_commodity_noService bid_commodity_noSvc = new Bid_commodity_noService();
	Bid_commodity_noVO bid_commodity_noVO = bid_commodity_noSvc.getOnebc_no(bid_commodityVO.getBc_no());
%>

<html>
<head>
<title>���u��� - listOneBid.jsp</title>

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
				<h3>�ӫ~���</h3>
				<h4>
					<a href="<%=request.getContextPath()%>/bid_front_end/Bid.jsp"><img src="jpg/dog.jpeg" width="100" height="100" border="0">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>�v�аӫ~�W��</th>
			<th>�ӫ~�_�л���</th>
			<th>�v�аӫ~����</th>
			<th>�C���[�����B</th>
			<th>�v�ж}�l�ɶ�</th>
			<th>�v�е����ɶ�</th>
			<th>�v�аӫ~���O</th>
			<th>�v�аӫ~�Ӥ�</th>
			<th>�v�аӫ~�Ӥ�2</th>
		</tr>

		<tr>
			<td><%=bid_commodityVO.getB_name()%></td>
			<td><%=bid_commodityVO.getBs_price()%></td>
			<td><%=bid_commodityVO.getB_intro()%></td>
			<td><%=bid_commodityVO.getBplus_price()%></td>
			<td><%=bid_commodityVO.getB_startime()%></td>
			<td><%=bid_commodityVO.getB_endtime()%></td>
			<td>�i<%=bid_commodity_noVO.getBc_no()%> - <%=bid_commodity_noVO.getBc_commodity()%>�j
			</td>
			<td><img src="<%=request.getContextPath()%>/bid_front_end/picture.do?bp_no=<%=bid_commodityVO.getBp_no()%>"></td>
			<td><img src="<%=request.getContextPath()%>/bid_front_end/picture2.do?bp_no=<%=bid_commodityVO.getBp_no()%>"></td>

		</tr>
	</table>

</body>
</html>