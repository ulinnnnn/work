<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.shop_product.model.*"%>
<%@ page import="com.shop_category.model.*"%>


<%
	ProdService prodSvc = new ProdService();
	List<ProdVO> list = prodSvc.getAll();
	pageContext.setAttribute("list",list);
%>
 <jsp:useBean id="categorySvc" scope="page" class="com.shop_category.model.CategoryService" />
    
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <title>listAllProd.jsp</title>

  <!-- GOOGLE FONTS -->
  <link href="https://fonts.googleapis.com/css?family=Karla:400,700|Roboto" rel="stylesheet">
  <link href="assets2/plugins/material/css/materialdesignicons.min.css" rel="stylesheet" />
  <link href="assets2/plugins/simplebar/simplebar.css" rel="stylesheet" />

  <!-- PLUGINS CSS STYLE -->
  <link href="assets2/plugins/nprogress/nprogress.css" rel="stylesheet" />
  
  
  <link href="assets2/plugins/prism/prism.css" rel="stylesheet" />
  
  
  
  <link href="assets2/plugins/DataTables/DataTables-1.10.18/css/jquery.dataTables.min.css" rel="stylesheet" />
  
  
  
  
  <!-- MONO CSS -->
  <link id="main-css-href" rel="stylesheet" href="assets2/css/mono.css" />

  


  <!-- FAVICON -->
  <link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/img/favicon.png">

  <!--
    HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries
  -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <script src="assets2/plugins/nprogress/nprogress.js"></script>
  
<style>

.sidebar{
	overflow:visible;
}

</style>   
  
  
</head>


  <body class="navbar-fixed sidebar-fixed" id="body">
	<jsp:include page="/assets/headerBack.jsp"></jsp:include> 
 
   
<div class="content-wrapper">
<div class="content">

<div class="card card-default">
  <div class="px-6 py-4">
    <h3>商城後台管理</h3>
  </div>
</div>

<!-- Products Inventory -->
<div class="card card-default">
  <div class="card-header">
    <h2>商品管理</h2>

  </div>
  <div class="card-body">
    <div class="collapse" id="collapse-data-tables">
      <pre class="language-html mb-4">
      </pre>
    </div>
    <table id="productsTable" class="table table-hover table-product" style="width:100%">
      <thead>
        <tr>
          <th>照片</th>
          <th>商品名稱</th>
          <th>商品編號</th>
          <th>價格</th>
          <th>狀態</th>
          <th>下架</th>
          <th>修改</th>
          <th>刪除</th>
          <th>查看</th>

        </tr>
      </thead>
      <tbody>
<%@ include file="pages/page1.file" %>
     <c:forEach var="prodVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
        <tr>
          <td class="py-0">
          	<img src="<%=request.getContextPath()%>/getPictureServlet?prod_no=${prodVO.getProdNo()}">
          </td>
          
          <td>${prodVO.getProdNo()}</td>
          <td>${prodVO.getProdName()}</td>
          
          <td>NT$ ${prodVO.getProdPrice()}</td>
 
          <td>${prodVO.getProdStatus()}</td>
          <c:choose>
          	<c:when test="${prodVO.getProdStatus()=='上架中'}">
	          <td>
	            <div class="dropdown">
	              <Form METHOD="post" ACTION="<%=request.getContextPath()%>/shop_product/prod.do">
						<input type="hidden" name="prod_no" value="${prodVO.getProdNo()}">
						<input type="hidden" name="prod_status" value="下架中">
						<input type="hidden" name="action" value="updateStatus">
						<input class="btn btn-sm btn-outline-danger" type="submit" 
						value="下架" style="height: 25px;width:50px;padding:2px">
					</Form>
	            </div>
	          </td>
	     	 </c:when>
	     	 <c:otherwise>
	     	 	<td>
	            <div class="dropdown">
	              <Form METHOD="post" ACTION="<%=request.getContextPath()%>/shop_product/prod.do">
						<input type="hidden" name="prod_no" value="${prodVO.getProdNo()}">
						<input type="hidden" name="prod_status" value="上架中">
						<input type="hidden" name="action" value="updateStatus">
						<input class="btn btn-sm btn-outline-info" type="submit" 
						value="上架" style="height: 25px;width:50px;padding:2px">
					</Form>
	            </div>
	          </td>
	     	 </c:otherwise>
	      </c:choose>
          <td>
            <div>
             	 <Form METHOD="post" ACTION="<%=request.getContextPath()%>/shop_product/prod.do">
					<input type="hidden" name="prod_no" value="${prodVO.getProdNo()}">
					<input type="hidden" name="action" value="getOne_For_Update">
					<input  class="btn btn-sm btn-outline-info" type="submit" 
					value="修改" style="height: 25px;width:50px;padding:2px">
				</Form>
            </div>
          </td>
          <td>
            <div class="dropdown">
              <Form METHOD="post" ACTION="<%=request.getContextPath()%>/shop_product/prod.do">
					<input type="hidden" name="prod_no" value="${prodVO.getProdNo()}">
					<input type="hidden" name="action" value="delete">
					<input class="btn btn-sm btn-outline-danger" type="submit" 
					value="刪除" style="height: 25px;width:50px;padding:2px">
				</Form>
            </div>
          </td>
          <td>
            <div class="dropdown">
              <Form METHOD="post" ACTION="<%=request.getContextPath()%>/shop_product/prod.do">
					<input type="hidden" name="prod_no" value="${prodVO.getProdNo()}">
					<!-- 標記是從後台發出的請求，才知道要回到後台 -->
					<input type="hidden" name="back_end" value="back_end">
					<input type="hidden" name="action" value="getOne_For_Display">
					<input class="btn btn-sm btn-success" type="submit"
					 value="查看詳情" style="height: 25px;width:70px;padding:2px">
				</Form>
            </div>
          </td>
        </tr>
     </c:forEach>

      </tbody>
    </table>

<%@ include file="pages/page2.file" %>

  </div>
</div>


</div>
</div>

    
                    <script src="assets2/plugins/jquery/jquery.min.js"></script>
                    <script src="assets2/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
                    <script src="assets2/plugins/simplebar/simplebar.min.js"></script>
                    <script src="https://unpkg.com/hotkeys-js/dist/hotkeys.min.js"></script>
                    <script src="assets2/plugins/prism/prism.js"></script>
                    <script src="assets2/plugins/DataTables/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
                    <script src="assets2/plugins/apexcharts/apexcharts.js"></script>
                    <script src="assets2/js/mono.js"></script>
                    <script src="assets2/js/chart.js"></script>
                    <script src="assets2/js/map.js"></script>
                   <!--  <script src="assets2/js/custom.js"></script> -->
                    
                    
<jsp:include page="/assets/footerBack.jsp"></jsp:include>               

<!--這是headerBack加的三個div  -->
</div>
</div>
</div>
<!--這是headerBack加的三個div  -->

</body>
</html>
