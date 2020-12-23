<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shop_product.model.*"%>
<%@ page import="com.mem.model.*"%>


<%
	ProdVO prodVO = (ProdVO) request.getAttribute("prodVO");
	
/* 	ProdService prodSvc = new ProdService();
	List<ProdVO> list = prodSvc.getAll();
	pageContext.setAttribute("list",list); */
	
	MemVO memVO = (MemVO) session.getAttribute("memVO");

%>


<!DOCTYPE html>
<html>
 <head>

    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>shopProd.jsp</title>

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

  <body id="body" class="body-wrapper version1 up-scroll">

<!-- header以下 -->
	<div class="main-wrapper" style="overflow:visible;">
    <div class="header clearfix">
   <jsp:include page="/assets/topBar.jsp" flush="true"/>
	</div>
	</div> 
 <!-- header以上  -->


      <!-- LIGHT SECTION -->
      <section class="lightSection clearfix pageHeader">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <div class="page-title">
                <h2>商品詳情</h2>
              </div>
            </div>
            <div class="col-md-6">
              <ol class="breadcrumb pull-right">
                <li>
                  <a href="index.jsp">首頁</a>
                </li>
                <li class="active">商品詳情</li>
              </ol>
            </div>
          </div>
        </div>
      </section>

      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix">
        <div class="container">
          <div class="row singleProduct">
            <div class="col-md-12">
              <div class="media flex-wrap mb-5">
                <div class="media-left productSlider">
                  <div id="carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner SingleProductItem">
                      

                      <div class="carousel-item active productImage SingleProductImage" data-thumb="0">
          <img src="<%=request.getContextPath()%>/getPictureServlet?prod_no=${prodVO.getProdNo()}"> 
                        <a data-fancybox="images" href="<%=request.getContextPath()%>/getPictureServlet?prod_no=${prodVO.getProdNo()}" class="product-content"> 
                          <div class="MaskingIcon"><i class="fa fa-plus"></i>
                          </div>
                        </a>
                      </div>

                    </div>
                  </div>
                  
            
                </div>
                <div class="media-body">
                  <ul class="list-inline">
                    <li class="mb-4 mb-md-0">
                      <a href="shop.jsp"><i class="fa fa-reply" aria-hidden="true"></i>
                        繼續購物
                      </a>
                    </li>

                    <!-- <li class="share-all mr-0">
                      <a class="social-link" href="javascript:void(0)"><i class="fa fa-plus" aria-hidden="true"></i>
                          Share This
                      </a>

                      <span class="all-link">
                        <a class="SingleSocialIcon" href="javascript:void(0)">
                          <i class="fa fa-facebook" aria-hidden="true"></i>
                        </a>

                        <a class="SingleSocialIcon" href="javascript:void(0)">
                          <i class="fa fa-twitter" aria-hidden="true"></i>
                        </a>

                        <a class="SingleSocialIcon" href="javascript:void(0)">
                          <i class="fa fa-instagram" aria-hidden="true"></i>
                        </a>

                        <a class="SingleSocialIcon" href="javascript:void(0)">
                          <i class="fa fa-google-plus" aria-hidden="true"></i>
                        </a>
                      </span>
                    </li> -->
                  </ul>
                  

                  <h2>${prodVO.getProdName()}</h2>
                  <!--價格去小數-->
				  <%int price = prodVO.getProdPrice().intValue();%>
                  <h3>NT$ <%=price%></h3>
                  <br>
                  <h6>品牌: ${prodVO.getProdBrand()}</h6>
                  <br>
                  <h6>種類: ${prodVO.getCategoryNo()}</h6>
              
                  <p>${prodVO.getProdIntro()}</p>
                  
      <Form METHOD="post" ACTION="item.do"> 
								

							

                  <div class="row">
                    <div class="col-12">
                      <div class="d-flex align-items-center mb-5 pt-3">
                        <h5 class="mr-4">數量:</h5>
                        <div class="SingleCartListInner cartListInner pl-1">
                         
                            <div class="table-responsive">
                              <table class="table">
                                <tbody>
                                  <tr class="border-0">
                                    <td class="count-input border-0 p-0">
                                      <a id="minus" href="#" onclick="minus()"><i class="fa fa-minus"></i></a>
                     <input id="quantity" type="text" name="item_quantity" value="1" readonly>
                                      <a id="plus" href="#" onclick="plus()"><i class="fa fa-plus"></i></a>
                                    </td>
                                  </tr>
                                </tbody>
                              </table>
                            </div>
                          
                        </div>
                      </div>
                    </div>
                  </div>
                  
                
                 
                  <div class="btn-area mb-0">
                  	<button type="submit" class="btn btn-primary btn-default">
						加入購物車 <i class="fa fa-angle-right" aria-hidden="true"></i>
					</button>
                  </div>
                  
                <input type="hidden" name="item_quantity" value="1">
				<input type="hidden" name="prod_no"  value="${prodVO.getProdNo()}">
				<input type="hidden" name="prod_price"  value="${prodVO.getProdPrice()}">
				<!--送出當前路徑，回來的時候才知道要回到哪-->
				<input type="hidden" name="requestURL" value="<%=request.getContextPath()%>/shop_product/shop.jsp"> 
				<input type="hidden" name="action" value="ADD">
                  

      </Form>            
                </div>
              </div>
            </div>
          </div>
          <%-- 
          <%
          	//推薦商品篩選
          	ProdService prodService = new ProdService();
          	List<ProdVO> recommandList = prodService.getRecommandProd(prodVO.getProdNo());
          %> --%>

          
<!-- 商品太少，亂數跑不出來，先關起來 -->
        <!--   <div class="page-header">
            <h4>推薦商品</h4>
          </div>
          <div class="row productsContent"> -->
          <%-- <%
          		for(int i = 0; i < recommandList.size(); i++){
          			ProdVO oneprodVO = recommandList.get(i);
          
          %> --%>
         
            <!-- 這裡是一個推薦商品 -->
<%--             <div class="col-md-3 col-12 ">
              <div class="productBox">
                <div class="productImage clearfix">
            <img src="<%=request.getContextPath()%>/getPictureServlet?prod_no=<%=oneprodVO.getProdNo()%>" height="258px">
                  <div class="productMasking">
                    <ul class="list-inline btn-group" role="group">
                      <li><a data-toggle="modal" href=".login-modal" class="btn btn-default"><i class="fa fa-heart-o"></i></a></li>
                      <li><a href="cart-page.html" class="btn btn-default"><i class="fa fa-shopping-basket"></i></a></li>
                      <li><a class="btn btn-default" data-toggle="modal" href=".quick-view" ><i class="fa fa-eye"></i></a></li>
                    </ul>
                  </div>
                </div>
                <div class="productCaption clearfix">
                 <h5><%=oneprodVO.getProdName()%></h5>
                 <h3>NT$ <%=oneprodVO.getProdPrice()%></h3>
                </div>
              </div>
            </div> --%>
            
           <%--  <%}%> --%>

         <!--  </div>
        </div> -->
      </section>
      
       <jsp:include page="/assets/footer.jsp"></jsp:include>

    

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
		
		<!-- 		LoginModal -->
		<jsp:include page="/assets/loginModal.jsp" flush="true"/>
		<!-- 		MemChat -->
<%-- 		<jsp:include page="/assets/memChat3.jsp" flush="true"/> --%>
<script type="text/javascript">
	var i = $('#quantity').val();
	
	function minus(){
		if(i>=2){
			i--;
			$('#quantity').val(i);
		}
	}
	
	function plus(){
		if(i<=98){
			i++;
			$('#quantity').val(i);
		}
	}
	



</script>

	

</body>
</html>