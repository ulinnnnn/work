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
    <title>�|���ӽ� -ToyAllHot Store</title>
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
	                    ['�x�_��', '100������', '103�j�P��', '104���s��', '105�Q�s��', '106�j�w��', '108�U�ذ�', '110�H�q��', '111�h�L��', '112�_���', '114�����', '115�n���', '116��s��'],
	                    ['�x�_��', '207�U���m', '208���s�m', '220�O����', '221���', '222�`�|�m', '223����m', '224�����', '226���˶m', '227���˶m', '228�^�d�m', '231�s����', '232�W�L�m', '233�Q�Ӷm', '234�éM��', '235���M��', '236�g����', '237�T�l��', '238��L��', '239�a�q��', '241�T����', '242�s����', '243���s�m', '244�L�f�m', '247Ī�w��', '248���Ѷm', '248�s����', '249�K���m', '251�H����', '252�T�۶m', '253�۪��m'],
	                    ['�x����', '400����', '401�F��', '402�n��', '403���', '404�_��', '406�_�ٰ�', '407��ٰ�', '408�n�ٰ�'],
	                    ['�x����', '411�ӥ���', '412�j����', '413���p�m', '414�Q��m', '420�׭쥫', '421�Z���m', '422�۩��m', '423�F����', '424�M���m', '426�s���m', '427��l�m', '428�j���m', '429�����m', '432�j�{�m', '433�F����', '434�s���m', '435�����', '436�M����', '437�j����', '438�~�H�m', '439�j�w�m'],
	                    ['�x�F��', '950�x�F��', '951��q�m', '952�����m', '953�����m', '954���n�m', '955�����m', '956���s��', '957���ݶm', '958���W�m', '959�F�e�m', '961���\��', '962���ضm', '963�ӳ¨��m', '964���p�m', '965�j�Z�m', '966�F���m'],
	                    ['�x�n��', '700�����', '701�F��', '702�n��', '704�_��', '708�w����', '709�w�n��'],
	                    ['�x�n��', '710�ñd��', '711�k���m', '712�s����', '713����m', '714�ɤ��m', '715����m', '716�n�ƶm', '717���w�m', '718���q�m', '719�s�T�m', '720�x�жm', '721�¨���', '722�Ψ���', '723���m', '724�C�Ѷm', '725�N�x�m', '726�ǥ���', '727�_���m', '730�s�祫', '731����m', '732�ժe��', '733�F�s�m', '734���Ҷm', '735�U��m', '736�h��m', '737�Q����', '741������', '741�s���m', '742�j���m', '743�s�W�m', '744�s���m', '745�w�w�m'],
	                    ['�y����', '260�y����', '261�Y����', '262�G�˶m', '263����m', '264���s�m', '265ù�F��', '266�T�P�m', '267�j�P�m', '268�����m', '269�V�s�m', '270Ĭ�D��', '272�n�D�m', '290�����x'],
	                    ['�Ὤ��', '970�Ὤ��', '971�s���m', '972�q�L�m', '973�N�w�m', '974���׶m', '975��L��', '976���_�m', '977���ضm', '978���J�m', '979�U�a�m', '981�ɨ���', '982���˶m', '983�I���m'],
	                    ['������', '890���F��', '891������', '892����m', '893������', '894�P���m', '896�Q���m'],
	                    ['�n�뿤', '540�n�륫', '541���d�m', '542�����', '544��m�m', '545�H����', '546���R�m', '551�W���m', '552������', '553�����m', '555�����m', '556�H�q�m', '557�ˤs��', '558�����m'],
	                    ['�n���q', '817�F�F�s�q', '819�n�F�s�q'],
	                    ['�̪F��', '900�̪F��', '901�T�a���m', '902���x�m', '903���a�m', '904�E�p�m', '905����m', '906����m', '907�Q�H�m', '908���v�m', '909�ﬥ�m', '911�˥жm', '912���H�m', '913�U���m', '920��{��', '921���Z�m', '922�Ӹq�m', '923�U�r�m', '924�r���m', '925�s��m', '926�n�{�m', '927�L��m', '928�F����', '929�[�y�m', '931�ΥV�m', '932�s��m', '940�D�d�m', '941�D�s�m', '942�K��m', '943��l�m', '944�����m', '945�d���m', '946��K��', '947���{�m'],
	                    ['�]�߿�', '350�˫n��', '351�Y����', '352�T�W�m', '353�n�ܶm', '354���m', '356���s��', '357�q�]��', '358�b����', '360�]�ߥ�', '361�y���m', '362�Y�ζm', '363���]�m', '364�j��m', '365���w�m', '366���r�m', '367�T�q�m', '368���m', '369������'],
	                    ['��鿤', '320���c��', '324����', '325�s��m', '326������', '327�s�ζm', '328�[���m', '330��饫', '333�t�s�m', '334�K�w��', '335�j����', '336�_���m', '337�j��m', '338Ī�˶m'],
	                    ['������', '800�s����', '801�e����', '802�d����', '803�Q�L��', '804���s��', '805�X�z��', '806�e���', '807�T����', '811�����', '812�p���', '813�����', '817�F�F�s�q', '819�n�F�s�q'],
	                    ['������', '814���Z�m', '815�j���m', '820���s��', '821���˶m', '822�����m', '823�мd�m', '824�P�_�m', '825���Y�m', '826��x�m', '827�����m', '828�æw�m', '829�򤺶m', '830��s��', '831�j�d�m', '832�L��m', '833���Q�m', '840�j��m', '842�X�s��', '843���@��', '844���t�m', '845�����m', '846���L�m', '847�ҥP�m', '848�緽�m', '849�����L�m', '851�Z�L�m', '852�X�_�m'],
	                    ['�򶩥�', '200���R��', '201�H�q��', '202������', '203���s��', '204�w�ְ�', '205�x�x��', '206�C����'],
	                    ['�s����', '209�n��m', '210�_��m', '211�����m', '212�F�޶m'],
	                    ['�����x', '290�����x'],
	                    ['���L��', '630��n��', '631�j��m', '632�����', '633�g�w��', '634�ǩ��m', '635�F�նm', '636�x��m', '637�[�I�m', '638���d�m', '640�椻��', '643�L���m', '646�j�|�m', '647�l��m', '648������', '649�G�[�m', '651�_����', '652���L�m', '653�f��m', '654�|��m', '655�����m'],
	                    ['�s�˥�', '300�_��', '300�F��', '300���s��'],
	                    ['�s�˿�', '300�_�s�m', '302�˥_��', '303��f�m', '304�s�׶m', '305�s�H��', '306������', '307�|�L�m', '308�_�s�m', '310�˪F��', '311���p�m', '312��s�m', '313�y�۶m', '314�_�H�m', '315�o�ܶm'],
	                    ['�Ÿq��', '600���', '600�F��'],
	                    ['�Ÿq��', '602�f���m', '603���s�m', '604�˱T�m', '605�����s�m', '606���H�m', '607�j�H�m', '608���W�m', '611����m', '612�ӫO��', '613���l��', '614�F�۶m', '615���}�m', '616�s��m', '621�����m', '622�j�L��', '623�ˤf�m', '624�q�˶m', '625���U��'],
	                    ['���ƿ�', '500���ƥ�', '502���m', '503��¶m', '504�q���m', '505������', '506�ֿ��m', '507�u��m', '508�M����', '509����m', '510���L��', '511���Y�m', '512�ùt�m', '513�H�߶m', '514�˴���', '515�j���m', '516�H�Q�m', '520�Ф���', '521�_����', '522�Ч��m', '523���Y�m', '524�˦{�m', '525�˶�m', '526�G�L��', '527�j���m', '528�ڭb�m', '530�G���m'],
	                    ['���', '880������', '881�����m', '882��w�m', '883�C���m', '884�ըF�m', '885���m']
	                  ]
	    ,

	    defaultOptionCityText: '�п�ܿ���',
	    defaultOptionCityValue: '',
	    defaultOptionAreaText: '�п�ܶm��',
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
                <h2>�|���ӽ�</h2>
              </div>
            </div>
            <div class="col-md-6">
              <ol class="breadcrumb float-right">
                <li>
                  <a href="<%=request.getContextPath() %>/index1.jsp">����</a>
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
                      <label for="">�m�W</label>
                      <input id="mem_name" name="mem_name"type="text" class="form-control" id="mem_name" placeholder="�п�J�m�W"value="<%=(memVO==null)?"":memVO.getMem_name() %>">
                    </div>
                    <div class="form-group" id="ac123">
                      <label for="">�b��</label>
                      <input name="mem_account" type="text" class="form-control" id="insertAccount" placeholder="�п�J�b��"value="<%=(memVO==null)?"":memVO.getMem_account() %>">
                    </div>
                    <div class="form-group">
                      <label for="">�K�X</label>
                      <input id="mem_pwd" name="mem_pwd" type="password" class="form-control" id="mem_pwd"placeholder="�п�J�K�X"value="<%=(memVO==null)?"":memVO.getMem_pwd() %>">
                    </div>
                    <div class="form-group">
                      <label for="">Email</label>
                      <input name="mem_email"type="email" class="form-control" id="insertEmail"placeholder="�п�JEMAIL"value="<%=(memVO==null)?"":memVO.getMem_email() %>">
                    </div>
                    </div>
                     <div class="col-md-6" style="position:relative;">
                    <div class="form-group">
                      <label for="">�s���q��</label>
                      <input id="mem_phone" name="mem_phone"type="text" class="form-control" id="mem_phone" placeholder="�п�J�s���q��"value="<%=(memVO==null)?"":memVO.getMem_phone() %>">
                    </div>
                    <div class="form-group">
                      <label for="">�X�ͤ��</label>
                      <input id="mem_born" name="mem_born" type="text" class="form-control" id="date_of_birth" placeholder="�п�ܥX�ͤ��"value="<%=(memVO==null)?"":memVO.getMem_born() %>">
                    </div>
                     <div class="form-group">
                      <label for="">�ʧO</label> 
                      <select size="1" name="mem_sex"class="form-control">
                      <option value="�k">�k
                      <option value="�k">�k
                      </select>
                    </div>
                    <div class="form-group">
                      <label for="">�Ȧ�b��</label>
                      <input id="mem_bank" name="mem_bank"type="text" class="form-control" id="mem_bank"placeholder="�п�J�Ȧ�b��"value="<%=(memVO==null)?"":memVO.getMem_bank() %>">
                    </div>
                    <div class="form-group">
                      <label i for="">�p���a�}</label>
                     <select name="mem_addr1" id="country"class="form-control" ></select>
					 <select name="mem_addr2" id="urbanArea"class="form-control"></select>
                      <input name="mem_addr3" id="road"type="text" class="form-control" id="" placeholder="�п�J�z���a�}"value="<%=(memVO==null)?"":memVO.getMem_addr3() %>">
                    </div>
                  	</div>
                  	 <div class="col-md-12" style="position:relative;">
                    <button id="singnupSubmit" type="submit" class="btn btn-primary btn-block">�T�{�ӽ�</button>
                    <button id="magicBtn" type="button" class="btn btn-primary btn-block">���_�p���s</button>
                    </div>
                    <input type="hidden" name="action" value="memSignup"/>
                    <button data-toggle="modal" data-target="#login" type="button" class="btn btn-link btn-block"><span>All have an account?</span> Log in</button>
					<!-- ���~�T�����s -->
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
						<h3 class="modal-title">�|���n�J</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<form ACTION="<%= request.getContextPath() %>/Front-mem/mem.do" enctype="multipart/form-data" method="POST" role="form">
							<div class="form-group">
								<label for="mem_account">�b��</label>
								<input id="mem_account" name="mem_account"type="text" class="form-control">
							</div>
							<div class="form-group">
								<label for="mem_pwd">�K�X</label>
								<input id="mem_pwd" name="mem_pwd"type="password" class="form-control">
							</div>
							<div class="checkbox">
								<input id="checkbox-1" class="checkbox-custom form-check-input" name="checkbox-1" type="checkbox" checked>
								<label for="checkbox-1" class="checkbox-custom-label form-check-label">Remember me</label>
							</div>
							<button type="submit" class="btn btn-primary btn-block">�n�J</button>
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
		        <h3 class="modal-title" id="exampleModalLongTitle">���~�T��!</h3>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body" style="text-align:center;">
		       		<c:if test="${not empty errorMsgs}">
						<font id="erroTitle" style="display:none;">�Эץ��H�U��T:</font>
						<ul >
							<c:forEach var="message" items="${errorMsgs}">
								<li  style="color:red;font-size:15px;">${message}</li>
							</c:forEach>
						</ul>
					  </c:if>
		      </div>
		      <div class="modal-footer">
		        <button  type="button" class="btn btn-primary" data-dismiss="modal">����</button>
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
		<!--���~�u�� -->
		<script>
		 $(document).ready(function(){
			$("#magicBtn").click(function(){
				$("#mem_name").val("�}��");
				$("#insertAccount").val("z123456");
				$("#mem_phone").val("0905597668");
				$("#mem_bank").val("5986254187712433");
				$("#mem_born").val("1991-05-21");
				$("#mem_pwd").val("123456");
				$("#road").val("�����j�D�T�q2��");
				swal('�ӯ��_�F', '', 'success');
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
							swal("���~", "", "error");
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
							swal("���~", "", "error");
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
							swal("���~", "�o�e����", "error");
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
							swal("���~", "�o�e����", "error");
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
  	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
  	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
  		   value: '<%=mem_born%>', // value:   new Date(),
		   //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
           //startDate:	            '2017/07/10',  // �_�l��
           //minDate:               '-1970-01-01', // �h������(���t)���e
           maxDate:               '+1970-01-01'  // �h������(���t)����
        });
        window.onload = function () {
            //������������A��AddressSeleclList.Initialize()�A
            //�ǤJ�n�j�w�������U�Կ��ID�ζm���ϤU�Կ��ID
            AddressSeleclList.Initialize('country', 'urbanArea');
          
       }
        
       
     </script>
	</body>
</html>
