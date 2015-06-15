<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	$(document).ready(
			function() {
				var default_url;
				$("#login_form_bt").on("click", function() {
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
								url : "/wheremasil/member/joinSuccess.do",
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
				$("#popup_cancel_login").on("click", function() {
					$("#popup_layer_login").css("visibility", "hidden");
				});
				$("#popup_cancel_join").on("click", function() {
					$("#popup_layer_join").css("visibility", "hidden");
				});
				$("#mypage").on("click", function() {
					location.href("/wheremasil/mypage/mypageconn.do");
				});
				// HeaderSearchForm 오류 검증
				$("#headerSearch")
						.on(
								"submit",
								function() {
									if (!$("#headerSearchWord").val()
											|| $("#headerSearchWord").val()
													.trim() == "") {
										$("#headerSearchWord").focus();
										return false;
									}
									return true;
								});
			});
	function fn_layer_popup_login() {
		$("#popup_layer_login").css("visibility", "visible");
	}

	function fn_layer_popup_join() {
		$("#popup_layer_join").css("visibility", "visible");
		$("#popup_layer_login").css("visibility", "hidden");
	}
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
			<a class="navbar-brand" href="/wheremasil/index.do"><img
				src="/wheremasil/uploads/images/icon/logo5.png"
				style="margin-top: 0px"></a>
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
			<form class="navbar-form navbar-right" role="search"
				action="/wheremasil/search/simpleSearch.do" id="headerSearch">
				<!-- headerSearch form hidden check -->
				<c:if test="${empty requestScope.header_search}">
					<div class="form-group">
						<input type="hidden" name="page" value=""> <input
							type="text" class="form-control" placeholder="Search"
							name="searchWord" id="headerSearchWord"> <input
							type="hidden" name="category" value="simple"> <input
							type="hidden" name="type" value="">
					</div>
					<button type="submit" class="btn btn-default" id="searchWordBtn">
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					</button>
				</c:if>
				<c:if test="${sessionScope.login_info != null}">
					<input id="logout_bt" type="button"
						class="btn btn-default navbar-btn" value="로그아웃">
					<input id="mypage" type="button" class="btn btn-default navbar-btn"
						value="마이페이지">

				</c:if>

				<c:if test="${sessionScope.login_info == null}">

					<button id="login_form_bt" type="button"
						class="btn btn-default navbar-btn"
						onclick="fn_layer_popup_login()">로그인</button>

				</c:if>
			</form>
		</div>
	</div>
</nav>

<!-- 로그인 -->
<div id="popup_layer_login"
	style="position: absolute; top: 70%; left: 53%; border-radius: 0.4em; width: 25%; height: 31%; margin-left: -15%; margin-top: -20%; z-index: 1; visibility: hidden; background-color: #f5f5f5; padding: 2px;">

	<div id="login_form_header" class="panel panel-warning">
		<div class="panel-heading">
			<h4 class="panel-title" align="right">
				<a href="#" onclick="fn_layer_popup_join()">회원가입</a>
			</h4>
		</div>
		<div class="panel-body">

			<form class="form-horizontal" action="">
				<fieldset>
					<legend>로그인</legend>
					<font color="red" size="2">${requestScope.error_message}</font>
					<div class="form-group">
						<label for="inputTitle" class="col-lg-3 control-label">이메일</label>
						<div class="col-lg-7">
							<input type="text" class="form-control" id="member_id"
								name="member_id" placeholder="email주소" autofocus required>
						</div>
					</div>
					<div class="form-group">
						<label for="inputTitle" class="col-lg-3 control-label">패스워드</label>
						<div class="col-lg-7">
							<input type="password" class="form-control" id="m_password"
								name="m_password" placeholder="password" autofocus required>
						</div>
					</div>

					<div class="form-group">
						<div class="col-lg-7 col-lg-offset-4">
							<input type="button" id="login_send" class="btn btn-warning"
								value="로그인"> <input type="reset" id="popup_cancel_login"
								class="btn btn-default" value="취소">
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>

<!-- 회원가입 -->
<div id="popup_layer_join"
	style="position: absolute; top: 70%; left: 53%; border-radius: 0.4em; width: 25%; height: 37%; margin-left: -15%; margin-top: -20%; z-index: 1; visibility: hidden; background-color: #f5f5f5; padding: 2px;">

	<div id="join_form_header" class="panel panel-warning">
		<div class="panel-heading">
			<h4 class="panel-title" align="right">**welcome**</h4>
		</div>
		<div class="panel-body">

			<form class="form-horizontal" action="">
				<fieldset>
					<legend>회원가입</legend>
					<font color="red" size="2">${requestScope.error_message}</font>
					<div class="form-group">
						<label for="inputTitle" class="col-lg-3 control-label">이메일</label>
						<div class="col-lg-7">
							<input type="text" class="form-control" id="member_id1"
								name="member_id1" value="${param.email }" placeholder="email주소"
								autofocus required>
						</div>
					</div>
					<div class="form-group">
						<label for="inputTitle" class="col-lg-3 control-label">패스워드</label>
						<div class="col-lg-7">
							<input type="password" class="form-control" id="m_password1"
								name="m_password" placeholder="password" autofocus required>
						</div>
					</div>
					<div class="form-group">
						<label for="inputTitle" class="col-lg-3 control-label">닉네임</label>
						<div class="col-lg-7">
							<input type="text" class="form-control" id="m_name1"
								name="m_name" placeholder="닉네임" autofocus required>
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-7 col-lg-offset-4">
							<input type="button" id="join_send" class="btn btn-warning"
								value="가입"> <input type="reset" id="popup_cancel_join"
								class="btn btn-default" value="취소">
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>
