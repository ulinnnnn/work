<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bpclass.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%-- ���X Concroller EmpServlet.java�w�s�Jrequest��EmpVO����--%>

<%BpclassVO bpclassVO = (BpclassVO) request.getAttribute("bpclassVO");%>

<html>
<head>
<title>�浧 bpclass���- listonebpclass.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
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

</head>
<body bgcolor='orange'>

<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>�浧 bpclass���- listonebpclass.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/bpclass-back/select_class_page.jsp">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>���O�s��</th>
		<th>���O�W��</th>
	</tr>
	<tr>
		<td>${bpclassVO.bpcl_no}</td>
		<td>${bpclassVO.bpcl_name}</td>
	</tr>
</table>
</body>
</html>