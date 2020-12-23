<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page  import=" java.util.stream.Collectors" %>
<%@ page import="java.util.*"%>
<%@ page import="com.cproduct.model.*"%>
<%@ page import="com.CPREPORT.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>
<%
    CpreportService CpreportSvc = new CpreportService();
    List<CpreportVO> fillist1 =CpreportSvc. getAll();
    List<CpreportVO> list1 = fillist1.stream() .filter(o -> o.getCprp_State().equals("待處理")|| o.getCprp_State().equals("檢舉")).collect(Collectors.toList());
    
    pageContext.setAttribute("list1",list1);
%>
<%
    CproductService CproductSvc = new CproductService();
    List<CproductVO> fillist2 = CproductSvc.getAll();
    List<CproductVO> list2 = fillist2.stream() .filter(o -> o.getCpState().equals("待上架")).collect(Collectors.toList());
    pageContext.setAttribute("list2",list2);
%>

<!DOCTYPE html>

<html lang="zh_TW">
  <head>

     <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Change - BIGBAG Store</title>

    <!-- PLUGINS CSS STYLE -->
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


    <!-- CUSTOM CSS -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/default.css" id="option_style">

    <!-- Icons -->
    <link rel="shortcut icon" href="assets/img/favicon.png">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->



<style>

tr>td {
	text-align: left !important;
}

div.color {
	color: blue !important;
}

#cpNo a {
	color: blue ;
}

.cartListInner .table-responsive .table tbody tr td, .orderBox .table-responsive .table tbody tr td {
    vertical-align: middle;
    text-transform: uppercase;
    font-weight: 700;
    border-bottom: 0px solid #f0f0f0;
    border-top: none;
    position: relative;
}

tr{
border:solid 2px black !important;
}

/* Leisure-modify 2020/08/18 */
h1, h2, h3, h4, h5,
* {
    font-family: 微軟正黑體;
}
table * {
    font-size: 16px;
}

select {
    margin-right: 10px;
    margin-bottom: 10px;
}

button {
    width: 100%;
    padding: 4px 5px;
    border-radius: 5px;   
}

.table-responsive{
	margin: 20px auto 20px auto;
}

.table-responsive select {
    padding: 0 5px;
}

.table-responsive select, .table-responsive [type="submit"] {
    height: 25px;
}
.table-responsive [type="submit"] {
    width: 50px;
}
@media (min-width: 1200px) {
  body .container {
    width: 1336px !important;
  }
}
th {
    background-color: #FFB548;
    color: white;
}

</style>

</head>

  <body id="body">
  <jsp:include page="../assets/headerBack.jsp"></jsp:include>
 
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

        <div class="container">
          <div class="row">
            <div class="col-md-12" style="min-height:750px">
              <div class="innerWrapper">
                <div class="orderBox">
                  <div class="table-responsive">
                  	<h3>上下架處理</h3>
                    <%@ include file="page1.file" %> 
                    <table class="table" >
                      <thead>
                        <tr>
                          <th>商品編號</th>
                          <th>會員編號</th>
                          <th>創建日期</th>
					      <th>刊登訊息</th>
		                  <th>商品狀態</th>
						  <th>上架</th>
						  <th>下架</th>
                        </tr>
                      </thead>
					<c:forEach var="CproductVO" items="${list2}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                      <tbody >
                        <tr>
                          <td id="cpNo"><a  data-toggle="modal" data-target="#PIC${CproductVO.cp_No}" >${CproductVO.cp_No}</a></td>
                          <td>${CproductVO.mem_No}</td>
                          <td><fmt:formatDate value="${CproductVO.cpontime}" pattern="yyyy-MM-dd EEE"/></td>
                          <td>${CproductVO.cptext}</td>
                          <td>${CproductVO.cpState}</td>
                   		  <td class="up">
                   		   <input type="hidden" name="bp_no"  value="${CproductVO.cp_No}">
						     <input type="hidden" name="action" value="<%=request.getContextPath()%>/bp-front/BpServlet">
						     <input type="hidden" name="action"	value="upload">
						     <button>上架</button>
                   		  </td>	
                          <td class="down">
		                 <input type="hidden" name="bp_no"  value="${CproductVO.cp_No}">
					     <input type="hidden" name="action" value="<%=request.getContextPath()%>/bp-front/BpServlet">
					     <input type="hidden" name="action"	value="delete">
					     <button>下架</button>  
                          </td>
                        </tr>
                      </tbody>
                      </c:forEach>  
                    </table>
					<%@ include file="page2.file" %> 
					
					<h3>客服處理</h3>
                   
					<table class="table" id="abc">
						<tr style="padding: 12px 6px 20px 6px">
							<th style="padding: 12px 6px 20px 6px">訂單編號</th>
							<th style="padding: 12px 6px 20px 6px">相關商品</th>
							<th style="padding: 12px 6px 20px 6px">提出會員</th>
							<th style="padding: 12px 6px 20px 6px">問題類別</th>
							<th style="padding: 12px 6px 20px 6px">請求時間</th>
							<th style="padding: 12px 6px 20px 6px">請求狀態</th>
							<th style="padding: 12px 6px 20px 6px">處理狀態</th>
						</tr>
						<c:forEach var="bprpVO" items="${list1}">
			<tr>
	
			<td style="padding: 12px 6px 20px 6px ; color:black">${bprpVO.cprp_No}</td>
			
			<td style="color:black ; padding: 12px 6px 20px 6px"><a href="<%=request.getContextPath()%>/bp-front/TRY1.jsp?${bprpVO.cp_No}">${bprpVO.cp_No}</a></td>
			<td style="padding: 12px 6px 20px 6px">${bprpVO.mem_No}</td>			
			<td style="padding: 12px 6px 20px 6px">${bprpVO.cprp_State}</td>
			<td style="padding: 12px 6px 20px 6px"><fmt:formatDate value="${bprpVO.cprp_time}" pattern="yyyy-MM-dd EEE"/></td>
			<td  class="qq" style=" padding: 12px 6px 20px 6px">
			
		 		<select size="1" name="bprp_status">
			 		<option value="已完成" >已完成</option>
			 		<option value="問題未解決" >待處理</option>
			 	</select>
			 	<input type="hidden" name="bprp_no" value="${bprpVO.cprp_No}">
				<input type="hidden" name="action" value="<%=request.getContextPath()%>/bp-front/BpServlet">
				<input type="hidden" name="action"value="updatereport">
			</td>
			<td>	
			    <button id="go" type="submit" value="修改" style=" height:auto">修改</button>
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
    <c:forEach var="CproductVO" items="${list2}">
	
<div class="modal fade" id="PIC${CproductVO.cp_No}"tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	
<div style="width:200%;margin-left:25%" class="modal-dialog quick-view ">
    <div style="width:200%" class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                &times;
            </button>
            <h4 class="modal-title" id="myModalLabel"> 修改圖片</h4>
        </div>
        <div class="modal-body text-center">
         
            
            	
               <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					
					<div class="media flex-wrap">
						<div class="media-left px-0">
						  
							<img id="oldimg1-${CproductVO.cp_No}"  class="media-object" src="/EA102G5/front_end/makeimage.jsp?pic1=${CproductVO.cp_No}&No=1" alt="Image">
						</div>
						<div class="thumbnail" style="top:600px;width:300px;">
                  <img id="showimg1-${CproductVO.cp_No}" src="" style="display:none;top:20px;"alt="profile-image" />  
                 
                 
                </div>
						<div class="media-body">
							<div class="media-left px-0">
						  
							    <img id="oldimg2-${CproductVO.cp_No}"  class="media-object" src="/EA102G5/front_end/makeimage.jsp?pic1=${CproductVO.cp_No}&No=2" alt="Image">
						    </div>
							<div class="thumbnail" style="top:600px;width:300px;">
                                    <img id="showimg2-${CproductVO.cp_No}" src="" style="display:none;top:20px;"alt="profile-image" />  

                           </div>
                           
						<div class="media-left px-0">
						  
							<img id="oldimg3-${CproductVO.cp_No}"  class="media-object" src="/EA102G5/front_end/makeimage.jsp?pic1=${CproductVO.cp_No}&No=3" alt="Image">
						</div>
							<div class="thumbnail" style="top:600px;width:300px;">
                                  <img id="showimg3-${CproductVO.cp_No}" src="" style="display:none;top:20px;"alt="profile-image" />  
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
    </c:forEach> 
            
<!-- FOOTER -->
<jsp:include page="../assets/footerBack.jsp"></jsp:include>
</div>	
</div>
</div>

		
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
		$(".up>button").click(function(){
			let data = {};
			let upload = $(this).parent().children();
			data.action = "updatecpstate";
			url =  'Cproduct.do';
			data.cp_No = upload[0].value;
			data.cpstate = "已上架";
			
			$(this).parent().hide();
			$(this).parent().next().hide();
			$(this).parent().prev().text("已上架");
			
			$.ajax({
				url: url,
				type:"POST",
				data:data,
			});
			
		});
		
		$(".down>button").click(function(){
			let data = {};
			let down = $(this).parent().children();
			data.action = "updatecpstate";
			url =  'Cproduct.do';
			data.cp_No = down[0].value;
			data.cpstate ='已下架';
			$(this).parent().hide();
			$(this).parent().prev().hide();
			$(this).parent().prev().prev().text("已下架");
			
			$.ajax({
				url: url,
				type:"POST",
				data:data,
			});
			
		});
		
		$("button#go").click(function(){
			
			let data = {};
			let qq = $(this).parent().children();
			data.bprp_status = qq[0].value;
			data.bprp_no = qq[1].value;
			url = qq[2].value;
			data.action = qq[3].value;
			
			$(this).parent().prev().empty();
			$(this).parent().prev().text(data.bprp_status);
			
			
			
			$.ajax({
				url: url,
				type:"POST",
				data:data,
				success:function(){
					alert('回覆成功!');
				}
			});
			
		});
		
	});
	
	
	
	
	
	</script>
	

	</body>
</html>

