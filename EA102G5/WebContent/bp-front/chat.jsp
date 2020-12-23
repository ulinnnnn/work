<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<html>
<script>
	var MyPoint2 = "/Friend/${memVO.mem_no}";
	console.log(MyPoint2);
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/', 1));
	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint2;

	var statusOutput = document.getElementById("statusOutput");
	var messagesArea = document.getElementById("messagesArea");
	var self = '${userName}';
	var webSocket1;
	
	function connect() {
		// create a webSocket1
		webSocket1 = new WebSocket(endPointURL);

		webSocket1.onopen = function(event) {
			console.log("Connect Success!");
		};

		webSocket1.onmessage = function(event) {
			var jsonObj = JSON.parse(event.data);
			if ("test" == jsonObj.type) {

				Swal.fire({
					  position: 'center',
					  icon: 'info',
					  title:jsonObj.message,
					  showConfirmButton: false,
					  timer: 3000
					})
					
				var id = jsonObj.id ;
				$("#"+id).text("������A:�w�X�f");
				
			}
			
			if ("try" == jsonObj.type) {

				Swal.fire({
					  position: 'center',
					  icon: 'info',
					  title:jsonObj.message,
					  showConfirmButton: false,
					  timer: 3000
					})
// 				$("#sellout").after(`<h3 style="margin-bottom:0px">�ӫ~�W��:`+jsonObj.bp_head+`</h3>
//                 <div class="row shipping-info" style="padding:0 0 0 0">
//                 <div class="col-4">
<%--                   <h4 style="margin:8px"><a  href="<%=request.getContextPath()%>/bp-front/TRY1.jsp?`+jsonObj.bp_no+`" style="color:blue" target="_blank">�ӫ~�s��:`+jsonObj.bp_no+`</a>�R�a�b��:`+jsonObj.mem_no+`</h4> --%>
               
//                   <h4 style="margin:8px">�ӫ~����:`+jsonObj.bp_pri+`</h4>
//                   <h4 style="margin:8px" >�e�f�a�}:`+jsonObj.mem_addr+`</h4>
//                 </div>
//                 <div class="col-4">
//                   <h4 style="margin:8px">�ӫ~���O:`+jsonObj.bpcl_no+`</h4>
//                   <h4 style="margin:8px">�ӫ~���A:`+jsonObj.bp_new+`</h4>
//                 </div>
//                  <div class="col-4">
//                   <h4 style="margin:8px">�B�e�覡:`+jsonObj.bp_del+`</h4>
//                   <h4 style="margin:8px;font-weight:800;font-size:18px">������A:�w�I��</h4>
//                   <h4 style="margin:8px 8px 4px 8px" class="change">
// 					     <input type="hidden" name="bp_no"  value="`+jsonObj.bp_no+`">
// 					     <input type="hidden" name="bpst_no" value="�w�X�f">
<%-- 					     <input type="hidden" name="action" value="<%=request.getContextPath()%>/bp-front/BpServlet"> --%>
// 					     <input type="hidden" name="action"	value="update_status">
// 						 <input type="hidden" name="buymem_no" value="`+jsonObj.mem_no+`">
// 					     <button id="change1" style="margin-left:20px ; background-color:#e21c00; color:white"type="submit" >�T �{ �X �f</button>
// 					  </h4>
//                  </div>
//                </div>
// 				<div class="page-header"></div>`);
					
			}
	
		};

		webSocket1.onclose = function(event) {
			console.log("Disconnected!");
		};
	}

	function disconnect() {
		webSocket1.close();
	}
	
	connect();
</script>
</html>