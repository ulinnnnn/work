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
    <title>index.jsp</title>

    <!-- PLUGINS CSS STYLE -->
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet">
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/plugins/selectbox/select_option1.css" rel="stylesheet">
    <link href="assets/plugins/fancybox/jquery.fancybox.min.css" rel="stylesheet">
    <link href="assets/plugins/rateyo/jquery.rateyo.min.css" rel="stylesheet">
    <link href="assets/plugins/iziToast/css/iziToast.css" rel="stylesheet">
    <link href="assets/plugins/prismjs/prism.css" rel="stylesheet">
    <link href="assets/plugins/revolution/css/settings.css" rel="stylesheet">
    <link href="assets/plugins/animate/animate.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="assets/plugins/slick/slick.css" media="screen">
    <link rel="stylesheet" type="text/css" href="assets/plugins/slick/slick-theme.css" media="screen">


    <!-- CUSTOM CSS -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/default.css" id="option_style">
    
    <link rel="stylesheet" href="assets/css/joe_footer.css" >

    <!-- Icons -->
    <link rel="shortcut icon" href="assets/img/favicon.png">


  </head>

  <body id="body" class="body-wrapper version1 up-scroll">

    <div class="main-wrapper">

      <!-- HEADER -->
      <div class="header clearfix">
      
      	<%
			if(memVO == null){      	
      	%>

        <!-- TOPBAR  �n�J�e -->
        <div class="topBar">
          <div class="container">
            <div class="row">
              <div class="col-md-6 d-none d-md-block">

              </div>
              <div class="col-md-6 col-12">
                <ul class="list-inline float-right top-right">
                  <li class="account-login"><span>
                  <a href='<%=request.getContextPath()%>/Front-end/login.jsp'>�n�J</a><small>or</small>
                  <a data-toggle="modal" href='#signup'>���U�b��</a>
                  </span></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <%}%>
        
        <%
        	if(memVO != null) {
        		String mem_no = memVO.getMem_no();
        		DepoService depoSvc = new DepoService();
        		DepoVO depoVO = depoSvc.memNowDepo(mem_no);
        		Integer depo_point = depoVO.getDepo_point();
        %>
        
         <!-- TOPBAR  �n�J�� -->
        <div class="topBar">
          <div class="container">
            <div class="row">
              <div class="col-md-6 d-none d-md-block">

              </div>
              <div class="col-md-6 col-12">
                <ul class="list-inline float-right top-right">
                  <li class="account-login"><span><a data-toggle="modal" href='.login-modal'>�n�X</a></span></li>
                  <li class="searchBox">
                    <a href="#"><i class="fa fa-search"></i></a>
                    <ul class="dropdown-menu">
                      <li>
                        <span class="input-group">
                          <input type="text" class="form-control" placeholder="Search�K" aria-describedby="basic-addon2">
                          <button type="submit" class="input-group-addon">Submit</button>
                        </span>
                      </li>
                    </ul>
                  </li>
       
                  <li class="dropdown cart-dropdown">
                    <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="fa fa-shopping-cart"></i>�ڪ��|��
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right">
                      <li>�|���M��</li>
                      <li>
                        <a href="single-product.html">
                          <div class="media">
                            <img class="media-left media-object" height="80px" width="70px"
                            src="https://cdn2.ettoday.net/images/1416/1416165.jpg">
                            <div class="media-body">
                              <h5 class="media-heading">�|���W�١G<span><%=memVO.getMem_name()%></span></h5>
                              <h5 class="media-heading">�Ѿl�I�ơG<span>NT$ <%=depo_point%>��</span></h5>
                            </div>
                          </div>
                        </a>
                      </li>
                      <li>
                        <div class="btn-group" role="group" aria-label="...">
                          <button type="button" class="btn btn-default" onclick="location.href='cart-page.html';">�i�J�|������</button>
                          <button type="button" class="btn btn-default" onclick="location.href='checkout-step-1.html';">��^</button>
                        </div>
                      </li>
                    </ul>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <%}%>
        

        <!-- NAVBAR -->
        <nav class="navbar navbar-main navbar-default navbar-expand-md navbar-scrollUp navbar-sticky" role="navigation" >
          <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->

            <a class="navbar-brand" href="index.jsp">
            	<img src="assets/img/logo2.png" width="249px" height="46.5px">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".navbar-ex1-collapse" aria-controls="navbar-ex1-collapse" aria-expanded="false" aria-label="Toggle navigation">
              <span class="fa fa-bars"></span>
            </button>


            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
              <ul class="nav navbar-nav ml-auto">
                <li class="nav-item dropdown  active ">
                  <a href="javascript:void(0)" class="dropdown-toggle nav-link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">����</a>
                </li>
                <li class="nav-item dropdown megaDropMenu ">
                  <a href="<%=request.getContextPath()%>/shop_product/shop.jsp" class="dropdown-toggle nav-link" data-hover="dropdown" data-delay="300" data-close-others="true" aria-expanded="false">�ʪ��ӫ�</b></a>             
                </li>
                <li class="nav-item dropdown ">
                  <a href="javascript:void(0)" class="dropdown-toggle nav-link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">����洫</a>
                
                </li>
                <li class="nav-item dropdown ">
                  <a href="javascript:void(0)" class="dropdown-toggle nav-link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">�����v��</a>
                  
                </li>
                <li class="nav-item dropdown ">
                  <a href="javascript:void(0)" class="dropdown-toggle nav-link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">���㪽��</a>
                 
                </li>
                <li class="nav-item dropdown megaDropMenu ">
                  <a href="javascript:void(0)" class="dropdown-toggle nav-link" data-toggle="dropdown" data-hover="dropdown" data-delay="300" data-close-others="true" aria-expanded="false">�׾�</b></a>
                
                </li>
              </ul>
            </div>
           
          </div>
        </nav>
      </div>


      <!-- BANNER -->
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
                <img src="https://store.nintendo.com.hk/media/catalog/product/cache/08244de22d08060bc462ed2f13fdcc18/1/f/1f259b4f92dd441d85b32f03b46e9e1d171a821badfe03b64b7a83e6b2b3e743.jpg" alt="slider-image1" data-ww="['800px','683px','500px','500px']"
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
                �n�� �� �ѱC </div>
      
              <!-- LAYER NR. 3 -->
              <div class="tp-caption   tp-resizeme" id="slide-74-layer-9" data-x="['left','left','left','left']"
                data-hoffset="['26','50','50','30']" data-y="['top','top','top','top']" data-voffset="['180','140','110','130']"
                data-fontsize="['22','22','22','20']" data-width="['490','490','355','320']" data-height="none" data-whitespace="normal"
                data-type="text" data-responsive_offset="on"
                data-frames='[{"delay":1300,"speed":1000,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power4.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:-50px;opacity:0;","ease":"Power4.easeIn"}]'
                data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
                data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]"
                style="z-index: 7; min-width: 490px; max-width: 490px; white-space: normal; font-size: 22px; line-height: 36px; font-weight: 300; color: #704664; letter-spacing: 0px;font-family:Oxygen,sans-serif;">
                �쭵���� </div>
      
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
                ������+�֤k�髬�C�o�ӬO�M�w�ʪ����I�A�ܦh����u�n�g�W����������A�����N�w�g�O�ު��s�b�C
              </div>
      
              <!-- LAYER NR. 5 -->
              <a target="_blank" href="https://wrapbootstrap.com/theme/bigbag-store-elegant-ecommerce-theme-WB0B9JN67" class="tp-caption rev-btn " id="slide-74-layer-13" data-x="['left','left','left','left']"
                data-hoffset="['28','50','50','30']" data-y="['top','top','top','bottom']"
                data-voffset="['310','280','230','-55']" data-fontsize="['15','15','13','13']"
                data-lineheight="['44','44','40','40']" data-width="none" data-height="none" data-whitespace="nowrap"
                data-visibility="['on','on','on','off']" data-type="button" data-responsive_offset="on" data-responsive="off"
                data-frames='[{"delay":2100,"speed":100,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power4.easeOut"},{"delay":"wait","speed":100,"frame":"999","to":"y:-50px;opacity:0;","ease":"Power1.easeIn"},{"frame":"hover","speed":"0","ease":"Linear.easeNone","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgb(255,255,255);bg:rgb(71,186,193);bc:rgb(71,186,193);"}]'
                data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
                data-paddingright="[25,25,25,25]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[25,25,25,25]"
                style="z-index: 9; white-space: nowrap; font-size: 15px; line-height: 44px; font-weight: 700; color: #252525; letter-spacing: 2px;font-family:Oxygen,sans-serif;text-transform:uppercase;border-color:rgba(71,186,193,0.5);border-style:solid;border-width:3px 3px 3px 3px;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;">
                �ѱC�ڦ^�ӤF <i class="fa fa-chevron-right"></i> </a>
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
                <img src="https://i1.hdslb.com/bfs/archive/c71af4f90da278002bea8f7ecd15f11cac40fe15.jpg" alt="slider-image2" data-ww="['800px','683px','500px','500px']"
                  data-hh="['527px','461px','346','346']" data-no-retina> </div>
      
              <!-- LAYER NR. 7 -->
              <div class="tp-caption   tp-resizeme" id="slide-75-layer-7" data-x="['right','right','right','right']"
                data-hoffset="['100','40','23','13']" data-y="['top','top','top','top']"
                data-voffset="['110','80','50','65']" data-fontsize="['46','46','36','30']" data-width="['490','490','355','320']"
                data-height="none" data-whitespace="normal" data-type="text" data-responsive_offset="on"
                data-frames='[{"delay":800,"speed":800,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Back.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:-50px;opacity:0;","ease":"Back.easeInOut"}]'
                data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
                data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]"
                style="z-index: 6;  min-width: 490px; max-width: 490px; white-space: normal; font-size: 46px; line-height: 42px; font-weight: 400; color: #252525; letter-spacing: 0px;font-family:Oxygen,sans-serif;text-transform:capitalize;">
                �n�� �� ���f�f </div>
      
              <!-- LAYER NR. 8 -->
              <div class="tp-caption   tp-resizeme" id="slide-75-layer-9" data-x="['right','right','right','right']"
                data-hoffset="['100','40','23','13']" data-y="['top','top','top','top']"
                data-voffset="['180','140','110','130']" data-fontsize="['22','22','22','20']" data-width="['490','490','355','320']"
                data-height="none" data-whitespace="normal" data-type="text" data-responsive_offset="on"
                data-frames='[{"delay":1300,"speed":1000,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power4.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:-50px;opacity:0;","ease":"Power4.easeIn"}]'
                data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
                data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]"
                style="z-index: 7; min-width: 490px; max-width: 490px; white-space: normal; font-size: 22px; line-height: 36px; font-weight: 300; color: #704664; letter-spacing: 0px;font-family:Oxygen,sans-serif;">
                �ԩi </div>
      
              <!-- LAYER NR. 9 -->
              <div class="tp-caption   tp-resizeme" id="slide-75-layer-10" data-x="['right','right','right','right']"
                data-hoffset="['100','40','23','13']" data-y="['top','top','middle','middle']"
                data-voffset="['228','190','0','50']" data-fontsize="['14','14','13','17']"
                data-lineheight="['22','22','22','28']" data-width="['490','490','355','320']" data-height="none"
                data-whitespace="normal" data-type="text" data-responsive_offset="on"
                data-frames='[{"delay":1300,"speed":1000,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power4.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:-50px;opacity:0;","ease":"Power4.easeIn"}]'
                data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
                data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]"
                style="z-index: 8; min-width: 490px; max-width: 490px; white-space: normal; font-size: 14px; line-height: 22px; font-weight: 400; color: #252525; letter-spacing: 0px;font-family:Oxygen,sans-serif;">
                �@���H�¦⬰��ժ����,�Y�W�O�զ�U���C �k���˸g�L�S���y,��֤k�ֲӪ��ӻH���S�F�X��,�t�W�u��,���骺���u�����M���a��{�F�X��,�Ʀܦ��I�������Pı�C
              </div>
      
              <!-- LAYER NR. 10 -->
              <a target="_blank" href="https://wrapbootstrap.com/theme/bigbag-store-elegant-ecommerce-theme-WB0B9JN67" class="tp-caption rev-btn " id="slide-75-layer-13" data-x="['center','center','center','left']"
                data-hoffset="['77','65','83','30']" data-y="['top','top','top','bottom']"
                data-voffset="['310','280','230','-55']" data-fontsize="['15','15','13','13']"
                data-lineheight="['44','44','40','40']" data-width="none" data-height="none" data-whitespace="nowrap"
                data-visibility="['on','on','on','off']" data-type="button" data-responsive_offset="on" data-responsive="off"
                data-frames='[{"delay":2100,"speed":100,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power4.easeOut"},{"delay":"wait","speed":100,"frame":"999","to":"y:-50px;opacity:0;","ease":"Power1.easeIn"},{"frame":"hover","speed":"0","ease":"Linear.easeNone","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgb(255,255,255);bg:rgb(71,186,193);bc:rgb(71,186,193);"}]'
                data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
                data-paddingright="[25,25,25,25]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[25,25,25,25]"
                style="z-index: 9; white-space: nowrap; font-size: 15px; line-height: 44px; font-weight: 700; color: #252525; letter-spacing: 2px;font-family:Oxygen,sans-serif;text-transform:uppercase;border-color:rgba(71,186,193,0.5);border-style:solid;border-width:3px 3px 3px 3px;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;">
                �ӧڮa�g�@�~ <i class="fa fa-chevron-right"></i> </a>
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
                <img src="https://s.zimedia.com.tw/s/ztHeGx-0" alt="slider-image3" data-ww="['800px','683px','500px','500px']"
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
                �n�� �� �~�J��H </div>
      
              <!-- LAYER NR. 13 -->
              <div class="tp-caption   tp-resizeme" id="slide-76-layer-9" data-x="['left','left','left','left']"
                data-hoffset="['26','50','50','30']" data-y="['top','top','top','top']" data-voffset="['180','140','110','130']"
                data-fontsize="['22','22','22','20']" data-width="['490','490','355','320']" data-height="none" data-whitespace="normal"
                data-type="text" data-responsive_offset="on"
                data-frames='[{"delay":1300,"speed":1000,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power4.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"y:-50px;opacity:0;","ease":"Power4.easeIn"}]'
                data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
                data-paddingright="[0,0,0,0]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]"
                style="z-index: 7; min-width: 490px; max-width: 490px; white-space: normal; font-size: 22px; line-height: 36px; font-weight: 300; color: #704664; letter-spacing: 0px;font-family:Oxygen,sans-serif;">
                �p�i </div>
      
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
                �@���H�¦⬰��ժ����,�Y�W�O�զ�U��,���B����V�B�v��M����~�M�j�j���o�X�G�@��,�ݳ���_�j�j�ԩi�n��[�׺��C </div>
      
              <!-- LAYER NR. 15 -->
              <a target="_blank" href="https://wrapbootstrap.com/theme/bigbag-store-elegant-ecommerce-theme-WB0B9JN67" class="tp-caption rev-btn " id="slide-76-layer-13" data-x="['left','left','left','left']"
                data-hoffset="['28','50','50','30']" data-y="['top','top','top','bottom']"
                data-voffset="['310','280','230','-55']" data-fontsize="['15','15','13','13']"
                data-lineheight="['44','44','40','40']" data-width="none" data-height="none" data-whitespace="nowrap"
                data-visibility="['on','on','on','off']" data-type="button" data-responsive_offset="on" data-responsive="off"
                data-frames='[{"delay":2100,"speed":100,"frame":"0","from":"y:-50px;opacity:0;","to":"o:1;","ease":"Power4.easeOut"},{"delay":"wait","speed":100,"frame":"999","to":"y:-50px;opacity:0;","ease":"Power1.easeIn"},{"frame":"hover","speed":"0","ease":"Linear.easeNone","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgb(255,255,255);bg:rgb(71,186,193);bc:rgb(71,186,193);"}]'
                data-textAlign="['inherit','inherit','inherit','inherit']" data-paddingtop="[0,0,0,0]"
                data-paddingright="[25,25,25,25]" data-paddingbottom="[0,0,0,0]" data-paddingleft="[25,25,25,25]"
                style="z-index: 9; white-space: nowrap; font-size: 15px; line-height: 44px; font-weight: 700; color: #252525; letter-spacing: 2px;font-family:Oxygen,sans-serif;text-transform:uppercase;border-color:rgba(71,186,193,0.5);border-style:solid;border-width:3px 3px 3px 3px;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;">
                �ѱC���b�a <i class="fa fa-chevron-right"></i> </a>
            </li>
          </ul>
          <div class="tp-bannertimer tp-bottom" style="visibility: hidden !important;"></div>
        </div>
      </div>

      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix">
        <div class="container">
          
          <div class="page-header">
            <h4>���b�v�Ф�</h4>
          </div>
          
          <div class="row featuredCollection margin-bottom">
            <div class="col-md-4 col-12">
              <div class="thumbnail" onclick="location.href='single-product.html';">
                <div class="imageWrapper">
                  <img src="https://cf.shopee.tw/file/be4d2906796ccdbcd682ea33c6286aa0" alt="feature-collection-image"
                  height="360px" width="350px">
                  <div class="caption">
                      <h3>switch�ˤ�</h3>
                      <small>�̰��X�� NT$ 6600</small>
                  </div>
                  <div class="masking">
                    <a href="product-grid-left-sidebar.html" class="btn viewBtn">�v�ХX��</a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-4 col-12">
              <div class="thumbnail" onclick="location.href='single-product.html';">
                <div class="imageWrapper">
                  <img src="https://cf.shopee.tw/file/1dd51dc534cef8b426e8b8ade9a5abbc" alt="feature-collection-image"
                   height="360px" width="350px">
                  <div class="caption">
                      <h3>�ʪ��ˤͷ|</h3>
                      <small>�̰��X�� NT$ 12600</small>
                  </div>
                  <div class="masking">
                    <a href="product-grid-left-sidebar.html" class="btn viewBtn">�v�ХX��</a>
                  </div>
                </div>
               
              </div>
            </div>
            <div class="col-md-4 col-12">
              <div class="thumbnail" onclick="location.href='single-product.html';">
                <div class="imageWrapper">
                  <img src="https://www.chiphell.com/forum.php?mod=image&aid=7245200&size=900x900&key=909625a0ed1e16c9&type=fixnone" alt="feature-collection-image"
                  height="360px" width="350px">
                  <div class="caption">
                      <h3>�氨���쭵</h3>
                      <small>�̰��X�� NT$ 366000</small>
                  </div>
                  <div class="masking">
                    <a href="product-grid-left-sidebar.html" class="btn viewBtn">�v�ХX��</a>
                  </div>
                </div>
                
              </div>
            </div>
          </div>
          
          <div class="page-header">
            <h4>���洫������</h4>
          </div>
  
          <div class="row featuredProducts featuredProductsSlider margin-bottom">
            <div class="slide col-md-3">
              <div class="productImage clearfix">
                <img src="assets/img/home/featured-product/product-01.jpg" alt="featured-product-img">
                <div class="productMasking">
                  <ul class="list-inline btn-group" role="group">
                    <li><a class="btn btn-default btn-wishlist"><i class="fa fa-heart-o"></i></a></li>
                    <li><a href="javascript:void(0)" class="btn btn-default" data-toast data-toast-type="success" data-toast-position="topRight" data-toast-icon="icon-circle-check" data-toast-title="Product" data-toast-message="successfuly added to cart!"><i class="fa fa-shopping-basket"></i></a></li>
                    <li><a data-toggle="modal" href=".quick-view" class="btn btn-default"><i class="fa fa-eye"></i></a></li>
                  </ul>
                </div>
              </div>
              <div class="productCaption clearfix">
                <a href="single-product.html">
                  <h4>Nike Sportswear</h4>
                </a>
                <h3>$199.00</h3>
              </div>
            </div>
            <div class="slide col-md-3">
              <div class="productImage">
                <img src="assets/img/home/featured-product/product-02.jpg" alt="featured-product-img">
                <div class="productMasking">
                  <ul class="list-inline btn-group" role="group">
                    <li><a class="btn btn-default btn-wishlist"><i class="fa fa-heart-o"></i></a></li>
                    <li><a href="javascript:void(0)" class="btn btn-default" data-toast data-toast-type="success" data-toast-position="topRight" data-toast-icon="icon-circle-check" data-toast-title="Product" data-toast-message="successfuly added to cart!" class="btn btn-default"><i class="fa fa-shopping-basket"></i></a></li>
                    <li><a data-toggle="modal" href=".quick-view" class="btn btn-default"><i class="fa fa-eye"></i></a></li>
                  </ul>
                </div>
              </div>
              <div class="productCaption">
                <a href="single-product.html">
                  <h4>Dip Dyed Sweater</h4>
                </a>
                <h3>$149.00</h3>
              </div>
            </div>
            <div class="slide col-md-3">
              <div class="productImage">
                <img src="assets/img/home/featured-product/product-03.jpg" alt="featured-product-img">
                <div class="productMasking">
                  <ul class="list-inline btn-group" role="group">
                    <li><a class="btn btn-default btn-wishlist"><i class="fa fa-heart-o"></i></a></li>
                    <li><a href="javascript:void(0)" class="btn btn-default" data-toast data-toast-type="success" data-toast-position="topRight" data-toast-icon="icon-circle-check" data-toast-title="Product" data-toast-message="successfuly added to cart!" class="btn btn-default"><i class="fa fa-shopping-basket"></i></a></li>
                    <li><a data-toggle="modal" href=".quick-view" class="btn btn-default"><i class="fa fa-eye"></i></a></li>
                  </ul>
                </div>
              </div>
              <div class="productCaption">
                <a href="single-product.html">
                  <h4>Scarf Ring Corner</h4>
                </a>
                <h3>$79</h3>
              </div>
            </div>
            <div class="slide col-md-3">
              <div class="productImage">
                <img src="assets/img/home/featured-product/product-04.jpg" alt="featured-product-img">
                <div class="productMasking">
                  <ul class="list-inline btn-group" role="group">
                    <li><a class="btn btn-default btn-wishlist"><i class="fa fa-heart-o"></i></a></li>
                    <li><a href="javascript:void(0)" class="btn btn-default" data-toast data-toast-type="success" data-toast-position="topRight" data-toast-icon="icon-circle-check" data-toast-title="Product" data-toast-message="successfuly added to cart!" class="btn btn-default"><i class="fa fa-shopping-basket"></i></a></li>
                    <li><a data-toggle="modal" href=".quick-view" class="btn btn-default"><i class="fa fa-eye"></i></a></li>
                  </ul>
                </div>
              </div>
              <div class="productCaption">
                <a href="single-product.html">
                  <h4>Sun Buddies</h4>
                </a>
                <h3>$109</h3>
              </div>
            </div>
            <div class="slide col-md-3">
              <div class="productImage">
                <img src="assets/img/home/featured-product/product-05.jpg" alt="featured-product-img">
                <div class="productMasking">
                  <ul class="list-inline btn-group" role="group">
                    <li><a class="btn btn-default btn-wishlist"><i class="fa fa-heart-o"></i></a></li>
                    <li><a href="javascript:void(0)" class="btn btn-default" data-toast data-toast-type="success" data-toast-position="topRight" data-toast-icon="icon-circle-check" data-toast-title="Product" data-toast-message="successfuly added to cart!" class="btn btn-default"><i class="fa fa-shopping-basket"></i></a></li>
                    <li><a data-toggle="modal" href=".quick-view" class="btn btn-default"><i class="fa fa-eye"></i></a></li>
                  </ul>
                </div>
              </div>
              <div class="productCaption">
                <a href="single-product.html">
                  <h4>Scarf Ring Corner</h4>
                </a>
                <h3>$79</h3>
              </div>
            </div>
            <div class="slide col-md-3">
              <div class="productImage">
                <img src="assets/img/home/featured-product/product-06.jpg" alt="featured-product-img">
                <div class="productMasking">
                  <ul class="list-inline btn-group" role="group">
                    <li><a class="btn btn-default btn-wishlist"><i class="fa fa-heart-o"></i></a></li>
                    <li><a href="javascript:void(0)" class="btn btn-default" data-toast data-toast-type="success" data-toast-position="topRight" data-toast-icon="icon-circle-check" data-toast-title="Product" data-toast-message="successfuly added to cart!" class="btn btn-default"><i class="fa fa-shopping-basket"></i></a></li>
                    <li><a data-toggle="modal" href=".quick-view" class="btn btn-default"><i class="fa fa-eye"></i></a></li>
                  </ul>
                </div>
              </div>
              <div class="productCaption">
                <a href="single-product.html">
                  <h4>Scarf Ring Corner</h4>
                </a>
                <h3>$79</h3>
              </div>
            </div>
            <div class="slide col-md-3">
              <div class="productImage">
                <img src="assets/img/home/featured-product/product-07.jpg" alt="featured-product-img">
                <div class="productMasking">
                  <ul class="list-inline btn-group" role="group">
                    <li><a class="btn btn-default btn-wishlist"><i class="fa fa-heart-o"></i></a></li>
                    <li><a href="javascript:void(0)" class="btn btn-default" data-toast data-toast-type="success" data-toast-position="topRight" data-toast-icon="icon-circle-check" data-toast-title="Product" data-toast-message="successfuly added to cart!" class="btn btn-default"><i class="fa fa-shopping-basket"></i></a></li>
                    <li><a data-toggle="modal" href=".quick-view" class="btn btn-default"><i class="fa fa-eye"></i></a></li>
                  </ul>
                </div>
              </div>
              <div class="productCaption">
               <a href="single-product.html">
                  <h4>Scarf Ring Corner</h4>
                </a>
                <h3>$79</h3>
              </div>
            </div>
            <div class="slide col-md-3">
              <div class="productImage">
                <img src="assets/img/home/featured-product/product-09.jpg" alt="featured-product-img">
                <div class="productMasking">
                  <ul class="list-inline btn-group" role="group">
                    <li><a class="btn btn-default btn-wishlist"><i class="fa fa-heart-o"></i></a></li>
                    <li><a href="javascript:void(0)" class="btn btn-default" data-toast data-toast-type="success" data-toast-position="topRight" data-toast-icon="icon-circle-check" data-toast-title="Product" data-toast-message="successfuly added to cart!" class="btn btn-default"><i class="fa fa-shopping-basket"></i></a></li>
                    <li><a data-toggle="modal" href=".quick-view" class="btn btn-default"><i class="fa fa-eye"></i></a></li>
                  </ul>
                </div>
              </div>
              <div class="productCaption">
               <a href="single-product.html">
                  <h4>Scarf Ring Corner</h4>
                </a>
                <h3>$79</h3>
              </div>
            </div>
          </div>
           
          <div class="page-header">
            <h4>�̷s�峹</h4>
          </div>
          <div class="row latestArticles">
            <div class="col-md-4">
              <div class="thumbnail">
                <a href="blog-single-right-sidebar.html">
                  <img src="assets/img/home/articles/articles-01.jpg" alt="article-image">
                </a>
                <div class="date-holder">
                  <p>08</p>
                  <span>NOV</span>
                </div>
                <h5><a href="blog-single-right-sidebar.html">Leo Vitae Nibh Malesuada.</a></h5>
                <span class="meta"> by <a class="pr-1" href="#">Abdus</a> / <a class="pl-1" href="blog-single-right-sidebar.html">5 Comments</a></span>
                <div class="caption">
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque convallis nulla sed turpis pharetra pretium nec eu sem.</p>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="thumbnail">
                <a href="blog-single-right-sidebar.html">
                  <img src="assets/img/home/articles/articles-02.jpg" alt="article-image">
                </a>
                <div class="date-holder">
                  <p>29</p>
                  <span>OCT</span>
                </div>
                <h5><a href="blog-single-right-sidebar.html">Malesuada Pulvinar Quis Fring.</a></h5>
                <span class="meta"> by <a class="pr-1" href="#">Abdus</a> / <a class="pl-1" href="blog-single-right-sidebar.html">4 Comments</a></span>
                <div class="caption">
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque convallis nulla sed turpis pharetra pretium nec eu sem.</p>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="thumbnail">
                <a href="blog-single-right-sidebar.html">
                  <img src="assets/img/home/articles/articles-03.jpg" alt="article-image">
                </a>
                <div class="date-holder">
                  <p>15</p>
                  <span>Sep</span>
                </div>
                <h5><a href="blog-single-right-sidebar.html">Proin Lectus Sed Tincidunt Auctor.</a></h5>
                <span class="meta"> by <a class="pr-1" href="#">Abdus</a> / <a class="pl-1" href="blog-single-right-sidebar.html">3 Comments</a></span>
                <div class="caption">
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque convallis nulla sed turpis pharetra pretium nec eu sem.</p>
                </div>
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
								<h5>EA102�Ĥ���</h5>
								<ul class="list-unstyled">
									<li><a href="#">87������A��</a></li>
									<li><a href="#">�w���Τ�</a></li>
									<li><a href="#">��δ�der~</a></li>
									<li><a href="#">�Ĥ��թΦ��̤jĹ�a</a></li>
									<li><a href="#">�p�ҧڭn�i�ӤF</a></li>
								
								</ul>
							</div>
						</div>
						<div class="col-md-2 col-12">
							<div class="footerLink">
								<h5>�K���X�@�~�P</h5>
								<ul class="list-unstyled">
                  <li><a href="#">Stack Overflow</a></li>
									<li><a href="#">Google</a></li>					
                  <li><a href="#">GitHub</a></li>	
									<li><a href="#">Pornhub</a></li>
									<li><a href="#">Xvideos</a></li>
                  
								</ul>
							</div>
						</div>
						<div class="col-md-2 col-12">
							<div class="footerLink">
								<h5>�б`��</h5>
								<ul class="list-unstyled">
									<li><a href="#">�B�P�F�i </a></li>
									<li><a href="#">���ծ����ծ� </a></li>
                  <li><a href="#">�R�E�d�R�E�ԩ�</a></li>
									<li><a href="#">���۸��i�}�i�}</a></li>
                  <li><a href="#">�i�}�i�}�߰ʰ�</a></li>
								</ul>
							</div>
						</div>
						<div class="col-md-2 col-12">
							<div class="footerLink">
								<h5>�p���ڭ�</h5>
								<ul class="list-unstyled">
									<li>(03)-425-8183</li>
									<li><a href="mailto:support@iamabdus.com">ea102_g5@gmail.com</a></li>
                  <li>��饫���c��</li>
                  <li>�_����46��9��</li>
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
								<h4>�K�ߤp�A��</h4>
                <br>
								<!-- <h3>Sign up now</h3> -->
								<p>�п�J�z���H�c�A�ڭ̱N�C����o�w�L�����u�f��T���z</p>
								<div class="input-group">
									<input type="text" class="form-control" placeholder="�z���H�c" aria-describedby="basic-addon2">
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

		

		<script type="text/javascript" src="js/vendor/revslider/public/assets/js/extensions/revolution.extension.layeranimation.min.js"></script>
		<script type="text/javascript" src="js/vendor/revslider/public/assets/js/extensions/revolution.extension.kenburn.min.js"></script>
		<script type="text/javascript" src="js/vendor/revslider/public/assets/js/extensions/revolution.extension.navigation.min.js"></script>


		<script src="assets/plugins/jquery/jquery.min.js"></script>
		<script src="assets/plugins/jquery/jquery-migrate-3.0.0.min.js"></script>
		<script src="assets/plugins/jquery-ui/jquery-ui.js"></script>
		<script src="assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="assets/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
		<script src="assets/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
		<script src="assets/plugins/slick/slick.js"></script>
		<script src="assets/plugins/fancybox/jquery.fancybox.min.js"></script>
		<script src="assets/plugins/iziToast/js/iziToast.js"></script>
		<script src="assets/plugins/prismjs/prism.js"></script>
		<script src="assets/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
		<script src="assets/plugins/countdown/jquery.syotimer.js"></script>
		<script src="assets/plugins/velocity/velocity.min.js"></script>
		<script src="assets/plugins/rateyo/jquery.rateyo.min.js"></script>
		<script src="assets/js/custom.js"></script>



		

	</body>
</html>

     