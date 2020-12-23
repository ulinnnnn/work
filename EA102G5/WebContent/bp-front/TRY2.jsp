<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@page import="com.bp.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bp.model.*"%>
<%@ page import="com.mem.model.*"%>

<%
  BpVO bpVO = (BpVO) request.getAttribute("bpVO");
  String bp_new = (bpVO == null)?"1":bpVO.getBp_new();
%>

<!DOCTYPE html>
<html lang="zh_TW">
  <head>
    <meta charset="Big5">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>上架商品</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <link href="<%=request.getContextPath()%>/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/plugins/selectbox/select_option1.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/plugins/fancybox/jquery.fancybox.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/plugins/rateyo/jquery.rateyo.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/plugins/iziToast/css/iziToast.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/plugins/prismjs/prism.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/plugins/revolution/css/settings.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets/plugins/animate/animate.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/plugins/slick/slick.css" media="screen">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/plugins/slick/slick-theme.css" media="screen">
    <link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/color-option2.css" id="option_style">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/img/favicon.png">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/joe_footer.css" >


<style>


.form-control {
	border:1px orange solid !important;
	padding: 6px 8px !important;
	font-size:16px !important; 
}
label{
	font-size:16px !important; 
}

textarea{
width:100%;
height:100px !important;
resize:none;
line-height: 25px !important;
}
input.rad{

width:55px !important;
}

section.mainContent.clearfix.signUp {
    padding-top: 50px;
    padding-bottom: 50px;
}
.panel-body{
	padding: 5px 15px !important;
	border: solid #c5c0ba !important;
    border-radius: 25px !important;
}
.panel-heading{
    border-radius: 15px !important;

}


.display {
            text-align: center;
        }
        #map {
            width: auto;
            height: 500px;
            margin: 10px auto;
        }
        #panel {
            font-size: 20px;
        }
        #keyword {
        	border:1px orange solid !important;

            width: 500px;
            font-size: 20px;
            color: #a32130;
            font-weight: 700;
            padding: 5px 15px;
        }
        .info_title {
            font-size: 20px;
            font-weight: 800;
        }
        .info_head {
            font-weight: 800;
        }
        .info_img {
            height: 200px;
            width: auto;
        }
        
        ::placeholder {
		  color:#ed8282  !important;
		
		  font-weight:bold;
		}
		label{
		font-size:20px !important;
		}
		input{
		font-size:18px !important;
		    font-weight: 500 !important;
		color:black !important;
		}
		textarea{
		font-size:18px !important;
		    font-weight: 500 !important;
		color:black !important;
		}
		select{
		font-size:18px !important;
		    font-weight: 500 !important;
		color:black !important;
		}
</style>

</head>
  <body id="body" class="body-wrapper version1 up-scroll" onload="connect();">
  
     <div class="main wrapper" style="overflow:visible;">
<div class="header clearfix">
<jsp:include page="/assets/topBar.jsp" flush="true"/>
</div>
</div>
	
      <section class="mainContent clearfix signUp " style="padding-top:15px">
		<div class="container">
			<div class="row">
				<div class="col-md-6 mb-sm-4 mb-md-0">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3>上架資訊</h3>
						</div>
					
						<div class="panel-body">
						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/bp-front/BpServlet" enctype="multipart/form-data">
								<div class="form-group">
									<label for="">商品標題</label>
									<input type="TEXT" name="bp_head" size="45"
									value="${param.bp_head}" id="head" class="form-control" placeholder="${(errorMsgs.bp_head == null)?'輸入標題':errorMsgs.bp_head}" style="border-radius: 15px !important">
								</div>
								<div class="form-group">
									<label for="">商品價格</label>
									<input type="TEXT" name="bp_pri" size="45"
									value=""class="form-control" id="pri" placeholder="${(errorMsgs.bp_pri == null)?'輸入價錢':errorMsgs.bp_pri}" style="border-radius: 15px !important">
								</div>
								<div class="form-group">
									<label for="">運送方式</label> 
									<input type="TEXT" name="bp_del" size="45"
									 value="${param.bp_del}" id="del" class="form-control" placeholder="${(errorMsgs.bp_del == null)?'輸入運送方式':errorMsgs.bp_del}" style="border-radius: 15px !important">
								</div>
								<div class="form-group">
									<label for="">到期日期</label> 
									<input name="hiredate" id="f_date1" type="text"class="form-control" id="" style="border-radius: 15px !important">
								</div>
								<div class="form-group">
									<label for="">文字</label> 
								<textarea class="form-control" id="text" name="bp_text" placeholder="${(errorMsgs.bp_text == null)?'輸入商品內文':errorMsgs.bp_text}" style="border-radius: 15px !important">${param.bp_text}</textarea>
								</div>
								
								<div class="form-group">
								<label for="">商品類別</label>
								<jsp:useBean id="bpclassService" scope="page" class="com.bpclass.model.BpclassService" />
									<select size="1" name="bpcl_no" id="class" class="form-control" style="border-radius: 15px !important">
										<c:forEach var="bpclassVO" items="${bpclassService.all}">	
											<option style="border-radius: 15px !important" value="${bpclassVO.bpcl_no}" ${(param.bpcl_no == bpclassVO.bpcl_no)?'selected':''}>${bpclassVO.bpcl_name}
										</c:forEach>
									</select>				
							</div>

							<div class="form-group">
								<label for="">商品狀態</label> 
								<div class="form-control" style="border-radius: 15px !important">
								<label><input class="rad" id="new" name="bp_new" type="radio"  value="全新" <%= ("全新".equals(bp_new))? "checked" : ""%>>全新</label>
								<label><input class="rad" name="bp_new" type="radio"  value="二手" <%= ("二手".equals(bp_new))? "checked" : ""%>>二手</label>
								<label><input class="rad" name="bp_new" type="radio"  value="其它" <%= ("其它".equals(bp_new))? "checked" : ""%>>其它</label>
								</div>
							</div>
							<div class="form-group" >
								<label for="">商品位置</label> 
								<input type="TEXT" name="bp_loc" size="45"
								 value="${param.bp_loc}"class="form-control" id="jj" placeholder="${(errorMsgs.bp_loc == null)?'輸入商品位置':errorMsgs.bp_loc}" style="border-radius: 15px !important">
							</div>
								 <div class="display">
						     	 <label for="" style="margin-bottom: 0.5rem ">輸入地址或地區關鍵字</label>
						    	  	 <input type="text" id="keyword" style="border-radius: 15px !important ; width:auto">
						        <div id="map"></div>
						    </div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3>圖片資訊</h3>
						</div>
						<div class="panel-body">
							<div>	
								<label>上傳圖1:</label>
								<div class="form-control" style="border-radius: 15px !important ; margin-bottom: 15px"><input type="file" id="bp_pic1" name="bp_pic1"
									class="myFile"></div>
							</div>
							<div>
								<label>上傳圖2:</label>
								<div class="form-control" style="border-radius: 15px !important;margin-bottom: 15px"><input type="file" id="bp_pic2" name="bp_pic2"
									class="myFile"></div>
							</div>
							<div>
								<label>預覽內容:</label>
								<div>
									<div id="preview">
										<img 
										src="<%=request.getContextPath()%>/img/3.png"
										id="gro_pic_preview1" style="max-width:100% ;    margin: 15px 0 "> 
										<img
										src="<%=request.getContextPath()%>/img/3.png"
										id="gro_pic_preview2" style="max-width:100% ;    margin: 15px 0 ">
									</div>
								</div>
							</div>
							<input type="hidden" name="mem_no" value="${memVO.mem_no}">
							<input id="lat" type="hidden" name="lat" value="${param.lat}">
							<input id="lng" type="hidden" name="lng" value="${param.lng}">
							<input type="hidden" name="action" value="insert">
							<button type="submit"  value="送出新增" class="btn btn-primary btn-block" style="font-size:20px ; border-radius: 15px !important">商 品 上 架</button>
						
							</form>
								<button id="magic"  value="送出新增" class="btn btn-primary btn-block"  style="padding:0 0 0 0;margin:8px 0 0 0 ;width:100px;font-size:20px ; border-radius: 15px !important">magic</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>						
<script>
        var map;
        var marker;
        function init() {
            var keyword = document.getElementById('keyword');
            var options = {
                componentRestrictions: { country: 'tw' } // 限制在台灣範圍
            };
            var autocomplete = new google.maps.places.Autocomplete(keyword, options);

            // 地址的輸入框，值有變動時執行
            autocomplete.addListener('place_changed', function() {
                var place = autocomplete.getPlace(); // 地點資料存進place
                console.log(place);
                // debugger;
                // 確認回來的資料有經緯度
                if (place.geometry) {
                    // 改變map的中心點
                    var searchCenter = place.geometry.location;
                    // panTo是平滑移動、setCenter是直接改變地圖中心
                    map.panTo(searchCenter);
                    // 在搜尋結果的地點上放置標記

                    if(marker != null){
                          marker.setMap(null)
                
                    }

                    marker = new google.maps.Marker({
                    position: searchCenter,
                    map: map
                    });
                    // info window
                    var infowindow = new google.maps.InfoWindow({
                        content: `<div class="info_title">` + place.name + `</div>
                            <div><span class="info_head">地址: </span>` + place.formatted_address + `</div>
                            <div><span class="info_head">經緯度: </span>(` + place.geometry.location.lat() + `, ` + place.geometry.location.lng() + `)</div>`
                    });
                    infowindow.open(map, marker);
                    console.log(place.geometry.location.lat());
                    console.log(place.geometry.location.lng());
                    $("input#jj").val(place.formatted_address);
                    $("input#lat").val(place.geometry.location.lat());
                    $("input#lng").val(place.geometry.location.lng());
                    
                }

            });
        }

        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
                center: { lat: 24.978391, lng: 121.268641 },
                zoom: 12,
            });
        }

        window.onload = init;
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBcTdgBEb7zc8YkmlQnZ3YF23sC7iawWJg&libraries=places&callback=initMap" async defer>
    </script>

<%@ include file="/assets/footer.jsp" %>
<%@ include file="/bp-front/chat.jsp" %>
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
<!-- 		<script src="assets/js/custom.js"></script> -->

    	<jsp:include page="/assets/loginModal.jsp" flush="true"/>
		<!-- 		MemChat -->
		<jsp:include page="/assets/memChat3.jsp" flush="true"/>
    
    
	</body>
	
<% 
  java.sql.Date hiredate = null;
  try {
	    hiredate = java.sql.Date.valueOf(request.getParameter("hiredate").trim());
   } catch (Exception e) {
	    hiredate = new java.sql.Date(System.currentTimeMillis()+86400*1000*7);
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
	       theme: 'dark',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=hiredate%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           minDate:'<%= new java.sql.Date(System.currentTimeMillis()+86400*1000*7)%>', // 去除今日(不含)之前
          // maxDate:               // 去除今日(不含)之後
        });
</script>

<script>
$(document).ready(function(){
	   $("#bp_pic1").change(function(){
	         readURL(this);
	     });
	   function readURL(input) {
	      if (input.files && input.files[0]) {
	          var reader = new FileReader();

	          reader.onload = function (e) {
	              $('#gro_pic_preview1').attr('src', e.target.result).fadeIn('slow');
	          }
	          reader.readAsDataURL(input.files[0]);
	      }
	  }
	});

	$(document).ready(function(){
		   $("#bp_pic2").change(function(){
		         readURL(this);
		     });
		   function readURL(input) {
		      if (input.files && input.files[0]) {
		          var reader = new FileReader();

		          reader.onload = function (e) {
		              $('#gro_pic_preview2').attr('src', e.target.result).fadeIn('slow');
		          }
		          reader.readAsDataURL(input.files[0]);
		      }
		  }
		});
	
	
	$(document).ready(function(){
	   $("button#magic").click(function(){
		 $("input#head").empty();
		 $("input#head").val("Vintoys cute 鱷魚抱枕(L)");
		 $("input#pri").empty();
		 $("input#pri").val(3000);
		 $("input#del").empty();
		 $("input#del").val("郵寄 面交自取");
		 $("input#text").empty();
		 $("textarea#text").val("長85cm 全新品塑膠袋還在 ，交換禮物收到想賣掉換鯊魚。");
		 $("select#class").val("60");
		 $('input[name="bp_new"]')[0].checked = true;
		 
	   });

});	
</script>

</html>
     