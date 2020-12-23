<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cproduct.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.0.1">
<title>�ӫ~��Ʒs�W - addProduct.jsp</title>
<script>

function showImg(thisimg) {
	var file = thisimg.files[0];
	if(window.FileReader) {
		var fr = new FileReader();
		
		var showimg = document.getElementById('showimg');
		fr.onloadend = function(e) {
		showimg.src = e.target.result;
	};
	fr.readAsDataURL(file);
	showimg.style.display = 'block';
	}
}

</script>
<style>
  table#table-1 {
    width: 450px;
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
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>�洫�ӫ~��Ʒs�W - addProduct.jsp</h3></td><td style="text-align: center">
		 <h4><a href="select.jsp"><img src="makeimage.jsp?pic1=7018&No=1"width="100" height="100" border="0">�^����</a></h4>
	</td></tr>
</table>

<h3>��Ʒs�W:</h3>
   
      
   
<%-- ���~��C --%> 
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<% Object memVO=session.getAttribute("memVO"); %> 
<FORM METHOD="post" ACTION="Cproduct.do" name="form1" enctype ="multipart/form-data" >
<table>
	<tr>
		<td>�ӫ~�W��:</td>
		<td><input type="TEXT" name="cpname" size="45" 
			 value="${param.cpname}" /></td><td>${errorMsgs.cpname}</td>
	</tr>
	<tr>
		<td>�ӫ~�s��:</td>
		<td><input type="TEXT" name="cp_No" size="45"
			 value="${param.cp_No}"/></td><td>${errorMsgs.job}</td>
	</tr>
	
	<tr>
		<td>�ӫ~�y�z:</td>
		<td><input type="TEXT" name="cptext" size="45"
			 value="${param.cptext}"/></td><td>${errorMsgs.sal}</td>
	</tr>
	<tr>
		<td>���ݷ|���s��:</td>
		<td><input type="TEXT" name="mem_No" size="45"
			 value="${memVO.mem_no}"/></td><td>${errorMsgs.comm}</td>
	</tr>
	
	<tr>
		<td>���洫�ӫ~</td>
		<td><input type="TEXT" name="emp_NO" size="45"
			 value="${param.emp_NO}"/></td><td>${errorMsgs.emp_NO}</td>
	</tr>
	
	<tr>
		<td>�ӫ~���A:</td>
		<td><input type="TEXT" name="cpState" size="45"
			 value="${param.cpState}"/></td><td>${errorMsgs.cpState}</td>
	</tr>
	
	<tr>
		<td>����a�I:</td>
		<td><input type="TEXT" name="cpmeetup" size="45" placeholder="������"
			 value="${param.cpmeetup}"/></td><td>${errorMsgs.cpmeetup}</td>
	</tr>
	
<jsp:useBean id="CpclassSvc" scope="page" class="com.cpclass.model.CpclassService" />
	<tr>
		<td>�ӫ~���O:<font color=red><b>*</b></font></td>
		<td><select size="1" name="cpClass">
			<c:forEach var="CpclassVO" items="${CpclassSvc.all}">
				<option value="${CpclassVO.cpClass_No}" ${(param.cpClass_No eq CpclassVO.cpClass_No)? 'selected':'' } >${CpclassVO.cpClass}
			</c:forEach>
		</select></td>
	</tr>
	<tr><td>
	<img id="showimg" src="" style="display:none;" />
    </td>
    </tr>

</table>
<br>
<input type="file"  onchange="showImg(this)"accept="image/gif, image/jpeg, image/png"name="pic1">�W�ǷӤ�

<br>
<input type="file"  onchange="showImg(this)"accept="image/gif, image/jpeg, image/png" name="pic2">�W�ǷӤ�

<br>
<input type="file" onchange="showImg(this)" accept="image/gif, image/jpeg, image/png" name="pic3">�W�ǷӤ�
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>
</body>



<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->

<% 
  java.sql.Date hiredate = null;
  try {
	    hiredate = java.sql.Date.valueOf(request.getParameter("hiredate").trim());
   } catch (Exception e) {
	    hiredate = new java.sql.Date(System.currentTimeMillis());
   }
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
 	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=hiredate%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
           //startDate:	            '2017/07/10',  // �_�l��
           //minDate:               '-1970-01-01', // �h������(���t)���e
           //maxDate:               '+1970-01-01'  // �h������(���t)����
        });
        
        
   
        // ----------------------------------------------------------�H�U�ΨӱƩw�L�k��ܪ����-----------------------------------------------------------

        //      1.�H�U���Y�@�Ѥ��e������L�k���
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.�H�U���Y�@�Ѥ��᪺����L�k���
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.�H�U����Ӥ�����~������L�k��� (�]�i���ݭn������L���)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>
</html>