<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bpclass.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    BpclassService bpclassSvc = new BpclassService();
    List<BpclassVO> list = bpclassSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<html>
<head>
<title>我的商品 - listAllbp.jsp</title>

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
	width: 1500px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;

  }
  table, th, td {
    border: 1px solid orange;
    size: 5px;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
   	<tr><td>
		 <p>商品表 - listallbp.jsp</p>
		 <p><a href="<%=request.getContextPath()%>/bpclass-back/select_class_page.jsp">回首頁</a></p>
	</td><td>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>類別編號</th>
		<th>類別名稱</th>
		<th>刪除</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="bpclassVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${bpclassVO.bpcl_no}</td>
			<td>${bpclassVO.bpcl_name}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/bpclass-back/BpclassServlet" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除分類">
			     <input type="hidden" name="bpcl_no"value="${bpclassVO.bpcl_no}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>