<%@ page language="java" contentType="text/html; charset=BIG5"
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
  <jsp:useBean id="CproductSvc" scope="page" class="com.cproduct.model.CproductService" />
<%


CprecordVO CprecordVO=(CprecordVO)session.getAttribute("CprecordVO");


MemVO memVO=(MemVO)session.getAttribute("memVO");
String mem_No="1";
if(memVO!=null){
mem_No=memVO.getMem_no();
}
pageContext.setAttribute("mem_No", mem_No);







%>



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

  <body id="body" onload="connect();" onunload="disconnect();" class="body-wrapper version1 up-scroll">

    <div style="overflow:visible;">
        <jsp:include page="/assets/topBar.jsp" flush="true"/>
</div>
      <!-- MAIN CONTENT SECTION -->
      <section class="mainContent clearfix userProfile">
       <input type="hidden" id="mem_No"  value="${mem_No}">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <div class="btn-group" role="group" aria-label="...">
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

                  <div class="col-4 progress-wizard-step complete fullBar">
                    <div class="text-center progress-wizard-stepnum">�@�H�T�{�洫</div>
                    <div class="progress"><div class="progress-bar"></div></div>
                    <a  class="progress-wizard-dot"></a>
                  </div>

                  <div class="col-4 progress-wizard-step complete fullBar">
                    <div class="text-center progress-wizard-stepnum">����T�w�洫</div>
                    <div class="progress"><div class="progress-bar"></div></div>
                    <a  class="progress-wizard-dot"></a>
                  </div>
                  <c:if test="${CprecordVO.cprstate eq '�洫����' }">
                  <div class="col-4 progress-wizard-step active">
                    <div class="text-center progress-wizard-stepnum">�洫����</div>
                    <div class="progress"><div class="progress-bar"></div></div>
                    <a  class="progress-wizard-dot"></a>
                  </div>
                  </c:if>
                  <c:if test="${CprecordVO.cprstate eq '�洫����' }">
                     <div class="col-4 progress-wizard-step complete fullBar">
                    <div class="text-center progress-wizard-stepnum">�洫����</div>
                    <div class="progress"><div class="progress-bar"></div></div>
                    <a  class="progress-wizard-dot"></a>
                    </div>
                  </c:if>
                
                <div class="orderBox">
                  <h2>Order #${CprecordVO.cpr_No}</h2>
                </div>
             <div class="display-single_element">
		<p>Example: </p>

		<div class="card-deck">
			<div class="card">
				<div class="card_img">
					<a >
						<img class="card-img-top"  data-toggle="modal" data-target="#PIC${CprecordVO.cp_No1}" src="makeimage.jsp?pic1=${CprecordVO.cp_No1}&No=1"  alt="card img">
					</a>
				</div>
				<div class="card-block">
			        <h3 class="card-title">${CproductSvc.getOneCproduct(CprecordVO.getCp_No1()).cpname}</h3>
					<span>${CprecordVO.mem_No1}</span>
					<p class="card-text">${CproductSvc.getOneCproduct(CprecordVO.getCp_No1()).cpmeetup}</p>
					<p class="card-text">${CproductSvc.getOneCproduct(CprecordVO.getCp_No1()).cptext}</p>
					
				</div>
				
			</div>
			<div class="card">
			<div class="card">
			     <c:if test="${CprecordVO.cprstate eq '�洫����' }">
				<img class="card-img-top" src="../assets/img/changefinished.jpg">
				</c:if>
				<c:if test="${CprecordVO.cprstate eq '�洫����' }">
				<img class="card-img-top" src="image/stopchange.png">
				</c:if>
			</div>
				
			</div>
			<div class="card">
				<div class="card_img">
					<a >
						<img class="card-img-top"  data-toggle="modal" data-target="#PIC${CprecordVO.cp_No2}" src="makeimage.jsp?pic1=${CprecordVO.cp_No2}&No=1"  alt="card img">
					</a>
				</div>
				<div class="card-block">
				
                      
                       
                          
					<h3 class="card-title">${CproductSvc.getOneCproduct(CprecordVO.getCp_No2()).cpname}</h3>
					<span>${CprecordVO.mem_No2}</span>
					<p class="card-text">${CproductSvc.getOneCproduct(CprecordVO.getCp_No2()).cpmeetup}</p>
					<p class="card-text">${CproductSvc.getOneCproduct(CprecordVO.getCp_No2()).cptext}</p>
					
			    
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
                              <a class="addreport" href="#">�p���洫���D���I���^���ڭ̱N���M�H�M�z�pô�νЬ��U��ȪA�M�u</a> <br>
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
	</div>
	
	</section>
	
<div class="modal fade " id="PIC${CprecordVO.cp_No1}"tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

		
    <div style="width:200%;margin-left:5%" class="modal-dialog quick-view ">
        <div style="width:1560px;height:780px;margin:20px;" class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">�ӫ~�Ϥ�</h4>
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
                <h4 class="modal-title" id="myModalLabel">�ӫ~�Ϥ�</h4>
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
<script type="text/javascript">

	$(document).ready(function(){			
		$(".addreport").click(function(){
			console.log('reigjreigjoireg');
			Swal.fire({
				  title: 'Are you sure?',
				  text: "�A�T�w���L�k�ѨM�����D�ݭn��U��?",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '�O�A�����U��!'
				}).then((result) => {
				  if (result.value) {
				    Swal.fire(
				     
				      '�ܧֱN���M�H���z�A��',
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
	})
	})
	</script>
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

