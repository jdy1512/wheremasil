<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#tile_left_nav").css("visibility", "hidden");
		$("#tile_right_nav").css("visibility", "hidden");
		$(".left_nav").css("width", "0px");
		$(".right_nav").css("width", "0px");
		
		
		var dayAllCount=7; //총 여행 날짜
		var dayCount=1; // 현재 day
		var courseCount=[];
		
		for (var idx = 0; idx < dayAllCount; idx++) {
			$("#schedule_box").append('<div class="schedule_container itembox day"></div>');
		}
	});// end of ready
</script>

</head>
<body>
	<div class="schedule_container">
		<div class="schedule_container itembox">
			<div id="schedule_box" class="schedule_container itembox root"></div>
		</div>
	</div>
</body>
</html>