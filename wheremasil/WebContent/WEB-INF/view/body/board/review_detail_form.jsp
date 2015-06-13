<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%> 
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><!-- style="float: right;" -->
<!-- style="max-width:200px;" -->
<head>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>


<script type="text/javascript">
function resize(obj) {
    obj.style.height = "1px";
    obj.style.height = (20+obj.scrollHeight)+"px";
  }
  

var check =2;

function insertHit(){
	alert("조회수 펑션");
	var txt = "posting_id" + "="+ $("#posting_id").val();
	$.ajax({
   	    url: '/wheremasil/board/insertHit.do',
   	 type:"post",
   	    processData: false,
   	 
	    data:txt,
	    dataType:"JSON",
   	    
   	    success: function(result){
   	    	
   	    	alert(result);
   	    	
   	    	
   	    	
   	    	

   	    	
   	    	
   	    	
   	    	
   	   
   	    },
   	    error:function(result){
   	    	alert(result);
   	    	alert("조회수 업데이트 실패");
   	    }
   	});

}

function rpccnt(){
	
	var rpcnt;
	
	var p_id=${posting.posting_id};
	
	var allData = "p_id="+p_id;
		
			$.ajax({
		       	    url: '/wheremasil/board/rpcnt.do',
		       	 type:"post",  
		       	    processData: false,
		       	 data:allData,
		    	    dataType:"text",
		       	    
		       	    success: function(result){
		       	    	
		       	    	
		       	    	
		       	    	rpcnt=result;
		       	    	
		 
		       	    
		       	    
		       	    	
		       	     document.getElementById("rp_cnt").innerHTML = rpcnt;       	    	
		       	    	
		       	   
		       	    },
		       	    error:function(result){
		       	    	alert(result);
		       	    	alert("리플개수못옴");
		       	    }
		       	});
			
	
}

function rpinsert(){
	var editor2 = "editor1" + "="+ $("#posting_id").val();
	
	$.ajax({
       	    url: '/wheremasil/board/sinsertRp.do',
       	    
       	    processData: false,
       	 type:"post",
    	    data:editor2,
    	    dataType:"JSON",
       	    
       	    success: function(result){
       	    	
       	    	
       	    	
       	    	
       	    	
 
       	    	washrp(result);
       	    	
       	    	
       	    	
       	   
       	    },
       	    error:function(result){
       	    	alert(result);
       	    	alert("첫리플로드  실패");
       	    }
       	});
	
	if(check==1){
		button();
		check=2;
	}
	
}

function button(){
	alert("버튼클릭");
	alert(check);
	if(check==1){
	document.getElementById("rplist").innerHTML="";
	document.getElementById("button").innerHTML="▼";
	check=2;
	
	}else{
		rpinsert();
		document.getElementById("button").innerHTML="▲";
		
		check=1;
	}
}


function inertLike(posting_id){
	alert("추천하기 펑션");
	var txt = "posting_id" + "="+ $("#posting_id").val();
	$.ajax({
   	    url: '/wheremasil/board/insertLike.do',
   	    
   	    processData: false,
   	 type:"post",
	    data:txt,
	    dataType:"JSON",
   	    
   	    success: function(result){
   	    	
   	    	alert(result);
   	    	
   	    	
   	    	
   	    	

   	    	
   	    	
   	    	
   	    	
   	   
   	    },
   	    error:function(result){
   	    	alert(result);
   	    	alert("라이크 업데이트 실패");
   	    }
   	});
	
	
	
	
	
}
</script>

<script type="text/javascript">
$(document).ready(function(){
	
	insertHit();
	
	
	$("#like").on("click",function(){
		if (confirm("정말 추천하시겠습니까??") == true){   
		    inertLike( $("#posting_id").val());
		}else{   
		    return;
		}
	});
	

		rpccnt();
		
		$("#button").on("click",function(){
		
           button();
		});
		
		
		
		
		
		
		
		
	
	
	
	
	
	
	
	
	$("#rpregi").on("click",function(){
		

		var editor1 =  "editor1" + "="+ $("#rpcontext").val()+"&" +"member_id" + "="+ $("#member_id1").val()+"&" +"posting_id" + "="+ $("#posting_id").val();
		alert(editor1);
		$.ajax({
	       	    url: '/wheremasil/board/insertRp.do',
	       	    
	       	    processData: false,
	       	 type:"post",
	    	    data:editor1,
	    	    dataType:"JSON",
	       	    
	       	    success: function(result){
	       	    	alert(result);
	       	    	
	       	    	alert(result[0].posting_id);
	       	    	
	       	    	
	 
	       	    	washrp(result);
	       	    	alert("리설트싸이즈"+result.size());
	       	    	alert("리플업로드!!");
	       	    	
	       	    	rpccnt();
	       	    	
	       	    	
	       	    	
	       	   
	       	    },
	       	    error:function(result){
	       	    	alert(result);
	       	    	alert("리플업로드 실패");
	       	    }
	       	});
		
		
		
	});
	

	
});


</script>

<script type="text/javascript">

function getMemberImg(member_id) {
	var result1;
	var txt = "member_id" + "=" + member_id;
	$.ajax({
		url : '/wheremasil/board/getMemberImg.do',

		processData : false,
		type : "post",
		data : txt,
		dataType : "text",

		success : function(result) {
			 //alert("사용자 이미지가 성공적으로 넘어옴 = 	"+result);
				result1=result;
				
			 $(".img"+member_id).attr('src',result);
		},
		error : function(result) {

			alert("사용자 이미지주소 가저오기 실패");
		}
	});
	//alert("보내기전 이미지값 ="+result1);
	return result1;
}



function washrp(result) {
	//이미지 링크 수정해야됨
	
	document.getElementById("rp_cnt").innerHTML = result.length;   
	 $("#rplist").html("");
	for(var i=0; i<result.length; i++) {
		
    $("#rplist").append("<tr><td width='5%'><img width='30px' height='30px' src class='img"+result[i].member_id+"'>"+"</td><td width='5%'>"+result[i].member_id+"  </td><td style='max-width:10%;' width='60%'>"+result[i].r_content +"</td><td width='10%'>"+result[i].r_datetime+ "</td></tr>");
    getMemberImg(result[i].member_id);
	}
 }

</script>


<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>	




<body>

<table width="100%" border="1" cellspacing="0" cellpadding="10">

<tr>
<td style="float:right;">[<a href="#">가족여행</a>]</td>
<td width="50%"><strong>${requestScope.posting.p_title}</strong></td>
<td><a href="/wheremasil/board/review.do">목록보기</a></td>
<td><a href="/wheremasil/board/postingVal.do?postring_id=${posting.posting_id -1} ">이전글보기</a></td>
<td><a href="/wheremasil/board/postingVal.do?postring_id=${posting.posting_id +1} ">다음글보기</a></td>


</tr>







</table>

<table border="1" width="100%">
<tr>
<td width="" style="font-size: 10pt">글번호: ${requestScope.posting.p_number }</td>
<td width="" style="font-size: 10pt">글쓴이 : ${requestScope.posting.member_id }</td>
<td width="" style="font-size: 10pt">조회수 : ${requestScope.posting.p_hits }</td>
<td width="" style="font-size: 10pt">추천수 : ${requestScope.posting.p_like }</td>
<td width="" style="font-size: 10pt">올린시간 : ${requestScope.posting.p_datetime }</td>
<td width="40%"></td>

</tr>


</table>
<table border="1" width="100%">
<tr>
<td style="min-height:500px;">
${requestScope.posting.p_content }
</td>


</tr>



</table>

<table border="1" width="100%">
<tr>
<td width="5%">댓글   <span id="rp_cnt"></span>  </td>
<td width="5%"><a href="#" id="button" >▼</a></td>
<td width="60%" > </td>
<td width="10%"> <a href="#" id="like">   추천하기</a></td>
<td width="10%"> 관심여행등록</td>

</table>

<table border="1" width="100%" id="rplist">


</table>

<table border="1" width="100%">
<tr>
<td width="80%"><textarea id="rpcontext" onchange="resize(this)" style="width:100%; overflow:visible;"></textarea> </td>
<td style="text-align:center; margin:auto;"  ><form action="#">
<input type="hidden" id="member_id" value="${requestScope.posting.member_id}"/>
<input type="hidden" id="posting_id" value="${requestScope.posting.posting_id}"/>
<input type="hidden" id="member_id1" value="${sessionScope.login_info.member_id}"/>

<!-- reply_id,r_parent_id,r_datetime,r_level,postring_id,member_id  -->

<input type="button" value="리플등록" id="rpregi">

</form>  </td>


</table>


</body>
</html>