<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bp.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.depo.model.*"%>
<%
MemVO memVO = (MemVO)session.getAttribute("memVO");
%>
<%
BpVO bpVO = (BpVO) session.getAttribute("bpVO");
%>

<!DOCTYPE html>
<html lang="zh_TW">
  <head>

    <!-- SITE TITTLE -->
    <meta charset="Big5">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>請再次確認下標資訊</title>
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/color-option2.css" id="option_style">
    <!-- Icons -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/img/favicon.png">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/joe_footer.css" >
    
    <style>
.orderBox:nth-child(3) .table-responsive .table tbody tr td:nth-child(1)
	{
	width: 50%;
}

.orderBox:nth-child(4) .table-responsive .table tbody tr td:nth-child(3)
	{
	width: 60%;
	text-align: left;
}

button:hover{
background-color:red !important; 

}
.innerWrapper * {
    font-family: 微軟正黑體 !important;
}
.innerWrapper{
	border:solid #c5c0ba !important;
    border-radius: 25px !important;
}
th{
	font-size:20px !important;
}
td{
	font-size:18px !important;
}

.swal2-icon-content{
	font-size:75px !important;
}

</style>
  </head>

  <body id="body" onload="connect();">
<div class="main wrapper" style="overflow:visible;">
<div class="header clearfix">
<jsp:include page="/assets/topBar.jsp" flush="true"/>
</div>
</div>

  <jsp:useBean id="depoSvc" scope="page" class="com.depo.model.DepoService"/>
 <jsp:useBean id="bpclassSvc" scope="page" class="com.bpclass.model.BpclassService" />
      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix userProfile">
        <div class="container">

          <div class="row">
            <div class="col-md-12">
              <div class="innerWrapper">

                <h3><span style="color:black"><b>請再次確認付款</b></span></h3>
                <p></p>
               
                <div class="orderBox">
                  <h4>您要購買的商品資訊</h4>
                  <div class="table-responsive"style="border-radius:50px !improtant">
                    <table class="table" style="border-radius:25px">
                      <thead style="border:white solid">
                        <tr style="border:white solid">            
                         <th style="border-radius: 20px 0 0 20px">商品名稱</th>
                         <th>價格</th>
                         <th style="border-radius: 0 20px 20px 0">商品所在地區</th>
                        </tr>
                      </thead>
                      <tbody style="border:white solid">
                        <tr style="border:white solid">
                          <td style="color:black"><a style="color:blue !important" href="<%=request.getContextPath()%>/bp-front/TRY1.jsp?${bpVO.bp_no}"target="_blank">${bpVO.bp_head} </a></td>
                          <td>${bpVO.bp_pri}</td>
                          <td style="text-align:left">${bpVO.bp_loc}</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
                <div class="orderBox">
                  <h4>購買人資訊</h4>
                  <div class="table-responsive">
                    <table class="table">
                      <thead style="border:white solid">
                        <tr style="border:white solid">
                          <th style="border-radius: 20px 0 0 20px">會員名稱</th>
                          <th>剩餘點數</th>
                          <th style="border-radius: 0 20px 20px 0">送貨地址</th>
                        </tr>
                      </thead>
                      <tbody style="border:white solid">
                        <tr style="border:white solid">
                          <td style="color:black">${memVO.mem_name}</td>
                          <td>${depoSvc.memNowDepo(memVO.mem_no).depo_point}</td>
                          <td>${memVO.mem_addr}</td>
                          
                          <input type="hidden" id="bp_head" value="${bpVO.bp_head}">
                          <input type="hidden" id="bp_no" value="${bpVO.bp_no}">
                          <input type="hidden" id="mem_no2" value="${memVO.mem_no}">
                          <input type="hidden" id="bp_pri" value="${bpVO.bp_pri}">
                          <input type="hidden" id="mem_addr" value="${memVO.mem_addr}">
                          <input type="hidden" id="bpcl_no" value="${bpclassSvc.getonebpclass(bpVO.bpcl_no).bpcl_name}">
                          <input type="hidden" id="bp_new" value="${bpVO.bp_new}">
                          <input type="hidden" id="bp_del" value="${bpVO.bp_del}">
                          
                        </tr>
                      </tbody>
                    </table>
     
                    <c:choose>	
                  		<c:when test="${depoSvc.memNowDepo(memVO.mem_no).depo_point > bpVO.bp_pri}">
		                	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Front-mem/depo.do" enctype="multipart/form-data" id="corfimpay">
			                	<input type="hidden" name="buyMem_no" value="${memVO.mem_no}">
			               		<input id="mem_no" type="hidden" name="sellMem_no" value="${bpVO.mem_no}">
			               		<input type="hidden" name="price" value="${bpVO.bp_pri}">
			               		<input id="bp_no" type="hidden" name="bp_no" value="${bpVO.bp_no}">
			                	<input type="hidden" name="action" value="memTransaction" >
			                    <button id="pay"class="btn btn-primary btn-lg btn-block" style="font-size:24px ;background-color:#5e5e5e ;margin-top: 50px;border-radius: 15px; float: RIGHT; width: 200px;border-bottom: 25px !important">確認付款</button>
		                 	</FORM>
	                 	</c:when>
	                 	<c:otherwise>     	
	                 		 	<button id="nogood" type="submit" class="btn btn-primary btn-lg btn-block" style="padding: 0 0 0 0;font-size:18px ;background-color:#e21c00;color:white ;margin-top: 50px;border-radius: 15px; float: RIGHT; width: 200px;border-bottom: 25px !important">點數不足 前往儲值</button>
	                 	</c:otherwise>
	    			 </c:choose>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
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
		<script src="<%=request.getContextPath()%>/assets/js/custom.js"></script>
		
		<jsp:include page="/assets/loginModal.jsp" flush="true"/>
		<!-- 		MemChat -->
		<jsp:include page="/assets/memChat3.jsp" flush="true"/>
		<script>
		$(document).ready(function(){
			
			$("button#pay").click(function(e){
				e.preventDefault();
				console.log("qweqwewqe");
				var data = {};
				data.mem_no = $("input#mem_no").val();
				data.bp_no = $("input#bp_no").val();
				console.log(data.bp_no);
				
				Swal.fire({
					  title: '請確認付款!?',
					  icon: 'warning',
					  position: 'center',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  cancelButtonText: '取消',
					  confirmButtonText: '付款',

			
				}).then((result) => {
					  if (result.value) {
						    Swal.fire({
						    	  position: 'center',
						    	  icon: 'success',
						    	  title: '你已經成功付款',
						    	  showConfirmButton: true,
						    	}).then((result) => {
						    		if(result.value)
						    	    var jsonObj = {
											"type" : "try",
											"sender" :self,
											"receiver" :data.mem_no,
											"message":'系統資訊!\n您的商品:'+data.bp_no+'已經售出!!',
											"bp_head":$("#bp_head").val(),
											"bp_no":$("#bp_no").val(),
											"mem_no":$("#mem_no2").val(),
											"bp_pri":$("#bp_pri").val(),
											"mem_addr":$("#mem_addr").val(),
											"bpcl_no":$("#bpcl_no").val(),
											"bp_new":$("#bp_new").val(),
											"bp_del":$("#bp_del").val(),
										};	
										webSocket1.send(JSON.stringify(jsonObj));
										$("FORM#corfimpay").submit();
						    	});

					
				  }
				});
				
				
			});
		});
		
		
		
		</script>

	</body>
</html>