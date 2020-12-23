<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shop_product.model.*"%>



<!DOCTYPE html>
<html>
<head>

    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>pchomeProd.jsp</title>
</head>

<%
	ProdService prodSvc = new ProdService();
	List<ProdVO> list = prodSvc.getAll();
%>	

<%
	for(int i = 0; i < list.size(); i++){
		ProdVO prodVO = list.get(i);
%>

<h1>hello<%=prodVO.getProdNo()%>world</h1>

<%}%>

</body>

</html>
