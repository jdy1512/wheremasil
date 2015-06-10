<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(document).ready(
			function() {
				var default_url;
				$("#login_form_bt").on("click", function() {

					$("#login_form_header").css("background-color", "#000000");
					$("#login_form_header").css("visibility", "visible");
					var s = location.href;

					default_url = s;
					
				});

				$("#login_send").on(
						"click",
						function() {

							var member_id = $('#member_id').val();
							var m_password = $('#m_password').val();

							var editor1 = "member_id" + "=" + member_id + "&"
									+ "m_password" + "=" + m_password + "&"
									+ "default_url" + "=" + default_url;

						
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
						});
				$("#join_form_bt").on("click", function() {

					$("#join_form_header").css("background-color", "#000000");
					$("#join_form_header").css("visibility", "visible");
					$("#login_form_header").css("visibility", "hidden");

				});
				$("#join_send").on(
						"click",
						function() {
							
							var member_id1 = $('#member_id1').val();
							var m_password1 = $('#m_password1').val();
							var m_name1 = $('#m_name1').val();
							
							var editor1 = "member_id12" + "=" + member_id1
									+ "&" + "m_password1" + "=" + m_password1
									+ "&" + "m_name1" + "=" + m_name1;
							$.ajax({
								url : "/wheremasil	/member/joinSuccess.do",
								data : editor1,
								type : "post",
								dataType : "text",
								success : function(data) {

								

									if (data == "1") {
										alert("아이디중복")

									} else if (data == "2") {
										alert("닉네임중복");

									} else {
										location.reload(true);
									}

								},
								error : function(data) {
									alert("회원가입실패 새로고침(F5)눌러주세요~");
								}
							});
						});

				$("#logout_bt").on("click", function() {

					alert("로그아웃완료!");
					//location.href("/wheremasil2	/member/logout.do?page="+location.href);
					var editor1 = "page" + "=" + location.href;
					$.ajax({
						url : "/wheremasil/member/logout.do",
						data : editor1,
						type : "post",
						dataType : "text",
						success : function(data) {
							location.reload(true);
						},
						error : function(data) {
							location.reload(true);
						}
					});
				});
				$("#cancel").on("click", function() {
					location.reload(true);
				});
				
				$("#mypage").on("click", function() {
					
					alert("123");
					location.href("/wheremasil/mypage/mypageconn.do");
			
				
		
				});

			});
</script>
<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/wheremasil/index.do"><img src="/wheremasil/uploads/images/icon/logo5.png" style="margin-top:0px"></a>
		</div>


		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="/wheremasil/board/square.do">광장
						<span class="sr-only">(current)</span>
				</a></li>
				<li><a href="/wheremasil/board/review.do">리뷰</a></li>
				<li><a href="/wheremasil/board/qna.do">Q&A</a></li>
			</ul>
			<form class="navbar-form navbar-right" role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				</button>
				<c:if test="${sessionScope.login_info != null}">

					<input id="logout_bt" type="button"
						class="btn btn-default navbar-btn" value="로그아웃">
							<input id="mypage" type="button"
						class="btn btn-default navbar-btn" value="마이페이지">

				</c:if>

				<c:if test="${sessionScope.login_info == null}">

					<button id="login_form_bt" type="button"
						class="btn btn-default navbar-btn">로그인</button>

				</c:if>
			</form>
			<div id="login_form_header" style="width: 250px; height: 200px; left: 50%; top: 50%;  visibility: hidden; position: absolute;">
				로그인 <br>
				<hr noshade="noshade" width="100%" align="left">

				<font color="red" size="2">${requestScope.error_message}</font>


				<div>

					<table>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="member_id" size="20"
								autofocus="autofocus" id="member_id"></td>
						</tr>
						<tr>
							<td>패스워드</td>
							<td><input type="password" id="m_password" name="m_password"
								required="required" id="m_password"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input id="login_send"
								type="button" value="로그인"> <input name="register"
								type="button" id="join_form_bt" value="회원가입"></td>
						</tr>
					</table>
				</div>
			</div>
			<div id="join_form_header" style="width:300px;height:250px;left:50%;top:50%;visibility:hidden;position:absolute;">

<h2>회원가입</h2><br>

<table width='500'>
<tr>
<td>이메일</td>
<td>
<input type="text" name="member_id1" id='member_id1' value="${param.email }" required="required"> 

</tr>
<tr>
<td>password</td>
<td>
<input type="password" id="m_password1" name="m_password"  required="required">
 

</td>
</tr>
<tr>
<td>닉네임</td>
<td>
<input type="text" id="m_name1" name="m_name"  required="required">
</td>
</tr>
<tr>


			<td colspan="2">
				<input type="button" value="가입" id="join_send">
				<input type="button" value="취소"id="cancel">
			</td>
</tr>
</table>
</div>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>
