<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ecpay.jsp</title>
</head>
<body>

<!-- 用來跳轉的前端地方  -->
<%
	String form = (String) request.getAttribute("form");
%>

<%=form%>

</body>
</html>