<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="java.util.*" %>
<%@ page import="com.shop_product.model.*" %>
<%@ page import="com.shop_item.model.*" %>

<%
    ProdService prodSvc = new ProdService();
    List<ProdVO> list = prodSvc.getAll();
    pageContext.setAttribute("list",list);
%>
    
    
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <title>shopCart.jsp</title>

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
  <link href="assets2/img/favicon.png" rel="shortcut icon" />

  <script src="assets2/plugins/nprogress/nprogress.js"></script>
</head>


  <body class="navbar-fixed sidebar-fixed" id="body">


  <div class="navbar-right ">
    <ul class="nav navbar-nav">
      <li class="custom-dropdown">
        <a class="offcanvas-toggler active custom-dropdown-toggler" data-offcanvas="contact-off" href="javascript:" >
          <i class="fa fa-shopping-cart" style="position: absolute;right: 15%;margin-top:15px;color:rgba(0,0,0,0.7);font-size:40px"></i>
          <!-- <span class="badge badge-xs rounded-circle">1</span> -->
        </a>

      </li>
    </ul>
  </div>


    <!-- Card Offcanvas -->
    <div class="card card-offcanvas" id="contact-off" >
      <div class="card-header">
        <h2>購物車</h2>

         	<form name="checkoutForm" action="item.do" method="POST">
             <input type="hidden" name="action"  value="CHECKOUT"> 
              <button type="submit" class="btn btn-primary btn-pill px-4" 
        		style="background-color: #88B04B; border:solid 1px #88B04B;">結帳</button>
          </form>
     

      </div>
      <div class="card-body" style=" width: 350px;">

        <div class="mb-4">
          <input type="text" class="form-control form-control-lg form-control-secondary rounded-0" placeholder="Search contacts...">
        </div>

 
 	<% Vector<ItemVO> buylist = (Vector<ItemVO>) session.getAttribute("shopcart");
 	%>
	 <%if (buylist != null && (buylist.size() > 0)) {%> 
	<%
	 for (int index = 0; index < buylist.size(); index++) {
		ItemVO itemVO = buylist.get(index);
	%>
	
	<%	
		ProdVO prodVO = new ProdVO();
		for(int i = 0; i < list.size(); i++){
			if((itemVO.getProdNo()).equals(list.get(i).getProdNo()) ){
				prodVO = list.get(i);
			}
		}
	%>

        <div class="media media-sm" style="margin-top: 10px;">
          <div class="media-sm-wrapper">
          
          
    <form method="post" action="<%=request.getContextPath()%>/shop_product/prod.do">
            <button type="submit">
    <img src="<%=request.getContextPath()%>/getPictureServlet?prod_no=<%=prodVO.getProdNo()%>" 
    style="height:100%; width:100%; border-radius:0%;">
            </button>
            <input type="hidden" name="prod_no" value="<%=prodVO.getProdNo()%>">
			<input type="hidden" name="action" value="getOne_For_Display">
    </form>
    
    
          </div>
          <div class="media-body">
     <form method="post" action="<%=request.getContextPath()%>/shop_product/prod.do">
            <button type="submit">
              <span class="title"><%=prodVO.getProdName()%></span>
              <%int price = prodVO.getProdPrice().intValue();%>
              <span>NT$ <%=price%></span>
            </button>
            <input type="hidden" name="prod_no" value="<%=prodVO.getProdNo()%>">
			<input type="hidden" name="action" value="getOne_For_Display">
	  </form>
          </div>
        </div>
        
 	<table class="table" style="border-bottom: 1px solid #e5e9f2; border-top: 2px solid white; margin-top:-30px;">
	    <tr>
	      <td scope="row">數量：<%=itemVO.getItemQuantity()%></td>
	      <!--價格去小數-->
	      <%int priceTotal = (int)(prodVO.getProdPrice()*itemVO.getItemQuantity());%>
	      <td>小計NT＄ <%=priceTotal%></td>
	      <td>
	      	<form name="deleteForm" action="item.do" method="POST">
	           <input type="hidden" name="action"  value="DELETE">
	           <input type="hidden" name="del" value="<%= index %>">
	           <!--送出當前路徑，回來的時候才知道要回到哪-->
				<input type="hidden" name="requestURL" value="<%=request.getRequestURL()%>?<%=request.getQueryString()%>"> 
	           <button class="badge badge-danger" type="submit" value="">刪 除</button>
	        </form>
	      </td>
	    </tr>
	</table>
         
   		<%}%>
   	<%}%>

      

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


 	

</body>
</html>
