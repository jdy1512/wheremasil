<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=8090c845eb21bcc92becc6f8f3bf61fa"></script>
</head>
<body>
	<div id="map" style="width:750px;height:350px;"></div><br/><br/>
	
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(37.56656, 126.97942), // 지도의 중심좌표
		        level: 3, // 지도의 확대 레벨
		        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new daum.maps.Map(mapContainer, mapOption); 

	</script>
</body>
</html>