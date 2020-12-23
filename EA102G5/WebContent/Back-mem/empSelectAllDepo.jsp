<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.depo.model.*"%>
<%@page import="com.mem.model.*"%>
<%@ page import="com.mem.model.MemVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	MemService memSvc=new MemService();
	List<MemVO> list=memSvc.selectAllMem();
	
	DepoService depoSvc=new DepoService();
	List<DepoVO> depoListAll=depoSvc.depoSelectAllByEmp();
	
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("depoListAll",depoListAll);
	
%>


<!DOCTYPE html>
<html lang="en">
  <head>

    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>��O�I�ƺ޲z - ToyAllHot</title>

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
                <h2>�|���I�ƥ������</h2>
              </div>
            </div>
            <div class="col-md-6">
              <ol class="breadcrumb float-right">
                <li>
                  <a href="<%=request.getContextPath()%>/backEndG5/backEndHome.jsp">����</a>
                </li>
                <li>
                  <a href="<%=request.getContextPath() %>/Back-mem/empSelectAllWithdraw.jsp">�I�ƴ���ӽ�</a>
                </li>
                <li class="active">�������</li>
              </ol>
            </div>
          </div>
        </div>
      </section>

      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix productsContent">
        <div class="container">
          <div class="row">
            <div class="col-lg-12 col-md-8">
              <div><%@ include file="pages/page1.file" %> </div>
	             <div class="row">
		            <div class="col-md-12">
		              <div class="innerWrapper">
		                <div class="orderBox">
		                  <div class="table-responsive">
		                    <table class="table">
		                      <thead>
		                        <tr>
		                          	<th style="text-align:center;">����s��</th>
									<th style="text-align:center;">�|���s��</th>
									<th style="text-align:center;">������O</th>
									<th style="text-align:center;">������B</th>
									<th style="text-align:center;">�Ѿl�I��</th>
									<th style="text-align:center;">����ɶ�</th>
									<th style="text-align:center;">������A</th>
									
		                        </tr>
		                      </thead>
		                      <tbody>
		                      <c:forEach var="depoVOAll" items="${depoListAll}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		                      	  <tr>
		                        	<td style="text-align:center;">${depoVOAll.depo_no}</td>
									<td style="text-align:center;">${depoVOAll.mem_no}</td>
									<td style="text-align:center;">${depoMap[depoVOAll.depo_trans_type]}</td>
									<td style="text-align:center;">${depoVOAll.depo_amount}</td>
									<td style="text-align:center;">${depoVOAll.depo_point}</td>
									<td style="text-align:center;">${SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(depoVOAll.depo_time)}</td>
									<td style="text-align:center;">${depoMap[depoVOAll.depo_tok_status]}</td>
		                         
		                        </tr>
		                        </c:forEach>
		                      </tbody>
		                    </table>
		                  </div>
		                </div>
		              </div>
		            </div>
		          </div>
		        </div>
                <div class="container">
                <div class="col-md-12" style="text-align:center;">
                <%@ include file="pages/page2.file" %>
                </div>
                </div>
                </div>
                </div>
      </section>

  	
		</div>

		<!-- LOGIN MODAL -->
		<div class="modal fade login-modal" id="login" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header justify-content-center">
						<h3 class="modal-title">log in</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<form action="" method="POST" role="form">
							<div class="form-group">
								<label for="">Enter Email</label>
								<input type="email" class="form-control">
							</div>
							<div class="form-group">
								<label for="">Password</label>
								<input type="password" class="form-control">
							</div>
							<div class="checkbox">
								<input id="checkbox-1" class="checkbox-custom form-check-input" name="checkbox-1" type="checkbox" checked>
								<label for="checkbox-1" class="checkbox-custom-label form-check-label">Remember me</label>
							</div>
							<button type="submit" class="btn btn-primary btn-block">log in</button>
							<button type="button" class="btn btn-link btn-block">Forgot Password?</button>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- SIGN UP MODAL -->
		<div class="modal fade " id="signup" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header justify-content-center">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h3 class="modal-title">Create an account</h3>
					</div>
					<div class="modal-body">
						<form action="" method="POST" role="form">
							<div class="form-group">
								<label for="">Enter Email</label>
								<input type="email" class="form-control">
							</div>
							<div class="form-group">
								<label for="">Password</label>
								<input type="password" class="form-control">
							</div>
							<div class="form-group">
								<label for="">Confirm Password</label>
								<input type="password" class="form-control">
							</div>
							<button type="submit" class="btn btn-primary btn-block">Sign up</button>
							<button type="button" class="btn btn-link btn-block">New User?</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- MEMBER`sDEPO QUICK VIEW MODAL -->
		
		<jsp:useBean id="onedepoSvc" scope="page" class="com.depo.model.DepoService" />
		<c:forEach var="depoVOAll" items="${depoListAll}" begin="0" end="${depoListAll.size()-1}">	
		<div class="modal fade quick-view " id="depo${depoVOAll.mem_no }" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header justify-content-center">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h3 class="modal-title">�|���������</h3>
					</div>
					<div class="modal-body">
							<table class="table table-striped" style="text-alignLcenter;">
								<tr>
									<th>����s��</th><th>�|��</th><th>������O</th><th>������B</th><th>�Ѿl�I��</th><th>����ɶ�</th>
								</tr>
							<c:forEach var="depoVO" items="${onedepoSvc.depoSelectByMem(depoVOAll.mem_no)}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">	
								<tr>
									<td>${depoVO.depo_no}</td>
									<td>${depoVO.mem_no}</td>
									<td>${depoMap[depoVO.depo_trans_type]}</td>
									<td>${depoVO.depo_amount}</td>
									<td>${depoVO.depo_point}</td>
									<td>${SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(depoVO.depo_time)}</td>
								</tr>
							</c:forEach>	
							</table>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
		<!-- MEMBER QUICK VIEW MODAL -->
		 
		<c:forEach var="memVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<div id="${memVO.mem_no }" class="modal fade quick-view" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">��</button>
						<div class="media flex-wrap">
							<div class="media-left px-0">
								<img  style=" box-sizing:border-box;width:300px; height:300px" class="media-object" src="<%= request.getContextPath()%>/MemPic?mem_account=${memVO.mem_account}" alt="Image">
							</div>
							<div class="media-body">
								<h2>${memVO.mem_name}</h2>
								<table class="table table-striped" style="text-alignLcenter;">
									<tr  class="table-info"><th>�|���s��</th><td>${memVO.mem_no}</td></tr>
									<tr><th>�|���m�W</th><td>${memVO.mem_name}</td></tr>
									<tr  class="table-info"><th>�|���b��</th><td>${memVO.mem_account}</td></tr>
									<tr><th>�q��</th><td>${memVO.mem_phone}</td></tr>
									<tr  class="table-info"><th>Email</th><td>${memVO.mem_email}</td></tr>
									<tr><th>�ͤ�</th><td>${memVO.mem_born}</td></tr>
									<tr  class="table-info"><th>�ʧO</th><td>${memVO.mem_sex}</td></tr>
									<tr><th>��}</th><td>${memVO.mem_addr}</td></tr>
									<tr  class="table-info"><th>�Ȧ�b��</th><td>${memVO.mem_bank}</td></tr>
									<tr><th>�|������</th><td>${memVO.mem_level}</td></tr>
									<tr  class="table-info"><th>�H�οn��</th><td>${memVO.mem_creScore}</td></tr>
									<tr ><th>��Ц���</th><td>${memVO.mem_abandon}</td></tr>
									<tr class="table-info"><th >���Ҫ��A</th>
											<td style="">${memMap[memVO.mem_status]}
												<c:if test="${memVO.mem_status.equals('M0')}">
													<form METHOD="post" ACTION="<%= request.getContextPath() %>/Front-mem/mem.do"enctype="multipart/form-data"style="margin-bottom: 0px;">
													<button type="submit" class="btn btn-info btn-rounded btn-sm" style="border-radius: .25rem; float:right;display: inline-block; ">�o�{�ҫH</button>
													<input type="hidden" name="mem_email"  value="${memVO.mem_email}"/>
							     					<input type="hidden" name="action" value="sendEmail"/>
							     					<input type="hidden" name="mailAction" value="openMem"/>
												</form>
												</c:if> 
											</td>
									</tr>
									<tr><th>�Τ᪬�A</th>
											<td>${memMap[memVO.mem_type]}
												<c:choose>
													<c:when test="${memVO.mem_type.equals('TRUE')}">
														<form METHOD="post" ACTION="<%=request.getContextPath() %>/Front-mem/mem.do"enctype="multipart/form-data"style="margin-bottom: 0px;">
															<button type="submit" class="btn btn-danger btn-sm" style="border-radius: .25rem;float:right;display: inline-block;">����Τ�</button>
															<input type="hidden" name="mem_account"  value="${memVO.mem_account}">
									     					<input type="hidden" name="action" value="blockMem">
														</form>
													</c:when> 
													<c:otherwise>
														<form METHOD="post" ACTION="<%=request.getContextPath() %>/Front-mem/mem.do"enctype="multipart/form-data"style="margin-bottom: 0px;">
															<button type="submit" class="btn btn-success btn-sm" style="border-radius: .25rem;float:right;display: inline-block;">����Τ�</button>
															<input type="hidden" name="mem_account"  value="${memVO.mem_account}">
									     					<input type="hidden" name="action" value="unlockMem">
														</form>
													</c:otherwise>
												</c:choose>
											</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
		
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

<!-- FOOTER -->
<jsp:include page="../assets/footerBack.jsp"></jsp:include>			
		</div></div></div>
	</body>
</html>
