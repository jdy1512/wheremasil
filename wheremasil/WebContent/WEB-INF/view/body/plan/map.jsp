<%@ page contentType="text/html; charset=UTF-8" %>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=8090c845eb21bcc92becc6f8f3bf61fa&libraries=services"></script>
<script type="text/javascript">
	$(function() {
		// 스타일시트 변경
		$("#tile_left_nav").css("visibility", "visible");
		$("#tile_right_nav").css("visibility", "visible");
		$("nav").css("width", "18%");
		$("section").css("width", "64%");
		
		//alert("${requestScope.plan}");
		
		// daum api 지도
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	    	center: new daum.maps.LatLng(37.31656, 127.58942), // 지도의 중심좌표
	    	level: 11, // 지도의 확대 레벨
	    	mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
	    }; 
		// 지도를 생성한다 
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		
		// 지도 타입변경 (체크박스)
		// 지도 타입 정보를 가지고 있을 객체
		var mapTypes = {
		    terrain : daum.maps.MapTypeId.TERRAIN,    
		    traffic :  daum.maps.MapTypeId.TRAFFIC,
		    bicycle : daum.maps.MapTypeId.BICYCLE
		};
		map.addOverlayMapTypeId(mapTypes.terrain);
		$("input:checkbox").on("click", function() {
			// 지도 타입을 제거합니다
		    for (var type in mapTypes) {
		        map.removeOverlayMapTypeId(mapTypes[type]);    
		    }
		    // 지형정보 체크박스가 체크되어있으면 지도에 지형정보 지도타입을 추가합니다
			if ($("input:checkbox[id='chkTerrain']").is(":checked"))
		        map.addOverlayMapTypeId(mapTypes.terrain); 
		    // 교통정보 체크박스가 체크되어있으면 지도에 교통정보 지도타입을 추가합니다
			if ($("input:checkbox[id='chkTraffic']").is(":checked"))
		        map.addOverlayMapTypeId(mapTypes.traffic);
		    // 자전거도로정보 체크박스가 체크되어있으면 지도에 자전거도로정보 지도타입을 추가합니다
			if ($("input:checkbox[id='chkBicycle']").is(":checked"))
		        map.addOverlayMapTypeId(mapTypes.bicycle);
		});
		
		// 검색 라이브러리 (daum api)
		// 마커를 담을 배열입니다
		var markers = [];
		// 장소 검색 객체를 생성합니다
		var ps = new daum.maps.services.Places();
		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({zIndex:1});
		// 키워드로 장소를 검색합니다
		searchPlaces();
		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {
		    var keyword = document.getElementById('keyword').value;

		    if (!keyword.replace(/^\s+|\s+$/g, '')) {
		        alert('키워드를 입력해주세요!');
		        return false;
		    }

		    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		    ps.keywordSearch( keyword, placesSearchCB); 
		}
		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(status, data, pagination) {
		    if (status === daum.maps.services.Status.OK) {
		        // 정상적으로 검색이 완료됐으면
		        // 검색 목록과 마커를 표출합니다
		        displayPlaces(data.places);

		        // 페이지 번호를 표출합니다
		        displayPagination(pagination);

		    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

		        alert('검색 결과가 존재하지 않습니다.');
		        return;

		    } else if (status === daum.maps.services.Status.ERROR) {

		        alert('검색 결과 중 오류가 발생했습니다.');
		        return;

		    }
		}
		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {
			// 오버레이 뷰 height 재설정을 위한 값
			var totalHeight=0;
		    var listEl = document.getElementById('placesList'), 
		    menuEl = document.getElementById('menu_wrap'),
		    fragment = document.createDocumentFragment(), 
		    bounds = new daum.maps.LatLngBounds(), 
		    listStr = '';
		    
		    // 검색 결과 목록에 추가된 항목들을 제거합니다
		    removeAllChildNods(listEl);

		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
		    
		    for ( var i=0; i<places.length; i++ ) {

		        // 마커를 생성하고 지도에 표시합니다
		        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
		            marker = addMarker(placePosition, i), 
		            itemEl = getListItem(i, places[i], marker); // 검색 결과 항목 Element를 생성합니다

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        bounds.extend(placePosition);

		        // 마커와 검색결과 항목에 mouseover 했을때
		        // 해당 장소에 인포윈도우에 장소명을 표시합니다
		        // mouseout 했을 때는 인포윈도우를 닫습니다
		        (function(marker, title, addr) {
		            daum.maps.event.addListener(marker, 'mouseover', function() {
		                displayInfowindow(marker, title, addr);
		            });

		            daum.maps.event.addListener(marker, 'mouseout', function() {
		                infowindow.close();
		            });

		            itemEl.onmouseover =  function () {
		    		    map.panTo(marker.getPosition());
		                displayInfowindow(marker, title, addr);
		            };

		            itemEl.onmouseout =  function () {
		                infowindow.close();
		            };
		        })(marker, places[i].title, places[i].address);

		        fragment.appendChild(itemEl);
		        
		        totalHeight += 110;
		    }

		    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
		    listEl.appendChild(fragment);
		    menuEl.scrollTop = 0;

		    totalHeight += 60;
		    $("#menu_wrap").css("height", totalHeight + "px");

		    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		    //map.setBounds(bounds);
		    //map.panTo(placePosition);
		}
		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

		    var el = document.createElement('li'),
		    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
		                '<div class="info">' +
		                '   <h5>' + places.title + '</h5>';
		
		    if (places.newAddress) {
		        itemStr += '    <span>' + places.newAddress + '</span>' +
		                    '   <span class="jibun gray">' +  places.address  + '</span>';
		    } else {
		        itemStr += '    <span>' +  places.address  + '</span>'; 
		    }
		                 
		      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
		                '</div>';           
		
		    el.innerHTML = itemStr;
		    el.className = 'item';
		
		    return el;
		}
		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
		    var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
		            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new daum.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });

		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

		    return marker;
		}
		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}
		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
		    var paginationEl = document.getElementById('pagination'),
		        fragment = document.createDocumentFragment(),
		        i; 

		    // 기존에 추가된 페이지번호를 삭제합니다
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
		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title, addr) {
		    var content = '<div style="max-width:300px"><div style="width:32%;float:left;margin:1%"><img src="/wheremasil/uploads/images/no-photo.png" style="width:100%"></div><div style="width:64%;float:right;margin:1%"><p style="width:90%margin:5%;padding-top:15px;text-align:center"><b>' + title + '</b></p><p style="width:90%;margin:5%;padding-top:5%;text-align:center">' + addr + '</p></div></div>';

		    infowindow.setContent(content);
		    infowindow.open(map, marker);
		}
		 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {   
		    while (el.hasChildNodes()) {
		        el.removeChild (el.lastChild);
		    }
		}
		
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
	});// end of onload
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
			<input type="text" value="KOSTA" id="keyword" size="15"> 
			<input type="button" id="menu_search" value="검색">
			<input type="button" id="menu_more" value="접기" >
		</div>
		<hr>
		<ul id="placesList"></ul>
		<div id="pagination"></div>
	</div>
</div>