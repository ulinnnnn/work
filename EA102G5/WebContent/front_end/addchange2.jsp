<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="big5"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>

    <!-- SITE TITTLE -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Profile - BIGBAG Store</title>

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
    
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script src="https://cdn.jsdelivr.net/npm/tw-city-selector@2.1.1/dist/tw-city-selector.min.js" integrity="sha256-Iz/pF94D+raqeqXJDoOetn9L0yBFI7ogMMrhT6RzmFw=" crossorigin="anonymous">
    </script>
     <script>
      
      

      function showImg(thisimg) {
      	var file = thisimg.files[0];
      	if(window.FileReader) {
      		var fr = new FileReader();  
      		var showimg = document.getElementById('showimg');
      		fr.onloadend = function(e) {
      		showimg.src = e.target.result;
      	};
      	fr.readAsDataURL(file);
      	showimg.style.display = 'block';
      	}
      }
      
      
      new TwCitySelector({
    	    el: '.city-selector-set',
    	    elCounty: '.county', // �b el �̬d�� element
    	    elDistrict: '.district', // �b el �̬d�� element
    	    elZipcode: '.zipcode' // �b el �̬d�� element
    	  });
      
      function showsub(){ 
    	  var submenu=document.getElementsByClassName("county")[0]; 
    	  submenu.style.display="none"; 
    	  submenu=document.getElementsByClassName("district")[0]; 
    	  submenu.style.display="none";
    	  
    	  } 
    	  
      
    </script>
    

  </head>

  <body id="body" class="body-wrapper version1 up-scroll">

    

      <!-- HEADER -->
      <div class="header clearfix">

        <!-- TOPBAR -->
        

      <!-- MAIN CONTENT SECTION -->
      <section style="padding:0px 0 30px 0;" class="mainContent clearfix userProfile">
        <div class="container">
          
          <div class="row">
            <div class="col-md-12">
              <div class="innerWrapper profile">
                <div class="orderBox">
                  <h2>�إߥ洫�ӫ~</h2>
                </div>
                
                <div class="row">
                  <div class="col-md-4 col-lg-3 col-xl-2 col-12">
                    <div class="thumbnail" style="top:600px;width:300px;">
                      <img id="showimg" src="" style="display:none;top:20px;"alt="profile-image" />  
                     
                     
                    </div>
                  </div>
                  <div class="col-md-8 col-lg-9 col-xl-10 col-12">
                      <form class="form-horizontal" METHOD="post" ACTION="Cproduct.do" name="form" enctype ="multipart/form-data" onsubmit="return chk();">
                        <div class="form-group row">
                          <label for="" class="col-md-3 control-label">�ӫ~�W��</label>
                          <div class="col-md-7">
                            <input type="text" class="form-control" name="cpname" value="${param.cpname}" placeholder="�п�J20�r�H���ӫ~�W��">
                          </div>
                        </div>
                        <div class="form-group row">
          <jsp:useBean id="CpclassSvc" scope="page" class="com.cpclass.model.CpclassService" />

		       <label for=""class="col-md-3 control-label">�ӫ~���O</label>
		       <div class="col-md-9">
		       <select class="form-control" id="exampleFormControlSelect12" name="cpClass">
			   <c:forEach var="CpclassVO" items="${CpclassSvc.all}">
			   <option value="${CpclassVO.cpClass_No}" ${(param.cpClass eq CpclassVO.cpClass_No)? 'selected':'' } >${CpclassVO.cpClass}
			   
			   </c:forEach>
			   </select>
			   </div>
			   
		       
          </div>
                        <div class="form-group row">
                        <label for="" class="col-md-3 control-label">����a�I</label>
                        
            <div class="col-md-9 city-selector-set">
            <button  type="button" onclick="showsub()" class="btn btn-primary btn-pill">������</button>
            
  
    <!-- ������� -->
    <select  name="cpmeetup1" class="county"></select>
  
  
    <!-- �ϰ��� -->
    <select  name="cpmeetup2"   class="district"></select>
     
  </div>
            
          </div>
                        <div  class="form-group row" >
                          <label style="top:25px" for="" class="col-md-3 control-label">�ӫ~�ԭz</label>
                          <div style="top:25px" class="col-md-9">
                            <textarea style="width:600px;height:200px ;" name="cptext" class="form-control" id="exampleFormControlTextarea1" required rows="6" placeholder="200�r�H�������ӫ~�y�z�A���T���N�X�{�b�z���ӫ~�洫������">${param.cptext}</textarea>
                          </div>
                        </div>
                       
                        <div class="form-group row">
                          <label style="top:25px;left:13px;" for="" class="col-md-3 control-label">���洫�ӫ~</label>
                          <div style="top:25px" class="col-md-9">
                            <input  type="text" class="form-control" name="emp_NO" id="" placeholder="���T���N�Q�j�M��åH���˥\�ണ�Ѽҽk���A��ĳ�ϥ�PS4�C���B�ְ��B�_�i�ڥd�P��²�u����">
                          </div>
                        </div>
                         <label  style="margin-top:30px;margin-left:150px;" for="pic1" class="btn btn-primary btn-pill" >                  
                     �W�ǲĤ@�i�Ϥ�
                        
                        <input style="display:none;" onchange="showImg(this)"accept="image/gif, image/jpeg, image/png" name="pic1" id="pic1" style="opacity:0%" type="file"  class="btn btn-primary btn-block" role="button" >
                        
                      </label>
                      <label  style="margin-top:30px;" for="pic2" class="btn btn-primary btn-pill">                  
                     �W�ǲĤG�i�Ϥ�
                        
                        <input style="display:none;" onchange="showImg(this)"accept="image/gif, image/jpeg, image/png" name="pic2" id="pic2" style="opacity:0%" type="file"  class="btn btn-primary btn-block" role="button" >
                        
                      </label>
                      <label  style="margin-top:30px;" for="pic3" class="btn btn-primary btn-pill" >                  
                     �W�ǲĤT�i�Ϥ�
                        
                        <input style="display:none;" onchange="showImg(this)"accept="image/gif, image/jpeg, image/png" name="pic3" id="pic3" style="opacity:0%" type="file"  class="btn btn-primary btn-block" role="button" >
                        
                      </label>
                        <div class="form-group row">
                          <div style="top:15px" class=" col-md-12 ">
                          <input type="hidden" name="action" value="change">
                            <button type="submit" class="btn btn-primary float-right">�إ߰ӫ~</button>
                            
                          </div>
                        </div>
                      </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      

      			
			<!-- COPY RIGHT -->
			
			
			
		</div>

		<script>
function chk(){
    if(document.form.cpname.value==''){
      
    	Swal.fire(
			     
  		      '�ӫ~�W�٥���'
  		     
  		    )
      return false;
    }
    if(document.form.emp_NO.value.length>30){
        
    	Swal.fire(
			     
  		      '���ҹL���A��²�u�y�z'
  		     
  		    )
      return false;
    }
    if(document.form.cptext.value.length>200){
        
    	Swal.fire(
			     
  		      '�ӫ~�ԭz�L��'
  		     
  		    )
      return false;
    }
    if(document.form.cpname.value.length>30){
        
    	Swal.fire(
			     
  		      '�ӫ~�W�ٹL��'
  		     
  		    )
      return false;
    }
    return true;
  }

</script>

		
		

		

	</body>
	
</html>
