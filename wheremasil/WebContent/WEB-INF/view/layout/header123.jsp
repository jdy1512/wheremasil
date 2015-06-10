<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 인클루드 되므로 보여질 부분만 작성한다. -->
<script type="text/javascript">
	$(document).ready(function() {
		var default_url;
		$("#login_form_bt").on("click", function() {
			$("#login_form_header").css("background-color", "#abcdef");
			$("#login_form_header").css("visibility", "visible");
			var s = location.href;
			
			
			default_url=s;
			alert(default_url);
		});
		
		$("#login_send").on("click", function() {
			
			var member_id  = $('#member_id').val();
			var m_password = $('#m_password').val();
			
			var editor1 =  "member_id" + "="+ member_id+"&" +"m_password" + "="+ m_password+"&" +"default_url" + "="+ default_url;
			
			
			alert(member_id);
			alert(m_password)
			alert(default_url);
			$.ajax({
				url: "/wheremasil/member/logincheck.do",
				data: editor1,
				type:"post",
				dataType:"text",
				success:function(data){
					alert("성공확인");
					alert("성공 = "+data);
					<% 
					Object o = request.getSession().getAttribute("login_info");
					
					%>
					alert("로긴인포값"+<%= o %>);
				reload(data);
					
				//	$(location).attr('href',url);
					
				
					
				},
				error:function(data){
					alert("실패 = " + data);
				}
			});
		});
	});
	

	
	function reload(data){
		alert("리로듲버");

        // 이동전 주소가 안보임. 

		location.reload();
	}
</script>
	


<h2>W.H.E.R.E - M.A.S.I.L</h2>
<input id="login_form_bt" type="button" value="로그인" >
<div id="login_form_header" style="width:250px;height:150px;left:60%;top:60%;margin-left:-30%;margin-top:-20%;visibility:hidden;position:absolute;">
	<c:if test="${sessionScope.login_info != null}">
		<jsp:forward page="main.jsp"/>
	</c:if>
	로그인 <br>   
	<hr noshade="noshade" width="30%" align="left"> 
	<c:if test="${requestScope.error_message != null}">
		<font color="red" size="2">${requestScope.error_message}</font>
	</c:if>
	
	<div   >
		
		<table>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="member_id" size="20" autofocus="autofocus" id="member_id"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" id="m_password" name="m_password"  required="required" id="m_password"> </td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input id="login_send" type="button" value="로그인">
					<input name="register"type="button" onClick="location.href='/wheremasil/member/join.do';"  value="회원가입">
				</td>
			</tr>
		</table>
	</div>
</div>
<div>
</div>