<%@page import="java.util.*"%>
<%@page import="com.mem.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="sun.misc.BASE64Encoder"%>
<%
  MemVO memVO = (MemVO) request.getAttribute("memVO");
%>
<!DOCTYPE html>
<html lang="en">
  <head>

    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>會員申請 -ToyAllHot Store</title>
	<!-- JQUERY -->
    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
    <!-- PLUGINS CSS STYLE -->
    <link href="<%=request.getContextPath() %>/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/assets/plugins/selectbox/select_option1.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/assets/plugins/fancybox/jquery.fancybox.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/assets/plugins/rateyo/jquery.rateyo.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/assets/plugins/iziToast/css/iziToast.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/assets/plugins/prismjs/prism.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/assets/plugins/revolution/css/settings.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/assets/plugins/animate/animate.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/plugins/slick/slick.css" media="screen">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/plugins/slick/slick-theme.css" media="screen">


    <!-- CUSTOM CSS -->
    <link href="<%=request.getContextPath() %>/assets/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/default.css" id="option_style">

    <!-- Icons -->
    <link rel="shortcut icon" href="<%=request.getContextPath() %>/assets/img/favicon.png">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	<script>

	var app = window.AddressSeleclList =
	{
	    AdrressArray: [
	                    ['台北市', '100中正區', '103大同區', '104中山區', '105松山區', '106大安區', '108萬華區', '110信義區', '111士林區', '112北投區', '114內湖區', '115南港區', '116文山區'],
	                    ['台北縣', '207萬里鄉', '208金山鄉', '220板橋市', '221汐止市', '222深坑鄉', '223石碇鄉', '224瑞芳鎮', '226平溪鄉', '227雙溪鄉', '228貢寮鄉', '231新店市', '232坪林鄉', '233烏來鄉', '234永和市', '235中和市', '236土城市', '237三峽鎮', '238樹林市', '239鶯歌鎮', '241三重市', '242新莊市', '243泰山鄉', '244林口鄉', '247蘆洲市', '248五股鄉', '248新莊市', '249八里鄉', '251淡水鎮', '252三芝鄉', '253石門鄉'],
	                    ['台中市', '400中區', '401東區', '402南區', '403西區', '404北區', '406北屯區', '407西屯區', '408南屯區'],
	                    ['台中縣', '411太平市', '412大里市', '413霧峰鄉', '414烏日鄉', '420豐原市', '421后里鄉', '422石岡鄉', '423東勢鎮', '424和平鄉', '426新社鄉', '427潭子鄉', '428大雅鄉', '429神岡鄉', '432大肚鄉', '433沙鹿鎮', '434龍井鄉', '435梧棲鎮', '436清水鎮', '437大甲鎮', '438外埔鄉', '439大安鄉'],
	                    ['台東縣', '950台東市', '951綠島鄉', '952蘭嶼鄉', '953延平鄉', '954卑南鄉', '955鹿野鄉', '956關山鎮', '957海端鄉', '958池上鄉', '959東河鄉', '961成功鎮', '962長濱鄉', '963太麻里鄉', '964金峰鄉', '965大武鄉', '966達仁鄉'],
	                    ['台南市', '700中西區', '701東區', '702南區', '704北區', '708安平區', '709安南區'],
	                    ['台南縣', '710永康市', '711歸仁鄉', '712新化鎮', '713左鎮鄉', '714玉井鄉', '715楠西鄉', '716南化鄉', '717仁德鄉', '718關廟鄉', '719龍崎鄉', '720官田鄉', '721麻豆鎮', '722佳里鎮', '723西港鄉', '724七股鄉', '725將軍鄉', '726學甲鎮', '727北門鄉', '730新營市', '731後壁鄉', '732白河鎮', '733東山鄉', '734六甲鄉', '735下營鄉', '736柳營鄉', '737鹽水鎮', '741善化鎮', '741新市鄉', '742大內鄉', '743山上鄉', '744新市鄉', '745安定鄉'],
	                    ['宜蘭縣', '260宜蘭市', '261頭城鎮', '262礁溪鄉', '263壯圍鄉', '264員山鄉', '265羅東鎮', '266三星鄉', '267大同鄉', '268五結鄉', '269冬山鄉', '270蘇澳鎮', '272南澳鄉', '290釣魚台'],
	                    ['花蓮縣', '970花蓮市', '971新城鄉', '972秀林鄉', '973吉安鄉', '974壽豐鄉', '975鳳林鎮', '976光復鄉', '977豐濱鄉', '978瑞穗鄉', '979萬榮鄉', '981玉里鎮', '982卓溪鄉', '983富里鄉'],
	                    ['金門縣', '890金沙鎮', '891金湖鎮', '892金寧鄉', '893金城鎮', '894烈嶼鄉', '896烏坵鄉'],
	                    ['南投縣', '540南投市', '541中寮鄉', '542草屯鎮', '544國姓鄉', '545埔里鎮', '546仁愛鄉', '551名間鄉', '552集集鎮', '553水里鄉', '555魚池鄉', '556信義鄉', '557竹山鎮', '558鹿谷鄉'],
	                    ['南海島', '817東沙群島', '819南沙群島'],
	                    ['屏東縣', '900屏東市', '901三地門鄉', '902霧台鄉', '903瑪家鄉', '904九如鄉', '905里港鄉', '906高樹鄉', '907鹽埔鄉', '908長治鄉', '909麟洛鄉', '911竹田鄉', '912內埔鄉', '913萬丹鄉', '920潮州鎮', '921泰武鄉', '922來義鄉', '923萬巒鄉', '924崁頂鄉', '925新埤鄉', '926南州鄉', '927林邊鄉', '928東港鎮', '929琉球鄉', '931佳冬鄉', '932新園鄉', '940枋寮鄉', '941枋山鄉', '942春日鄉', '943獅子鄉', '944車城鄉', '945牡丹鄉', '946恆春鎮', '947滿州鄉'],
	                    ['苗栗縣', '350竹南鎮', '351頭份鎮', '352三灣鄉', '353南庄鄉', '354獅潭鄉', '356後龍鎮', '357通霄鎮', '358苑裡鎮', '360苗栗市', '361造橋鄉', '362頭屋鄉', '363公館鄉', '364大湖鄉', '365泰安鄉', '366銅鑼鄉', '367三義鄉', '368西湖鄉', '369卓蘭鎮'],
	                    ['桃園縣', '320中壢市', '324平鎮市', '325龍潭鄉', '326楊梅鎮', '327新屋鄉', '328觀音鄉', '330桃園市', '333龜山鄉', '334八德市', '335大溪鎮', '336復興鄉', '337大園鄉', '338蘆竹鄉'],
	                    ['高雄市', '800新興區', '801前金區', '802苓雅區', '803鹽埕區', '804鼓山區', '805旗津區', '806前鎮區', '807三民區', '811楠梓區', '812小港區', '813左營區', '817東沙群島', '819南沙群島'],
	                    ['高雄縣', '814仁武鄉', '815大社鄉', '820岡山鎮', '821路竹鄉', '822阿蓮鄉', '823田寮鄉', '824燕巢鄉', '825橋頭鄉', '826梓官鄉', '827彌陀鄉', '828永安鄉', '829湖內鄉', '830鳳山市', '831大寮鄉', '832林園鄉', '833鳥松鄉', '840大樹鄉', '842旗山鎮', '843美濃鎮', '844六龜鄉', '845內門鄉', '846杉林鄉', '847甲仙鄉', '848桃源鄉', '849那瑪夏鄉', '851茂林鄉', '852茄萣鄉'],
	                    ['基隆市', '200仁愛區', '201信義區', '202中正區', '203中山區', '204安樂區', '205暖暖區', '206七堵區'],
	                    ['連江縣', '209南竿鄉', '210北竿鄉', '211莒光鄉', '212東引鄉'],
	                    ['釣魚台', '290釣魚台'],
	                    ['雲林縣', '630斗南鎮', '631大埤鄉', '632虎尾鎮', '633土庫鎮', '634褒忠鄉', '635東勢鄉', '636台西鄉', '637崙背鄉', '638麥寮鄉', '640斗六市', '643林內鄉', '646古坑鄉', '647莿桐鄉', '648西螺鎮', '649二崙鄉', '651北港鎮', '652水林鄉', '653口湖鄉', '654四湖鄉', '655元長鄉'],
	                    ['新竹市', '300北區', '300東區', '300香山區'],
	                    ['新竹縣', '300寶山鄉', '302竹北市', '303湖口鄉', '304新豐鄉', '305新埔鎮', '306關西鎮', '307芎林鄉', '308寶山鄉', '310竹東鎮', '311五峰鄉', '312橫山鄉', '313尖石鄉', '314北埔鄉', '315峨眉鄉'],
	                    ['嘉義市', '600西區', '600東區'],
	                    ['嘉義縣', '602番路鄉', '603梅山鄉', '604竹崎鄉', '605阿里山鄉', '606中埔鄉', '607大埔鄉', '608水上鄉', '611鹿草鄉', '612太保市', '613朴子市', '614東石鄉', '615六腳鄉', '616新港鄉', '621民雄鄉', '622大林鎮', '623溪口鄉', '624義竹鄉', '625布袋鎮'],
	                    ['彰化縣', '500彰化市', '502芬園鄉', '503花壇鄉', '504秀水鄉', '505鹿港鎮', '506福興鄉', '507線西鄉', '508和美鎮', '509伸港鄉', '510員林鎮', '511社頭鄉', '512永靖鄉', '513埔心鄉', '514溪湖鎮', '515大村鄉', '516埔鹽鄉', '520田中鎮', '521北斗鎮', '522田尾鄉', '523埤頭鄉', '524溪州鄉', '525竹塘鄉', '526二林鎮', '527大城鄉', '528芳苑鄉', '530二水鄉'],
	                    ['澎湖縣', '880馬公市', '881西嶼鄉', '882望安鄉', '883七美鄉', '884白沙鄉', '885湖西鄉']
	                  ]
	    ,

	    defaultOptionCityText: '請選擇縣市',
	    defaultOptionCityValue: '',
	    defaultOptionAreaText: '請選擇鄉鎮',
	    defaultOptionAreaValue: '',
	    
	    Initialize: function (city, area, defaultCityText, defaultCityValue, defaultAreaText, defaultAreaValue) {

	        var cityText = defaultCityText ? defaultCityText : this.defaultOptionCityText;
	        var cityValue = defaultAreaValue ? defaultAreaValue : this.defaultOptionCityValue;
	        var areaText = defaultAreaText ? defaultAreaText : this.defaultOptionAreaText;
	        var areaValue = defaultAreaValue ? defaultAreaValue : this.defaultOptionAreaValue;

	        var citySelect = document.getElementById(city);
	        var areaSelect = document.getElementById(area);

	        citySelect.options[0] = new Option(cityText, cityValue);
	        areaSelect.options[0] = new Option(areaText, areaValue);
	        for (var i = 0; i < this.AdrressArray.length; i++) {
	            citySelect.options[i + 1] = new Option(this.AdrressArray[i][0], this.AdrressArray[i][0]);
	        }
	        citySelect.addEventListener ? citySelect.addEventListener('change', function (e) { app.AppendArea(e, areaSelect, areaText, areaValue) }, false) : citySelect.attachEvent('onchange', function (e) { app.AppendArea(e, areaSelect, areaText, areaValue) });
	    },

	    AppendArea: function (e, AreaSelect, areaText, areaValue) {
	        var target = e.target ? e.target : e.srcElement;
	        if (target.selectedIndex == 0) {
	            AreaSelect.options.length = 0;
	            AreaSelect.options[0] = new Option(areaText, areaValue);
	            return;
	        }
	        AreaSelect.options.length = this.AdrressArray[target.selectedIndex - 1].length - 1;
	        for (var i = 1; i < this.AdrressArray[target.selectedIndex - 1].length; i++) {
	            AreaSelect.options[i - 1] = new Option(this.AdrressArray[target.selectedIndex - 1][i], this.AdrressArray[target.selectedIndex - 1][i]);
	        }
	    },

	    ReturnSelectAddress: function (city, area) {
	        var city = document.getElementById(city);
	        var area = document.getElementById(area);
	        return city.value + area.value;
	    }
	};
	</script>
 	<style>
 		.div_Mpic{
 			text-align:center;
 		}
 		#preview_Mpic{
 			border:2px solid #29a3a3;
 			margin:0px auto;
 		}
 	</style>
  </head>

  <body id="body" class="body-wrapper version1 up-scroll">

    <div class="main-wrapper">

      <!-- HEADER -->
      <div class="header clearfix">

        <!-- TOPBAR NAVBAR -->
		<jsp:include page="/assets/topBar.jsp" flush="true"/>

      <!-- LIGHT SECTION -->
      <section class="lightSection clearfix pageHeader">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <div class="page-title">
                <h2>會員申請</h2>
              </div>
            </div>
            <div class="col-md-6">
              <ol class="breadcrumb float-right">
                <li>
                  <a href="<%=request.getContextPath() %>/index1.jsp">首頁</a>
                </li>
                <li class="active">sign up</li>
              </ol>
            </div>
          </div>
        </div>
      </section>

      <!-- MAIN CONTENT SECTION -->
  		
      <section class="mainContent clearfix signUp">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-md-12">
              <div class="panel panel-default">
                <div class="panel-heading"><h3>sign up</h3></div>
                <div class="panel-body"style="border-color:#bfbfbf;">
                  <form action="<%= request.getContextPath() %>/Front-mem/mem.do" method="POST" enctype="multipart/form-data"role="form">
                   <div class="row">
                    <div class="col-md-6">
                    <div class="div_Mpic"> 
	                    <div class="form-group">
	                      <label for="mem_pic">
	                      	<c:choose>
	                      	<c:when test="${memVO.mem_pic==null}">
	                      		<img src="../images/noPic.jpeg" id="preview_Mpic"  class="rounded-circle" height="150px" width="150px">
	                      	</c:when>
	                      	<c:otherwise>
	                      		<img src="data:image/png;base64,${memVO.base_mem_pic}" id="preview_Mpic"  class="rounded-circle" height="150px" width="150px">
	                      	</c:otherwise>
	                      	</c:choose>
	                    	<input type="file" name="mem_pic" id="mem_pic"accept="image/gif, image/jpeg, image/png" style="display:none;">
	                    	<input type="hidden" name="mem_base_pic" value="<%=(memVO==null)?"": memVO.getBase_mem_pic() %>">
	                    </label>
	                    </div>
	                 </div>
                    <div class="form-group">
                      <label for="">姓名</label>
                      <input id="mem_name" name="mem_name"type="text" class="form-control" id="mem_name" placeholder="請輸入姓名"value="<%=(memVO==null)?"":memVO.getMem_name() %>">
                    </div>
                    <div class="form-group" id="ac123">
                      <label for="">帳號</label>
                      <input name="mem_account" type="text" class="form-control" id="insertAccount" placeholder="請輸入帳號"value="<%=(memVO==null)?"":memVO.getMem_account() %>">
                    </div>
                    <div class="form-group">
                      <label for="">密碼</label>
                      <input id="mem_pwd" name="mem_pwd" type="password" class="form-control" id="mem_pwd"placeholder="請輸入密碼"value="<%=(memVO==null)?"":memVO.getMem_pwd() %>">
                    </div>
                    <div class="form-group">
                      <label for="">Email</label>
                      <input name="mem_email"type="email" class="form-control" id="insertEmail"placeholder="請輸入EMAIL"value="<%=(memVO==null)?"":memVO.getMem_email() %>">
                    </div>
                    </div>
                     <div class="col-md-6" style="position:relative;">
                    <div class="form-group">
                      <label for="">連路電話</label>
                      <input id="mem_phone" name="mem_phone"type="text" class="form-control" id="mem_phone" placeholder="請輸入連絡電話"value="<%=(memVO==null)?"":memVO.getMem_phone() %>">
                    </div>
                    <div class="form-group">
                      <label for="">出生日期</label>
                      <input id="mem_born" name="mem_born" type="text" class="form-control" id="date_of_birth" placeholder="請選擇出生日期"value="<%=(memVO==null)?"":memVO.getMem_born() %>">
                    </div>
                     <div class="form-group">
                      <label for="">性別</label> 
                      <select size="1" name="mem_sex"class="form-control">
                      <option value="男">男
                      <option value="女">女
                      </select>
                    </div>
                    <div class="form-group">
                      <label for="">銀行帳號</label>
                      <input id="mem_bank" name="mem_bank"type="text" class="form-control" id="mem_bank"placeholder="請輸入銀行帳號"value="<%=(memVO==null)?"":memVO.getMem_bank() %>">
                    </div>
                    <div class="form-group">
                      <label i for="">聯絡地址</label>
                     <select name="mem_addr1" id="country"class="form-control" ></select>
					 <select name="mem_addr2" id="urbanArea"class="form-control"></select>
                      <input name="mem_addr3" id="road"type="text" class="form-control" id="" placeholder="請輸入您的地址"value="<%=(memVO==null)?"":memVO.getMem_addr3() %>">
                    </div>
                  	</div>
                  	 <div class="col-md-12" style="position:relative;">
                    <button id="singnupSubmit" type="submit" class="btn btn-primary btn-block">確認申請</button>
                    <button id="magicBtn" type="button" class="btn btn-primary btn-block">神奇小按鈕</button>
                    </div>
                    <input type="hidden" name="action" value="memSignup"/>
                    <button data-toggle="modal" data-target="#login" type="button" class="btn btn-link btn-block"><span>All have an account?</span> Log in</button>
					<!-- 錯誤訊息按鈕 -->
                    <button id="errorMsgs" type="button"  data-toggle="modal" data-target="#errorModal" style="display:none"></button>
                  </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      	
      	<!-- FOOTER -->
  		<jsp:include page="/assets/footer.jsp" flush="true"/>
			
		<!-- COPY RIGHT -->
			<div class="copyRight clearfix">
				<div class="container">
					<div class="row">
						<div class="col-md-7 col-12">
							<p>&copy; 2017 Copyright Bigbag Store Bootstrap Template by <a target="_blank" href="http://www.iamabdus.com/">Abdus</a>.</p>
						</div>
						<div class="col-md-5 col-12">
							<ul class="list-inline">
								<li><img src="assets/img/home/footer/card1.png"></li>
								<li><img src="assets/img/home/footer/card2.png"></li>
								<li><img src="assets/img/home/footer/card3.png"></li>
								<li><img src="assets/img/home/footer/card4.png"></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- LOGIN MODAL -->
		<div class="modal fade login-modal" id="login" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header justify-content-center">
						<h3 class="modal-title">會員登入</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<form ACTION="<%= request.getContextPath() %>/Front-mem/mem.do" enctype="multipart/form-data" method="POST" role="form">
							<div class="form-group">
								<label for="mem_account">帳號</label>
								<input id="mem_account" name="mem_account"type="text" class="form-control">
							</div>
							<div class="form-group">
								<label for="mem_pwd">密碼</label>
								<input id="mem_pwd" name="mem_pwd"type="password" class="form-control">
							</div>
							<div class="checkbox">
								<input id="checkbox-1" class="checkbox-custom form-check-input" name="checkbox-1" type="checkbox" checked>
								<label for="checkbox-1" class="checkbox-custom-label form-check-label">Remember me</label>
							</div>
							<button type="submit" class="btn btn-primary btn-block">登入</button>
							<button type="button" class="btn btn-link btn-block">Forgot Password?</button>
							 <input type="hidden" name="action" value="memLogin">
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<!-- ERROR MODAL -->
		<div class="modal fade" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h3 class="modal-title" id="exampleModalLongTitle">錯誤訊息!</h3>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body" style="text-align:center;">
		       		<c:if test="${not empty errorMsgs}">
						<font id="erroTitle" style="display:none;">請修正以下資訊:</font>
						<ul >
							<c:forEach var="message" items="${errorMsgs}">
								<li  style="color:red;font-size:15px;">${message}</li>
							</c:forEach>
						</ul>
					  </c:if>
		      </div>
		      <div class="modal-footer">
		        <button  type="button" class="btn btn-primary" data-dismiss="modal">關閉</button>
		      </div>
		    </div>
		  </div>
		</div>

		
		<script src="<%=request.getContextPath() %>/assets/plugins/jquery/jquery.min.js"></script>
		<script src="<%=request.getContextPath() %>/assets/plugins/jquery/jquery-migrate-3.0.0.min.js"></script>
		<script src="<%=request.getContextPath() %>/assets/plugins/jquery-ui/jquery-ui.js"></script>
		<script src="<%=request.getContextPath() %>/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="<%=request.getContextPath() %>/assets/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
		<script src="<%=request.getContextPath() %>/assets/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
		<script src="<%=request.getContextPath() %>/assets/plugins/slick/slick.js"></script>
		<script src="<%=request.getContextPath() %>/assets/plugins/fancybox/jquery.fancybox.min.js"></script>
		<script src="<%=request.getContextPath() %>/assets/plugins/iziToast/js/iziToast.js"></script>
		<script src="<%=request.getContextPath() %>/assets/plugins/prismjs/prism.js"></script>
		<script src="<%=request.getContextPath() %>/assets/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
		<script src="<%=request.getContextPath() %>/assets/plugins/countdown/jquery.syotimer.js"></script>
		<script src="<%=request.getContextPath() %>/assets/plugins/velocity/velocity.min.js"></script>
		<script src="<%=request.getContextPath() %>/assets/plugins/rateyo/jquery.rateyo.min.js"></script>
		<script src="<%=request.getContextPath() %>/assets/js/custom.js"></script>
		<!--錯誤彈窗 -->
		<script>
		 $(document).ready(function(){
			$("#magicBtn").click(function(){
				$("#mem_name").val("開勳");
				$("#insertAccount").val("z123456");
				$("#mem_phone").val("0905597668");
				$("#mem_bank").val("5986254187712433");
				$("#mem_born").val("1991-05-21");
				$("#mem_pwd").val("123456");
				$("#road").val("市民大道三段2號");
				swal('太神奇了', '', 'success');
			})
			 
			 var acc=document.getElementById("insertAccount");
			 acc.addEventListener("input",function(e){
				 if($("#insertAccount").val().trim()!==""){
				 $.ajax({
						url: "/EA102G5/MemAjax.do",
						type: 'post',
						dataType: 'json',
						data: {
							'action': 'checkAcc',
							'mem_account':$("#insertAccount").val(),
						},
						success: function(data) {
							if(data.check==="OK"){
								$("#insertAccount").css("color","#33cc33");
							}else{
								$("#insertAccount").css("color","#ff1a1a");
							}
						},
						error: function(){
							swal("錯誤", "", "error");
							}
						
						});
				 }
			})
			 acc.addEventListener("change",function(e){
				 if($("#insertAccount").val().trim()!==""){
				 $.ajax({
						url: "/EA102G5/MemAjax.do",
						type: 'post',
						dataType: 'json',
						data: {
							'action': 'checkAcc',
							'mem_account':$("#insertAccount").val(),
						},
						success: function(data) {
							if(data.check==="OK"){
								$("#insertAccount").css("color","#33cc33");
							}else{
								$("#insertAccount").css("color","#ff1a1a");
							}
						},
						error: function(){
							swal("錯誤", "", "error");
							}
						
						});
				 }
			})
			 var ema=document.getElementById("insertEmail");
			 ema.addEventListener("input",function(e){
				 if($("#insertEmail").val().trim()!==""){
				 $.ajax({
						url: "/EA102G5/MemAjax.do",
						type: 'post',
						dataType: 'json',
						data: {
							'action': 'checkEmail',
							'mem_email':$("#insertEmail").val(),
						},
						success: function(data) {
							if(data.check==="OK"){
								$("#insertEmail").css("color","#33cc33");
							}else{
								$("#insertEmail").css("color","#ff1a1a");
							}
						},
						error: function(){
							swal("錯誤", "發送失敗", "error");
							}
						
						});
				 }
			})
			 ema.addEventListener("change",function(e){
				 if($("#insertEmail").val().trim()!==""){
				 $.ajax({
						url: "/EA102G5/MemAjax.do",
						type: 'post',
						dataType: 'json',
						data: {
							'action': 'checkEmail',
							'mem_email':$("#insertEmail").val(),
						},
						success: function(data) {
							if(data.check==="OK"){
								$("#insertEmail").css("color","#33cc33");
							}else{
								$("#insertEmail").css("color","#ff1a1a");
							}
						},
						error: function(){
							swal("錯誤", "發送失敗", "error");
							}
						
						});
				 }
			})
			 $("#mem_pic").on('change', function(e){      
	       	  var file = this.files[0];
	       	  
	       	  var fr = new FileReader();
	       	  fr.onload = function (e) {
	       	    $('#preview_Mpic').attr('src', e.target.result);
	       	  };
	       	  fr.readAsDataURL(file);
	       	});
			
			if($("#erroTitle").val()!=null){
				$("#errorMsgs").click();
			}
		 })
		</script>
	
	
	
<% 
  java.sql.Date mem_born = null;
  try {
	    mem_born =memVO.getMem_born();
   } catch (Exception e) {
	    mem_born = new java.sql.Date(System.currentTimeMillis());
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
        $('#date_of_birth').datetimepicker({
        	 theme: '',              //theme: 'dark',
  	       timepicker:false,       //timepicker:true,
  	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
  	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
  		   value: '<%=mem_born%>', // value:   new Date(),
		   //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        window.onload = function () {
            //當頁面載完之後，用AddressSeleclList.Initialize()，
            //傳入要綁定的縣市下拉選單ID及鄉鎮市區下拉選單ID
            AddressSeleclList.Initialize('country', 'urbanArea');
          
       }
        
       
     </script>
	</body>
</html>
