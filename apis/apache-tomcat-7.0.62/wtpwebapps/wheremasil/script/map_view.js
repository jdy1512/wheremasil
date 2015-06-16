function getPlanMapList(planIdList, mapContainerId, mapViewClassName) {
	// plan 정보 select
	$.ajax({
		url: "/wheremasil/plan/getPlanMapList.do",
		dataType: "json",
		type: "POST",
        timeout : 30000, 
		data: {"planIdList": $.param({ "planIdList": planIdList }, true)},
		success: function(data) {
			var curPlanId = "wheremasil";
			var planCnt = 0;
			
			var map;
			var bounds;
			var schedulePath;
			var polyline;
			for (var idx = 0; idx < data.length; idx++) {
				// planid 변경되는 시점 (새로운 map)
				if (curPlanId != data[idx].planId) {
					if (idx != 0) {
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
					}
					curPlanId = data[idx].planId;
					planCnt = planCnt + 1;

					var oriSDate = data[idx].startDate;
					var year = oriSDate.substring(0, 4);
					var month = oriSDate.substring(4, 6);
					var day = oriSDate.substring(6, 8);
					var newSDate = year + "." + month + "." + day;
					
					var oriEDate = data[idx].endDate;
					year = oriEDate.substring(0, 4);
					month = oriEDate.substring(4, 6);
					day = oriEDate.substring(6, 8);
					var newEDate = year + "." + month + "." + day;
					
					$("#" + mapContainerId + planCnt).attr("href", "/wheremasil/plan/getSchedule.do?plan_id=" + curPlanId);
					$("#" + mapContainerId + planCnt).attr("class", mapViewClassName);
					$("#" + mapContainerId + planCnt).html('<div id="plan_' + curPlanId + '" style="width:100%;height:100%;"></div>' + 
						'<div style="text-align:center;"><p><font size=5 color="black">' + data[idx].title + '</font><br><img src="/wheremasil/uploads/images/icon/Black_user_shape_24.png"><b><font size=4 color="black">' + data[idx].mName + '</b></p></font>' + 
						'<h5><p><b>' + newSDate + ' ~ ' + newEDate + '</b></p></h5></div>');
					
					// map draw
					var mapContainer = document.getElementById("plan_" + curPlanId), // 지도를 표시할 div
				    mapOption = { 
				        center: new daum.maps.LatLng(data[idx].aLatitude, data[idx].aLongitude), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };
					// 지도를 표시할 div와  지도 옵션으로  지도를 생성
					map = new daum.maps.Map(mapContainer, mapOption);
					map.addOverlayMapTypeId(daum.maps.MapTypeId.TERRAIN);
					bounds = map.getBounds();
					schedulePath = [];
					polyline = new daum.maps.Polyline();
				}
				
				var latLng = new daum.maps.LatLng(data[idx].aLatitude, data[idx].aLongitude);
				bounds.extend(latLng);
	    		schedulePath.push(latLng);

				if (idx == data.length - 1) {
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
				}
			}// end of for
		}// end of success(getPlanMapList)
	});// end of getPlanMapList(ajax)
}