<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.fmarticle.model.*"%>
<%@ page import="com.mem.model.*"%>
<%
fmarticleVO fmarticleVO = (fmarticleVO) request.getAttribute("fmarticleVO");
if(fmarticleVO != null){
	
}else{
String fm_no =  request.getQueryString();
// String fm_no = "1001";

fmarticleService fmsvc =new fmarticleService();
fmarticleVO = fmsvc.getOne(fm_no);
pageContext.setAttribute("fmarticleVO", fmarticleVO);
}
%>


<jsp:useBean id="fmclassSvc" scope="page" class="com.fmclass.model.fmclassService" />
<!DOCTYPE html>
<html lang="zh_TW">
  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>�׾�-${fmarticleVO.fm_head}</title>
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet">
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/plugins/selectbox/select_option1.css" rel="stylesheet">
    <link href="assets/plugins/fancybox/jquery.fancybox.min.css" rel="stylesheet">
    <link href="assets/plugins/rateyo/jquery.rateyo.min.css" rel="stylesheet">
    <link href="assets/plugins/iziToast/css/iziToast.css" rel="stylesheet">
    <link href="assets/plugins/prismjs/prism.css" rel="stylesheet">
    <link href="assets/plugins/revolution/css/settings.css" rel="stylesheet">
    <link href="assets/plugins/animate/animate.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="assets/plugins/slick/slick.css" media="screen">
    <link rel="stylesheet" type="text/css" href="assets/plugins/slick/slick-theme.css" media="screen">
    <link href="assets/css/style.css" rel="stylesheet">
<!--     <link rel="stylesheet" href="assets/css/color-option2.css" id="option_style"> -->
    <link rel="shortcut icon" href="assets/img/favicon.png">
    <link rel="stylesheet" href="assets/css/joe_footer.css" >
    <link rel="shortcut icon" href="./assets/img/favicon.png">
<style>

img.do {
	
	height: 110px;
}
.SingleProductItem .product-content {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
	background-color: #47bac1; ;
    opacity: 0;
    transition: all 0.3s ease-in-out;
}

div.try {
    border: 1px double gray;
    width: 100%;
    height: 100%;
    background-color: white;
    margin-bottom: 15px;
    padding: 15px;
    font-size: 16px;
    font-weight: bold;
    line-height: 25px;
    border-radius: 25px;
}
*{
 font-family: �L�n������;
}
h4 {
    font-family: �L�n������;
    font-size: 200px;
}
.modal-content .form-control{
border-radius: 15px !important;
}
button{
border-radius: 15px !important;
}


</style>
</head>

  <body id="body" class="body-wrapper version1 up-scroll">


<%
 MemVO memVO = (MemVO) session.getAttribute("memVO");
%>
�z�n:${memVO.mem_name}
�z���s��${memVO.mem_no}

${memVO.mem_no == fmarticleVO.mem_no}
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:orange">${message}</li>
		</c:forEach>
	</ul>
</c:if>

 <!-- header�H�U -->
    <div class="main-wrapper" style="overflow:visible;">
    <div class="header clearfix">
   <jsp:include page="/fm-front/assets/topBar.jsp" flush="true"/>
	</div>
	</div>
  <!-- header�H�W  -->
  
  <!-- LIGHT SECTION -->
      <section class="lightSection clearfix pageHeader">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <div class="page-title">
                <h2>�׾�</h2>
              </div>
            </div>
            <div class="col-md-6">
              <ol class="breadcrumb pull-right">
                <li>
                  <a href="fmarticle.jsp">Home</a>
                </li>
                <li class="active">�׾�</li>
              </ol>
            </div>
          </div>
        </div>
      </section>
  
  
				<div style="text-align:center;"><h1>${fmarticleVO.fm_head}</h1></div>
				<h1 style="margin-bottom:0px">�@�@�@�@�@</h1>
<!--       <section class="mainContent clearfix"> -->
        <div class="container">
          <div class="row singleProduct">
            <div class="col-md-12">
              <div class="media flex-wrap mb-10">
                <div class="media-left productSlider" style="width:689px">
                  <div id="carousel" class="carousel slide" data-ride="carousel">
<!--                     <div class="carousel-inner SingleProductItem"> -->
                    <div style="margin-bottom:8px">
<!--                       <div class="carousel-item active productImage SingleProductImage" data-thumb="0"> -->
                        <img src="<%=request.getContextPath()%>/fm-front/DBG?fm_no=${fmarticleVO.fm_no}&image_column=fm_pic1" width="630" height="500">
                        <a data-fancybox="images" href="<%=request.getContextPath()%>/fm-front/DBG?fm_no=${fmarticleVO.fm_no}&image_column=fm_pic1" class="product-content">
                        </a>
                        </div>
<!--                       </div> -->
<!--                       <h1 style="margin-bottom:0px">�@�@�@�@�@</h1> -->
<!--                       <font size="3">                  </font> -->
<!-- 						<div class="carousel-inner SingleProductItem"> -->
<!--                       <div class="carousel-item SingleProductImage" data-thumb="1"> -->
                        <img src="<%=request.getContextPath()%>/fm-front/DBG?fm_no=${fmarticleVO.fm_no}&image_column=fm_pic2" width="630" height="500">
                        <a data-fancybox="images" href="<%=request.getContextPath()%>/fm-front/DBG?fm_no=${fmarticleVO.fm_no}&image_column=fm_pic2" class="product-content">
                        </a>
                      </div>

<!--                     </div> -->
                  </div>
                  
                  
        
<%--  				<jsp:useBean id="bptrSvc" scope="page" class="com.bptrack.model.BptrService"/>	 --%>
<!--                   <div class="clearfix"> -->
<!--                     <div id="thumbcarousel" class="carousel slide" data-interval="false"> -->
<!--                       <div class="carousel-inner"> -->
<%--                           <div data-target="#carousel" data-slide-to="0" class="thumb"><img class="do" src="<%=request.getContextPath()%>/fm-front/DBG?bp_no=${bpVO.bp_no}&image_column=bp_pic1"></div> --%>
<%--                           <div data-target="#carousel" data-slide-to="2" class="thumb"><img class="do" src="<%=request.getContextPath()%>/fm-front/DBG?bp_no=${bpVO.bp_no}&image_column=bp_pic2"></div> --%>
<!--                       </div> -->
<!--                       <a class="left carousel-control" href="#thumbcarousel" role="button" data-slide="prev"> -->
<!--                         <span class="glyphicon glyphicon-chevron-left"></span> -->
<!--                       </a> -->
<!--                       <a class="right carousel-control" href="#thumbcarousel" role="button" data-slide="next"> -->
<!--                         <span class="glyphicon glyphicon-chevron-right"></span> -->
<!--                       </a> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--                 <div class="media-body"> -->
<!--                   <ul class="list-inline" style="margin:0 0 15px 0"> -->
<!--                     <li class="mb-4 mb-md-0"> -->
<%--                    <c:if test="${bpVO.mem_no != memVO.mem_no}"> --%>
<%--                 	<c:choose> --%>
<%-- 					 <c:when test="${bptrSvc.findonememtr(memVO.mem_no,bpVO.bp_no).bp_no == bpVO.bp_no}">	  --%>
<!-- 					 	<button id="add" style="width:100px"> -->
<!-- 	                    <i id="show" class="fa fa-check-square" aria-hidden="true">�ӫ~�w�l��</i> -->
<!-- 	                    <i id="add" class="fa fa-plus" aria-hidden="true" style="display:none">�l�ܰӫ~</i> -->
<!-- 	                   	</button>			 -->
<%-- 				   	 </c:when> --%>

<%-- 				   	 <c:otherwise> --%>
<!-- 				   	   	<button id="add" style="width:100px"> -->
<!-- 	                   	<i id="add" class="fa fa-plus" aria-hidden="true">�l�ܰӫ~</i> -->
<!-- 	                   	<i id="show" class="fa fa-check-square" aria-hidden="true" style="display:none">�ӫ~�w�l��</i> -->
<!-- 	                    </button> -->
<%-- 				   	 </c:otherwise> --%>
<%-- 					 </c:choose> --%>
<%-- 	                </c:if>	 --%>

<!--                   </ul> -->
                  
<%--                   <h6 style="margin:0 0 15px 0">�ӫ~���p:${bpVO.bp_new}</h6> --%>

<%--                   <h2 style="margin:0 0 15px 0">${bpVO.bp_head}</h2> --%>

<%--                   <h3 style="margin:0 0 15px 0">${bpVO.bp_pri}</h3> --%>
					
					 <div class="col-lg-4 col-md-12 sideBar">
              <div class="input-group">
                <input type="text" class="form-control" placeholder="Search" aria-describedby="basic-addon2">
                <a href="#" class="input-group-addon" id="basic-addon2"><i class="fa fa-search"></i></a>
              </div>
              <div class="panel panel-default">
                <div class="panel-heading" style="background-color: #47bac1">categories</div>
                <div class="panel-body">
                  <ul class="list-unstyle sidebar-list">
                    <li><a href="fmarticle.jsp"><i  aria-hidden="true"></i>�Ҧ����� <span></span></a></li>
                    <li><a href="fmarticle301.jsp"><i  aria-hidden="true"></i>�q���C�� <span></span></a></li>
                    <li><a href="fmarticle302.jsp"><i  aria-hidden="true"></i>���� <span></span></a></li>
                    <li><a href="fmarticle303.jsp"><i  aria-hidden="true"></i>�U������ <span></span></a></li>
                    <li><a href="fmarticle304.jsp"><i  aria-hidden="true"></i>�}�c���� <span></span></a></li>
                    <li><a href="fmarticle305.jsp"><i  aria-hidden="true"></i>��L <span></span></a></li>
                    <li><a href="fmarticle306.jsp"><i  aria-hidden="true"></i>�M�� <span></span></a></li>
                  </ul>
                </div>
              </div>
<!--               <div class="panel panel-default recentBlogPosts" style="margin-bottom:10px"> -->
<!--                 <div class="panel-heading">recent posts</div> -->
<!--                 <div class="panel-body"> -->
<!--                   <div class="media" style="margin-bottom:5px"> -->
<!--                     <a class="media-left" href="blog-single-right-sidebar.html"> -->
<!--                        <img class="media-object" src="assets/img/blog/blog_1.png" alt="Image"> -->
<!--                     </a> -->
<!--                     <div class="media-body"> -->
<!--                       <h4 class="media-heading"><a href="blog-single-right-sidebar.html">�i���D�j�Q�ݰݦ��S���H���D�o�ڹC��</a></h4> -->
<!--                       <p><i class="fa fa-calendar" aria-hidden="true"></i>3 Sep, 2020</p> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                   <div class="media" style="margin-bottom:5px"> -->
<!--                     <a class="media-left" href="blog-single-right-sidebar.html"> -->
<!--                       <img class="media-object" src="assets/img/blog/blog_2.png" alt="Image"> -->
<!--                     </a> -->
<!--                     <div class="media-body"> -->
<!--                       <h4 class="media-heading"><a href="blog-single-right-sidebar.html">�i����j���S�H��King of thieves�s�̤���</a></h4> -->
<!--                       <p><i class="fa fa-calendar" aria-hidden="true"></i>3 Sep, 2020</p> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                   <div class="media" style="margin-bottom:5px"> -->
<!--                     <a class="media-left" href="blog-single-right-sidebar.html"> -->
<!--                       <img class="media-object" src="assets/img/blog/blog_3.png" alt="Image"> -->
<!--                     </a> -->
<!--                     <div class="media-body"> -->
<!--                       <h4 class="media-heading"><a href="blog-single-right-sidebar.html">�i�Q�סj�]�ʤT��</a></h4> -->
<!--                       <p><i class="fa fa-calendar" aria-hidden="true"></i>3 Sep, 2020</p> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
					
					
                  <p style="margin:0 0 15px 0 ">
<%--                   <fmt:formatDate value="${bpVO.bp_upt}" pattern="yyyy-MM-dd EEE"/><br> --%>
					<font size="4">���D: ${fmarticleVO.mem_no}</font>
					<br></br>
					<font size="4">�Z�n�ɶ�: <fmt:formatDate value="${fmarticleVO.fm_ti}" pattern="yyyy-MM-dd EEE"/></font>
<%-- 					�|��:${fmmeVO.qmem_no} --%>
<%-- 					<h0>�Z�n�ɶ�  <fmt:formatDate value="${fmarticleVO.fm_ti}" pattern="yyyy-MM-dd EEE"/></h0> --%>
<%--                   	�Z�n�ɶ�  <fmt:formatDate value="${fmarticleVO.fm_ti}" pattern="yyyy-MM-dd EEE"/><br> --%>
<%--                  	<c:if test="${bpVO.bp_dot != null}"> --%>
<%--                  	�U�[�ɶ�<fmt:formatDate value="${bpVO.bp_dot}" pattern="yyyy-MM-dd EEE"/><br> --%>
<%--                  	</c:if> --%>
                  </p>
<%-- 					<c:if test="${memVO.mem_no != bpVO.mem_no}"> --%>
<%-- 				     <c:choose> --%>
<%-- 					 <c:when test="${bpVO.bpst_no.equals(\"�W�[\")}"> --%>
<!-- 						     <div class="btn-area mb" style="margin-bottom:15px"> -->
<%-- 				                 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/fm-front/BpServlet" enctype="multipart/form-data"> --%>
<%-- 				                 <input type="hidden" name="mem_no" value="${memVO.mem_no}"> --%>
<%-- 				                 <input type="hidden" name="bp_no" value="${bpVO.bp_no}"> --%>
<!-- 								 <input type="hidden" name="action" value="Subscript"> -->
<!-- 								 <input type="submit" class="btn btn-default" style="color:black; background:orange; border:orange ;border-radius: 15px" value="�U��"><br> -->
<!-- 								 </FORM> -->
<!-- 								</div>  -->
<%-- 				   	 </c:when> --%>
<%-- 				   	  <c:when test="${bpVO.bpst_no.equals(\"�f�֤�\")}"> --%>
<!-- 						     <div class="btn-area mb" style="margin-bottom:15px"> -->
	
<%-- 				               <input type="submit" class="btn btn-default" style="color:black; background:orange; border:orange; border-radius: 15px" value="<%=(bpVO.getBpst_no().equals("�f�֤�"))?"�ӫ~�f�֤�":""%>">	<br>  --%>
<!-- 				             </div> -->
<%-- 				   	 </c:when> --%>
<%-- 					 <c:otherwise> --%>
<!-- 					 		<div class="btn-area mb" style="margin-bottom:15px"> -->
				               
<%-- 				               <input type="submit" class="btn btn-default" style="color:black; background:orange; border:orange; border-radius: 15px" value="<%=(bpVO.getBpst_no().equals("�U�["))?"�ӫ~�w�g�U�[":"�w��X"%>"><br>  --%>
<!-- 				            </div> -->
<%-- 					 </c:otherwise> --%>
<%-- 					 </c:choose> --%>
					 
<%-- 				<c:if test="${memVO != null}"> --%>
<!-- 					<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">���|</button>					 -->
<!-- 						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
<!-- 						  <div class="modal-dialog"> -->
<!-- 						    <div class="modal-content" style="border-radius: 15px"> -->
<!-- 						      <div class="modal-header"> -->
<!-- 						        <h5 class="modal-title" id="exampleModalLabel">���|���e</h5> -->
<!-- 						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!-- 						          <span aria-hidden="true">&times;</span> -->
<!-- 						        </button> -->
<!-- 						      </div> -->
<!-- 						      <div class="modal-body"> -->
						   
<!-- 						      <div class="form-group"> -->
<!-- 						        <label for="recipient-name" class="col-form-label">���|���O:</label> -->
<!-- 						        <select  class="form-control" id="recipient-name" name="fmrp_project" style="border:2px solid orange ; margin-bottom:8px"> -->
<!-- 						            <option value="�W�[����">�W�[����</option> -->
<!-- 									<option value="����ȯ�">����ȯ�</option> -->
<!-- 									<option value="��a�C�f">��a�C�f</option>				             -->
<!-- 						         </select> -->
<!-- 						      </div> -->
<!-- 						      <div class="form-group"> -->
<!-- 						           <label for="message-text" class="col-form-label">���|���e:</label> -->
<!-- 						           <textarea  class="form-control" id="message-text" placeholder="�Яd�U���|����" name="fmrp_text" style="height:100px ; resize:none ; border:2px solid orange ; margin-bottom:0 "></textarea> -->
<!-- 						      </div> -->
<!-- 						      <div class="modal-footer" style="padding:0px 12px"> -->
<!-- 						        <button id="1" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
<%-- 						        <input type="hidden" name="mem_no" value="${memVO.mem_no}"> --%>
<%-- 						        <input type="hidden" name="bp_no" value="${fmarticleVO.fm_no}"> --%>
<!-- 						        <input type="hidden" name="action" value="FmarticleServlet"> -->
<!-- 								<input	type="hidden" name="action" value="insertreport"> -->
<!-- 						        <button id="2" type="button" class="btn btn-secondary" data-dismiss="modal" style="background:orange">�e�X���|</button> -->
<!-- 						      </div> -->
<!-- 						    </div> -->
<!-- 						  </div> -->
<!-- 						</div> -->
<!-- 						</div> -->
<%-- 					</c:if> --%>
<%-- <%-- 					</c:if> --%> 
<%-- 					<c:if test="${memVO == null}"> --%>
<!-- 					<br><button type="button" class="btn btn-secondary" data-dismiss="modal">���|�Х��n�J</button> -->
<%-- 					</c:if> --%>
					
                  </div> 
                </div>
         		
         		
  
          <div class="row singleProduct singleProductTab">
            <div class="col-12">
              <div class="media mb-4">
                <div class="media-body">
                  <div class="tabArea">
                    <ul class="nav nav-tabs bar-tabs">
                      <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#OurDetails">�峹����</a></li>
                      <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#OurSizing">�d���O</a></li>
                    </ul>
                    <div class="tab-content">
                      <div id="OurDetails" class="tab-pane fade show active">
                        <p>${fmarticleVO.fm_text}</p>
                        <ul class="list-unstyled">
<%--                           <li>���~�a�I:${bpVO.bp_loc}</li> --%>
<%--                           <li>�B�e�覡:${bpVO.bp_del}</li> --%>
<%--                           <li>��a�s��:${bpVO.mem_no}</li> --%>
<%--                           <li>�ӫ~�s��:${bpVO.bp_no}</li> --%>
                        </ul>
                      </div>

                      <div id="OurSizing" class="tab-pane fade">
                        <div class="SingleCartListWrapper SingleCartSizing">
                          <div class="cartListInner">
                            <div class="table-responsive">
                              <table class="table">
                           		<jsp:useBean id="fmmeSvc" scope="page" class="com.fmmessage.model.fmmeService" />
									<c:choose>
									<c:when test="${memVO.mem_no != fmarticleVO.mem_no}">
													<div >
														<div class="view">
														<c:forEach var="fmmeVO"
																items="${fmmeSvc.findByfm_no(fmarticleVO.fm_no)}">
																<div class="try">
																	�|��:${fmmeVO.qmem_no}<br>
																	���e:${fmmeVO.qfmme_text}<br>
																	���D:${(fmmeVO.fmme_text == null)?"�|���^��":fmmeVO.fmme_text}
																</div>
															</c:forEach>
														</div>	
														<c:choose>
														    <c:when test="${memVO != null}">
														    	<div class="quest">		
																	�d���O:<textarea id="qfmme_text" style="width: 300px; height: 100px;resize:none;"name="qfmme_text" placeholder="�Яd�U���D"></textarea>
																	<input  type="hidden" name="qmem_no"value="${memVO.mem_no}">
																	<input  type="hidden"name="fm_no" value="<%=fmarticleVO.getFm_no()%>">
																	<input	type="hidden" name="mem_no"	value="<%=fmarticleVO.getMem_no()%>">
																	<input type="hidden" name="action" value="FmarticleServlet">
																	<input	type="hidden" name="action" value="question">
																	<button style="width:100px">�e�X�d��</button>
																</div>
														    </c:when>
														    <c:otherwise>
														  		�d���O:<textarea  disabled id="qfmme_text" style="width: 300px; height: 100px;resize:none;"name="qfmme_text" placeholder="�Х��n�J�A�ϥίd���\��" >�Х��n�J�A�ϥίd���\��</textarea>
														    </c:otherwise>
														</c:choose>				
													</div>	 
			
													</c:when>
													<c:otherwise>
														<c:forEach var="fmmeVO"
															items="${fmmeSvc.findByfm_no(fmarticleVO.fm_no)}">
															<div class="try">
																�|��:${fmmeVO.qmem_no}<br>
																���e:${fmmeVO.qfmme_text}<br>
																���D:
																<span class="res">${(fmmeVO.fmme_text == null)?"�|���^��":fmmeVO.fmme_text}</span> 													
																	<c:choose>
																    <c:when test="${fmmeVO.fmme_text == null}">
																<div class="respon">													
																	<input type="text" name="fmme_text" style="border-radius: 5px">
																	<input type="hidden" name="fmme_no"value="${fmmeVO.fmme_no}">
																	<input type="hidden" name="fm_no"  value="<%=fmarticleVO.getFm_no()%>">																
																	<input type="hidden" name="action" value="FmarticleServlet">
																	<input type="hidden" name="action" value="reply">
																	<button style="width:100px">�e�X�^��</button>										
																</div>
																    </c:when>
																    <c:otherwise>
																   
																    </c:otherwise>
																</c:choose>		
															</div>
														</c:forEach>
													</c:otherwise>
											</c:choose>						
								
									
								</table>
                            </div>
                          </div>
                        </div>
                      </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          </div>
               </div>
            </div>
          </div>
		</section>
<%-- <%@ include file="/fm-front/footer.jsp" %> --%>


		<script src="assets/plugins/jquery/jquery.min.js"></script>
		<script src="assets/plugins/jquery/jquery-migrate-3.0.0.min.js"></script>
		<script src="assets/plugins/jquery-ui/jquery-ui.js"></script>
		<script src="assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="assets/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
		<script src="assets/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
		<script src="assets/plugins/slick/slick.js"></script>
		<script src="assets/plugins/fancybox/jquery.fancybox.min.js"></script>
		<script src="assets/plugins/iziToast/js/iziToast.js"></script>
		<script src="assets/plugins/prismjs/prism.js"></script>
		<script src="assets/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
		<script src="assets/plugins/countdown/jquery.syotimer.js"></script>
		<script src="assets/plugins/velocity/velocity.min.js"></script>
		<script src="assets/plugins/rateyo/jquery.rateyo.min.js"></script>
		<script src="assets/js/custom.js"></script>
		
		<script>
		$(document).ready(function(){
			$(".respon>button").click(function(){
				let data = {};
				let message = $(this).parent().children();
				let pre = $(this).parent().prev();
				
				data.action = message[4].value;
				url = message[3].value;
				data.fm_no = message[2].value;
				data.fmme_no = message[1].value;
				data.fmme_text = message[0].value;
				
				$(this).hide();
				message.eq(0).hide();
				
				message[0].style.display = 'none';
				pre.empty();
				pre.text(data.fmme_text);
				
				$.ajax({
					url: url,
					type:"POST",
					data:data,
					success:function(){
						alert('�^�Ц��\!');
					}
				});
				
			});
				
				
				
				
				
				
			$("#qfmme_text").keypress(function(){
				
				if(event.keyCode==13){
					if($(this).val().trim().length==0){
						alert("�п�J���D");
					}else{
						let data1 = {};
						let me = $(this).parent().children();
						data1.action = me[5].value;
						url = me[4].value;
						data1.mem_no = me[3].value;
						data1.fm_no = me[2].value;
						data1.qmem_no = me[1].value;
						data1.qfmme_text = me[0].value.trim();;					
//	 					var div = document.createElement("div");
//	 					div.innerHTML=""
						let ppr = $(this).parent().parent();
						ppr.prepend("<div style='border:3px double orange;width:100%;height:100%;background-color:white;margin-bottom:15px;padding:15px;font-size:16px;font-weight:bold;line-height:25px'>�|��:"+data1.qmem_no+"<br>���e:"+data1.qfmme_text+"<br>���D�|���^��</div>");
						$("#qfmme_text").val('');
	
						$.ajax({
							url : url,
							type : "POST",
							data : data1,
							success : function(ga) {
								if(ga.length==0){

									alert('�d�����\!');
									
								}else{
									alert(ga);
								}		
								
							}
						});
						
					}
				}
			
			});
			
			$(".quest>button").click(function() {
				
				let data1 = {};
				let me = $(this).parent().children();
				data1.action = me[5].value;
				url = me[4].value;
				data1.mem_no = me[3].value;
				data1.fm_no = me[2].value;
				data1.qmem_no = me[1].value;
				data1.qfmme_text = me[0].value.trim();
//					console.log(data1.qmem_no);
//					var div = document.createElement("div");
//					div.innerHTML=""
				if(data1.qfmme_text != ''){
				let ppr = $(this).parent().parent();
				ppr.prepend("<div style='border:3px double orange;width:100%;height:100%;background-color:white;margin-bottom:15px;padding:15px;font-size:16px;font-weight:bold;line-height:25px'>�o�ݷ|���s��:"+data1.qmem_no+"<br>�o�ݤ��e:"+data1.qfmme_text+"<br>��a�^��:�Э@�ߵ��ݽ�a�^��</div>");
				$("#qfmme_text").val('');
				}
				
				
				$.ajax({
					url : url,
					type : "POST",
					data : data1,
					success : function(ga) {
						if(ga.length==0){

							alert('�d�����\!');
							
						}else{
							alert(ga);
						}		
					}
				});
			});

			$(".modal-footer>#2").click(function() {
				let data1 = {};
				
				data1.action = $(this).prev().val();
				url = $(this).prev().prev().val();
				data1.fm_no = $(this).prev().prev().prev().val();
				data1.mem_no =$(this).prev().prev().prev().prev().val();
				data1.fmrp_text = $("#message-text").val();
				data1.fmrp_project = $("select#recipient-name").val();
				
				$.ajax({
					url : url,
					type : "POST",
					data : data1,
					success : function(ga) {
						if(ga.length==0){
							$("#message-text").val("");
							
							alert('���|�w���\�e�X!');
							
						}else{
							alert(ga);
						}		
					}
				});
			});
			
			
			
			$("i#add").click(function(){
				console.log('reigjreigjoireg');
				let data1 = {};

				data1.action = 'addtr';
			
				url = 'BpServlet';
		
				data1.bp_no = '${bpVO.bp_no}';

				data1.mem_no = '${memVO.mem_no}';
				
				console.log(data1)
				$.ajax({
					url :url,
					type :"POST" ,
					data :data1 , 
					success : function(e) {
						if(e.length==0){
							$("i#add").hide(500);
							$("i#show").show(500);
							alert('�w�l��!');
							
						}else{
							alert(e);
						}	
					}
				});
				
			});
			
			$("i#show").click(function(){
				console.log('reigjreigjoireg');
				let data1 = {};

				data1.action = 'deletebptr';
			
				url = 'BpServlet';
		
				data1.bp_no = '${bpVO.bp_no}';

				data1.mem_no = '${memVO.mem_no}';
				
				console.log(data1)
				
				$.ajax({
					url :url,
					type :"POST" ,
					data :data1 , 
					success : function(e) {
						
							$("i#show").hide(500);
							$("i#add").show(500);
							alert('�w�����l��!');

					}
				});
			});
			
			
		});
		</script>
	</body>
</html>
     