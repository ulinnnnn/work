<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bp.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>
<%@ page import="com.mem.model.*"%>
<%
 MemVO memVO = (MemVO) session.getAttribute("memVO");
%>
<%
 	BpService bpSvc = new BpService();
    List<BpVO> list = bpSvc.getmem(memVO.getMem_no());
    pageContext.setAttribute("list",list);
    
	BpService bpSvc2 = new BpService();
    List<BpVO> list2 = bpSvc.getmemsile(memVO.getMem_no());
    pageContext.setAttribute("list2",list2);
    
	BpService bpSvc3 = new BpService();
    List<BpVO> list3 = bpSvc.getmembuy(memVO.getMem_no());
    pageContext.setAttribute("list3",list3);
    
%>
<jsp:useBean id="bpclassSvc" scope="page" class="com.bpclass.model.BpclassService" />
<!DOCTYPE html> 
<html lang="zh_TW">
  <head>
    <!-- SITE TITTLE -->
    <meta charset="Big5">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>會員直購區</title>
    
    <!-- PLUGINS CSS STYLE -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
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
    <link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/color-option2.css" id="option_style">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/img/favicon.png">
	<style>

.stepsWrapper .innerWrapper {
    border: 3px solid #f0f0f0;
    display: block;
    padding: 0px 0px 0px !important;
    width: 100%;
}
.h5{
	margin-buttom:8px !important;
} 
.page-header {
    margin: 15px 0 15px 0;
    padding-bottom: 5px;
    border-bottom: 3px solid orange !important;
}
.joe .form-body .panel .panel-heading h3, .signUp .panel .panel-heading h3, .lostPassword .panel .panel-heading h3, .logIn .panel .panel-heading h3 {
  font-family:Microsoft JhengHei;
  font-weight:bold;
}
.singleProduct .media .media-body .tabArea .nav-tabs li a.nav-link:before {
    bottom: -1px;
    border-bottom: 2px solid orange;
}
div.try {
	font-family: 微軟正黑體;
    border: 3px double orange;
    width: 100%;
    height: 100%;
    background-color: white;
    margin-bottom: 15px;
    padding: 15px;
    font-size: 16px;
/*     font-weight: bold; */
    line-height: 25px;
    border-radius: 25px;
    color:black;
}
div.q3 {
    padding: 15px 0 0 240px;
}
div.q2 {
    padding: 15px 0 0 109px;
}
p.q4{
	font-family: 微軟正黑體;
	background-color: rgb(255 237 212 / 95%);
	color:black !important;
	font-size:18px !important;
	border-radius: 8px;
	padding-left: 10px;
	margin-bottom:0px !important;
}
span.q5{
	padding:0 0 0 40px;
}
div.respon{
	text-align: right;
    padding-right: 15px;
    }
h4{
    font-size: 16px;
    font-weight: 400;
}    
.singleProduct .media .media-body .tabArea .nav-tabs li a.nav-link.active {
    background-color: #FFB548 !important;
}

button{
width:150px;
border-radius: 15px !important;

}
.panel-heading{
    border-radius: 15px !important;
    font-size: 1.75rem;
    text-align: center;
    text-transform: capitalize;
    margin-bottom: 0;
    font-weight: 400;
    color: #ffffff;
    line-height: 60px;
	font-family: Microsoft JhengHei;
    font-weight: bold;
    box-sizing: border-box;
    border-radius: 0;
    padding: 0 15px;
    height: 60px;
}

.swal2-icon-content{
	font-size:75px !important;
}
	</style>
  </head>
 <body id="body" class="body-wrapper version1 up-scroll"   onload="connect();"  onunload="disconnect();">
<div class="main wrapper" style="overflow:visible;">
<div class="header clearfix">
<jsp:include page="/assets/topBar.jsp" flush="true"/>
</div>
</div>
<div>
    <div class="main-wrapper">
      <section class="mainContent clearfix" style="padding:0 0 0 0;   min-height: 700px ; margin-top: 15px">
        <div class="container">
          <div class="row singleProduct singleProductTab">
            <div class="col-12" style="padding:0 0 0 0">
              <div class="media mb-4">
                <div class="media-body">
                  <div class="tabArea">
                    <ul class="nav nav-tabs bar-tabs" >
                      <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#OurDetails" style="font-weight: 600;font-size:18px">我的商品</a></li>
                      <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#OurSizing" style="font-weight: 600;font-size:18px">已賣出商品</a></li>
                      <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#Reviews" style="font-weight: 600;font-size:18px">已得標商品</a></li>
                      <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#Rain" style="font-weight: 600;font-size:18px">我的問題</a></li>
                    </ul>
                    <div class="tab-content" style="min-height:550px">
                    
                    
                      <div id="OurDetails" class="tab-pane fade show active"> 
    		<div class="container">
            <div class="row">
              <div class="col-md-12" style="padding:0 0 0 0">
                <div class="innerWrapper clearfix stepsPage" style="padding: 0px 0px 0px !important">
                  <div class="page-header">
                    <h3 style="margin-bottom:0px">尚未賣出</h3>
                  </div>
                  <c:forEach var="bpVO" items="${list}">
                  
                  <h3 style="margin-bottom:0px">商品名稱:${bpVO.bp_head}</h3>
                  <div class="row shipping-info" style="padding:0 0 0 0">
                   <div class="col-4">
                     <h4 style="margin:8px"><a href="<%=request.getContextPath()%>/bp-front/TRY1.jsp?${bpVO.bp_no}" style="color:blue" target="_blank">商品編號:${bpVO.bp_no}</a></h4>
                     <h4 style="margin:8px">商品價格:${bpVO.bp_pri}</h4>
                     <h4 style="margin:8px">上架時間:<fmt:formatDate value="${bpVO.bp_upt}" pattern="yyyy-MM-dd EEE"/></h4>
                   </div>
                   <div class="col-4">
                     <h4 style="margin:8px">商品類別:${bpclassSvc.getonebpclass(bpVO.getBpcl_no()).bpcl_name}</h4>
                     <h4 style="margin:8px">商品狀態:${bpVO.bp_new}</h4>
                     <h4 style="margin:8px">下架時間:<fmt:formatDate value="${bpVO.bp_dot}" pattern="yyyy-MM-dd EEE"/></h4>
                   </div>
                    <div class="col-4">
                     <h4 style="margin:8px">運送方式:${bpVO.bp_del}</h4>
                     <h4 style="margin:8px;  font-weight:800 ;font-size:18px">交易狀態:${bpVO.bpst_no}</h4>
                     <h4 style="margin:8px 8px 4px 8px">
                     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/bp-front/BpServlet" style="margin-bottom: 0px;">
					     <input type="hidden" name="bp_no"  value="${bpVO.bp_no}">
					     <input type="hidden" name="action"	value="getOne_For_Update">
					     <button  style="margin-left:20px ;background-color:#FFB548 ; color:white"type="submit">商品內容修改</button>
					     </FORM>
					  </h4>
                    </div>
                  </div>
				<div class="page-header"></div>
				</c:forEach>
                </div>
              </div>
            </div>
          </div>
                      </div>

                      <div id="OurSizing" class="tab-pane fade">
                           		<div class="container">
            <div class="row">
              <div class="col-md-12" style="padding:0 0 0 0">
                <div class="innerWrapper clearfix stepsPage" style="padding: 0px 0px 0px !important">
                  <div class="page-header" id="sellout">
                    <h3 style="margin-bottom:0px">已賣出商品</h3>
                  </div>
                  <c:forEach var="bpVO2" items="${list2}">
                  
                  <h3 style="margin-bottom:0px">商品名稱:${bpVO2.bp_head}</h3>
                  <div class="row shipping-info" style="padding:0 0 0 0">
                   <div class="col-4">
                     <h4 style="margin:8px"><a  href="<%=request.getContextPath()%>/bp-front/TRY1.jsp?${bpVO2.bp_no}" style="color:blue" target="_blank">商品編號:${bpVO2.bp_no}</a>買家帳號:${bpVO2.buymem_no}</h4>
                  
                     <h4 style="margin:8px">商品價格:${bpVO2.bp_pri}</h4>
                     <jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
                     <h4 style="margin:8px" >送貨地址:${memSvc.memSelectByPk(bpVO2.buymem_no).mem_addr}</h4>
                   </div>
                   <div class="col-4">
                     <h4 style="margin:8px">商品類別:${bpclassSvc.getonebpclass(bpVO2.getBpcl_no()).bpcl_name}</h4>
                     <h4 style="margin:8px">商品狀態:${bpVO2.bp_new}</h4>
                   </div>
                    <div class="col-4">
                     <h4 style="margin:8px">運送方式:${bpVO2.bp_del}</h4>
                     <h4 style="margin:8px;font-weight:800;font-size:18px">交易狀態:${bpVO2.bpst_no}</h4>
                     <h4 style="margin:8px 8px 4px 8px" class="change">
                     
                     <c:choose>
					 <c:when test="${bpVO2.bpst_no =='已付款'}">
					 
                     	 
					     <input type="hidden" name="bp_no"  value="${bpVO2.bp_no}">
					     <input type="hidden" name="bpst_no" value="已出貨">
					     <input type="hidden" name="action" value="<%=request.getContextPath()%>/bp-front/BpServlet">
					     <input type="hidden" name="action"	value="update_status">
						 <input type="hidden" name="buymem_no" value="${bpVO2.buymem_no}">
					     <button style="margin-left:20px ; background-color:#e21c00; color:white"type="submit" >確 認 出 貨</button>
						 
					  </c:when>
					  <c:otherwise>
					  </c:otherwise>
					  </c:choose>
					  </h4>
                    </div>
                  </div>
				<div class="page-header"></div>
				</c:forEach>
                </div>
              </div>
            </div>
          </div>
                      </div>

                      <div id="Reviews" class="tab-pane fade">
 <div class="container">
            <div class="row">
              <div class="col-md-12" style="padding:0 0 0 0">
                <div class="innerWrapper clearfix stepsPage" style="padding: 0px 0px 0px !important">
                  <div class="page-header">
                    <h3 style="margin-bottom:0px">我購買的商品</h3>
                  </div>
                  <c:forEach var="bpVO" items="${list3}">
                  
                  <h3 style="margin-bottom:0px">商品名稱:${bpVO.bp_head}</h3>
                  <div class="row shipping-info" style="padding:0 0 0 0">
                   <div class="col-4">
                     <h4 style="margin:8px"><a  href="<%=request.getContextPath()%>/bp-front/TRY1.jsp?${bpVO.bp_no}" style="color:blue" target="_blank">商品編號:${bpVO.bp_no} </a>賣家帳號:${bpVO.mem_no}</h4>
                     <h4 style="margin:8px">商品價格:${bpVO.bp_pri}</h4>
                     <h4 style="margin:8px">上架時間:<fmt:formatDate value="${bpVO.bp_upt}" pattern="yyyy-MM-dd EEE"/></h4>
                   </div>
                   <div class="col-4">
                     <h4 style="margin:8px">商品類別:${bpclassSvc.getonebpclass(bpVO.getBpcl_no()).bpcl_name}</h4>
                     <h4 style="margin:8px">商品狀態:${bpVO.bp_new}</h4>

                   </div>
      
                    <div class="col-4">
                     <h4 style="margin:8px">運送方式:${bpVO.bp_del}</h4>
                     <h4 style="margin:8px; font-weight:800;font-size:18px" id="${bpVO.bp_no}">交易狀態:${bpVO.bpst_no}</h4>
                     <h4 style="margin:8px 8px 4px 8px" class="end">
                          
                       <c:choose>	
					   <c:when test="${bpVO.bpst_no =='已出貨'}">

					     <input type="hidden" name="bp_no"  value="${bpVO.bp_no}">
					     <input type="hidden" name="bpst_no" value="已完成">
					     <input type="hidden" name="action" value="<%=request.getContextPath()%>/bp-front/BpServlet">
					     <input type="hidden" name="action"	value="update_status">
					     <button style="margin-left:20px ; background-color:#e21c00; color:white" type="submit" >確 認 收 貨</button>

					    </c:when>
					    <c:otherwise>
					    </c:otherwise>
					</c:choose>
					  </h4>
                    </div>
                  </div>
				<div class="page-header"></div>
				</c:forEach>
                </div>
              </div>
            </div>
          </div>
         </div>
         
         
         
           <div id="Rain" class="tab-pane fade">
 <div class="container">
            <div class="row">
              <div class="col-md-12" style="padding:0 0 0 0">
                <div class="innerWrapper clearfix stepsPage" style="padding: 0px 0px 0px !important">
                  <div class="page-header">
                    <h3 style="margin-bottom:0px">我的問題</h3>
                  </div>
                             		<jsp:useBean id="bpmeSvc" scope="page" class="com.bpmessage.model.BpmeService" />
														<div class="view">
														<c:forEach var="bpmeVO"
																items="${bpmeSvc.findByqmem_no(memVO.mem_no)}">
																<div class="try">
																	<div class="q1"></div><span>發問商品:</span><span class="q5"><a  href="<%=request.getContextPath()%>/bp-front/TRY1.jsp?${bpmeVO.bp_no}" style="color:blue" target="_blank">${bpmeVO.bp_no}</a></span>
																	<div class="q2">內容:${bpmeVO.qbpme_text}</div>
																	<div class="q3"><strong style="font-size: 18px;font-weight:500;font-family:微軟正黑體;background: rgb(255 237 212 / 95%);margin-bottom:0px !important">賣家回答:${(bpmeVO.bpme_text == null)?"請耐心等待賣家回答":bpmeVO.bpme_text}</strong></div>
																</div>
														</c:forEach>
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
    </div>
</div>
<%@ include file="/assets/footer.jsp"%>

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
			$(".change>button").click(function(){
			console.log("案到");
			let data = {};
			let message = $(this).parent().children();
			let ppr = $(this).parent().prev();
			
			data.action = message[3].value;
			console.log(data.action);
			url = message[2].value;
			console.log(url);
			data.bpst_no = message[1].value;
			console.log(data.bpst_no);
			data.bp_no = message[0].value;
			console.log(data.bp_no);
			
			
			data.buymem_no = message[4].value;
			console.log(data.buymem_no);
			
			
			$(this).hide();		
			ppr.empty();
			ppr.text("商品狀態:"+data.bpst_no);
			Swal.fire({
				  position: 'center',
				  icon: 'success',
				  title: '更改成功',
				  showConfirmButton: false,
				  timer: 1500
				});
			
				$.ajax({
					url:url,
					type:"POST",
					data:data,
					success:function(){
						Swal.fire({
						  position: 'center',
						  icon: 'success',
						  title: '更改成功',
						  showConfirmButton: false,
						  timer: 1500
						});
					}
				});

				var jsonObj = {
					
						"type" : "test",
						"sender" :self,
						"receiver" :data.buymem_no,
						"message" :'系統資訊!\n商品編號:'+data.bp_no+'已經出貨了!!',
						"id":data.bp_no
					};	
				webSocket1.send(JSON.stringify(jsonObj));
				
				
				
			});
			
			
			$(".end>button").click(function(){
				
				let data = {};
				let message = $(this).parent().children();
				let ppp = $(this).parent().prev();			

				data.action = message[3].value;
				url = message[2].value;
				data.bpst_no = message[1].value;
				data.bp_no = message[0].value;
				
				$(this).hide();
				ppp.empty();
				ppp.text("商品狀態:"+data.bpst_no);

				
					$.ajax({
						url: url,
						type:"POST",
						data:data,
						success:function(){
							Swal.fire({
								  position: 'center',
								  icon: 'success',
								  title: '更改成功',
								  showConfirmButton: false,
								  timer: 1500
								});
						}
					});

				});

		});
		</script>
		 
		<%@ include file="/bp-front/chat.jsp" %>
		<jsp:include page="/assets/memChat3.jsp" flush="true"/>
	</body>
</html>