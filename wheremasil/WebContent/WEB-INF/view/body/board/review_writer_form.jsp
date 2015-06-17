<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %> 
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="/wheremasil/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
function delay(gap) { /* gap is in millisecs */
    var then,now;
    then = new Date().getTime();
    now = then;
    while((now - then) < gap) {
        now = new Date().getTime();
    }
    
    
    
    	
    	
    	
    }
    
function deletePost(posting_id){
	//alert(posting_id);	
var txt = "posting_id" + "="+ posting_id;
	
	$.ajax({
   	    url: '/wheremasil/board/deletePost.do',
   	 type:"post",
   	    processData: false,
   	 
	    data:txt,
	    dataType:"text",
   	    
   	    success: function(result){
   	   
   	    	
   	    	//alert("성공");
   	    	
   	    	
   	    	
   	   
   	    },
   	    error:function(result){
   	    	
   	    	//alert("삭제실패");
   	    }
   	});
	
	
	
}



</script>
<script type="text/javascript">
var path = "http://192.168.7.252:48080/wheremasil/uploads/images/posting_img/";
var cnt=2;
$(document).ready(function(){
	
deletePost("${requestScope.board.posting_id}");
	
	
	var temp=1;
	var imgpath="default";

	$("#addFile").on("click",function(){
		
		$("#fileSection").append("<tr><td height='30' bgcolor='#f7f7f7'><div align='right'><strong> 파일 "+ cnt++ +"</strong>&nbsp;&nbsp;</div></td><td height='30' bgcolor='#ffffff'> &nbsp;&nbsp; <input name='upfile1' id='upfile1' type='file'> </td></tr>");
		
	});
	
	$("#fileSection").on("change","input[type='file']",function(){
		 var data =new FormData();
		 data.append("file",jQuery(this).get(0).files[0]);
		 //alert(data);
	   	 $.ajax({
	       	    url: '/wheremasil/board/check.do',
	       	  type: "post",
              dataType: "text",
              data: data,
              // cache: false,
              processData: false,
              contentType: false,
	       	    success: function(result){
	       	    	//alert(path+result);
	       	    	
	       	    	alert("업로드 성공!!");
	       	    	
	       	    	
	       	     var data = CKEDITOR.instances.editor1.getData();
	       	     //var data = "<![CDATA["+data1+"]]>";

delay(4000);
	       	    	
	       	    	
	       	    //	alert(data+"<img src='"+path+result+"'/>");
	       	    	$("#sumname").attr('value',path+result); 
	       	    	if(($('input[name="upfile1_pos"]:checked').val())==0){
	       	    	CKEDITOR.instances.editor1.setData(data+"<img src='"+path+result+"'/>");
	       	    	}else{
	       	    	CKEDITOR.instances.editor1.setData("<img src='"+path+result+"'/>"+data);
	       	    	}
	       	    	
	       	    	
	       	    },
	       	    error:function(result){
	       	    	//alert(result);
	       	    	alert("실패");
	       	    }
	       	});


       
       
	
	
		
		
	});
	
	
	$("#titleimg").on("change",function(){
		//alert("대표이미지 삽입이벤트");
		var data =new FormData();
		 data.append("file",jQuery(this).get(0).files[0]);
		 alert(data);
	   	 $.ajax({
	       	    url: '/wheremasil/board/check.do',
	       	  type: "post",
             dataType: "text",
             data: data,
             // cache: false,
             processData: false,
             contentType: false,
	       	    success: function(result){
	       	    	//alert(path+result);
	       	    	
	       	    	alert("업로드 성공!!");
	       	    	
	       	    	
	       	     var data = CKEDITOR.instances.editor1.getData();
	       	     //var data = "<![CDATA["+data1+"]]>";

$("#sumname").attr('value',path+result); 
	       	    	
	       	    	
	       	    //	alert(data+"<img src='"+path+result+"'/>");
	       	    	
	       	    	
	       	    	
	       	    },
	       	    error:function(result){
	       	    	alert(result);
	       	    	alert("실패");
	       	    }
	       	});
		
		
		
	});
	
	
	$("#main").submit(function(event){
		//alert("섭밋전 이벤트호출");
		
		if($("#sumname").val()=="2"){
			if(imgpath=="default"){
			//alert("이미지, 초기이미지 아무것도안넘");
			$("#sumname").attr('value',imgpath); 
			}else{
			//alert("2라면");
			$("#sumname").attr('value',imgpath); 
			}
		}else{
			//alert("아니라면");
		}
		return true;
	});
	
	$("#cancle_btn").on("click",function(){
		//alert("켄슬이벤트");
		var result = confirm('Are you sure you want to do this?');

	    if(result) {
	       //yes
	        location.replace('/wheremasil/board/review.do');
	    } else {
	        //no
	    }
		
	});
	
	//alert("re");
	
	//alert( $("#con").val());
	CKEDITOR.instances.editor1.setData( $("#con").val());
	$("#sumname").attr('value',$("#con2").val()); 
	
	
});






</script>








</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body text="#000000" topmargin="0" leftmargin="0" bgcolor="#ffffff" marginheight="0" marginwidth="0">


글쓰기폼
<form action="/wheremasil/board/insertBoardDAO.do" enctype="multipart/form-data" method="post" name="main" id="main">
<table width="950" border="1" cellspacing="1" cellpadding="0">



                      <tbody><tr>
                      <input type="hidden" id="con2" value="${requestScope.board.p_img_path }"/>
                      <input type="hidden" name="dateTime" value="1" />
                      <input type="hidden" name="sumname" id="sumname" value ="2" />
                      <input type="hidden" name="con" id="con" value='${requestScope.board.p_content}'/>
                        <td width="100" height="35" bgcolor="#f7f7f7"><div align="right"><font color="#ff0000"></font><strong>닉네임
                            &nbsp;</strong> </div></td>
                        <td height="35" bgcolor="#ffffff">
						&nbsp; <input name="name" type="text" size="14" maxlength="10" readonly="" value="${sessionScope.login_info.member_id}">
												</td>
                      </tr>
                      <tr>
                        <td width="80" height="35" bgcolor="#f7f7f7"><div align="right"><font color="#ff0000"></font><strong>테마&nbsp;</strong> </div></td>
                        <td height="35" style="padding: 0px 4px;" bgcolor="#ffffff">

							<select name="theme" id="theme"  style="width: 138px;" >
							<option value="1">가족여행</option>
							<option value="2">연인여행</option>
							<option value="3">혼자여행</option>
							<option value="4">우정여행</option>
							<option value="4">기타</option>
							
							
							</select>
                      </td>
                      </tr>
                      
                      <tr>
                      <td height="30" width="30"bgcolor="#f7f7f7"><div align="right"><font size='2'><strong>대표이미지설정 </strong></font>&nbsp;&nbsp;</div></td>
                      <td height="30" bgcolor="#ffffff"> &nbsp;&nbsp; <input name="titleimg" id="titleimg" type="file">
						 
					
						
						</td>
						 
</tr>

                      	  <tr>
                        <td height="35" bgcolor="#f7f7f7"><div align="right"><strong>제목 &nbsp;</strong></div></td>
                        <td height="35" bgcolor="#ffffff"> &nbsp;   <input name="subject" id="subject" type="text" size="80" maxlength="40" required value="${requestScope.board.p_title }">
                          &nbsp;</td>
                      </tr>
                      
                      
                                        
                      
                      
                      
                      
                      
                      
                      <tr>
                      
                       <td width="80" height="35" bgcolor="#f7f7f7"><div align="right"><font color="#ff0000"></font><strong>내용&nbsp;</strong> </div></td>
                        <td height="35" style="padding: 0px 4px;" bgcolor="#ffffff">
                        
                         <textarea name="editor1" id="editor1" rows="10" cols="100" class="editor1" >
                
            </textarea>
            <script>
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace( 'editor1' );
            </script>
                        </td>
                       
                      </tr>
  
<tr>
                        <td height="40" align="center" bgcolor="#f7f7f7" colspan="2">
						<font color="red">
						아래 그림파일은 1MB(메가바이트)이하의 그림파일만 올릴 수 있습니다.(JPG,PNG,BMP) <br>
						서버 부하 때문에 GIF파일은 200KB까지만 가능합니다.

						</font>

						</td>
                      </tr>             
                      
                      
                      <table width="950" border="1" cellspacing="1" cellpadding="0" id="fileSection">
                      <tr>
                      <td height="30" bgcolor="#f7f7f7"><div align="right"><strong>파일1 </strong>&nbsp;&nbsp;</div></td>
                      <td height="30" bgcolor="#ffffff"> &nbsp;&nbsp; <input name="upfile1" id="upfile1" type="file">
						 
						<input name="upfile1_pos" type="radio" value="1">맨위 <input name="upfile1_pos" type="radio" checked="" value="0">맨아래
						<input type="button" value="파일추가" id="addFile" >
						</td>
						 
</tr>
</table>

 
<table width="950" border="1" cellspacing="1" cellpadding="0" >
                    <tr>
                      <td height="50" style="text-align: center;" bgcolor="#f7f7f7" colspan="2">
                        	                        	<div style="margin: 4px 0px;">
                        	                        	
                            	<input name="confirm_btn" type="submit" value="     확       인     ">
                            	<input name="cancle_btn" type="button"  id="cancle_btn" value="     취       소     ">
                            	
                            </div>
                            
                            
                            
                        </td>
</tr>

</table>



</table>

</form>

</body>
</html>