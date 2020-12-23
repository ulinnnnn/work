<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="Big5"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.depo.model.*"%>
<%@page import="com.mem.model.*"%>
<%@ page import="com.mem.model.MemVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	MemService memSvc = new MemService();
	List<MemVO> list = memSvc.selectAllMem();

	DepoService depoSvc = new DepoService();
	List<DepoVO> depoListAll = depoSvc.depoSelectAllByEmp();

	pageContext.setAttribute("list", list);
	pageContext.setAttribute("depoListAll", depoListAll);
%>


<!DOCTYPE html>
<html lang="en">
<head>

<!-- SITE TITTLE -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>�|���I�ƴ���ӽ� - ToyAllHot</title>

<!-- PLUGINS CSS STYLE -->
<link
	href="<%=request.getContextPath()%>/assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/jquery-ui/jquery-ui.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/selectbox/select_option1.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/fancybox/jquery.fancybox.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/rateyo/jquery.rateyo.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/iziToast/css/iziToast.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/prismjs/prism.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/revolution/css/settings.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/plugins/animate/animate.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/plugins/slick/slick.css"
	media="screen">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets/plugins/slick/slick-theme.css"
	media="screen">
<!-- JQUERY -->
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- CUSTOM CSS -->
<link href="<%=request.getContextPath()%>/assets/css/style.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/default.css"
	id="option_style">

<!-- Icons -->
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/assets/img/favicon.png">

</head>

<body id="body" class="body-wrapper version1 up-scroll">
	<jsp:include page="/assets/headerBack.jsp"></jsp:include>
	<div class="main-wrapper">

		<!-- LIGHT SECTION -->
		<section class="lightSection clearfix pageHeader">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="page-title">
							<h2>�|������ӽ�</h2>
						</div>
					</div>
					<div class="col-md-6">
						<ol class="breadcrumb float-right">
							<li><a href="<%=request.getContextPath()%>/backEndG5/backEndHome.jsp">����</a></li>
							<li><a href="<%=request.getContextPath()%>/Back-mem/empSelectAllDepo.jsp">�������</a>
							</li>
							<li class="active">�|������ӽ�</li>
						</ol>
					</div>
				</div>
			</div>
		</section>

		<!-- MAIN CONTENT SECTION -->
		<section class="mainContent clearfix productsContent" style="width:100%;height:100%;">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-8">
						<div><%@ include file="pages/page1.file"%>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="innerWrapper">
									<div class="orderBox">
										<!-- 		                  <h2>All Orders</h2> -->
										<div id="tre" class="table-responsive">
											
													<c:forEach var="depoVOAll" items="${depoListAll}"
														begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" varStatus="varStatus">
															<c:if test="${depoVOAll.depo_tok_status.equals('1')}">
																<table id="t1" class="table">
																<thead>
																	<tr>
																		<th style="text-align:center;">����s��</th>
																		<th style="text-align:center;">�|���s��</th>
																		<th style="text-align:center;">������O</th>
																		<th style="text-align:center;">������B</th>
																		<th style="text-align:center;">�Ѿl�I��</th>
																		<th style="text-align:center;">����ɶ�</th>
																		<th style="text-align:center;">������A</th>
																		<th style="text-align:center;">���A�T�{</th>
																	</tr>
																</thead>
																<tbody>
																<tr>
																	<td style="text-align:center;">${depoVOAll.depo_no}</td>
																	<td style="text-align:center;">${depoVOAll.mem_no}</td>
																	<td style="text-align:center;">${depoMap[depoVOAll.depo_trans_type]}</td>
																	<td style="text-align:center;">${depoVOAll.depo_amount}</td>
																	<td style="text-align:center;">${depoVOAll.depo_point}</td>
																	<td style="text-align:center;">${SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(depoVOAll.depo_time)}</td>
																	<td style="text-align:center;">${depoMap[depoVOAll.depo_tok_status]}</td>
																	<td style="text-align:center;">
																<form method="post"	action="<%=request.getContextPath()%>/Front-mem/depo.do">
																	<input type="hidden" name="depo_no"	value="${depoVOAll.depo_no}" /> 
																	<input type="hidden" name="action" value="empCheckWithdraw" />
																	<button type="submit"class="btn btn-primary btn-block"style="">�f�d�T�{</button>
																</form>
																</td>
															</tr>
														</tbody>
													</table>
													<div class="col-md-12" style="text-align: center;margin-top:32%;">
														<%@ include file="pages/page2.file"%>
													</div>
													</c:if>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
						
						
				</div>
			</div>
		</section>

		 <!-- LIGHT SECTION -->
      <section class="lightSection clearfix">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div class=" partnersLogoSlider">
                <div class="slide">
                  <div class="partnersLogo clearfix">
                    <img src="<%=request.getContextPath() %>/assets/img/home/partners/partner-01.png" alt="partner-img">
                  </div>
                </div>
                <div class="slide">
                  <div class="partnersLogo clearfix">
                    <img src="<%=request.getContextPath() %>/assets/img/home/partners/partner-02.png" alt="partner-img">
                  </div>
                </div>
                <div class="slide">
                  <div class="partnersLogo clearfix">
                    <img src="<%=request.getContextPath() %>/assets/img/home/partners/partner-03.png" alt="partner-img">
                  </div>
                </div>
                <div class="slide">
                  <div class="partnersLogo clearfix">
                    <img src="<%=request.getContextPath() %>/assets/img/home/partners/partner-04.png" alt="partner-img">
                  </div>
                </div>
                <div class="slide">
                  <div class="partnersLogo clearfix">
                    <img src="<%=request.getContextPath() %>/assets/img/home/partners/partner-05.png" alt="partner-img">
                  </div>
                </div>
                <div class="slide">
                  <div class="partnersLogo clearfix">
                    <img src="assets/img/home/partners/partner-01.png" alt="partner-img">
                  </div>
                </div>
                <div class="slide">
                  <div class="partnersLogo clearfix">
                    <img src="<%=request.getContextPath() %>/assets/img/home/partners/partner-02.png" alt="partner-img">
                  </div>
                </div>
                <div class="slide">
                  <div class="partnersLogo clearfix">
                    <img src="<%=request.getContextPath() %>/assets/img/home/partners/partner-03.png" alt="partner-img">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
		
	</div>


<!-- FOOTER -->
<jsp:include page="../assets/footerBack.jsp"></jsp:include>	

	<script
		src="<%=request.getContextPath()%>/assets/plugins/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/jquery/jquery-migrate-3.0.0.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/jquery-ui/jquery-ui.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/slick/slick.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/fancybox/jquery.fancybox.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/iziToast/js/iziToast.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/prismjs/prism.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/countdown/jquery.syotimer.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/velocity/velocity.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/plugins/rateyo/jquery.rateyo.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/custom.js"></script>
	</div>
	</div>
	</div>
	<script>
		var table=document.getElementById("t1");
		var tre=document.getElementById("tre");
		if(table==null){
			tre.innerHTML='<img src="<%=request.getContextPath() %>/assets/img/noWithdraw.png"class="col-md-12" style="width:100%;height:100%;" >';
		}
	</script>
</body>
</html>
