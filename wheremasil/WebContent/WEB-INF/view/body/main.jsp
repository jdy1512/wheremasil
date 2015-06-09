<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script> 
	<c:if test="${ not empty requestScope.plan }">
		alert("${ requestScope.plan.title } + 등록 완료");
	</c:if>
	$(function() {
		$("header").css("background-color", "none");
		$(".left_nav").css("width", "0px");
		$(".right_nav").css("width", "0px");
		$("#bs-example-navbar-collapse-1").css("width", "1880px");
		

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
	height:50%;
	margin-left:-15%;
	margin-top:-20%;
	z-index:1; 
	visibility:hidden;
	background-color:#f5f5f5; 
	padding: 10px;
	">
		
	<div class="panel panel-warning">
	  <div class="panel-heading">
	    <h3 class="panel-title">여행계획짜기</h3>
	  </div>
	  <div class="panel-body">
		<form class="form-horizontal" action="/wheremasil/plan/map.do" method="post">
  	<fieldset>
    <legend>여행 일정</legend>
    <div class="form-group">
      <label for="inputTitle" class="col-lg-2 control-label">플래너명</label>
      <div class="col-lg-10">
	<input type="text" class="form-control" id="title" name="title" placeholder="여행 계획 명" autofocus required>
      </div>
    </div>
    <div class="form-group">
      <label for="select" class="col-lg-2 control-label">테마 </label>
      <div class="col-lg-10">
        <select class="form-control" id="theme" name="theme" required>
	<option value="">테마선택</option>
	<option value="T1">배낭여행</option>
	<option value="T2">우정여행</option>
	<option value="T3">가족여행</option>
	<option value="T4">커플여행</option>
	<option value="T5">부모님여행</option>
        </select>
        <br>
        <label for="select" class="col-lg-2 control-label">인원수 </label>
        <select class="form-control" id="groupNum" name="groupNum" required>
	<option value="">인원수 선택</option>
	<%for(int i=1;i<=100;i++){ %>
	<option value="<%=i%>"><%=i+"명"%></option>
	<%} %>
        </select>
      <div class="form-group">
      <label for="inputStDate" class="col-lg-2 control-label">시작일</label>
      <div class="col-lg-10">
        <input type="text" class="form-control" id="stDate" name="startDate" placeholder="여행 시작 날짜" required>
      </div>
     </div>
      <div class="form-group">
      <label for="inputendDate" class="col-lg-2 control-label">종료일</label>
      <div class="col-lg-10">
	<input type="text" class="form-control" id="edDate" name="endDate" placeholder="여행 종료 날짜" required>
      </div>
     </div>
      </div>
    </div>

    <div class="form-group">
      <div class="col-lg-10 col-lg-offset-2">
        <button type="reset" class="btn btn-default">Cancel</button>
        <button type="submit" class="btn btn-primary">Submit</button>
      </div>
    </div>
  </fieldset>
</form>
	  </div>
	</div> 
	
</div> 

<div>
	<div class="main_center">
		<p style="text-align:center"><font size="200%" color="white"><b>Where are you going ?</b></font></p>

		<div style="text-align:center">
			<h4><font color="white">지금 당장! 어디 마실 나가고 싶다면?</font></h4>
		</div>
		<div style="position:absolute;left:48%;top:60%;width:200px;height:60px;overflow:hidden;margin-left:-50px;margin-top:-30px">
			<input type="button" class="btn btn-warning btn-lg" value="START" onclick="fn_layer_popup()"> 
		</div>
	</div>
	
	<video id="videobcg" preload="auto" autoplay="true" loop="loop" muted="muted">
		<source src="https://a0.muscache.com/airbnb/static/Seoul-P1-4.mp4" type="video/mp4">
		<source src="https://a0.muscache.com/airbnb/static/Seoul-P1-4.webm" type="video/webm">
			Sorry, your browser does not support HTML5 video.
	</video>
</div>
