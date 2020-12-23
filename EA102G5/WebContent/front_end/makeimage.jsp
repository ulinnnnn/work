<%@ page contentType="image/jpeg" pageEncoding="gbk"%>
<%@ page import="com.other.MakeImage" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
<%
try{
    String No=request.getParameter("No");
    
    String id =request.getParameter("pic1"); //CP_NO
     new MakeImage(id,response.getOutputStream(),No);
  }catch(Exception e){
    System.out.println("嶒悷");
    new MakeImage("8081",response.getOutputStream(),"1");
  }
  out.clear();
  out = pageContext.pushBody();
%>
</body>
</html>