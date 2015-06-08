<%@ page contentType="text/html; charset=UTF-8"%>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->

<link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.4/cosmo/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<script> 
	$(function() {
		$("header").css("background-color", "none");
		$(".left_nav").css("width", "0px");
		$(".right_nav").css("width", "0px");
		

		$("#cancel").on("click", function() {
			$("#popup_layer").css("visibility", "hidden");
		});
		

		$("#stDate").datepicker({
			dateFormat: 'yymmdd'
		});
		$("#edDate").datepicker({
			dateFormat: 'yymmdd'
		});
	});

	function fn_layer_popup(){ 
		var layer = document.getElementById("popup_layer"); 
		layer.style.visibility="visible"; //반대는 hidden 
	
	}
</script> 

<div id="popup_layer" 
	style="position:absolute; 
	top:50%; 
	left:50%;
	border-radius:0.4em;
	width:30%;
	height:46%;
	margin-left:-15%;
	margin-top:-20%;
	z-index:1; 
	visibility:hidden;
	background-color:#f5f5f5; 
	padding: 10px;
	"> 
	<form action="/wheremasil/plan/map.do" method="post">
	    <p><h1>플래너 작성</h1></p>
	    <fieldset>
	    	<legend>여행 일정</legend>
	        <p>플래너명 : <input type="text" id="title" name="title" placeholder="여행 계획 명" autofocus required></p>
	        <p>테마 : <select id="theme" name="theme" required>
				<option value="">테마선택</option>
				<option value="T1">배낭여행</option>
				<option value="T2">우정여행</option>
				<option value="T3">가족여행</option>
				<option value="T4">커플여행</option>
				<option value="T5">부모님여행</option>
			</select></p>
			<p>인원 : <select id="groupNum" name="groupNum" required>
				<option value="">인원수 선택</option>
				<%for(int i=1;i<=100;i++){ %>
					<option value="<%=i%>"><%=i+"명"%></option>
				<%} %>
			</select></p>
	    	<p>시작일 : <input type="text" id="stDate" name="startDate" placeholder="여행 시작 날짜" required></p>
	    	<p>종료일 : <input type="text" id="edDate" name="endDate" placeholder="여행 종료 날짜" required></p>
	    </fieldset>
	    <fieldset>
	    	<input type="submit" value="작성 시작">
	    	<input type="reset" id="cancel" value="취소">
	    </fieldset>
	</form>
</div> 

<div>
	<div class="main_center">
		<p style="text-align:center"><font size="200%" color="white"><b>Where are you going ?</b></font></p>

		<div style="text-align:center">
			<h4><font color="white">지금 당장! 어디 마실 나가고 싶다면?</font></h4>
		</div>
		<div style="position:absolute;left:48%;top:60%;width:200px;height:60px;overflow:hidden;margin-left:-50px;margin-top:-30px">
			<input type="button" class="btn btn-warning btn-lg"  value="START" onclick="fn_layer_popup()"> 
		</div>
	</div>
	
	<video id="videobcg" preload="auto" autoplay="true" loop="loop" muted="muted">
		<source src="https://a0.muscache.com/airbnb/static/Seoul-P1-4.mp4" type="video/mp4">
		<source src="https://a0.muscache.com/airbnb/static/Seoul-P1-4.webm" type="video/webm">
			Sorry, your browser does not support HTML5 video.
	</video>
</div>
