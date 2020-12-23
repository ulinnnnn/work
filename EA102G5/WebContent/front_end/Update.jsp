<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cproduct.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>商品資料新增 - addProduct.jsp</title>
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
		 <h3>商品資料新增 - addProduct.jsp</h3></td><td style="text-align: center">
		 <h4><a href="select.jsp"><img src="makeimage.jsp?pic1=${Cproduct.cp_No}&No=1" width="100" height="100" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料新增:</h3>

<%-- 錯誤表列 --%> 
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
    <% Object Cproduct=(CproductVO)request.getAttribute("Cproduct"); %>  
<FORM METHOD="post" ACTION="Cproduct.do" name="form1" enctype ="multipart/form-data" >
<table>
	<tr>
		<td>商品名稱:</td>
		<td><input type="TEXT" name="cpname" size="45" 
			 value="${Cproduct.cpname}" /></td><td>${errorMsgs.cpname}</td>
	</tr>
	<tr>
		<td>商品編號:</td>
		<td>${Cproduct.cp_No}</td><td>${errorMsgs.job}</td>
	</tr>
	
	<tr>
		<td>商品描述:</td>
		<td><input type="TEXT" name="cptext" size="45"
			 value="${Cproduct.cptext}"/></td><td>${errorMsgs.sal}</td>
	</tr>
	<tr>
		<td>所屬會員編號:</td>
		<td><input type="TEXT" name="mem_No" size="45"
			 value="${Cproduct.mem_No}"/></td><td>${errorMsgs.comm}</td>
	</tr>
	
	<tr>
		<td>審查員工編號:</td>
		<td><input type="TEXT" name="emp_NO" size="45"
			 value="${Cproduct.emp_NO}"/></td><td>${errorMsgs.emp_NO}</td>
	</tr>
	
	<tr>
		<td>商品狀態:</td>
		<td><input type="TEXT" name="cpState" size="45"
			 value="${Cproduct.cpState}"/></td><td>${errorMsgs.cpState}</td>
	</tr>
	<tr>
		<td>面交地點:</td>
		<td><input type="TEXT" name="cpmeetup" size="45" placeholder="不面交"
			 value="${Cproduct.cpmeetup}"/></td><td>${errorMsgs.cpState}</td>
	</tr>
	
<jsp:useBean id="CpclassSvc" scope="page" class="com.cpclass.model.CpclassService" />
	<tr>
		<td>商品類別:<font color=red><b>*</b></font></td>
		<td><select size="1" name="cpClass">
			<c:forEach var="CpclassVO" items="${CpclassSvc.all}">
				<option value="${CpclassVO.cpClass_No}" ${(param.cpClass_No == CpclassVO.cpClass_No)? 'selected':'' } >${CpclassVO.cpClass}
			</c:forEach>
		</select></td>
	</tr>
	
    <tr>
		<td>商品圖片:</td>
		<td><img src="makeimage.jsp?pic1=${Cproduct.cp_No}&No=1" id="showimg" width="100" height="64" border="0"></td>
	</tr>
	

</table>
<br>
<input type="hidden" name="cp_No" value="${Cproduct.cp_No}">
<input type="file" onchange="showImg(this)"accept="image/gif, image/jpeg, image/png" name="pic1">上傳照片

<br>
<input type="file" onchange="showImg(this)"accept="image/gif, image/jpeg, image/png"name="pic2">上傳照片

<br>
<input type="file" onchange="showImg(this)"accept="image/gif, image/jpeg, image/png"name="pic3">上傳照片
<input type="hidden" name="action" value="update">
<input type="submit" value="送出新增"></FORM>
</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

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
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=hiredate%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        
        
   
        // ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

        //      1.以下為某一天之前的日期無法選擇
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

        
        //      2.以下為某一天之後的日期無法選擇
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


        //      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
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