<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <title>jQuery UI Tabs - Collapse content</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
	  $(function() {
	    $( "#tabs" ).tabs({
	      collapsible: false
	    });
	  });
	     
 </script>

	<h2 id="before">이전</h2>

<div id="tabs">
  <ul>
    <li><a href="#tabs-1">일정</a></li>
    <li><a href="#tabs-2">교통</a></li>
    <li><a href="#tabs-3">비용</a></li>
    <li><a href="#tabs-4">메모</a></li>
  </ul>
  <div id="tabs-1">
    <table border="1">
	    <tr><td>1</td></tr>
	    <tr><td>2</td></tr>
	    <tr><td>3</td></tr>
    </table>
  </div>
  <div id="tabs-2">
    <table border="1">
	    <tr><td>1</td></tr>
	    <tr><td>2</td></tr>
	    <tr><td>3</td></tr>
    </table>
  </div>
  <div id="tabs-3">
     <table border="1">
	    <tr><td>1</td></tr>
	    <tr><td>2</td></tr>
	    <tr><td>3</td></tr>
    </table>
  </div>
    <div id="tabs-4">
     <table border="1">
       <form method="post">
	   	<textarea name="memo" style="margin: 0px; height: 540px; width: 221px; overflow:auto;" wrap="hard" >메모를 해주세요.
	   	${requestScope.plan.title}
	   	
	   	</textarea>
	   </form>
    </table>
  </div>
  
</div>
 