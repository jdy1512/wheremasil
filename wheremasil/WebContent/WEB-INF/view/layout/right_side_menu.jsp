<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <title>jQuery UI Tabs - Collapse content</title>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/black-tie/jquery-ui.css">
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  
  <script>
     var dayAllCount=0; //총 여행 날짜
     var dayCount=1; // 현재 day
      var courseCount=[];
     
      function setSchedule(html, areaId) {
       $("#tab" + dayCount + " #tabs-1").append('<fieldset><legend>Course'+courseCount[dayCount-1]+'</legend><table id="areaList"><tr>'+
                       '<td>' + html +'</td></tr></table></fieldset>');

       $("#tab" + dayCount + " #tabs-2").append(
             "<fieldset><legend>Course"+courseCount[dayCount-1]+"</legend>" + "<input type='hidden' name='scheduleList:"+dayCount+",costList:"+courseCount[dayCount-1]+",areaId' value='" + areaId + "'>" + "<table>" +
             "<tr><td>식비</td><td style='padding-left:6px'><input type='number' name='scheduleList:"+dayCount+",costList:"+courseCount[dayCount-1]+",costFood' value='0' size='9'></td></tr>"+
            "<tr><td>교통</td><td style='padding-left:6px'><input type='number' name='scheduleList:"+dayCount+",costList:"+courseCount[dayCount-1]+",costVehicle' value='0' size='9'></td></tr>"+
            "<tr><td>숙박</td><td style='padding-left:6px'><input type='number' name='scheduleList:"+dayCount+",costList:"+courseCount[dayCount-1]+",costStay' value='0' size='9'></td></tr>"+
            "<tr><td>기타</td><td style='padding-left:6px'><input type='number' name='scheduleList:"+dayCount+",costList:"+courseCount[dayCount-1]+",costEtc' value='0' size='9'></td></tr></table></fieldset>");
      courseCount[dayCount-1]++;
    };
   
    // schedule = jquery 객체
    function removeSchedule(course) {
      $("#tab" + dayCount + " #tabs-1 fieldset:contains(" + course + ")").remove();
      $("#tab" + dayCount + " #tabs-2 fieldset:contains(" + course + ")").remove();

		// tab1 값 초기화
		var reCount = 1;
		$("#tab" + dayCount + " #tabs-1 fieldset").children("legend").each(function() {
			$(this).text("Course" + reCount++);
		});
		// tab2 값 초기화
		reCount = 1;
		$("#tab" + dayCount + " #tabs-2 fieldset").each(function() {
			$(this).children("legend").text("Course" + reCount);
			$(this).find("input").each(function() {
				var nameSplit = $(this).attr("name").split(",");
				nameSplit[1] = nameSplit[1].split(":")[0] + ":" + reCount;
				$(this).attr("name", nameSplit[0] + "," + nameSplit[1] + "," + nameSplit[2]);
			});
			reCount++;
		});
		
		courseCount[dayCount - 1]--;
	 }
	 
 	 //오른쪽 탭 만들기
	  $(function() {

      dayAllCount=calDateRange("${requestScope.plan.startDate}","${requestScope.plan.endDate}")+1;
      day(dayCount);
      makeDiv(dayAllCount);
      
      $(".tabs").tabs({
            collapsible: false
          });
      
		$("#schedule_form").submit(function() {
			if (schedulePath.length == 0) {
				alert("일정을 선택해주세요.");
				return false;
			}
			return true;
		});
     });// end of function;
     

     function makeDiv(dayAllCount){
          for(var i=1;i<=dayAllCount;i++){
           courseCount[i-1]=1;
           var display="display:none;";
           if (i == 1) {
              display="display:block;";
           }
            $("#rightContent").append('<div class="tabs" id="tab'+i+'"style="'+display+'">'+
            '<ul><li><a href="#tabs-1">일정</a></li><li><a href="#tabs-2">비용</a></li><li><a href="#tabs-3">메모</a></li></ul>'+
             '<div id="tabs-1"></div>'+
             '<div id="tabs-2"></div>'+
            '<div id="tabs-3"><table border="1">'+
                 '<textarea name="scheduleList:'+i+',costList:0,memo" style="margin: 0px; height: 540px; width: 221px; overflow:auto;" wrap="hard" >메모를 해주세요.</textarea>'+
               '</table></div></div>');
          }
          
}

   /*
     * 두 날짜의 차이를 일자로 구한다.(조회 종료일 - 조회 시작일)
     * @return 기간에 해당하는 일자
     */
    function calDateRange(val1, val2)
    {
      var stYear = val1.substring(0,4);
      var stMonth = val1.substring(4,6);
      var stDay= val1.substring(6,8);
      
      var endYear = val2.substring(0,4);
      var endMonth = val2.substring(4,6);
      var endDay= val2.substring(6,8);

        // 월 - 1(자바스크립트는 월이 0부터 시작하기 때문에...)
        // Number()를 이용하여 08, 09월을 10진수로 인식하게 함.
        stMonth = (Number(stMonth) - 1) + "";
        endMonth = (Number(endMonth) - 1) + "";

        var fromDate = new Date(stYear, stMonth, stDay);
        var toDate = new Date(endYear, endMonth, endDay);
       var date = (toDate.getTime() - fromDate.getTime()) / 1000 / 60 / 60 / 24;
        return date;
    }
   
   // day 다음 버튼 누른 후의 작업.
   function afterDayCheck(){
      if(dayCount < dayAllCount){
         $("#tab"+dayCount).hide();
         dayCount++;
         $("#tab"+dayCount).show();
         
      }else if(dayCount==dayAllCount){
         alert("마지막 페이지입니다.");
      }
         day(dayCount);
   }
   
   // day 이전 버튼 누른 후의 작업.
   function beforeDayCheck(){
      if(1<dayCount){
         $("#tab"+dayCount).hide();
         dayCount--;
         $("#tab"+dayCount).show();
      }else if(dayCount==1){
         alert("첫번째 페이지입니다.");
      }
         day(dayCount);
   }
   
   // 화면에 현재day 출력.
   function day(dayCount) {
      $("#day").html("<h2 align='center'>DAY"+dayCount+"</h2>");
   }

 </script>

<input type="button" class="img_button_before" name="before" onclick="beforeDayCheck()" style="float:left;"><input type="button"  class="img_button_next" name="after" onclick="afterDayCheck()" style="float:right;"><div id="day"></div>

<form id="schedule_form" method="post" action="/wheremasil/plan/session/planInfo.do">

   <div id="rightContent"></div>
   <input type="hidden" name="title" value="${requestScope.plan.title }">
   <input type="hidden" name="theme" value="${requestScope.plan.theme }">
   <input type="hidden" name="groupNum" value="${requestScope.plan.groupNum}">
   <input type="hidden" name="startDate" value="${requestScope.plan.startDate }">
   <input type="hidden" name="endDate" value="${requestScope.plan.endDate }">
   <input type="submit" class="submit_plan" value="Planner 완성" style="width:320px;">
  </form>
