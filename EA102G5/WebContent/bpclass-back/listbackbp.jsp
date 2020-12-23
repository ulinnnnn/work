<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bp.model.*"%>
<%@ page import="com.bpreport.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>
<%
 	BpService bpSvc = new BpService();
    List<BpVO> list = bpSvc.getBack();
    pageContext.setAttribute("list",list);
%>
<%
    BprpService bprpSvc = new BprpService();
    List<BprpVO> list2 = bprpSvc.getAll();
    pageContext.setAttribute("list2",list2);
%>

<!DOCTYPE html>
<jsp:useBean id="bpclassSvc" scope="page" class="com.bpclass.model.BpclassService" />
<html lang="zh_TW">
  <head>

    <!-- SITE TITTLE -->
    <meta charset="Big5">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>All Orders </title>

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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/color-option2.css" id="option_style">

    <!-- Icons -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/img/favicon.png">

<style>

tr>td {
	text-align: left !important;
}

 div.color { 
 	color: blue !important; 
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
    font-family: �L�n������;
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
div.row* a{
 color:blue;
}

</style>

</head>
  <body id="body">
  <jsp:include page="/assets/headerBack.jsp"></jsp:include> 
  
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

        <div class="container">
        	
          <div class="row">
            <div class="col-md-12">
              <div class="innerWrapper">
                <div class="orderBox">
                  <div class="table-responsive">
                  	<h3 style="margin-top: 15px">�W�U�[�B�z</h3>
                    <%@ include file="page1.file" %> 
                    <table class="table" >
                     <input id="delete" type="hidden" name="action"	value="delete">	
                      <thead>
                        <tr>
                          <th>�ӫ~�s��</th>
                          <th>�|���s��</th>
                          <th>�Ыؤ��</th>
					      <th>������</th>
		                  <th>�ӫ~���A</th>
						  <th>�W�[</th>
						  <th>�U�[</th>
                        </tr>
                      </thead>
					<c:forEach var="bpVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                      <tbody >
                        <tr>
                          <td><a href="<%=request.getContextPath()%>/bp-front/TRY1.jsp?${bpVO.bp_no}">${bpVO.bp_no}</a></td>
                          <td>${bpVO.mem_no}</td>
                          <td><fmt:formatDate value="${bpVO.bp_upt}" pattern="yyyy-MM-dd EEE"/></td>
                          <td><fmt:formatDate value="${bpVO.bp_dot}" pattern="yyyy-MM-dd EEE"/></td>
                          <td>${bpVO.bpst_no}</td>

             	<c:choose>
					 <c:when test="${bpVO.bpst_no.equals('�U�[')}">	 
					 	<td class="up" colspan="2"> 
                   		   <input type="hidden" name="bp_no"  value="${bpVO.bp_no}">
						     <input type="hidden" name="action" value="<%=request.getContextPath()%>/bp-front/BpServlet">
						     <input type="hidden" name="action"	value="upload">
						     <button id="up">�W�[</button>
						     <button id="down" style="display:none">�U�[</button>
                   		</td>		
				   	 </c:when>
					 <c:when test="${bpVO.bpst_no.equals('�f�֤�')}">	 
					 	<td class="up" colspan="2"> 
                   		   <input type="hidden" name="bp_no"  value="${bpVO.bp_no}">
						     <input type="hidden" name="action" value="<%=request.getContextPath()%>/bp-front/BpServlet">
						     <input type="hidden" name="action"	value="upload">
						     <button id="up">�W�[</button>
						     <button id="down" style="display:none">�U�[</button>
                   		</td>		
				   	  </c:when>
				   	  <c:when test="${bpVO.bpst_no.equals('�W�[')}">	 
					 	<td class="up" colspan="2"> 
                   		   <input type="hidden" name="bp_no"  value="${bpVO.bp_no}">
						   <input type="hidden" name="action" value="<%=request.getContextPath()%>/bp-front/BpServlet">
						   <input type="hidden" name="action"	value="upload">
						   <button id="up" style="display:none">�W�[</button>
						   <button id="down">�U�[</button>
						   
						   
                   		</td>		
				   	 </c:when>
				   	 <c:otherwise>
				   	 	<td class="up" colspan="2"> 
				   	 	
				   	 	</td>
				   	 </c:otherwise>
			    </c:choose>
				
                        </tr>
                      </tbody>
                      </c:forEach>  
                    </table>
					<%@ include file="page2.file" %> 
					
					<h3>���|�B�z</h3>
                   
					<table class="table" id="abc">
						<tr style="padding: 12px 6px 20px 6px">
							<th style="padding: 12px 6px 20px 6px">���|�s��</th>
							<th style="padding: 12px 6px 20px 6px">���|�ӫ~</th>
							<th style="padding: 12px 6px 20px 6px">���|�|��</th>
							<th style="padding: 12px 6px 20px 6px">���|���O</th>
							<th style="padding: 12px 6px 20px 6px">���|����</th>
							<th style="padding: 12px 6px 20px 6px">���|�ɶ�</th>
							<th style="padding: 12px 6px 20px 6px">���|���A</th>
							<th style="padding: 12px 6px 20px 6px">�B�z���A</th>
						</tr>
						<c:forEach var="bprpVO" items="${list2}">
			<tr>
	
			<td style="padding: 12px 6px 20px 6px ; color:black">${bprpVO.bprp_no}</td>
			
			<td style="color:black ; padding: 12px 6px 20px 6px"><a href="<%=request.getContextPath()%>/bp-front/TRY1.jsp?${bprpVO.bp_no}">${bprpVO.bp_no}</a></td>
			<td style="padding: 12px 6px 20px 6px">${bprpVO.mem_no}</td>
			<td style="padding: 12px 6px 20px 6px">${bprpVO.bprp_project}</td>
			<jsp:useBean id="bpSvc2" scope="page" class="com.bp.model.BpService"/> 
				
			<td style="padding: 12px 6px 20px 6px">${bprpVO.bprp_text}</td>
			<td style="padding: 12px 6px 20px 6px"><fmt:formatDate value="${bprpVO.bprp_time}" pattern="yyyy-MM-dd EEE"/></td>
			<td style="padding: 12px 6px 20px 6px">${bprpVO.bprp_status}</td> 	
			<td  class="qq" style=" padding: 12px 6px 20px 6px">
			
		 		<select size="1" name="bprp_status">
			 		<option value="���|�q�L�w�U�[" >���|�q�L�w�U�[</option>
			 		<option value="���|���q�L" >���|���q�L</option>
			 	</select>
			 	<input type="hidden" name="bprp_no" value="${bprpVO.bprp_no}">
				<input type="hidden" name="action" value="<%=request.getContextPath()%>/bp-front/BpServlet">
				<input type="hidden" name="action"value="updatereport">
			    <button id="go" type="submit" value="�ק�" style=" height:auto">�ק�</button>
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
		
		$("button#up").click(function(){
			let data = {};
			let upload = $(this).parent().children();
			data.action = upload[2].value;
			url = upload[1].value;
			data.bp_no = upload[0].value;

			
			$(this).hide();
			$(this).next().show();
 			$(this).parent().prev().empty();
 			$(this).parent().prev().text("�W�[");
			
			$.ajax({
				url: url,
				type:"POST",
				data:data,
			});
			
		});
		
		$("button#down").click(function(){
			console.log("qwdqwdqw");
			let data = {};
			let down = $(this).parent().children();
			data.action = $("input#delete").val();
			console.log(data.action);
			url = down[1].value;
			console.log(url);
			data.bp_no = down[0].value;
			console.log(data.bp_no);
			
			$(this).hide();
 			$(this).prev().show();
 			$(this).parent().prev().empty();
 			$(this).parent().prev().text("�U�[");
			
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
					alert('�^�Ц��\!');
				}
			});
			
		});
		
	});
	
	</script>
	
	<!-- FOOTER -->
<jsp:include page="../assets/footerBack.jsp"></jsp:include>
	</div>
	</div>
	</div>
	</body>
</html>

