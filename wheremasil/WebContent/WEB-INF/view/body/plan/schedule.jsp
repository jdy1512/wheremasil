<%@ page contentType="text/html; charset=UTF-8" %>
<script type="text/javascript">
	$(document).ready(function() {
		var jsonData = $.parseJSON('{"planDetailList":${requestScope.planDetailList}}');
		var data = jsonData.planDetailList;
		var content;
		var writeFlg = false;
		
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
					content += '</div>';
					$("#schedule_root").append(content);
				}
				writeFlg = !writeFlg;
				content = '<div class="schedule_container itembox day"><div>' +
					data[idx].curDate.substring(5) + '<hr/></div>';
			}
			content += '<div class="infoview_container" style="width:300px;height:100%;"><div class="infoview_image_block"><img src="' +
				data[idx].areaImagePath + '" class="infoview_image"></div><div class="infoview_text_block" style="margin-top:20px;"><p class="infoview_text_title"><b>' +
				data[idx].areaTitle + '</b></p><p class="infoview_text_content">' +
				data[idx].areaAddress + '</p></div>' +
				'<div><p>식비 : ' + data[idx].costFood+ '</p>' +
				'<p>교통 : ' + data[idx].costVehicle+ '</p>' +
				'<p>숙박 : ' + data[idx].costStay+ '</p>' +
				'<p>기타 : ' + data[idx].costEtc+ '</p></div>' +
				'</div><br/>';
		});
		content += '</div>';
		$("#schedule_root").append(content);
		
	});// end of ready
</script>

<div class="schedule_container">
	<div id="schedule_itembox" class="schedule_container itembox">
		<div><h2><b id="schedule_startDate"></b><b>&nbsp;&nbsp;~&nbsp;&nbsp;</b><b id="schedule_endDate"></b></h2></div>
		<div id="schedule_root" class="schedule_container itembox root"></div>
	</div>
	<div class="schedule_container side">
		
	</div>
</div>