<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
    <%@ page import="com.CPRECORD.model.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
<% CprecordVO CprecordVO=(CprecordVO)session.getAttribute("CprecordVO");%>
    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Elements - BIGBAG Store</title>

    <!-- PLUGINS CSS STYLE -->
    <link href="../assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet">
    <link href="../assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="../assets/plugins/selectbox/select_option1.css" rel="stylesheet">
    <link href="../assets/plugins/fancybox/jquery.fancybox.min.css" rel="stylesheet">
    <link href="../assets/plugins/rateyo/jquery.rateyo.min.css" rel="stylesheet">
    <link href="../assets/plugins/iziToast/css/iziToast.css" rel="stylesheet">
    <link href="../assets/plugins/prismjs/prism.css" rel="stylesheet">
    <link href="../assets/plugins/revolution/css/settings.css" rel="stylesheet">
    <link href="../assets/plugins/animate/animate.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../assets/plugins/slick/slick.css" media="screen">
    <link rel="stylesheet" type="text/css" href="../assets/plugins/slick/slick-theme.css" media="screen">


    <!-- CUSTOM CSS -->
    <link href="../assets/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/default.css" id="option_style">

    <!-- Icons -->
    <link rel="shortcut icon" href="../assets/img/favicon.png">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>

  <body id="body" class="body-wrapper version1 up-scroll">

 <div style="overflow:visible;">
        <jsp:include page="/assets/topBar.jsp" flush="true"/>
</div>

      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix setp5">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div class="thanksContent">
                <h2>�P�±z�ϥΥ洫�\��A�洫�w����<small>����ƱN�ʦs�A�p�Y�L�G���i�����N�̬����|���W�w�B�m</small></h2>
                <a href="readrecord.jsp" class="btn btn-default  active"><h3>�^��洫����</h3></a>
                <div class="thanksInner">
                  <div class="row">
                    <div class="col-md-6 tableBlcok">
                      <address>
                              <a class="addreport" href="#">�����x�ȧ@���ĤT�襭�x�A�p���L�G���i��洫�Ψ�L�洫�ȯɽЦܥ洫�����i��^��</a> <br>
                              <span>Phone: 02 2700 1234</span>
                            </address>
                          </div>
                          
                    
                    <div class="col-md-6">
                      <div class="well">
                        <h2><small>Order ID</small>${CprecordVO.cpr_No}</h2>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      			<!-- FOOTER -->
			<jsp:include page="/assets/footer.jsp" flush="true"/>

		<script src="../assets/plugins/jquery/jquery.min.js"></script>
		<script src="../assets/plugins/jquery/jquery-migrate-3.0.0.min.js"></script>
		<script src="../assets/plugins/jquery-ui/jquery-ui.js"></script>
		<script src="../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="../assets/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
		<script src="../assets/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
		<script src="../assets/plugins/slick/slick.js"></script>
		<script src="../assets/plugins/fancybox/jquery.fancybox.min.js"></script>
		<script src="../assets/plugins/iziToast/js/iziToast.js"></script>
		<script src="../assets/plugins/prismjs/prism.js"></script>
		<script src="../assets/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
		<script src="../assets/plugins/countdown/jquery.syotimer.js"></script>
		<script src="../assets/plugins/velocity/velocity.min.js"></script>
		<script src="../assets/plugins/rateyo/jquery.rateyo.min.js"></script>
		<script src="../assets/js/custom.js"></script>

	</body>
</html>

