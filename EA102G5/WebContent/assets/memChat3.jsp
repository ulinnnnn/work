<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>

<!DOCTYPE html>
<html>
<head>
<title>Chat</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

<style>
	


.search:focus {
	box-shadow: none !important;
	outline: 0px !important;
}

.type_msg:focus {
	box-shadow: none !important;
	outline: 0px !important;
}

.contacts {
	list-style: none;
	padding: 0;
}

.contacts li {
	width: 100% !important;
	padding: 5px 10px;
	margin-bottom: 15px !important;
}

.offline {
	background-color: #c23616 !important;
}

.Chatuser_info span {
	font-size: 20px;
	color: white;
}

.Chatuser_info p {
	font-size: 10px;
	color: rgba(255, 255, 255, 0.6);
}

.msg_time {
	position: absolute;
	left: 0;
	bottom: -15px;
	color: rgba(255, 255, 255, 0.5);
	font-size: 10px;
}

.msg_time_send {
	position: absolute;
	right: 0;
	bottom: -15px;
	color: rgba(255, 255, 255, 0.5);
	font-size: 10px;
}

.msg_head {
	position: relative;
}
.active666:hover{
	background-color: rgba(0, 0, 0, 0.6);
}
.filebgcolor:hover{
	.msg_cotainer_send{
		background-color: rgba(0, 0, 0, 0.6);
	}
}
.fileDO{
      position: absolute;
      opacity: 0;
      transition: all 200ms ease-in-out;
      top: 0px;
      left: 0px;
      width: 150px; 
      height: 74px;
      text-align: center;
      padding-top: 85px;
      background-color: rgba(255,255,255,0.8);
      padding-top: 20px;
      border-radius: 25px
    }
    .fileDO:hover{
      opacity: 1;
    }
#action_menu_btn {
	position: absolute;
	right: 10px;
	top: 10px;
	color: white;
	cursor: pointer;
	font-size: 20px;
}

@media ( max-width : 576px) {
	.contacts_card {
		margin-bottom: 15px !important;
	}
}
</style>

</head>
<!--Coded With Love By Mutiullah Samim-->
<body >
	<img id="showFP"class="rounded-circle user_img"style="height: 70px; width: 70px; border: 2px solid black;display:none;position:fixed;right: 3.5%;top: 85%;z-index: 999;">
	<div id="chatContant" class="col-md-4 col-xl-3 chat" style=" position:fixed;right: 5%;top: 30%;z-index: 999;display:none;">
		<div class="card"
			style="height: 500px; border-radius: 15px !important; background-color: rgba(0, 0, 0, 0.4) !important;">
			<div class="card-header msg_head"
				style="border-radius: 15px 15px 0 0 !important; border-bottom: 0 !important;">
				<div class="d-flex bd-highlight">
					<!-- 聊天對象資訊聊天對象資訊 -->
					<div class="img_cont"
						style="position: relative; height: 70px; width: 70px;">
						<img id="receiver_pic"
							
							class="rounded-circle user_img"
							style="height: 70px; width: 70px; border: 1.5px solid #f5f6fa;">
						<span id="online1" class="online_icon"
							style="position: absolute; height: 15px; width: 15px; background-color: #4cd137; border-radius: 50%; bottom: 0.2em; right: 0.4em; border: 1.5px solid white;"></span>
					</div>

					<div class="Chatuser_info"
						style="margin-top: auto; margin-bottom: auto; margin-left: 15px;">
						<span><h3 id="statusOutputName" class="statusOutput" style="color:white;"></h3><input type="hidden" id="statusOutput"></input></span>
						<p id="p123"></p>
					</div>
					<!-- ---------------------------------- -->
				</div>
				<!-- 右上角選單按鈕 -->
				<span id="action_menu_btn"><i id="small" class="fas fa-ellipsis-v"></i></span>
				<!-- ---------------------- -->
			</div>
			<!-- 聊天室窗聊天室窗 -->
			<div id="messagesArea"class="card-body msg_card_body" style="overflow-y: auto;">
			</div>
			<div class="card-footer"
				style="border-radius: 0 0 15px 15px !important; border-top: 0 !important;">
				<div class="input-group">
					<div class="input-group-append">
						<span class="input-group-text attach_btn" onclick="chatFileUpload()" 
							style="border-radius: 15px 0 0 15px !important; background-color: rgba(0, 0, 0, 0.3) !important; border: 0 !important; color: white !important; cursor: pointer;"><i
							class="fas fa-paperclip"></i></span>
							<form id="chatFileForm" method="POST" role="form" enctype="multipart/form-data">
							<input name="chat_file" id="sendfileToF"  type="file" style="display:none;"/>
							<input name="chat_file_number" id="chatfileNumber" type="text" style="display:none;"/>
							</form>
						<span class="input-group-text attach_btn" onclick="sendPicToF1()" 
							style=" !important; background-color: rgba(0, 0, 0, 0.3) !important; border: 0 !important; color: white !important; cursor: pointer;"><i
							class="fas fa-camera"></i></span>
							<form id="chatForm" method="POST" role="form" enctype="multipart/form-data">
							<input name="chat_img" id="sendPicToF"  type="file" style="display:none;"/>
							<input name="chat_pic_number" id="chatPicNumber" type="text" style="display:none;"/>
							</form>
					</div>
					<!-- 文字輸入 -->
					<textarea id="message" class="form-control type_msg"
						style="background-color: rgba(0, 0, 0, 0.3) !important; border: 0 !important; color: white !important; height: 60px !important; overflow-y: auto;"
						placeholder="Type your message..."onkeydown="if (event.keyCode == 13) sendMessage();">
						</textarea>
					<!-- 送出按鈕 -->
					<div class="input-group-append">
						<span id="sendMessage1"onclick="sendMessage();" class="input-group-text send_btn"
							style="border-radius: 0 15px 15px 0 !important; background-color: rgba(0, 0, 0, 0.3) !important; border: 0 !important; color: white !important; cursor: pointer;"><i
							id="sendMessage2" onclick="sendMessage();"class="fas fa-location-arrow"></i></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<button id="chPicViewBtn" type="button"  data-toggle="modal" data-target="#chPicViewModal" style="display:none;"></button>
	<div id="chPicViewModal" class="modal fade quick-view" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content"style="background-color: transparent;">
					<div class="modal-body"style="width:800px;height:500px;border-radius:10px;">
						<button  type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<div class="media flex-wrap">
							<div class="media-left px-0">
								<img id="chPicViewImg" class="media-object" src="" alt="Image"style="max-width: 100%; max-height: 100%; position: absolute; top: 70%; left: 60%; transform: translate(-50%, -50%);">
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	<script>

	function picvie(img){
		$("#chPicViewImg").attr("src",img.src)
		$("#chPicViewBtn").click();
	}
	$("#chatContant").hide();
	$("#small").click(function(){
		$("#chatContant").hide();
		$("#showFP").show();
	});
	$("#showFP").click(function(){
		$("#showFP").hide();
		$("#chatContant").show();
	});
	$("#showFP").click(function(){
		$("#showFP").hide();
		$("#chatContant").show();
	});
	$("#msShock").hide();
	function gettime(){            	//用DATE物件得到時間
		var now=new Date();
		var pa=(now.getHours()>=12)?"下午":"上午";
		var time=pa+" "+(now.getHours()%12==0?12:(now.getHours()%12>=10?now.getHours()%12:"0"+now.getHours()%12))+":"+(now.getMinutes()/10<1?"0"+now.getMinutes():now.getMinutes());
		return time;
	}
	
	var MyPoint = "/FriendWS/${memVO.mem_account}";
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/', 1));
	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
	var receiver_pic=document.getElementById("receiver_pic");
	var statusOutput = document.getElementById("statusOutput");
	var statusOutputName = document.getElementById("statusOutputName");
	var messagesArea = document.getElementById("messagesArea");
	var self = '${memVO.mem_account}';
	var webSocket;
	

	function connect() {
		// create a websocket
		webSocket = new WebSocket(endPointURL);
		
		webSocket.onopen = function(event) {
			console.log("Connect Success!");
			document.getElementById('sendMessage1').disabled = false;

		};
		webSocket.onmessage = function(event) {
			var jsonObj = JSON.parse(event.data);
			var jsonStr = JSON.stringify(jsonObj);
			if("online" === jsonObj.type){
				$('#online2'+jsonObj.user).css("background-color","#4cd137");
				if($("#statusOutput").val()===$("#toFriend1"+jsonObj.user).html()){
					$('#online1').css("background-color","#4cd137");
				}
			}
			if("minimum" === jsonObj.type){
				$('#online2'+jsonObj.user).css("background-color","rgb(255, 102, 102)");
				if($("#statusOutput").val()===$("#toFriend1"+jsonObj.user).html()){
					$('#online1').css("background-color","rgb(255, 102, 102)");
				}
			}
			if ("open" === jsonObj.type) {
				refreshHistoryMsgs(jsonObj)
			} else if ("history" === jsonObj.type) {
				if(jsonObj.onLine){
					$('#online1').css("background-color","#4cd137");
				}else{
					$('#online1').css("background-color","rgb(255, 102, 102)");
				}
				updateFriendName(jsonObj.friendName)
				messagesArea.innerHTML = '';
				var messages = JSON.parse(jsonObj.message);
				for (var i = 0; i < messages.length; i++) {
					var history_receiver_account = jsonObj.receiver;
					var historyData = JSON.parse(messages[i]);
					var showMsg = historyData.message;
					if(historyData.sender === self){
						messagesArea.innerHTML += '<div class="d-flex justify-content-end mb-4">'+'<div class="msg_cotainer_send"style="max-width:180px;margin-top: auto; margin-bottom: auto; margin-right: 10px; border-radius: 25px; background-color: #78e08f; padding: 10px; position: relative;">'+
							showMsg+'<span class="msg_time_send" style="width:60px;color:black;">'+historyData.nowChatTime+'</span>'+'</div>'+'<div  class="img_cont_msg" style="height: 40px; width: 40px;">'+'<img src="<%=request.getContextPath() %>/MemPic?mem_account=${memVO.mem_account}"class="rounded-circle user_img_msg"style="height: 40px; width: 40px; border: 1.5px solid #f5f6fa;">'
							'</div>'+'</div>';
					}else{
						messagesArea.innerHTML +='<div class="d-flex justify-content-start mb-4">'+'<div class="img_cont_msg" style="height: 40px; width: 40px;">'+
						'<img src="<%=request.getContextPath() %>/MemPic?mem_account='+history_receiver_account+'" class="rounded-circle user_img_msg"class="rounded-circle user_img_msg"style="height: 40px; width: 40px; border: 1.5px solid #f5f6fa;">'+'</div>'+
						'<div class="msg_cotainer"style="max-width:180px;margin-top: auto; margin-bottom: auto; margin-left: 10px; border-radius: 25px; background-color: #82ccdd; padding: 10px; position: relative;">'+
							showMsg+'<span class="msg_time"style="width:60px;color:black;" >'+historyData.nowChatTime+'</span>'+'</div>'+'</div>';
					}

				}
				messagesArea.scrollTop = messagesArea.scrollHeight;
			} else if ("chat" === jsonObj.type) {
				var chat_receiver_account = jsonObj.sender;
				var nowF=$("#statusOutput").val();
				if(jsonObj.onLine){
					$('#online1').css("background-color","#4cd137");
				}else{
					$('#online1').css("background-color","rgb(255, 102, 102)");
				}
				if(jsonObj.sender==nowF||jsonObj.receiver==nowF){
					if(jsonObj.sender === self){
						messagesArea.innerHTML += '<div class="d-flex justify-content-end mb-4">'+'<div class="msg_cotainer_send"style="max-width:180px;margin-top: auto; margin-bottom: auto; margin-right: 10px; border-radius: 25px; background-color: #78e08f; padding: 10px; position: relative;">'+
							jsonObj.message+'<span class="msg_time_send"style="width:60px;color:black;">'+jsonObj.nowChatTime+'</span>'+'</div>'+'<div class="img_cont_msg" style="height: 40px; width: 40px;">'+'<img src="<%=request.getContextPath() %>/MemPic?mem_account=${memVO.mem_account}" class="rounded-circle user_img_msg"style="height: 40px; width: 40px; border: 1.5px solid #f5f6fa;">'
							'</div>'+'</div>';
					}else{
						messagesArea.innerHTML +='<div class="d-flex justify-content-start mb-4">'+'<div class="img_cont_msg" style="height: 40px; width: 40px;">'+
							'<img src="<%=request.getContextPath() %>/MemPic?mem_account='+chat_receiver_account+'"class="rounded-circle user_img_msg"style="height: 40px; width: 40px; border: 1.5px solid #f5f6fa;">'+'</div>'+
							'<div class="msg_cotainer"style="max-width:180px;margin-top: auto; margin-bottom: auto; margin-left: 10px; border-radius: 25px; background-color: #82ccdd; padding: 10px; position: relative;">'+
								jsonObj.message+'<span class="msg_time_send"style="width:60px;color:black;">'+jsonObj.nowChatTime+'</span>'+'</div>'+'</div>';
					}
				}
				
				if(jsonObj.firstChat){
					var row2 = document.getElementById("chatRow");
					if(jsonObj.onLine){
						$('#online1').css("background-color","#4cd137");
						if(jsonObj.sender === self){
							row2.innerHTML +='<ui  class="contacts" style="list-style: none;padding: 0;">'+
							'<li id="'+jsonObj.receiver+'" onclick=addListener(this); class="active666"style="background-color: rgba(0, 0, 0, 0);">'+
								'<div class="d-flex bd-highlight">'+
									'<div class="img_cont"style="position: relative; height: 70px; width: 70px;">'+
										'<img src="<%=request.getContextPath() %>/MemPic?mem_account='+jsonObj.receiver+'" class="rounded-circle user_img" style="height: 70px; width: 70px; border: 1.5px solid #f5f6fa;">'+
										'<span id="online2'+jsonObj.receiver+'"class="online_icon"style="position: absolute; height: 15px; width: 15px; background-color: #4cd137; border-radius: 50%; bottom: 0.2em; right: 0.4em; border: 1.5px solid white;">'+
										'</span>'+'</div>'+'<div class="Chatuser_info"style="margin-top: auto; margin-bottom: auto; margin-left: 15px;">'+
										'<span id="toFriend1'+jsonObj.receiver+'"style="display:none;">'+jsonObj.receiver+'</span>'+'<span class="oncn"id="toFriendName1">'+jsonObj.receiverName+'</span>'+
										'<div id="msgsView'+jsonObj.receiver+'" >'+jsonObj.message+'<span class="msg_time_send"style="width:60px;color:white;position:relative;font-size:10px;">'+jsonObj.nowChatTime+'</span>'+'</div>'+'</div>'+
								'</div>'+
							'</li>'+
						'</ui>';
					}else{
						row2.innerHTML +='<ui  class="contacts" style="list-style: none;padding: 0;">'+
						'<li id="'+jsonObj.sender+'" onclick=addListener(this); class="active666"style="background-color: rgba(0, 0, 0, 0);">'+
							'<div class="d-flex bd-highlight">'+
								'<div class="img_cont"style="position: relative; height: 70px; width: 70px;">'+
									'<img src="<%=request.getContextPath() %>/MemPic?mem_account='+jsonObj.sender+'" class="rounded-circle user_img" style="height: 70px; width: 70px; border: 1.5px solid #f5f6fa;">'+
									'<span id="online2'+jsonObj.sender+'"class="online_icon"style="position: absolute; height: 15px; width: 15px; background-color: #4cd137; border-radius: 50%; bottom: 0.2em; right: 0.4em; border: 1.5px solid white;">'+
									'</span>'+'</div>'+'<div class="Chatuser_info"style="margin-top: auto; margin-bottom: auto; margin-left: 15px;">'+
									'<span id="toFriend1'+jsonObj.sender+'"style="display:none;">'+jsonObj.sender+'</span>'+'<span class="oncn">'+jsonObj.senderName+'</span>'+
									'<div id="msgsView'+jsonObj.sender+'" >'+jsonObj.message+'<span  class="msg_time_send"style="width:60px;color:white;position:relative;font-size:10px;">'+jsonObj.nowChatTime+'</span>'+'</div>'+'</div>'+
							'</div>'+
						'</li>'+
					'</ui>';
					}
					}else{
						$('#online1').css("background-color","rgb(255, 102, 102)");
					
						if(jsonObj.sender === self){
								row2.innerHTML +='<ui  class="contacts" style="list-style: none;padding: 0;">'+
								'<li id="'+jsonObj.receiver+'" onclick=addListener(this); class="active666"style="background-color: rgba(0, 0, 0, 0);">'+
									'<div class="d-flex bd-highlight">'+
										'<div class="img_cont"style="position: relative; height: 70px; width: 70px;">'+
											'<img src="<%=request.getContextPath() %>/MemPic?mem_account='+jsonObj.receiver+'" class="rounded-circle user_img" style="height: 70px; width: 70px; border: 1.5px solid #f5f6fa;">'+
											'<span id="online2'+jsonObj.receiver+'"class="online_icon"style="position: absolute; height: 15px; width: 15px; background-color: #ff6666; border-radius: 50%; bottom: 0.2em; right: 0.4em; border: 1.5px solid white;">'+
											'</span>'+'</div>'+'<div class="Chatuser_info"style="margin-top: auto; margin-bottom: auto; margin-left: 15px;">'+
											'<span id="toFriend1'+jsonObj.receiver+'"style="display:none;">'+jsonObj.receiver+'</span>'+'<span class="oncn"id="toFriendName1">'+jsonObj.receiverName+'</span>'+
											'<div id="msgsView'+jsonObj.receiver+'" >'+jsonObj.message+'<span class="msg_time_send"style="width:60px;color:white;position:relative;font-size:10px;">'+jsonObj.nowChatTime+'</span>'+'</div>'+'</div>'+
									'</div>'+
								'</li>'+
							'</ui>';
						}else{
							row2.innerHTML +='<ui  class="contacts" style="list-style: none;padding: 0;">'+
							'<li id="'+jsonObj.sender+'" onclick=addListener(this); class="active666"style="background-color: rgba(0, 0, 0, 0);">'+
								'<div class="d-flex bd-highlight">'+
									'<div class="img_cont"style="position: relative; height: 70px; width: 70px;">'+
										'<img src="<%=request.getContextPath() %>/MemPic?mem_account='+jsonObj.sender+'" class="rounded-circle user_img" style="height: 70px; width: 70px; border: 1.5px solid #f5f6fa;">'+
										'<span id="online2'+jsonObj.receiver+'"class="online_icon"style="position: absolute; height: 15px; width: 15px; background-color: rgb(255, 102, 102); border-radius: 50%; bottom: 0.2em; right: 0.4em; border: 1.5px solid white;">'+
										'</span>'+'</div>'+'<div class="Chatuser_info"style="margin-top: auto; margin-bottom: auto; margin-left: 15px;">'+
										'<span id="toFriend1'+jsonObj.sender+'"style="display:none;">'+jsonObj.sender+'</span>'+'<span class="oncn">'+jsonObj.senderName+'</span>'+
										'<div id="msgsView'+jsonObj.sender+'" >'+jsonObj.message+'<span  class="msg_time_send"style="width:60px;color:white;position:relative;font-size:10px;">'+jsonObj.nowChatTime+'</span>'+'</div>'+'</div>'+
								'</div>'+
							'</li>'+
						'</ui>';
					}
					}
				}else{
					var jsm=jsonObj.message;
					var jsmp=jsm.slice(1,4);
					if(jsmp=="div"){
						jsm="檔案上傳...";
					}
					if(jsmp!="img"){
						if(jsm.length>8){
							jsm=jsm.slice(0,8);
							jsm+="...";
						}
					}
					
					if(jsonObj.sender === self){
						if(jsonObj.onLine){
							$('#online1').css("background-color","#4cd137");
						}else{
							$('#online1').css("background-color","rgb(255, 102, 102)");
						}
						$('#msgsView'+jsonObj.receiver).html(jsm+'<span  class="msg_time_send"style="width:60px;color:white;position:relative;font-size:10px;">'+jsonObj.nowChatTime+'</span>');
					}else{
						$('#msgsView'+jsonObj.sender).html(jsm+'<span class="msg_time_send"style="width:60px;color:white;position:relative;font-size:10px;">'+jsonObj.nowChatTime+'</span>');
					}
				}
				
				messagesArea.scrollTop = messagesArea.scrollHeight;
			} else if ("close" === jsonObj.type) {
				refreshFriendList(jsonObj);
			}
			
		};

		webSocket.onclose = function(event) {
			console.log("Disconnected!");
		};
	}
	function chatFileUpload(){
		$("#sendfileToF").click();
	}

	$("#sendfileToF").change(function(e){
		var formData = new FormData($('#chatFileForm')[0]); 
		var friend = $("#statusOutput").val();
		var nowChatTime=gettime();
		var file = this.files[0];
	   	  var fr = new FileReader();
		$.ajax({ 
			type: 'post', 
			url: "/EA102G5/chatUpload.do", 
			data: formData, 
			cache: false, 
			processData: false, 
			contentType: false, 
		}).done(function (res) { 
			var chJosn22 = JSON.parse(res);
			var jsonObj = {
					"type" : "chat",
					"sender" : self,
					"receiver" : friend,
					"message" : '<div  class=" fileDO" ><div class="fa fa-file" style="padding-top:10px;"><a href="/EA102G5/chatDownLoad.do'+chJosn22.downLoadPath+'"><b style="color:black;">下載檔案</b></a></div></div><div style="float:left;"><img style="width:40px;height:40px;" src="/EA102G5/assets/img/chatFileIcon.png"></div>'+
								'<div style="float:right;width:90px;"><a href="/EA102G5/chatDownLoad.do'+chJosn22.downLoadPath+'"> <span style="float:right;font-weight:bold;margin-top:0px;color:black;">檔案名稱:</span><br> <span style="float:right;font-weight:bold;color:black;">'+chJosn22.fileName+'</span> <span style="color:black;float:right;font-weight:bold;">大小:'+chJosn22.fileSize+'<span></a></div>',
					"nowChatTime" : nowChatTime
		   		};
				webSocket.send(JSON.stringify(jsonObj));
			 fr.readAsDataURL(file);
			 $("#sendfileToF").val('');
		}).error(function () { 
			Swal.fire('系統忙線', "", "error");
		}); 
	})
	
	function sendPicToF1(){
		$("#sendPicToF").click();
	}
	$("#sendPicToF").change(function(e){
		  var nowChatTime=gettime();
		  var inputMessage = document.getElementById("message");
		  var friend = $("#statusOutput").val();
		  var file = this.files[0];
	   	  var fr = new FileReader();
	   	  var chatPicNumber=_uuid();
	   	  $("#chatPicNumber").val(chatPicNumber);
	   	  
		  var _name, _fileName, personsFile;
	      	personsFile = document.getElementById("sendPicToF");
	        _name = personsFile.value;
	        _fileName = _name.substring(_name.lastIndexOf(".") + 1).toLowerCase();
	        if (_fileName !== "png" && _fileName !== "jpg"&&_fileName !== "jpeg") {
	        	Swal.fire("請確認照片格式","", "error");
	            return;
	        }
	   	 
	   	  fr.readAsDataURL(file);
		  $.ajax({ 
			url: '/EA102G5/chatPic.do', 
			type: 'POST', cache: false, 
			data: new FormData($('#chatForm')[0]), 
			processData: false, contentType: false }).done(
					function(res) { 
			   	  fr.onload = function (e) {
			   		var jsonObj = {
						"type" : "chat",
						"sender" : self,
						"receiver" : friend,
						"message" : '<img onclick="picvie(this)" class="chPicView" style="border-radius: 10px;width:80px;height:95px;" src="/EA102G5/ReadChatPic?chatPicNumber='+chatPicNumber+'">',
						"nowChatTime" : nowChatTime
			   		};
					webSocket.send(JSON.stringify(jsonObj));
			   	  };
			   	  fr.readAsDataURL(file);
			   	$("#sendPicToF").val('');
			}).fail(function(res) {
				Swal.fire('系統忙線', "", "error");
			});

	});
	 function _uuid() {
		    var d = Date.now();
		    if (typeof performance !== 'undefined' && typeof performance.now === 'function'){
		      d += performance.now(); //use high-precision timer if available
		    }
		    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
		      var r = (d + Math.random() * 16) % 16 | 0;
		      d = Math.floor(d / 16);
		        return (c === 'x' ? r : (r & 0x3 | 0x8)).toString(16);
		    });
		  }

	function sendMessage() {
		var inputMessage = document.getElementById("message");
		var friend = $("#statusOutput").val();
		var message = inputMessage.value.trim();
		var nowChatTime=gettime();
		receiver_pic.setAttribute('src',"<%=request.getContextPath() %>/MemPic?mem_account="+friend);
		if (message === "") {
			inputMessage.focus();
		} else if (friend === "") {
			Swal.fire('請選擇聊天對象', "", "error");
		} else {
			var jsonObj = {
				"type" : "chat",
				"sender" : self,
				"receiver" : friend,
				"message" : message,
				"nowChatTime" : nowChatTime
			};
			webSocket.send(JSON.stringify(jsonObj));
			inputMessage.value = "";
			inputMessage.focus();
		}
	}
	
	function refreshHistoryMsgs(jsonObj){
		var friends = jsonObj.users;
		
		var keys = jsonObj.allHisMsgsKeys;
		var allHisMsgs = jsonObj.allHisMsgs;
		
		var  trueNames = jsonObj.trueNames;
		
		var row = document.getElementById("chatRow");
		row.innerHTML = '';
		for (var i = 0; i < keys.length; i++) {
			if (keys[i] === self) { continue; }	
			var key=keys[i]
			var name=allHisMsgs[key].slice(0,(allHisMsgs[key].indexOf(':')));
			var message=allHisMsgs[key].slice((allHisMsgs[key].indexOf(':')+1),allHisMsgs[key].length);
			var message2 ="";
			if(message.slice(1,4)!="img"){
				message2=message.slice(0,(message.indexOf(':')));
				if(message2.length>20){
					message2=message2.slice(0,12);
					message2+="...";
				}
			}else{
				message2=message.slice(0,(message.lastIndexOf(':')-6));
			}
			if(message.slice(1,4)==="div"){
				message2="檔案上傳...";
			}	
			
			var lastChatTime=message.slice((message.lastIndexOf(':')-5),allHisMsgs[key].length);
			row.innerHTML +='<ui  class="contacts" style="list-style: none;padding: 0;">'+
			'<li  id="'+keys[i]+'" onclick=addListener(this); class="active666"style="background-color: rgba(0, 0, 0, 0);">'+
				'<div class="d-flex bd-highlight">'+
					'<div class="img_cont"style="position: relative; height: 70px; width: 70px;">'+
						'<img src="<%=request.getContextPath() %>/MemPic?mem_account='+keys[i]+'" class="rounded-circle user_img" style="height: 70px; width: 70px; border: 1.5px solid #f5f6fa;">'+
						'<span id="online2'+keys[i]+'" class="online_icon"style="position: absolute; height: 15px; width: 15px; background-color: #ff6666; border-radius: 50%; bottom: 0.2em; right: 0.4em; border: 1.5px solid white;">'+
						'</span>'+'</div>'+'<div class="Chatuser_info"style="margin-top: auto; margin-bottom: auto; margin-left: 15px;">'+
						'<span id="toFriend1'+keys[i]+'"style="display:none;">'+keys[i]+'</span>'+'<span class="oncn" style="font-size:25px;" >'+name+'</span>'+
						'<div id="msgsView'+keys[i]+'" >'+message2+'<span id="msgsTime'+keys[i]+'" class="msg_time_send"style="width:60px;color:white;position:relative;font-size:10px;">'+lastChatTime+'</span>'+'</div>'+'</div>'+
						'</div>'+
			'</li>'+
		'</ui>';
		}
	}


	$("#btn").click(function(){
		$("#chatContant").show();
		var friend = $("#toFriend").text();
		var friendName = $("#toFriendName").text();
		$("#statusOutput").val(friend);
		$("#showFP").attr('src',"<%=request.getContextPath() %>/MemPic?mem_account="+friend);
		receiver_pic.setAttribute('src',"<%=request.getContextPath() %>/MemPic?mem_account="+friend);
		updateFriendName(friendName);
		var jsonObj = {
				"type" : "history",
				"sender" : self,
				"receiver" : friend,
				"message" : ""
			};
		
		webSocket.send(JSON.stringify(jsonObj));
	})
	
	function addListener(keys) {
		var container = document.getElementById("chatRow");
		var friend=keys.id;
		var color=$('#online2'+friend).css("background-color");
		$('#online1').css("background-color",color);
			$("#chatContant").show();
			$("#statusOutput").val(friend);
			$("#showFP").attr('src',"<%=request.getContextPath() %>/MemPic?mem_account="+friend);
			receiver_pic.setAttribute('src',"<%=request.getContextPath() %>/MemPic?mem_account="+friend);
			var jsonObj = {
					"type" : "history",
					"sender" : self,
					"receiver" : friend,
					"message" : ""
			};
			
			webSocket.send(JSON.stringify(jsonObj));
		
	}
	
	function disconnect() {
		
		webSocket.close();
		document.getElementById('sendMessage').disabled = true;
// 		document.getElementById('connect').disabled = false;
// 		document.getElementById('disconnect').disabled = true;
	}
	
	function updateFriendName(name) {
		statusOutputName.innerHTML = name;
	}
	
	connect();
</script>
	</body>
</html>
