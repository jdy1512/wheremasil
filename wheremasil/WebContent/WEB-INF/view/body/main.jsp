<%@ page contentType="text/html; charset=UTF-8"%>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">

<script> 

	function fn_layer_popup(){ 
		var layer = document.getElementById("popup_layer"); 
		layer.style.visibility="visible"; //반대는 hidden 
	
	}

	$(function(){
		$("#stDate").datepicker();
	});
	$(function(){
		$("#edDate").datepicker();
	});
</script> 

<div id="popup_layer" 
	style="position:absolute; 
	top:30%; 
	border:double; 
	width:60%; 
	height:60%; 
	z-index:1; 
	visibility:hidden;
	background-color:white; 
	"> 
	<form action="/wheremasil/plan/map.do" method="post">
	플래너명 <input type="text" name="title" style=height:50%><br>
	여행일정<br>
	     시작일:<input type="text" id="stDate" name="startDate" ><br>
	     마감일:<input type="text" id="edDate" name="endDate"><br>
	인원 <select id="groupNum" name="groupNum">
		 <option value="">인원수 선택</option>
		 <%for(int i=1;i<=100;i++){ %>
		 <option value="<%=i%>"><%=i+"명"%></option>
		 <%} %>
		</select><br>
	테마 <select id="theme" name="theme">
		  <option value="">테마선택</option>
		  <option value="t1">배낭여행</option>
		  <option value="t2">우정여행</option>
		  <option value="t3">가족여행</option>
		  <option value="t4">커플여행</option>
		  <option value="t5">부모님여행</option>
	</select>
	<br>
	<input type="submit" value="전송">
	
	</form>
	<br>
</div> 

<input type="button" value="플랜만들기" onclick="fn_layer_popup()"> 

	
