<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="big5"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.cproduct.model.*"%>
<%@ page import="com.CPRECORD.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>

<html lang="en">
  <head>
 <%
 CprecordVO   CprecordVO=(CprecordVO)session.getAttribute("CprecordVO"); 
 %>
<c:if test="${cpstate eq '�洫��'  and cpstate2 eq '�洫��'}">
<jsp:forward page="changeorder_2.jsp"/>
</c:if>

<c:if test="${cpstate eq '�T�w�洫' and cpstate2 eq '�T�w�洫'}">
<jsp:forward page="changeorder_3.jsp"/>
</c:if>
<script src="https://cdn.jsdelivr.net/npm/tw-city-selector@2.1.1/dist/tw-city-selector.min.js" integrity="sha256-Iz/pF94D+raqeqXJDoOetn9L0yBFI7ogMMrhT6RzmFw=" crossorigin="anonymous">
</script>
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Single Order - BIGBAG Store</title>

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

  <body  onload="connect();" onunload="disconnect();" id="body" class="body-wrapper version1 up-scroll">

   <div style="overflow:visible;">
        <jsp:include page="/assets/topBar.jsp" flush="true"/>
</div>

      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix userProfile">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <div class="btn-group" role="group" aria-label="...">
              <input id="mem_No" type="hidden" value="${mem_No}">
                <a href="/EA102G5/front_end/readrequest.jsp" class="btn btn-default "><i class="fa fa-th" aria-hidden="true"></i>�洫�ӽ�</a>
                <a href="/EA102G5/front_end/addchange.jsp" class="btn btn-default"><i class="fa fa-user" aria-hidden="true"></i>�s�W�洫�ӫ~</a>
                <a href="/EA102G5/front_end/readchange.jsp" class="btn btn-default"><i class="fa fa-map-marker" aria-hidden="true"></i>�ڪ��ӫ~</a>
                <a href="/EA102G5/front_end/readrecord.jsp" class="btn btn-default  active"><i class="fa fa-list" aria-hidden="true"></i>�洫����</a>
                <a href="/EA102G5/front_end/readwish.jsp" class="btn btn-default"><i class="fa fa-gift" aria-hidden="true"></i>Wishlist</a>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <div class="innerWrapper singleOrder">
            
	<div class="row progress-wizard" style="border-bottom:0;">

                  <div class="col-4 progress-wizard-step active">
                    <div class="text-center progress-wizard-stepnum">�@�H�T�{�洫</div>
                    <div class="progress"><div class="progress-bar"></div></div>
                    <a  class="progress-wizard-dot"></a>
                  </div>

                  <div class="col-4 progress-wizard-step disabled">
                    <div class="text-center progress-wizard-stepnum">����T�w�洫</div>
                    <div class="progress"><div class="progress-bar"></div></div>
                    <a  class="progress-wizard-dot"></a>
                  </div>

                  <div class="col-4 progress-wizard-step disabled">
                    <div class="text-center progress-wizard-stepnum">�洫����</div>
                    <div class="progress"><div class="progress-bar"></div></div>
                    <a  class="progress-wizard-dot"></a>
                  </div>
                </div>
                <div class="orderBox">
                  <h2>Order #${CprecordVO.cpr_No}</h2>
                </div>
             <div class="display-single_element">
		<p>Example: </p>
		<jsp:useBean id="CproductSvc" scope="page" class="com.cproduct.model.CproductService" />
		<div class="card-deck">
			<div class="card">
				<div class="card_img">
					
						<img class="card-img-top"  data-toggle="modal" data-target="#PIC${CprecordVO.cp_No1}" src="makeimage.jsp?pic1=${CprecordVO.cp_No1}&No=1"  alt="card img">
					
				</div>
				<div class="card-block">
			        <h3 class="card-title">${CproductSvc.getOneCproduct(CprecordVO.getCp_No1()).cpname}</h3>
					<span>${CprecordVO.mem_No1}</span>
					<p class="card-text">${CproductSvc.getOneCproduct(CprecordVO.getCp_No1()).cpmeetup}</p>
					<p class="card-text">${CproductSvc.getOneCproduct(CprecordVO.getCp_No1()).cptext}</p>
					<c:if test="${mem_No eq CprecordVO.mem_No1}">
					
					<c:if test="${cpstate ne '�T�w�洫'}">
					<button data-toggle="modal" data-target="#A${CprecordVO.cp_No1}"class="btn btn-primary">�ק�ӫ~</button>
					
					
					
					<FORM  METHOD="post" ACTION="Cproduct.do" style="margin-bottom: 0px;">
			     <input type="submit"   class="btn btn-primary"  value="�T�w�洫">
			     <input type="hidden" name="cpstate" value="�T�w�洫">
			     <input type="hidden" name="mem_No"  value="${CprecordVO.mem_No2}">
			     <input type="hidden" name="cp_No"  value="${CprecordVO.cp_No1}">
			     <input type="hidden" name="action" value="checkchange"></FORM>
			     </c:if>
			     <c:if test="${cpstate eq '�T�w�洫'}">
			     <FORM  METHOD="post" ACTION="Cproduct.do" style="margin-bottom: 0px;">
			     <input type="submit"   class="btn btn-primary" value="�����洫">
			      <input type="hidden" name="cpstate" value="�洫��">
			     <input type="hidden" name="cp_No"  value="${CprecordVO.cp_No1}">
			     <input type="hidden" name="action" value="checkchange"></FORM>
			     </c:if>
			     <FORM  METHOD="post" ACTION="Cproduct.do" style="margin-bottom: 0px;">
					<label style="top:2px">
				 	
			     <input type="submit"   class="btn btn-primary" value="�פ�洫">
			     <input type="hidden" name="cp_No"  value="${CprecordVO.cp_No1}">
			     <input type="hidden" name="cp_No2"  value="${CprecordVO.cp_No2}">
			     <input type="hidden" name="cpr_No"  value="${CprecordVO.cpr_No}">
			     <input type="hidden" name="mem_No"  value="${CprecordVO.mem_No2}">
			     <input type="hidden" name="action" value="stopchange"></label></FORM>
			     
			     
			     </c:if>
				</div>
				
			</div>
			<div class="card">
				<img class="card-img-top" src="../assets/img/change.png">
			</div>
			<div class="card">
				<div class="card_img">
					
						<img class="card-img-top"  data-toggle="modal" data-target="#PIC${CprecordVO.cp_No2}" src="makeimage.jsp?pic1=${CprecordVO.cp_No2}&No=1"  height="auto">
					
				</div>
				<div class="card-block">
				
                      
                       
                          
					<h3 class="card-title">${CproductSvc.getOneCproduct(CprecordVO.getCp_No2()).cpname}</h3>
					<span>${CprecordVO.mem_No2}</span>
					<p class="card-text">${CproductSvc.getOneCproduct(CprecordVO.getCp_No2()).cpmeetup}</p>
					<p class="card-text">${CproductSvc.getOneCproduct(CprecordVO.getCp_No2()).cptext}</p>
					<c:if test="${mem_No eq CprecordVO.mem_No2}">
					<c:if test="${cpstate2 ne '�T�w�洫'}">
					<label>
					<button data-toggle="modal" data-target="#A${CprecordVO.cp_No2}"class="btn btn-primary">�ק�ӫ~</button>
					</label>
					
					
					
					<FORM  METHOD="post" ACTION="Cproduct.do" style="margin-bottom: 0px;">
			     <input type="submit"   class="btn btn-primary"  value="�T�w�洫">
			     <input type="hidden" name="cpstate" value="�T�w�洫">
			     <input type="hidden" name="mem_No"  value="${CprecordVO.mem_No1}">
			     <input type="hidden" name="cp_No"  value="${CprecordVO.cp_No2}">
			     <input type="hidden" name="action" value="checkchange"></FORM>
			     </c:if>
			     <c:if test="${cpstate2 eq '�T�w�洫'}">
			     <FORM  METHOD="post" ACTION="Cproduct.do" style="margin-bottom: 0px;">
			     <input type="submit"   class="btn btn-primary" value="�����洫">
			      <input type="hidden" name="cpstate" value="�洫��">
			     <input type="hidden" name="cp_No"  value="${CprecordVO.cp_No2}">
			     <input type="hidden" name="action" value="checkchange"></FORM>
			     </c:if>
			     <FORM  METHOD="post" ACTION="Cproduct.do" style="margin-bottom: 0px;">
					<label style="top:2px">
					
			     <input type="submit"   class="btn btn-primary" value="�פ�洫">
			     <input type="hidden" name="cp_No"  value="${CprecordVO.cp_No1}">
			     <input type="hidden" name="cp_No2"  value="${CprecordVO.cp_No2}">
			     <input type="hidden" name="cpr_No"  value="${CprecordVO.cpr_No}">
			     <input type="hidden" name="mem_No"  value="${CprecordVO.mem_No1}">
			     <input type="hidden" name="action" value="stopchange"></label></FORM>
			     
				</c:if>	
			    
				</div>
			</div>
		</div>
	</div>
	
	
	
<div class="modal fade " id="PIC${CprecordVO.cp_No1}"tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

		
    <div style="width:200%;margin-left:5%" class="modal-dialog quick-view ">
        <div style="width:1560px;height:780px;margin:20px;" class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel"> �ӫ~�Ϥ�</h4>
            </div>
            <div class="modal-body text-center">
              <div style="margin: 0 auto;" class="modal-dialog">
				<div class="modal-content">
				  <div class="modal-body">
					<div class="media flex-wrap">
					   <div style="height:300px;width:300px; class="media-left px-0">
						  <img style="height:100%;width:100%;" id="oldimg1-${CprecordVO.cp_No1}"  class="media-object" src="makeimage.jsp?pic1=${CprecordVO.cp_No1}&No=1" alt="Image">
					   
					    
                          <img id="showimg1-${CprecordVO.cp_No1}" src="" style="display:none;height:100%;width:100%;"alt="profile-image" />  
                        </div>
						
						 <div style="height:300px;width:300px;margin:20px;" class="media-left px-0">
							  <img style="height:100%;width:100%;" id="oldimg2-${CprecordVO.cp_No1}"  class="media-object" src="makeimage.jsp?pic1=${CprecordVO.cp_No1}&No=2" alt="Image">
						 
						  
                               <img  id="showimg2-${CprecordVO.cp_No1}" src="" style="display:none;height:100%;width:100%;"alt="profile-image" />  
                          </div>
                               
						  <div style="height:300px;width:300px; class="media-left px-0">
							   <img  style="height:100%;width:100%;" id="oldimg3-${CprecordVO.cp_No1}"  class="media-object" src="makeimage.jsp?pic1=${CprecordVO.cp_No1}&No=3" alt="Image">
						  
						  
                               <img id="showimg3-${CprecordVO.cp_No1}" src="" style="display:none;height:100%;width:100%;"alt="profile-image" />  
                           </div>
						</div>	
							
							
							<c:if test="${mem_No eq CprecordVO.mem_No1}">
							<form class="form-horizontal" METHOD="post" ACTION="Cproduct.do" name="form1" enctype ="multipart/form-data">
						       <label  style="float:left;" for="pic1MEM1" class="btn btn-primary btn-pill" style="clear:both;" >                  
                                 �W�ǲĤ@�i�Ϥ�
                                      <input style="display:none;"  onchange="showImg1MEM1(this)"accept="image/gif, image/jpeg, image/png" name="pic1${CprecordVO.cp_No1}" id="pic1MEM1" style="opacity:0%" type="file"  class="btn btn-primary btn-block" role="button" >
                              </label>
                              <label  style="" for="pic2MEM1" class="btn btn-primary btn-pill">                  
                                 �W�ǲĤG�i�Ϥ�                        
                              <input style="display:none;" onchange="showImg2MEM1(this)"accept="image/gif, image/jpeg, image/png" name="pic2${CprecordVO.cp_No1}"id="pic2MEM1" style="opacity:0%" type="file"  class="btn btn-primary btn-block" role="button" >
                        
                               </label>
                               <label  style="float:right;" for="pic3MEM1" class="btn btn-primary btn-pill" >                  
                               �W�ǲĤT�i�Ϥ�
                        
                               <input style="display:none;" onchange="showImg3MEM1(this)"accept="image/gif, image/jpeg, image/png" name="pic3${CprecordVO.cp_No1}" id="pic3MEM1" style="opacity:0%" type="file"  class="btn btn-primary btn-block" role="button" >
                        
                                </label>
                                        								
								
			     
							 <div style="position: absolute; right:15px;" class="form-group row">
                                 <div style="top:15px" class=" col-md-12 ">
                                    <input type="hidden" name="action" value="updatepic">
                                    <input type="hidden" name="cp_No" value="${CprecordVO.cp_No1}">
                                    <input type="hidden" name="mem_No" value="${CprecordVO.mem_No2}">
                                    <button  type="submit" class="btn btn-primary float-right">�ק�Ϥ�</button>
                                 </div>
                             
                             </div>
                             </form>
                             </c:if>
                             
                             <script type="text/javascript">

function showImg1MEM1(thisimg) {
  	var file = thisimg.files[0];
  	if(window.FileReader) {
  		var fr = new FileReader();  
  		var showimg = document.getElementById('showimg1-${CprecordVO.cp_No1}');
  		fr.onloadend = function(e) {
  		showimg.src = e.target.result;
  	};
  	fr.readAsDataURL(file);
  	showimg.style.display = 'block';
  	}
  	 var submenu=document.getElementById('oldimg1-${CprecordVO.cp_No1}'); 
  	  submenu.style.display="none"; 
  }
  function showImg2MEM1(thisimg) {
    	var file = thisimg.files[0];
    	if(window.FileReader) {
    		var fr = new FileReader();  
    		var showimg = document.getElementById('showimg2-${CprecordVO.cp_No1}');
    		fr.onloadend = function(e) {
    		showimg.src = e.target.result;
    	};
    	fr.readAsDataURL(file);
    	showimg.style.display = 'block';
    	}
    	 var submenu=document.getElementById('oldimg2-${CprecordVO.cp_No1}'); 
    	  submenu.style.display="none"; 
    }
  function showImg3MEM1(thisimg) {
    	var file = thisimg.files[0];
    	if(window.FileReader) {
    		var fr = new FileReader();  
    		var showimg = document.getElementById('showimg3-${CprecordVO.cp_No1}');
    		fr.onloadend = function(e) {
    		showimg.src = e.target.result;
    	};
    	fr.readAsDataURL(file);
    	showimg.style.display = 'block';
    	}
    	 var submenu=document.getElementById('oldimg3-${CprecordVO.cp_No1}'); 
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


<div class="modal fade " id="PIC${CprecordVO.cp_No2}"tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		
    <div style="width:200%;margin-left:5%" class="modal-dialog quick-view ">
        <div style="width:1560px;height:780px;margin:20px;" class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel"> �ӫ~�Ϥ�</h4>
            </div>
            <div class="modal-body text-center">
              <div style="margin: 0 auto;" class="modal-dialog">
				<div class="modal-content">
				  <div class="modal-body">
					<div class="media flex-wrap">
					   <div style="height:300px;width:300px; class="media-left px-0">
						  <img style="height:100%;width:100%;" id="oldimg1-${CprecordVO.cp_No2}"  class="media-object" src="makeimage.jsp?pic1=${CprecordVO.cp_No2}&No=1" alt="Image">
					   
					    
                          <img id="showimg1-${CprecordVO.cp_No2}" src="" style="display:none;height:100%;width:100%;"alt="profile-image" />  
                        </div>
						
						 <div style="height:300px;width:300px;margin:20px;" class="media-left px-0">
							  <img style="height:100%;width:100%;" id="oldimg2-${CprecordVO.cp_No2}"  class="media-object" src="makeimage.jsp?pic1=${CprecordVO.cp_No2}&No=2" alt="Image">
						 
						  
                               <img  id="showimg2-${CprecordVO.cp_No2}" src="" style="display:none;height:100%;width:100%;"alt="profile-image" />  
                          </div>
                               
						  <div style="height:300px;width:300px; class="media-left px-0">
							   <img  style="height:100%;width:100%;" id="oldimg3-${CprecordVO.cp_No2}"  class="media-object" src="makeimage.jsp?pic1=${CprecordVO.cp_No2}&No=3" alt="Image">
						  
						  
                               <img id="showimg3-${CprecordVO.cp_No2}" src="" style="display:none;height:100%;width:100%;"alt="profile-image" />  
                           </div>
						</div>	
							
							
							<c:if test="${mem_No eq CprecordVO.mem_No2}">
							<form class="form-horizontal" METHOD="post" ACTION="Cproduct.do" name="form1" enctype ="multipart/form-data">
						       <label  style="float:left;" for="pic1MEM2" class="btn btn-primary btn-pill" style="clear:both;" >                  
                                 �W�ǲĤ@�i�Ϥ�
                                      <input style="display:none;"  onchange="showImg1MEM2(this)"accept="image/gif, image/jpeg, image/png" name="pic1${CprecordVO.cp_No2}" id="pic1MEM2" style="opacity:0%" type="file"  class="btn btn-primary btn-block" role="button" >
                              </label>
                              <label  style="" for="pic2MEM2" class="btn btn-primary btn-pill">                  
                                 �W�ǲĤG�i�Ϥ�                        
                              <input style="display:none;" onchange="showImg2MEM2(this)"accept="image/gif, image/jpeg, image/png" name="pic2${CprecordVO.cp_No2}"id="pic2MEM2" style="opacity:0%" type="file"  class="btn btn-primary btn-block" role="button" >
                        
                               </label>
                               <label  style="float:right;" for="pic3MEM2" class="btn btn-primary btn-pill" >                  
                               �W�ǲĤT�i�Ϥ�
                        
                               <input style="display:none;" onchange="showImg3MEM2(this)"accept="image/gif, image/jpeg, image/png" name="pic3${CprecordVO.cp_No2}" id="pic3MEM2" style="opacity:0%" type="file"  class="btn btn-primary btn-block" role="button" >
                        
                                </label>
                                        								
								
			     
							 <div style="position: absolute; right:15px;" class="form-group row">
                                 <div style="top:15px" class=" col-md-12 ">
                                    <input type="hidden" name="action" value="updatepic">
                                    <input type="hidden" name="cp_No" value="${CprecordVO.cp_No2}">
                                    <input type="hidden" name="mem_No" value="${CprecordVO.mem_No1}">
                                    <button  type="submit" class="btn btn-primary float-right">�ק�Ϥ�</button>
                                 </div>
                             
                             </div>
                             </form>
                             </c:if>
                             
                             <script type="text/javascript">

function showImg1MEM2(thisimg) {
  	var file = thisimg.files[0];
  	if(window.FileReader) {
  		var fr = new FileReader();  
  		var showimg = document.getElementById('showimg1-${CprecordVO.cp_No2}');
  		fr.onloadend = function(e) {
  		showimg.src = e.target.result;
  	};
  	fr.readAsDataURL(file);
  	showimg.style.display = 'block';
  	}
  	 var submenu=document.getElementById('oldimg1-${CprecordVO.cp_No2}'); 
  	  submenu.style.display="none"; 
  }
  function showImg2MEM2(thisimg) {
    	var file = thisimg.files[0];
    	if(window.FileReader) {
    		var fr = new FileReader();  
    		var showimg = document.getElementById('showimg2-${CprecordVO.cp_No2}');
    		fr.onloadend = function(e) {
    		showimg.src = e.target.result;
    	};
    	fr.readAsDataURL(file);
    	showimg.style.display = 'block';
    	}
    	 var submenu=document.getElementById('oldimg2-${CprecordVO.cp_No2}'); 
    	  submenu.style.display="none"; 
    }
  function showImg3MEM2(thisimg) {
    	var file = thisimg.files[0];
    	if(window.FileReader) {
    		var fr = new FileReader();  
    		var showimg = document.getElementById('showimg3-${CprecordVO.cp_No2}');
    		fr.onloadend = function(e) {
    		showimg.src = e.target.result;
    	};
    	fr.readAsDataURL(file);
    	showimg.style.display = 'block';
    	}
    	 var submenu=document.getElementById('oldimg3-${CprecordVO.cp_No2}'); 
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


<div class="modal fade" id="A${CprecordVO.cp_No2}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
  aria-hidden="true">
  
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      
        <div class="modal-header px-4">
          <h5 class="modal-title" id="exampleModalCenterTitle">Create New Contact</h5>
        </div>
        <div class="modal-body px-4">

          <div class="form-group row mb-6">
              <div class="col-md-8 col-lg-9 col-xl-10 col-12">
                      <form class="form-horizontal" METHOD="post" ACTION="Cproduct.do" name="form10" enctype ="multipart/form-data" onsubmit="return chk2();">
                        <div class="form-group row">
                          <label for="" class="col-md-3 control-label">�ӫ~�W��</label>
                          <div class="col-md-7">
                            <input type="text" class="form-control" name="cpname" value="${CproductSvc.getOneCproduct(CprecordVO.getCp_No2()).cpname}" placeholder="�п�J20�r�H���ӫ~�W��">
                          </div>
                        </div>
                        <div class="form-group row">
          <jsp:useBean id="CpclassSvc" scope="page" class="com.cpclass.model.CpclassService" />

		       <label for=""class="col-md-3 control-label">�ӫ~���O</label>
		       <div class="col-md-9">
		       <select class="form-control" id="exampleFormControlSelect12" name="cpClass">
			   <c:forEach var="CpclassVO" items="${CpclassSvc.all}">
			   <option value="${CpclassVO.cpClass_No}" >${CpclassVO.cpClass}
			   
			   </c:forEach>
			   </select>
			   </div>
			   
		       
          </div>
                        <div class="form-group row">
                        <label for="" class="col-md-3 control-label">����a�I</label>
                        
            <div class="col-md-9 city-selector-${CprecordVO.cp_No2}"  >
            
            <button  type="button" onclick="showsub${CprecordVO.cp_No2}()" class="btn btn-primary btn-pill">������</button>
            
  
    <!-- ������� -->
    <select  name="cpmeetup1" class="county-${CprecordVO.cp_No2}"></select>
  
  
    <!-- �ϰ��� -->
    <select  name="cpmeetup2"   class="district-${CprecordVO.cp_No2}"></select>
    
    <script type="text/javascript">
    new TwCitySelector({
	    el: ".city-selector-${CprecordVO.cp_No2}",
	    elCounty: '.county-${CprecordVO.cp_No2}', // �b el �̬d�� element
	    elDistrict: '.district-${CprecordVO.cp_No2}', // �b el �̬d�� element
	   
	  });
    
    function showsub${CprecordVO.cp_No2}(){ 
  	  var submenu=document.getElementsByClassName("county-${CprecordVO.cp_No2}")[0]; 
  	  submenu.style.display="none"; 
  	  submenu=document.getElementsByClassName("district-${CprecordVO.cp_No2}")[0]; 
  	  submenu.style.display="none";
  	  
  	  } ;
    </script>
     
  </div>
  
            
          </div>
                        <div  class="form-group row" >
                          <label style="top:25px" for="" class="col-md-3 control-label">�ӫ~�ԭz</label>
                          <div style="top:25px" class="col-md-9">
                            <textarea style="width:600px;height:200px ;" name="cptext" class="form-control" id="exampleFormControlTextarea1" required rows="6" >${CproductSvc.getOneCproduct(CprecordVO.getCp_No2()).cptext}</textarea>
                          </div>
                        </div>
                       
                        <div class="form-group row">
                          <label style="top:25px;left:13px;" for="" class="col-md-3 control-label">���洫�ӫ~</label>
                          <div style="top:25px" class="col-md-9">
                            <input  type="text" class="form-control" name="emp_NO" id="" value="${CproductSvc.getOneCproduct(CprecordVO.getCp_No2()).emp_NO}"placeholder="���T���N�Q�j�M��åH���˥\�ണ�Ѽҽk���A��ĳ�ϥ�PS4�C���B�ְ��B�_�i�ڥd�P��²�u����">
                          </div>
                        </div>
                        
                        <div class="form-group row">
                          <div style="top:15px" class=" col-md-12 ">
                                             
                            
                          </div>
                        </div>
                         <div class="modal-footer px-4">
          <button type="button" class="btn btn-primary btn-pill" data-dismiss="modal">Cancel</button>
          <input type="hidden" name="action" value="updatemain">
          <input type="hidden" name="cp_No" value="${CprecordVO.cp_No2}">
          <input type="hidden" name="mem_No" value="${CprecordVO.mem_No1}">
          <input type="submit"  class="btn btn-primary btn-pill" value="�e�X�ק�">
           
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
	
<div class="modal fade" id="A${CprecordVO.cp_No1}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
  aria-hidden="true">
  
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      
        <div class="modal-header px-4">
          <h5 class="modal-title" id="exampleModalCenterTitle">Create New Contact</h5>
        </div>
        <div class="modal-body px-4">

          <div class="form-group row mb-6">
              <div class="col-md-8 col-lg-9 col-xl-10 col-12">
                      <form class="form-horizontal" METHOD="post" ACTION="Cproduct.do" name="form11" enctype ="multipart/form-data" onsubmit="return chk();">
                        <div class="form-group row">
                          <label for="" class="col-md-3 control-label">�ӫ~�W��</label>
                          <div class="col-md-7">
                            <input type="text" class="form-control" name="cpname" value="${CproductSvc.getOneCproduct(CprecordVO.getCp_No1()).cpname}" placeholder="�п�J20�r�H���ӫ~�W��">
                          </div>
                        </div>
                        <div class="form-group row">
         

		       <label for=""class="col-md-3 control-label">�ӫ~���O</label>
		       <div class="col-md-9">
		       <select class="form-control" id="exampleFormControlSelect12" name="cpClass">
			   <c:forEach var="CpclassVO" items="${CpclassSvc.all}">
			   <option value="${CpclassVO.cpClass_No}" >${CpclassVO.cpClass}
			   
			   </c:forEach>
			   </select>
			   </div>
			   
		       
          </div>
                        <div class="form-group row">
                        <label for="" class="col-md-3 control-label">����a�I</label>
                        
            <div class="col-md-9 city-selector-${CprecordVO.cp_No1}"  >
            
            <button  type="button" onclick="showsub${CprecordVO.cp_No1}()" class="btn btn-primary btn-pill">������</button>
            
  
    <!-- ������� -->
    <select  name="cpmeetup1" class="county-${CprecordVO.cp_No1}"></select>
  
  
    <!-- �ϰ��� -->
    <select  name="cpmeetup2"   class="district-${CprecordVO.cp_No1}"></select>
    
    <script type="text/javascript">
    new TwCitySelector({
	    el: ".city-selector-${CprecordVO.cp_No1}",
	    elCounty: '.county-${CprecordVO.cp_No1}', // �b el �̬d�� element
	    elDistrict: '.district-${CprecordVO.cp_No1}', // �b el �̬d�� element
	   
	  });
    
    function showsub${CprecordVO.cp_No1}(){ 
  	  var submenu=document.getElementsByClassName("county-${CprecordVO.cp_No1}")[0]; 
  	  submenu.style.display="none"; 
  	  submenu=document.getElementsByClassName("district-${CprecordVO.cp_No1}")[0]; 
  	  submenu.style.display="none";
  	  
  	  } ;
    </script>
     
  </div>
  
            
          </div>
                        <div  class="form-group row" >
                          <label style="top:25px" for="" class="col-md-3 control-label">�ӫ~�ԭz</label>
                          <div style="top:25px" class="col-md-9">
                            <textarea style="width:600px;height:200px ;" name="cptext" class="form-control" id="exampleFormControlTextarea1" required rows="6" >${CproductSvc.getOneCproduct(CprecordVO.getCp_No1()).cptext}</textarea>
                          </div>
                        </div>
                       
                        <div class="form-group row">
                          <label style="top:25px;left:13px;" for="" class="col-md-3 control-label">���洫�ӫ~</label>
                          <div style="top:25px" class="col-md-9">
                            <input  type="text" class="form-control" name="emp_NO" id="" value="${CproductSvc.getOneCproduct(CprecordVO.getCp_No1()).emp_NO}"placeholder="���T���N�Q�j�M��åH���˥\�ണ�Ѽҽk���A��ĳ�ϥ�PS4�C���B�ְ��B�_�i�ڥd�P��²�u����">
                          </div>
                        </div>
                        
                        <div class="form-group row">
                          <div style="top:15px" class=" col-md-12 ">
                                             
                            
                          </div>
                        </div>
                         <div class="modal-footer px-4">
          <button type="button" class="btn btn-primary btn-pill" data-dismiss="modal">Cancel</button>
          <input type="hidden" name="action" value="updatemain">
          <input type="hidden" name="cp_No" value="${CprecordVO.cp_No1}">
          <input type="hidden" name="mem_No" value="${CprecordVO.mem_No2}">
          <input type="submit"  class="btn btn-primary btn-pill" value="�e�X�ק�">
           
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
 
<div class="col-12">
                    <div class="panel panel-default">
                      <div class="panel-heading">
                        <h4 class="panel-title">�洫�n��</h4>
                      </div>
                      <div class="panel-body">
                        <div class="row">
                          <div class="col-md-4 col-12">
                            <address>
                              <a href="#">�p�����D�Ь��U��ȪA�M�u</a> <br>
                              <span>Phone: 02 2700 1234</span>
                            </address>
                          </div>
                          <div class="col-md-8 col-12">
                            <address>
                              <span>�˷R���|���z�n�A�ҷЪ�O1�����\Ū�H�U�洫�n���A�P�±z���\Ū: </span><br>
                              <p>1:�@���洫�H���洫�ǯd�s���ǡA�p�Y�o�ͪȯ����|�����D�N�H���B��T�@���P�w�з�</p>
                              <p>2:�ק�ӫ~������N���m�洫���A�A�ЦA���T�{�洫�ӫ~�L�~��A�T�{�洫</p>
                              <p>3:�����x�Ȱ����ĤT�襭�x���ѴC�X�洫�A�p�Y�o�ͪk�߰��D�����x�ȯണ�Ѱ��v�B�m�A�������O�v�q�Ь�����|02 2700 1234</p>
                            </address>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                </div>
              </div>
            </div>
          </div>

                 
      

      			<!-- FOOTER -->
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
			if(event.data==(mem_No+"���ӫ~")||event.data==null){
				
				Swal.fire({
					  title: '�ӫ~�w�ܧ�',
					  text: "���w���ӫ~�Э��s�T�{!",
					 
					  showCancelButton: false,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '�ڪ��D�F'
					}).then((result) => {
					  if (result.value) {
                     window.location.reload(); 
					  }
					})
				
			}
            if(event.data==(mem_No+"�T�w�ӫ~")){
				
				Swal.fire({
					  title: '���w�T�w',
					  text: "���P�N�洫�F!",
					 
					  showCancelButton: false,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '�ڪ��D�F'
					}).then((result) => {
					  if (result.value) {
                     window.location.reload(); 
					  }
					})
				
			}
            if(event.data==(mem_No+"�洫����")){
				
				Swal.fire({
					  title: '�������F�洫',
					  text: "�洫�w�פ�",
					 
					  showCancelButton: false,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '�ڪ��D�F'
					}).then((result) => {
					  if (result.value) {
                     window.location.reload(); 
					  }
					})
				
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
	
	function chk(){
	    if(document.form11.cpname.value==''){
	      
	    	Swal.fire(
				     
	  		      '�ӫ~�W�٥���'
	  		     
	  		    )
	      return false;
	    }
	    if(document.form11.emp_NO.value.length>30){
	        
	    	Swal.fire(
				     
	  		      '���ҹL���A��²�u�y�z'
	  		     
	  		    )
	      return false;
	    }
	    if(document.form11.cptext.value.length>200){
	        
	    	Swal.fire(
				     
	  		      '�ӫ~�ԭz�L��'
	  		     
	  		    )
	      return false;
	    }
	    if(document.form11.cpname.value.length>30){
	        
	    	Swal.fire(
				     
	  		      '�ӫ~�W�ٹL��'
	  		     
	  		    )
	      return false;
	    }
	    return true;
	  }
	
	function chk2(){
	    if(document.form10.cpname.value==''){
	      
	    	Swal.fire(
				     
	  		      '�ӫ~�W�٥���'
	  		     
	  		    )
	      return false;
	    }
	    if(document.form10.emp_NO.value.length>30){
	        
	    	Swal.fire(
				     
	  		      '���ҹL���A��²�u�y�z'
	  		     
	  		    )
	      return false;
	    }
	    if(document.form10.cptext.value.length>200){
	        
	    	Swal.fire(
				     
	  		      '�ӫ~�ԭz�L��'
	  		     
	  		    )
	      return false;
	    }
	    if(document.form10.cpname.value.length>30){
	        
	    	Swal.fire(
				     
	  		      '�ӫ~�W�ٹL��'
	  		     
	  		    )
	      return false;
	    }
	    return true;
	  }
</script>
	
	
</html>

