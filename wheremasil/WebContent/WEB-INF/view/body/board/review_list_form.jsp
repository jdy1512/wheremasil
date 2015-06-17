<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%> 
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Off Canvas Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="../../dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="offcanvas.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>





<script type="text/javascript">
$(document).ready(function(){
	$("#delete").on("click",function(){
		if (confirm("정말 삭제하시겠습니까??") == true){  
			//alert("이넘버"+$(this).attr("name"))
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
	//alert(posting_id);	
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
		//alert("버튼이벤트");
		 $.session.set("login_info", "value");
		//alert("세션값확인");
		//alert($.session.get("login_info"));
		
		
	});
	
	
	
});



</script>



    
     <link href="css/bootstrap.min.css" rel="stylesheet">
    
  </head>

  <body>


    <div class="container">

      <div class="row row-offcanvas row-offcanvas-right">

        <div class="col-xs-12 col-sm-9">
          <p class="pull-right visible-xs">
            <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
          </p>
          <div class="jumbotron" style="margin-top:25px;">
            <h1>어디마실</h1>
            <p>이 공간은 여러분의 여행 후기를 올리고 , 올린 게시물을 확인할수 있는 공간입니다.
            여러분들이 만드는 공간이니 서로를 생각하는 마음으로 사용해주세요. 
            </p>
          </div>
          <div class="row">
          <c:if test="${fn:length(requestScope.board_list) != 0 }">
<c:forEach items="${requestScope.board_list }" var="board">

            <div class="col-xs-6 col-lg-4" >
              <h2 style=" 
   float:left;          /* 개체들을 왼쪽으로 붙게 한다. */
   width:250px;         /* 넓이 길이를 제한할 길이 */
   height:1em;          /* 세로 길이를 제한할 길이 */
   overflow:hidden;        /* 칸이 넘어가면 자동으로 감추게 한다. */
   white-space:nowrap;        /* 길이보다 텍스트의 길이가 길경우 ... 으로 보여준다.*/
   text-overflow:ellipsis;  ">${board.p_title }</h2>
<img src="${board.p_img_path}"

class="alignright size-medium wp-image-3109" 
height="107	px" width="250px"
style="display: inline;"
align="left" hspace="5" vspace="5"/>
              <img src="data:image/jpeg;base64,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"
              
              width="50" height="25"
              /><font > ${board.p_like}</font>
              
              <span class="relpy${board.posting_id}" style=" float:right; color: rgb(37, 113, 10); letter-spacing: -1px; font-size: 15px; font-weight: bold;" > [60]</span><br>
              <a class="btn btn-default" href="/wheremasil/board//postingVal.do?postring_id=${board.posting_id}" role="button">View details &raquo;</a>
              
              
               <c:if test="${sessionScope.login_info.member_id ==board.member_id}"><button  id="modi" class="btn btn-success" name="${board.posting_id}">수정</button></c:if><c:if test="${sessionScope.login_info.member_id ==board.member_id}"><button class="btn btn-danger" id="delete" name="${board.posting_id}">삭제</button></c:if>
              
            </div><!--/.col-xs-6.col-lg-4-->
               <script type="text/javascript">
	insertRpcnt("${board.posting_id}");
	</script>
            </c:forEach>
            </c:if>
       
            
           
          </div><!--/row-->
        </div><!--/.col-xs-12.col-sm-9-->
         <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" style="padding-top: 25px;">
          
          
          <div class="list-group">
           <c:if test="${sessionScope.login_info==null}">
          <a href="#" class="list-group-item active">로그인후 글쓰기 가능</a>
          </c:if>
          
          <c:if test="${sessionScope.login_info!=null}">
          <a href="/wheremasil/board/reivew/writer.do" class="list-group-item active">글쓰기</a>
          </c:if>
          
          </div>
          </div>
        
    
       

        <div   class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" style="padding-top: 25px;">
          <div class="list-group">
            
           <p> 최근 인기 게시물</p>
           <c:forEach items="${requestScope.like_list }" var="like" begin="0" end="6" step="1">

	
<a href="/wheremasil/board//postingVal.do?postring_id=${like.posting_id}"  class="list-group-item"><font size="5">${like.p_title}</font></a>

</c:forEach>
            
          </div>
        </div><!--/.sidebar-offcanvas-->
      </div><!--/row-->
     
     <div style="padding-top: 25px;"></div>
 <table id="page" border="1"  style=" width: 100%;">
<tr >
<td style="text-align: center;" >

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
      <hr>

      <footer>
        <p>&copy; Company 2014</p>
      </footer>

    </div><!--/.container-->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

    <script src="offcanvas.js"></script>
  </body>

