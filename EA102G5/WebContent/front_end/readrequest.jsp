<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.CPRECORD.model.*"%>
<%@ page  import=" java.util.stream.Collectors" %>
<%@ page import="com.mem.model.*"%>
<%@ page import="java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
<%
    CprecordService  CprecordSvc = new  CprecordService();
session.setAttribute("CprecordVO", null);
MemVO memVO=(MemVO)session.getAttribute("memVO");
String mem_No=memVO.getMem_no();
pageContext.setAttribute("mem_No", mem_No);
    List< CprecordVO> fillist =  CprecordSvc.findCprecordByMEM1(mem_No);
    List<CprecordVO> list1 = fillist.stream() .filter(o -> o.getCprstate().equals("�洫�ӽФ�")||o.getCprstate().equals("�����洫")||o.getCprstate().equals("�洫����")||o.getCprstate().equals("�洫��")).collect(Collectors.toList());
    pageContext.setAttribute("list1",list1);
    List< CprecordVO> fillist2 =  CprecordSvc.findCprecordByMEM2(mem_No);
    List<CprecordVO> list2 = fillist2.stream() .filter(o -> o.getCprstate().equals("�洫�ӽФ�")).collect(Collectors.toList());
    pageContext.setAttribute("list2",list2);
    session.setAttribute("location", request.getServletPath());
%>
  <head>
<script src="https://cdn.jsdelivr.net/npm/tw-city-selector@2.1.1/dist/tw-city-selector.min.js" integrity="sha256-Iz/pF94D+raqeqXJDoOetn9L0yBFI7ogMMrhT6RzmFw=" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    
    
     
    <jsp:useBean id="CpclassSvc" scope="page" class="com.cpclass.model.CpclassService" />
    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Account Dashboard - Ecommerce Bootstrap Template</title>

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
               <a href="/EA102G5/front_end/readrequest.jsp" class="btn btn-default active"><i class="fa fa-th" aria-hidden="true"></i>�洫�ӽ�</a>
                <a href="/EA102G5/front_end/addchange.jsp" class="btn btn-default"><i class="fa fa-user" aria-hidden="true"></i>�s�W�洫�ӫ~</a>
                <a href="/EA102G5/front_end/readchange.jsp" class="btn btn-default"><i class="fa fa-map-marker" aria-hidden="true"></i>�ڪ��ӫ~</a>
                <a href="/EA102G5/front_end/readrecord.jsp" class="btn btn-default"><i class="fa fa-list" aria-hidden="true"></i>�洫����</a>
                <a href="/EA102G5/front_end/readwish.jsp" class="btn btn-default"><i class="fa fa-gift" aria-hidden="true"></i>Wishlist</a>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div class="innerWrapper">
                <div id="show" class="alert alert-warning alert-dismissible fade " role="alert">
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">��</span>
                  </button>
                  �A�n! �A���s���洫�ШD
                </div>
                <h3>Wellcome <span>�ϥΪ̦W��</span></h3>
                <p>�A�i�H�b�o�̭ק�A���洫�ШD�]���˵��L�H���e���洫�ШD�A�ШD�O�d3�ѫ�N�R��</p>
               
                <div class="orderBox">
                  <h4>�A���洫�ӽ�</h4>
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>�A���ӫ~</th>
                          <th>���ӫ~</th>
                          <th>�洫���A</th>
                          <th>���|���s��</th>
                          <th >���X�ШD�ɶ�</th>
                          <th></th>
                        </tr>
                        
                      </thead>
                      <tbody>
                      <jsp:useBean id="CproductSvc" scope="page" class="com.cproduct.model.CproductService" />
                      <c:forEach var="CprecordVO" items="${list1}">
                        <tr>
                        
                          <td><c:if test="${CprecordVO.cprstate eq '�����洫' || CprecordVO.cprstate eq '�洫����'}">
                          <input type="hidden" name="cp_No"  value="${CprecordVO.getCp_No1()}">
			     			     <input type="hidden" name="cpstate"  value="�w�U�[">
			     			     <input type="hidden" name="cpr_No"  value="${CprecordVO.getCpr_No()}">
			     			     <input type="hidden" name="cprstate"  value="����">
                            <button  style=" position: absolute;left: 5px;"  type="button" class="close clean" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    </c:if>
                                     
                            <a  style="color:rgb(71, 186, 193);" href="getoneCSS.jsp?${CprecordVO.getCp_No1()}">${CproductSvc.getOneCproduct(CprecordVO.getCp_No1()).cpname}</a>
                            </td>
                          <td><a  style="color:rgb(71, 186, 193)" href="getoneCSS.jsp?${CprecordVO.getCp_No2()}">${CproductSvc.getOneCproduct(CprecordVO.getCp_No2()).cpname}</a></td>
                          <td style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">${CprecordVO.getCprstate()}</td>
                          <td>${CprecordVO.mem_No2}</td>
                          <td><fmt:formatDate value="${CprecordVO.cpc_time}" pattern="yyyy/MM/dd hh:mm:ss" /></td>
                          <td>
                          
                            <div class="btn-group  " role="group">
                               <c:if test="${CprecordVO.cprstate eq '�洫�ӽФ�'}">
                              <button type="button"  class="btn btn-info btn-rounded"data-toggle="modal" data-target="#A${CprecordVO.cp_No1}"><i class="fa fa-pen" aria-hidden="true"></i></button>
                           
                              
                                  
			     			     <input type="hidden" name="cp_No"  value="${CprecordVO.getCp_No1()}">
			     			     <input type="hidden" name="cpstate"  value="�w�U�[">
			     			     <input type="hidden" name="cpr_No"  value="${CprecordVO.getCpr_No()}">
			     			     <input type="hidden" name="cprstate"  value="�����洫">
			     			     <input type="hidden" name="action" value="updatestate">
			     			    
                                <button style="background-color:#45dce6;"  type="submit"class="btn btn-info btn-rounded  updatestate"><i class="fa fa-times" aria-hidden="true"></i></button>
                                </c:if>
                                <c:if test="${CprecordVO.cprstate eq ('�洫��')}">
                               
                                <a style="left:20px;background-color: rgb(255 255 255)" href="changeorder.jsp?${CprecordVO.cpr_No}" class="btn btn-default"><button  class="btn btn-info btn-rounded">�e���洫</button></a>
                                

                         </c:if>      
                            </div>
                          </td>
                         
                        </tr>
                         </c:forEach>
                    </table>
                    
                  </div>
                </div>
                <div class="orderBox">
                  <h4>�A���쪺�洫�ӽ�</h4>
                  <div class="table-responsive">
                    <table style="border-collapse: collapse;
   	width: 1070px; 	
   	word-wrap: break-word;
   	table-layout: fixed;" class="table">
                      <thead>
                        <tr>
                          <th>�A���ӫ~</th>
                          <th>���ӫ~</th>
                          <th >�洫�T��</th>
                          <th>���|���s��</th>
                          <th >���X�ШD�ɶ�</th>
                          <th></th>
                        </tr>
                        
                      </thead>
                      <tbody>
                      <jsp:useBean id="CproductSvc2" scope="page" class="com.cproduct.model.CproductService" />
                      <c:set var="user" value="${list2}"/>
                      <c:forEach var="CprecordVO" items="${list2}">
                      
                        <tr>
                        
                          <td class="td"><a  style="color:rgb(71, 186, 193)" href="getoneCSS.jsp?${CprecordVO.getCp_No2()}">${CproductSvc2.getOneCproduct(CprecordVO.getCp_No2()).cpname}</a></td>
                          <td class="td"style="width:150px"><a  style="color:rgb(71, 186, 193)" href="getoneCSS.jsp?${CprecordVO.getCp_No1()}">${CproductSvc2.getOneCproduct(CprecordVO.getCp_No1()).cpname}</a></td>
                          <td  class="td"style="overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">${CproductSvc2.getOneCproduct(CprecordVO.getCp_No1()).cptext}</td>
                          <td>${CprecordVO.mem_No1}</td>
                          <td><fmt:formatDate value="${CprecordVO.cpc_time}" pattern="yyyy/MM/dd hh:mm:ss" /></td>
                          <td>
                          <div style="width:180px;" class="btn-group  refusestate" role="group">
                             
                           
                              
                                 <a style="float:left;"  class="btn btn-sm btn-secondary-outlined  refuseother">�P�N�洫</a>
			     			     <input id="have" type="hidden" name="cp_No"  value="${CprecordVO.getCp_No1()}">
			     			     <input type="hidden" name="cpstate"  value="�w�U�[">
			     			     <input type="hidden" name="cpr_No"  value="${CprecordVO.getCpr_No()}">
			     			     <input type="hidden" name="cprstate"  value="�洫����">
			     			     <input type="hidden" name="cpr_No"  value="${CprecordVO.getCp_No2()}">
			     			     <input type="hidden" name="action" value="updatestate">			     			    
                                <button style="float:right;position: absolute;right:20px;" type="submit"class="btn btn-sm btn-secondary-outlined"><i class="fa fa-times" aria-hidden="true"></i></button>    
                            </div>                          
                        </td>

                        </tr>
                         </c:forEach>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>






<c:forEach var="CprecordVO" items="${list1}">
<div class="modal fade" id="A${CprecordVO.cp_No1}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
  aria-hidden="true">
  
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      
        <div class="modal-header px-4">
          <h5 class="modal-title" id="exampleModalCenterTitle">�ק�ШD</h5>
        </div>
        <div class="modal-body px-4">

          <div class="form-group row mb-6">
              <div class="col-md-8 col-lg-9 col-xl-10 col-12">
                      <form class="form-horizontal" METHOD="post" ACTION="Cproduct.do" name="form1" enctype ="multipart/form-data" onsubmit="return chk${CprecordVO.cp_No1}()">
                        <div class="form-group row">
                          <label  for="" class="col-md-3 control-label">�ӫ~�W��</label>
                          <div class="col-md-7">
                            <input id="ch-${CprecordVO.cp_No1}" type="text" class="form-control" name="cpname" value="${CproductSvc.getOneCproduct(CprecordVO.getCp_No1()).cpname}" placeholder="�п�J20�r�H���ӫ~�W��">
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
     <script>
function chk${CprecordVO.cp_No1}(){
	 if(document.getElementById("ch-${CprecordVO.cp_No1}").value==''){
	    	Swal.fire(
				     
	  		      '�ӫ~�W�٥���'
	  		     
	  		    )
	      return false;
	    }
	 if(document.getElementById("ch-${CprecordVO.cp_No1}").value.length>30){
	        
	    	Swal.fire(
				     
	    			'�ӫ~�W�ٹL��' 
	  		     
	  		    )
	      return false;
	    }
	    if(document.getElementById("ct-${CprecordVO.cp_No1}").value.length>200){
	        
	    	Swal.fire(
				     
	  		      '�ӫ~�ԭz�L��'
	  		     
	  		    )
	      return false;
	    }
	    if(document.getElementById("ce-${CprecordVO.cp_No1}").value.length>30){
	        
	    	Swal.fire(
				     
	  		      '���ҹL���A��²�u�y�z'
	  		     
	  		    )
	      return false;
	    }   
	 
    return true;
  }

</script>
  </div>
  
            
          </div>  
                     
                        <div  class="form-group row" >
                          <label style="top:25px" for="" class="col-md-3 control-label">�ӫ~�ԭz</label>
                          <div style="top:25px" class="col-md-9">
                            <textarea id="ct-${CprecordVO.cp_No1}" style="width:600px;height:200px ;" name="cptext" class="form-control" id="exampleFormControlTextarea1" required rows="6" >${CproductSvc.getOneCproduct(CprecordVO.getCp_No1()).cptext}</textarea>
                          </div>
                        </div>
                       
                        <div class="form-group row">
                          <label id="ce-${CproductVO.cp_No}" style="top:25px;left:13px;" for="" class="col-md-3 control-label">���洫�ӫ~</label>
                          <div style="top:25px" class="col-md-9">
                            <input  type="text" class="form-control" name="emp_NO" id="ce-${CprecordVO.cp_No1}" value="${CproductSvc.getOneCproduct(CprecordVO.getCp_No1()).emp_NO}"placeholder="���T���N�Q�j�M��åH���˥\�ണ�Ѽҽk���A��ĳ�ϥ�PS4�C���B�ְ��B�_�i�ڥd�P��²�u����">
                          </div>
                        </div>
                        
                        <div class="form-group row">
                          <div style="top:15px" class=" col-md-12 ">
                                             
                            
                          </div>
                        </div>
                         <div class="modal-footer px-4">
          <button type="button" class="btn btn-primary btn-pill" data-dismiss="modal">Cancel</button>
          <input type="hidden" name="action" value="updatemain">
          <input  type="hidden" name="cp_No" value="${CprecordVO.cp_No1}">
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
</c:forEach>





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
	
	
	
	<script type="text/javascript">
	
	
	$(document).ready(function(){
		var mem_No=$("#mem_No").val();
		console.log(mem_No);
		console.log($("#have"));
		if($("#have").length>0)
	   $("#show").addClass("show");
	});
	$(document).ready(function(){			
		$(".updatestate").click(function(){
			console.log('reigjreigjoireg');
			Swal.fire({
				  title: 'Are you sure?',
				  text: "�A�T�w�n�������洫?",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '�O�A�Ш���!'
				}).then((result) => {
				  if (result.value) {
				    Swal.fire(
				     
				      '���ШD�w�����A�i�I�索��X�R�������άO�T�ѫ�t�Φ۰ʧR��',
				      'success'
				    )
		let data = {};
		let message = $(this).parent().children();
		let ppr = $(this).parent().parent().prev().prev().prev();
		
		url = 'Cproduct.do';
		data.action = "updatestate";
		console.log()
		data.cp_No = message[1].value;
		data.cpr_No = message[3].value;
		data.cpstate = message[2].value;
		data.cprstate = message[4].value;
		
		$(this).hide();
		
		ppr.empty();
		ppr.text("�����洫");
  
	$.ajax({
		url :url,
		type :"POST" ,
		data :data , 
		success : function(e) {	
		}
	});
				  }})
	})
	})	
 
$(document).ready(function(){			
		$(".refusestate>button").click(function(){
			console.log('reigjreigjoireg');
		let data = {};
		let message = $(this).parent().children();
		
		url = 'Cproduct.do';
		data.action = "updatestate";
		
		data.cp_No = message[1].value;
		data.cpr_No = message[3].value;
		data.cpstate = message[2].value;
		data.cprstate = message[4].value;
		
		$(this).parent().parent().parent().hide();
		
		
  
	$.ajax({
		url :url,
		type :"POST" ,
		data :data , 
		success : function(e) {	
			
		}
	});
	});
	})	

	
	$(document).ready(function(){			
	$(".clean").click(function(){
		console.log('reigjreigjoireg');
		let data = {};
		let message = $(this).parent().children();
		
		url = 'Cproduct.do';
		data.action = "updatestate";
		
		data.cp_No = message[0].value;
		data.cpr_No = message[2].value;
		data.cpstate = message[1].value;
		data.cprstate = message[3].value;
		
		$(this).parent().parent().hide();
	
	

$.ajax({
	url :url,
	type :"POST" ,
	data :data , 
	success : function(e) {	
	}
});
});
})	
	
	
	$(document).ready(function(){			
	$(".refuseother").click(function(){
		console.log('reigjreigjoireg');
		let data = {};
		let message = $(this).parent().children();
		
		url = 'Cproduct.do';
		data.action = "refuseother";
		
		data.cp_No = message[5].value;	
		data.cpstate = message[4].value;
		data.cpr_No = message[3].value;
		
		
	
	

$.ajax({
	url :url,
	type :"POST" ,
	data :data , 
	success : function(e) {	
		console.log('111111111');
		window.location.href="changeorder.jsp?"+data.cpr_No;
	}
});
});
})
	$(function () {
        $(".td").on("click",function() {
        	
            if (this.offsetWidth < this.scrollWidth) {
                var that = this;
                var text = $(this).text();
                Swal.fire(text);
            }
        });
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
				
				 
				Swal.fire('�A���@�ӷs���洫�ӽ�')
				
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
