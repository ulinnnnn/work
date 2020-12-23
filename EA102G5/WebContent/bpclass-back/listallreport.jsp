<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bpreport.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    BprpService bprpSvc = new BprpService();
    List<BprpVO> list = bprpSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<jsp:useBean id="bpclassSvc" scope="page" class="com.bpclass.model.BpclassService" />
<html>
<head>
<title>�ڪ��ӫ~ - listAllbp.jsp</title>

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
		 <p>�ӫ~�� - listallbp.jsp</p>
		 <p><a href="<%=request.getContextPath()%>/bp-front/select_page.jsp">�^����</a></p>
	</td><td>
</table>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>���|�s��</th>
		<th>���|�ӫ~</th>
		<th>���|�H</th>
		<th>���|���O</th>
		<th>�ӫ~���A</th>
		<th>���|����</th>
		<th>�a�I���|�ɶ�</th>
		<th>���|���A</th>
		<th>�B�z���A</th>

	</tr>
	<jsp:useBean id="bpSvc" scope="page" class="com.bp.model.BpService"/> 
	
	<c:forEach var="bprpVO" items="${list2}">

		<tr>
		<td>${bprpVO.bprp_no}</td>
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/bp-front/BpServlet" >	
		<td>
		<input type="hidden" name="bp_no" value="${bprpVO.bp_no}">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="${bprpVO.bp_no}">
		</td>
		</FORM>
		
		
			<td>${bprpVO.mem_no}</td>
			<td>${bprpVO.bprp_project}</td>
			
			<td>${bpSvc.getOnebp(bprpVO.getBp_no()).bpst_no}
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/bpclass-back/BprpServlet" style="margin-bottom: 0px;">
			     <input type="submit" value="�W�[">
			     <input type="hidden" name="bp_no"  value="${bprpVO.bp_no}">
			     <input type="hidden" name="action"	value="upload"></FORM>
			     
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/bpclass-back/BprpServlet" style="margin-bottom: 0px;">
			     <input type="submit" value="�U�[">
			     <input type="hidden" name="bp_no"  value="${bprpVO.bp_no}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>	
			
			<td>${bprpVO.bprp_text}</td>
			<td><fmt:formatDate value="${bprpVO.bprp_time}" pattern="yyyy-MM-dd EEE"/></td>
			<td>${bprpVO.bprp_status}</td> 	
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/bp-front/BpServlet" style="margin-bottom: 0px;">
			
		 		 <select size="1" name="bprp_status">
			 		 <option value="���|�q�L�w�U�[" >���|�q�L�w�U�[
			 		 <option value="���|���q�L" >���|���q�L

				  <input type="hidden" name="bprp_no" value="${bprpVO.bprp_no}">
				  <input type="hidden" name="action"value="updatereport">
			      <input type="submit" value="�ק�">
			  </FORM>
			</td>
		</tr>
	</c:forEach>
</table>

</body>
</html>





