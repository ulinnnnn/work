<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.CPRECORD.model.*"%>
<%@ page import="com.cproduct.model.*"%>
<%@ page  import=" java.util.stream.Collectors" %>
<%@ page import="com.mem.model.*"%>
<%@ page import="java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
<%
session.setAttribute("CprecordVO", null);
    CproductService  CproductSvc = new  CproductService();

MemVO memVO=(MemVO)session.getAttribute("memVO");
String mem_No=memVO.getMem_no();
session.setAttribute("mem_No",mem_No);
    List<CproductVO> fillist =  CproductSvc.getmemCproduct(mem_No);
    List<CproductVO> list = fillist.stream() .filter(o -> !o.getCpState().equals("已下架")).collect(Collectors.toList());
    pageContext.setAttribute("list",list);
    System.out.print(request.getServletPath());
    session.setAttribute("location", request.getServletPath());
%>
  <jsp:useBean id="CpclassSvc" scope="page" class="com.cpclass.model.CpclassService" />
<script src="https://cdn.jsdelivr.net/npm/tw-city-selector@2.1.1/dist/tw-city-selector.min.js" integrity="sha256-Iz/pF94D+raqeqXJDoOetn9L0yBFI7ogMMrhT6RzmFw=" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
     <script type="text/javascript">
    
      

      function showImg1(thisimg) {
      	var file = thisimg.files[0];
      	if(window.FileReader) {
      		var fr = new FileReader();  
      		var showimg = document.getElementById('showimg1');
      		fr.onloadend = function(e) {
      		showimg.src = e.target.result;
      	};
      	fr.readAsDataURL(file);
      	showimg.style.display = 'block';
      	}
      	 var submenu=document.getElementById('oldimg1'); 
      	  submenu.style.display="none"; 
      }
      function showImg2(thisimg) {
        	var file = thisimg.files[0];
        	if(window.FileReader) {
        		var fr = new FileReader();  
        		var showimg = document.getElementById('showimg2');
        		fr.onloadend = function(e) {
        		showimg.src = e.target.result;
        	};
        	fr.readAsDataURL(file);
        	showimg.style.display = 'block';
        	}
        	 var submenu=document.getElementById('oldimg2'); 
        	  submenu.style.display="none"; 
        }
      function showImg3(thisimg) {
        	var file = thisimg.files[0];
        	if(window.FileReader) {
        		var fr = new FileReader();  
        		var showimg = document.getElementById('showimg3');
        		fr.onloadend = function(e) {
        		showimg.src = e.target.result;
        	};
        	fr.readAsDataURL(file);
        	showimg.style.display = 'block';
        	}
        	 var submenu=document.getElementById('oldimg3'); 
        	  submenu.style.display="none"; 
        }
      
 
      
      
      
      
    </script>
    
    
    
    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Change - BIGBAG Store</title>

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

  </head>

  <body onload="connect();" onunload="disconnect();" id="body" class="body-wrapper version1 up-scroll">

    <div style="overflow:visible;">
        <jsp:include page="/assets/topBar.jsp" flush="true"/>
</div>

      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix userProfile">
       <input type="hidden" id="mem_No"  value="${mem_No}">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <div class="btn-group" role="group" aria-label="...">
              <a href="/EA102G5/front_end/readrequest.jsp" class="btn btn-default "><i class="fa fa-th" aria-hidden="true"></i>交換申請</a>
                <a href="/EA102G5/front_end/addchange.jsp" class="btn btn-default"><i class="fa fa-user" aria-hidden="true"></i>新增交換商品</a>
                <a href="/EA102G5/front_end/readchange.jsp" class="btn btn-default active"><i class="fa fa-map-marker" aria-hidden="true"></i>我的商品</a>
                <a href="/EA102G5/front_end/readrecord.jsp" class="btn btn-default"><i class="fa fa-list" aria-hidden="true"></i>交換紀錄</a>
                <a href="/EA102G5/front_end/readwish.jsp" class="btn btn-default"><i class="fa fa-gift" aria-hidden="true"></i>Wishlist</a>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <div class="innerWrapper">
                <div class="orderBox myAddress">
                  <h2>My Change</h2>
               <%@ include file="page1.file" %>    
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>商品編號</th>
                          <th>商品名稱</th>
                          <th>商品狀態</th>
                          <th>商品類別</th>
                          <th>面交地點</th>
                          <th style="padding-left:30px">封面圖片</th>
                          <th>上架時間</th>
                          <th></th>
                        </tr>
                      </thead>
                      <tbody>
                     
       <c:forEach var="CproductVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                        <tr>
                        
                          <td>${CproductVO.cp_No}</td>
			              <td>${CproductVO.cpname}</td>
			              <td>${CproductVO.cpState}</td>
			              <td>${CpclassSvc.getOneCproduct(CproductVO.cpClass_No).cpClass}</td>
			              <td> <c:out value="${CproductVO.cpmeetup}" default="不面交" /></td> 			            
			              <td> <img data-toggle="modal" data-target="#PIC${CproductVO.cp_No}" src="makeimage.jsp?pic1=${CproductVO.cp_No}&No=1" width="100" height="64" border="0">
			              
			             </td>
                          <td><fmt:formatDate value="${CproductVO.cpontime}" pattern="yyyy/MM/dd hh:mm:ss" /></td>
                          <td style="padding: .15rem;">
                            <div class="btn-group" role="group">
                            <input type="hidden" name="cp_No"  value="${CproductVO.cp_No}">
			     			<input type="hidden" name="cpstate"  value="已下架">
			     			
                                
                               <c:if test="${CproductVO.cpState ne '確定交換' && CproductVO.cpState ne '交換完成' && CproductVO.cpState ne '交換中'}">
                              <button type="button" class="btn btn-default" data-toggle="modal" data-target="#A${CproductVO.cp_No}"><i class="fa fa-pen" aria-hidden="true"></i></button>
                              </c:if>
                              <c:if test="${CproductVO.cpState eq '已上架' || CproductVO.cpState eq '審核中'}">
                              <button type="button" class="btn btn-default  smartalert" ><i class="fa fa-times" aria-hidden="true"></i></button>
                             </c:if>
			      <a href="getoneCSS.jsp?${CproductVO.cp_No}"class="btn btn-primary btn-default">前往商品頁面<i class="fa fa-angle-right" aria-hidden="true"></i></a>
                            </div>
                          </td>
                         
                        </tr>
                         </c:forEach>
                         <tr>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                        </tr>
                        <tr>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                        </tr>
                        <tr>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                        </tr>
                        <tr>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                        </tr>
                        
                      </tbody>
                    </table>
                    <%@ include file="page2.file" %> 
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      
       
 <c:forEach var="CproductVO" items="${list}" >
<div class="modal fade" id="A${CproductVO.cp_No}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
  aria-hidden="true">
  
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      
        <div class="modal-header px-4">
          <h5 class="modal-title" id="exampleModalCenterTitle">修改商品</h5>
        </div>
        <div class="modal-body px-4">

          <div class="form-group row mb-6">
              <div class="col-md-8 col-lg-9 col-xl-10 col-12">
                      <form class="form-horizontal" METHOD="post" ACTION="Cproduct.do" name="form${CproductVO.cp_No}" enctype ="multipart/form-data" onsubmit="return chk${CproductVO.cp_No}();">
                        <div class="form-group row">
                          <label for="" class="col-md-3 control-label">商品名稱</label>
                          <div class="col-md-7">
                            <input type="text" id="ch-${CproductVO.cp_No}" class="form-control " name="cpname" value="${CproductVO.cpname}" placeholder="請輸入20字以內商品名稱">
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
            
  
    <!-- 縣市選單 -->
    <select  name="cpmeetup1" class="county-${CproductVO.cp_No}"></select>
  
  
    <!-- 區域選單 -->
    <select  name="cpmeetup2"   class="district-${CproductVO.cp_No}"></select>
    
    <script type="text/javascript">
    new TwCitySelector({
	    el: ".city-selector-${CproductVO.cp_No}",
	    elCounty: '.county-${CproductVO.cp_No}', // 在 el 裡查找 element
	    elDistrict: '.district-${CproductVO.cp_No}', // 在 el 裡查找 element
	   
	  });
    
    function showsub${CproductVO.cp_No}(){ 
  	  var submenu=document.getElementsByClassName("county-${CproductVO.cp_No}")[0]; 
  	  submenu.style.display="none"; 
  	  submenu=document.getElementsByClassName("district-${CproductVO.cp_No}")[0]; 
  	  submenu.style.display="none";
  	  
  	  } ;
    </script>
    <script>
function chk${CproductVO.cp_No}(){
	 if(document.getElementById("ch-${CproductVO.cp_No}").value==''){
	    	Swal.fire(
				     
	  		      '商品名稱未填'
	  		     
	  		    )
	      return false;
	    }
	 if(document.getElementById("ch-${CproductVO.cp_No}").value.length>30){
	        
	    	Swal.fire(
				     
	    			'商品名稱過長' 
	  		     
	  		    )
	      return false;
	    }
	    if(document.getElementById("ct-${CproductVO.cp_No}").value.length>200){
	        
	    	Swal.fire(
				     
	  		      '商品敘述過長'
	  		     
	  		    )
	      return false;
	    }
	    if(document.getElementById("ce-${CproductVO.cp_No}").value.length>30){
	        
	    	Swal.fire(
				     
	  		      '標籤過長，請簡短描述'
	  		     
	  		    )
	      return false;
	    }   
	 console.log(document.getElementById("ch-${CproductVO.cp_No}"));
    return true;
  }

</script>
     
  </div>
  
            
          </div>
                        <div  class="form-group row" >
                          <label style="top:25px" for="" class="col-md-3 control-label">商品敘述</label>
                          <div style="top:25px" class="col-md-9">
                            <textarea id="ct-${CproductVO.cp_No}" style="width:600px;height:200px ;" name="cptext" class="form-control" id="exampleFormControlTextarea1" required rows="6" >${CproductVO.cptext}</textarea>
                          </div>
                        </div>
                       
                        <div class="form-group row">
                          <label style="top:25px;left:13px;" for="" class="col-md-3 control-label">欲交換商品</label>
                          <div style="top:25px" class="col-md-9">
                            <input  id="ce-${CproductVO.cp_No}" type="text" class="form-control" name="emp_NO" id="" value="${CproductVO.emp_NO}"placeholder="此訊息將被搜尋到並以推薦功能提供模糊比對，建議使用PS4遊戲、樂高、寶可夢卡牌等簡短標籤">
                          </div>
                        </div>
                        
                        <div class="form-group row">
                          <div style="top:15px" class=" col-md-12 ">
                                             
                            
                          </div>
                        </div>
                         <div class="modal-footer px-4">
          <button type="button" class="btn btn-primary btn-pill" data-dismiss="modal">Cancel</button>
          <input type="hidden" name="action" value="updatemain">
          <input type="hidden" name="cp_No" value="${CproductVO.cp_No}">
          <input type="submit"  class="btn btn-primary btn-pill" value="送出修改">
           
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
</c:forEach>
<c:forEach var="CproductVO" items="${list}">
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
						       <label  style="float:left;" for="pic1${CproductVO.cp_No}" class="btn btn-primary btn-pill" style="clear:both;" >                  
                                 上傳第一張圖片
                                      <input style="display:none;"  onchange="showImg1${CproductVO.cp_No}(this)"accept="image/gif, image/jpeg, image/png" name="pic1${CproductVO.cp_No}" id="pic1${CproductVO.cp_No}" style="opacity:0%" type="file"  class="btn btn-primary btn-block" role="button" >
                              </label>
                              <label  style="" for="pic2${CproductVO.cp_No}" class="btn btn-primary btn-pill">                  
                                 上傳第二張圖片                        
                              <input style="display:none;" onchange="showImg2${CproductVO.cp_No}(this)"accept="image/gif, image/jpeg, image/png" name="pic2${CproductVO.cp_No}"id="pic2${CproductVO.cp_No}" style="opacity:0%" type="file"  class="btn btn-primary btn-block" role="button" >
                        
                               </label>
                               <label  style="float:right;" for="pic3${CproductVO.cp_No}" class="btn btn-primary btn-pill" >                  
                               上傳第三張圖片
                        
                               <input style="display:none;" onchange="showImg3${CproductVO.cp_No}(this)"accept="image/gif, image/jpeg, image/png" name="pic3${CproductVO.cp_No}" id="pic3${CproductVO.cp_No}" style="opacity:0%" type="file"  class="btn btn-primary btn-block" role="button" >
                        
                                </label>
                                        								
								
			     
							 <div style="position: absolute; right:15px;" class="form-group row">
                                 <div style="top:15px" class=" col-md-12 ">
                                    <input type="hidden" name="action" value="updatepic">
                          
                                    <input type="hidden" name="cp_No" value="${CproductVO.cp_No}">
                                    <button  type="submit" class="btn btn-primary float-right">修改圖片</button>
                                 </div>
                             
                             </div>
                             </form>
                             </c:if>
                             
                             <script type="text/javascript">

function showImg1${CproductVO.cp_No}(thisimg) {
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
  function showImg2${CproductVO.cp_No}(thisimg) {
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
  function showImg3${CproductVO.cp_No}(thisimg) {
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
		
		</c:forEach>
		
		
      			<!-- FOOTER -->
			
			<!-- COPY RIGHT -->
			

		<!-- LOGIN MODAL -->
		

		<!-- SIGN UP MODAL -->
		

		<!-- PORDUCT QUICK VIEW MODAL -->
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

	</body>
	
	<script type="text/javascript">
	
	$(document).ready(function(){			
		$(".smartalert").click(function(){
			Swal.fire({
				  title: 'Are you sure?',
				  text: "這個商品將被下架，你將不會再看到它!",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes, delete it!'
				}).then((result) => {
				  if (result.value) {
				    Swal.fire(
				     
				      '此商品已下架',
				      'success'
				    )
				    let data = {};
					let message = $(this).parent().children();
					
					
					url = 'Cproduct.do';
					data.action = "updatecpstate";
					
					data.cp_No = message[0].value;					
					data.cpstate = message[1].value;
					
					$(this).parent().parent().parent().hide();
					
					console.log('reigjreigjoireg');
			  
				$.ajax({
					url :url,
					type :"POST" ,
					data :data , 
					success : function(e) {	
					}
				});
				    
				    
				    
				    
				  }
				})
				})
	})	
	
	
	
	</script>
	
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
