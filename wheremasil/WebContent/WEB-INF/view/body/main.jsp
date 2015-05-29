<%@ page contentType="text/html; charset=UTF-8"%>

<div id="popup_layer" 
	style="position:absolute; 
	border:double; 
	top:100px; 
	left:100px; 
	width:100px; 
	height:100px; 
	z-index:1; 
	visibility:hidden;
	background-color:white; 
	"> 내용
	<br>
	
<input type="button" value="닫기" onclick="fn_layer_popup()"> 
</div> 

<input type="button" value="click" onclick="fn_layer_popup()"> 

<script> 
function fn_layer_popup(){ 
	var layer = document.getElementById("popup_layer"); 
	layer.style.visibility="visible"; //반대는 hidden 
} 
</script> 


 
		<h2> - Where Masil - </h2>	
	
