<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


header{
	background-color:skyblue;
	color:white;
	text-align:center;
	padding: 5px;
}
nav{
	line-height: 50px;/*줄 간격 - 메뉴이므로 줄간격을 넓게*/
	background-color:#F5F5DC;
	padding: 15px;
	height:400px;
	width:250px;
	float:left;
}
section{
	/*TODO : 페이지를 줄이면 밑으로 내려간다.. 어떻게?*/
	padding: 15px;
	height:400px;
	float:left;
}
footer{
	background-color:skyblue;
	color:white;
	padding-top:20px;
	text-align:center;
	height:50px;
	clear:both;
}
</style>
</head>
<body>

   <header>
      <!-- name : tiles 설정 - put- attribute 의  name 속성. -->
      <tiles:insertAttribute name="header"/>
   </header>
   
   <nav>
      <tiles:insertAttribute name="menu"/>      
   </nav>
   
   <section>
      <tiles:insertAttribute name="body"/>   
   </section>
   
   <footer>
      <tiles:insertAttribute name="footer"/>   
   </footer>
   
</body>
</html>


