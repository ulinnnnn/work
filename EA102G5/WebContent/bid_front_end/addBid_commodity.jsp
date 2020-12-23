<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.Bid_commodity.model.*"%>

<%
	Bid_commodityVO bid_commodityVO = (Bid_commodityVO) request.getAttribute("bid_commodityVO");
%>

<html>
<head align='center'>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<meta charset="utf-8">
<title>�v�и�Ʒs�W</title>
<table id="table-1" align='center'>
	<tr>
		<td>
			<h3>�v�аӫ~�W�[</h3>
		</td>
		<td>
			<h4>
				<a href="<%=request.getContextPath()%>/bid_front_end/Bid.jsp"><img src="jpg/dog.jpeg" width="100" height="100" border="0">�^����</a>
			</h4>
		</td>
	</tr>
</table>


<title>�Ϥ��W�ǹw��</title>
<style type="text/css">
.row {
	padding: 4px
}

.row label {
	font-weight: 500;
}

.row textarea {
	width: 97%;
	height: 500px;
	color: blue;
}

.row span {
	color: blue;
}

.hidden {
	display: none;
}

table#table-1 {
	background-color: lightblue;
	border: 0px solid black;
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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	align: 'center';
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>

</head>
<body bgcolor='lightblue' align='center'>



	<h3>��Ʒs�W:</h3>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="bid_commodity.do" name="form1" enctype="multipart/form-data">

		<table align='center'>
			<tr>
				<td>�v�аӫ~�W��:</td>
				<td><input type="TEXT" name="b_name" size="45" value="<%=(bid_commodityVO == null) ? "����" : bid_commodityVO.getB_name()%>" /></td>
			</tr>
			<tr>
				<td>�v�ж}�l�ɶ�:</td>
				<td><input name="b_startime" id="f_date1" type="text"></td>
			</tr>
			<tr>
				<td>�v�е����ɶ�:</td>
				<td><input name="b_endtime" id="f_date2" type="text"></td>
			</tr>
			<tr>
				<td>�v�а_�l���B:</td>
				<td><input type="text" name="bs_price" size="45"
					value="<%=(bid_commodityVO == null) ? "8888" : bid_commodityVO.getBs_price()%>" /></td>
			</tr>
			<tr>
				<td>�v�ШC���[�����B:</td>
				<td><input type="text" name="bplus_price" size="45"
					value="<%=(bid_commodityVO == null) ? "1235" : bid_commodityVO.getBplus_price()%>" /></td>
			</tr>
			<jsp:useBean id="bid_commodity_noSvc" scope="page" class="com.Bid_commodity_no.model.Bid_commodity_noService" />
			<tr>
				<td>�v�аӫ~����:</td>
				<td><textarea name="b_intro" rows="3" cols="30"
						value="<%=(bid_commodityVO == null) ? "�Ӥ��Ф@�U�A���ӫ~�a" : bid_commodityVO.getB_intro() %>" placeholder="�Ӥ��Ф@�U�A���ӫ~�a" > </textarea></td>
			</tr>
			<tr>
				<td>�v�аӫ~���O:</td>
				<td><select size="1" name="bc_no">
						<c:forEach var="bid_commodity_noVO" items="${bid_commodity_noSvc.all}">
							<option value="${bid_commodity_noVO.bc_no}" ${(bid_commodityVO.bc_no==bid_commodity_noVO.bc_no)? 'selected':'' }>${bid_commodity_noVO.bc_commodity}
						</c:forEach>
				</select></td>
			</tr>
			<jsp:useBean id="bid_commoditySvc" scope="page" class="com.Bid_commodity.model.Bid_commodityService" />
			<div class="container">
				<div class="row">
					<label>�ФW�ǹϤ��ɮ�: </label>
					<!-- �o�̤@�w�n���@��<input type="file">�������A��W���I -->
					<input type="file" id="myFile" name="myFile">
				</div>
				<div class="row">
					<label>�ɮצW�١G</label> <input type="text" name="filename" id="filename">
				</div>
				<div class="row">
					<label>�ɮ׹w��: </label>
					<div>
						<img src="" id="preview" height=200px width=200px>
					</div>
				</div>
				<div class="row">
					<label>�ФW�ǹϤ��ɮ�: </label> <input type="file" id="myFile2" name="myFile2">
				</div>
				<div class="row">
					<label>�ɮצW�١G</label> <input type="text" name="filename2" id="filename2">
				</div>
				<div class="row">
					<label>�ɮ׹w��: </label>
					<div>
						<img src="" id="preview2" height=200px width=200px>
					</div>
				</div>
			</div>


		</table>
		<br> <input type="hidden" name="action" value="Bidinsert"> <input type="submit" value="�e�X�s�W">
	</FORM>
</body>



<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->

<%
	java.sql.Timestamp b_startime = null;
	java.sql.Timestamp b_endtime = null;
	try {
		b_startime = bid_commodityVO.getB_startime();
	} catch (Exception e) {
		b_startime = new java.sql.Timestamp(System.currentTimeMillis());
	}
	try {
		b_endtime = bid_commodityVO.getB_endtime();
	} catch (Exception e) {
		b_endtime = new java.sql.Timestamp(System.currentTimeMillis());
	}
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: 'dark',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
		   value: '<%=b_startime%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
           //startDate:	            '2017/07/10',  // �_�l��
           //minDate:               '-1970-01-01', // �h������(���t)���e
           //maxDate:               '+1970-01-01'  // �h������(���t)����
        });
        $.datetimepicker.setLocale('zh');
        $('#f_date2').datetimepicker({
	       theme: 'dark',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
		   value: '<%=b_endtime%>', // value:   new Date(),
	//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
	//startDate:	            '2017/07/10',  // �_�l��
	//minDate:               '-1970-01-01', // �h������(���t)���e
	//maxDate:               '+1970-01-01'  // �h������(���t)����
	});

	// ----------------------------------------------------------�H�U�ΨӱƩw�L�k��ܪ����-----------------------------------------------------------

	//      1.�H�U���Y�@�Ѥ��e������L�k���
	//               var somedate1 = new Date('#f_date1');
	//               $('#f_date1').datetimepicker({
	//                   beforeShowDay: function(date) {
	//                 	  if (  date.getYear() <  somedate1.getYear() || 
	//         		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	//         		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	//                       ) {
	//                            return [false, ""]
	//                       }
	//                       return [true, ""];
	//               }});

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
	$('#preview').hide();
	$('#preview2').hide();
	$(document).ready(function() {
		$("#myFile").change(function() {
			readURL(this);
		});
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#preview').attr('src', e.target.result).fadeIn('slow');
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	});
	$(document).ready(function() {
		$("#myFile2").change(function() {
			readURL(this);
		});
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {

					$('#preview2').attr('src', e.target.result).fadeIn('slow');
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	});
</script>
</html>