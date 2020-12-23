<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.Bid_commodity.model.*"%>

<%
Bid_commodityVO bid_commodityVO = (Bid_commodityVO) request.getAttribute("bid_commodityVO");
session.setAttribute("bid_commodityVO",bid_commodityVO);
%>
<jsp:useBean id="bid_commodity_noSvc" scope="page" class="com.Bid_commodity_no.model.Bid_commodity_noService" />
<!DOCTYPE html>
<html lang="en">
<head>
<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}
.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
</style>
<!-- SITE TITTLE -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Profile - BIGBAG Store</title>

<!-- PLUGINS CSS STYLE -->
<link href="<%=request.getContextPath()%>/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/plugins/selectbox/select_option1.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/plugins/fancybox/jquery.fancybox.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/plugins/rateyo/jquery.rateyo.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/plugins/iziToast/css/iziToast.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/plugins/prismjs/prism.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/plugins/revolution/css/settings.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/plugins/animate/animate.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/plugins/slick/slick.css" media="screen">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/plugins/slick/slick-theme.css" media="screen">


<!-- CUSTOM CSS -->
<link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/default.css" id="option_style">

<!-- Icons -->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/img/favicon.png">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="body" class="body-wrapper version1 up-scroll" style="text-align:center;">




<div class="main-wrapper" style="overflow:vidible;">
	<div class="header clearfix">
	<jsp:include page="/assets/topBar.jsp" flush="true"/>
	</div>
	</div>
<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
		<!-- MAIN CONTENT SECTION -->

				<div class="row">
					<div class="col-12">
						<div class="btn-group" role="group" aria-label="...">
							<a href="account-dashboard.html" class="btn btn-default"><i class="fa fa-th" aria-hidden="true"></i>Account
								Dashboard</a> <a href="account-profile.html" class="btn btn-default active"><i class="fa fa-user"
								aria-hidden="true"></i>Profile</a> <a href="account-address.html" class="btn btn-default"><i
								class="fa fa-map-marker" aria-hidden="true"></i>My Address</a> <a href="account-all-orders.html"
								class="btn btn-default"><i class="fa fa-list" aria-hidden="true"></i>All Orders</a> <a
								href="account-wishlist.html" class="btn btn-default"><i class="fa fa-gift" aria-hidden="true"></i>Wishlist</a>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
					<form METHOD="post" ACTION="bid_commodity.do" name="form1" enctype="multipart/form-data" style="margin-top: 30px;">
								<div class="form-group row"style="margin-left: 270px;">
									<label for="" class="col-md-3 control-label">競標商品名稱:</label>
									<div class="col-md-7">
										<input type="TEXT" class="form-control" name="b_name" size="45"
											value="<%=bid_commodityVO.getB_name()%>" style="width:800px" />
									</div>
								</div>
								<div class="form-group row" style="margin-left: 270px;">
									<label for="" class="col-md-3 control-label">競標開始時間:</label>
									<div class="col-md-7">
										<input type="text" class="form-control" name="b_startime" id="f_date1" value="<%=bid_commodityVO.getB_startime()%>"style="width:800px">
									</div>
								</div>
								<div class="form-group row" style="margin-left: 270px;">
									<label for="" class="col-md-3 control-label">競標結束時間:</label>
									<div class="col-md-9">
										<input type="text" class="form-control" name="b_endtime" id="f_date2" value="<%=bid_commodityVO.getB_endtime()%>"style="width:800px">
									</div>
								</div>
								<div class="form-group row" style="margin-left: 270px;">
									<label for="" class="col-md-3 control-label">競標起始金額:</label>
									<div class="col-md-9">
										<input type="text" name="bs_price" class="form-control"
											value="<%=bid_commodityVO.getBs_price()%>"
											style="width:800px">
									</div>
								</div>
								<div class="form-group row" style="margin-left: 270px;">
									<label for="" class="col-md-3 control-label">競標每次加價金額:</label>
									<div class="col-md-9">
										<input type="text" name="bplus_price" class="form-control"
											value="<%= bid_commodityVO.getBplus_price()%>" style="width:800px">
									</div>
								</div>
								<div class="form-group row" style="margin-left: 270px;">
									<label class="col-md-3 control-label">競標商品介紹:</label>
									<div class="col-md-9">
										<textarea name="b_intro" rows="3" cols="30" class="form-control" style="width:800px"> <%=bid_commodityVO.getB_intro()%></textarea>
									</div>
								</div>
								<div class="form-group row" style="margin-left: 270px;">
									<label for="" class="col-md-3 control-label">競標商品類別:</label>
									<div>
										<select size="1" name="bc_no" style="margin-left: 16px;">
											<c:forEach var="bid_commodity_noVO" items="${bid_commodity_noSvc.all}">
												<option value="${bid_commodity_noVO.bc_no}"
													${(bid_commodityVO.bc_no==bid_commodity_noVO.bc_no)? 'selected':'' }>${bid_commodity_noVO.bc_commodity}
											</c:forEach>
										</select>
									</div>
								</div>
								<jsp:useBean id="bid_commoditySvc" scope="page" class="com.Bid_commodity.model.Bid_commodityService" />

				<div class="container">
				<div>
					<label>請上傳圖片檔案: </label>
					<!-- 這裡一定要有一個<input type="file">的元素，當上傳點 -->
					<input type="file" id="myFile" name="myFile">
				
					<label>檔案名稱：</label> <input type="text" name="filename" id="filename">
			
					<label>檔案預覽: </label>
						<img src="" id="preview" height="100px" width="100px" style="margin-bottom:10px;">
						</div>
						<div>
					<label>請上傳圖片檔案: </label> <input type="file" id="myFile2" name="myFile2">
					<label>檔案名稱：</label> <input type="text" name="filename2" id="filename2">
					<label>檔案預覽: </label>
						<img src="" id="preview2" height="100px" width="100px">
						</div>
			</div>		
								<br><div class="form-group row">
									<div class=" col-md-12 ">
										<button type="submit" class="btn btn-primary float-center">送出修改</button>
									</div>
								</div>
								<input type="hidden" name="bp_no"value="<%=bid_commodityVO.getBp_no()%>"> 
								<input type="hidden" name="action" value="update">						
						</form>
						</div>					
					</div>
	
	<jsp:include page="/assets/footer.jsp" flush="true"/>
	<script src="<%=request.getContextPath()%>/assets/plugins/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/plugins/jquery/jquery-migrate-3.0.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/plugins/jquery-ui/jquery-ui.js"></script>
	<script src="<%=request.getContextPath()%>/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/plugins/slick/slick.js"></script>
	<script src="<%=request.getContextPath()%>/assets/plugins/fancybox/jquery.fancybox.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/plugins/iziToast/js/iziToast.js"></script>
	<script src="<%=request.getContextPath()%>/assets/plugins/prismjs/prism.js"></script>
	<script src="<%=request.getContextPath()%>/assets/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/plugins/countdown/jquery.syotimer.js"></script>
	<script src="<%=request.getContextPath()%>/assets/plugins/velocity/velocity.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/plugins/rateyo/jquery.rateyo.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/custom.js"></script>
		<jsp:include page="/assets/loginModal.jsp" flush="true"/>
	<jsp:include page="/assets/memChat3.jsp" flush="true"/>

</body>
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


<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: 'dark',              //theme: 'dark',
	       timepicker:true,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
		   value: '<%=b_startime%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
	<%--            maxDate:'+<%=b_endtime%>'  // 去除今日(不含)之後 --%>
        });
        $.datetimepicker.setLocale('zh');
        $('#f_date2').datetimepicker({
	       theme:'dark',              //theme: 'dark',
	       timepicker:true,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d H:i:s',         //format:'Y-m-d H:i:s',
		   value: '<%=b_endtime%>', // value:   new Date(),
	//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
<%-- 	startDate:	            '<%=b_endtime%>',  // 起始日 --%>
<%-- 	minDate:               '-<%=b_startime%>', // 去除今日(不含)之前 --%>
	//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	});

	// ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

	//      1.以下為某一天之前的日期無法選擇
	              var somedate1 = new Date('<%=b_startime%>');
	              $('#f_date1').datetimepicker({
	                  beforeShowDay: function(date) {
	                	  if (  date.getYear() <  somedate1.getYear() || 
	        		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	        		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	                      ) {
	                           return [false, ""]
	                      }
	                      return [true, ""];
	              }});
	              $('#f_date2').datetimepicker({
	                  beforeShowDay: function(date) {
	                	  if (  date.getYear() <  somedate1.getYear() || 
	        		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	        		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	                      ) {
	                           return [false, ""]
	                      }
	                      return [true, ""];
	              }});

	//      2.以下為某一天之後的日期無法選擇
<%-- 	     var somedate2 = new Date('<%=b_endtime%>'); --%>
// 	     $('#f_date1').datetimepicker({
// 	         beforeShowDay: function(date) {
// 	       	  if (  date.getYear() >  somedate2.getYear() || 
// 			           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
// 			           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
// 	             ) {
// 	                  return [false, ""]
// 	             }
// 	             return [true, ""];
// 	     }});

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
$.datetimepicker.setLocale('zh'); // kr ko ja en
$(function(){
	 $('#f_date1').datetimepicker({
	  format:'Y-m-d H:i:s',
	  onShow:function(){
	   this.setOptions({
	    maxDate:$('#f_date2').val()?$('#f_date2').val():false
	   })
	  },
	  timepicker:true
	 });
	 
	 $('#f_date2').datetimepicker({
	  format:'Y-m-d H:i:s',
	  onShow:function(){
	   this.setOptions({
	    minDate:$('#f_date1').val()?$('#f_date1').val():false
	   })
	  },
	  timepicker:true
	 });
});
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
