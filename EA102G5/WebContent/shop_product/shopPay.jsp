<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shop_product.model.*"%>
<%@ page import="com.shop_order.model.*"%>
<%@ page import="com.shop_coupon.model.*"%>
<%@ page import="com.mem.model.*"%>

<%
	OrdVO ordVO = (OrdVO) request.getAttribute("ordVO");
	MemVO memVO = (MemVO)session.getAttribute("memVO");
/* 	System.out.println(memVO.getMem_no());
	System.out.println(ordVO); */
%>

<!DOCTYPE html>
<html>
<head>

    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>shopPay</title>

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
   <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/color-option5.css" id="option_style">
   

    <!-- Icons -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/img/favicon.png">
    
<style>
.btn-primary-outlined{
	background-color: white;
	color: black;
	font-weight: 500;
}
.btn-primary-outlined:hover{
	color:white;
	background-color: #88B04B;
	
}
</style> 


  </head>

  <body id="body" class="body-wrapper version1 up-scroll">
  
<!-- header�H�U -->
    <div class="main-wrapper" style="overflow:visible;">
    <div class="header clearfix">
   <jsp:include page="/assets/topBar.jsp" flush="true"/>
	</div>
	</div>
 <!-- header�H�W  -->


      <!-- LIGHT SECTION -->
      <section class="lightSection clearfix pageHeader">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <div class="page-title">
                <h2>�I�ڤ覡</h2>
              </div>
            </div>
            <div class="col-md-6">
              <ol class="breadcrumb float-right">
                <li>
                  <a href="<%=request.getContextPath()%>/index1.jsp"
                  style="letter-spacing:1px">����</a>
                </li>
                <li class="active"
                style="letter-spacing:1px">�I�ڤ覡</li>
              </ol>
            </div>
          </div>
        </div>
      </section>

      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix stepsWrapper">
        <div class="container">
          <div class="row">
            <div class="col-md-8">
              <div class="innerWrapper clearfix stepsPage">
                <div class="row progress-wizard" style="border-bottom:0;">
                  <div class="col-4 progress-wizard-step complete fullBar">
                    <div class="text-center progress-wizard-stepnum">����覡</div>
                    <div class="progress"><div class="progress-bar"></div></div>
                    <div class="progress-wizard-dot"></div>
                  </div>

                  <div class="col-4 progress-wizard-step active">
                    <div class="text-center progress-wizard-stepnum">�I�ڤ覡</div>
                    <div class="progress"><div class="progress-bar"></div></div>
                    <div class="progress-wizard-dot"></div>
                  </div>

                  <div class="col-4 progress-wizard-step disabled">
                    <div class="text-center progress-wizard-stepnum">�T�{�q��</div>
                    <div class="progress"><div class="progress-bar"></div></div>
                    <div class="progress-wizard-dot"></div>
                  </div>
                </div>

                <div class="page-header">
                  <h4>�I�ڸ�T</h4>
                </div>
            
     
                  <div class="row checkboxArea card-check">
                    <div class="col-sm-12 mb-2">
                      <input id="check1" type="radio" name="checkbox" value="1" checked="checked">
                      <label for="checkbox1"><span></span>�I�ƥI��</label>
                    </div>
                    
                     <div class="col-sm-12">
                    <div class="well well-lg clearfix">
                      <ul class="pager">
                      <li class="previous float-left">
                     	
                     	<%-- <form method="post" action="<%=request.getContextPath() %>/Front-mem/depo.do">
                     	 <input type="hidden" name="action" value="shopMemTrans">
                     	 <input type="hidden" name="buyMem_no" value="<%=memVO.getMem_no()%>">
                     	 <input type="hidden" name="price" value="<%=ordVO.getOrdPrice()%>" >
                     	 <input type="hidden" name="ord_no" value="<%=ordVO.getOrdNo()%>">
                     	<button id="pointBtn" type="submit" class="btn btn-primary-outlined float-left"
                     	style="color:black">�T�w�I��</button>
                     	</form> --%>
                     	
                     	<a class="media text-secondary" data-toggle="modal" data-target="#modal-contact">
	                     	<button id="pointBtn" class="btn btn-primary-outlined float-left">�I�ƥI��</button>
                     	</a>
 
                      </li>
 
                       
                      </ul>
                    </div>
                  </div>
             
                    
                    
                    
                    <div class="col-sm-12 mb-2">
                      <input id="check2" type="radio" name="checkbox" value="2" >
                      <label for="checkbox2"><span></span>�H�Υd�I��</label>
                      <small class="mb-2 d-block">�ڭ̱����H�U�H�Υd</small>
                      <ul class="list-unstyled list-inline">
                        <li><img src="<%=request.getContextPath()%>/assets/img/products/card1.jpg" alt=""><!--  --></li>
                        <li><img src="<%=request.getContextPath()%>/assets/img/products/card2.jpg" alt=""><!--  --></li>
                        <li><img src="<%=request.getContextPath()%>/assets/img/products/card3.jpg" alt=""><!--  --></li>
                        <li><img src="<%=request.getContextPath()%>/assets/img/products/card4.jpg" alt=""><!--  --></li>
                      </ul>
                      
                      
                     
                    <div class="well well-lg clearfix" style="margin-top: 30px;">
                      <ul class="pager">
                      <li class="previous float-left">
                     	
           <%--  <form method="post" action="<%=request.getContextPath()%>/ecpayServlet">
            	<input type="hidden" name="ord_no" value="<%=ordVO.getOrdNo()%>">
                <button id="creditBtn" type="submit" class="btn btn-primary-outlined float-left"
                style="color:black">�H�Υd�I��</button>
            </form> --%>
             <a class="media text-secondary" data-toggle="modal" data-target="#modal-contact2">
            	<button id="creditBtn" class="btn btn-primary-outlined float-left">�H�Υd�I��</button>
             </a>
                     	
                      </li>

                       
                      </ul>
                    </div>
                
                    </div>
                    </div>
                  </div>
       
                  
              </div>
         
            
            
            
            <div class="col-md-4">
              <div class="summery-box">
                <h4>�q�����</h4>
                <p>�{�b�ʪ��������B���ɦ��K�B�u�f</p>
                <ul class="list-unstyled">
                  <li class="d-flex justify-content-between">
                    <span class="tag">�ӫ~�`��</span>
                    <!--����h�p��-->
					<%int price = Double.valueOf(ordVO.getOrdPrice()).intValue();%>
                    <span class="val">NT$ <%=price%></span>
                  </li>
                  <li class="d-flex justify-content-between">
                    <span class="tag">�B�O</span>
                    <span class="val">NT$0 </span>
                  </li>
                  <li class="d-flex justify-content-between">
                  <% 
                  	String discount = "�L";
              		String ord_coup = ordVO.getOrdCoup();
                  	if(!"�L".equals(ord_coup)){
                  	 	double coup_discount =	new CoupService().getOneCoup(ord_coup).getCoupDiscount();
                 		discount = String.valueOf(coup_discount*10);
                 		discount = discount + "��";
                  	}
                  %>
                    <span class="tag">�u�f��</span>
                    <span class="val"><%=discount%></span>
                  </li>
                  <li class="d-flex justify-content-between">
                    <span class="tag">�`���O���B</span>
                    <!--����h�p��-->
					<% price = Double.valueOf(ordVO.getOrdPrice()).intValue();%>
                    <span class="val">NT$ <%=price%></span>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </section>
     
      
<!-- point pay Modal -->
<div class="modal fade" id="modal-contact" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header justify-content-end border-bottom-0">
      
		<h5><a type="button" class="btn-close-icon" data-dismiss="modal" aria-label="Close">
          x
        </a></h5>
	</div>
			
      <div class="modal-body">
        <div class="row">
          <div class="col-md-12">
          		
              <div class="card text-center px-0 border-0">
				<h2>�T�w�I��</h2>
               <div class="card-body"> 
                  
                  <br>
                  <!-- �����h�p�� -->
                  <% price = Double.valueOf(ordVO.getOrdPrice()).intValue(); %>
                  <h4>�ϥ�<font style="color:#88B04B;">�I��</font>��I NT$ <%=price%>��</h4>
                  <br>
                  <br>
                  <form method="post" action="<%=request.getContextPath() %>/Front-mem/depo.do"
                   style="display:inline-block;">
                     	 <input type="hidden" name="action" value="shopMemTrans">
                     	 <input type="hidden" name="buyMem_no" value="<%=memVO.getMem_no()%>">
                     	 <input type="hidden" name="price" value="<%=ordVO.getOrdPrice()%>" >
                     	 <input type="hidden" name="ord_no" value="<%=ordVO.getOrdNo()%>">
                     	<button id="pointBtn" type="submit" class="btn btn-primary-outlined">�I�ƥI��</button>
                   </form>
                  <button class="btn btn-primary-outlined" data-dismiss="modal"
                  style="color:black;background:#88B04B;color:white;">�����I��</button>
                </div>
			</div>

		</div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- �H�W�Opoint payModal --> 

<!-- credit pay Modal -->
<div class="modal fade" id="modal-contact2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header justify-content-end border-bottom-0">
      
		<h5><a type="button" class="btn-close-icon" data-dismiss="modal" aria-label="Close">
          x
        </a></h5>
	</div>
			
      <div class="modal-body">
        <div class="row">
          <div class="col-md-12">
          		
              <div class="card text-center px-0 border-0">
				<h2>�T�w�I��</h2>
               <div class="card-body"> 
                  
                  <br>
                  <!-- �����h�p�� -->
                  <% price = Double.valueOf(ordVO.getOrdPrice()).intValue(); %>
                  <h4>�ϥ�<font style="color:#88B04B;">�H�Υd</font>��I NT$ <%=price%>��</h4>
                  <br>
                  <br>
                  <form method="post" action="<%=request.getContextPath()%>/ecpayServlet"
                  style="display:inline-block;">
            		<input type="hidden" name="ord_no" value="<%=ordVO.getOrdNo()%>">
               		<button type="submit" class="btn btn-primary-outlined">�H�Υd�I��</button>
           		 </form>
                  <button class="btn btn-primary-outlined" data-dismiss="modal"
                  style="color:black;background:#88B04B;color:white;">�����I��</button>
                </div>
			</div>

		</div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- �H�W�O credit payModal -->      
      
      
      
      
      
      
      
      
      <jsp:include page="/assets/footer.jsp" flush="true" />


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
		
		<!-- 		LoginModal -->
		<jsp:include page="/assets/loginModal.jsp" flush="true"/>
		<!-- 		MemChat -->
<%-- 		<jsp:include page="/assets/memChat3.jsp" flush="true"/> --%>

<script>
	/* ��l�w�] */
	$(document).ready(function(){
		 $('#pointBtn').attr('disabled',false);
		 $('#creditBtn').attr('disabled',true);
	});
	
	$(function(){
		  $("input[name='checkbox']").click(function(){
			  if($("input[name='checkbox']:checked").val() == 1){
				  $('#pointBtn').attr('disabled',false);
				  $('#creditBtn').attr('disabled',true);
			  } else if($("input[name='checkbox']:checked").val() == 2){
				  $('#creditBtn').attr('disabled',false);
				  $('#pointBtn').attr('disabled',true);
			  }
		  });
		});
	
	



</script>

</body>
</html>