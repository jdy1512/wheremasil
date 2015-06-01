<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <title>jQuery UI Tabs - Collapse content</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  
  <script>
 	 var dayAllCount=0; //총 여행 날짜
 	 var dayCount=1; // 현재 day
  	
 	 //오른쪽 탭 만들기
	  $(function() {
	    $( "#tabs" ).tabs({
	      collapsible: false
	    });
	    
	   dayAllCount=calDateRange("${requestScope.plan.startDate}","${requestScope.plan.endDate}")+1;
	   day(dayCount);
	  });
	     
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
 
        return (toDate.getTime() - fromDate.getTime()) / 1000 / 60 / 60 / 24;
    }
	
	// day 다음 버튼 누른 후의 작업.
	function afterDayCheck(){
		if(dayCount < dayAllCount){
			dayCount++;
		}else if(dayCount==dayAllCount){
			alert("마지막 페이지입니다.");
		}
			day(dayCount);
	}
	
	// day 이전 버튼 누른 후의 작업.
	function beforeDayCheck(){
		if(1<dayCount){
			dayCount--;
		}else if(dayCount==1){
			alert("첫번째 페이지입니다.");
		}
			day(dayCount);
	}
	
	// 화면에 현재day 출력.
	function day(dayCount) {
		$("#day").html("DAY"+dayCount);
	}
	

 </script>
<input type="button" name="before" value="이전" onclick="beforeDayCheck()"><div id="day"></div><input type="button" name="after" value="다음" onclick="afterDayCheck()">

<div id="tabs">
  <ul>
    <li><a href="#tabs-1">일정</a></li>
    <li><a href="#tabs-2">비용</a></li>
    <li><a href="#tabs-3">메모</a></li>
  </ul>
  <div id="tabs-1">
       <table border="1">
		    <tr><td>1</td><td>이미지</td></tr>
		    <tr><td>2</td><td>이미지</td></tr>
		    <tr><td>3</td><td>이미지</td></tr>
    	</table>
  </div>
  <div id="tabs-2">
    <table border="1">
	    <tr>
	    	<td rowspan="4">1</td>
	        <td>식비</td>
	        <td><input type="text" name="costFood"></td>
	    </tr>
	    <tr>
		    <td>교통비</td>
		    <td><input type="text" name="costVehicle"></td>    
		</tr>
	    <tr>
	    	<td>숙박비</td>
		    <td><input type="text" name="costStay"></td>  
	    </tr>
	    <tr>
	    	<td>기타</td>
		    <td><input type="text" name="costEtc"></td>  
	    </tr>
    </table>
  </div>
   <div id="tabs-3">
     <table border="1">
       <form method="post">
	   	<textarea name="memo" style="margin: 0px; height: 540px; width: 221px; overflow:auto;" wrap="hard" >메모를 해주세요.
	   	${requestScope.plan.title}	
	   	</textarea>
	   </form>
    </table>
  </div>
  
</div>
 