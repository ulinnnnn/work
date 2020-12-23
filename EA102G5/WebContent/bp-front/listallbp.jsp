<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bp.model.*"%>
<%@page import="com.mem.model.*"%>
<%
 MemVO memVO = (MemVO) session.getAttribute("memVO");
%>
<%
    String bpVO = null;
	bpVO = (String) request.getAttribute("bpVO");
	BpService bpSvc = new BpService();
	
	if (bpVO != null) {
		List<BpVO> list = bpSvc.gethead(bpVO.toString());
		pageContext.setAttribute("list", list);
	} else {

		List<BpVO> list = bpSvc.getAll();
		pageContext.setAttribute("list", list);
		
	}
	
%>
<!DOCTYPE html>
<html lang="zh_TW">
  <head>

    <!-- SITE TITTLE -->
    <meta charset="Big5">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>直購區</title>

    <!-- PLUGINS CSS STYLE -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
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
    <link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/color-option2.css" id="option_style">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/img/favicon.png">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/joe_footer.css" >

<style>
h3.red {
	color: #e21c00 !important;
}

h3.black {
	color: #000000 !important;
}

.display {
	text-align: center;
}

#map {
	width: auto;
	height: 350px;
	margin: 10px auto;
}

.info_title {
	font-size: 16px;
	font-weight: 500;
}
a {
	color:blue;
}

.info_img {
	height: 30px;
	width: auto;
}
button.tit{
	border-radius: 15px ;
	margin: 0px 50px;
}

.swal2-icon-content{
	font-size:75px !important;
}
</style>
</head>
<body  onload="connect();" >
			<div class="main wrapper" style="overflow:visible;">
				<div class="header clearfix">
					<jsp:include page="/assets/topBar.jsp" flush="true"/>
				</div>
			</div>
	

    <div class="container">
      <h3>直購商城</h3>
        <div class="media-body">
        	    <div class="display">
			        <div id="map"></div>
			        	<div id=""> 
						 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/bp-front/BpServlet" style="font-size:20px; margin-bottom: 15px; text-align:left">
					        <span><b>輸入商品名:</b>
					        <input type="text" name="head" >
					        <input type="hidden" name="action" value="get_head">
					        <input type="submit" value="商品查詢" style="border-radius: 10px; border: solid 1px;width: 135px;height: 30px  ;background-color: #FFB548;color: white; font-weight: 600;font-size: 22px;"></span>
					       <span style="float: right"><b>請輸入地區：</b><input type="text" id="keyword" style="width:350px"></span>
					     </FORM>
  				</div>
			  </div>			        
        </div>
    </div>
      <section class="mainContent clearfix productsContent" style="padding: 15px 0 50px 0px">
        <div class="container">
		 <div class="row">
		 <div class="col-md-2 sideBar" style="padding: 0 15px 0 0">
		
		 	 <div class="panel panel-default filterNormal">
                <div class="panel-heading" style="font-size:22px;text-align: center">我的直購</div>
                <div class="panel-body" style="border:#c5c0ba solid 2px">
                  <ul class="list-unstyled clearfix" style="font-size:20px">
                    <li style="font-size:20px !important"><a style="font-size:20px !important" href="<%=request.getContextPath()%>/bp-front/TRY2.jsp">上架商品</a></li>
                    <li style="font-size:20px !important"><a style="font-size:20px !important" href="<%=request.getContextPath()%>/bp-front/track.jsp">我的收藏</a></li>
                    <li style="font-size:20px !important"><a style="font-size:20px !important" href="<%=request.getContextPath()%>/bp-front/mybp.jsp">訂單查詢</a></li>
                  </ul>
                </div>
              </div>
		 </div>
		 <div class="col-md-10">
          <div class="row">
          <c:forEach var="bpVO" items="${list}">
            <div class="col-md-4">
              <div class="productBox">
              <a href="TRY1.jsp?${bpVO.bp_no}">
                <div class="productImage clearfix" style="background:url(<%=request.getContextPath()%>/bp-front/DBG?bp_no=${bpVO.bp_no}&image_column=bp_pic1); padding-top: 100%;    background-size: cover;   margin-bottom: 5px; background-position:center;background-size: contain;background-repeat: no-repeat">
                </div>
                </a>
                <div class="productCaption clearfix">
                  <a href="single-product.html">
                    <h3 class="black"><a href="TRY1.jsp?${bpVO.bp_no}" style="color:black">${bpVO.bp_head}</a></h3>
                  </a>
                  <h3 class="red" style="float: left">價格:${bpVO.bp_pri}</h3> <h3  style="float:right">狀態:${bpVO.bp_new}</h3>
                </div>
              </div>
            </div>
            </c:forEach>
          </div>
          </div>
        </div>
        </div>
      </section>

       <%@ include file="/assets/footer.jsp"%>
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
		<script src="<%=request.getContextPath()%>/assets/js/custom.js"></script>

		<jsp:include page="/assets/memChat3.jsp" flush="true"/>
		
		
       <script>

        var map;
        var autocomplete ;
//      初始化地圖
        function initMap() {
            // 地圖預設中心點
            let location = {
                lat: 24.967994, // 經度
                lng: 121.192216 // 緯度
            };
            
            map = new google.maps.Map(document.getElementById('map'), {
                center: location,
                zoom: 15,
                mapTypeId: 'terrain'
            });
            
            // 地圖的座標點 有則中心位置改變
            if(data.length){
                point();
            }
        }

        	
        // 地圖座標
        var data = [
          	<c:forEach var="bpVO" items="${list}">
    		<c:if test='${bpVO.lat != null}'>
				 { lat:${bpVO.lat}, lng:${bpVO.lng}, title:'${bpVO.bp_head}',no:'${bpVO.bp_no}',ne:'${bpVO.bp_new}',time:'${bpVO.bp_upt}'},
			</c:if> 
		</c:forEach>

   ];

        // 循環設定座標
        function point() {
            for (var i = 0; i < data.length; i++) {
                generateMarkers(data[i]); // // 使用 function 將 var 宣告出來的變數鎖在 local scope
            }
        }

        // 設定座標
        function generateMarkers(datum) {
            // 產生 marker 物件
            var marker = new google.maps.Marker({
                position: { lat: datum.lat, lng: datum.lng },
                map: map,
                animation: google.maps.Animation.DROP, // DROP掉下來、BOUNCE一直彈跳
                draggable: false // true、false可否拖拉
            });
            // 產生 infowindow 物件
            var infowindow = new google.maps.InfoWindow({
                content: '<div class="info_title"><a href="TRY1.jsp?'+datum.no+'" style="color:blue;" target="_blank">' + datum.title + '</a><br>商品狀態:'+datum.ne+'<br>上架時間:'+datum.time+'</div>'
            });
            // 預設打開 info window
           infowindow.open(map, marker);
            // 當 marker 被點擊時觸發
            marker.addListener('click', function() {
                infowindow.open(map, marker);
            });
        }

     
        window.onload = initMap;
        
        
        function init() {
            var keyword = document.getElementById('keyword');
            autocomplete = new google.maps.places.Autocomplete(keyword);
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
                }

            });
        }
        window.onload = init;
        
    </script>
 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBcTdgBEb7zc8YkmlQnZ3YF23sC7iawWJg&libraries=places&callback=initMap" async defer></script>
      
		
	</body>
</html>