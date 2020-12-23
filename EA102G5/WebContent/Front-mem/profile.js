  
  $.datetimepicker.setLocale('zh');
  $('#date_of_birth').datetimepicker({
  	 theme: '',              //theme: 'dark',
       timepicker:false,       //timepicker:true,
       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
       format:'Y-m-d',         //format:'Y-m-d H:i:s',
	   value: '<%=mem_born%>', // value:   new Date(),
	   //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
     //startDate:	            '2017/07/10',  // 起始日
     //minDate:               '-1970-01-01', // 去除今日(不含)之前
     maxDate:               '+1970-01-01'  // 去除今日(不含)之後
  });
   function addrUpdate() {
      //當頁面載完之後，用AddressSeleclList.Initialize()，
      //傳入要綁定的縣市下拉選單ID及鄉鎮市區下拉選單ID
      AddressSeleclList.Initialize('country', 'urbanArea');
      //後面四個參數分別是兩個下拉選單的預設文字跟值
     AddressSeleclList.Initialize('縣市2', '鄉鎮市區2', 'Please Select City', '0', 'Please Select Area', '0');
 }
        
	   	
	  $("#mem_pic").change(function(e){
		  var file = this.files[0];
	   	  var fr = new FileReader();
	   	  fr.onload = function (e) {
	   	    $('#preview_Mpic').attr('src', e.target.result);
	   	  };
	   	  fr.readAsDataURL(file);
		  
		  $.ajax({ 
			url: 'MemUpdatePic.do', 
			type: 'POST', cache: false, 
			data: new FormData($('#updatePicForm')[0]), 
			processData: false, contentType: false }).done(
					function(res) { 
				swal('照片更新成功', '', 'success');
				 var file = this.files[0];
			   	  var fr = new FileReader();
			   	  fr.onload = function (e) {
			   	    $('#preview_Mpic').attr('src', e.target.result);
			   	  };
			   	  fr.readAsDataURL(file);
			}).fail(function(res) {
				alert("系統忙線，敬請稍後!");
			});

		});
		
	 	var country=$("#country option:selected").text()
		var urbanArea=$("urbanArea option:selected").text()
		var road=$("road").val()
		$("#goUpdate").click(function (){
			$("#update").attr("disabled","disabled");
		});
		
		$("#country").change(function (){
				$("#update").removeAttr("disabled");
		})
  
     