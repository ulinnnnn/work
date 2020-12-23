<%@page import="java.util.*"%>
<%@page import="com.mem.model.MemService"%>
<%@page import="sun.misc.BASE64Encoder"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@page import="com.mem.model.*"%>
<%@page import="com.depo.model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	MemVO memVO = (MemVO)session.getAttribute("memVO");
%>


<!DOCTYPE html>
<html lang="en">
  <head>

    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>TOY ALL HOT.jsp</title>

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


    <!-- CUSTOM CSS -->
    <link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/default.css" id="option_style">
    
    <link rel="stylesheet" href=
    "<%=request.getContextPath()%>/assets/css/joe_footer.css" >

    <!-- Icons -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/img/favicon.png">
	<style>
	.swal2-icon-content{
	font-size:75px !important;
}
	</style>

  </head>

  <body id="body" class="body-wrapper version1 up-scroll"  onload="connect();"  onunload="disconnect();">

    <div class="main-wrapper" style="overflow:visible;">

      <!-- HEADER -->
      <div class="header clearfix">
     
      <!-- TOPBAR -->
      <jsp:include page="/assets/topBar.jsp" flush="true"/>
     </div>

        
<!-- 		<button id="btn">按我詢問</button>
		<span  id="toFriend" style="display:none;">b123456</span>
		<span type="hidden" id="toFriendName" style="display:none;">仇笑癡</span> -->




      <!-- BANNER --><!-- 以下是header下面 -->
      <div id="rev_slider_25_1_wrapper" class="rev_slider_wrapper fullwidthbanner-container" data-alias="bigbag"
        data-source="gallery" style="margin:0px auto;background:transparent;padding:0px;margin-top:0px;margin-bottom:0px;">
        <!-- START REVOLUTION SLIDER 5.4.8.1 fullwidth mode -->
        <div id="rev_slider_25_1" class="rev_slider fullwidthabanner rev_slider_25_1" style="display:none;" data-version="5.4.8.1">
          <ul>
            <!-- SLIDE  -->
            <li data-index="rs-74" data-transition="fade" data-slotamount="default" data-hideafterloop="0"
              data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="300"
              data-thumb="img/home/banner-slider/slider-bg.jpg" data-delay="4000" data-rotate="0" data-saveperformance="off"
              data-title="Slide" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6=""
              data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
              <!-- MAIN IMAGE -->
              <img src="" alt="slidebg1" data-bgposition="center center" data-bgfit="cover"
                data-bgrepeat="no-repeat" class="rev-slidebg" data-no-retina>
              <!-- LAYERS -->
      
              <!-- LAYER NR. 1 -->
              <div class="tp-caption   tp-resizeme" id="slide-74-layer-15" data-x="['right','right','right','right']"
                data-hoffset="['-37','-36','-27','-90']" data-y="['middle','middle','middle','middle']"
                data-voffset="['0','0','0','0']" data-width="none" data-height="none" data-whitespace="nowrap"
                data-type="image" data-responsive_offset="on"
                data-frames='[{"delay":300,"speed":800,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Back.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:-50px;opacity:0;","ease":"Back.easeInOut"}]'
                data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
                data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]" style="z-index: 5;">
                <img src="<%=request.getContextPath()%>/assets/img/index/big1.jpg" alt="slider-image1" data-ww="['800px','683px','500px','500px']"
                  data-hh="['528px','461px','347','347']" data-no-retina> </div>
      
              <!-- LAYER NR. 2 -->
              <div class="tp-caption   tp-resizeme" id="slide-74-layer-7" data-x="['left','left','left','left']"
                data-hoffset="['26','50','50','30']" data-y="['top','top','top','top']" data-voffset="['110','80','50','70']"
                data-fontsize="['46','46','36','30']" data-width="['490','490','355','320']" data-height="none" data-whitespace="normal"
                data-type="text" data-responsive_offset="on"
                data-frames='[{"delay":800,"speed":800,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Back.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:-50px;opacity:0;","ease":"Back.easeInOut"}]'
                data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
                data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]"
                style="z-index: 6;  min-width: 490px; max-width: 490px; white-space: normal; font-size: 46px; line-height: 42px; font-weight: 400; color: #252525; letter-spacing: 0px;font-family:Oxygen,sans-serif;text-transform:capitalize;">
               歡迎光臨</div>
      
              <!-- LAYER NR. 3 -->
              <div class="tp-caption   tp-resizeme" id="slide-74-layer-9" data-x="['left','left','left','left']"
                data-hoffset="['26','50','50','30']" data-y="['top','top','top','top']" data-voffset="['180','140','110','130']"
                data-fontsize="['22','22','22','20']" data-width="['490','490','355','320']" data-height="none" data-whitespace="normal"
                data-type="text" data-responsive_offset="on"
                data-frames='[{"delay":1300,"speed":1000,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power4.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:-50px;opacity:0;","ease":"Power4.easeIn"}]'
                data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
                data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]"
                style="z-index: 7; min-width: 490px; max-width: 490px; white-space: normal; font-size: 22px; line-height: 36px; font-weight: 300; color: #704664; letter-spacing: 0px;font-family:Oxygen,sans-serif;">
                TOYAllHOT </div>
      
              <!-- LAYER NR. 4 -->
              <div class="tp-caption   tp-resizeme" id="slide-74-layer-10" data-x="['left','left','left','left']"
                data-hoffset="['27','50','50','30']" data-y="['top','top','middle','middle']"
                data-voffset="['228','190','0','50']" data-fontsize="['14','14','14','17']"
                data-lineheight="['22','22','22','28']" data-width="['490','490','355','320']" data-height="none"
                data-whitespace="normal" data-type="text" data-responsive_offset="on"
                data-frames='[{"delay":1300,"speed":1000,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power4.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:-50px;opacity:0;","ease":"Power4.easeIn"}]'
                data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
                data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]"
                style="z-index: 8; min-width: 490px; max-width: 490px; white-space: normal; font-size: 14px; line-height: 22px; font-weight: 400; color: #252525; letter-spacing: 0px;font-family:Oxygen,sans-serif;">
                全球最大拍賣購物平台!
              </div>
      
              <!-- LAYER NR. 5 -->
              <a target="_blank" href="<%=request.getContextPath()%>/shop_product/shop.jsp" class="tp-caption rev-btn " id="slide-74-layer-13" data-x="['left','left','left','left']"
                data-hoffset="['28','50','50','30']" data-y="['top','top','top','bottom']"
                data-voffset="['310','280','230','-55']" data-fontsize="['15','15','13','13']"
                data-lineheight="['44','44','40','40']" data-width="none" data-height="none" data-whitespace="nowrap"
                data-visibility="['on','on','on','off']" data-type="button" data-responsive_offset="on" data-responsive="off"
                data-frames='[{"delay":2100,"speed":100,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power4.easeOut"},{"delay":"wait","speed":100,"frame":"999","to":"y:-50px;opacity:0;","ease":"Power1.easeIn"},{"frame":"hover","speed":"0","ease":"Linear.easeNone","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgb(255,255,255);bg:rgb(71,186,193);bc:rgb(71,186,193);"}]'
                data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
                data-paddingright="[25,25,25,25]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[25,25,25,25]"
                style="z-index: 9; white-space: nowrap; font-size: 15px; line-height: 44px; font-weight: 700; color: #252525; letter-spacing: 2px;font-family:Oxygen,sans-serif;text-transform:uppercase;border-color:rgba(71,186,193,0.5);border-style:solid;border-width:3px 3px 3px 3px;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;">
                進入商城 <i class="fa fa-chevron-right"></i> </a>
            </li>
            <!-- SLIDE  -->
            <li data-index="rs-75" data-transition="fade" data-slotamount="default" data-hideafterloop="0"
              data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="300"
              data-thumb="img/home/banner-slider/slider-bg.jpg" data-delay="4000" data-rotate="0" data-saveperformance="off"
              data-title="Slide" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6=""
              data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
              <!-- MAIN IMAGE -->
              <img src="assets/img/home/banner-slider/slider-bg.jpg" alt="slidebg2" data-bgposition="center center" data-bgfit="cover"
                data-bgrepeat="no-repeat" class="rev-slidebg" data-no-retina>
              <!-- LAYERS -->
      
              <!-- LAYER NR. 6 -->
              <div class="tp-caption   tp-resizeme" id="slide-75-layer-15" data-x="['left','left','left','left']"
                data-hoffset="['0','49','40','-120']" data-y="['top','top','top','top']" data-voffset="['0','0','0','0']"
                data-width="none" data-height="none" data-whitespace="nowrap" data-type="image" data-responsive_offset="on"
                data-frames='[{"delay":300,"speed":800,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Back.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:-50px;opacity:0;","ease":"Back.easeInOut"}]'
                data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
                data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]" style="z-index: 5;">
                <img src="<%=request.getContextPath() %>/assets/img/index/big2.jpg" alt="slider-image2" data-ww="['800px','683px','500px','500px']"
                  data-hh="['527px','461px','346','346']" data-no-retina> </div>
      
              <!-- LAYER NR. 7 -->
              <div class="tp-caption   tp-resizeme" id="slide-75-layer-7" data-x="['right','right','right','right']"
                data-hoffset="['-200','-80','-46','-26']" data-y="['top','top','top','top']"
                data-voffset="['110','80','50','65']" data-fontsize="['46','46','36','30']" data-width="['490','490','355','320']"
                data-height="none" data-whitespace="normal" data-type="text" data-responsive_offset="on"
                data-frames='[{"delay":800,"speed":800,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Back.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:-50px;opacity:0;","ease":"Back.easeInOut"}]'
                data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
                data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]"
                style="z-index: 6;  min-width: 490px; max-width: 490px; white-space: normal; font-size: 46px; line-height: 42px; font-weight: 400; color: #252525; letter-spacing: 0px;font-family:Oxygen,sans-serif;text-transform:capitalize;">
                集合啦！動物森友會！ </div>
      
              <!-- LAYER NR. 8 -->
              <div class="tp-caption   tp-resizeme" id="slide-75-layer-9" data-x="['right','right','right','right']"
                data-hoffset="['-200','-80','-46','-26']" data-y="['top','top','top','top']"
                data-voffset="['180','140','110','130']" data-fontsize="['22','22','22','20']" data-width="['490','490','355','320']"
                data-height="none" data-whitespace="normal" data-type="text" data-responsive_offset="on"
                data-frames='[{"delay":1300,"speed":1000,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power4.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:-50px;opacity:0;","ease":"Power4.easeIn"}]'
                data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
                data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]"
                style="z-index: 7; min-width: 490px; max-width: 490px; white-space: normal; font-size: 22px; line-height: 36px; font-weight: 300; color: #704664; letter-spacing: 0px;font-family:Oxygen,sans-serif;">
               	Nintendo Switch </div>
      
              <!-- LAYER NR. 9 -->
              <div class="tp-caption   tp-resizeme" id="slide-75-layer-10" data-x="['right','right','right','right']"
                data-hoffset="['-200','-80','-46','-26']" data-y="['top','top','middle','middle']"
                data-voffset="['228','190','0','50']" data-fontsize="['14','14','13','17']"
                data-lineheight="['22','22','22','28']" data-width="['490','490','355','320']" data-height="none"
                data-whitespace="normal" data-type="text" data-responsive_offset="on"
                data-frames='[{"delay":1300,"speed":1000,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power4.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:-50px;opacity:0;","ease":"Power4.easeIn"}]'
                data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
                data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]"
                style="z-index: 8; min-width: 490px; max-width: 490px; white-space: normal; font-size: 14px; line-height: 22px; font-weight: 400; color: #252525; letter-spacing: 0px;font-family:Oxygen,sans-serif;">
                趕快來買任天堂的遊戲吧
              </div>
      
              <!-- LAYER NR. 10 -->
              <a target="_blank" href="<%=request.getContextPath()%>/shop_product/shop.jsp" class="tp-caption rev-btn " id="slide-75-layer-13" data-x="['right','right','right','right']"
                data-hoffset="['110','40','23','13']" data-y="['top','top','top','bottom']"
                data-voffset="['310','280','230','-55']" data-fontsize="['15','15','13','13']"
                data-lineheight="['44','44','40','40']" data-width="none" data-height="none" data-whitespace="nowrap"
                data-visibility="['on','on','on','off']" data-type="button" data-responsive_offset="on" data-responsive="off"
                data-frames='[{"delay":2100,"speed":100,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power4.easeOut"},{"delay":"wait","speed":100,"frame":"999","to":"y:-50px;opacity:0;","ease":"Power1.easeIn"},{"frame":"hover","speed":"0","ease":"Linear.easeNone","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgb(255,255,255);bg:rgb(71,186,193);bc:rgb(71,186,193);"}]'
                data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
                data-paddingright="[25,25,25,25]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[25,25,25,25]"
                style="z-index: 9; white-space: nowrap; font-size: 15px; line-height: 44px; font-weight: 700; color: #252525; letter-spacing: 2px;font-family:Oxygen,sans-serif;text-transform:uppercase;border-color:rgba(71,186,193,0.5);border-style:solid;border-width:3px 3px 3px 3px;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;">
                趕緊來點名 <i class="fa fa-chevron-right"></i> </a>
            </li>
            <!-- SLIDE  -->
            <li data-index="rs-76" data-transition="fade" data-slotamount="default" data-hideafterloop="0"
              data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="300"
              data-thumb="img/home/banner-slider/slider-bg.jpg" data-delay="4000" data-rotate="0" data-saveperformance="off"
              data-title="Slide" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6=""
              data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
              <!-- MAIN IMAGE -->
              <img src="assets/img/home/banner-slider/slider-bg.jpg" alt="slidebg3" data-bgposition="center center" data-bgfit="cover"
                data-bgrepeat="no-repeat" class="rev-slidebg" data-no-retina>
              <!-- LAYERS -->
      
              <!-- LAYER NR. 11 -->
              <div class="tp-caption   tp-resizeme" id="slide-76-layer-15" data-x="['right','right','right','right']"
                data-hoffset="['-60','-50','-37','-190']" data-y="['middle','middle','middle','middle']"
                data-voffset="['0','25','0','0']" data-width="none" data-height="none" data-whitespace="nowrap"
                data-type="image" data-responsive_offset="on"
                data-frames='[{"delay":300,"speed":800,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Back.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:-50px;opacity:0;","ease":"Back.easeInOut"}]'
                data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
                data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]" style="z-index: 5;">
                <img src="<%=request.getContextPath() %>/assets/img/index/99.png" alt="slider-image3" data-ww="['800px','683px','500px','500px']"
                  data-hh="['527px','461px','346','346']" data-no-retina> </div>
      
              <!-- LAYER NR. 12 -->
              <div class="tp-caption   tp-resizeme" id="slide-76-layer-7" data-x="['left','left','left','left']"
                data-hoffset="['26','50','50','30']" data-y="['top','top','top','top']" data-voffset="['110','80','50','70']"
                data-fontsize="['46','46','36','30']" data-width="['490','490','355','320']" data-height="none" data-whitespace="normal"
                data-type="text" data-responsive_offset="on"
                data-frames='[{"delay":800,"speed":800,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Back.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:-50px;opacity:0;","ease":"Back.easeInOut"}]'
                data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
                data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]"
                style="z-index: 6; min-width: 490px; max-width: 490px; white-space: normal; font-size: 46px; line-height: 42px; font-weight: 400; color: #252525; letter-spacing: 0px;font-family:Oxygen,sans-serif;text-transform:capitalize;">
                小吳老師來跳繩啊! </div>
      
              <!-- LAYER NR. 13 -->
              <div class="tp-caption   tp-resizeme" id="slide-76-layer-9" data-x="['left','left','left','left']"
                data-hoffset="['26','50','50','30']" data-y="['top','top','top','top']" data-voffset="['180','140','110','130']"
                data-fontsize="['22','22','22','20']" data-width="['490','490','355','320']" data-height="none" data-whitespace="normal"
                data-type="text" data-responsive_offset="on"
                data-frames='[{"delay":1300,"speed":1000,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power4.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:-50px;opacity:0;","ease":"Power4.easeIn"}]'
                data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
                data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]"
                style="z-index: 7; min-width: 490px; max-width: 490px; white-space: normal; font-size: 22px; line-height: 36px; font-weight: 300; color: #704664; letter-spacing: 0px;font-family:Oxygen,sans-serif;">
                鯊鯊出沒~~ </div>
      
              <!-- LAYER NR. 14 -->
              <div class="tp-caption   tp-resizeme" id="slide-76-layer-10" data-x="['left','left','left','left']"
                data-hoffset="['29','50','50','30']" data-y="['top','top','middle','middle']"
                data-voffset="['228','190','0','50']" data-fontsize="['14','14','13','17']"
                data-lineheight="['22','22','22','28']" data-width="['490','490','355','320']" data-height="none"
                data-whitespace="normal" data-type="text" data-responsive_offset="on"
                data-frames='[{"delay":1300,"speed":1000,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power4.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:-50px;opacity:0;","ease":"Power4.easeIn"}]'
                data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
                data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]"
                style="z-index: 8; min-width: 490px; max-width: 490px; white-space: normal; font-size: 14px; line-height: 22px; font-weight: 400; color: #252525; letter-spacing: 0px;font-family:Oxygen,sans-serif;">
       ikea鯊魚這裡就有!! </div>
      
              <!-- LAYER NR. 15 -->
              <a target="_blank" href="<%=request.getContextPath()%>/bp-front/listallbp.jsp" class="tp-caption rev-btn " id="slide-76-layer-13" data-x="['left','left','left','left']"
                data-hoffset="['28','50','50','30']" data-y="['top','top','top','bottom']"
                data-voffset="['310','280','230','-55']" data-fontsize="['15','15','13','13']"
                data-lineheight="['44','44','40','40']" data-width="none" data-height="none" data-whitespace="nowrap"
                data-visibility="['on','on','on','off']" data-type="button" data-responsive_offset="on" data-responsive="off"
                data-frames='[{"delay":2100,"speed":100,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power4.easeOut"},{"delay":"wait","speed":100,"frame":"999","to":"y:-50px;opacity:0;","ease":"Power1.easeIn"},{"frame":"hover","speed":"0","ease":"Linear.easeNone","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgb(255,255,255);bg:rgb(71,186,193);bc:rgb(71,186,193);"}]'
                data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
                data-paddingright="[25,25,25,25]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[25,25,25,25]"
                style="z-index: 9; white-space: nowrap; font-size: 15px; line-height: 44px; font-weight: 700; color: #252525; letter-spacing: 2px;font-family:Oxygen,sans-serif;text-transform:uppercase;border-color:rgba(71,186,193,0.5);border-style:solid;border-width:3px 3px 3px 3px;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;">
                點我直購他 <i class="fa fa-chevron-right"></i> </a>
            </li>
          </ul>
          <div class="tp-bannertimer tp-bottom" style="visibility: hidden !important;"></div>
        </div>
      </div>

      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix">
        <div class="container">
          
          <div class="page-header">
            <h4>正在競標中</h4>
          </div>
          
          <div class="row featuredCollection margin-bottom">
            <div class="col-md-4 col-12">
              <div class="thumbnail">
                <div class="imageWrapper">
                  <img src="<%=request.getContextPath() %>/img/BID/B00061.jpg"  alt="feature-collection-image"
                  height="360px" width="350px">
                  <div class="caption">
                      
                  </div>
                  <div class="masking">
                    <a href="<%=request.getContextPath() %>/bid_front_end/BidHome.jsp" class="btn viewBtn">競標出價</a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-4 col-12">
              <div class="thumbnail">
                <div class="imageWrapper">
                  <img src="<%=request.getContextPath() %>/img/BID/B00081.jpg" alt="feature-collection-image"
                   height="360px" width="350px">
                  <div class="caption">
                     
                  </div>
                  <div class="masking">
                    <a href="<%=request.getContextPath() %>/bid_front_end/BidHome.jsp" class="btn viewBtn">競標出價</a>
                  </div>
                </div>
               
              </div>
            </div>
            <div class="col-md-4 col-12">
              <div class="thumbnail">
                <div class="imageWrapper">
                  <img src="<%=request.getContextPath() %>/img/BID/B00101.jpg"  alt="feature-collection-image"
                  height="360px" width="350px">
                  <div class="caption">
                      
                  </div>
                  <div class="masking">
                    <a href="<%=request.getContextPath() %>/bid_front_end/BidHome.jsp" class="btn viewBtn">競標出價</a>
                  </div>
                </div>
                
              </div>
            </div>
          </div>
          
          <div class="page-header">
            <h4>欲交換的玩具</h4>
          </div>
  
          <div class="row featuredProducts featuredProductsSlider margin-bottom">
            <div class="slide col-md-3">
              <div class="productImage clearfix">
                <img src="front_end/changeimage/7002.jpeg" alt="featured-product-img">
                <div class="productMasking">
 
                </div>
              </div>
              <div class="productCaption clearfix">
                <a href="<%=request.getContextPath()%>/front_end/changeindex.jsp">
                  <h4>寶可夢卡牌皮傑(異圖)</h4>
                </a>
                <h3>需求物:寶可夢卡牌色違噴火龍</h3>
              </div>
            </div>
            <div class="slide col-md-3">
              <div class="productImage">
                <img src="front_end/changeimage/7009.jpeg" alt="featured-product-img">
                <div class="productMasking">
   
                </div>
              </div>
              <div class="productCaption">
                <a href="<%=request.getContextPath()%>/front_end/changeindex.jsp">
                  <h4>阿福抱枕</h4>
                </a>
                <h3>需求物:蘭陵王抱枕</h3>
              </div>
            </div>
            <div class="slide col-md-3">
              <div class="productImage">
                <img src="front_end/changeimage/7003.jpeg" alt="featured-product-img">
                <div class="productMasking">

                </div>
              </div>
              <div class="productCaption">
                <a href="<%=request.getContextPath()%>/front_end/changeindex.jsp">
                  <h4>UNO</h4>
                </a>
                <h3>需求物:隨便等值桌遊</h3>
              </div>
            </div>
            <div class="slide col-md-3">
              <div class="productImage">
                <img src="front_end/changeimage/7008.jpeg" alt="featured-product-img">
                <div class="productMasking">
     
                </div>
              </div>
              <div class="productCaption">
                <a href="<%=request.getContextPath()%>/front_end/changeindex.jsp">
                  <h4>G40周年紀念紅薩克</h4>
                </a>
                <h3>需求物:隨便一款樂高</h3>
              </div>
            </div>
          </div>
          
          <!--這裡開始是直購  -->
          <div class="page-header">
            <h4>直接購買玩具</h4>
          </div>
  
          <div class="row featuredProducts featuredProductsSlider margin-bottom">
            <div class="slide col-md-3">
              <div class="productImage clearfix">
                <img src="assets/img/index/15.png" alt="featured-product-img">
                <div class="productMasking">

                </div>
              </div>
              <div class="productCaption clearfix">
                <a href="<%=request.getContextPath()%>/bp-front/TRY1.jsp?800007">
                  <h4>Ikea BLAHAJ</h4>
                </a>
                <h3>$690.00</h3>
              </div>
            </div>
            <div class="slide col-md-3">
              <div class="productImage">
                <img src="imagesbp/800001.png" alt="featured-product-img">
                <div class="productMasking">

                </div>
              </div>
              <div class="productCaption">
                <a href="<%=request.getContextPath()%>/bp-front/TRY1.jsp?800001">
                  <h4>Liv Heart Roomies Shark(L)</h4>
                </a>
                <h3>$5000</h3>
              </div>
            </div>
            <div class="slide col-md-3">
              <div class="productImage">
                <img src="imagesbp/800009.png" alt="featured-product-img">
                <div class="productMasking">

                </div>
              </div>
              <div class="productCaption">
                <a href="<%=request.getContextPath()%>/bp-front/TRY1.jsp?800009">
                  <h4>Dolphin pillow blue (M)</h4>
                </a>
                <h3>$500</h3>
              </div>
            </div>
            <div class="slide col-md-3">
              <div class="productImage">
                <img src="imagesbp/800010.png" alt="featured-product-img">
                <div class="productMasking">
    
                </div>
              </div>
              <div class="productCaption">
                <a href="<%=request.getContextPath()%>/bp-front/TRY1.jsp?800010">
                  <h4>Sun Buddies</h4>
                </a>
                <h3>$500</h3>
              </div>
            </div>

          </div>
          
        </div>
      </section>

     
 <!-- FOOTER -->
    <div  class = "joe">        
			<div class="footer clearfix">
				<div class="container">
					<div class="row">
						<div class="col-md-2 col-12">
							<div class="footerLink">
								<h5>EA102第五組</h5>
								<ul class="list-unstyled">
									<li><a href="#">87分不能再高</a></li>
									<li><a href="#">已知用火</a></li>
									<li><a href="#">潮棒棒der~</a></li>
									<li><a href="#">第五組或成最大贏家</a></li>
									<li><a href="#">小夫我要進來了</a></li>
								
								</ul>
							</div>
						</div>
						<div class="col-md-2 col-12">
							<div class="footerLink">
								<h5>密切合作品牌</h5>
								<ul class="list-unstyled">
                  <li><a href="#">Stack Overflow</a></li>
									<li><a href="#">Google</a></li>					
                  <li><a href="#">GitHub</a></li>	
									<li><a href="#">Yahoo</a></li>
									<li><a href="#">Docker</a></li>
                  
								</ul>
							</div>
						</div>
						<div class="col-md-2 col-12">
							<div class="footerLink">
								<h5>請常唸</h5>
								<ul class="list-unstyled">
									<li><a href="#">咕嚕靈波 </a></li>
									<li><a href="#">阿諾捏阿諾捏 </a></li>
                  <li><a href="#">霹靂卡霹靂拉拉</a></li>
									<li><a href="#">蹦蹦跳姆咪姆咪</a></li>
                  <li><a href="#">姆咪姆咪心動動</a></li>
								</ul>
							</div>
						</div>
						<div class="col-md-2 col-12">
							<div class="footerLink">
								<h5>聯絡我們</h5>
								<ul class="list-unstyled">
									<li>(03)-425-8183</li>
									<li><a href="mailto:support@iamabdus.com">ea102_g5@gmail.com</a></li>
                  <li>桃園市中壢區</li>
                  <li>復興路46號9樓</li>
								</ul>
								<ul class="list-inline">
									<li><a href="#"><i class="fa fa-twitter"></i></a></li>
									<li><a href="#"><i class="fa fa-facebook"></i></a></li>
									<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
									<li><a href="#"><i class="fa fa-vimeo"></i></a></li>
									<li><a href="#"><i class="fa fa-tumblr"></i></a></li>
								</ul>
							</div>
						</div>
						<div class="col-md-4 col-12">
							<div class="newsletter clearfix">
								<h4>貼心小服務</h4>
                <br>
								<!-- <h3>Sign up now</h3> -->
								<p>請輸入您的信箱，我們將每天轉發已過期的優惠資訊給您</p>
								<div class="input-group">
									<input type="text" class="form-control" placeholder="您的信箱" aria-describedby="basic-addon2">
									<a href="#" class="input-group-addon" id="basic-addon2">Go<i class="fa fa-chevron-right"></i></a>
								</div>
							</div>
						</div>
             <!--  <div>
                <p style="color: #ffffff">c 2020 Copyright EA102_Group5. All Rights Reserved</p>
              </div> -->
					</div>
				</div>
			</div>
		</div>	
</div>

		   
		   

		<!-- <script type="text/javascript" src="js/vendor/revslider/public/assets/js/extensions/revolution.extension.layeranimation.min.js"></script>
		<script type="text/javascript" src="js/vendor/revslider/public/assets/js/extensions/revolution.extension.kenburn.min.js"></script>
		<script type="text/javascript" src="js/vendor/revslider/public/assets/js/extensions/revolution.extension.navigation.min.js"></script> -->

			
		

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


		<%@ include file="/bp-front/chat.jsp"%>	 
		<jsp:include page="/assets/memChat3.jsp" flush="true"/> 

		

	</body>
</html>

     