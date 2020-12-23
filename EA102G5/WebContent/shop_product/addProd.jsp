<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="com.shop_product.model.*"%>
<%@ page import="com.shop_category.model.*"%>

<% 
	ProdVO prodVO = (ProdVO) request.getAttribute("prodVO");
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <title>addProd.jsp</title>

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
  <jsp:include page="/assets/headerBack.jsp" flush="true" />
   
   
<div class="content-wrapper">
<div class="content">

  
<div class="card card-default">
  <div class="px-6 py-4">
    <h3>商品新增</h3>
  </div>
</div>


 
<div class="row">


  <div class="col-xl-6 col-md-6">
    <!-- Basic Examples -->
    <div class="card card-default">
      <div class="card-header">
        <h2>新增商品</h2>
      </div>
      <div class="container">
      	<!-- 錯誤表列 -->
			<c:if test="${not empty errorMsgs}">
				<font style="color:red">請修正以下錯誤:</font>
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color:red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>
      </div>
      <div class="card-body">


  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/shop_product/prod.do" enctype="multipart/form-data">
          <div class="form-group">
            <label for="exampleFormControlInput2">商品名稱</label>
            <input id="prod_name" type="text" name="prod_name" class="form-control"
            value="<%= (prodVO==null)? "" : prodVO.getProdName()%>">
          </div>
          <div class="form-group">
            <label for="exampleFormControlPassword">價格</label>
            <input id="prod_price" type="text" name="prod_price" class="form-control"
			 value="<%= (prodVO==null)? "" : prodVO.getProdPrice()%>">
          </div>
          <div class="form-group">
            <label for="exampleFormControlPassword">品牌</label>
            <input id="prod_brand" type="text" name="prod_brand" class="form-control"
			 value="<%= (prodVO==null)? "" : prodVO.getProdBrand()%>">
          </div>
          <%
          	CategoryService CategorySvc = new CategoryService();
          	List<CategoryVO> list = CategorySvc.getAll();
          %>
          <div class="form-group">
            <label for="exampleFormControlSelect12">商品種類</label>
            <select id="category_no" name="category_no" class="form-control">
            <%for(int i = 0; i < list.size(); i++){
          		CategoryVO categoryVO = list.get(i); 
          		Integer j = i + 1;
          	%>
              <option value="<%= j %>"><%=categoryVO.getCategoryName() %></option>
            <%}%>
            </select>
          </div>
         
          <div class="form-group">
            <label for="exampleFormControlSelect12">商品狀態</label>
            <select id="prod_status" name="prod_status" class="form-control">
              <option value="上架中">上架中</option>
              <option value="下架中">下架中</option>
            </select>
          </div>
          <div class="form-group">
            <label for="exampleFormControlPassword">介紹</label>
            <input id="prod_intro" type="text" name="prod_intro" class="form-control"
			 value="<%= (prodVO==null)? "" : prodVO.getProdIntro()%>">
          </div>
          <div class="form-footer mt-6">
            <button type="submit" class="btn btn-primary btn-pill"
            style="background:#ffb703;border-color: #ffb703;">新增商品
            </button>
            <a href="<%=request.getContextPath()%>/shop_product/listAllProd.jsp" class="btn btn-light btn-pill">取消</a>
            <div id="magicBtn" class="btn btn-light btn-pill"
            style="position:absolute;right:30px">神奇小按鈕</div>
          </div>
          
          <input type="hidden" name="action" value="insert">
 

      </div>
    </div>
  </div>
  <div class="col-xl-6 col-md-6">
  	<div class="row">
    <!-- Basic Examples -->

    <div class="col-xl-12 col-md-12">
	    <div class="card card-default">
	    	<div class="card-header">
       			 <h2>圖片</h2>
      		</div>
      		 <div class="card-body">
	      		<div class="form-group">
	            	<label for="exampleFormControlFile1">請選擇一張照片</label>
	            	<input type="file" class="form-control-file" id="exampleFormControlFile1" name="prod_photo"
	            	onchange="showImg(this);">
	         	 </div>
	         	 <div class="form-group"
	         	  style="height:460px;width:460px;border:solid 1px rgba(0,0,0,0.3);box-sizing:border-box">
	            	<img id="image" src=""
	            	height="460px" width="460px" style="visibility:hidden;">
	         	 </div>
	         </div>
	    </div>
	</div>
	   </div>
    </div>
    
</FORM>    
    
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

<script type="text/javascript">
	var image = '';
	function showImg(file){
		
		if(!file.files || !file.files[0]){
			return;
		}
		
		var reader = new FileReader();
		reader.onload = function(evt){
			document.getElementById('image').src = evt.target.result;
			image = evt.target.result;
		}
		reader.readAsDataURL(file.files[0]);
		
		$('#image').css('visibility','visible');
		
	};
	
	$('#magicBtn').click(function(){
		$('#prod_name').empty();
		$('#prod_name').val('托拉法爾加羅');
		$('#prod_price').empty();
		$('#prod_price').val('550');
		$('#prod_brand').empty();
		$('#prod_brand').val('MegaHouse');
		$('select#category_no').val('1');
		$('select#prod_status').val('上架中');
		$('#prod_intro').empty();
		$('#prod_intro').val('紅心海賊團船長');

	});




</script>


</body>
</html>
