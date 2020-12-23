<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="java.util.*" %>
<%@ page import="com.shop_item.model.*"%>
<%@ page import="com.shop_product.model.*"%>
<%@ page import="com.shop_coupon.model.*"%>
<%@ page import="com.mem.model.*"%>

<%
	String coup_no = request.getParameter("coup_no");	

    ProdService prodSvc = new ProdService();
    List<ProdVO> list = prodSvc.getAll();
    pageContext.setAttribute("list",list);

    MemVO memVO = (MemVO)session.getAttribute("memVO");
%>

<!DOCTYPE html>
<html>
<head>

    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>shopCart</title>

    <!-- PLUGINS CSS STYLE -->
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
    <!-- <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/default.css" id="option_style"> -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/color-option5.css" id="option_style">

    <!-- Icons -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/img/favicon.png">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
<style>
.btn-primary-outlined{
	color: black;
}
</style>    

  </head>

  <body id="body" class="body-wrapper version1 up-scroll">
  
   <!-- header以下 -->
    <div class="main-wrapper" style="overflow:visible;">
    <div class="header clearfix">
   <jsp:include page="/assets/topBar.jsp" flush="true"/>
	</div>
	</div>
  <!-- header以上  -->


      <!-- LIGHT SECTION -->
      <section class="lightSection clearfix pageHeaderImage">
        <div class="container">
          <div class="tableBlock">
            <div class="row tableInner">
              <div class="col-sm-12">
                <div class="page-title">
                  <h2>購物車</h2>
                  <ol class="breadcrumb">
                    <li>
                      <a href="<%=request.getContextPath()%>/index1.jsp">首頁</a>
                    </li>
                    <li class="active">購物車</li>
                  </ol>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix cartListWrapper">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <div class="cartListInner">
               <!--  <form action="#"> --> <!-- 這個可能是xx -->
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th></th>
                          <th>商品名稱</th>
                          <th>價錢</th>
                          <th>數量</th>
                          <th>小計</th>
                        </tr>
                      </thead>
                      <tbody>
                        <!-- 這裡是一條明細 -->
                        	<%  @SuppressWarnings("unchecked")
								Vector<ItemVO> buylist = (Vector<ItemVO>) session.getAttribute("shopcart");
								String amount =  (String) session.getAttribute("amount");
							%>	
							<%	for (int i = 0; i < buylist.size(); i++) { 
								ItemVO itemVO = buylist.get(i);
								%>
		
							<%
								ProdVO prodVO = new ProdVO();
								for(int j = 0; j < list.size(); j++){
									if((buylist.get(i).getProdNo()).equals(list.get(j).getProdNo()) ){
									prodVO = list.get(j);
									}
								}
							%>
							<%
								
							
								String prod_no = itemVO.getProdNo();
								String prod_name = prodVO.getProdName();
								Double prod_price = prodVO.getProdPrice();
								Integer item_quantity = itemVO.getItemQuantity();
								
							%>
							
							
             
         
							
                        <tr>
                          <td class="">
                          
                     		<!-- 這個只是為了撐出一個空間而留的 -->
                        	 <button type="submit" class="close" ><span style="width:15px;visibility:hidden;">x</span></button>
                   
                           
                            <span class="cartImage"><img src="<%=request.getContextPath()%>/getPictureServlet?prod_no=<%=prodVO.getProdNo()%>" 
                             alt="image" width="68px" height="74px"></span>
                          </td>
                          <td class=""><%=prod_name %></td>
                          <!--價格去小數-->
				          <%int price = prod_price.intValue();%>
                          <td class="">NT$ <%=price %></td>
                          <td class="count-input">
                          <%=item_quantity %> 件
							             <%--  <a class="incr-btn" data-action="decrease" href="#"><i class="fa fa-minus"></i></a>
							              <input class="quantity" type="text" value="<%=item_quantity %>">
							              <a class="incr-btn" data-action="increase" href="#"><i class="fa fa-plus"></i></a> --%>
                          </td>
                          <!--價格去小數-->
				          <% price = (int)(prod_price*item_quantity);%>
                          <td class="">NT$ <%=price %></td>
                        </tr>
                        
                        <%}%>
                        
                        	

                      </tbody>
                    </table>
                  </div>
                  <div class="updateArea">
                    <div class="input-group">
           
                    
                    <!--   <a href="#" class="btn btn-primary-outlined" id="basic-addon2">使用優惠券</a> -->
                    </div>
                   <!--  <a href="#" class="float-right btn btn-secondary-outlined">update cart</a> -->
                  </div>
                  <div class="row totalAmountArea">
					<div style="font-size:16px;margin:10px">我的優惠券：</div>
					   <div class="form-group col-md-6 col-12" style="margin-top:20px">
                  
               <!--  <form method="post" action="coup.do"> -->
                    <div class="form-group row">
                      <div class="quick-drop col-6 selectOptions ">

                    <%
						CoupService coupSvc = new CoupService();
                    	String mem_no = memVO.getMem_no();
                    	String ord_status = "已領取";
                    	List<CoupVO> coupList = coupSvc.getCanUse(mem_no, ord_status);
						CoupVO coupVO = null;
					%>
					 <select id="select" name="coup_no" class="form-control">
						<option value="none">無</option>
					<%
						for(int i = 0; i < coupList.size(); i++){
							coupVO = coupList.get(i);
							double discount = coupVO.getCoupDiscount() * 10;
					%>
                       <option value="<%=coupVO.getCoupNo()%>"><%=coupVO.getCoupNo()%> ： <%=discount%>折</option> 
           			<%}%>
                    </select>
                      </div>
                      
                      
                      <input type="hidden" name="amount" value="<%=amount%>">
                     <%--  <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"> --%>
            		  <input type="hidden" name="action" value="useCoup">
                      <button id="coupbtn" type="submit" class="btn btn-primary-outlined" 
                       onclick="useCoup()">使用優惠券</button>
                    
                    </div>
                <!--  </form> -->
             </div>
             
             <!--讓js取得coup的資訊 以下 -->
              		<% 
                     for(int i = 0; i < coupList.size(); i++){
							coupVO = coupList.get(i); 
                    %>
                   	<div style="display:none;" id="<%=coupVO.getCoupNo()%>"><%=coupVO.getCoupDiscount()%></div>
                     <%} %>
			<!--讓js取得coup的資訊 以上  -->	
			
			
                    <div class="col-sm-4 ml-sm-auto">
                      <ul class="list-unstyled">
                     	 <!--價格去小數-->
						<%int price = Double.valueOf(amount).intValue();%>
                        <li>商品總金額 <span id="amount">NT$ <%=price%></span></li>
                        <li>優惠券 <span id="coup">無</span></li>
                         <li>總付款金額 <span class="grandTotal" id="total">NT$ <%=price%></span></li>
                         
                       
                      </ul>
                    </div>
                  </div>
                  <div class="checkBtnArea">
            	
         
                <form  method="POST" action="shopAddress.jsp"> 
                  	<input type="hidden" name="amount" value="<%=amount%>"><!-- amount是有無用優惠券都會得到的總價 -->
                  	<input id="submitCoup" type="hidden" name="coup_no" value=""><!-- 點擊使用優惠券，這裡才會有值 -->
                  	<button type="submit" class="btn btn-primary btn-default">
                  		結 帳<i class="fa fa-arrow-circle-right" aria-hidden="true"></i>
                  	</button>
                </form> 
           
                  </div>
                <!-- </form> -->
              </div>
            </div>
          </div>
      </div>
      </section>
      
      <jsp:include page="/assets/footer.jsp" flush="true" />
       

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

<script>
	
	 $(document).ready(function(){
		if($('#select').val() == "none"){
			$('#coupbtn').attr('disabled', true);
		}
	});
		
	 $('#select').change(function(){
		if($('#select').val() == "none"){
			$('#coupbtn').attr('disabled', true);
		}else{
			$('#coupbtn').attr('disabled', false);
		} 
	});

	function btnChange(){
		$('#coupbtn').attr('disabled', false);
		console.log($('#select').val());
		if($('#select').val() == "none"){
			$('#coupbtn').attr('disabled', true);
		}
	} 
	
	function useCoup(){
		var coup_no = document.getElementById("select").value;
		/* console.log(coup_no); */
		var coup_discount = $('#'+coup_no).text(); 
		/* console.log(coup_discount); */
		var discount = Number(coup_discount);
		discountDisplay = discount*10;
		/* console.log(discountDisplay); */
		var str = discountDisplay + " 折";
		$('#coup').text(str);
		/* console.log(str); */
		
		var str = $('#amount').text(); 
		var amoumt = str.split(" ")[1];
		var amountFinal = Number(amoumt)*discount;
		var text = "NT$ " + amountFinal;
		$('#total').text(text);
		
		$('#submitCoup').val(coup_no);
		
		var a = $('#submitCoup').val();
		/* console.log(a); */
		
	}
		
	$("#coupbtn").mouseenter(function(){
		  $("#coupbtnp").css("color","white");
		});

</script>


</body>







</html>
