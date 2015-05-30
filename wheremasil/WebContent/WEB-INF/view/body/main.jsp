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
	플래너명 <input type="text" name="title" style=height:50%>
	여행일정
	     시작일:<input type="text" id="stDate" name="startDate" >
	     마감일:<input type="text" id="edDate" name="endDate">
	인원 
	테마
	
	<input type="submit" value="전송">
	
	</form>
	<br>
</div> 

<input type="button" value="플랜만들기" onclick="fn_layer_popup()"> 

	
