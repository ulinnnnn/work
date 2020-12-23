<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.shop_product.model.*"%>
<%@ page import="com.shop_order.model.*"%>
<%@ page import="com.shop_item.model.*"%>
<%@ page import="com.shop_coupon.model.*"%>

<%
/* 	OrdService ordSvc = new OrdService();
	List<OrdVO> list = ordSvc.getAll();
	pageContext.setAttribute("list",list); */

%>
    
    
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <title>listAllOrd.jsp</title>

  <!-- GOOGLE FONTS -->
  <link href="https://fonts.googleapis.com/css?family=Karla:400,700|Roboto" rel="stylesheet">
  <link href="assets2/plugins/material/css/materialdesignicons.min.css" rel="stylesheet" />
  <link href="assets2/plugins/simplebar/simplebar.css" rel="stylesheet" />

  <!-- PLUGINS CSS STYLE -->
  <link href="assets2/plugins/nprogress/nprogress.css" rel="stylesheet" />
  
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
    <h3>商城訂單管理</h3>
  </div>
</div>
  
  
  <!-- 以下是待出貨訂單 -->
  <div class="card card-default">
  <div class="card-header align-items-center px-3 px-md-5">
    <h2>待出貨訂單</h2>
  </div>

  <div class="card-body px-3 px-md-5">
    <div class="row">
  
  <%
  		OrdService ordSvc = new OrdService();
  		String ord_status = "已付款";
  		List<OrdVO> paidList = ordSvc.getOrdStatus(ord_status);
  		for(int i = 0; i < paidList.size(); i++){
  			OrdVO ordVO = paidList.get(i);
  			
  			ItemService itemSvc = new ItemService();
  			List<ItemVO> itemlist = itemSvc.getItem(ordVO.getOrdNo());
  			
  			

  %>
 	             <!--這裡下面是每一張訂單  -->
      <div class="col-lg-6 col-xl-6" >
        <div class="card card-default p-4">
          <a href="javascript:0" class="media text-secondary" data-toggle="modal" data-target="#<%=ordVO.getOrdNo()%>"
          style="text-decoration:none;">
          
		<div class="row" >
		 <div class="col-lg-12 col-xl-12" >
			<h5 class="mt-0 mb-2 text-dark" >訂單編號 <%=ordVO.getOrdNo() %></h5>
			<hr>
		</div> 
		
		 <div class="col-lg-6 col-xl-6">
            <div class="media-body">
              <ul class="list-unstyled text-smoke">
                <li class="d-flex">
                  <i class="mdi mdi-account mr-1"></i>
                  <span>購買會員: <%=ordVO.getMemNo()%></span>
                </li>
                 <li class="d-flex">
                  <i class="mdi mdi-calendar-multiselect mr-1"></i>
                  <span>購買日期:
                  		<fmt:formatDate pattern="yyyy-MM-dd" value="<%=ordVO.getOrdDate()%>"></fmt:formatDate>
                  </span>
                </li>
                
              </ul>
            </div>
           </div>
           
           <div class="col-lg-6 col-xl-6">
            <div class="media-body">
    
              <ul class="list-unstyled text-smoke">
                <li class="d-flex">
                  <i class="mdi mdi-plus mr-1"></i>
                   <span>查看訂單明細</span>
                </li>
                <li class="d-flex">
                  <i class="mdi mdi-ballot-outline mr-1"></i>
                  <span>訂單狀態:</span>
                  <p class="badge badge-square badge-dark"
                  style="font-size:16px; margin-left:7px;background:#06d6a0;"><%=ordVO.getOrdStatus()%></p>
                </li>
               
              </ul>
            </div>
           </div>
            <div class="col-lg-12 col-xl-12">
            <div class="media-body">   
              <ul class="list-unstyled text-smoke">
               <li class="d-flex">
                  <i class="mdi mdi-package-variant-closed mr-1"></i>
                  <span>收件人: <%=ordVO.getOrdName()%></span>
                </li>
             	<li class="d-flex">
                  <i class="mdi mdi-phone mr-1"></i>
                  <span>電話: <%=ordVO.getOrdPhone()%></span>
                </li>
                <li class="d-flex">
                  <i class="mdi mdi-email mr-1"></i>
                  <span>信箱: <%=ordVO.getOrdMail()%></span>
                </li>
                <li class="d-flex">
                  <i class="mdi mdi-home mr-1"></i>
                  <span>運送地址:  <%=ordVO.getOrdCode()%><%=ordVO.getOrdCity()%>
                  <%=ordVO.getOrdSection()%><%=ordVO.getOrdAddress()%></span>
                </li>
              </ul>
            </div>
           </div>
           </div>
          </a>
        </div>
      </div>
            <!--這裡下面是隱藏的訂單明細（已付款） -->
      <div class="modal fade" id="<%=ordVO.getOrdNo() %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header justify-content-end border-bottom-0">
      
				
        
				
        <button type="button" class="btn-close-icon" data-dismiss="modal" aria-label="Close">
          <i class="mdi mdi-close"></i>
        </button>
			</div>
			
      <div class="modal-body pt-0">
        <div class="row no-gutters">
        
      <div class="col-md-12">
	     <div class="contact-info px-4">
	       <h4 class="mb-1">訂單編號 <%=ordVO.getOrdNo() %></h4>
	     </div>
      </div>
					
		<div class="col-md-12">
            <div class="contact-info px-4">
            
             <div class="table-responsive">
              <table class="table mt-3 table-striped" style="width:100%">
                <thead>
                  <tr>
                    <th>照片</th>
                    <th>商品名稱</th>
                    <th>價錢</th>
                    <th>數量</th>
                    <th>小計</th>
           
                  </tr>
                </thead>
                <tbody>
                
                 <%
					for(int j = 0; j < itemlist.size(); j++){
					ItemVO itemVO = itemlist.get(j);
			
					ProdService prodSvc = new ProdService();
					ProdVO prodVO = prodSvc.getOneProd(itemVO.getProdNo()); 

 				%>
                
                  <tr style="font-size: 18px; color: rgba(0,0,0,0.9)">
                    <td><img src="<%=request.getContextPath()%>/getPictureServlet?prod_no=<%=prodVO.getProdNo()%>"
                    height="100px" width="80px"></td>
                    <td><%=prodVO.getProdName() %></td>
                    <!-- 價錢去小數 -->
             		<% int price = prodVO.getProdPrice().intValue(); %>
                    <td>NT$ <%=price %></td>
                    <td><%=itemVO.getItemQuantity() %></td>
                    <!-- 價錢去小數 -->
             		<% price = (int) (prodVO.getProdPrice()*itemVO.getItemQuantity()); %>
                    <td>NT$ <%=price%></td>
                    <td></td>
                  </tr>
                  
                <%}%>
                </tbody>
               
              </table>
              
            </div>
               <hr>
               <div class="float-right">
               
	               	<h6 style="position: relative; right: 10%;margin: 10px;">使用優惠券:<%=ordVO.getOrdCoup() %></h6>
	               	<% if(!"無".equals(ordVO.getOrdCoup())){
	               	double discount = new CoupService().getOneCoup(ordVO.getOrdCoup()).getCoupDiscount()*10; %>
	               	<h6 style="position: relative; right: 10%;margin: 10px;">優惠券折扣:<%=discount %>折</h6>
	               	<%}%>
	             	<!-- 價錢去小數 -->
	             	<% int price = Double.valueOf(ordVO.getOrdPrice()).intValue(); %>
	               	<h5 style="position: relative; right: 10%;margin: 10px;">總金額 NT$ <%=price %></h5>
               </div>
               
               	<Form METHOD="post" ACTION="order.do">
					<input type="hidden" name="ord_status" value="已出貨">
					<input type="hidden" name="ord_no" value="<%=ordVO.getOrdNo()%>">
					<input type="hidden" name="action" value="Update_Status">
					<button type="submit" class="btn btn-sm btn-success"
                  		style="width: 80px;height: 40px; position: relative;letter-spacing: 3px;font-size:18px;margin:20px;
                  				font-weight: 500;background:#06d6a0;border-color:#06d6a0">
                  		出貨
                 	 </button>
				</Form>

            </div>
          </div>
		
        </div>
      </div>
    </div>
  </div>
</div>
  
 <%}%>
      
      
   
  </div>
  </div>
  </div>
<!-- 以上是待出貨訂單 -->  

<!-- 以下是已出貨訂單 -->
  <div class="card card-default">
  <div class="card-header align-items-center px-3 px-md-5">
    <h2>已出貨訂單</h2>
  </div>

  <div class="card-body px-3 px-md-5">
    <div class="row">
  
  <%
  		ord_status = "已出貨";
		List<OrdVO> deliverList = ordSvc.getOrdStatus(ord_status);
  		for(int i = 0; i < deliverList.size(); i++){
  			OrdVO ordVO = deliverList.get(i);
  			
  			ItemService itemSvc = new ItemService();
  			List<ItemVO> itemlist = itemSvc.getItem(ordVO.getOrdNo());
  			
  			

  %>
 	             <!--這裡下面是每一張訂單  -->
      <div class="col-lg-6 col-xl-6" >
        <div class="card card-default p-4">
          <a href="javascript:0" class="media text-secondary" data-toggle="modal" data-target="#<%=ordVO.getOrdNo()%>"
          style="text-decoration:none;">
          
		<div class="row" >
		 <div class="col-lg-12 col-xl-12" >
			<h5 class="mt-0 mb-2 text-dark" >訂單編號 <%=ordVO.getOrdNo() %></h5>
			<hr>
		</div> 
		
		 <div class="col-lg-6 col-xl-6">
            <div class="media-body">
              <ul class="list-unstyled text-smoke">
                <li class="d-flex">
                  <i class="mdi mdi-account mr-1"></i>
                  <span>購買會員: <%=ordVO.getMemNo()%></span>
                </li>
                 <li class="d-flex">
                  <i class="mdi mdi-calendar-multiselect mr-1"></i>
                  <span>購買日期:
                  		<fmt:formatDate pattern="yyyy-MM-dd" value="<%=ordVO.getOrdDate()%>"></fmt:formatDate>
                  </span>
                </li>
                
              </ul>
            </div>
           </div>
           
           <div class="col-lg-6 col-xl-6">
            <div class="media-body">
    
              <ul class="list-unstyled text-smoke">
                <li class="d-flex">
                  <i class="mdi mdi-plus mr-1"></i>
                   <span>查看訂單明細</span>
                </li>
                <li class="d-flex">
                  <i class="mdi mdi-ballot-outline mr-1"></i>
                  <span>訂單狀態:</span>
                  <p class="badge badge-square badge-dark"
                  style="font-size:16px; margin-left:7px;background:#118ab2;"><%=ordVO.getOrdStatus()%></p>
                </li>
               
              </ul>
            </div>
           </div>
            <div class="col-lg-12 col-xl-12">
            <div class="media-body">   
              <ul class="list-unstyled text-smoke">
               <li class="d-flex">
                  <i class="mdi mdi-package-variant-closed mr-1"></i>
                  <span>收件人: <%=ordVO.getOrdName()%></span>
                </li>
             	<li class="d-flex">
                  <i class="mdi mdi-phone mr-1"></i>
                  <span>電話: <%=ordVO.getOrdPhone()%></span>
                </li>
                <li class="d-flex">
                  <i class="mdi mdi-email mr-1"></i>
                  <span>信箱: <%=ordVO.getOrdMail()%></span>
                </li>
                <li class="d-flex">
                  <i class="mdi mdi-home mr-1"></i>
                  <span>運送地址:  <%=ordVO.getOrdCode()%><%=ordVO.getOrdCity()%>
                  <%=ordVO.getOrdSection()%><%=ordVO.getOrdAddress()%></span>
                </li>
              </ul>
            </div>
           </div>
           </div>
          </a>
        </div>
      </div>
            <!--這裡下面是隱藏的訂單明細（已付款） -->
      <div class="modal fade" id="<%=ordVO.getOrdNo() %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header justify-content-end border-bottom-0">
      
				
        
				
        <button type="button" class="btn-close-icon" data-dismiss="modal" aria-label="Close">
          <i class="mdi mdi-close"></i>
        </button>
			</div>
			
      <div class="modal-body pt-0">
        <div class="row no-gutters">
        
      <div class="col-md-12">
	     <div class="contact-info px-4">
	       <h4 class="mb-1">訂單編號 <%=ordVO.getOrdNo() %></h4>
	     </div>
      </div>
					
		<div class="col-md-12">
            <div class="contact-info px-4">
            
             <div class="table-responsive">
              <table class="table mt-3 table-striped" style="width:100%">
                <thead>
                  <tr>
                    <th>照片</th>
                    <th>商品名稱</th>
                    <th>價錢</th>
                    <th>數量</th>
                    <th>小計</th>
           
                  </tr>
                </thead>
                <tbody>
                
                 <%
					for(int j = 0; j < itemlist.size(); j++){
					ItemVO itemVO = itemlist.get(j);
			
					ProdService prodSvc = new ProdService();
					ProdVO prodVO = prodSvc.getOneProd(itemVO.getProdNo()); 

 				%>
                
                  <tr style="font-size: 18px; color: rgba(0,0,0,0.9)">
                    <td><img src="<%=request.getContextPath()%>/getPictureServlet?prod_no=<%=prodVO.getProdNo()%>"
                    height="100px" width="80px"></td>
                    <td><%=prodVO.getProdName() %></td>
                    <!-- 價錢去小數 -->
             		<% int price = prodVO.getProdPrice().intValue(); %>
                    <td>NT$ <%=price %></td>
                    <td><%=itemVO.getItemQuantity() %></td>
                    <!-- 價錢去小數 -->
             		<% price = (int) (prodVO.getProdPrice()*itemVO.getItemQuantity()); %>
                    <td>NT$ <%=price%></td>
                    <td></td>
                  </tr>
                  
                <%}%>
                </tbody>
               
              </table>
              
            </div>
               <hr>
               <div class="float-right">
               
	               	<h6 style="position: relative; right: 10%;margin: 10px;">使用優惠券:<%=ordVO.getOrdCoup() %></h6>
	               	<% if(!"無".equals(ordVO.getOrdCoup())){
	               	double discount = new CoupService().getOneCoup(ordVO.getOrdCoup()).getCoupDiscount()*10; %>
	               	<h6 style="position: relative; right: 10%;margin: 10px;">優惠券折扣:<%=discount %>折</h6>
	               	<%}%>
	             	<!-- 價錢去小數 -->
	             	<% int price = Double.valueOf(ordVO.getOrdPrice()).intValue(); %>
	               	<h5 style="position: relative; right: 10%;margin: 10px;">總金額 NT$ <%=price %></h5>
               </div>
              

            </div>
          </div>
		
        </div>
      </div>
    </div>
  </div>
</div>
  
 <%}%>
      
      
   
  </div>
  </div>
  </div>
<!-- 以上是已出貨訂單 -->  
  
  
 <!-- 以下是未付款訂單 -->
  <div class="card card-default">
  <div class="card-header align-items-center px-3 px-md-5">
    <h2>未付款訂單</h2>
  </div>

  <div class="card-body px-3 px-md-5">
    <div class="row">
  
  <%
  		ord_status = "未付款";
		List<OrdVO> payList = ordSvc.getOrdStatus(ord_status);
  		for(int i = 0; i < payList.size(); i++){
  			OrdVO ordVO = payList.get(i);
  			
  			ItemService itemSvc = new ItemService();
  			List<ItemVO> itemlist = itemSvc.getItem(ordVO.getOrdNo());

  %>
 	             <!--這裡下面是每一張訂單  -->
      <div class="col-lg-6 col-xl-6" >
        <div class="card card-default p-4">
          <a href="javascript:0" class="media text-secondary" data-toggle="modal" data-target="#<%=ordVO.getOrdNo()%>"
          style="text-decoration:none;">
          
		<div class="row" >
		 <div class="col-lg-12 col-xl-12" >
			<h5 class="mt-0 mb-2 text-dark" >訂單編號 <%=ordVO.getOrdNo() %></h5>
			<hr>
		</div> 
		
		 <div class="col-lg-6 col-xl-6">
            <div class="media-body">
              <ul class="list-unstyled text-smoke">
                <li class="d-flex">
                  <i class="mdi mdi-account mr-1"></i>
                  <span>購買會員: <%=ordVO.getMemNo()%></span>
                </li>
                <li class="d-flex">
                  <i class="mdi mdi-calendar-multiselect mr-1"></i>
                  <span>購買日期:
                  		<fmt:formatDate pattern="yyyy-MM-dd" value="<%=ordVO.getOrdDate()%>"></fmt:formatDate>
                  </span>
                </li>
             
                
              </ul>
            </div>
           </div>
           
           <div class="col-lg-6 col-xl-6">
            <div class="media-body">
    
              <ul class="list-unstyled text-smoke">
                <li class="d-flex">
                  <i class="mdi mdi-plus mr-1"></i>
                   <span>查看訂單明細</span>
                </li>
               <li class="d-flex">
                  <i class="mdi mdi-ballot-outline mr-1"></i>
                  <span>訂單狀態:</span>
                  <p class="badge badge-square badge-dark"
                  style="font-size:16px; margin-left:7px;background:#ef476f;"><%=ordVO.getOrdStatus()%></p>
                </li>
               
              </ul>
            </div>
           </div>
            <div class="col-lg-12 col-xl-12">
            <div class="media-body">   
              <ul class="list-unstyled text-smoke">
               <li class="d-flex">
                  <i class="mdi mdi-package-variant-closed mr-1"></i>
                  <span>收件人: <%=ordVO.getOrdName()%></span>
                </li>
             	<li class="d-flex">
                  <i class="mdi mdi-phone mr-1"></i>
                  <span>電話: <%=ordVO.getOrdPhone()%></span>
                </li>
                <li class="d-flex">
                  <i class="mdi mdi-email mr-1"></i>
                  <span>信箱: <%=ordVO.getOrdMail()%></span>
                </li>
                <li class="d-flex">
                  <i class="mdi mdi-home mr-1"></i>
                  <span>運送地址:  <%=ordVO.getOrdCode()%><%=ordVO.getOrdCity()%>
                  <%=ordVO.getOrdSection()%><%=ordVO.getOrdAddress()%></span>
                </li>
              </ul>
            </div>
           </div>
           </div>
          </a>
        </div>
      </div>
            <!--這裡下面是隱藏的訂單明細（未付款） -->
      <div class="modal fade" id="<%=ordVO.getOrdNo() %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header justify-content-end border-bottom-0">
      
				
        
				
        <button type="button" class="btn-close-icon" data-dismiss="modal" aria-label="Close">
          <i class="mdi mdi-close"></i>
        </button>
			</div>
			
      <div class="modal-body pt-0">
        <div class="row no-gutters">
        
      <div class="col-md-12">
	     <div class="contact-info px-4">
	       <h4 class="mb-1">訂單編號 <%=ordVO.getOrdNo() %></h4>
	     </div>
      </div>
					
		<div class="col-md-12">
            <div class="contact-info px-4">
            
             <div class="table-responsive">
              <table class="table mt-3 table-striped" style="width:100%">
                <thead>
                  <tr>
                    <th>照片</th>
                    <th>商品名稱</th>
                    <th>價錢</th>
                    <th>數量</th>
                    <th>小計</th>
           
                  </tr>
                </thead>
                <tbody>
                
                 <%
					for(int j = 0; j < itemlist.size(); j++){
					ItemVO itemVO = itemlist.get(j);
			
					ProdService prodSvc = new ProdService();
					ProdVO prodVO = prodSvc.getOneProd(itemVO.getProdNo()); 

 				%>
                
                  <tr style="font-size: 18px; color: rgba(0,0,0,0.9)">
                    <td><img src="<%=request.getContextPath()%>/getPictureServlet?prod_no=<%=prodVO.getProdNo()%>"
                    height="100px" width="80px"></td>
                    <td><%=prodVO.getProdName() %></td>
                    <!-- 價錢去小數 -->
             		<% int price = prodVO.getProdPrice().intValue(); %>
                    <td>NT$ <%=price %></td>
                    <td><%=itemVO.getItemQuantity() %></td>
                    <!-- 價錢去小數 -->
             		<% price = (int) (prodVO.getProdPrice()*itemVO.getItemQuantity()); %>
                    <td>NT$ <%=price%></td>
                    <td></td>
                  </tr>
                  
                <%}%>
                </tbody>
               
              </table>
              
            </div>
               <hr>
               <div class="float-right">
               
	               	<h6 style="position: relative; right: 10%;margin: 10px;">使用優惠券:<%=ordVO.getOrdCoup() %></h6>
	               	<% if(!"無".equals(ordVO.getOrdCoup())){
	               	double discount = new CoupService().getOneCoup(ordVO.getOrdCoup()).getCoupDiscount()*10; %>
	               	<h6 style="position: relative; right: 10%;margin: 10px;">優惠券折扣:<%=discount %>折</h6>
	               	<%}%>
	             	<!-- 價錢去小數 -->
	             	<% int price = Double.valueOf(ordVO.getOrdPrice()).intValue(); %>
	               	<h5 style="position: relative; right: 10%;margin: 10px;">總金額 NT$ <%=price %></h5>
               </div>


            </div>
          </div>
		
        </div>
      </div>
    </div>
  </div>
</div>
  
 <%}%>

  </div>
  </div>
  </div>  
<!-- 以上是未付款訂單 -->

 <!-- 以下是訂單完成訂單 -->
  <div class="card card-default">
  <div class="card-header align-items-center px-3 px-md-5">
    <h2>訂單完成</h2>
  </div>

  <div class="card-body px-3 px-md-5">
    <div class="row">
  
  <%
  		ord_status = "訂單完成";
		List<OrdVO> finishList = ordSvc.getOrdStatus(ord_status);
  		for(int i = 0; i < finishList.size(); i++){
  			OrdVO ordVO = finishList.get(i);
  			
  			ItemService itemSvc = new ItemService();
  			List<ItemVO> itemlist = itemSvc.getItem(ordVO.getOrdNo());

  %>
 	             <!--這裡下面是每一張訂單  -->
      <div class="col-lg-6 col-xl-6" >
        <div class="card card-default p-4">
          <a href="javascript:0" class="media text-secondary" data-toggle="modal" data-target="#<%=ordVO.getOrdNo()%>"
          style="text-decoration:none;">
          
		<div class="row" >
		 <div class="col-lg-12 col-xl-12" >
			<h5 class="mt-0 mb-2 text-dark" >訂單編號 <%=ordVO.getOrdNo() %></h5>
			<hr>
		</div> 
		
		 <div class="col-lg-6 col-xl-6">
            <div class="media-body">
              <ul class="list-unstyled text-smoke">
                <li class="d-flex">
                  <i class="mdi mdi-account mr-1"></i>
                  <span>購買會員: <%=ordVO.getMemNo()%></span>
                </li>
                <li class="d-flex">
                  <i class="mdi mdi-calendar-multiselect mr-1"></i>
                  <span>購買日期:
                  		<fmt:formatDate pattern="yyyy-MM-dd" value="<%=ordVO.getOrdDate()%>"></fmt:formatDate>
                  </span>
                </li>
                
              </ul>
            </div>
           </div>
           
           <div class="col-lg-6 col-xl-6">
            <div class="media-body">
    
              <ul class="list-unstyled text-smoke">
                <li class="d-flex">
                  <i class="mdi mdi-plus mr-1"></i>
                   <span>查看訂單明細</span>
                </li>
                <li class="d-flex">
                  <i class="mdi mdi-ballot-outline mr-1"></i>
                  <span>訂單狀態:</span>
                  <p class="badge badge-square badge-dark"
                  style="font-size:16px; margin-left:7px;background:#ffd166;"><%=ordVO.getOrdStatus()%></p>
                </li>
               
              </ul>
            </div>
           </div>
            <div class="col-lg-12 col-xl-12">
            <div class="media-body">   
              <ul class="list-unstyled text-smoke">
               <li class="d-flex">
                  <i class="mdi mdi-package-variant-closed mr-1"></i>
                  <span>收件人: <%=ordVO.getOrdName()%></span>
                </li>
             	<li class="d-flex">
                  <i class="mdi mdi-phone mr-1"></i>
                  <span>電話: <%=ordVO.getOrdPhone()%></span>
                </li>
                <li class="d-flex">
                  <i class="mdi mdi-email mr-1"></i>
                  <span>信箱: <%=ordVO.getOrdMail()%></span>
                </li>
                <li class="d-flex">
                  <i class="mdi mdi-home mr-1"></i>
                  <span>運送地址:  <%=ordVO.getOrdCode()%><%=ordVO.getOrdCity()%>
                  <%=ordVO.getOrdSection()%><%=ordVO.getOrdAddress()%></span>
                </li>
              </ul>
            </div>
           </div>
           </div>
          </a>
        </div>
      </div>
            <!--這裡下面是隱藏的訂單明細（訂單完成） -->
      <div class="modal fade" id="<%=ordVO.getOrdNo() %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header justify-content-end border-bottom-0">
      
				
        
				
        <button type="button" class="btn-close-icon" data-dismiss="modal" aria-label="Close">
          <i class="mdi mdi-close"></i>
        </button>
			</div>
			
      <div class="modal-body pt-0">
        <div class="row no-gutters">
        
      <div class="col-md-12">
	     <div class="contact-info px-4">
	       <h4 class="mb-1">訂單編號 <%=ordVO.getOrdNo() %></h4>
	     </div>
      </div>
					
		<div class="col-md-12">
            <div class="contact-info px-4">
            
             <div class="table-responsive">
              <table class="table mt-3 table-striped" style="width:100%">
                <thead>
                  <tr>
                    <th>照片</th>
                    <th>商品名稱</th>
                    <th>價錢</th>
                    <th>數量</th>
                    <th>小計</th>
           
                  </tr>
                </thead>
                <tbody>
                
                 <%
					for(int j = 0; j < itemlist.size(); j++){
					ItemVO itemVO = itemlist.get(j);
			
					ProdService prodSvc = new ProdService();
					ProdVO prodVO = prodSvc.getOneProd(itemVO.getProdNo()); 

 				%>
                
                  <tr style="font-size: 18px; color: rgba(0,0,0,0.9)">
                    <td><img src="<%=request.getContextPath()%>/getPictureServlet?prod_no=<%=prodVO.getProdNo()%>"
                    height="100px" width="80px"></td>
                    <td><%=prodVO.getProdName() %></td>
                    <!-- 價錢去小數 -->
             		<% int price = prodVO.getProdPrice().intValue(); %>
                    <td>NT$ <%=price %></td>
                    <td><%=itemVO.getItemQuantity() %></td>
                    <!-- 價錢去小數 -->
             		<% price = (int) (prodVO.getProdPrice()*itemVO.getItemQuantity()); %>
                    <td>NT$ <%=price%></td>
                    <td></td>
                  </tr>
                  
                <%}%>
                </tbody>
               
              </table>
              
            </div>
               <hr>
               
               <div class="float-right">
               
	               	<h6 style="position: relative; right: 10%;margin: 10px;">使用優惠券:<%=ordVO.getOrdCoup() %></h6>
	               	<% if(!"無".equals(ordVO.getOrdCoup())){
	               	double discount = new CoupService().getOneCoup(ordVO.getOrdCoup()).getCoupDiscount()*10; %>
	               	<h6 style="position: relative; right: 10%;margin: 10px;">優惠券折扣:<%=discount %>折</h6>
	               	<%}%>
	             	<!-- 價錢去小數 -->
	             	<% int price = Double.valueOf(ordVO.getOrdPrice()).intValue(); %>
	               	<h5 style="position: relative; right: 10%;margin: 10px;">總金額 NT$ <%=price %></h5>
               </div>


            </div>
          </div>
		
        </div>
      </div>
    </div>
  </div>
</div>
  
 <%}%>

  </div>
  </div>
  </div>  
  
 <!-- 已上是訂單完成 --> 
  


</div>
</div>




            
                    <script src="assets2/plugins/jquery/jquery.min.js"></script>
                    <script src="assets2/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
                    <script src="assets2/plugins/simplebar/simplebar.min.js"></script>
                    <script src="https://unpkg.com/hotkeys-js/dist/hotkeys.min.js"></script>

                    
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
