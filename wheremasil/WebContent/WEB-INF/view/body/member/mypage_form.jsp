<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
$("#addFile").on("click",function(){
		alert("123123")
		 
		
	});

	$("#inforchange").on("click",function(){
		alert("!@312312");
	});
	$("#change").on("click", function() {

		alert("123556777");
		$("#123").css("background-color", "#000000");
		$("#123").css("visibility", "visible");
		

	});
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<Style>

#ML1 { position: absolute; top: 95px; left: 5px; width: 300px; height: 3-0px; align: center; background: #EAEAEA; }
#ML2 { position: absolute; top: 320px; left: 5px; width: 300px; height: 200px; align: center; background: #EAEAEA; }
</style>
<body>



 <div id="ML1"><img height="160"  style="margin-bottom: 10px;" src="http://192.168.7.99:8078/wheremasil/uploads/images/default/no-photo.png" border="0"><br>
  <input type="file" value="" id="addFile">
  <input id="addFile" type="button" value="�����ʻ�����ü"><br>
  <input id="change" type="button" value="������������">
 </div>
 
 
 <div id="123" style="width:300px;height:250px;left:50%;top:50%;visibility:hidden;position:absolute;">

<h2>ȸ������1</h2><br>

<table width='500'>
<tr>
<td>�̸���</td>
<td>
<input type="email" name="member_id1" id="member_id1" required="required"> 

</tr>
<tr>
<td>password</td>
<td>
<input type="password" id="m_password1" name="m_password"  required="required">
 

</td>
</tr>
<tr>
<td>�г���</td>
<td>
<input type="text" id="m_name1" name="m_name"  required="required">
</td>
</tr>
<tr>


			<td colspan="2">
				<input type="button" value="����" id="join_send">
				<input type="button" value="���"id="cancel">
			</td>
</tr>
</table>
</div>



</body>
</html>