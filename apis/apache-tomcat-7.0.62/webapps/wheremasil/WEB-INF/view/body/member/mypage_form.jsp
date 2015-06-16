<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready( function(){

						$("#inforchange").on("click", function() {
							
						});
						$("#change").on("click",function() {

									$("#memberchange").css("background-color",
											"#000000");
									$("#memberchange").css("visibility",
											"visible");

								});
						$("#changsucc").on("click",function() {
											
											var member_id = $
											{
												sessionScope.login_info.member_id
											};
											var m_password = $('#m_passwordchange').val();
											
											var editor1 = "member_id" + "="
													+ member_id + "&"
													+ "m_password" + "="
													+ m_password;

											$.ajax({
														url : "/wheremasil/member/memberchange.do",
														data : editor1,
														type : "post",
														dataType : "text",
														success : function(data) {
															if (data == "a") {
																alert("정보수정완료!");
																$("#memberchange").css("visibility","hidden");
															} else {
																alert("수정실패 새로고침(F5)눌러주세요");
															}
														},

													});

										});
						$("#changecancel").on("click", function() {
							$("#memberchange").css("visibility", "hidden");
						});
						$("#addplan_bt").on("click", function() {
							
							
							$("#popup_layer1").css("visibility", "visible");
							
						});
						
						
						
});
					
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<Style>
#ML1 {
	position: absolute;
	top: 95px;
	left: 5px;
	width: px;
	height: 3 -0px;
	align: center;
}
</style>
<body>



	<div id="ML1">
		<img height="160" style="margin-bottom: 10px;"
			src="http://192.168.7.99:8078/wheremasil/uploads/images/default/no-photo.png"
			border="0"><br> <font size="10">
			${sessionScope.login_info.member_id}<br>
		</font> <input type="file" value="" id="upphoto"> <input id="addFile"
			type="button" value="프로필사진교체"><br> <input id="change"
			type="button" value="개인정보수정"><br> a<br> a<br>
		a<br> a<br> a<br> a<br> a<br> a<br> a<br>

	</div>


	<div id="memberchange"
		style="width: 300px; height: 250px; left: 50%; top: 50%; visibility: hidden; position: absolute;">

		<h2>개인정보수정</h2>
		<br>

		<table width='500'>
			<tr>
				<td>password</td>
				<td><input type="password" id="m_passwordchange"
					name="m_password" required="required"></td>
			</tr>
			
			<tr>


				<td colspan="2"><input type="button" value="수정" id="changsucc">
					<input type="button" value="취소" id="changecancel"></td>
			</tr>
		</table>
	</div>


	
</body>
</html>