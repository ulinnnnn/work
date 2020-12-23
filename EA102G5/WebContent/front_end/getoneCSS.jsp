<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="big5"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page import="com.mem.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="com.cproduct.model.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>


 <script src="https://cdn.jsdelivr.net/npm/tw-city-selector@2.1.1/dist/tw-city-selector.min.js" integrity="sha256-Iz/pF94D+raqeqXJDoOetn9L0yBFI7ogMMrhT6RzmFw=" crossorigin="anonymous">
 </script>
<%
CproductService CproductSvc = new CproductService();
String number=request.getQueryString();
pageContext.setAttribute("number", number);
MemVO memVO=(MemVO)session.getAttribute("memVO");
session.setAttribute("CprecordVO", null);
String mem_No="1";
if(memVO!=null){
mem_No=memVO.getMem_no();
}
pageContext.setAttribute("mem_No", mem_No);
CproductVO CproductVO = CproductSvc.getOneCproduct(number);
session.setAttribute("CproductVO", CproductVO);
session.setAttribute("location", null);
pageContext.setAttribute("url", request.getServletPath()+"?"+number);
session.setAttribute("urll", request.getRequestURI()+"?"+number);
String cpstate= CproductVO.getCpState();
pageContext.setAttribute("cpstate", cpstate);

%>
<c:if test="${cpstate eq '交換中'  or cpstate eq '已下架' or cpstate eq '交換確定' or cpstate eq '交換完成' or cpstate eq '待上架'}">
<jsp:forward page="changealready.jsp"/>

</c:if>
<jsp:useBean id="CpclassSvc" scope="page" class="com.cpclass.model.CpclassService" />
<html>
<head>
<title>listOneEmp.jsp</title>

<head>

    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Single Product - BIGBAG Store</title>

    <!-- PLUGINS CSS STYLE -->
    <link href="../assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet">
    <link href="../assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="../assets/plugins/selectbox/select_option1.css" rel="stylesheet">
    <link href="../assets/plugins/fancybox/jquery.fancybox.min.css" rel="stylesheet">
    <link href="../assets/plugins/rateyo/jquery.rateyo.min.css" rel="stylesheet">
    <link href="../assets/plugins/iziToast/css/iziToast.css" rel="stylesheet">
    <link href="../assets/plugins/prismjs/prism.css" rel="stylesheet">
    <link href="../assets/plugins/revolution/css/settings.css" rel="stylesheet">
    <link href="../assets/plugins/animate/animate.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../assets/plugins/slick/slick.css" media="screen">
    <link rel="stylesheet" type="text/css" href="../assets/plugins/slick/slick-theme.css" media="screen">


    <!-- CUSTOM CSS -->
    <link href="../assets/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/default.css" id="option_style">

    <!-- Icons -->
    <link rel="shortcut icon" href="../assets/img/favicon.png">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
  </head>

  <body onload="connect();" onunload="disconnect();" id="body" class="body-wrapper version1 up-scroll">

    <!-- TOPBAR NAVBAR -->
    <div style="overflow:visible;">
        <jsp:include page="/front_end/topBar.jsp" flush="true"/>
</div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            

      <!-- LIGHT SECTION -->
      

      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix">
      <input type="hidden" id="mem_No"  value="${mem_No}">
        <div class="container">
          <div class="row singleProduct">
            <div class="col-md-12">
              <div class="media flex-wrap mb-5">
                <div class="media-left productSlider">
                  <div id="carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner SingleProductItem">
                     <c:if test="${mem_No eq CproductVO.mem_No}">
                      <div class="video-icon">
                        <a class="video-link" data-toggle="modal" data-target="#PIC${CproductVO.cp_No}">
                          <i class="fa fa-pencil" aria-hidden="true"></i>
                        </a>
                      </div>
                      </c:if>

                      <div class="carousel-item active productImage SingleProductImage" data-thumb="0">
                        <img src="makeimage.jsp?pic1=${CproductVO.cp_No}&No=1">
                        
                        <a data-fancybox="images" href="makeimage.jsp?pic1=${CproductVO.cp_No}&No=1"class="product-content">
                          <div class="MaskingIcon"><i class="fa fa-plus"></i></div>
                        </a>
                      </div>
                      <c:if test="${empty CproductVO.cpPicture_No2}">
                      <div class="carousel-item SingleProductImage" data-thumb="1">
                        <img src="makeimage.jsp?pic1=${CproductVO.cp_No}&No=2">
                        <a data-fancybox="images" href="makeimage.jsp?pic1=${CproductVO.cp_No}&No=2" class="product-content">
                          <div class="MaskingIcon"><i class="fa fa-plus"></i></div>
                        </a>
                      </div>
                      
                      <div class="carousel-item SingleProductImage" data-thumb="2">
                        <img src="makeimage.jsp?pic1=${CproductVO.cp_No}&No=3">
                        <a data-fancybox="images" href="makeimage.jsp?pic1=${CproductVO.cp_No}&No=3" class="product-content">
                          <div class="MaskingIcon"><i class="fa fa-plus"></i></div>
                        </a>
                      </div>
                      </c:if>
                      
                    </div>
                  </div>
                  
                  <div class="clearfix">
                    <div id="thumbcarousel" class="carousel slide" data-interval="false">
                      <div class="carousel-inner">
                          <div data-target="#carousel" data-slide-to="0" class="thumb"><img src="makeimage.jsp?pic1=${CproductVO.cp_No}&No=1"></div>
                          <div data-target="#carousel" data-slide-to="1" class="thumb"><img src="makeimage.jsp?pic1=${CproductVO.cp_No}&No=2"></div>
                          <div data-target="#carousel" data-slide-to="2" class="thumb"><img src="makeimage.jsp?pic1=${CproductVO.cp_No}&No=3"></div>
                          <div  class="thumb"><img src=""></div>
                      </div>
                      <a class="left carousel-control" href="#thumbcarousel" role="button" data-slide="prev">../assets/img/products/signle-product/product-slide-small-04.jpg
                        <span class="glyphicon glyphicon-chevron-left"></span>
                      </a>
                      <a class="right carousel-control" href="#thumbcarousel" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                      </a>
                    </div>
                  </div>
                </div>
                <div class="media-body">
                  <ul class="list-inline">
                    <li class="mb-4 mb-md-0">
                      <a href="changelist.jsp"><i class="fa fa-reply" aria-hidden="true"></i>
                        回到交換商城
                      </a>
                    </li>

                    <li class="share-all mr-0">
  
                      <a onclick ="add${CproductVO.cp_No}()" class="btn btn-default btn-wishlist2 active">收藏<i style="color:#dee2e6;" class="fa fa-heart"></i></a>
                      <a class="btn btn-default addreport"  >檢舉<i  class="fa fa-exclamation addreport"></i></a>

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
                    </li>
                     
                  </ul>
                  <jsp:useBean id="MemSvc" scope="page" class="com.mem.model.MemService" />
                  <h2>${CproductVO.cpname}</h2>
                  <h3>所屬會員:${MemSvc.memSelectByPk(CproductVO.mem_No).mem_name}</h3>
                  <p>${CproductVO.cptext}</p>
                  <div class="row">
                    <div class="col-12">
                      <span class="quick-drop resizeWidth quantityWidth single-quick-drop">
                        
                      </span>
                    </div>

                    <div class="col-12">
                      <div class="d-flex align-items-center mb-5 pt-3">
                        <c:if test="${not empty CproductVO.cpmeetup}">
	                      <h3 class="co-2">可面交地點:</h3>
                        </c:if>
                        
                           <h3 class="co-2"><c:out value="${CproductVO.cpmeetup}" default="" /></h3>
                           
                        <div class="SingleCartListInner cartListInner pl-1">
                          
                        </div>
                      </div>
                      <h3 style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">想換:${CproductVO.emp_NO}</h3>
                    </div>
                  </div>
                 <c:if test="${mem_No ne CproductVO.mem_No}">
                  <div class="btn-area mb-0">
                    <a href="gotochange.jsp"class="btn btn-primary btn-default" data-toggle="modal" data-target="#ADDCHANGE">創建商品交換<i class="fa fa-angle-right" aria-hidden="true"></i></a>
                  </div>
                   <div style="margin-top:10px;" class="btn-area mb-0">
                    <button  type="button" class="btn btn-primary btn-default" data-toggle="modal" data-target="#CHOSE">現有商品交換<i class="fa fa-angle-right" aria-hidden="true"></i></button>
                    </div>
                    </c:if>
                    <c:if test="${mem_No eq CproductVO.mem_No}">
                  <div class="btn-area mb-0">
                   <button type="button"  class="btn btn-info btn-rounded"data-toggle="modal" data-target="#A12" ><i class="fa fa-pencil" aria-hidden="true"></i>修改商品</button>
                    </div>
                    </c:if>
                  <div class="tabArea d-none">
                    <ul class="nav nav-tabs bar-tabs">
                      <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#details">details</a></li>
                      <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#about-art">about art</a></li>
                      <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#sizing">sizing</a></li>
                      <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#shipping">shipping</a></li>
                    </ul>
                    <div class="tab-content">
                      <div id="details" class="tab-pane fade show active">
                        <p>LContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin liter ature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia.</p>
                        <ul class="list-unstyled">
                          <li>Black, Crew Neck</li>
                          <li>75% Cotton, 25% Rayon</li>
                          <li>Waterbased Ink</li>
                          <li>Wash Cold, dry low</li>
                        </ul>
                      </div>
                      <div id="about-art" class="tab-pane fade">
                        <p>Nulla facilisi. Mauris efficitur, massa et iaculis accumsan, mauris velit ultrices purus, quis condimentum nibh dolor ut tortor. Donec egestas tortor quis mattis gravida. Ut efficitur elit vitae dignissim volutpat. </p>
                      </div>
                      <div id="sizing" class="tab-pane fade">
                        <p>Praesent dui felis, gravida a auctor at, facilisis commodo ipsum. Cras eu faucibus justo. Nullam varius cursus nisi, sed elementum sem sagittis at. Nulla tellus massa, vestibulum a commodo facilisis, pulvinar convallis nunc.</p>
                      </div>
                      <div id="shipping" class="tab-pane fade">
                        <p>Mauris lobortis augue ex, ut faucibus nisi mollis ac. Sed volutpat scelerisque ex ut ullamcorper. Cras at velit quis sapien dapibus laoreet a id odio. Sed sit amet accumsan ante, eu congue metus. Aenean eros tortor, cursus quis feugiat sed, vestibulum vel purus.</p>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
          </div>
 <div  class="modal fade " id="ADDCHANGE" tabindex="-1"role="dialog" aria-labelledby="exampleModalCenterTitle"
  aria-hidden="true">
  
  <div class="modal-dialog modal-dialog-centered modal-lg  " role="document">
    <div  style="width:1200px" class="modal-content " >
      
        
             <c:if test="${mem_No ne '1'}">
            <jsp:include page="addchange2.jsp"></jsp:include>
            </c:if>
            <c:if test="${mem_No eq '1'}">
                <a data-toggle="modal" href='.login-modal'class="btn btn-info btn-rounded">請先登入</a>
            </c:if>
   </div>
   </div>
   </div>       
      

 <div class="modal fade" id="A12" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
  aria-hidden="true">
  
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      
        <div class="modal-header px-4">
          <h5 class="modal-title" id="exampleModalCenterTitle">建立交換商品</h5>
        </div>
        <div class="modal-body px-4">

          <div class="form-group row mb-6">
              <div class="col-md-8 col-lg-9 col-xl-10 col-12">
                      <form class="form-horizontal" METHOD="post" ACTION="Cproduct.do" name="form101" enctype ="multipart/form-data" onsubmit="return chk2();">
                        <div class="form-group row">
                          <label for="" class="col-md-3 control-label">商品名稱</label>
                          <div class="col-md-7">
                            <input type="text" class="form-control" name="cpname" value="${CproductVO.cpname}" placeholder="請輸入20字以內並不可包含不雅字眼">
                          </div>
                        </div>
                        <div class="form-group row">
          

		       <label for=""class="col-md-3 control-label">商品類別</label>
		       <div class="col-md-9">
		       <select class="form-control" id="exampleFormControlSelect12" name="cpClass">
			   <c:forEach var="CpclassVO" items="${CpclassSvc.all}">
			   <option value="${CpclassVO.cpClass_No}" ${(CproductVO.cpClass_No eq CpclassVO.cpClass_No)? 'selected':'' } >${CpclassVO.cpClass}
			   
			   </c:forEach>
			   </select>
			   </div>
			   
		       
          </div>
                        <div class="form-group row">
                        <label for="" class="col-md-3 control-label">面交地點</label>
                        
            <div class="col-md-9 city-selector-${CproductVO.cp_No}"  >
            
            <button  type="button" onclick="showsub${CproductVO.cp_No}()" class="btn btn-primary btn-pill">不面交</button>
            
  

    <select  name="cpmeetup1" class="county-${CproductVO.cp_No}"></select>
  
  

    <select  name="cpmeetup2"   class="district-${CproductVO.cp_No}"></select>
    
    <script type="text/javascript">
    new TwCitySelector({
	    el: ".city-selector-${CproductVO.cp_No}",
	    elCounty: '.county-${CproductVO.cp_No}', 
	    elDistrict: '.district-${CproductVO.cp_No}', 
	   
	  });
    
    function showsub${CproductVO.cp_No}(){ 
  	  var submenu=document.getElementsByClassName("county-${CproductVO.cp_No}")[0]; 
  	  submenu.style.display="none"; 
  	  submenu=document.getElementsByClassName("district-${CproductVO.cp_No}")[0]; 
  	  submenu.style.display="none";
  	  
  	  } ;
    </script>
     
  </div>
  
            
          </div>
                        <div  class="form-group row" >
                          <label style="top:25px" for="" class="col-md-3 control-label">交換訊息</label>
                          <div style="top:25px" class="col-md-9">
                            <textarea style="width:600px;height:200px ;" name="cptext" class="form-control" id="exampleFormControlTextarea1" required rows="6" >${CproductVO.cptext}</textarea>
                          </div>
                        </div>
                       
                        <div class="form-group row">
                          <label style="top:25px;left:13px;" for="" class="col-md-3 control-label">期望商品類別</label>
                          <div style="top:25px" class="col-md-9">
                            <input  type="text" class="form-control" name="emp_NO" id="" value="${CproductVO.emp_NO}"placeholder="請以1~5字簡單描述，如寶可夢卡牌、PS5遊戲等等，此訊息將用於推薦商品供您更便利的尋找到交換商品">
                          </div>
                        </div>
                        
                        <div class="form-group row">
                          <div style="top:15px" class=" col-md-12 ">
                                             
                            
                          </div>
                        </div>
                         <div class="modal-footer px-4">
          <button type="button" class="btn btn-primary btn-pill" data-dismiss="modal">取消</button>
          <input type="hidden" name="action" value="updatemain">
          <input type="hidden" name="url" value="${url}">
          <input type="hidden" name="cp_No" value="${CproductVO.cp_No}">
          <input type="submit"  class="btn btn-primary btn-pill" value="確定交換">
           
        </div>
                      </form>
                  </div>
          </div>

          <div class="row mb-2">
           
          </div>
        </div>
       
     
    </div>
  </div>
</div>         




<div class="modal fade " id="PIC${CproductVO.cp_No}"tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div style="width:200%;margin-left:5%" class="modal-dialog quick-view ">
        <div style="width:1560px;height:780px;margin:20px;" class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">商品圖片</h4>
            </div>
            <div class="modal-body text-center">
              <div style="margin: 0 auto;" class="modal-dialog">
				<div class="modal-content">
				  <div class="modal-body">
					<div class="media flex-wrap">
					   <div style="height:300px;width:300px; class="media-left px-0">
						  <img style="height:100%;width:100%;" id="oldimg1-${CproductVO.cp_No}"  class="media-object" src="makeimage.jsp?pic1=${CproductVO.cp_No}&No=1" alt="Image">
					   
					    
                          <img id="showimg1-${CproductVO.cp_No}" src="" style="display:none;height:100%;width:100%;"alt="profile-image" />  
                        </div>
						
						 <div style="height:300px;width:300px;margin:20px;" class="media-left px-0">
							  <img style="height:100%;width:100%;" id="oldimg2-${CproductVO.cp_No}"  class="media-object" src="makeimage.jsp?pic1=${CproductVO.cp_No}&No=2" alt="Image">
						 
						  
                               <img  id="showimg2-${CproductVO.cp_No}" src="" style="display:none;height:100%;width:100%;"alt="profile-image" />  
                          </div>
                               
						  <div style="height:300px;width:300px; class="media-left px-0">
							   <img  style="height:100%;width:100%;" id="oldimg3-${CproductVO.cp_No}"  class="media-object" src="makeimage.jsp?pic1=${CproductVO.cp_No}&No=3" alt="Image">
						  
						  
                               <img id="showimg3-${CproductVO.cp_No}" src="" style="display:none;height:100%;width:100%;"alt="profile-image" />  
                           </div>
						</div>	
							
							
							<c:if test="${mem_No eq CproductVO.mem_No}">
							<form class="form-horizontal" METHOD="post" ACTION="Cproduct.do" name="form1" enctype ="multipart/form-data">
						       <label  style="float:left;" for="pic1MEM1" class="btn btn-primary btn-pill" style="clear:both;" >                  
                                 上傳第一張圖片
                                      <input style="display:none;"  onchange="showImg1MEM1(this)"accept="image/gif, image/jpeg, image/png" name="pic1${CproductVO.cp_No}" id="pic1MEM1" style="opacity:0%" type="file"  class="btn btn-primary btn-block" role="button" >
                              </label>
                              <label  style="" for="pic2MEM1" class="btn btn-primary btn-pill">                  
                                 上傳第二張圖片                        
                              <input style="display:none;" onchange="showImg2MEM1(this)"accept="image/gif, image/jpeg, image/png" name="pic2${CproductVO.cp_No}"id="pic2MEM1" style="opacity:0%" type="file"  class="btn btn-primary btn-block" role="button" >
                        
                               </label>
                               <label  style="float:right;" for="pic3MEM1" class="btn btn-primary btn-pill" >                  
                               上傳第三張圖片
                        
                               <input style="display:none;" onchange="showImg3MEM1(this)"accept="image/gif, image/jpeg, image/png" name="pic3${CproductVO.cp_No}" id="pic3MEM1" style="opacity:0%" type="file"  class="btn btn-primary btn-block" role="button" >
                        
                                </label>
                                        								
								
			     
							 <div style="position: absolute; right:15px;" class="form-group row">
                                 <div style="top:15px" class=" col-md-12 ">
                                    <input type="hidden" name="action" value="updatepic">
                          <input type="hidden" name="url" value="${url}">
                          <input type="hidden" name="cp_No" value="${CproductVO.cp_No}">
                                    <button  type="submit" class="btn btn-primary float-right">修改圖片</button>
                                 </div>
                             
                             </div>
                             </form>
                             </c:if>
                             
                             <script type="text/javascript">

function showImg1MEM1(thisimg) {
  	var file = thisimg.files[0];
  	if(window.FileReader) {
  		var fr = new FileReader();  
  		var showimg = document.getElementById('showimg1-${CproductVO.cp_No}');
  		fr.onloadend = function(e) {
  		showimg.src = e.target.result;
  	};
  	fr.readAsDataURL(file);
  	showimg.style.display = 'block';
  	}
  	 var submenu=document.getElementById('oldimg1-${CproductVO.cp_No}'); 
  	  submenu.style.display="none"; 
  }
  function showImg2MEM1(thisimg) {
    	var file = thisimg.files[0];
    	if(window.FileReader) {
    		var fr = new FileReader();  
    		var showimg = document.getElementById('showimg2-${CproductVO.cp_No}');
    		fr.onloadend = function(e) {
    		showimg.src = e.target.result;
    	};
    	fr.readAsDataURL(file);
    	showimg.style.display = 'block';
    	}
    	 var submenu=document.getElementById('oldimg2-${CproductVO.cp_No}'); 
    	  submenu.style.display="none"; 
    }
  function showImg3MEM1(thisimg) {
    	var file = thisimg.files[0];
    	if(window.FileReader) {
    		var fr = new FileReader();  
    		var showimg = document.getElementById('showimg3-${CproductVO.cp_No}');
    		fr.onloadend = function(e) {
    		showimg.src = e.target.result;
    	};
    	fr.readAsDataURL(file);
    	showimg.style.display = 'block';
    	}
    	 var submenu=document.getElementById('oldimg3-${CproductVO.cp_No}'); 
    	  submenu.style.display="none"; 
    }

</script>                    
                         
				
		       </div>	
		     </div>
	       </div>
          </div>
        </div> 
    </div> 
</div>

	
    

<div class="modal fade" id="CHOSE" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
  aria-hidden="true">
  
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      
        <div class="modal-header px-4">
          <h5 class="modal-title" id="exampleModalCenterTitle">現有商品交換</h5>
        </div>
        <div class="modal-body px-4">
        <c:if test="${mem_No eq '1'}">
                <a data-toggle="modal" href='.login-modal'class="btn btn-info btn-rounded">請先登入</a>
            </c:if>
        <div class="row">
        
            <div class="col-12">
              <div class="innerWrapper">
                <div class="orderBox myAddress">
                  <h2>My Change</h2>
  <%               
    List<CproductVO> list =  CproductSvc.getmemCproduct(mem_No);
    pageContext.setAttribute("list",list);
 %>   
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>商品編號</th>
                          <th>商品編號</th>
                          <th>商品編號</th>
                          <th>商品編號</th>
                          <th>商品編號</th>
                          <th style="padding-left:30px">商品編號</th>
                          <th>商品編號</th>
                          <th></th>
                        </tr>
                      </thead>
                      <tbody>
                     
       <c:forEach var="CproductVO" items="${list}" >
                        <tr>
                        
                          <td>${CproductVO.cp_No}</td>
			              <td>${CproductVO.cpname}</td>
			              <td>${CproductVO.cpState}</td>
			              <td>${CpclassSvc.getOneCproduct(CproductVO.cpClass_No).cpClass}</td>
			              <td> <c:out value="${CproductVO.cpmeetup}" default="不面交" /></td> 			            
			              <td> <img src="makeimage.jsp?pic1=${CproductVO.cp_No}&No=1" width="100" height="64" border="0">
			              
			             </td>
                          <td><fmt:formatDate value="${CproductVO.cpontime}" pattern="yyyy/MM/dd hh:mm:ss" /></td>
                          <td>
                           <c:if test="${CproductVO.cpState eq '已上架'}">
                           <form METHOD="post" ACTION="Cproduct.do" name="form4" enctype ="multipart/form-data">
                           <input type="hidden" name="cp_No"  value="${CproductVO.cp_No}">
                           <input type="hidden" name="action"  value="chosechange">
                              <button type="Submit" class="btn btn-default  smartalert" ><i class="btn btn-sm btn-secondary-outlined">提出交換</i></button>
                              </form>
                              </c:if>
                          </td>
                         
                        </tr>
                         </c:forEach>
                        
                      </tbody>
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
</section>



<jsp:include page="/assets/footer.jsp" flush="true"/>
         

		<script src="../assets/plugins/jquery/jquery.min.js"></script>
		<script src="../assets/plugins/jquery/jquery-migrate-3.0.0.min.js"></script>
		<script src="../assets/plugins/jquery-ui/jquery-ui.js"></script>
		<script src="../assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="../assets/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
		<script src="../assets/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
		<script src="../assets/plugins/slick/slick.js"></script>
		<script src="../assets/plugins/fancybox/jquery.fancybox.min.js"></script>
		<script src="../assets/plugins/iziToast/js/iziToast.js"></script>
		<script src="../assets/plugins/prismjs/prism.js"></script>
		<script src="../assets/plugins/selectbox/jquery.selectbox-0.1.3.min.js"></script>
		<script src="../assets/plugins/countdown/jquery.syotimer.js"></script>
		<script src="../assets/plugins/velocity/velocity.min.js"></script>
		<script src="../assets/plugins/rateyo/jquery.rateyo.min.js"></script>
		<script src="../assets/js/custom.js"></script>
<div class="modal fade login-modal" id="login" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header justify-content-center">
						<h3 class="modal-title">會員登入</h3>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
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
						
							
							<button type="submit" class="btn btn-primary btn-block">登入</button>
							<button type="button" class="btn btn-link btn-block">Forgot Password?</button>
							 <input type="hidden" name="action" value="memLogin">
						</form>
					</div>
				</div>
			</div>
		</div>
					
							
							

	</body>
		<script>
function chk2(){
    if(document.form101.cpname.value==''){
      
    	Swal.fire(
			     
  		      '商品名稱未填'
  		     
  		    )
      return false;
    }
    if(document.form101.cpname.value.length>30){
        
    	Swal.fire(
			     
  		      '商品名稱過長'
  		     
  		    )
      return false;
    }
    if(document.form101.cptext.value.length>500){
        
    	Swal.fire(
			     
  		      '商品描述過長'
  		     
  		    )
      return false;
    }
    return true;
  }

</script>
<script type="text/javascript">

function add${CproductVO.cp_No}(){
	console.log('reigjreigjoireg');
	let data1 = {};

	data1.action = 'addtr';

	url = 'Cproduct.do';

	data1.cp_No ='${CproductVO.cp_No}';
	var mem_No='${mem_No}';
    if(mem_No == "1"){
    	alert('請先登入');
 }
    else{
    	
	data1.mem_No =mem_No;
    
	console.log(data1)
	$.ajax({
		url :url,
		type :"POST" ,
		data :data1 , 
		success : function(e) {
			
				
			
		}
	});}
 }



</script>  
<script>
	$('.btn-wishlist2').on('click', function() {
		var mem_No='${mem_No}';
	    if(mem_No == "1"){
	    	
	 }
	    else{
		var b = $(this).data('iteration') || 1,
		c = {
			title: '',
			animateInside: !1,
			position: 'topRight',
			progressBar: !1,
			timeout: 3200,
			transitionIn: 'fadeInLeft',
			transitionOut: 'fadeOut',
			transitionInMobile: 'fadeIn',
			transitionOutMobile: 'fadeOut'
		};
	switch (b) {
		case 1:
			$(this).addClass('active'), c.class = 'iziToast-info', c.message = '已加入收藏!', c.icon = 'icon-bell';
			$(this).children().css("color","red");
			break;
		case 2:
			$(this).removeClass('active'), c.class = 'iziToast-danger', c.message = '已從收藏中移除!', c.icon = 'icon-ban';
			$(this).children().css("color","#dee2e6");
	}
	iziToast.show(c), b++, b > 2 && (b = 1), $(this).data('iteration', b);
	
	    }});
	</script>    
	<script> 
	$(document).ready(function(){			
		$(".addreport").click(function(){
			var mem_No='${mem_No}';
		    if(mem_No == "1"){
		    	alert('請先登入');
		 }
		    else{
			Swal.fire({
				  title: 'Are you sure?',
				  text: "這個商品違反了相關規定嗎?",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '是，我要檢舉它!'
				}).then((result) => {
				  if (result.value) {
				    Swal.fire(
				     
				      '很快將有專人進行審核',
				      'success'
				    )
		let data = {};
		let message = $(this).parent().children();
		let ppr = $(this).parent().parent().prev().prev().prev();
		
		url = 'Cproduct.do';
		data.action = "addreport";
		
		
		
  
	$.ajax({
		url :url,
		type :"POST" ,
		data :data , 
		success : function(e) {	
		}
	});
				  }})
	}})
	})
	</script>   
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script>
	var MyPoint = "/Change/${mem_No}";
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/', 1));
	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;

	var statusOutput = document.getElementById("statusOutput");
	var messagesArea = document.getElementById("messagesArea");
	var self = '${mem_No}';
	var changewebSocket;

	function connect(){
		// create a websocket
		changewebSocket = new WebSocket(endPointURL);

		changewebSocket.onopen = function(event) {
			console.log("Connect Success!");
			
		};
        var mem_No=$("#mem_No").val();
		changewebSocket.onmessage = function(event) {
			console.log(mem_No);
			console.log(event.data);
			if(event.data==mem_No){
				
				 
				Swal.fire('你有一個新的交換申請')
				
			}
			
		}

		changewebSocket.onclose = function(event) {
			console.log("Disconnected!");
		};
	}
	
	
	
	function disconnect() {
		changewebSocket.close();
		document.getElementById('sendMessage').disabled = true;
		document.getElementById('connect').disabled = false;
		document.getElementById('disconnect').disabled = true;
	}
	
	function updateFriendName(name) {
		statusOutput.innerHTML = name;
	}
</script>
</html>