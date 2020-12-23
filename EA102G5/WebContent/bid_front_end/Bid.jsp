<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>

<%
MemVO memVO = (MemVO) session.getAttribute("memVO");
%>

${memVO.mem_no}
${memVO.mem_name}

<html>
<head>
<title>�j�M����</title>

<style>
 	ul{
 	list-style:none;
}
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
<body bgcolor='#D4FFFF' align='center'>



<p>This is the Home page for IBM Bid: Home</p>

<h3>��Ƭd��:</h3>
<h4><%=(memVO == null) ? "�٨S�n�J" : memVO.getMem_no()%></h4>
	
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='<%=request.getContextPath()%>/bid_front_end/listAllEmp.jsp'>List</a> all Bid.  <br><br></li>
  <li><a href="<%=request.getContextPath()%>/Front-mem/login.jsp">�n�J</a> log in   <br><br></li>
  <li><a href="<%=request.getContextPath()%>/bid_front_end/BidHome.jsp">�ӫ~����</a> log in   <br><br></li>
  <li><a href="<%=request.getContextPath()%>/bid_front_end/backBid.jsp">�ӤH�ӫ~����</a> log in   <br><br></li>
    <li><a href="<%=request.getContextPath()%>/bid_front_end/viewbidrecord.jsp">�ӤH�o��</a> log in   <br><br></li>
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/bid_front_end/bid_commodity.do" >
        <b>��J�ӫ~�s�� (�p:B0001):</b>
        <input type="text" name="bp_no">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>
  <jsp:useBean id="bid_commoditySvc" scope="page" class="com.Bid_commodity.model.Bid_commodityService" />
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/bid_front_end/bid_commodity.do" >
       <b>��ܰӫ~�W��:</b>
       <select size="1" name="bp_no">
         <c:forEach var="bid_commodityVO" items="${bid_commoditySvc.all}" > 
          <option value="${bid_commodityVO.bp_no}">${bid_commodityVO.b_name}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  <jsp:useBean id="bid_commodity_noSvc" scope="page" class="com.Bid_commodity_no.model.Bid_commodity_noService" />
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/bid_front_end/bid_commodity.do" >
       <b>��ܰӫ~���O:</b>
       <select size="1" name="bc_no">
         <c:forEach var="bid_commodity_noVO" items="${bid_commodity_noSvc.all}" > 
          <option value="${bid_commodity_noVO.bc_no}">${bid_commodity_noVO.bc_commodity}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOnebc_For_Display">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
</ul>


<h3>�s�W�ӫ~</h3>
<ul>
  <li><a href='<%=request.getContextPath()%>/bid_front_end/addBid_1.jsp'>Add</a> a new Emp.</li>
</ul>


</body>
</html>