<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
$(document).ready(function() {

	$("#login_send").on("click",function() {
		
		$.ajax({
			url : "/wheremasil/member/login.do",
			data : "member_id="+$("#loginMember_id").val()+"&m_password="+$("#loginM_password").val(),
			type : "get",
			dataType : "text",
			success : function(data) {
				// window.location.replace(data);
				if (data == "2") {
					alert("아이디를 확인하세요");
				} else if (data == "1") {
					alert("password를 확인하세요");
				} else{
					location.reload(true);
				}
			},
			error : function(data) {
				alert("로그인실패 새로고침(F5)눌러주세요~");
			}
		});
	});
	
	$("#join_send").click(function(){
		var formData = new FormData();
		formData.append("member_id",$("input[name=member_id]").val());
		formData.append("m_password",$("input[name=m_password]").val());
		formData.append("m_name",$("input[name=m_name]").val());
		formData.append("picture",$("input[name=picture]")[0].files[0]);
		$.ajax({
			url:"/wheremasil/member/join.do",
			data: formData,
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {
				if(data == "id"){
					alert("아이디를 확인하세요");
				}else if(data == "name"){
					alert("password를 확인하세요");
				}else if(data == "success"){
					location.reload(true);
				}
				
			},
			error : function(data, xhr, message) {
				alert(data.status + ", " + xhr + ", " + message);
				
			}
		});
	});	
		
	$("#logout_bt").on("click", function() {
		
		$.ajax({
			url : "/wheremasil/member/logout.do",
			type : "post",
			dataType : "text",
			success : function(data) {
				location.href="/wheremasil/member/logoutmypage.do"
			},
			error : function(data) {
				location.href="/wheremasil/member/logoutmypage.do"
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
		location.href="/wheremasil/member/mypageconn.do?member_id=${sessionScope.login_info.member_id}";
	});
	// HeaderSearchForm 오류 검증
	$("#headerSearch").on("submit",function() {
		if (!$("#headerSearchWord").val()|| $("#headerSearchWord").val().trim() == "") {
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

function fn_layer_popup() {
    var layer = document.getElementById("popup_layer");
    layer.style.visibility = "visible"; //반대는 hidden 

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
				<li><a href="#" onclick="fn_layer_popup()">플랜만들기
					<span class="sr-only">(current)</span>
					</a>
				</li>
				<li class="active"><a href="/wheremasil/board/square.do">광장</a></li>
				<li><a href="/wheremasil/board/review.do">리뷰</a></li>
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
				
				
				<c:if test="${!empty sessionScope.login_info.member_id}">
					<input id="logout_bt" type="button"
						class="btn btn-default navbar-btn" value="로그아웃">
					<input id="mypage" type="button" class="btn btn-default navbar-btn"
						value="마이페이지">

				</c:if>

				<c:if test="${empty sessionScope.login_info.member_id}">

					<button id="login_form_bt" type="button"
						class="btn btn-default navbar-btn"
						onclick="fn_layer_popup_login()">로그인</button>

				</c:if>
			
			</form>
		</div>
	</div>
</nav>
<div id="popup_layer"
    style="position: absolute; 
    top: 52%; 
    left: 50%; 
    border-radius: 0.4em; 
    width: 30%; 
    height: 50%; 
    margin-left: -15%; 
    margin-top: -20%; 
    z-index: 1; 
    visibility: hidden;
    background-color: #f5f5f5;
    padding: 2px;">

   <div class="panel panel-warning">
      <div class="panel-heading">
         <h3 class="panel-title" align="right">여행계획짜기</h3>
      </div>
      <div class="panel-body">

         <form class="form-horizontal" action="/wheremasil/plan/session/map.do" method="post">
            <fieldset>
               <legend>여행 일정</legend>
               <div class="form-group">
                  <label for="inputTitle" class="col-lg-2 control-label">플랜명</label>
                  <div class="col-lg-10">
                     <input type="text" class="form-control" id="title" name="title"
                        placeholder="여행 계획 명" autofocus required>
                  </div>
               </div>
               <div class="form-group">
                  <label for="select" class="col-lg-2 control-label">테마 </label>
                        <div class="col-lg-10">
                           <select class="form-control" id="theme" name="theme" required>
                              <option value="">테마선택</option>
                              <option value="T1">배낭여행</option>
                              <option value="T2">우정여행</option>
                              <option value="T3">가족여행</option>
                              <option value="T4">커플여행</option>
                              <option value="T5">부모님여행</option>
                           </select> <br>
                        </div> 
                        <label for="select" class="col-lg-2 control-label">인원수</label>
                         <div class="col-lg-10">
                            <select class="form-control" id="groupNum" name="groupNum" required>
                              <option value="">인원수 선택</option>
                              <%
                                 for (int i = 1; i <= 100; i++) {
                              %>
                              <option value="<%=i%>"><%=i + "명"%></option>
                              <%
                                 }
                              %>
                           </select><br>
                        </div>
                        <label for="inputStDate" class="col-lg-2 control-label">시작일</label>
                        <div class="col-lg-9">
                           <input type="text" class="form-control" id="stDate"
                              name="startDate" placeholder="여행 시작 날짜" required>
                        </div><br>
                     
                  
                        <label for="inputendDate" class="col-lg-2 control-label">종료일</label>
                        <div class="col-lg-9">
                           <input type="text" class="form-control" id="edDate"
                              name="endDate" placeholder="여행 종료 날짜" required>
                        </div>
                  
               </div>

               <div class="form-group" >
                   <div class="col-lg-10 col-lg-offset-7">
                      <input type="submit" class="btn btn-warning" value="작성 시작">
                      <input type="reset" class="btn btn-default" id="popup_cancel" value="취소">
                   </div>
               </div>
            </fieldset>
         </form>
      </div>
   </div>

</div>
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
					<div class="form-group">
						<label for="inputTitle" class="col-lg-3 control-label">이메일</label>
						<div class="col-lg-7">
							<input type="text" class="form-control" id="loginMember_id"
								placeholder="email주소" autofocus required>
						</div>
					</div>
					<div class="form-group">
						<label for="inputTitle" class="col-lg-3 control-label">패스워드</label>
						<div class="col-lg-7">
							<input type="password" class="form-control" id="loginM_password"
								placeholder="password" autofocus required>
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

			<form id="ajaxform" class="form-horizontal" action="/wheremasil/member/join.do" method="post" enctype="multipart/form-data">
				<fieldset>
					<legend>회원가입</legend>
					<div class="form-group">
						<label for="inputTitle" class="col-lg-3 control-label">이메일</label>
						<div class="col-lg-7">
							<input type="text" class="form-control" name="member_id" placeholder="email주소"	autofocus required>
						</div>
					</div>
					<div class="form-group">
						<label for="inputTitle" class="col-lg-3 control-label">패스워드</label>
						<div class="col-lg-7">
							<input type="password" class="form-control" name="m_password" placeholder="password" autofocus required>
						</div>
					</div>
					<div class="form-group">
						<label for="inputTitle" class="col-lg-3 control-label">닉네임</label>
						<div class="col-lg-7">
							<input type="text" class="form-control" name="m_name" placeholder="닉네임" autofocus required>
						</div>
					</div>
					<div class="form-group">
						<input type="file" name="picture">
	 				</div>
					<div class="form-group">
						<div class="col-lg-7 col-lg-offset-4">
							<input type="button" id="join_send" class="btn btn-warning"	value="가입"> 
							<input type="reset" id="popup_cancel_join" class="btn btn-default" value="취소">
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>
