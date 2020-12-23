<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<%
	String textContent = (String) request.getAttribute("textContent");
%>

<!doctype html>
<html lang="en">
<head>
<title>HTTP Status 404 ¡V Not Found</title>
<style type="text/css">
body {
	font-family: Tahoma, Arial, sans-serif;
}

h1, h2, h3, b {
	color: white;
	background-color: #525D76;
}

h1 {
	font-size: 22px;
}

h2 {
	font-size: 16px;
}

h3 {
	font-size: 14px;
}

p {
	font-size: 12px;
}

a {
	color: black;
}

.line {
	height: 1px;
	background-color: #525D76;
	border: none;
}


</style>
</head>
<body>
	<h1>HTTP Status 404 ¡V Not Found</h1>
	<hr class="line" />
	<p>
		<b>Type</b> Status Report
	</p>
	<p>
		<b>Message</b> /EA102G5/emp/empAdd.jsp
		
	</p>
	<p>
		<b>Description</b> Warning. Error happened for nothing. Please beg to the server for processing.  
<!-- 		.The origin server did not find a current -->
<!-- 		representation for the target resource or is not willing to disclose -->
<!-- 		that one exists. -->
	</p>
	<hr class="line" />
	<h3>Apache Tomcat/9.0.35</h3>
	
	<a href="<%=request.getContextPath()%>/backEndG5/notFound2.jsp">.</a>
	
	
</body>
</html>