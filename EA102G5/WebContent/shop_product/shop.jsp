<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shop_product.model.*"%>
<%@ page import="com.shop_track.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.depo.model.*"%>

<%

		/* List<ProdVO> list = (List<ProdVO>) request.getAttribute("catelist");  */
		ProdService prodSvc = new ProdService();
		List<ProdVO> list = new ArrayList<ProdVO>();
		
		String category_no = request.getParameter("category");
		/* 接收gird or list 區塊 */
		String show = request.getParameter("show");
		if(show ==  null){
		 	show = "grid";
		} 
		
		if("all".equals(category_no)){
			 list = prodSvc.getAll(); 
		}else if(category_no == null || "null".equals(category_no)){
			//第一個是值是null,第二個是字串'null',如果一進入商城就點grid or list,就會傳字串'null'
			//預設用1去查
			list = prodSvc.getCategoryProd("1");
		}else if(category_no != null){
			list = prodSvc.getCategoryProd(category_no);
		}
		
		
		MemVO memVO = (MemVO)session.getAttribute("memVO");
	/* System.out.println(list); */
%>

<!DOCTYPE html>
<html>
<head>
<!-- SITE TITTLE -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>購物商城</title>

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
  

  <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/color-option5.css" id="option_style">


  <!-- Icons -->
  <link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/img/favicon.png">


</head>

<style>

.btn.btn-primary.btn-block{
	background-color: #88B04B;
	border-color: #88B04B;
}

</style>

<body id="body" class="body-wrapper version1 up-scroll">

     <div class="main-wrapper" style="overflow:visible;">

      <!-- HEADER -->
      <div class="header clearfix">

<c:choose>
		<c:when test="${memVO.mem_no==null}">
			<div class="topBar">
				<div class="container">
					<div class="row">
						<div class="col-md-6 d-none d-md-block"></div>
						<div class="col-md-6 col-12">
							<ul class="list-inline float-right top-right">
								<li class="account-login"> <span><a
											data-toggle="modal" href='.login-modal'>Log in</a><small>or</small>
											<a href='<%=request.getContextPath()%>/Front-mem/signup.jsp'>註冊帳號</a>
									</span></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="topBar">
				<div class="container">
					<div class="row">
						<div class="col-md-6 d-none d-md-block"></div>
						<div class="col-md-6 col-12">
							<ul class="list-inline float-right top-right">
								<li class="account-login"><span>
										<form method="post"
											action="<%=request.getContextPath()%>/Front-mem/mem.do"enctype="multipart/form-data">
											<input type="hidden" name="action" value="memLogout">
											<button id="logout" class="btn btn-success btn-icon btn-mid"
												type="submit" style="font-size:14px;height: 36px; width: 90px ;background-color: #495057; border-color: #495057">
												<i class="fa fa-user"></i>登出
											</button>
										</form>
								</span></li>
								<li class="searchBox"><a href="#"><i
										class="fa fa-search"></i></a>
									<ul class="dropdown-menu">
										<li><span class="input-group"> <input type="text"
												class="form-control" placeholder="Search…"
												aria-describedby="basic-addon2">
												<button type="submit" class="input-group-addon">Submit</button>
										</span></li>
									</ul></li>

								<li class="dropdown cart-dropdown">
								<a href="javascript:void(0)" class="dropdown-toggle"
									data-toggle="dropdown" style="border-radius: 15px"> <i class="fa fa-user"></i>我的會員
								</a>
									<ul class="dropdown-menu dropdown-menu-right">
										<li>會員專區</li>
										<li><a href="single-product.html">
												<div class="media">
													<img class="media-left media-object" height="80px"
														width="70px"
														src="<%=request.getContextPath() %>/MemPic?mem_account=${memVO.mem_account}">
													<div class="media-body">
														<h5 class="media-heading">
															會員名稱：<span>${memVO.mem_name}</span>
														</h5>
														<h5 class="media-heading">
															剩餘點數：<span>NT$ ${depoVO.depo_point}元</span>
														</h5>
													</div>
												</div>
										</a></li>
										<li>
											<div class="btn-group" role="group" aria-label="...">
												<button type="button" class="btn btn-default"
													onclick="location.href='<%=request.getContextPath() %>/Front-mem/account-profile.jsp';">進入會員首頁</button>
												<button type="button" class="btn btn-default"
													onclick="location.href='<%=request.getContextPath() %>/index.jsp';">返回首頁</button>
											</div>
										</li>
									</ul>
								</li>


								<li class="dropdown cart-dropdown">
								<a href="javascript:void(0)" class="dropdown-toggle"
									data-toggle="dropdown" style="border-radius: 15px"> <i class="far fa-comment-dots"></i>訊息
								</a> 
								<ul  class="dropdown-menu dropdown-menu-right " style="background-color:transparent;"> 
											<div style="margin-top: auto; margin-bottom: auto;width:300px;">
												<div class="card mb-sm-3 mb-md-0 contacts_card"
													style="height: 500px; border-radius: 15px !important; background-color: rgba(0, 0, 0, 0.65) !important;">
													<div class="card-header"
														style="border-radius: 15px 15px 0 0 !important; border-bottom: 0 !important;">
														<div class="input-group">
															<input type="text" placeholder="Search..." name=""
																class="form-control search"
																style="border-radius: 15px 0 0 15px !important; background-color: rgba(0, 0, 0, 0.3) !important; border: 0 !important; color: white !important;">
															<div class="input-group-prepend">
																<span class="input-group-text search_btn"
																	style="border-radius: 0 15px 15px 0 !important; background-color: rgba(0, 0, 0, 0.3) !important; border: 0 !important; color: white !important; cursor: pointer;"><i
																	class="fas fa-search"></i></span>
															</div>
														</div>
													</div>
													<div  id="chatRow" class="card-body contacts_body"
														style="padding: 0.75rem 0 !important; overflow-y: auto; white-space: nowrap;">
														
													</div>
												<div class="card-footer"style="border-radius: 0 0 15px 15px !important; border-top: 0 !important;">
												</div>
											</div>
										</div>
								   </ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	


</div>
</div>


      <!-- HEADER 以下全是header-->

        

        <!-- NAVBAR -->
        <nav class="navbar navbar-main navbar-default navbar-expand-md" role="navigation">
          <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->

            <a class="navbar-brand" href="<%=request.getContextPath()%>/index1.jsp">
            	<img src="<%=request.getContextPath() %>/assets/img/index/logo2.png" width="249px" height="46.5px">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".navbar-ex1-collapse" aria-controls="navbar-ex1-collapse" aria-expanded="false" aria-label="Toggle navigation">
              <span class="fa fa-bars"></span>
            </button>


            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse" style="height:90px;">
              <ul class="nav navbar-nav ml-auto">
                <li>
                  <a href="<%=request.getContextPath()%>/index1.jsp" class="nav-link" style="font-size:16px;">首頁</a>
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/shop_product/shop.jsp" class="nav-link" style="font-size:16px;">購物商城</a>             
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/front_end/changeindex.jsp" class="nav-link" style="font-size:16px;">玩具交換</a>
                
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/bid_front_end/BidHome.jsp" class="nav-link" style="font-size:16px;">玩具競標</a>
                  
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/bp-front/listallbp.jsp" class="nav-link" style="font-size:16px;">玩具直購</a>
                  
                </li> 
                 <li> 
                  <a href="<%=request.getContextPath()%>/fm-front/fmarticle.jsp" class="nav-link" style="font-size:16px;">論壇</a> 
                  
                </li>
              </ul>
            </div>
           
          </div>
        </nav>
      </div>
 
      
      <!-- 以上全是header  -->

<jsp:include page="shopCart.jsp" flush="true" />



      <!-- LIGHT SECTION -->
      <section class="lightSection clearfix pageHeader">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <div class="page-title">
                <h2>購物商城</h2>
              </div>
            </div>
         
          </div>
        </div>
      </section>

      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix productsContent">
        <div class="container">
          <div class="row">
            <div class="col-lg-3 col-md-4 sideBar">
              <div class="panel panel-default">
                <div class="panel-heading">商品種類</div>
                <div class="panel-body">
                  <div class="collapse navbar-collapse navbar-ex1-collapse navbar-side-collapse">
                    <ul class="nav navbar-nav side-nav" id="accordion2" role="tablist" aria-multiselectable="true">
                    <li>
                        <div class="" role="tab" id="heading1">
                          <a href="<%=request.getRequestURI()%>?category=all"
                           aria-expanded="true" data-target="#women" aria-controls="women" style="font-size:18px;">
                          所有商品
                          </a>
                          </div>
                      </li>
                    
                      <li>
                        <div class="" role="tab" id="heading1">
                          <a href="" data-toggle="collapse" aria-expanded="false" data-target="#women" aria-controls="women">模型<i
                            class="fa fa-plus"></i></a>
                          </div>
                          
                          <ul id="women" class="collapse collapseItem" role="tabpanel" aria-labelledby="heading1" data-parent="#accordion2">
                          	<li><a href="<%=request.getRequestURI()%>?category=1"><i class="fa fa-caret-right" aria-hidden="true"></i>海賊王 <span>(10)</span></a></li>
                        </ul>
                      </li>

                      <li>
                        <div class="" role="tab" id="heading2">
                          <a href="javascript:;" data-toggle="collapse" aria-expanded="false" data-target="#men" aria-controls="men"> <i
                            class="fa fa-plus"></i>電玩</a>
                          </div>

                          <ul id="men" class="collapse collapseItem" role="tabpanel" aria-labelledby="heading2" data-parent="#accordion2">
                            <li><a href="<%=request.getRequestURI()%>?category=2"><i class="fa fa-caret-right" aria-hidden="true"></i>switch主機 <span>(20)</span></a></li>
                        </ul>
                      </li>

                      <li>
                        <div class="" role="tab" id="heading3">
                          <a href="javascript:;" data-toggle="collapse" aria-expanded="false" data-target="#kids" aria-controls="kids">兒童<i
                            class="fa fa-plus"></i></a>
                          </div>

                          <ul id="kids" class="collapse collapseItem" role="tabpanel" aria-labelledby="heading3" data-parent="#accordion2">
                            <li><a href="<%=request.getRequestURI()%>?category=3"><i class="fa fa-caret-right" aria-hidden="true"></i>皮卡丘 <span>(20)</span></a></li>
                          </ul>
                        </li>

                        <li>
                          <div class="" role="tab" id="heading4">
                            <a href="javascript:;" data-toggle="collapse" aria-expanded="false" data-target="#accessories" aria-controls="accessories">其他 <i
                              class="fa fa-plus"></i></a>
                            </div>

                            <ul id="accessories" class="collapse collapseItem" role="tabpanel" aria-labelledby="heading4" data-parent="#accordion2">
                              <li><a href="<%=request.getRequestURI()%>?category=4"><i class="fa fa-caret-right" aria-hidden="true"></i>療癒小物 <span>(20)</span></a></li>

                            </ul>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  
               <div class="panel panel-default filterNormal">
                <div class="panel-heading">我的拍賣</div>
                <div class="panel-body">
                  <ul class="list-unstyled clearfix">
                    <li><a href="<%=request.getContextPath()%>/shop_product/shopOrder.jsp">訂單查詢</a></li>
                    <li><a href="<%=request.getContextPath()%>/shop_product/shopTrack.jsp">我的收藏</a></li>
                    <li><a href="<%=request.getContextPath()%>/shop_product/shopCoup.jsp">我的優惠券</a></li>
                  </ul>
                </div>
              </div>


            </div>


            <div class="col-lg-9 col-md-8">
              <div class="row filterArea">
                <div class="col-6">
                  <select name="guiest_id1" id="guiest_id1" class="select-drop">
                    <option value="0">排序</option>
                    <option value="1">最新</option>
                    <option value="2">價格:低到高</option>
                    <option value="3">價格:高到低</option>
                    <option value="3">最熱銷</option>
                  </select>
                </div>


                <div class="col-6">
                  <div  class="btn-group float-right" role="group">
                  	<form method="post" action="<%=request.getContextPath()%>/shop_product/shop.jsp?show=grid&category=<%=category_no%>">
                  		<% if("grid".equals(show)){%>
	                    <button  type="submit" class="btn btn-default active"><i class="fa fa-th" >
	                    	</i><span>Grid</span>
	                    </button>
	                    <%}else if("showlist".equals(show)){%>
	                    <button  type="submit" class="btn btn-default"><i class="fa fa-th" >
	                    	</i><span>Grid</span>
	                    </button>
	                    <%}%>
                    </form>
                    <form method="post" action="<%=request.getContextPath()%>/shop_product/shop.jsp?show=showlist&category=<%=category_no%>">
                    	<% if("showlist".equals(show)){ %>
	                    <button  type="submit" class="btn btn-default active">
	                    	<i class="fa fa-th-list"></i><span>List</span>
	                    </button>
	                    <%}else if("grid".equals(show)){%>
	                    <button  type="submit" class="btn btn-default">
	                    	<i class="fa fa-th-list"></i><span>List</span>
	                    </button>
	                    <%}%>
                    </form>
                  </div>
                </div>
              </div>


         <!-- grif區塊 以下 -->
<%-- <c:choose>
<c:when test=""> --%>
<%
	if("grid".equals(show)){
%>

              <div class="row">
              <%
              	for(int i = 0; i<list.size(); i++){
              		ProdVO prodVO = list.get(i);
          /*     		System.out.println(prodVO.getProdPhoto()); */
              %>
                <!-- 這樣是一個商品 -->
                <div class="col-md-6 col-lg-4">
                  <div class="productBox">
                    <div class="productImage clearfix">
           <img src="<%=request.getContextPath()%>/getPictureServlet?prod_no=<%=prodVO.getProdNo()%>" alt="products-img" height="258px">
                      <div class="productMasking">
                        <ul class="list-inline btn-group" role="group">
                        
                       
                          <li> 
                          <% if(memVO == null){ %>
									<a data-toggle="modal" href='.login-modal'>
										<button type="submit" class="btn btn-default" 
										style="position: absolute;color:black ;transform: translateY(-50%); right: -11.5px;}">
											<i class="fa fa-heart"></i>
										</button>
									</a>
				
							<%}else{ %>
							<Form METHOD="post" ACTION="track.do"> 
								<input type="hidden" name="prod_no"  value="<%= prodVO.getProdNo() %>">
								<input type="hidden" name="mem_no"  value="<%=memVO.getMem_no()%>">
								<!--送出當前路徑，回來的時候才知道要回到哪-->
								<input type="hidden" name="requestURL" value="<%=request.getRequestURL()%>?<%=request.getQueryString()%>">
								<input type="hidden" name="action" value="add_track">
								
										<button type="submit" class="btn btn-default" 
										style="position: absolute;color:black ;transform: translateY(-50%); right: -11.5px;}">
											<i class="fa fa-heart"></i>
										</button>
								
							
							</Form>
							<%} %>
                          </li>
                          
                          <li>
                          
	                        <Form METHOD="post" ACTION="item.do"> 
								<input type="hidden" name="item_quantity" value="1">
								<input type="hidden" name="prod_no"  value="<%=prodVO.getProdNo() %>">
								<input type="hidden" name="prod_price"  value="<%=prodVO.getProdPrice() %>">
								<!--送出當前路徑，回來的時候才知道要回到哪-->
								<input type="hidden" name="requestURL" value="<%=request.getRequestURL()%>?<%=request.getQueryString()%>"> 
								<input type="hidden" name="action" value="ADD">
								<button type="submit" class="btn btn-default" 
								style="position: absolute;color: black;transform: translateY(-50%);right: -11.5px;}">
									<i class="fa fa-shopping-basket"></i>
								</button>
							</Form>
                          
                          </li>
                          
                          <li>	
                          	 	<Form METHOD="post" ACTION="<%=request.getContextPath()%>/shop_product/prod.do">
								<input type="hidden" name="prod_no" value="<%=prodVO.getProdNo()%>">
								<input type="hidden" name="action" value="getOne_For_Display">
								<button type="submit" class="btn btn-default"
								style="position: absolute;color: black;transform: translateY(-50%);right: -7px;}">
									<i class="fa fa-ellipsis-h"></i>
								</button>
								</Form>

                          </li>
                        </ul>
                      </div>
                      
                    </div>
                    <div class="productCaption clearfix">
                    
                    <Form METHOD="post" ACTION="<%=request.getContextPath()%>/shop_product/prod.do">
					<input type="hidden" name="prod_no" value="<%=prodVO.getProdNo()%>">
					<input type="hidden" name="action" value="getOne_For_Display">
					<button type="submit"><h5><%= prodVO.getProdName() %></h5></button>
					</Form>
					<!--價格去小數-->
					<%int price = prodVO.getProdPrice().intValue();%>
                     <h3>NT$ <%=price%></h3>
                    </div>
                  </div>
                </div>
                
                <%}%>

              </div><!-- 這個是grid的row -->
               <!-- grid區塊 以上 -->

<%} else if("showlist".equals(show)){%><!-- 這是是if grid的結尾 --> <!-- 也是list的開頭 -->
<%-- </c:when>   --%>            
               <!-- list區塊 以下 -->
<%-- <c:otherwise> --%>


             <div id="list" class="row productListSingle" style="display:visible;">
             	<% for(int i = 0; i < list.size(); i++){
             		ProdVO prodVO = list.get(i);
             	%>
             	
                <div class="col-sm-12 ">
                  <div class="media flex-wrap productBox">
                    <div class="media-left">
                      <div class="productImage clearfix">
                <img src="<%=request.getContextPath()%>/getPictureServlet?prod_no=<%=prodVO.getProdNo()%>" alt="products-img">
                        <div class="productMasking">
                          <ul class="list-inline btn-group" role="group">
                          <li> 
                          <% if(memVO == null){ %>
                          	<a data-toggle="modal" href='.login-modal'>
								<button type="submit" class="btn btn-default" 
								style="position: absolute;color:black; ;transform: translateY(-50%); right: -11.5px;}">
									<i class="fa fa-heart"></i>
								</button>
							</a>
						
							<% }else{ %>
							<Form METHOD="post" ACTION="track.do"> 
								<input type="hidden" name="prod_no"  value="<%= prodVO.getProdNo() %>">
								<input type="hidden" name="mem_no"  value="<%=memVO.getMem_no()%>"> 
								<!--送出當前路徑，回來的時候才知道要回到哪-->
								<input type="hidden" name="requestURL" value="<%=request.getRequestURL()%>?<%=request.getQueryString()%>">	
								<input type="hidden" name="action" value="add_track">
								<button type="submit" class="btn btn-default" 
								style="position: absolute;color:black; ;transform: translateY(-50%); right: -11.5px;}">
									<i class="fa fa-heart"></i>
								</button>
							</Form>
							<%} %>
                          </li>
                          <li>
	                        <Form METHOD="post" ACTION="item.do"> 
								<input type="hidden" name="item_quantity" value="1">
								<input type="hidden" name="prod_no"  value="<%=prodVO.getProdNo() %>">
								<input type="hidden" name="prod_price"  value="<%=prodVO.getProdPrice() %>">
								<!--送出當前路徑，回來的時候才知道要回到哪-->
								<input type="hidden" name="requestURL" value="<%=request.getRequestURL()%>?<%=request.getQueryString()%>"> 
								<input type="hidden" name="action" value="ADD">
								<button type="submit" class="btn btn-default" 
								style="position: absolute;color: black;transform: translateY(-50%);right: -11.5px;}">
									<i class="fa fa-shopping-basket"></i>
								</button>
							</Form>
                          </li>
                          <li>	
                          	 	<Form METHOD="post" ACTION="<%=request.getContextPath()%>/shop_product/prod.do">
								<input type="hidden" name="prod_no" value="<%=prodVO.getProdNo()%>">
								<input type="hidden" name="action" value="getOne_For_Display">
								<button type="submit" class="btn btn-default"
								style="position: absolute;color: black;transform: translateY(-50%);right: -7px;}">
									<i class="fa fa-ellipsis-h"></i>
								</button>
								</Form>

                          </li>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <div class="media-body">
                    
                    <Form METHOD="post" ACTION="<%=request.getContextPath()%>/shop_product/prod.do">
						<input type="hidden" name="prod_no" value="<%=prodVO.getProdNo()%>">
						<input type="hidden" name="action" value="getOne_For_Display">
						<button type="submit"><h4><%= prodVO.getProdName() %></h4></button>
					</Form>
					
                      <p><%=prodVO.getProdIntro()%></p>
                     <%  int price = prodVO.getProdPrice().intValue(); %>
                      <h3>NT$ <%=price %></h3>
                      <div class="btn-group" role="group">
                      		
                      		<% if(memVO == null){ %>
	                      		<a data-toggle="modal" href='.login-modal'>
									<button type="submit" class="btn btn-default">
										<i class="fa fa-heart"></i>
									</button>
								</a>
							<% }else{ %>
							<Form METHOD="post" ACTION="track.do"> 
								<input type="hidden" name="prod_no"  value="<%= prodVO.getProdNo() %>">
								<input type="hidden" name="mem_no"  value="<%=memVO.getMem_no()%>"> 
					
								<!--送出當前路徑，回來的時候才知道要回到哪-->
								<input type="hidden" name="requestURL" value="<%=request.getRequestURL()%>?<%=request.getQueryString()%>">	
								<input type="hidden" name="action" value="add_track">
								<button type="submit" class="btn btn-default">
									<i class="fa fa-heart"></i>
								</button>
							</Form>
							<%} %>
      
	                        <Form METHOD="post" ACTION="item.do"> 
								<input type="hidden" name="item_quantity" value="1">
								<input type="hidden" name="prod_no"  value="<%=prodVO.getProdNo() %>">
								<input type="hidden" name="prod_price"  value="<%=prodVO.getProdPrice() %>">
								<!--送出當前路徑，回來的時候才知道要回到哪-->
								<input type="hidden" name="requestURL" value="<%=request.getRequestURL()%>?<%=request.getQueryString()%>"> 
								<input type="hidden" name="action" value="ADD">
								<button type="submit" class="btn btn-default">
									<i class="fa fa-shopping-cart"></i>
								</button>
							</Form>
                      </div>
                    </div>
                  </div>
                </div>
              <%}%>

              </div>
 <%} %> <!-- 這個是if list區塊的結尾 -->
<%-- </c:otherwise> --%>
        <!-- list區塊 以上 -->
        
<%-- </c:choose> --%>
            </div>
            </div>
       
        
        
          </div>
        </div>
      </section>
      
<jsp:include page="/assets/footer.jsp" flush="true"/>
 
		<%-- <script src="<%=request.getContextPath()%>/assets/plugins/jquery/jquery.min.js"></script> --%>
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
		
		<!-- 		LoginModal -->
		<jsp:include page="/assets/loginModal.jsp" flush="true"/>
		<!-- 		MemChat -->
		<jsp:include page="/assets/memChat3.jsp" flush="true"/>
		
<%-- <jsp:include page="notice.jsp" flush="true" /> --%>
<script type="text/javascript">

	function showGrid(){
		$('#list').css("display","none");
		$('#grid').css("display","visible");
	}
	
	function showList(){
		$('#grid').css("display","none");
		$('#list').css("display","visible");
	}






</script>
</body>
</html>
