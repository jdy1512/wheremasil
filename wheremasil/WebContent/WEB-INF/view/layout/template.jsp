<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/wheremasil/script/jquery.js"></script>
<script type="text/javascript" src="/wheremasil/script/jquery-ui.js"></script>

<style type="text/css">
header {
	background-color: #22BBCC;
	color: white;
	text-align: center;
	padding: 5px;
}

nav {
	line-height: 50px; /*줄 간격 - 메뉴이므로 줄간격을 넓게*/
	visibility: hidden;
	background-color: #F5F5DC;
	padding: 15px;
	height: 400px;
	width: 0px;
	float: left;
}

section {
	/*TODO : 페이지를 줄이면 밑으로 내려간다.. 어떻게?*/
	padding: 15px;
	height: 80%;
	float: left;
}

footer {
	background-color: #F5F5F5;
	color: white;
	padding-top: 20px;
	text-align: center;
	height: 50px;
	clear: both;
}
</style>
</head>
<body>

	<div id="tile_header">
		<header>
			<!-- name : tiles 설정 - put- attribute 의  name 속성. -->
			<tiles:insertAttribute name="header" />
		</header>
	</div>

	<div id="tile_nav">
		<nav>
			<tiles:insertAttribute name="menu" />
		</nav>
	</div>

	<div id="tile_section">
		<section>
			<tiles:insertAttribute name="body" />
		</section>
	</div>

	<div id="tile_footer">
		<footer>
			<tiles:insertAttribute name="footer" />
		</footer>
	</div>

</body>
</html>


