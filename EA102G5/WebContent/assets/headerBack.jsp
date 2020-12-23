<%@page import="com.func.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="Big5"%>
<%@page import="java.util.*"%>
<%@page import="com.auth.model.*"%>
<%@page import="com.emp.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	AuthService authSvc = new AuthService();
	List<AuthVO> authList = authSvc.getAll();
	pageContext.setAttribute("authList", authList);

	EmpService empSvc = new EmpService();
	List<EmpVO> empList = empSvc.getAll();
	pageContext.setAttribute("empList", empList);

	FuncService funcSvc = new FuncService();
	List<FuncVO> funcList = funcSvc.getAll();
	pageContext.setAttribute("funcList", funcList);

	AuthService authSvc2 = new AuthService();

	AuthVO authVO = (AuthVO) request.getAttribute("authVO");
	List<AuthVO> oneEmpList = (List<AuthVO>) request.getAttribute("oneEmpList");

	List<String> oneEmpFuncsList = (List<String>) request.getAttribute("oneEmpFuncsList");
	
	EmpVO empVO = (EmpVO) session.getAttribute("empVO");
%>

<!DOCTYPE html>
<html lang="zh_TW">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>headerBack.jsp</title>

  <!-- Custom fonts for this template-->
  <link href="<%=request.getContextPath()%>/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="<%=request.getContextPath()%>/assets/vendor/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar"
    style="background: rgba(0,0,0,0.85); height:auto">

      <!-- Sidebar - Brand -->
      <div>
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=request.getContextPath()%>/backEndG5/backEndHome.jsp">
          <img src="<%=request.getContextPath()%>/assets/vendor/logo3.png" width="215.8px" height="41.6px">
      </a>
    </div>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item">
        <a class="nav-link" href="<%=request.getContextPath()%>/backEndG5/backEndHome.jsp">
          <i class="fas fa-tasks"></i>
          <span>後台管理首頁</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        介面
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#one" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-user-lock"></i>
          <span>管理員專區</span>
        </a>
        <div id="one" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">管理項目:</h6>
			<c:if test="${fn:contains(empAuthList,'f001')}">
            	<a class="collapse-item" href="<%=request.getContextPath()%>/backEndG5/showAllEmp.jsp">管理員</a>
            </c:if>
            <c:if test="${fn:contains(empAuthList,'f002')}">
            	<a class="collapse-item" href="<%=request.getContextPath()%>/backEndG5/showAllServ.jsp">客服管理</a>
            </c:if>
            <c:if test="${fn:contains(empAuthList,'f004')}">
           		<a class="collapse-item" href="<%=request.getContextPath()%>/backEndG5/showAllFunc.jsp">權限項目管理</a>
           	</c:if>
           	<c:if test="${fn:contains(empAuthList,'f005')}">
         		<a class="collapse-item" href="<%=request.getContextPath()%>/backEndG5/showAllAuth.jsp">權限管理</a>          
			</c:if>          
          </div>
        </div>
      </li>

      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#two" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-users"></i>
          <span>會員專區</span>
        </a>
        <div id="two" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">會員管理項目:</h6>
            <c:if test="${fn:contains(empAuthList,'f010')}">
            <a class="collapse-item" href="<%=request.getContextPath()%>/Back-mem/empSeletAllMem.jsp">會員資料管理</a>
            <a class="collapse-item" href="<%=request.getContextPath()%>/Back-mem/empSelectAllWithdraw.jsp">會員點數提領申請</a>
            <a class="collapse-item" href="<%=request.getContextPath()%>/Back-mem/empSelectAllDepo.jsp">會員代幣記錄管理</a>    
			</c:if>
          </div>
        </div>
      </li>

       <hr class="sidebar-divider d-none d-md-block">

       <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#three" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-store"></i>
          <span>商城管理</span>
        </a>
        <div id="three" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">商城管理項目:</h6>
            <c:if test="${fn:contains(empAuthList,'f006')}">
            <a class="collapse-item" href="<%=request.getContextPath()%>/shop_product/listAllProd.jsp">商品管理</a>
            <a class="collapse-item" href="<%=request.getContextPath()%>/shop_product/listAllOrd.jsp">訂單管理</a>
            <a class="collapse-item" href="<%=request.getContextPath()%>/shop_product/listAllCoup.jsp">優惠券管理</a>
            <a class="collapse-item" href="<%=request.getContextPath()%>/shop_product/addProd.jsp">新增商品</a>
            </c:if>
          </div>
        </div>
      </li>

       <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#four" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-exchange-alt"></i>
          <span>交換管理</span>
        </a>
        <div id="four" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">交換管理項目:</h6>
            <c:if test="${fn:contains(empAuthList,'f007')}">
            <a class="collapse-item" href="<%=request.getContextPath()%>/back_end/readreport.jsp">交換管理</a>
            </c:if>
          </div>
        </div>
      </li>

       <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#five" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-gavel"></i>
          <span>競標管理</span>
        </a>
        <div id="five" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">競標管理項目:</h6>
            <c:if test="${fn:contains(empAuthList,'f008')}">
            <a class="collapse-item" href="<%=request.getContextPath()%>/bid_front/back.jsp">競標管理</a>
            </c:if>
          </div>
        </div>
      </li>

      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#six" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-gifts"></i>
          <span>直購管理</span>
        </a>
        <div id="six" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">直購管理項目:</h6>
            <c:if test="${fn:contains(empAuthList,'f009')}">
            <a class="collapse-item" href="<%=request.getContextPath()%>/bpclass-back/listbackbp.jsp">直購管理</a>
            </c:if>
          </div>
        </div>
      </li>

<!--       Nav Item - Utilities Collapse Menu -->
<!--       <li class="nav-item"> -->
<!--         <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#seven" aria-expanded="true" aria-controls="collapseUtilities"> -->
<!--           <i class="far fa-newspaper"></i> -->
<!--           <span>論壇管理</span> -->
<!--         </a> -->
<!--         <div id="seven" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar"> -->
<!--           <div class="bg-white py-2 collapse-inner rounded"> -->
<!--             <h6 class="collapse-header">論壇管理項目</h6> -->
<%--             <c:if test="${fn:contains(empAuthList,'f011')}"> --%>
<!--             <a class="collapse-item" href="utilities-color.html">Colors</a> -->
<!--             <a class="collapse-item" href="utilities-border.html">Borders</a> -->
<!--             <a class="collapse-item" href="utilities-animation.html">Animations</a> -->
<!--             <a class="collapse-item" href="utilities-other.html">Other</a> -->
<%--             </c:if> --%>
<!--           </div> -->
<!--         </div> -->
<!--       </li> -->

      <!-- Divider -->
      <hr class="sidebar-divider">

     

      <!-- Sidebar Toggler (Sidebar) -->
    <!--   <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div> -->

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
<!--       <div id="content">
		
        Topbar
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"
        style="background: red;">
        </nav>
        
       </div> -->
      
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="topBar" style="background:rgba(0,0,0,0.85);">
          <div class="container">
            <div class="row">
              <div class="col-md-6 d-none d-md-block">

              </div>
              <div class="col-md-6 col-12">
                <ul class="list-inline float-right top-right">
                  <li class="account-login">
                  <span>
                  <a href="<%=request.getContextPath()%>/backEndG5/backEndHome.jsp"
                  style="color:white;position:relative;top:8px">安安~ <%=empVO.getEmpName()%></a>
                  
                  <small style="color:white;position:relative;top:8px"></small>
                  
                  <a href="<%=request.getContextPath()%>/empLogin/logout" 
                  style="color:white;position:relative;top:8px">登出</a>
                  
                   <small style="color:white;position:relative;top:8px"></small>
                  
                  <a href="<%=request.getContextPath()%>/backEndG5/resign.jsp" 
                  style="color:white;position:relative;top:8px">登出(物理)</a>
                  
                  </span>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div> 
        
       






  <!-- Bootstrap core JavaScript-->
 <!--  <script src="vendor/jquery/jquery.min.js"></script> --> 
 <!--  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

  <!-- Core plugin JavaScript-->
  <!-- <script src="vendor/jquery-easing/jquery.easing.min.js"></script> -->

  <!-- Custom scripts for all pages-->
<!--   <script src="vendor/js/sb-admin-2.min.js"></script> -->


