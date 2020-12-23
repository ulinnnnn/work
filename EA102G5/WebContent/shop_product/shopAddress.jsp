<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shop_product.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.shop_coupon.model.*"%>

<%
	MemVO memVO = (MemVO)session.getAttribute("memVO");

	String amount = (String) session.getAttribute("amount");
	String coup_no = request.getParameter("coup_no");
	double amountFinal = Double.parseDouble(amount);
	System.out.println(!"".equals(coup_no));
	if(!"".equals(coup_no)){
		CoupService coupSvc = new CoupService();
		double coup_discount = coupSvc.getOneCoup(coup_no).getCoupDiscount();
		double amountD = Double.parseDouble(amount);
		amountFinal = amountD*coup_discount;
	}
%>


<!DOCTYPE html>
<html>
<head>

    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>shopAddress</title>

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
    
	<!-- 三連地址 -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/shop_product/assets2/dk-tw-citySelector.js"></script>
    <script src="<%=request.getContextPath()%>/shop_product/assets2/init-address.js"></script>
    
    <style>
	
/*   .container {    */
/*   	align-content: center;    */
/*    }    */

.search:focus {
	box-shadow: none !important;
	outline: 0px !important;
}

.type_msg:focus {
	box-shadow: none !important;
	outline: 0px !important;
}

.contacts {
	list-style: none;
	padding: 0;
}

.contacts li {
	width: 100% !important;
	padding: 5px 10px;
	margin-bottom: 15px !important;
}

.offline {
	background-color: #c23616 !important;
}

.Chatuser_info span {
	font-size: 20px;
	color: white;
}

.Chatuser_info p {
	font-size: 10px;
	color: rgba(255, 255, 255, 0.6);
}

.msg_time {
	position: absolute;
	left: 0;
	bottom: -15px;
	color: rgba(255, 255, 255, 0.5);
	font-size: 10px;
}

.msg_time_send {
	position: absolute;
	right: 0;
	bottom: -15px;
	color: rgba(255, 255, 255, 0.5);
	font-size: 10px;
}

.msg_head {
	position: relative;
}

#action_menu_btn {
	position: absolute;
	right: 10px;
	top: 10px;
	color: white;
	cursor: pointer;
	font-size: 20px;
}

@media ( max-width : 576px) {
	.contacts_card {
		margin-bottom: 15px !important;
	}
}
</style>

  </head>

  <body id="body" class="body-wrapper version1 up-scroll">
  
<!--     HEADER以下 -->
     <DIV CLASS="MAIN-WRAPPER" STYLE="OVERFLOW:VISIBLE;">
    <DIV CLASS="HEADER CLEARFIX">
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
												type="submit" style="height: 36px; width: 90px ;background-color: #495057; border-color: #495057">
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
		 <!-- NAVBAR -->
        <nav class="navbar navbar-main navbar-default navbar-expand-md " role="navigation" >
          <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->

            <a class="navbar-brand" href="<%=request.getContextPath() %>/index1.jsp">
            	<img src="<%=request.getContextPath() %>/assets/img/index/logo2.png" width="249px" height="46.5px">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".navbar-ex1-collapse" aria-controls="navbar-ex1-collapse" aria-expanded="false" aria-label="Toggle navigation">
              <span class="fa fa-bars"></span>
            </button>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
              <ul class="nav navbar-nav ml-auto">
                <li class="nav-item dropdown  active ">
                  <a href="javascript:void(0)" class="dropdown-toggle nav-link" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="font-size:16px;">首頁</a>
                </li>
                <li class="nav-item dropdown megaDropMenu ">
                  <a href="<%=request.getContextPath()%>/shop_product/shop.jsp" class="dropdown-toggle nav-link" data-hover="dropdown" data-delay="300" data-close-others="true" aria-expanded="false" style="font-size:16px;">購物商城</b></a>             
                </li>
       			<li class="nav-item dropdown megaDropMenu ">
                  <a href="<%=request.getContextPath()%>/front_end/changeindex.jsp" class="dropdown-toggle nav-link" data-hover="dropdown" data-delay="300" data-close-others="true" aria-expanded="false" style="font-size:16px;">玩具交換</b></a>             
                </li>
                 <li class="nav-item dropdown megaDropMenu ">
                  <a href="<%=request.getContextPath()%>/bid_front_end/BidHome.jsp" class="dropdown-toggle nav-link" data-hover="dropdown" data-delay="300" data-close-others="true" aria-expanded="false" style="font-size:16px;">玩具競標</b></a>             
                </li>
                <li class="nav-item dropdown megaDropMenu ">
                  <a href="<%=request.getContextPath()%>/bp-front/listallbp.jsp" class="dropdown-toggle nav-link" data-hover="dropdown" data-delay="300" data-close-others="true" aria-expanded="false" style="font-size:16px;">玩具直購</b></a>             
                </li>
                 <li class="nav-item dropdown megaDropMenu ">
                  <a href="javascript:void(0)" class="dropdown-toggle nav-link" data-toggle="dropdown" data-hover="dropdown" data-delay="300" data-close-others="true" aria-expanded="false" style="font-size:16px;">論壇</b></a> 
                
               </li> 
              </ul>
            </div>
           
          </div>
        </nav>
      </div>
      <!-- LOGIN MODAL -->
		<div class="modal fade login-modal" id="login" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header justify-content-center">
						<button type="button" id="close1"class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h3 class="modal-title">會員登入</h3>
					</div>
					<div class="modal-body">
						<form ACTION="<%= request.getContextPath() %>/Front-mem/mem.do" enctype="multipart/form-data" method="POST" role="form">
							<div class="form-group">
								<label for="">帳號</label>
								<input name="mem_account"type="text" class="form-control">
							</div>
							<div class="form-group">
								<label for="">密碼</label>
								<input name="mem_pwd"type="password" class="form-control">
							</div>
							<div class="checkbox">
								<input id="checkbox-1" class="checkbox-custom form-check-input" name="checkbox-1" type="checkbox" checked>
								<label for="checkbox-1" class="checkbox-custom-label form-check-label">Remember me</label>
							</div>
							<input type="hidden" name="url" value="<%=request.getRequestURI()%>">
							<button type="submit" class="btn btn-primary btn-block">登入</button>
							<button id="fgbtn" type="button" class="btn btn-link btn-block" ><a data-toggle="modal" href='#email' style="color:blue;"><em><u>忘記密碼?</u></em></a></button>
							 <input type="hidden" name="action" value="memLogin">
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<!-- SEND EMAIL MODAL -->
		<div class="modal fade " id="email" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header justify-content-center">
						<button type="button" id="close2" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h3 class="modal-title"><b>忘記密碼</b></h3>
					</div>
					<div class="modal-body">
						<form action="<%=request.getContextPath() %>/Front-mem/mem.do" method="POST" enctype="multipart/form-data" role="form">
							<div class="form-group">
								<label for=""><b>發送驗證信</b></label>
								<input id="PWD_Mem_email" type="email" name="mem_email" class="form-control" placeholder="請輸入您註冊的E-MAIL">
							</div>
							<button id="PwdSendBtn" type="button" class="btn btn-primary btn-block" style="color:black;">確認發送</button>
							<button type="button" class="btn btn-link btn-block">New User?</button>
							<input type="hidden" name="action" value="forgetPWD">
						</form>
					</div>
				</div>
			</div>
		</div>
	</DIV>
	</DIV>
<!--   HEADER以上  -->
 
      <!-- LIGHT SECTION -->
      <section class="lightSection clearfix pageHeader">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <div class="page-title">
                <h2>填寫收件人資訊</h2>
              </div>
            </div>
            <div class="col-md-6">
              <ol class="breadcrumb">
                <li>
                  <a href="<%=request.getContextPath()%>/index1.jsp"
                   style="letter-spacing:1px">首頁</a>
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/shop_product/shop.jsp"
                  style="letter-spacing:1px">商城</a>
                </li>
                <li class="active"
                style="letter-spacing:1px">填寫收件人資訊</li>
              </ol>
            </div>
          </div>
        </div>  
      </section>

      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix stepsWrapper">
        <div class="container">
          <div class="row">
            <div class="col-md-8">
              <div class="innerWrapper clearfix stepsPage">
                <div class="row progress-wizard" style="border-bottom:0;">

                  <div class="col-4 progress-wizard-step active">
                    <div class="text-center progress-wizard-stepnum">收件方式</div>
                    <div class="progress"><div class="progress-bar"></div></div>
                    <div class="progress-wizard-dot"></div>
                  </div>

                  <div class="col-4 progress-wizard-step disabled">
                    <div class="text-center progress-wizard-stepnum">付款方式</div>
                    <div class="progress"><div class="progress-bar"></div></div>
                    <div class="progress-wizard-dot"></div>
                  </div>

                  <div class="col-4 progress-wizard-step disabled">
                    <div class="text-center progress-wizard-stepnum">確認訂單</div>
                    <div class="progress"><div class="progress-bar"></div></div>
                    <div class="progress-wizard-dot"></div>
                  </div>
                </div>

                <!-- <form action="" class="row" method="POST" role="form"> -->
                  <div class="col-12">
                    <div class="page-header">
                      <h4>收件人</h4>
                    </div>
                  </div>

        <form METHOD="post" ACTION="order.do" class="row" id="memberForm"><!-- memberForm是三連地址加的 -->
                  
                  <div class="form-group col-md-6 col-12">
                    <label for="">收件人姓名</label>
                    <input id="ord_name" type="text" class="form-control" name="ord_name" value=""
                    style="color:rgba(0,0,0,0.9);font-weight:400;">
                  </div>
                  <div class="form-group col-md-6 col-12">
                    <label for="">暱稱</label>
                    <input id="small_name" type="text" class="form-control"
                    style="color:rgba(0,0,0,0.9);font-weight:400;">
                  </div>
                  <div class="form-group col-md-6 col-12">
                    <label for="">電話</label>
                    <input id="ord_phone" type="text" class="form-control" name="ord_phone" size="45" value=""
                    style="color:rgba(0,0,0,0.9);font-weight:400;">
                  </div>
                  <div class="form-group col-md-6 col-12">
                    <label for="">Email</label>
                    <input id="ord_mail" type="email" class="form-control" name="ord_mail" value=""
                    style="color:rgba(0,0,0,0.9);font-weight:400;">
                  </div>
                  <div class="form-group col-md-6 col-12">
                    <label for="">縣市</label>
                    <div class="form-group row">
                      <div class="quick-drop col-12 selectOptions">
       		<!-- 需要加class "form-control"&"select-drop" -->
                       <select name="country" id="country" class="form-control"
                       style="color:rgba(0,0,0,0.9);font-weight:400;">
                       	<!-- <option value="東區">東區</option>
                          <option value="南區">南區</option>
                          <option value="西區">西區</option>
                          <option value="北區">北區</option> -->
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="form-group col-md-6 col-12">
                    <label for="">區碼</label>
                    <input type="text" id="zipcode" name="zipcode" class="form-control"  value=""
                    style="color:rgba(0,0,0,0.9);font-weight:400;">
                  </div>
                  <div class="form-group col-md-6 col-12">
                    <label for="">區域</label>
                    <div class="form-group row">
                      <div class="quick-drop col-12 selectOptions">
                        <select name="district" id="district" class="form-control"
                        style="color:rgba(0,0,0,0.9);font-weight:400;">
                          <!-- <option value="東區">東區</option>
                          <option value="南區">南區</option>
                          <option value="西區">西區</option>
                          <option value="北區">北區</option> -->
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="form-group col-md-6 col-12">
                    <label for="">地址</label>
                    <input type="text" id="detail" name="address" class="form-control"
                    style="color:rgba(0,0,0,0.9);font-weight:400;">
                  </div>
                  <div class="col-12">
                    <div class="page-header">
                      <h4>選擇運送方式</h4>
                    </div>
                  </div>
                  <div class="row checkboxArea">

                    <div class="col-12 col-lg-6 mb-4">
                      <input id="checkbox3" type="radio" name="checkbox" value="1"  checked="checked">
                      <label for="checkbox3"><span></span>黑貓宅急便 - NT$ 0</label>
                      <small>通知出貨後約 1 - 2 天寄達</small>
                    </div>
                    
                    <div class="col-12 col-lg-6 mb-4">
                       <!-- <input id="checkbox2" type="radio" name="checkbox" value="1">
                      <label for="checkbox2"><span></span>Premium Ground (UPS) - $12.50</label>
                      <small>Delivered in 4-7 business days.</small>   -->
                    </div>
                    <div class="col-12 col-lg-6 mb-4">
                      <input id="checkbox1" type="radio" name="checkbox" value="1">
                      <label for="checkbox1"><span></span>郵局寄送 - NT$ 0</label>
                      <small>通知出貨後約 3 - 5 天寄達</small>
                    </div>
                    
                  <!--   <div class="col-12 col-lg-6 mb-4">
                      <input id="checkbox4" type="radio" name="checkbox" value="1">
                      <label for="checkbox4"><span></span>UPS 1 Business Day - $35.00</label>
                      <small>Orders placed by 9:45AM PST will ship same day.</small>
                    </div> -->
                  </div>
                  <div class="col-12">
                    <div class="well well-lg clearfix">
                      <ul class="pager">
                        <li class="next ">
                        <input type="hidden" name="ord_price" value="<%=amountFinal %>">
                        <input type="hidden" name="action" value="insert">
                        <input type="hidden" name="mem_no" value="<%=memVO.getMem_no() %>">
                        <input type="hidden" name="coup_no" value="<%=coup_no%>">
                        <button type="submit" class="btn btn-primary btn-default float-right" >
                       		 送出訂單 <i class="fa fa-angle-right"></i>
               			</button>
               			<div id="magicBtn" class="btn btn-primary btn-default">
               				神奇小按鈕
               			</div>
                        </li>
                      </ul>
                    </div>
                  </div>
         </form>
              </div>
            </div>
            
     
            <div class="col-md-4">
              <div class="summery-box">
                <h4>訂單明細</h4>
                <p>現在購物不限金額均享有免運優惠</p>
                <ul class="list-unstyled">
                  <li class="d-flex justify-content-between">
                    <span class="tag">商品總價</span>
                    <!--價格去小數-->
                    <%int price = Double.valueOf(amount).intValue();%>
                    <span class="val">NT$ <%=price %></span>
                  </li>
                  <li class="d-flex justify-content-between">
                    <span class="tag">運費</span>
                    <span class="val">NT$ 0 </span>
                  </li>
                  <li class="d-flex justify-content-between">
                    <span class="tag">優惠券</span>
                    <% 
/*                  System.out.println(coup_no);
                    System.out.println(coup_no != null);
                    System.out.println(coup_no == null);
                    System.out.println("".equals(coup_no));
                    System.out.println("null".equals(coup_no)); */
                   /* 這的null被getParameter傳 所以變成了字串...滿奇怪的 */
                    	if("".equals(coup_no)){
                    %>
                    <span class="val">無 </span>
                    <%}else if (!"".equals(coup_no)){
                    CoupService coupSvc = new CoupService();
                    double coup_discount = coupSvc.getOneCoup(coup_no).getCoupDiscount(); 
                	double discountDisplay = coup_discount*10; %>
                     <span class="val"><%=discountDisplay%> 折</span>
                     <%}%>
                  </li>
                  <li class="d-flex justify-content-between">
                    <span class="tag">總消費金額</span>
                    <!--價格去小數-->
                    <% price = (int)amountFinal;%>
                    <span class="val">NT$ <%=price %> </span>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </section>
      
      <jsp:include page="/assets/footer.jsp" flush="true" />

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
		
<script>


	let memberForm = $('#memberForm');
	let address = '100台北市中正區';
	initAddress(memberForm, address);


	$('#magicBtn').click(function(){
		$('#ord_name').empty();
		$('#ord_name').val('閃到腰');
		$('#small_name').empty();
		$('#small_name').val('小閃');
		$('#ord_phone').empty();
		$('#ord_phone').val('+886-952-350-329');
		$('#ord_mail').empty();
		$('#ord_mail').val('denny0329@gmail.com');
		
		memberForm = $('#memberForm');
	    address = '630雲林縣斗南鎮新生南路3600巷30號';
	    initAddress(memberForm, address);
		
	});






		 $(document).ready(function(){
			$("#fgbtn").click(function(){
				$("#login").css("display","none");
// 				$(".modal-backdrop .fade .show").remove();
				$("#close1").click();
				$("#fgbtn").click();
			})
				
			
		 	$("#PwdSendBtn").click(function(){
		 		if($("#PwdSendBtn").text()!=="確認"){
			 		$.ajax({
						url: "<%=request.getContextPath()%>/MemAjax.do",
						type: 'post',
						dataType: 'json',
						data: {
							'action': 'forgetPWD',
							'mem_email': $('#PWD_Mem_email').val(),
						},
						success: function(data) {
							swal('郵件發送成功！', '請去電子信相確認！', 'success');
							$("#PwdSendBtn").text("確認");
							$("#close2").click();
						},
						error: function(){swal("錯誤", "發送失敗", "error");}
						
					});
		 		}
		 	});
		 })

    
    
</script>

	</body>
</html>




