<%@ page contentType="text/html; charset=UTF-8" %>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=8090c845eb21bcc92becc6f8f3bf61fa&libraries=services"></script>
<script type="text/javascript">
	var map;
	var bounds;
	// 지역명 리스트
	var titles = [];
	// 마커를 담을 배열
	var markers = [];
	// 마커 타이틀을 담을 배열
	var markerTitles = [];
	// DB에서 검색된 지역 마커를 담을 배열
	var areaMarkers = [];
	// DB에서 검색된 지역 마커 타이틀을 담을 배열
	var areaMarkerTitles = [];
	// 선택한 일정의 경로 리스트
	var schedulePath = [];
	var polyline = new daum.maps.Polyline();
	// 지역 상세 데이타 뷰
	var infowindow;
	// 지도 범위 재설정 딜레이 flg, time
	var delayFlg = false;
	var delayTime = 200; // 200ms, 0.2초
	
	//TODO start of onload
	$(function() {
		// 스타일시트 변경
		$("header").css("background-color", "none");
		$("#tile_left_nav").css("visibility", "visible");
		$("#tile_right_nav").css("visibility", "visible");
		$("section").css("width", "64%");
		$("section").css("height", "840px");
		
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
		$("#menu_wrap").css("height", "30px");
		 
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
				$("#menu_wrap").css("height", "30px");
			}
		});
		$("#menu_remove").on("click", function() {
			$("#keyword").val("");
			$("#menu_more").val("펼치기");
			$("#menu_wrap").css("height", "30px");
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
		
		// 지도가 이동, 확대, 축소로 인해 지도영역이 변경되면 마지막 파라미터로 넘어온 함수를 호출
		daum.maps.event.addListener(map, 'bounds_changed', function() {
			// delayFlg 기본값 false
			if (!delayFlg) {
				delayFlg = !delayFlg;
				// 범위 재설정
				getAreasByRange(map.getBounds());
				// 지연 기본값 0.2초 후, delayFlg 복구
				setTimeout(function() {
					delayFlg = !delayFlg;
				}, delayTime);
			}
		});
		daum.maps.event.addListener(map, 'click', function() {
			infowindow.close();
		});
		
		getAreasByRange(map.getBounds());
		function getAreasByRange(bounds) {
			infowindow.close();
			var swLatLng = bounds.getSouthWest();
			var neLatLng = bounds.getNorthEast();
			var stLat = swLatLng.getLat();
			var stLon = swLatLng.getLng();
			var enLat = neLatLng.getLat();
			var enLon = neLatLng.getLng();
			Pace.track(function(){
				Pace.start();
				$.ajax({
		        	url: "/wheremasil/plan/getAreasByRange.do",
		        	dataType : "json",
		            type: "POST",
		            timeout : 30000, 
		        	data : {"stLat":stLat,"stLon":stLon,"enLat":enLat,"enLon":enLon},
		        	success: function(data) {
		        		// leftcontainer 아이템 삭제
		        		removeAllLeftContainerItems();
		        		
		        		// 마커 삭제
		        		removeAreaMarker();
		        		
		        		for ( var i = 0; i < data.length; i++ ) {
		    		        // 마커를 생성하고 지도에 표시
		    		        var placePosition = new daum.maps.LatLng(data[i].latitude, data[i].longitude),
		    		        	marker = addAreaMarker(placePosition, i, data[i].title, data[i].imgPath);
		    		        
		    		        (function(marker, title, addr, img, id) {
		    		            daum.maps.event.addListener(marker, 'mouseover', function() {
		    		                infowindow.close();
		    		                displayInfowindow(marker, title, addr, img, id);
		    		            });
		    		        })(marker, data[i].title, data[i].address, data[i].imgPath, data[i].id);
		    		        
		    		        if (data[i].channel == 'C3') {
		    		        	var content = '<div  style = "position:relative;left:-20px;top:18px;z-index:5;" ><img src="/wheremasil/uploads/images/icon/Best_choice_commercial_symbol_64.png"></div><div class="borderme"><div id="leftmenu_' +
		    		        	data[i].title + '" class="infoview_container"><div class="infoview_image_block"><img src="' + 
			        			data[i].imgPath + '" class="infoview_image"><input type="hidden" value="' + data[i].imgPath + '"></div><div class="infoview_text_block"><p class="infoview_text_title"><b>' + 
			        			data[i].title + '</b></p><p class="infoview_text_content">' + 
			        			data[i].address + '</p></div></div></div>';
			        			
		    		        	$("#left-container").append(content);
		    		        	
		    		        	// leftmenu 클릭시 인포윈도우 출현 - 맵이동
		    		        	$(document).on("click", "#leftmenu_" + data[i].title , function() {
		    		        		var title = $(this).find(".infoview_text_title b").text();
		    		        		var addr = $(this).find(".infoview_text_content").text();
		    		        		var img = $(this).find(".infoview_image_block input").val();
		    		        		for (var idx = 0; idx < areaMarkers.length; idx++) {
		    		        			if (title == areaMarkers[idx].getTitle()) {
		    	    		                infowindow.close();
		    	    		    		    map.panTo(areaMarkers[idx].getPosition());
		    	    		                displayInfowindow(areaMarkers[idx], title, addr, img);
		    	    		                break;
		    		        			}
		    		        		}
		    					});
		    		        }
		    		    }// end of for
		    		    setTimeout(function(){
			        		Pace.stop();
		    			}, 1000);
		            }// end of success
				});// end of ajax
			});// end of pace
		}// end of getAreasByRange()
		
		// 지역명 리스트 추가
		function addTitle(title) {
			var fixedTitle = title.replace(/\s/gi, '');
			//TODO: 신규 지역정보 db insert
			if (titles.length == 0) {
				titles.push(fixedTitle);
				// DB지역 데이타인 경우, 인포윈도우 '일정등록' 클릭시 등록
	        	$(document).on("click", "#infowindow_" + fixedTitle , function() {
	        		infowindow.close();
	        		var data = $($(this).parents().html()).last().val().split(",");
	        		var title = data[0];
	        		var img = data[1];
	        		var addr = data[2];
	        		var lat = data[3];
	        		var lng = data[4];
	        		var id = data[5];

	        		var content = '<div class="schedule_borderme"><div class="infoview_container" style="width:230px;"><div class="infoview_image_block"><img src="' + 
	        		img + '" class="infoview_image"></div><div class="infoview_text_block"><p class="infoview_text_title"><b>' + 
			    	title + '</b></p><p class="infoview_text_content">' + 
			    	addr + '</p></div></div></div>';
			    	
					if (id == 'undefined') {
						// id가 없는경우, 지역정보를 db에 insert
						//alert(title+", "+address+", "+imgUrl);
						Pace.track(function(){
							Pace.start();
							$.ajax({
					        	url: "/wheremasil/plan/registArea.do",
					        	dataType : "text",
					            type: "POST",
					            timeout : 30000, 
					        	data : {"title":title,"address":addr,"imageUrl":img,"latitude":lat,"longitude":lng},
					        	success: function(data) {
					        		setSchedule(content, data);
	
					        		// 선택한 일정 경로 추가
					        		var correctCourseNo = 0;
									for (var idx = 0; idx < dayCount - 1; idx++) {
										correctCourseNo = correctCourseNo + courseCount[idx] - 1;
									}
					        		if (schedulePath.length != correctCourseNo + courseCount[dayCount-1] - 2) {
					        			schedulePath.splice(correctCourseNo + courseCount[dayCount-1] - 2, 0, new daum.maps.LatLng(lat, lng));
					        		} else {
					        			schedulePath.push(new daum.maps.LatLng(lat, lng));
					        		}
					        		if (schedulePath.length > 1) {
						    			polyline.setMap(null);
					        			displayArrow(schedulePath);
					        		}
	
					    		    setTimeout(function(){
						        		Pace.stop();
					    			}, 1000);
					        	}
							});// end of ajax
						});// end of track (pace)
					} else {
		        		setSchedule(content, id);

		        		// 선택한 일정 경로 추가
		        		var correctCourseNo = 0;
						for (var idx = 0; idx < dayCount - 1; idx++) {
							correctCourseNo = correctCourseNo + courseCount[idx] - 1;
						}
		        		if (schedulePath.length != correctCourseNo + courseCount[dayCount-1] - 2) {
		        			schedulePath.splice(correctCourseNo + courseCount[dayCount-1] - 2, 0, new daum.maps.LatLng(lat, lng));
		        		} else {
		        			schedulePath.push(new daum.maps.LatLng(lat, lng));
		        		}
		        		if (schedulePath.length > 1) {
			    			polyline.setMap(null);
		        			displayArrow(schedulePath);
		        		}
					}
					
	    		});// end of 일정등록 click event
			} else {
				for (var idx = 0; idx < titles.length; idx++) {
					if (fixedTitle == titles[idx]) {
						break;
					}
					if (idx == titles.length - 1) {
						//alert("title : " + title + ", len : " + titles.length + ", curLen : " + idx + ", curTitle : " + titles[idx]);
						titles.push(fixedTitle);

						// 인포윈도우 '일정등록' 클릭시 등록
			        	$(document).on("click", "#infowindow_" + fixedTitle , function() {
			        		infowindow.close();
			        		var data = $($(this).parents().html()).last().val().split(",");
			        		var title = data[0];
			        		var img = data[1];
			        		var addr = data[2];
			        		var lat = data[3];
			        		var lng = data[4];
			        		var id = data[5];

			        		var content = '<div class="schedule_borderme"><div class="infoview_container" style="width:230px;"><div class="infoview_image_block"><img src="' + 
			        		img + '" class="infoview_image"></div><div class="infoview_text_block"><p class="infoview_text_title"><b>' + 
					    	title + '</b></p><p class="infoview_text_content">' + 
					    	addr + '</p></div></div></div>';

							if (id == 'undefined') {
								// id가 없는경우, 지역정보를 db에 insert
								//alert(title+", "+address+", "+imgUrl);
								Pace.track(function(){
									Pace.start();
									$.ajax({
							        	url: "/wheremasil/plan/registArea.do",
							        	dataType : "text",
							            type: "POST",
							            timeout : 30000, 
							        	data : {"title":title,"address":addr,"imageUrl":img,"latitude":lat,"longitude":lng},
							        	success: function(data) {
							        		setSchedule(content, data);
	
							        		// 선택한 일정 경로 추가
							        		var correctCourseNo = 0;
											for (var idx = 0; idx < dayCount - 1; idx++) {
												correctCourseNo = correctCourseNo + courseCount[idx] - 1;
											}
							        		if (schedulePath.length != correctCourseNo + courseCount[dayCount-1] - 2) {
							        			schedulePath.splice(correctCourseNo + courseCount[dayCount-1] - 2, 0, new daum.maps.LatLng(lat, lng));
							        		} else {
							        			schedulePath.push(new daum.maps.LatLng(lat, lng));
							        		}
							        		if (schedulePath.length > 1) {
								    			polyline.setMap(null);
							        			displayArrow(schedulePath);
							        		}
	
							    		    setTimeout(function(){
								        		Pace.stop();
							    			}, 1000);
							        	}
									});// end of ajax
								});// end of track (page)
							} else {
				        		setSchedule(content, id);

				        		// 선택한 일정 경로 추가
				        		var correctCourseNo = 0;
								for (var idx = 0; idx < dayCount - 1; idx++) {
									correctCourseNo = correctCourseNo + courseCount[idx] - 1;
								}
				        		if (schedulePath.length != correctCourseNo + courseCount[dayCount-1] - 2) {
				        			schedulePath.splice(correctCourseNo + courseCount[dayCount-1] - 2, 0, new daum.maps.LatLng(lat, lng));
				        		} else {
				        			schedulePath.push(new daum.maps.LatLng(lat, lng));
				        		}
				        		if (schedulePath.length > 1) {
					    			polyline.setMap(null);
				        			displayArrow(schedulePath);
				        		}
							}
			    		});// end of 일정등록 click event
					}// end of if
				}// end of for
			}// end of else
		}// end of addTItle
		
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
		    addTitle(title); // 지역명 리스트에 추가
	
		    // 마커를 지도 뷰 범위에 추가
			extendsBounds(position);
	
		    return marker;
		}

		// leftmenu 아이템 삭제
		function removeAllLeftContainerItems() {
			$("#left-container").html("");
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
		    addTitle(title); // 지역명 리스트에 추가
	
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
		    }// end of for
	
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
		function displayInfowindow(marker, title, addr, img, id) {
			var fixedTitle = title.replace(/\s/gi, '');
			
			var imageUrl = img;
			if (imageUrl == '') {
				imageUrl = "/wheremasil/uploads/images/default/img_not_found.png";
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
		    	fixedTitle + '" value="일정등록"><input type="hidden" value="' + 
		    	title + ',' + imageUrl + ',' + addr + ',' + marker.getPosition().getLat() + ',' + marker.getPosition().getLng() + ',' + id + '"></div></div>' +
		    	'<a href="javascript:void(0);" id="closeBt" class="close-thik"></a></div>';
		    infowindow.setContent(content);
		    infowindow.open(map, marker);
		}
		
		// path = 좌표 배열
		function displayArrow(path) {
			// 지도에 선을 표시한다 
			polyline = new daum.maps.Polyline({
				map: map,
				path: path,
				strokeWeight: 2, // 선의 두께
				strokeColor: '#FF0000', // 선 색
				strokeOpacity: 0.7, // 선 투명도
				strokeStyle: 'solid' // 선 스타일
			});
			polyline.setMap(map);
		}
		
		 // 검색결과 목록의 자식 Element를 제거하는 함수
		function removeAllChildNods(el) {   
		    while (el.hasChildNodes()) {
		        el.removeChild (el.lastChild);
		    }
		}
		
		// 인포윈도우 닫기버튼 (x)
		$(document).on("click", "#closeBt", function() {
			infowindow.close();
		});
		// 스케줄 클릭
		$(document).on("click", ".schedule_borderme", function() {
			var course = $(this).parents("fieldset").children("legend").text();

			var correctCourseNo = 0;
			for (var idx = 0; idx < dayCount - 1; idx++) {
				correctCourseNo = correctCourseNo + courseCount[idx] - 1;
			}
			var targetNo = course.substring(6, 7);
			
			// 일정 경로 표시
			schedulePath.splice(correctCourseNo + parseInt(targetNo, 10) - 1, 1);
			polyline.setMap(null);
			if (schedulePath.length > 1) {
				displayArrow(schedulePath);
			}
			
			removeSchedule(course);
		});
		
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
