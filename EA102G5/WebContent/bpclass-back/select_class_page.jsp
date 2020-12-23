<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
<title>bpclass:Home</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>bpclass: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the bpclass Home</p>

<h3>訂單查詢:</h3>
	
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:orange">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='<%=request.getContextPath()%>/bpclass-back/listallbpclass.jsp'>List</a> all bps.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/bpclass-back/BpclassServlet" >
        <b>輸入類別編號 (如10):</b>
        <input type="text" name="bpcl_no">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>

  <jsp:useBean id="bpclassService" scope="page" class="com.bpclass.model.BpclassService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/bpclass-back/BpclassServlet" >
       <b>選擇類別編號:</b>
       <select size="1" name="bpcl_no">
         <c:forEach var="bpclassVO" items="${bpclassService.all}" > 
          <option value="${bpclassVO.bpcl_no}">${bpclassVO.bpcl_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/bpclass-back/BpclassServlet" >
       <b>選擇類別名稱:</b>
       <select size="1" name="bpcl_no">
         <c:forEach var="bpclassVO" items="${bpclassService.all}" > 
          <option value="${bpclassVO.bpcl_no}">${bpclassVO.bpcl_name}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
     </FORM>
  </li>
</ul>

<h3>員工管理</h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/bpclass-back/addbpclass.jsp'>Add</a> a new Emp.</li>
</ul>

</body>
</html>