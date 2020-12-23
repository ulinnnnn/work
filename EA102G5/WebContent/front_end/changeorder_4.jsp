<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="big5"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cproduct.model.*"%>
<%@ page import="com.CPRECORD.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  <jsp:useBean id="CproductSvc" scope="page" class="com.cproduct.model.CproductService" />

<%


CprecordVO CprecordVO=(CprecordVO)session.getAttribute("CprecordVO");

CprecordService  CprecordSvc = new  CprecordService();
CprecordSvc.changestate("ユ传ЧΘ", CprecordVO.getCpr_No());


CproductSvc.changestate("ユ传ЧΘ",CproductSvc.getOneCproduct(CprecordVO.getCp_No1()).getCp_No());
CproductSvc.changestate("ユ传ЧΘ",CproductSvc.getOneCproduct(CprecordVO.getCp_No2()).getCp_No());


%>
<script type="text/javascript">
onload=function(){
setInterval(go, 1000);
};
var x=2; //ノ办┦跑计ㄓ磅︽
function go(){
x--;
if(x>0){
document.getElementById("sp").innerHTML=x; //–Ω砞﹚x常ぃ妓
}else{
location.href='changefinished.jsp';
}
}
</script>






    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Single Order - BIGBAG Store</title>

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
      <section class="mainContent clearfix userProfile">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <div class="btn-group" role="group" aria-label="...">
                <a href="/EA102G5/front_end/readrequest.jsp" class="btn btn-default "><i class="fa fa-th" aria-hidden="true"></i>ユ传ビ叫</a>
                <a href="/EA102G5/front_end/addchange.jsp" class="btn btn-default"><i class="fa fa-user" aria-hidden="true"></i>穝糤ユ传坝珇</a>
                <a href="/EA102G5/front_end/readchange.jsp" class="btn btn-default"><i class="fa fa-map-marker" aria-hidden="true"></i>и坝珇</a>
                <a href="/EA102G5/front_end/readrecord.jsp" class="btn btn-default  active"><i class="fa fa-list" aria-hidden="true"></i>ユ传魁</a>
                <a href="/EA102G5/front_end/readwish.jsp" class="btn btn-default"><i class="fa fa-gift" aria-hidden="true"></i>Wishlist</a>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <div class="innerWrapper singleOrder">
            
	<div class="row progress-wizard" style="border-bottom:0;">

                  <div class="col-4 progress-wizard-step complete fullBar">
                    <div class="text-center progress-wizard-stepnum">絋粄ユ传</div>
                    <div class="progress"><div class="progress-bar"></div></div>
                    <a href="checkout-step-1.html" class="progress-wizard-dot"></a>
                  </div>

                  <div class="col-4 progress-wizard-step complete fullBar">
                    <div class="text-center progress-wizard-stepnum">蛮よ絋﹚ユ传</div>
                    <div class="progress"><div class="progress-bar"></div></div>
                    <a href="checkout-step-2.html" class="progress-wizard-dot"></a>
                  </div>

                  <div class="col-4 progress-wizard-step active">
                    <div class="text-center progress-wizard-stepnum">ユ传ЧΘ</div>
                    <div class="progress"><div class="progress-bar"></div></div>
                    <a href="checkout-step-3.html" class="progress-wizard-dot"></a>
                  </div>
                </div>
                <div class="orderBox">
                  <h2>${CprecordVO.cpr_No}</h2>
                </div>
             <div class="display-single_element">
		<p>Example: </p>

		<div class="card-deck">
			<div class="card">
				<div class="card_img">
					<a href="">
						<img class="card-img-top" src="makeimage.jsp?pic1=${CprecordVO.cp_No1}&No=1"  alt="card img">
					</a>
				</div>
				<div class="card-block">
			        <a href="#"><h3 class="card-title">${CproductSvc.getOneCproduct(CprecordVO.getCp_No1()).cpname}</h3></a>
					<span>${CprecordVO.mem_No2}</span>
					<p class="card-text">${CproductSvc.getOneCproduct(CprecordVO.getCp_No1()).cptext}</p>
					
				</div>
				
			</div>
			<div class="card">
				
			</div>
			<div class="card">
				<div class="card_img">
					<a href="">
						<img class="card-img-top" src="makeimage.jsp?pic1=${CprecordVO.cp_No2}&No=1"  height="auto="card img">
					</a>
				</div>
				<div class="card-block">
				
                      
                       
                          
					<a href="#"><h3 class="card-title">${CproductSvc.getOneCproduct(CprecordVO.getCp_No1()).cpname}</h3></a>
					<span>${CprecordVO.mem_No2}</span>
					<p class="card-text">${CproductSvc.getOneCproduct(CprecordVO.getCp_No1()).cptext}</p>
					
			    
				</div>
			</div>
		</div>
	</div>
                  <div class="col-12">
                    <div class="panel panel-default">
                      <div class="panel-heading">
                        <h4 class="panel-title">Order Details</h4>
                      </div>
                      <div class="panel-body">
                        <div class="row">
                          <div class="col-md-4 col-12">
                            <address>
                              <a href="#">Email: adamsmith@bigbag.com</a> <br>
                              <span>Phone: +884 5452 6432</span>
                            </address>
                          </div>
                          <div class="col-md-8 col-12">
                            <address>
                              <span>Additional Information: </span><br>
                              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip</p>
                            </address>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="btn-group" role="group" aria-label="...">
                      <button type="button" class="btn btn-default">Print</button>
                      <button type="button" class="btn btn-default">Save to pdf</button>
                      <button type="button" class="btn btn-danger">cancel order</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
       
      

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

