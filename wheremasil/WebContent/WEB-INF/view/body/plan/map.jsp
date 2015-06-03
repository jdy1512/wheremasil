<%@ page contentType="text/html; charset=UTF-8" %>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=8090c845eb21bcc92becc6f8f3bf61fa&libraries=services"></script>
<script type="text/javascript">
	var map;
	var bounds;
	// 마커를 담을 배열
	var markers = [];
	// 마커 타이틀을 담을 배열
	var markerTitles = [];
	// DB에서 검색된 지역 마커를 담을 배열
	var areaMarkers = [];
	// DB에서 검색된 지역 마커 타이틀을 담을 배열
	var areaMarkerTitles = [];
	// 지역 상세 데이타 뷰
	var infowindow;
	
	//TODO start of onload
	$(function() {
		// 스타일시트 변경
		$("header").css("background-color", "#a0c0d0");
		$("#tile_left_nav").css("visibility", "visible");
		$("#tile_right_nav").css("visibility", "visible");
		$("nav").css("width", "18%");
		$("section").css("width", "64%");
		
		// daum api 지도
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(37.3971644, 127.1081042), // 지도의 중심좌표
	        level: 11, // 지도의 확대 레벨
	        mapTypeId : daum.maps.MapTypeId.ROADMAP, // 지도종류
	    }; 
		// 지도를 생성한다 
		map = new daum.maps.Map(mapContainer, mapOption); 
		
		// 지도 뷰 범위를 생성한다
		bounds = new daum.maps.LatLngBounds();
		
		// 지도 타입변경 (체크박스)
		// 지도 타입 정보를 가지고 있을 객체
		var mapTypes = {
		    terrain : daum.maps.MapTypeId.TERRAIN,    
		    traffic :  daum.maps.MapTypeId.TRAFFIC,
		    bicycle : daum.maps.MapTypeId.BICYCLE
		};
		map.addOverlayMapTypeId(mapTypes.terrain);
		$("input:checkbox").on("click", function() {
			// 지도 타입을 제거
		    for (var type in mapTypes) {
		        map.removeOverlayMapTypeId(mapTypes[type]);    
		    }
		    // 지형정보 체크박스가 체크되어있으면 지도에 지형정보 지도타입을 추가
			if ($("input:checkbox[id='chkTerrain']").is(":checked"))
		        map.addOverlayMapTypeId(mapTypes.terrain); 
		    // 교통정보 체크박스가 체크되어있으면 지도에 교통정보 지도타입을 추가
			if ($("input:checkbox[id='chkTraffic']").is(":checked"))
		        map.addOverlayMapTypeId(mapTypes.traffic);
		    // 자전거도로정보 체크박스가 체크되어있으면 지도에 자전거도로정보 지도타입을 추가
			if ($("input:checkbox[id='chkBicycle']").is(":checked"))
		        map.addOverlayMapTypeId(mapTypes.bicycle);
		});
		
		// 검색 라이브러리 (daum api)
		// 장소 검색 객체를 생성
		var ps = new daum.maps.services.Places();
		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성
		infowindow = new daum.maps.InfoWindow({zIndex:1});
		// 검색창 접기
		$("#menu_wrap").css("height", "18px");
		 
		$("#keyword").on("keyup", function(e) {
			if (e.which == 13) {/* 13 == enter key@ascii */
				searchPlaces();
			}
		});
		$("#menu_search").on("click", function() {
			searchPlaces();
		});
		$("#menu_more").on("click", function() {
			if ($(this).val() == "펼치기") {
				$(this).val("접기");
				$("#menu_wrap").css("height", "auto");
			} else if ($(this).val() == "접기") {
				$(this).val("펼치기");
				$("#menu_wrap").css("height", "18px");
			}
		});
		$("#menu_remove").on("click", function() {
			$("#keyword").val("");
			$("#menu_more").val("펼치기");
			$("#menu_wrap").css("height", "18px");
		    var cList = document.getElementById("placesList");
		    var page = document.getElementById("pagination");
		    removeAllChildNods(cList);
		    while (page.hasChildNodes()) {
		    	page.removeChild (page.lastChild);
		    }
		    removeMarker();
            infowindow.close();
		    resetBounds();
		});
		
		getAreasByRange(map.getBounds());
		function getAreasByRange(bounds) {
			var swLatLng = bounds.getSouthWest();
			var neLatLng = bounds.getNorthEast();
			var stLat = swLatLng.getLat();
			var stLon = neLatLng.getLng();
			var enLat = neLatLng.getLat();
			var enLon = swLatLng.getLng();
			
			$.ajax({
	        	url: "/wheremasil/plan/getAreasByRange.do",
	        	dataType : "json",
	            type: "POST",
	            timeout : 30000, 
	        	data : {"stLat":stLat,"stLon":stLon,"enLat":enLat,"enLon":enLon},
	        	success: function(data) {
	        		removeAreaMarker();
	        		
	        		for ( var i = 0; i < data.length; i++ ) {
	    		        // 마커를 생성하고 지도에 표시
	    		        var placePosition = new daum.maps.LatLng(data[i].latitude, data[i].longitude),
	    		        	marker = addAreaMarker(placePosition, i, data[i].title, data[i].imgPath);

	    		        (function(marker, title, addr, img) {
	    		            daum.maps.event.addListener(marker, 'mouseover', function() {
	    		                infowindow.close();
	    		                displayInfowindow(marker, title, addr, img);
	    		            });
	    		        })(marker, data[i].title, data[i].address, data[i].imgPath);
	    		        
	    		        var content = '<div class="borderme"><div id="leftmenu_' +
	    		        	data[i].title + '" class="infoview_container"><div class="infoview_image_block"><img src="' + 
		        			data[i].imgPath + '" class="infoview_image"></div><div class="infoview_text_block"><p class="infoview_text_title"><b>' + 
		        			data[i].title + '</b></p><p class="infoview_text_content">' + 
		        			data[i].address + '</p></div></div></div>';
		        			
    		        	$("#left-container").append(content);
    		        	
    		        	$(document).on("click", "#leftmenu_" + data[i].title , function() {
    		        		var title = $(this).find(".infoview_text_title b").text();
    		        		for (var idx = 0; idx < areaMarkers.length; idx++) {
    		        			if (title == areaMarkers[idx].getTitle()) {
    		        				infowindow.open(map, areaMarkers[idx]);
    		        			}
    		        		}
    		                //displayInfowindow(marker, title, addr, img);
    					});
    		        	$(document).on("click", "#infowindow_" + data[i].title , function() {
    		        		var data = $($(this).parents().html()).last().val().split(",");
    		        		var title = data[0];
    		        		var img = data[1];
    		        		var addr = data[2];

    		        		var content = '<div class="infoview_container" style="width:230px;"><div class="infoview_image_block"><img src="' + 
    		        		img + '" class="infoview_image"></div><div class="infoview_text_block"><p class="infoview_text_title"><b>' + 
    				    	title + '</b></p><p class="infoview_text_content">' + 
    				    	addr + '</p></div></div>';

    		        		setSchedule(content);
    		    		});
	    		    }// end of for
	            }
			});
		}// end of getAreasByRange()
		
		// 지도 범위 설정
		function setBounds() {
			map.setBounds(bounds);
		}
		
		// 지도 범위 추가
		function extendsBounds(position) {
			bounds.extend(position);
		}
		
		// 지도 범위 리셋
		function resetBounds() {
			bounds = new daum.maps.LatLngBounds();
			for (var idx = 0; idx < areaMarkers.length; idx++) {
				extendsBounds(areaMarkers[idx].getPosition());
			}
			setBounds();
		}
		
		// DB지역 마커를 생성하고 지도 위에 마커를 표시하는 함수
		function addAreaMarker(position, idx, title, imageUrl) {
			var imageSrc = imageUrl,
			imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
	        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize),
	        marker = new daum.maps.Marker({
		    	position: position, // 마커의 위치
		    	image: markerImage,
		    	title: title
	        });
			var content = '<div class="title"><h3><b>' + title + '</b></h3></div>';
			var markerTitle = new daum.maps.CustomOverlay({
			    map: map,
			    position: position,
			    content: content,
			    yAnchor: 0
			});
			
		    marker.setMap(map); // 지도 위에 마커를 표출
		    areaMarkers.push(marker);  // 배열에 생성된 마커를 추가
		    areaMarkerTitles.push(markerTitle); // 배열에 생성된 마커오버레이를 추가
	
		    // 마커를 지도 뷰 범위에 추가
			extendsBounds(position);
	
		    return marker;
		}
		
		// 지도 위에 표시되고 있는 DB지역 마커와 오버레이를 모두 제거
		function removeAreaMarker() {
		    for ( var i = 0; i < areaMarkers.length; i++ ) {
		    	areaMarkers[i].setMap(null);
		    	areaMarkerTitles[i].setMap(null);
		    }
		    areaMarkers = [];
		    areaMarkerTitles = [];
		}
		
		//TODO start of daumAPI
		
		// 마커를 생성하고 지도 위에 마커를 표시하는 함수
		function addMarker(position, idx, title, imageUrl) {
			if (imageUrl == '') {
				var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지
		    	imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
		    	imgOptions =  {
		            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
		            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new daum.maps.Marker({
			            position: position, // 마커의 위치
			            image: markerImage,
			            title: title
		        	});
			} else {
				var imageSrc = imageUrl, // 마커 이미지가 있는경우
				imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
		        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize),
		            marker = new daum.maps.Marker({
			            position: position, // 마커의 위치
			            image: markerImage,
			            title: title
		        	});
			}
			var content = '<div class="title"><h3><b>' + title + '</b></h3></div>';
			var markerTitle = new daum.maps.CustomOverlay({
			    map: map,
			    position: position,
			    content: content,
			    yAnchor: 0
			});
			
		    marker.setMap(map); // 지도 위에 마커를 표출
		    markers.push(marker);  // 배열에 생성된 마커를 추가
		    markerTitles.push(markerTitle); // 배열에 생성된 마커오버레이를 추가
	
		    // 마커를 지도 뷰 범위에 추가
			extendsBounds(position);
	
		    return marker;
		}
		// 지도 위에 표시되고 있는 마커와 오버레이를 모두 제거
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		        markerTitles[i].setMap(null);
		    }
		    markers = [];
		    markerTitles = [];
		}
	
		// 키워드 검색을 요청하는 함수
		function searchPlaces() {
		    var keyword = document.getElementById('keyword').value;
	
		    if (!keyword.replace(/^\s+|\s+$/g, '')) {
		        alert('키워드를 입력해주세요!');
		        return false;
		    }
			$("#menu_more").val("접기");
	
		    // 장소검색 객체를 통해 키워드로 장소검색을 요청
		    ps.keywordSearch( keyword, placesSearchCB); 
		}
		// 장소검색이 완료됐을 때 호출되는 콜백함수
		function placesSearchCB(status, data, pagination) {
		    if (status === daum.maps.services.Status.OK) {
		        // 정상적으로 검색이 완료됐으면
		        // 검색 목록과 마커를 표출
		        displayPlaces(data.places);
	
		        // 페이지 번호를 표출
		        displayPagination(pagination);
	
		    } else if (status === daum.maps.services.Status.ZERO_RESULT) {
	
		        alert('검색 결과가 존재하지 않습니다.');
		        return;
	
		    } else if (status === daum.maps.services.Status.ERROR) {
	
		        alert('검색 결과 중 오류가 발생했습니다.');
		        return;
	
		    }
		}
		// 검색 결과 목록과 마커를 표출하는 함수
		function displayPlaces(places) {
			// 오버레이 뷰 height 재설정을 위한 값
			var totalHeight=0;
		    var listEl = document.getElementById('placesList'), 
		    menuEl = document.getElementById('menu_wrap'),
		    fragment = document.createDocumentFragment(), 
		    listStr = '';
		    
		    // 검색 결과 목록에 추가된 항목들을 제거
		    removeAllChildNods(listEl);
	
		    // 지도에 표시되고 있는 마커를 제거
		    removeMarker();
		    
		    for ( var i=0; i<places.length; i++ ) {
	
		        // 마커를 생성하고 지도에 표시
		        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
		            marker = addMarker(placePosition, i, places[i].title, places[i].imageUrl), 
		            itemEl = getListItem(i, places[i], marker); // 검색 결과 항목 Element를 생성

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가
	
		        // 마커와 검색결과 항목에 mouseover 했을때
		        // 해당 장소에 인포윈도우에 장소명을 표시
		        // mouseout 했을 때는 인포윈도우를 닫음
		        (function(marker, title, addr, img) {
		            daum.maps.event.addListener(marker, 'mouseover', function() {
		                infowindow.close();
		                displayInfowindow(marker, title, addr, img);
		            });
	
		            daum.maps.event.addListener(marker, 'click', function() {
		    		    map.panTo(marker.getPosition());
		                map.setLevel(7);
		            });
		            
		            itemEl.onmouseover =  function () {
		                infowindow.close();
		                displayInfowindow(marker, title, addr, img);
		            };
		            
		            itemEl.onmouseup =  function () {
		    		    map.panTo(marker.getPosition());
		                map.setLevel(7);
		            };
		        })(marker, places[i].title, places[i].address, places[i].imageUrl);
	
		        fragment.appendChild(itemEl);
		        
		        totalHeight += 110;
			    
	        	$(document).on("click", "#infowindow_" + places[i].title , function() {
	        		var data = $($(this).parents().html()).last().val().split(",");
	        		var title = data[0];
	        		var img = data[1];
	        		var addr = data[2];

	        		var content = '<div class="infoview_container" style="width:230px;"><div class="infoview_image_block"><img src="' + 
	        		img + '" class="infoview_image"></div><div class="infoview_text_block"><p class="infoview_text_title"><b>' + 
			    	title + '</b></p><p class="infoview_text_content">' + 
			    	addr + '</p></div></div>';

	        		setSchedule(content);
	    		});
		    }
	
		    // 검색결과 항목들을 검색결과 목록 Element에 추가
		    listEl.appendChild(fragment);
		    menuEl.scrollTop = 0;
	
		    totalHeight += 60;
		    $("#menu_wrap").css("height", totalHeight + "px");
	
		    // 검색된 장소 위치를 기준으로 지도 범위를 재설정
		    setBounds();
		}
		// 검색결과 항목을 Element로 반환하는 함수
		function getListItem(index, places) {
	
		    var el = document.createElement('li');
		    if (places.imageUrl != '') {
			    var itemStr = '<span style="margin-top:5%;margin-bottom:5%;width:32%;height:100%;float:left"><img src="' + places.imageUrl + '" style="width:100%;"></span>' +
		            '<div style="width:64%;float:right;margin:1%"><p style="width:90%margin:5%;padding-top:15px;text-align:center"><b>' +
		            places.title + '</b></p><p style="width:90%;margin:5%;text-align:center">';
			    itemStr += places.address  + '</p></div></div>'; 
		    } else {
				var itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
			    	'<div class="info">' +
			    	'   <h5>' + places.title + '</h5>';
				itemStr += '    <span>' +  places.address  + '</span>';
		    }
		                 
		    el.innerHTML = itemStr;
		    el.className = 'item';
		
		    return el;
		}
		// 검색결과 목록 하단에 페이지번호를 표시는 함수
		function displayPagination(pagination) {
		    var paginationEl = document.getElementById('pagination'),
		        fragment = document.createDocumentFragment(),
		        i; 
	
		    // 기존에 추가된 페이지번호를 삭제
		    while (paginationEl.hasChildNodes()) {
		        paginationEl.removeChild (paginationEl.lastChild);
		    }
	
		    for (i=1; i<=pagination.last; i++) {
		        var el = document.createElement('a');
		        el.href = "#";
		        el.innerHTML = i;
	
		        if (i===pagination.current) {
		            el.className = 'on';
		        } else {
		            el.onclick = (function(i) {
		                return function() {
		                    pagination.gotoPage(i);
		                }
		            })(i);
		        }
	
		        fragment.appendChild(el);
		    }
		    paginationEl.appendChild(fragment);
		}
		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수
		// 인포윈도우에 장소명을 표시
		function displayInfowindow(marker, title, addr, img) {
			var imageUrl = img;
			if (imageUrl == '') {
				imageUrl = "/wheremasil/uploads/images/area/img_not_found.png";
			}
			var data = {
				"title":title,
				"img":imageUrl,
				"addr":addr
			};
		    var content = '<div style="max-width:300px"><div style="width:32%;float:left;margin:1%"><img src="' + 
		    	imageUrl + '" style="width:100%;margin:5px;"></div><div style="width:64%;float:right;margin:1%"><p style="width:90%;margin:5%;text-align:center"><b>' + 
		    	title + '</b></p><p style="width:90%;margin-top:5%;margin-left:5%;margin-right:5%;text-align:center">' + 
		    	addr + '</p><div style="width:50%;margin-left:25%;margin-right:25%;padding-top:2%"><input type="button" class="plan_button" id="infowindow_' + 
		    	title + '" value="일정등록"><input type="hidden" value="' + 
		    	title + ',' + imageUrl + ',' + addr + '"></div></div>' +
		    	'<a href="javascript:void(0);" id="closeBt" class="close-thik"></a></div>';
		    	
		    infowindow.setContent(content);
		    infowindow.open(map, marker);
		}
		 // 검색결과 목록의 자식 Element를 제거하는 함수
		function removeAllChildNods(el) {   
		    while (el.hasChildNodes()) {
		        el.removeChild (el.lastChild);
		    }
		}
	

		
		// 동적 이벤트 -----------------------------------------------
		
		// 인포윈도우 닫기버튼 (x)
		$(document).on("click", "#closeBt", function() {
			infowindow.close();
		});
		
		//$(document).on("click", "#infowindow_" + title , function() {
    	//	alert(title + " 클릭");
    		//setSchedule(content);
		//});
		
		// 동적 이벤트 -----------------------------------------------
	});// end of onload
	//TODO end of onload

</script>

<div style="heigth:3%">
	<label><input type="checkbox" id="chkTerrain" checked="checked">지형정보 보기</label>
	<label><input type="checkbox" id="chkTraffic">교통정보 보기</label>
	<label><input type="checkbox" id="chkBicycle">자전거도로정보 보기</label>
</div>
<div class="map_wrap" style="width:99%; height:97%; margin:auto">
	<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

	<div id="menu_wrap" class="bg_white">
		<div class="option">
			<input type="text" value="" placeholder="검색어 입력" id="keyword" size="15"> 
			<input type="button" id="menu_search" value="검색">
			<input type="button" id="menu_more" value="펼치기" >
			<input type="button" id="menu_remove" value="지우기" >
		</div>
		<hr>
		<ul id="placesList"></ul>
		<div id="pagination"></div>
	</div>
</div>
