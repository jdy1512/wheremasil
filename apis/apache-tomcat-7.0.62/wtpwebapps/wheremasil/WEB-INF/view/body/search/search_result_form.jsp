<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% int cnt = 0; %>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=8090c845eb21bcc92becc6f8f3bf61fa&libraries=services"></script>
<script type="text/javascript" src="/wheremasil/script/map_view.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	// bodySearch btn 빈문자열 오류 검증
	$("#search-btn").on("click",function(){
		if(!$("#bodySearchWord").val() || $("#bodySearchWord").val().trim() == ""){
			alert("검색어입력하세요");
			$("#bodySearchWord").focus();
			return false;
		}
		location.href="http://127.0.0.1:8088/wheremasil/search/simpleSearch.do?page=&searchWord="+$("#bodySearchWord").val()+"&category=simple&type=";
	});
	
	// detailsSearchForm 빈문자열 오류 검증
	$("#detailsSearchForm").on("submit",function(){
		if($("#detailsTitle").val().trim() == "" && $("#detailsContent").val().trim() == ""
			&& $("#detailsTheme").val().trim() == "" && $("#detailsAttraction").val().trim() == ""
			&& $("#detailsNumber").val().trim() == ""){
			return false;
		}
		return true;
	});

	getPlanMapList("${requestScope.planId_list}", "plan_map_", "portfolio-item");
});

</script>

<!-- Page Content -->
<div class="container">
	
    <!-- details search -->
    <div class="row">
		<div class="col-md-12 text-center">
			<div class="input-group" id="adv-search">
	             <input type="text" class="form-control" placeholder="Search" id="bodySearchWord"/>
	             <div class="input-group-btn">
	             	<div class="btn-group" role="group">
	                	<div class="dropdown dropdown-lg">
	                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="caret"></span></button>
	                        <div class="dropdown-menu dropdown-menu-right" role="menu">
	                            <form class="form-horizontal" role="form" action="http://127.0.0.1:8088/wheremasil/search/simpleSearch.do" method="POST" id="detailsSearchForm">
	                              	<input type="hidden" name="page" value="">
	                               	<input type="hidden" name="category" value="detailsSimple">
	                               	<input type="hidden" name="type" value="">
	                               	<div class="form-group">
	                                   	<label for="contain">제목</label>
	                                   	<input class="form-control" type="text" name="title" id="detailsTitle"/>
	                               	</div>
	                           		<div class="form-group">
	                               		<label for="contain">내용</label>
	                        	       	<input class="form-control" type="text" name="content" id="detailsContent"/>
	                            	</div>
	                            	<div class="form-group">
	                               		<label for="contain">테마</label>
	                                  		<select class="form-control" name="theme" id="detailsTheme"/>
	                                       		<option value="" selected>테마선택</option>
	                                       		<option value="배낭">배낭여행</option>
	                                       		<option value="우정">우정여행</option>
	                                       		<option value="가족">가족여행</option>
	                                       		<option value="커플">커플여행</option>
	                                       		<option value="부모님">부모님여행</option>
	                                   		</select>
	                            	</div>
	                            	<div class="form-group">
	                               		<label for="contain">명소</label>
	                               		<input class="form-control" type="text" name="attraction" id="detailsAttraction"/>
	                            	</div>
	                            	<div class="form-group">
	                               		<label for="contain">인원수</label>
	                               		<select class="form-control" name="number" id="detailsNumber">
	                                  		<option value="" selected>인원수 선택</option>
											<%for(int i=1;i<=100;i++){ %>
												<option value="<%=i%>"><%=i+"명"%></option>
											<%} %>
	                                	</select>
	                            	</div>
	                            	<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
	                     		</form>
	                       	</div>
	                   	</div>
	                    <button type="button" class="btn btn-default" id="search-btn"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
	                 </div>
           		</div>
            </div>
		</div>
    </div>
     
    <!-- search result view -->
   	
    <c:choose>
    	<c:when test="${requestScope.category == 'simple' || requestScope.category == 'detailsSimple'}">
    		<c:if test="${fn:length(requestScope.planId_list) == 0 && fn:length(requestScope.review_list) == 0}">
    			<div class="row">
    				<div class="col-lg-12">
        				<h2 class="page-header">검색결과가 없습니다.</h2>
        			</div>
    			</div>
    		</c:if>
    		<c:if test="${fn:length(requestScope.planId_list) != 0 }">
        		<div class="row">
    				<div class="col-lg-12">
        				<h2 class="page-header">플랜</h2>
        			</div>
    			</div>
    			
    			<c:forEach items="${requestScope.planId_list }" begin="0" end="2" var="plan" >
        			<div class='col-md-4 portfolio-item'>
						<a id="plan_map_<%= ++cnt %>" href='http://localhost:8088/wheremasil/plan/getSchedule.do?plan_id=${plan }'>
							<img class='img-responsive' src='/wheremasil/uploads/images/default/img_not_found.png' alt=''></a>
					</div>
				</c:forEach>
				<c:if test="${fn:length(requestScope.planId_list) >= 4 }">
					<div class="row text-center">
    					<div class="col-lg-12">
        					<h4 class="page-header"><a href='http://127.0.0.1:8088/wheremasil/search/${requestScope.search }Search.do?page=&searchWord=${requestScope.search_word }&category=${requestScope.search }&type=plan&title=${requestScope.title }&content=${requestScope.content }&theme=${requestScope.theme }&attraction=${requestScope.attraction }&number=${requestScope.number}'>더보기</a></h4>
        				</div>
    				</div>	
    			</c:if>	
    		</c:if>
    		<c:if test="${fn:length(requestScope.review_list) != 0 }">
    			<div class="row">
    				<div class="col-lg-12">
        				<h2 class="page-header">리뷰</h2>
        			</div>
    			</div>
	    		<c:forEach items="${requestScope.review_list }" begin="0" end="2" var="review">
	        		<div class='col-md-4 portfolio-item'>
						<a href='http://localhost:8088/wheremasil/board/postingVal.do?posting_id=${review.postingId }'>
							<img class='img-responsive' src='${review.reviewImgPath }' alt=''></a>
							<h3><a href='http://localhost:8088/wheremasil/board/postingVal.do?posting_id=${review.postingId }'>${fn:substring(review.reviewTitle,0,40)}</a></h3>
							<p>${fn:substring(review.reviewContent,0,70)}<br> 추천수 : ${review.reviewLike}		조회수 : ${review.reviewHits}<br>ID : ${review.memberId}</p>
					</div>
				</c:forEach>
				<c:if test="${fn:length(requestScope.review_list) >= 4 }">
					<div class="row text-center">
	    				<div class="col-lg-12">
	        				<h4 class="page-header"><a href='http://127.0.0.1:8088/wheremasil/search/${requestScope.search }Search.do?page=&searchWord=${requestScope.search_word }&category=${requestScope.search }&type=review&title=${requestScope.title }&content=${requestScope.content }&theme=${requestScope.theme }&attraction=${requestScope.attraction }&number=${requestScope.number}'>더보기</a></h4>
	        			</div>
	    			</div>
	    		</c:if>				
    		</c:if>               		
    	</c:when>
    	
    	
    	<c:when test="${requestScope.category == 'default' || requestScope.category == 'details'}">
    		<c:if test="${fn:length(requestScope.planId_list) != 0 }">
		        <div class="row">
		    		<div class="col-lg-12">
		        		<h2 class="page-header">플랜</h2>
		        	</div>
		    	</div>
		    	<c:forEach items="${requestScope.planId_list }" var="plan">
		        	<div class='col-md-4 portfolio-item'>
						<a id="plan_map_<%= ++cnt %>" href='http://localhost:8088/wheremasil/plan/getSchedule.do?plan_id=${plan }'>
							<img class='img-responsive' src='/wheremasil/uploads/images/default/img_not_found.png' alt=''></a>
					</div>
				</c:forEach>		
		    </c:if>
		    <c:if test="${fn:length(requestScope.review_list) != 0 }">
		    	<div class="row">
		    		<div class="col-lg-12">
		        		<h2 class="page-header">리뷰</h2>
		        	</div>
		    	</div>
		    	<c:forEach items="${requestScope.review_list }" var="review">
		        	<div class='col-md-4 portfolio-item'>
						<a href='http://localhost:8088/wheremasil/board/postingVal.do?posting_id=${review.postingId }'>
							<img class='img-responsive' src='${review.reviewImgPath }' alt=''></a>
							<h3><a href='http://localhost:8088/wheremasil/board/postingVal.do?posting_id=${review.postingId }'>${fn:substring(review.reviewTitle,0,40)}</a></h3>
							<p>${fn:substring(review.reviewContent,0,70)}<br> 추천수 : ${review.reviewLike}		조회수 : ${review.reviewHits}<br>ID : ${review.memberId}</p>
					</div>
				</c:forEach>		
		    </c:if>
		    <hr>
		    <div class="row text-center">
		    	<div class="col-lg-12">
		        	<ul class="pagination">
		            	<c:choose>
							<c:when test="${PagingBean.previousPageGroup }">
								<li>
		                			<a href="http://127.0.0.1:8088/wheremasil/search/${requestScope.category}Search.do?page=${PagingBean.startPageOfPageGroup-1}&searchWord=${requestScope.search_word}&category=${requestScope.category}&type=${requestScope.type}&title=${requestScope.title }&content=${requestScope.content }&theme=${requestScope.theme }&attraction=${requestScope.attraction }&number=${requestScope.number}">&laquo;</a>
		           				</li>
							</c:when>
							<c:otherwise>
								<li><a href="">&laquo;</a></li>
							</c:otherwise>
						</c:choose>
		                <c:forEach begin="${PagingBean.startPageOfPageGroup }" end="${PagingBean.endPageOfPageGroup}" var="pageNum">
							<c:choose>
								<c:when test="${pageNum == PagingBean.currentPage }">
									<li class="active"><a href="">${pageNum}</a></li>
								</c:when>
							<c:otherwise>
								<li>
		                        	<a href="http://127.0.0.1:8088/wheremasil/search/${requestScope.category}Search.do?page=${pageNum}&searchWord=${requestScope.search_word}&category=${requestScope.category}&type=${requestScope.type}&title=${requestScope.title }&content=${requestScope.content }&theme=${requestScope.theme }&attraction=${requestScope.attraction }&number=${requestScope.number}">${pageNum}</a>
		                    	</li>
							</c:otherwise>
							</c:choose>
						</c:forEach>
		                <c:choose>
							<c:when test="${PagingBean.nextPageGroup }">
								<li>
									<a href="http://127.0.0.1:8088/wheremasil/search/${requestScope.category}Search.do?page=${PagingBean.endPageOfPageGroup+1}&searchWord=${requestScope.search_word}&category=${requestScope.category}&type=${requestScope.type}&title=${requestScope.title }&content=${requestScope.content }&theme=${requestScope.theme }&attraction=${requestScope.attraction }&number=${requestScope.number}">&raquo;</a>
								</li>
							</c:when>
						<c:otherwise>
							<li><a href="">&raquo;</a></li>
						</c:otherwise>
						</c:choose>	
					</ul>
				</div>
			</div>               		
    	</c:when>
    </c:choose>
</div>
