<%@ page contentType="text/html; charset=UTF-8" %>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=8090c845eb21bcc92becc6f8f3bf61fa&libraries=services"></script>

<script type="text/javascript">
	$(document).ready(function() {
		var jsonData = $.parseJSON('{"planDetailList":${requestScope.planDetailList}}');
		var data = jsonData.planDetailList;
		var content;
		var totalCost = 0;
		var writeFlg = false;
		
		var total_food = 0;
		var total_vehicle = 0;
		var total_stay = 0;
		var total_etc = 0;
		var total_cost = 0;

		
		// map
	    var mapContainer = document.getElementById('scheduleMap'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new daum.maps.LatLng(data[0].aLatitude, data[0].aLongitude), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성
		var map = new daum.maps.Map(mapContainer, mapOption);
		map.addOverlayMapTypeId(daum.maps.MapTypeId.TERRAIN);
		var bounds = map.getBounds();
		var schedulePath = [];
		var polyline = new daum.maps.Polyline();
		
		
		
		$("#tile_left_nav").css("visibility", "hidden");
		$("#tile_right_nav").css("visibility", "hidden");
		$(".left_nav").css("width", "0px");
		$(".right_nav").css("width", "0px");
		$("#schedule_startDate").text(data[0].startDate);
		$("#schedule_endDate").text(data[data.length - 1].endDate);

		$.each(data, function(idx) {
			if (data[idx].seq == "1") {
				if (writeFlg) {
					writeFlg = !writeFlg;
					content += '<div style="clear:both;"><p>' + data[idx].memo + '</p></div>' +
					'<hr style="margin:0 auto;padding:0 auto;"/><p>총 경비 : ' + totalCost + '원</p><hr style="margin:0 auto;padding:0 auto;"/></div>';
					$("#schedule_root").append(content);

					total_cost += parseInt(totalCost, 10);
					totalCost = 0;
				}
				writeFlg = !writeFlg;
				content = '<div class="schedule_container itembox day"><div style="padding-top:10px;">' +
					data[idx].curDate.substring(5) + '<hr style="margin-top:5px;margin-bottom:5px;"/></div>';
			}
			content += '<div style="width:96%;padding:2%;border-bottom: 1px solid #DDD;"><div class="infoview_image_block"><img src="' +
				data[idx].areaImagePath + '" class="infoview_image"></div><div class="infoview_text_block" style="margin-top:20px;"><p class="infoview_text_title"><b>' +
				data[idx].areaTitle + '</b></p><p class="infoview_text_content">' +
				data[idx].areaAddress + '</p></div>' +
				'<div style="clear:both;padding-top:10px;"><p>식비 : ' + data[idx].costFood+ ' , &nbsp;&nbsp;교통 : ' + data[idx].costVehicle+ '</p>' +
				'<p>숙박 : ' + data[idx].costStay+ ' , &nbsp;&nbsp;기타 : ' + data[idx].costEtc+ '</p></div>' +
				'</div>';
			totalCost += parseInt(data[idx].costFood, 10) + parseInt(data[idx].costVehicle, 10) + parseInt(data[idx].costStay, 10) + parseInt(data[idx].costEtc, 10);
			total_food += parseInt(data[idx].costFood, 10);
			total_vehicle += parseInt(data[idx].costVehicle, 10);
			total_stay += parseInt(data[idx].costStay, 10);
			total_etc += parseInt(data[idx].costEtc, 10);
			
			var latLng = new daum.maps.LatLng(data[idx].aLatitude, data[idx].aLongitude);
			bounds.extend(latLng);
    		schedulePath.push(latLng);
    		
    		
		});
		total_cost += parseInt(totalCost, 10);
		content += '<div style="clear:both;">' + data[data.length - 1].memo + '</div>' +
		'<hr style="margin:0 auto;padding:0 auto;"/><p>총 경비 : ' + totalCost + '원</p><hr style="margin:0 auto;padding:0 auto;"/></div>';
		$("#schedule_root").append(content);
		
		$("#total_food").text(total_food + "원");
		$("#total_vehicle").text(total_vehicle + "원");
		$("#total_stay").text(total_stay + "원");
		$("#total_etc").text(total_etc + "원");
		$("#total_cost").text(total_cost + "원");
		
		
		var slide_width = $("#schedule_root").children(":first").width();
		var slide_left = 120;
		var space = 5;
		
	    var slider = $("#schedule_root");
	    var slideArray = $("#schedule_root").children();
	    var slideMax = slideArray.length - 1;
	    var curSlideNo = 0;
	    for (i = 0; i <= slideMax; i++) {
	        if (i == curSlideNo) {
	        	slideArray[i].style.left = slide_left + "px";
	        } else {
	        	slideArray[i].style.left = (slide_left + ((slide_width + space) * i)) + "px";
	        }
	    }
	    
	    var aniStart = false;
	    var next = 1;
	    function sliding(targetX, endX, literal){
	        var newTargetX = targetX + literal;
	        
	        if (literal < 0 && newTargetX <= endX) {
	            curSlideNo++;
	        	for (i = 0; i <= slideMax; i++) {
	    	        if (i == curSlideNo) {
	    	        	slideArray[i].style.left = slide_left + "px";
	    	        } else if (i < curSlideNo) {
	    	        	slideArray[i].style.left = (slide_left - ((slide_width + space) * (curSlideNo - i))) + "px";
	    	        } else if (i > curSlideNo) {
	    	        	slideArray[i].style.left = (slide_left + ((slide_width + space) * (i - curSlideNo))) + "px";
	    	        }
	    	    }
	            aniStart = false;
	            return;
	        } else if (literal > 0 && newTargetX >= endX) {
	            curSlideNo--;
	        	for (i = 0; i <= slideMax; i++) {
	    	        if (i == curSlideNo) {
	    	        	slideArray[i].style.left = slide_left + "px";
	    	        } else if (i < curSlideNo) {
	    	        	slideArray[i].style.left = (slide_left - ((slide_width + space) * (curSlideNo - i))) + "px";
	    	        } else if (i > curSlideNo) {
	    	        	slideArray[i].style.left = (slide_left + ((slide_width + space) * (i - curSlideNo))) + "px";
	    	        }
	    	    }
	            aniStart = false;
	            return;
	        }
	    	for (i = 0; i <= slideMax; i++) {
		        slideArray[i].style.left = (parseInt(slideArray[i].style.left, 10) + literal) + "px";
	    	}
	        setTimeout(function () {
	            sliding(newTargetX, endX, literal);
	        }, 10);
	    }
	    
	    $(".slide_prev").on("click", function() {
	    	if (aniStart === true) return;
	        next = curSlideNo - 1;
	        if (next < 0) return;
	        aniStart = true;
	        var targetX = parseInt(slideArray[next].style.left, 10);
	        var endX = parseInt(slideArray[curSlideNo].style.left, 10);
	        sliding(targetX, endX, 30);
	    });
	    $(".slide_next").on("click", function() {
	    	if (aniStart === true) return;
	        next = curSlideNo + 1;
	        if (next > slideMax - 2) return;
	        aniStart = true;
	        var targetX = parseInt(slideArray[next].style.left, 10);
	        var endX = parseInt(slideArray[curSlideNo].style.left, 10);
	        sliding(targetX, endX, -30);
	    });
		
		map.setBounds(bounds);
		polyline = new daum.maps.Polyline({
			map: map,
			path: schedulePath,
			strokeWeight: 2, // 선의 두께
			strokeColor: '#FF0000', // 선 색
			strokeOpacity: 0.7, // 선 투명도
			strokeStyle: 'solid' // 선 스타일
		});
		polyline.setMap(map);

	});// end of ready
	
	window.onkeydown = function() {
		var kcode = event.keyCode;
		if(kcode == 8 || kcode == 116) event.returnValue = false;
	}
	
</script>

<div class="schedule_container">
	<div id="schedule_itembox" class="schedule_container itembox">
		<button class="slide_prev"></button>
		<div><h2><b id="schedule_startDate"></b><b>&nbsp;&nbsp;~&nbsp;&nbsp;</b><b id="schedule_endDate"></b></h2></div>
		<div id="schedule_root" class="schedule_container itembox root"></div>
		<button class="slide_next"></button>
	</div>
	<div class="schedule_container side">
		<div id="scheduleMap" class="schedule_container side map"></div>
		<div class="schedule_container side cost">
		<table class="type08" style="width:100%;">
		    <thead>
			    <tr>
			        <th colspan="4"><img src ="/wheremasil/uploads/images/icon/Check_box_32.png">여행경비정리</th>
			    </tr>
		    </thead>
		    <tbody>
			    <tr>
			        <th scope="row">식비</th>
			        <td><span id="total_food"></span></td>
			        <th scope="row">교통비</th>
			        <td><span id="total_vehicle"></span></td>
			    </tr>
			    <tr>
			        <th scope="row">숙박비</th>
			        <td><span id="total_stay"></span></td>
			        <th scope="row">기타</th>
			        <td><span id="total_etc"></span></td>
			    </tr>
			    <tr>
			        <th scope="row">총 금액</th>
			        <td colspan="3"><span id="total_cost"></span></td>
			    </tr>
		    </tbody>
		</table>
			<input type="button" class="submit_plan" value="완료" onClick="location.href='/wheremasil/index.do';" style="margin-top:10px;">
		</div>
	</div>
</div>
