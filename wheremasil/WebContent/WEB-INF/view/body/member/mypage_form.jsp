<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% int cnt = 0; %>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=8090c845eb21bcc92becc6f8f3bf61fa&libraries=services"></script>
<script type="text/javascript" src="/wheremasil/script/map_view.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#change").on("click", function() {
		
		$("#memberchange").css("visibility", "visible");
	});
	
	$("#changecancel").on("click", function() {
		$("#memberchange").css("visibility", "hidden");
	});
	$("#addplan_bt").on("click", function() {
		$("#popup_layer1").css("visibility", "visible");
	});
	
	if("${requestScope.planId_list}"){
		getPlanMapList("${requestScope.planId_list}", "plan_map_", "portfolio-item");
	}
});

</script>

<div class="container">
    <div class="row profile" style="margin-top:20px;">
		<div class="col-md-3">
			<div class="profile-sidebar">
				<!-- SIDEBAR USERPIC -->
				<div class="profile-userpic">
					<c:choose>
						<c:when test="${empty sessionScope.login_info.m_prof_img_path }">
							<img src="/wheremasil/uploads/images/profile/no-photo.png" class="img-responsive" alt="">
						</c:when>
						<c:otherwise>
							<img src="/wheremasil/uploads/images/profile/${sessionScope.login_info.m_prof_img_path }" class="img-responsive" alt="">
						</c:otherwise>
					</c:choose>
				</div>
				<!-- END SIDEBAR USERPIC -->
				<!-- SIDEBAR USER TITLE -->
				<div class="profile-usertitle">
					<div class="profile-usertitle-name">
			
						${sessionScope.login_info.member_id}
			
					</div>
					<div class="profile-usertitle-job">
						${sessionScope.login_info.m_name}
					</div>
				</div>
				<!-- END SIDEBAR USER TITLE -->
				<!-- SIDEBAR BUTTONS -->
				<div class="profile-userbuttons">
					<button type="button" class="btn btn-success btn-sm" id="change">개인정보수정</button>
				</div>
				<!-- END SIDEBAR BUTTONS -->
			
			</div>
		</div>
		<div class="col-md-9">
            <div class="profile-content">
            	<div class="row">
			    	<div class="col-lg-9">
			        	<h2 class="page-header">My plan</h2>
			        </div>
			    </div>
			   <c:if test="${fn:length(requestScope.planId_list) != 0 }">
			        <c:forEach items="${requestScope.planId_list }" var="plan">
			        	<div class='col-md-4 portfolio-item'>
							<a id="plan_map_<%= ++cnt %>" href='/wheremasil/plan/getSchedule.do?plan_id=${plan }'>
								<img class='img-responsive' src='/wheremasil/uploads/images/default/img_not_found.png' alt=''></a>
						</div>
					</c:forEach>
				</c:if>		
            </div>
            <div class="row text-center">		
			<div id="memberchange" style="margin-top:200px; visibility: hidden;"  class="mainbox col-md-4" >                    
				<div class="panel panel-info" >
			    	<div class="panel-heading">
			        	<div class="panel-title">개인정보수정</div>
			        </div>     
				        <div style="padding-top:30px" class="panel-body" >
				            	<form id="loginform" class="form-horizontal" role="form" action="/wheremasil/member/modifyMember.do" method="post"
				            	enctype="multipart/form-data">
				            		<input type="hidden" name="member_id" value="${sessionScope.login_info.member_id }">
				            		<input type="hidden" name="m_email" value="${sessionScope.login_info.member_id }">
	 			            		<div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input name="m_name" type="text" class="form-control" placeholder="nickname">                                        
                                    </div>
				                	<div style="margin-bottom: 25px" class="input-group">
				                		<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
				                        	<input type="password" class="form-control" name="m_password" placeholder="password">
				                    </div>
				                    <div style="margin-bottom: 25px" class="input-group">
				                    	<input type="file" name="picture">
				                    </div>
				                    <div style="margin-top:10px" class="form-group">
				                    <!-- Button -->
				                    <input type="submit" value="버튼">
					                    <div class="col-md-9 controls">
				    	                    <a id="changsucc" class="btn btn-success">수정  </a>
				                            <a id="changecancel" class="btn btn-primary">취소</a>
				                        </div>
				                     </div>
								</form>
						</div>
					</div>
				</div>
			</div>	
		</div>
	</div>
	
</div>