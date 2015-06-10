<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function photo(){
	alert("123");
	$.ajax({
		url : "/wheremasil/member/logincheck.do",
		data : editor1,
		type : "post",
		dataType : "text",
		success : function(data) {

	

			// window.location.replace(data);

			if (data == "2") {
				alert("아이디를 확인하세요");

			} else if (data == "1") {
				alert("password를 확인하세요");
			} else {

				location.reload(true);

			}

		},
		error : function(data) {
			alert("로그인실패 새로고침(F5)눌러주세요~");
		}
	});
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<Style>
#wrap { position: absolute; top: 10px; left: 50%; margin-left: -512px; width:1024px; }
#ML1 { position: absolute; top: 95px; left: 5px; width: 300px; height: 3-0px; align: center; background: #EAEAEA; }

</style>
<body>

 <div id="wrap"></div>

 <div id="ML1"><img height="160"  style="margin-bottom: 10px;" src="http://192.168.7.99:8078/wheremasil/uploads/images/default/no-photo.png" border="0"><br>
  <input type="file" value="" onclick="photo();">
  <input type="button" value="프로필사진교체" onclick="photo();">
 </div>

</body>
</html>