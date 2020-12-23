<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.mem.model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  MemVO memVO = (MemVO) request.getAttribute("memVO");
%>
<!DOCTYPE html>
<html lang="en">
  <head>

    <!-- SITE TITTLE -->
<!--     <meta charset="utf-8"> -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Profile - BIGBAG Store</title>
<!--     JQUERY -->
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
	<!--Sweet Alert -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>

    <!-- CUSTOM CSS -->
    <link href="<%=request.getContextPath() %>/assets/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/assets/css/default.css" id="option_style">

    <!-- Icons -->
    <link rel="shortcut icon" href="<%=request.getContextPath() %>/assets/img/favicon.png">

    
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
    .caption{
          text-align: center;
         position: relative;
    }
   
    #camera{
      position: absolute;
      opacity: 0;
      transition: all 200ms ease-in-out;
      top: 0px;
      left: 0px;
      width: 170px; 
      height: 200px;
      text-align: center;
      padding-top: 85px;
      background-color: rgba(255,255,255,0.5);
    
    }
    #camera:hover{
      opacity: 1;
    }
    #preview_Mpic{
     	border:3px solid #47bac1;
     	radius:10px;
    }
   
    @media (max-width: 767px){
      #preview_Mpic{
        width:188px;
        height: 208px;
      }
      #camera{
          margin-left: 23.5%;
          width:189px;
          height: 208px;
       
      }
    }
    @media (min-width: 768px) and (max-width: 991px){
      #preview_Mpic{
        width:194px;
        height: 208px;
      }
      #camera{
         width:195px;
        height: 208px;
      }
    }

     @media (min-width: 992px) and (max-width: 1199px){
      #preview_Mpic{
        width:195px;
        height: 216px;
      }
      #camera{
         width:200px;
        height: 216px;
      }
    }
    @media (min-width: 1200px){
     
      #camera{
         width:164px;
        height: 200px;
      }
    }
    
	.xdsoft_datetimepicker .xdsoft_datepicker {
	           width:  300px;   /* width:  300px; */
	}
	.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	           height: 151px;   /* height:  151px; */
	}

  </style>
  </head>

  <body id="body" class="body-wrapper version1 up-scroll"  onload="connect();addrUpdate();" onunload="disconnect();">

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
                <h2>個人資訊</h2>
              </div>
            </div>
            <div class="col-md-6">
              <ol class="breadcrumb float-right">
                <li>
                  <a href="<%=request.getContextPath() %>/index1.jsp">首頁</a>
                </li>
                <li class="active">個人資訊</li>
              </ol>
            </div>
          </div>
        </div>
      </section>

      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix userProfile">
        <div id="container"class="container">
          <div class="row">
            <div class="col-12">
              <div class="btn-group" role="group" aria-label="...">
                <a href="account-profile.jsp" class="btn btn-default active"><i class="fa fa-user" aria-hidden="true"></i>個人資訊</a>
                <a href="account-all-depo.jsp" class="btn btn-default "><i class="fa fa-list" aria-hidden="true"></i>點數交易紀錄</a>
                <a href="<%=request.getContextPath() %>/bp-front/mybp.jsp" class="btn btn-default "><i class="fa fa-list" aria-hidden="true"></i>我的直購紀錄</a>
              	 <a href="<%=request.getContextPath() %>/front_end/readrecord.jsp" class="btn btn-default "><i class="fa fa-list" aria-hidden="true"></i>我的交換紀錄</a>
               <a href="<%=request.getContextPath() %>/bid_front_end/backBid.jsp" class="btn btn-default "><i class="fa fa-list" aria-hidden="true"></i>我的競標紀錄</a>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="innerWrapper profile" style="border-color:#bfbfbf;">
                <div class="orderBox">
                  <h2>個人資料</h2>
                </div>
                <div class="row">
                  <div class="col-md-4 col-lg-3 col-xl-2 col-12"style="padding-right:0px;paddin-left:0px;">
                    <div class="thumbnail">
                       <div class="caption">
                        <label for="mem_pic">                                   
                          <form  method="post" id="updatePicForm" enctype="multipart/form-data" >
	                          <img src="<%=request.getContextPath() %>/MemPic?mem_account=${memVO.mem_account}" name="mem_pic" id="preview_Mpic" accept="image/gif, image/jpeg, image/png"alt="profile-image" height="200px" width="200px" >
	                          <div  id="camera" class="fa fa-camera" ><b>更換照片</b></div>
	                          <input type="file" name="file"id="mem_pic" style="display:none;">
	                          <input type="hidden" name="action"id="memUpdatePic">
                          </form>
                        </label> 
                        </div>
                                   
                        <div class="caption" >
                        <label  class="btn btn-primary btn-block" style="background-color: #00b386;" >我的點數:${depoVO.depo_point}元</label>
                        <input type="text"  style="display:none;">
                      </div>            
                                         
                      <div class="caption" >
                        <label  class="btn btn-primary btn-block" style="background-color: #4da6ff;" >會員積分:${memVO.mem_creScore}分</label>
                        <input type="text"  style="display:none;">
                      </div>
                      <div class="caption" >
                        <label class="btn btn-primary btn-block" style="background-color:#ff9966;" >會員等級:${memVO.mem_level}</label>
                        <input type="text"  style="display:none;">
                      </div>
                      <div class="caption" >
                        <label  class="btn btn-primary btn-block" style="background-color: #ff8080;" >棄標次數:${memVO.mem_abandon }次</label>
                        <input type="text"  style="display:none;">
                      </div>
                     </div>
                  </div>
                  <div class="col-md-8 col-lg-9 col-xl-10 col-12">
                   
                    <form class="form-horizontal">
                          <div class="form-group row">
                          <label for="" class="col-md-3 control-label" style=" text-align:center;">姓名</label>
                          <div class="col-md-7">
                            <input type="text" class="form-control" id="" placeholder="${memVO.mem_name }" disabled="disabled">
                          </div>
                        </div>
                        <div class="form-group row">
                          <label for="" class="col-md-3 control-label"style="text-align:center;">帳號</label>
                          <div class="col-md-7">
                            <input type="text" class="form-control" id="mem_account" value="${memVO.mem_account }" placeholder="${memVO.mem_account }"disabled="disabled">
                          </div>
                        </div>
                        <div class="form-group row">
                          <label for="" class="col-md-3 control-label"style="text-align:center;">連絡電話</label>
                          <div class="col-md-7">
                            <input type="text" class="form-control" id="" placeholder="${memVO.mem_phone }"disabled="disabled">
                          </div>
                        </div>
                         <div class="form-group row">
                          <label for="" class="col-md-3 control-label"style="text-align:center;">性別</label>
                          <div class="col-md-7">
                            <input type="text" class="form-control" id="" placeholder="${memVO.mem_sex }"disabled="disabled">
                          </div>
                        </div>
                        <div class="form-group row">
                          <label for="" class="col-md-3 control-label"style="text-align:center;">EMAIL</label>
                          <div class="col-md-7">
                            <input type="email" class="form-control" id="" placeholder="${memVO.mem_email }"disabled="disabled">
                          </div>
                        </div>
                        <div class="form-group row">
                          <label for="" class="col-md-3 control-label"style="text-align:center;">生日</label>
                          <div class="col-md-7">
                            <input type="text" class="form-control" id="" placeholder="${memVO.mem_born }"disabled="disabled">
                          </div>
                        </div>
                        <div class="form-group row">
                          <label for="" class="col-md-3 control-label"style="text-align:center;">地址</label>
                          <div class="col-md-7">
                            <input id="mem_addr"type="text" class="form-control" id="" placeholder="${memVO.mem_addr }"disabled="disabled" >
                          </div>
                        </div>
                        <div class="form-group row">
                          <label for="" class="col-md-3 control-label"style="text-align:center;">銀行帳號</label>
                          <div class="col-md-7">
                            <input type="text" class="form-control" id="" placeholder="${memVO.mem_bank }"disabled="disabled">
                          </div>
                        </div>
                        <div class="form-group row">
                          <div class=" col-md-4 ">
                            <label for="goUpdate" class="btn btn-primary float-right"><a id="goUpdate"data-toggle="modal" href='#updateModal' style="color:white;">修改資料</a></label>
                          </div>
                          <div class=" col-md-2 ">
                            <label for="goUpdate" class="btn btn-primary float-right"><a href='<%=request.getContextPath() %>/Front-mem/updatePassword.jsp' style="color:white;">更改密碼</a></label>
                          </div>
                          
                        </div>
                      
                      </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      	<!-- FOOTER -->
  		<jsp:include page="/assets/footer.jsp"/>
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

		
    	<!-- UPDATE MODAL -->
		<div class="modal fade " id="updateModal" tabindex="-1" role="dialog" >
			<div class="modal-dialog">
				<div class="modal-content" style="width:125%;">
					<div class="modal-header justify-content-center">
						<button id="closeUpModal"type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h3 class="modal-title">更改資訊</h3> 
					</div>
					<div class="modal-body">
						<form id="upform" action="<%=request.getContextPath() %>/Front-mem/mem.do" method="POST" role="form" enctype="multipart/form-data">
							<div class="form-group row">
                          <label for="" class="col-md-3 control-label" style=" text-align:center;padding-top:13px;">姓名</label>
                          <div class="col-md-7">
                            <input name="mem_name"type="text" class="form-control" id="" value="${updateMemVO==null?memVO.mem_name:updateMemVO.mem_name }" >
                          </div>
                        </div>
                        
                        <div class="form-group row">
                          <label for="" class="col-md-3 control-label"style="text-align:center;padding-top:13px;">行動電話</label>
                          <div class="col-md-7">
                            <input name="mem_phone"type="text" class="form-control" id="" value="${updateMemVO==null?memVO.mem_phone:updateMemVO.mem_phone }">
                          </div>
                        </div>
                         
                        <div class="form-group row">
                          <label for="" class="col-md-3 control-label"style="text-align:center;padding-top:13px;">EMAIL</label>
                          <div class="col-md-7">
                            <input name="mem_email"type="email" class="form-control" id=""  value="${updateMemVO==null?memVO.mem_email:updateMemVO.mem_email }">
                          </div>
                        </div>
                        <div class="form-group row">
                          <label for="" class="col-md-3 control-label"style="text-align:center;padding-top:13px;">生日</label>
                          <div class="col-md-7">
                            <input name="mem_born" type="text" class="form-control" id="date_of_birth"value="${updateMemVO==null?memVO.mem_born:updateMemVO.mem_born}">
                          </div>
                        </div>
                        <div class="form-group row">
                          <label for=""  class="col-md-3 control-label"style="text-align:center;padding-top:13px;">聯絡地址</label>
                          <div class="col-md-7">
                            <input  name="mem_addr" type="text" class="form-control" value="${memVO.mem_addr}" style="margin-bottom:5px;" readonly="readonly">
                             <label  class="btn btn-primary float-right col-md-12"><a id="upad" data-toggle="modal" href='#addrModal' style="color:white;">修改地址</a></label>
                          </div>
                        </div>
                        <div class="form-group row">
                          <label for="" class="col-md-3 control-label"style="text-align:center;padding-top:13px;">銀行帳號</label>
                          <div class="col-md-7">
                            <input name="mem_bank" type="text" class="form-control" id="" value="${updateMemVO==null?memVO.mem_bank:updateMemVO.mem_bank }">
                          </div>
                        </div>
							<button id="update" type="submit" class="btn btn-primary btn-block">確認修改</button>
							<input type="hidden" name="action" value="memUpdate">
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 錯誤訊息按鈕 -->
         <button id="errorMsgs" type="button"  data-toggle="modal" data-target="#errorModal" style="display:none"></button>
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
		<!-- addr MODAL -->
		<div class="modal fade" id="addrModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h3 class="modal-title" id="exampleModalLongTitle">更動地址</h3>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body" style="text-align:center;">
		       	<select name="mem_addr1" id="country"class="form-control">
                  <option  >
                </select>
			    <select name="mem_addr2" id="urbanArea"class="form-control">
				  <option >
			    </select>
                <input name="mem_addr3" id="road"type="text" class="form-control"  >
		      </div>
		      <div class="modal-footer">
		        <button id="sendAddrModal" type="button" class="btn btn-primary" data-dismiss="modal">確定修改</button>
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
        <!--MemChat -->
		<jsp:include page="/assets/memChat3.jsp" flush="true"/>

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
<%-- <script src="<%=request.getContextPath()%>/Front-mem/profile.js"></script> --%>
		<script>
		 $(document).ready(function(){
			
			if($("#erroTitle").val()!=null){
				$("#errorMsgs").click();
			}
		 
		 })
		   
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
   function addrUpdate() {
      //當頁面載完之後，用AddressSeleclList.Initialize()，
      //傳入要綁定的縣市下拉選單ID及鄉鎮市區下拉選單ID
      AddressSeleclList.Initialize('country', 'urbanArea');
      //後面四個參數分別是兩個下拉選單的預設文字跟值
     AddressSeleclList.Initialize('縣市2', '鄉鎮市區2', 'Please Select City', '0', 'Please Select Area', '0');
 }
	  $("#update").click(function(){
		  $("form #upform").submit();
	  })
	  $("#mem_pic").change(function(e){
		  var file = this.files[0];
	   	  var fr = new FileReader();
	   	  fr.onload = function (e) {
	   	    $('#preview_Mpic').attr('src', e.target.result);
	   		 $('#tpMemPic').attr('src', e.target.result);
	   	  };
	   	  fr.readAsDataURL(file);
		  
		  $.ajax({ 
			url: 'MemUpdatePic.do', 
			type: 'POST', cache: false, 
			data: new FormData($('#updatePicForm')[0]), 
			processData: false, contentType: false }).done(
					function(res) { 
				swal('照片更新成功', '', 'success');
				 var file = this.files[0];
			   	  var fr = new FileReader();
			   	  fr.onload = function (e) {
			   	    $('#preview_Mpic').attr('src', e.target.result);
			   	    $('#tpMemPic').attr('src', e.target.result);
			   	  };
			   	  fr.readAsDataURL(file);
			}).fail(function(res) {
				swal('系統忙線', "", "error");
			});

		});
		
		$("#upad").click(function(){
			$(".close").click();
			
		});
		
	 	$("#sendAddrModal").click(function(){
			$.ajax({
				url: "/EA102G5/MemAjax.do",
				type: 'post',
				dataType: 'json',
				data: {
					'action': 'memsAddr',
					'mem_account':$("#mem_account").val(),
					'mem_addr1':$("#country").val(),
					'mem_addr2':$("#urbanArea").val(),
					'mem_addr3':$("#road").val(),
				},
				success: function(data) {
					swal('已修改地址！', '', 'success');
					$("#mem_addr").val(data.mem_addr);
				},
				error: function(){swal("錯誤", "發送失敗", "error");}
				
				});
		})
     
		</script>


     
     </body>
</html>
