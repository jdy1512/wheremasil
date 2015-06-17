<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%> 
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>





<script type="text/javascript">
$(document).ready(function(){
	$("#delete").on("click",function(){
		if (confirm("정말 삭제하시겠습니까??") == true){   
		   deletePost($(this).attr("name"));
		}else{   
		    return;
		}
	});

	$("#modi").on("click",function(){
		if (confirm("수정 합니까??") == true){   
		   location.href="/wheremasil/board/modiReveiw.do?posting_id="+$(this).attr("name");
		}else{   
		    return;
		}
	});
	
	
	
});





</script>

<script type="text/javascript">


function deletePost(posting_id){
	alert(posting_id);	
var txt = "posting_id" + "="+ posting_id;
	
	$.ajax({
   	    url: '/wheremasil/board/deletePost.do',
   	 type:"post",
   	    processData: false,
   	 
	    data:txt,
	    dataType:"text",
   	    
   	    success: function(result){
   	   
   	    	
   	    	alert("성공");
   	    	location.reload(true);
   	    	
   	    	
   	   
   	    },
   	    error:function(result){
   	    	
   	    	alert("삭제실패");
   	    }
   	});
	
	
	
}

function insertRpcnt(posting_id){
	var txt = "posting_id" + "="+ posting_id;
	
	$.ajax({
   	    url: '/wheremasil/board/insertRpcnt.do',
   	 type:"post",
   	    processData: false,
   	 
	    data:txt,
	    dataType:"text",
   	    
   	    success: function(result){
   	    //alert(	$(".relpy"+posting_id).val());//text("["+result+"]"));
   	    	
   	    	//alert("넘어온 리플수 : "+result);
   	    	
   	    	
   	    	  	    	
   	    	$(".relpy"+posting_id).text("["+result+"]");
   	    	
   	    	
   	   
   	    },
   	    error:function(result){
   	    	
   	    	alert("리플수업데이트 실패");
   	    }
   	});
	
	
}


function selHit(id){
	
	var txt = "posting_id" + "="+ id;
	
	$.ajax({
   	    url: '/wheremasil/board/selHit.do',
   	 type:"post",
   	    processData: false,
   	 
	    data:txt,
	    dataType:"JSON",
   	    
   	    success: function(result){
   	    	
   	    	
   	    	
   	    	
   	    	
   	    	document.getElementById("hits").innerHTML="바꼇슴다";

   	    	
   	    	
   	    	
   	    	
   	   
   	    },
   	    error:function(result){
   	    	alert(result);
   	    	alert("조회수 업데이트 실패");
   	    }
   	});

	
}


</script>

<script type="text/javascript">

$(document).ready(function(){
	$("#xx").on("click",function(){
		alert("버튼이벤트");
		 $.session.set("login_info", "value");
		alert("세션값확인");
		alert($.session.get("login_info"));
		
		
	});
	
	
	
});



</script>


<style type="text/css">
body{
margin-top: 100px;
}



#recent{
height: 100px;
vertical-align: top;

}
.line {
				width: 664px;
				height: 1px;
				overflow: hidden;
				background: url('#') repeat-x left top;
				margin-left: 12px;
			}


#lolMain { width: 70%;margin-left:3px; }
div, ul, ol, li, dl, dt, dd, h1, h2, h3, h4, h5, h6, form { float: left; display: inline; margin:0; padding:0; height: auto; }
#powerbbsBody { width: 80%; margin-left: 3px; float: left; display: inline; clear: both; }
body, input, select, textarea, a, th, td, caption, h1, h2, h3, h4, h5, h6  { font-family: gulim, Helvetica; font-size: 12px; color: #000; font-weight: normal; letter-spacing: 0px; font-style: normal; text-decoration: none; }
 
 #gSeries DIV,
	#gSeries TABLE,
	#gSeries SELECT,
	#gSeries TEXTAREA,
	#gSeries LABEL,
	#gSeries DL,
	#gSeries DT,
	#gSeries DD,
	#gSeries UL,
	#gSeries LI,
	#gSeries H1,
	#gSeries H2,
	#gSeries H3,
	#gSeries H4,
	#gSeries H5 {
		font-family:gulim;
		font-size: 9pt;
		text-align: left;
		margin: 0px;
		padding: 0px;
	}
	
	
 #gSeries {
		display: inline;
		float: left;
		clear: both;
		width: 70%;
		margin-top: 10px;
	}
	
	
	#gSeries DIV,
	#gSeries TABLE,
	#gSeries SELECT,
	#gSeries TEXTAREA,
	#gSeries LABEL,
	#gSeries DL,
	#gSeries DT,
	#gSeries DD,
	#gSeries UL,
	#gSeries LI {
		display: inline;
		float: left;
	}
	
	.list .wrap.middle {
		background: url('http://thimg.todayhumor.co.kr/upfile/201506/1433308079vFI6mUeq.gif') repeat-y left top;
	}
	.list .wrap {
		width: 100%;
		margin-left: 0px;
	}
	
	UL.list {
				padding: 0 10px;
				margin-top: -15px;
			}
			
			.one {
				width: 172px;
				_height: 182px;
				min-height: 182px;
				padding-bottom: 20px;
				margin-top: 20px;
			}
 
 
 </style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Insert title here</title>
</head>
<body>




 




<div id="lolBody" style="top-padding:10px;">
<div id="lolmain">
<div id="powerbbsBody">
<table border="1" width="" cellpadding="10">

<tr><td width="910px" style="text-align:right;"><a href="/wheremasil/board/reivew/writer.do">
<c:if test="${sessionScope.login_info !=null }">
여행리뷰등록


</c:if>

</a>
<c:if test="${sessionScope.login_info ==null }">
로그인후 글쓰기 가능

</c:if> 
</td>


<td  width="300px"style="text-align:center;">최근인기게시물 </td> 

</tr>

</table>
<table border="1" width="" cellpadding="10">
<!-- <tr>

  <td width="700px" style="text-align:right;"><a href="/wheremasil/board/reivew/writer.do">여행리뷰등록</a></td>
<td  width="300px"  style="text-align:center;">최근인기게시물 </td> 

</tr> -->
<!-- <tbody> -->


<tr>
<td width="900px">
<div class="gSeries">
<div class="list">
<div class="wrap middle">



<ul class="list" style="width:100%;">




<c:if test="${fn:length(requestScope.board_list) != 0 }">
<c:forEach items="${requestScope.board_list }" var="board">
			
	<li class="one" >

	<div style="margin-left: 14px;" >

		<div style="
		margin-left: 10px;
		font-size: 9pt;
		text-align: left;
		margin: 0px;
		padding: 0px;
		display: inline;
		float: left;
		color: rgb(0, 112, 221); letter-spacing: -1px; padding-top: 4px; font-weight: bold; margin-left: 5px; display: inline;
		float: left;
		height:auto;
		
		">[일반]</div>
		</div>
		<br>
		<ul class="gray" type="none"  style="
		background-color: white;
				border: 1px solid #E3E3E3;
				margin: 0 14px;
				display: inline;
		float: left;
		height:182px;
		
		" >
			<li class="black">
				<a href="/wheremasil/board//postingVal.do?postring_id=${board.posting_id}"><img class="thumb" src="${board.p_img_path}" width="119px" height="83px"></a>
			</li>
			<li class="desc">
				<span class="dotLine" style="
				display: inline;
				float: left;
				width: 135px;
				height: 8px;
				overflow: hidden;
				background: url('http://img.inven.co.kr/image/board/bbs/skin/GALLERY_serise/dot_line.gif') no-repeat center top;
				margin-top: 5px;"></span>
				<h4 class="subject" style="clear: both;
				width: 123px;
				_height: 52px;
				min-height: 52px;
				/*overflow: hidden;*/
				overflow-x: hidden;
				margin: 0 6px;"><a href="/wheremasil/board//postingVal.do?postring_id=${board.posting_id}">${board.p_title }</a>&nbsp;&nbsp;<span ><span style="color: rgb(37, 113, 10); letter-spacing: -1px; font-size: 11px; font-weight: bold;" id="hits" > <a href="/wheremasil/board//postingVal.do?postring_id=${board.posting_id}" name="relpy${board.posting_id}">댓글자리</a></span></span></h4>
				 <c:if test="${sessionScope.login_info.member_id ==board.member_id}">
				<a href="#" id="delete" name="${board.posting_id}">삭제</a>
				
				</c:if>
				 <c:if test="${sessionScope.login_info.member_id ==board.member_id}">
				<a href="#" id="modi" name="${board.posting_id}">수정</a>
				
				</c:if>  
				
				<span class="div" style="margin-top: 5px; margin-left: 5px;"><span style="cursor: pointer;">${board.member_id}</span>
</span>				<div class="hitreq">
	


											<span class="hitnum">조회수<em>${board.p_hits }</em></span>
																<span class="reqnum">추천 <em class="red">${board.p_like}</em></span>
									</div>
				<div style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
			</li>
		</ul>
	</li>
	<script type="text/javascript">
	insertRpcnt("${board.posting_id}");
	</script>
		</c:forEach>
		
</c:if>






	
	
	
	
	
	
	
	</ul>
	
	
	
	</div>
	</div>
	</div>
	</td>
	<td width="300px">
	
	<table>

<c:forEach items="${requestScope.like_list }" var="like" begin="0" end="4" step="1">

	
<a href="/wheremasil/board//postingVal.do?postring_id=${like.posting_id}"><font size="5">${like.p_title}</font></a>

</c:forEach>

	
	
	</table>
	
	
	
	</td>
	

	</tr>
	
	</tbody>
	
</table>
<table id="page" border="1" width="100%">
<tr>
<td style="text-align: center;">

<!-- 페이징 처리 -->
<!-- 이전 페이지 그룹 -->
<c:choose>
	<c:when test="${pagingBean.previousPageGroup }">
		<a href="/wheremasil/board/review.do?page=${pagingBean.startPageOfPageGroup-1}">◀</a>
	</c:when>
	<c:otherwise>
		◀
	</c:otherwise>
</c:choose>	
<!-- 페이지 번호 -->
<c:forEach begin="${pagingBean.startPageOfPageGroup }" end="${pagingBean.endPageOfPageGroup}" var="pageNum">
	<c:choose>
		<c:when test="${pageNum == pagingBean.currentPage }">
			<b>[${pageNum}]</b>
		</c:when>
		<c:otherwise>
			<a href="/wheremasil/board/review.do?page=${pageNum}">
				${pageNum}
			</a>
		</c:otherwise>
	</c:choose>
	&nbsp;&nbsp;
</c:forEach>
<!-- 다음 페이지 그룹 -->
<c:choose>
	<c:when test="${pagingBean.nextPageGroup }">
		<a href="/wheremasil/board/review.do?page=${pagingBean.endPageOfPageGroup+1}">▶</a>
	</c:when>
	<c:otherwise>
		▶
	</c:otherwise>
</c:choose>	


</td>
</tr>



</table>

</div>
</div>


































</div>


</body>
</html>