<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.depo.model.*"%>
<%@page import="com.mem.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	MemVO memVO=(MemVO)session.getAttribute("memVO");
	DepoService depoSvc=new DepoService();
	List<DepoVO> list=depoSvc.depoSelectByMem(memVO.getMem_no());
	if(list!=null){
		pageContext.setAttribute("list",list);
	}
%>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<!-- JQUERY -->
    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

    <!-- SITE TITTLE -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>TOYALLHOT-會員點數紀錄</title>

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
    <link rel="<%=request.getContextPath() %>/stylesheet" href="assets/css/default.css" id="option_style">

    <!-- Icons -->
    <link rel="shortcut icon" href="<%=request.getContextPath() %>/assets/img/favicon.png">
  </head>

  <body id="body" class="body-wrapper version1 up-scroll"onload="connect();" onunload="disconnect();">

    <div class="main-wrapper">

      <!-- HEADER -->
      <div class="header clearfix">

        <!-- TOPBAR NAVBAR-->
        <jsp:include page="/assets/topBar.jsp" flush="true"/>

      <!-- LIGHT SECTION -->
      <section class="lightSection clearfix pageHeader">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <div class="page-title">
                <h2>點數管理</h2>
              </div>
            </div>
            <div class="col-md-6">
              <ol class="breadcrumb float-right">
                <li>
                  <a href="<%=request.getContextPath() %>/index1.jsp">首頁</a>
                </li>
                <li class="active">點數交易紀錄</li>
              </ol>
            </div>
          </div>
        </div>
      </section>
      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix userProfile">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div class="btn-group" role="group" aria-label="...">
                <a href="account-profile.jsp" class="btn btn-default"><i class="fa fa-user" aria-hidden="true"></i>個人資訊</a>
                <a href="account-all-depo.jsp" class="btn btn-default active"><i class="fa fa-list" aria-hidden="true"></i>點數交易紀錄</a>
               <a href="<%=request.getContextPath() %>/bp-front/mybp.jsp" class="btn btn-default "><i class="fa fa-list" aria-hidden="true"></i>我的直購紀錄</a>
               <a href="<%=request.getContextPath() %>/front_end/readrecord.jsp" class="btn btn-default "><i class="fa fa-list" aria-hidden="true"></i>我的交換紀錄</a>
               <a href="<%=request.getContextPath() %>/bid_front_end/BidHome.jsp" class="btn btn-default "><i class="fa fa-list" aria-hidden="true"></i>我的競標紀錄</a>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="innerWrapper"style="border-color:#bfbfbf;">
                <div class="orderBox">
                  <h2>交易紀錄</h2>
                  <c:choose>
                  <c:when test="${!list.isEmpty()}">
	                  <div class="table-responsive">
	                    <table class="table">
	                      <thead>
	                        <tr>
	                          <th style="text-align:center;">交易編號</th>
	                          <th style="text-align:center;">會員</th>
	                          <th style="text-align:center;">交易類別</th>
	                          <th style="text-align:center;">交易金額</th>
	                          <th style="text-align:center;">剩餘點數</th>
	                          <th style="text-align:center;">交易時間</th>
	                          <th style="text-align:center;">交易狀態</th>
	                        </tr>
	                      </thead>
	                      <tbody style="border-color:#bfbfbf;">
	                        <div>
	                        <%@ include file="page1.file" %>
	                        </div> 
							<c:forEach var="depoVO"  items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
								<tr style="border-color:#bfbfbf;">
									<td style="text-align:center;border-color:#bfbfbf;">${depoVO.depo_no}</td>
									<td style="text-align:center;border-color:#bfbfbf;">${memVO.mem_name}</td>
									<td style="text-align:center;border-color:#bfbfbf;">${depoMap[depoVO.depo_trans_type]}</td>
									<td style="text-align:center;border-color:#bfbfbf;">${depoVO.depo_amount}</td>
									<td style="text-align:center;border-color:#bfbfbf;">${depoVO.depo_point}</td>
									<td style="text-align:center;border-color:#bfbfbf;">${SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(depoVO.depo_time)}</td>
									<td style="text-align:center; font-color:red;border-color:#bfbfbf;">${depoMap[depoVO.depo_tok_status]}</td>
								</tr>
							</c:forEach>
							</table>
							<div><%@ include file="page2.file" %></div> 
	                      </tbody>
	                      <label for="goUpdate" class="btn btn-primary float-right" ><a id="depoBtn"data-toggle="modal" href='#depo' style="color:white;">儲值點數</a></label>
	                      <label for="goUpdate" class="btn btn-primary float-right"style="margin-right:50px;"><a id="WithdrawBtn"data-toggle="modal" href='#Withdraw' style="color:white;">提領點數</a></label>
	                  </div>
	                  </c:when>
	                  <c:otherwise>
	                   <img src="<%=request.getContextPath() %>/assets/img/noDepo.jpg"class="col-md-12" style="width:100%;height:100%;" >
	                   <label for="goUpdate" class="btn btn-primary float-right" ><a id="depoBtn"data-toggle="modal" href='#depo' style="color:white;">儲值點數</a></label>
	                  </c:otherwise>
                  </c:choose>
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
								<li><img src="<%=request.getContextPath() %>/assets/img/home/footer/card1.png"></li>
								<li><img src="<%=request.getContextPath() %>/assets/img/home/footer/card2.png"></li>
								<li><img src="<%=request.getContextPath() %>/assets/img/home/footer/card3.png"></li>
								<li><img src="<%=request.getContextPath() %>/assets/img/home/footer/card4.png"></li>
							</ul>
						</div>
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
		
		<!-- DEPO MODAL -->
		<div class="modal fade login-modal" id="depo" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header justify-content-center">
						<h3 class="modal-title">點數儲值</h3>
						<button id="closeDepo" type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<form action="<%= request.getContextPath()%>/Front-mem/depo.do" method="POST" role="form">
						<table class="table table-bordered">
							<tr class="table-info">
								<th style="text-align:center;">請輸入儲值金額:</th>
								<th style="text-align:center;">儲值</th>
							</tr>
							<tr class="table-info">
								<td style="text-align:center;"><input type="text" name="price"></td>
								<td style="text-align:center;"><input type="submit" value="確認加值"/></td>
							</tr>
						</table>
						<input type="hidden" name="action" value="memDeposit"/>
						<input type="hidden" name="mem_account"value="${memVO.mem_account}" >
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Withdraw MODAL -->
		<div class="modal fade login-modal" id="Withdraw" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header justify-content-center">
						<h3 class="modal-title">提領點數</h3>
						<button type="button" id="closeWithdraw" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						
					</div>
					<div class="modal-body">
						<form action="<%= request.getContextPath()%>/Front-mem/depo.do" method="POST" role="form">
						<table class="table table-bordered">
							<tr class="table-info">
								<th style="text-align:center;">請輸入提領金額:</th>
								<th style="text-align:center;">提交</th>
							</tr>
							<tr class="table-info">
								<td style="text-align:center;"><input type="text" name="price"></td>
								<td style="text-align:center;"><input type="submit" value="提交審核"/></td>
							</tr>
						</table>
						<input type="hidden" name="action" value="memWithdraw"/>
						<input type="hidden" name="mem_account"value="${memVO.mem_account}" >
						</form>
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
		
		<script>
		 $(document).ready(function(){
			
			if($("#erroTitle").val()!=null){
				$("#errorMsgs").click();
			}
		 	
			if($("#erroTitle").val()!=null){
				$("#errorMsgs").click();
			}
		 
		 })
		</script>
		<!-- 		MemChat -->
		<jsp:include page="/assets/memChat3.jsp" flush="true"/>
	</body>
</html>

