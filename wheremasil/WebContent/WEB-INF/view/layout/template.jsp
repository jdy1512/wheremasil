<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/wheremasil/script/jquery.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link href="https://maxcdn.bootstrapcdn.com/bootswatch/3.3.4/cosmo/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<!-- pace : 프로그레스바 lib -->
<script data-pace-options='{ "document": false, "ajax": true, "eventLag": false }' src="/wheremasil/script/pace.js"></script>
<link rel="stylesheet" href="/wheremasil/css/pace/orange/pace-theme-center-atom.css" />

<!-- SearchCSS -->
<link rel="stylesheet" href="/wheremasil/css/search/search.css">

<style type="text/css">

header {
	text-align: left;
	padding: 13px;
	height:57px;
	background-color:#4E5D6C;
}
body {

	background-color: #ffffff;
}
.left_nav {
	line-height: 50px; /*줄 간격 - 메뉴이므로 줄간격을 넓게*/
	background-color: #FFFFFF;
	width:18%;
	margin-top: 5px;
	margin-bottom: 5px;
	overflow-y:scroll;
	float: left;
}
.right_nav {
	line-height: 50px; /*줄 간격 - 메뉴이므로 줄간격을 넓게*/
	background-color: #FFFFFF;
	width:18%;
	margin-top: 5px;
	margin-bottom: 5px;
	margin-right: 0px;
	margin-left: 0px;
	padding:0px;
	overflow-y:scroll;
	float: right;
}
section {
	/*TODO : 페이지를 줄이면 밑으로 내려간다.. 어떻게?*/
	padding-top: 5px;
	padding-bottom: 5px;
	float: left;
}
footer {
 	padding-top: 20px;
	background-color: #222222;
	color: gray;
	text-align: center;
	clear: both;
	margin-right: 0px;
	margin-left: 0px;
	padding-right:0px;
}

#videobcg { 
	position: absolute;
	top: -200px;
	left: 0px;
	min-width: 100%;
	min-height:840px;
	width: auto;
	height: auto;
	z-index: -1;
	overflow: hidden;
}
.main_center { position:absolute; top:70%; left:50%; width:40%; height:30%; overflow:hidden; margin-top:-15%; margin-left:-20%;}
h1 {
    text-transform: uppercase;
    text-align: center;
    color: #666;
    margin: 0 0 30px 0;
    letter-spacing: 4px;
    font: normal 26px/1 Verdana, Helvetica;
    position: relative;
}
h1:after, 
h1:before {
    background-color: #777;
    content: "";
    height: 1px;
    position: absolute;
    top: 15px;
    width: 120px;   
}
h1:after {      
    right: 0;
}
h1:before {
    background-image: linear-gradient(right, #777, #fff);
    left: 0;
}

.main_button {
   border: 1px solid #0a3c59;
   outline: 0;
   background: #3e3e3e;
   background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#3e3e3e));
   background: -webkit-linear-gradient(top, #ffffff, #3e3e3e);
   background: -moz-linear-gradient(top, #ffffff, #3e3e3e);
   background: -ms-linear-gradient(top, #ffffff, #3e3e3e);
   background: -o-linear-gradient(top, #ffffff, #3e3e3e);
   background-image: -ms-linear-gradient(top, #ffffff 0%, #3e3e3e 100%);
   padding: 7.5px 15px;
   -webkit-border-radius: 30px;
   -moz-border-radius: 30px;
   border-radius: 30px;
   -webkit-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   -moz-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   text-shadow: #7ea4bd 0 1px 0;
   color: #ffffff;
   font-size: 13px;
   font-family: helvetica, serif;
   text-decoration: none;
   vertical-align: middle;
   }
.main_button:hover {
   border: 1px solid #0a3c59;
   outline: 0;
   text-shadow: #1e4158 0 1px 0;
   background: #3e3e3e;
   background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#3e3e3e));
   background: -webkit-linear-gradient(top, #ffffff, #3e3e3e);
   background: -moz-linear-gradient(top, #ffffff, #3e3e3e);
   background: -ms-linear-gradient(top, #ffffff, #3e3e3e);
   background: -o-linear-gradient(top, #ffffff, #3e3e3e);
   background-image: -ms-linear-gradient(top, #ffffff 0%, #3e3e3e 100%);
   color: #fff;
   }
.main_button:active {
   outline: 0;
   text-shadow: #1e4158 0 1px 0;
   border: 1px solid #0a3c59;
   background: #ffffff;
   background: -webkit-gradient(linear, left top, left bottom, from(#3e3e3e), to(#3e3e3e));
   background: -webkit-linear-gradient(top, #3e3e3e, #ffffff);
   background: -moz-linear-gradient(top, #3e3e3e, #ffffff);
   background: -ms-linear-gradient(top, #3e3e3e, #ffffff);
   background: -o-linear-gradient(top, #3e3e3e, #ffffff);
   background-image: -ms-linear-gradient(top, #3e3e3e 0%, #ffffff 100%);
   color: #fff;
}
.plan_button {
   outline: 0;
   border: 0px solid #0a3c59;
   background: #a8a8a8;
   background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#a8a8a8));
   background: -webkit-linear-gradient(top, #ffffff, #a8a8a8);
   background: -moz-linear-gradient(top, #ffffff, #a8a8a8);
   background: -ms-linear-gradient(top, #ffffff, #a8a8a8);
   background: -o-linear-gradient(top, #ffffff, #a8a8a8);
   background-image: -ms-linear-gradient(top, #ffffff 0%, #a8a8a8 100%);
   padding: 8.5px 17px;
   -webkit-border-radius: 7px;
   -moz-border-radius: 7px;
   border-radius: 7px;
   -webkit-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
   -moz-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
   box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
   text-shadow: #9c9c9c 0 1px 0;
   color: #575757;
   font-size: 12px;
   font-family: helvetica, serif;
   text-decoration: none;
   vertical-align: middle;
   width: 100%;
   height: 20px;
   }
.plan_button:hover {
   outline: 0;
   border: 0px solid #0a3c59;
   text-shadow: #575757 0 1px 0;
   background: #a8a8a8;
   background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#a8a8a8));
   background: -webkit-linear-gradient(top, #ffffff, #a8a8a8);
   background: -moz-linear-gradient(top, #ffffff, #a8a8a8);
   background: -ms-linear-gradient(top, #ffffff, #a8a8a8);
   background: -o-linear-gradient(top, #ffffff, #a8a8a8);
   background-image: -ms-linear-gradient(top, #ffffff 0%, #a8a8a8 100%);
   color: #575757;
   }
.plan_button:active {
   outline: 0;
   text-shadow: #575757 0 1px 0;
   border: 0px solid #0a3c59;
   background: #ffffff;
   background: -webkit-gradient(linear, left top, left bottom, from(#a8a8a8), to(#a8a8a8));
   background: -webkit-linear-gradient(top, #a8a8a8, #ffffff);
   background: -moz-linear-gradient(top, #a8a8a8, #ffffff);
   background: -ms-linear-gradient(top, #a8a8a8, #ffffff);
   background: -o-linear-gradient(top, #a8a8a8, #ffffff);
   background-image: -ms-linear-gradient(top, #a8a8a8 0%, #ffffff 100%);
   color: #575757;
}
.close-thik:after {
  color: #777;
  font: 14px/100% arial, sans-serif;
  position: absolute;
  right: 5px;
  text-decoration: none;
  text-shadow: 0 1px 0 #fff;
  top: 5px;
  content: '✖'; /* UTF-8 symbol */
}
.schedule_close-thik:after {
  position:relative;
  left: 100%;
  top: 0px;
  right: 0px;
  bottom: 0px;
  color: #777;
  font: 14px/100% arial, sans-serif;
  text-decoration: none;
  text-shadow: 0 1px 0 #fff;
  content: '✖'; /* UTF-8 symbol */
}

.infoview_container {
	width:96%;
	padding:2%;
	border: 1px solid #0a3c59;
	overflow-y:hidden;
	clear:both;
}
.infoview_image_block {
	width:34%;
	float:left;
	display:-webkit-box;
	-webkit-box-pack:center;
	-webkit-box-align:center;
}
.infoview_image {
	width:70px;
	height:70px;
	margin-top:15px;
}	
.infoview_text_block {
	width:66%;
	min-height:inherit;
	max-height:inherit;
	text-align:center;
	float:right;
}
.infoview_text_title {
	width:100%;
	height:0px;
	margin:0 auto;
	font-size:90%;
}
.infoview_text_content {
	width:100%;
	padding-top:20%;
	line-height:120%;
	font-size:80%;
}

.borderme {
	border:none;
}
.borderme:hover {
	border:#ff0000 solid 1px;
}
.schedule_borderme {
	border:none;
	-webkit-filter: blur(0px);
}
.schedule_borderme:hover {
	border:#ff0000 solid 1px;
	-webkit-filter: blur(1px);
}

.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:260px;max-height:500px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;height:18px}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}

input.img_button_before {
       background: url(/wheremasil/uploads/images/icon/Last_Track_Left_Arrow_32.png) no-repeat;
       border: none;
       width: 32px;
       height: 32px;
       margin-left:20px;
       margin-top:20px;
       cursor: pointer;
}
input.img_button_next {
       background: url(/wheremasil/uploads/images/icon/Skip_Track_32.png) no-repeat;
       border: none;
       width: 32px;
       height: 32px;
       margin-right:20px;
       margin-top:20px;
       cursor: pointer;
}
input.submit_plan {
	   background-color: #FFC107;
       border: none;
       width: auto;
       height: auto;
       cursor: pointer;
       font-variant:small-caps;
       font-weight:bold;
       font-size:25px;

}
input.img_button_login {
       background: url(/wheremasil/uploads/images/icon/login_btn.png) no-repeat;
	   float:right;
	   height: 121px;
	   width: 50px;
	   border: 0px;
	   border-radius:7px;
	   color:white;
	   font-size:22px;
}
.schedule_container {
	width: 100%;
	height: 700px;
	margin: 0 0 auto;
	padding: 0 0 auto;
	text-align: center;
	background-color: #EEEEEE;
}

.schedule_container .itembox {
	width: 1424px;
	height: inherit;
	margin: 0 auto;
	padding: 0 auto;
	text-align: center;
	float: left;
}

.schedule_container .side {
	width: 470px;
	height: inherit;
	margin: 0 auto;
	padding: 0 auto;
	border-left: 1px solid black;
	
	text-align: center;
	float: left;
}

.schedule_container .side .map {
	width: 380px;
	height: 380px;
	margin: 20px 45px;
	padding: 0 auto;
	border: 1px solid black;
}

.schedule_container .side .cost {
	width: 300px;
	height: 200px;
	margin: 10px 85px;
	padding: 0 auto;
	border: 1px solid black;
}

.schedule_container .itembox .root {
	position: absolute;
	width: 1144px;
	height: 560px;
	margin-top: 30px;
	margin-bottom: 50px;
	margin-left: 130px;
	margin-right: 130px;
	padding-top: 50px;
	padding-left: 50px;
	padding-right: 50px;
	overflow-x: hidden;
	
	-webkit-box-shadow: 5px 5px 30px #D3D3D3;
	-moz-box-shadow: 5px 5px 30px #D3D3D3;
	box-shadow: 5px 5px 30px #D3D3D3;
	background-image: -moz-linear-gradient(top, #FFFFFF, #D3D3D3);
	background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0.00, #FFFFFF), color-stop(1.0, #D3D3D3));
	background-color: #DDDDDD;
	font-family: Verdana, Geneva, sans-serif;
	font-size: 12pt;
	color: #888888;
}

.schedule_container .itembox .day {
	position: absolute;
	width: 300px;
	height: 460px;
	margin: 0 auto;
	padding: 0 auto;
	overflow-y: auto;
	
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 5px 5px 30px #D3D3D3;
	-moz-box-shadow: 5px 5px 30px #D3D3D3;
	box-shadow: 5px 5px 30px #D3D3D3;
	background-color: #FFF;
	font-family: Verdana, Geneva, sans-serif;
	font-size: 12pt;
	color: #888888;
	text-align: center;
}

.slide_prev {
	position: absolute;
	left: 35px;
	top: 400px;
	background: url(/wheremasil/uploads/images/icon/Last_Track_Left_Arrow_64.png) no-repeat;
    border: none;
    width: 64px;
    height: 64px;
    cursor: pointer;
	
}

.slide_next {
	position: absolute;
	left: 1310px;
	top: 400px;
    background: url(/wheremasil/uploads/images/icon/Skip_Track_64.png) no-repeat;
    border: none;
    width: 64px;
    height: 64px;
    cursor: pointer;
}

.main_map {
	width: 100%;
	height: 100%;
	margin: 0 0;
	padding: 0 0;
}

.abody
{   position:absolute; 
	top:95%;
	display:none;
	width:1880px;
	float:left;
}
.mapImg
{
	width:150px;
	height:300px;
	background-color:#FFF;
	
	float:left;
	margin:30px;
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

	<div id="tile_left_nav" style="visibility:hidden">
		<nav class="left_nav">
			<tiles:insertAttribute name="left_menu" />
		</nav>
	</div>

	<div id="tile_section">
		<section>
			<tiles:insertAttribute name="body" />
		</section>
	</div>
	
	<div id="tile_right_nav" style="visibility:hidden">
		<nav class="right_nav">
			<tiles:insertAttribute name="right_menu" />
		</nav>
	</div>

	<div id="tile_footer">
		<footer>
			<tiles:insertAttribute name="footer" />
		</footer>
	</div>

</body>
</html>


