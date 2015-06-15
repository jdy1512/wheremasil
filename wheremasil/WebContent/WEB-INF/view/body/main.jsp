<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=8090c845eb21bcc92becc6f8f3bf61fa&libraries=services"></script>
<script type="text/javascript" src="/wheremasil/script/map_view.js"></script>

<script>
   <c:if test="${ not empty requestScope.plan }">
      alert("${ requestScope.plan.title } 등록 완료");
   </c:if>
   $(function() {
      $("header").css("background-color", "none");
      $("section").css("width","1880px");
      $("section").css("height","1300px");
      $(".left_nav").css("width", "0px");
      $(".right_nav").css("width", "0px");
      $("#bs-example-navbar-collapse-1").css("width", "1880px");

      $("#popup_cancel").on("click", function() {
         $("#popup_layer").css("visibility", "hidden");
      });

      $("#stDate").datepicker({
         dateFormat : 'yymmdd',
         minDate:0,
          onClose: function( selectedDate ) {
           $("#edDate").datepicker( "option", "minDate", selectedDate );
          }
      });
      $("#edDate").datepicker({
         dateFormat : 'yymmdd',
         minDate:0,
         onClose: function( selectedDate ) {
           $("#stDate").datepicker( "option", "maxDate", selectedDate );
          }
      });
      
      // plan id 리스트 select
      getPlanIdList(3);
   });
   
   function getPlanIdList(num) {
      $.ajax({
         url: "/wheremasil/plan/getPlanIdList.do",
         dataType: "json",
         type: "POST",
            timeout : 30000,
            data : {"num" : num},
         success: function(data) {
            var planIdList = [];
            for (var idx = 0; idx < data.length; idx++) {
               planIdList[idx] = data[idx].planId;
            }
            getPlanMapList(planIdList, "plan_map_", "main_map");// {'L000','L001',...}, map parent id="plan_map_1~", map class="main_map"
         }// end of success(getPlanIdList)
      });// end of getPlanIdList(ajax)
   }

   function fn_layer_popup() {
      var layer = document.getElementById("popup_layer");
      layer.style.visibility = "visible"; //반대는 hidden 

   }
</script>

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

<div class="section">
   <div class="main_center" >
      <p style="text-align: center">
         <font size="200%" color="white"><b>Where are you going ?</b></font>
      </p>

      <div style="text-align: center">
         <h4>
            <font color="white">지금 당장! 어디 마실 나가고 싶다면?</font>
         </h4>
      </div>
      <div style="position: absolute; left: 48%; top: 58%; width: 200px; height: 60px; overflow: hidden; margin-left: -50px; margin-top: -30px">
         <input type="button" class="btn btn-warning btn-lg" value="START" onclick="fn_layer_popup()">
      </div>
   </div>

   <video id="videobcg" preload="auto" autoplay="true" loop="loop" muted="muted">
      <source src="https://a0.muscache.com/airbnb/static/Seoul-P1-4.mp4"
         type="video/mp4">
      <source src="https://a0.muscache.com/airbnb/static/Seoul-P1-4.webm"
         type="video/webm">
      Sorry, your browser does not support HTML5 video.
   </video>

   <div style="position:absolute;width:1200px;top:92%;left:25%;padding:0 0;margin:0 0;">
      <div style="margin-bottom:30px">
	      <font size="2">
	         <h3>최신 플랜</h3>
	      </font>
   	  </div>
      <div class="col-xs-6 col-md-3" style="float:left;width:300px;height:220px;margin:0 20px;">
        <a href="#" id="plan_map_1" class="thumbnail" style="width:100%;height:100%;">
          <img src="/wheremasil/uploads/images/default/img_not_found.png" alt="...">
        </a>
      </div>
      
      <div class="col-xs-6 col-md-3" style="float:left;width:300px;height:220px;margin:0 20px;">
        <a href="#" id="plan_map_2" class="thumbnail" style="width:100%;height:100%;">
          <img src="/wheremasil/uploads/images/default/img_not_found.png" alt="...">
        </a>
      </div>
      
      <div class="col-xs-6 col-md-3" style="float:left;width:300px;height:220px;margin:0 20px;">
        <a href="#" id="plan_map_3" class="thumbnail" style="width:100%;height:100%;">
          <img src="/wheremasil/uploads/images/default/img_not_found.png" alt="...">
        </a>
      </div>
   </div>
   
</div>