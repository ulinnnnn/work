<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.shop_product.model.*"%>
<%@ page import="com.shop_category.model.*"%>

<%
	/* ProdService prodSvc = new ProdService();
	ProdVO prodVO = prodSvc.getOneProd("p001"); */
	ProdVO prodVO = (ProdVO) request.getAttribute("prodVO");
%>



<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <title>listProdDetail.jsp</title>

  <!-- GOOGLE FONTS -->
  <link href="https://fonts.googleapis.com/css?family=Karla:400,700|Roboto" rel="stylesheet">
  <link href="assets2/plugins/material/css/materialdesignicons.min.css" rel="stylesheet" />
  <link href="assets2/plugins/simplebar/simplebar.css" rel="stylesheet" />

  <!-- PLUGINS CSS STYLE -->
  <link href="assets2/plugins/nprogress/nprogress.css" rel="stylesheet" />
  
  
  <link href="assets2/plugins/prism/prism.css" rel="stylesheet" />
  
  
  <!-- MONO CSS -->
  <link id="main-css-href" rel="stylesheet" href="assets2/css/mono.css" />

  


  <!-- FAVICON -->
  <link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/img/favicon.png">

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
    <h3>查看商品詳情</h3>
  </div>
</div>



<div class="row">


  <div class="col-xl-6 col-md-6">
    <!-- Basic Examples -->
    <div class="card card-default">
      <div class="card-header">
        <h2>商品詳情</h2>
      </div>
      <div class="card-body" style="font-size:16px !important;">
        <div class="collapse" id="collapse-basic-input">
          <pre class="language-html mb-4">

          </pre>
        </div>
 		 <div class="form-group">
            <label for="exampleFormControlInput2">商品編號</label>
           	<p><%=prodVO.getProdNo() %></p>
          </div>
          <div class="form-group">
            <label for="exampleFormControlInput2">商品名稱</label>
            <p><%=prodVO.getProdName() %></p>
          </div>
          <div class="form-group">
            <label for="exampleFormControlPassword">價格</label>
            <!-- 價格去小數 -->
            <% int price = prodVO.getProdPrice().intValue(); %>
            <p>NT$ <%=price%></p>
          </div>
          <div class="form-group">
            <label for="exampleFormControlPassword">品牌</label>
            <p><%=prodVO.getProdBrand() %></p>
          </div>
          <%
          	CategoryService CategorySvc = new CategoryService();
          	List<CategoryVO> list = CategorySvc.getAll();
          %>
          <div class="form-group">
            <label for="exampleFormControlSelect12">商品種類</label>
          <%String category_name = new CategoryService().getOneCategory(prodVO.getCategoryNo()).getCategoryName();%>
           <p><%=category_name%></p>
          </div>
          
          <div class="form-group">
            <label for="exampleFormControlSelect12">上架日期</label>
            <p>
           	<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="<%=prodVO.getProdDate()%>"></fmt:formatDate>
           	</p>
          </div>
         
          <div class="form-group">
            <label for="exampleFormControlSelect12">商品狀態</label>
            <p><%=prodVO.getProdStatus() %></p>
          </div>

          <div class="form-group">
            <label for="exampleFormControlPassword">介紹</label>
            <p><%=prodVO.getProdIntro() %></p>
          </div>
          <div class="form-footer mt-6">
          </div>

      </div>
    </div>
  </div>
  <div class="col-xl-6 col-md-6">
    <!-- Basic Examples -->
    <div class="card card-default">
    	<div class="card-header">
       		<h2>圖片</h2>
      	</div>
      	<div class="card-body">
	         <div class="form-group"
	          style="height:460px;width:460px;border:solid 1px rgba(0,0,0,0.3);box-sizing:border-box">
	         	<img id="image" src="<%=request.getContextPath()%>/getPictureServlet?prod_no=<%=prodVO.getProdNo()%>"
	            height="460px" width="460px">
	         </div>
	        <div class="form-footer mt-6">
            	<a  href="listAllProd.jsp" class="btn btn-light btn-pill"
            	style="background:#ffb703;border-color: #ffb703;color:#fff;">返回商品列表</a>
          	</div>
	      </div>
      
    </div>
  </div>
  
  
  
  
</div>

</div>
</div>

                    <script src="assets2/plugins/jquery/jquery.min.js"></script>
                    <script src="assets2/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
                    <script src="assets2/plugins/simplebar/simplebar.min.js"></script>
                    <script src="https://unpkg.com/hotkeys-js/dist/hotkeys.min.js"></script>
                    <script src="assets2/plugins/prism/prism.js"></script>
                    <script src="assets2/js/mono.js"></script>
                    <script src="assets2/js/chart.js"></script>
                    <script src="assets2/js/map.js"></script>
                    <script src="assets2/js/custom.js"></script>

<jsp:include page="/assets/footerBack.jsp"></jsp:include>   
</div>
</div>
</div>

</body>
</html>