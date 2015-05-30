<%@ page contentType="text/html; charset=UTF-8" %>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=8090c845eb21bcc92becc6f8f3bf61fa"></script>
<script type="text/javascript">
	<!-- tile control -->
	$(function() {
		$("#tile_left_nav").css("visibility", "visible");
		$("#tile_right_nav").css("visibility", "visible");
		$("nav").css("width", "18%");
		$("section").css("width", "64%");
		
		alert("${requestScope.plan}");
	});
	
</script>


<div id="map" style="width:99%; height:100%; margin:auto"></div>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(37.31656, 127.58942), // 지도의 중심좌표
	        level: 11, // 지도의 확대 레벨
	        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
	    }; 

	// 지도를 생성한다 
	var map = new daum.maps.Map(mapContainer, mapOption); 

</script>
