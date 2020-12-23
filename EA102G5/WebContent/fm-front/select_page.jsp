<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%
 MemVO memVO = (MemVO) session.getAttribute("memVO");
%>


<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
<title>bp:Home</title>


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
   <tr><td><h3>bp: Home</h3><h4><a href='<%=request.getContextPath()%>/Front-end/login.jsp'>( 登入 )</a></h4></td></tr>
</table>

<p>這是論壇</p>

<h3>文章查詢</h3>

您好:${memVO.mem_name}<br>
你的編號:${memVO.mem_no}
	
	
<%-- 錯誤表列 --%>
<c:if test="${not empty ErrorMes}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${ErrorMes}">
			<li style="color:orange">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<ul>
  <li><a href='<%=request.getContextPath()%>/bpclass-back/listbackbp.jsp'>List</a> all fms.  <br><br></li>
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/fm-front/FmarticleServlet" >
        <b>輸入文章主題:</b>
        <input type="text" name="fm_head" >
        <input type="hidden" name="action" value="get_head">
        <input type="submit" value="送出">
    </FORM>
  </li>
   <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/fm-front/FmarticleServlet" >
        <b>輸入文章編號 (如1001):</b>
        <input type="text" name="fm_no" value="1001">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>
<%--   <jsp:useBean id="bpSvc" scope="page" class="com.bp.model.BpService" /> --%>
<!--   <li> -->
<%--      <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/fm-front/BpServlet" > --%>
<!--        <b>選擇商品編號:</b> -->
<!--        <select size="1" name="bp_no"> -->
<%--          <c:forEach var="bpVO" items="${bpSvc.back}" >  --%>
<%--           <option value="${bpVO.bp_no}">${bpVO.bp_no} --%>
<%--          </c:forEach>    --%>
<!--        </select> -->
<!--        <input type="hidden" name="action" value="getOne_For_Display"> -->
<!--        <input type="submit" value="送出"> -->
<!--     </FORM> -->
<!--   </li> -->
  
<!--   <li> -->
<%--      <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/fm-front/BpServlet" > --%>
<!--        <b>選擇商品標題:</b> -->
<!--        <select size="1" name="bp_no"> -->
<%--          <c:forEach var="bpVO" items="${bpSvc.back}" >  --%>
<%--           <option value="${bpVO.bp_no}">${bpVO.bp_head} --%>
<%--          </c:forEach>    --%>
<!--        </select> -->
<!--        <input type="hidden" name="action" value="getOne_For_Display"> -->
<!--        <input type="submit" value="送出"> -->
<!--      </FORM> -->
<!--   </li> -->
<!-- </ul> -->
<h3>其他功能</h3>
<ul>

  <li><a href='<%=request.getContextPath()%>/fm-front/TRY2.jsp'>Add</a> a new bp.</li>

  <li><a href='<%=request.getContextPath()%>/bpclass-back/listbackbp.jsp'>Add</a>檢舉總攬</li>

  <li><a href='<%=request.getContextPath()%>/fm-front/mybp.jsp'>Add</a>查M0001會員全部</li>
  
</ul>
</body>
</html>