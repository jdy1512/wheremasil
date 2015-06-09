<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://www.google-analytics.com/ga.js" type="text/javascript"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>





<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>







<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">




<title>Insert title here</title>
</head>

<style type="text/css">
.footer1{
position: absolute;
margin-top:-100%;
z-index: 10;
float: 
}

 html, body {
             height: 100%;
             margin: 0pt;
        }
        .Frame {
             display: table;
             height: 100%;
             width: 100%;
        }
        .Row {
             display: table-row;
             height: 1px;
        }
        .Row.Expand {
             height: auto;
        }



li {
  line-height: 20px;
}


.slick-slider
{
    position: relative;

    display: block;

    -moz-box-sizing: border-box;
         box-sizing: border-box;

    -webkit-user-select: none;
       -moz-user-select: none;
        -ms-user-select: none;
            user-select: none;

    -webkit-touch-callout: none;
    -khtml-user-select: none;
    -ms-touch-action: pan-y;
        touch-action: pan-y;
    -webkit-tap-highlight-color: transparent;
}





.slick-initialized .slick-slide
{
    display: block;
}


.slick-slider .slick-list
{
    -webkit-transform: translate3d(0, 0, 0);
       -moz-transform: translate3d(0, 0, 0);
        -ms-transform: translate3d(0, 0, 0);
         -o-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
}



.slick-slider
{
    margin-bottom: 30px;
}

.span10
{
	width:90%;
	margin-left:20px;
}


.btn {
	border-color: rgb(204, 204, 204); color: rgb(51, 51, 51); background-color: rgb(255, 255, 255);
}


.span 
{
	margin-left:10px;
	float:left!important;
}


.label
{
	background-color:rgb(153, 153, 153);
}




.stubby_container
{


	text-align:center;
top-padding:-30%;

	position: relative;
  display: inline-block;
 
  width: 50%;
  padding: 1em;

  color: black;
}

.stubby_content
{
	text-align:left;
	width:1014px;
	padding-top:70px;
	display:inline-block;
	background:#fff;
	padding-left: 0;
	margin-left: -150px;
	-webkit-border-radius: 0 0 6px 6px;
	-moz-border-radius: 0 0 6px 6px;
	border-radius: 0 0 6px 6px;
	-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.15);
	-moz-box-shadow: 0 1px 2px rgba(0,0,0,.15);
	box-shadow: 0 1px 2px rgba(0,0,0,.15);
}	

    .outer {
  display: table;
  width: 100%;
  height: 100%;
 
}
.inner {
  display: table-cell;
  vertical-align: middle;
  text-align: center;
}


.pace-done{
background: rgba(237, 237, 237, 1);
}



</style>
자바스크립트
<script type="text/javascript">
function logincheck(){
	
	if($("#login_info").val()==""){
		alert("로그인부터하세여");
		
	}else{
		
	}
}

function Wlogin(){
	if($("#login_info").val()==""){
		alert("로그인부터하세여");
		
	}else{
		alert($("#categori").val());
	}
	
}

function newsTypeChanged(){
	alert()$( "#newsType option:selected" ).text());
	
	
}

</script>
<body>

<form>
<input id="login_info" type="hidden" value="${sessionScope.login_info}"/>
</form>

<div class="container" style=" margin-top: -8%;">
  <div class="outer">
    <div class="inner">
<div class="stubby_container"
style="
	height:100px;
	text-align:center;">
<div class="stubby_content">
<ul id="catagori" class="nav nav-tabs" role="tablist" style="margin-top: 0px; margin-left: 0px; list-style-type: none;">
		<li class="active" ><a href="index.asp"><h5>전체</h5></a></li>
		<li><a href="index.asp?newstype=ALB"><h5>앨범</h5></a></li>
		<li><a href="index.asp?newstype=MSP"><h5>숙소관련</h5></a></li>
		<li><a href="index.asp?newstype=QNA"><h5>일반질문</h5></a></li>
		<li><a href="index.asp?newstype=HOT"><h5>특가정보</h5></a></li>
		<li><a href="index.asp?newstype=INF"><h5>일반정보</h5></a></li>
		<li><a href="index.asp?newstype=FRE"><h5>자유</h5></a></li>
		<li><a href="index.asp?newstype=FND"><h5>동행찾기</h5></a></li>
		<li><a href="index.asp?newstype=UPD"><h5>발견</h5></a></li>
		<li><table><tbody><tr><td style="width: 10px;">&nbsp;</td></tr></tbody></table></li>
	</ul>
	

<div class="row">

<div class="col-md-8" style="border-right-color: rgb(239, 239, 239); border-right-width: 1px; border-right-style: solid;">

<div class="alert alert-warning alert-dismissible" role="alert" style="margin-top: 10px;">

  <button class="close" type="button" data-dismiss="alert"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
  <strong>
 광장은 여행의 정보와 이야기를 자유롭게 공유하는 공간이에요. <br>
여행자들을 도와주시는 멘토분들 덕분에 광장이 활발하게 운영될 수 있답니다.<br>
광장에 질문을 올리시는 분들은 아래 두 가지만 지켜주세요!<br>
1. 조금만 시간을 투자하면 찾을 수 있는 정보는 먼저 스스로 찾아주세요.<br>
 반복되는 기초적인 질문은 지쳐요:( <br>
2. 답변을 얻은 후엔 감사를 표시해주세요.<br>
 주고받는 인사속에 훈훈한 광장 :)

   </strong>
</div>



<div class="row" style="margin-top: 5px; margin-left: 0px;">
				<div class="span" style="width: 70px; height: 100px; overflow: hidden; position: relative;"><img width="70" id="img_pf" style="border: 4px solid rgb(255, 255, 255);" src="http://192.168.7.122:8082/wheremasil/uploads/images/default/no-photo.png	" border="0"></div>
				<div class="span" style="width: 570px;">
					<input name="optGuidebook" id="att_guidebook" type="hidden" value="">
					<input name="optMap" id="att_map" type="hidden" value="">
					<input name="optRoute" id="att_route" type="hidden" value="">
					<input name="optPlan" id="att_plan" type="hidden" value="">
					<input name="optLink" id="att_link" type="hidden" value="">

					<textarea name="msg" id="msg" style="width: 100%;" onclick="logincheck();" rows="4"></textarea>
					<div style="clear: both;"></div>
					<div class="row" style="margin-top: 7px;">
						<div class="span8">
						<span style="float: right;">
						<select name="newsType" id="newsType" style="width: 110px;" onchange="newsTypeChanged()">
							<option value="QNA">질문</option>
							
							<option value="FND">동행찾기</option>
							<option value="INF">정보</option>
							<option value="MSP">숙소리뷰</option>
							<option value="HOT">할인정보</option>
							<option value="FRE">자유</option>
						</select>

						&nbsp;&nbsp;<a class="btn btn-success btn-lg" style="width: 150px; margin-right: 20px;" href="javascript:Wlogin();">글쓰기</a>
						</span>
						<span class="label">첨부</span>
						<select name="attType" class="span3" id="attachType" onchange="attach();">
							<option value="">첨부하기</option>
							<option value="link">링크</option>
							<option value="map">지도</option>
							<option value="route">루트</option>
							<option value="plan">내 계획</option>
							<option value="guidebook">가이드북</option>
						</select>		
						</div>
					</div>
 					<div class="row" style="margin-top: 7px; margin-bottom: 5px;">
						<div class="span8">
							<p id="label_for_write_mentors" style="text-align: right; color: rgb(105, 105, 105); font-size: 8pt;">

나의 멘토들(0명)에게 중요한 질문으로 표시되며 메일로 질문이 전송됩니다.</p>
							<p class="hide" id="label_for_write_mentees" style="text-align: right; color: rgb(105, 105, 105); font-size: 8pt; display: none;"> 나의 멘티들(0명)에게 이 정보가 중요한 정보로 표시됩니다.</p>
						</div>
					</div>
					<div style="margin-top: 7px; margin-bottom: 15px;">
							<div id="att_map_div"></div>
					</div>
				</div>
			</div>


<div id="resvSquare">
<hr></hr>

<div class="row item" style="margin-left: 0px; border-top-color: rgb(239, 239, 239); border-top-width: 1px; border-top-style: solid;">
		<div style="padding: 7px; float: left;">
			<img width="48" onerror="this.src='/img_v6/img_pfnull.gif'" src="/pfimg/2/1/dbswndz_sq.jpg" border="0">
		</div>
		<div id="item_1000000000115212999" style="width: 510px; float: left;">
			<ul class="unstyled" style="width: 100%; list-style-type: none;">
				<li><h6><a href="/plan/profile.asp?id=dbswndz">dbswndz</a>  &nbsp;</h6></li>
				<li>
				
				<font class="needTranslate">파리에서 에어비엔비 숙소 같이 쓰실분 구해요! 위치 최고 4명에서 쓸수있는방인데 지금 2명에서 쓸 예정이고 한명더 구해서 셋이서 쓰면 좋을거같아요 위치는 루브르 샹제리제쪽이구요 6/27-29 이틀 머무실 여자분 구해요! 하루에 50불씩입니다! 관심있으시면 댓글 남겨주세요~</font>
				
					<span class="label">동행찾기</span>
				
				</li>

				<li class="itemrow withheight">&nbsp;<a title="이 게시물을 추천합니다!" href="javascript:itshelpful('1000000000115212999')"><span class="ui-icon ui-icon-heart" style="float: left;"></span><span id="btn_helpful_1000000000115212999" style="color: rgb(105, 105, 105);">추천하기</span></a> ·  35분전</li>

				
				<li class="itemrow withheight hide" id="helpfulbox_container_1000000000115212999">
<span id="helpfulbox_1000000000115212999">
</span>
				</li>


				
				<li class="itemrow">
	
					<div id="cmt_container_1000000000115212999">
					
					</div>
					
					<div class="container_commentbox">
						<input name="se" id="se" type="hidden" value="1000000000115212999">
						<input name="p" id="p" type="hidden" value="">
						<input name="r" id="r" type="hidden" value="">

						<input class="span8 commentbox" id="commentbox_1000000000115212999" type="text" value="">
					</div>
	
				</li>

			</ul>
		</div>
		<div class="span item_menu hide" id="menu" style="display: none;">
			
			<ul id="jsddm">
				<li><a href="#"><span class="ui-icon ui-icon-triangle-1-s item_menu_btn"></span></a>
					<ul>
						
						<li><a href="javascript:ReportItem(1000000000115212999);">광고/스팸신고</a></li>
					</ul>
				</li>
			</ul>

		</div>
	</div>
	
	<div class="row item" style="margin-left: 0px; border-top-color: rgb(239, 239, 239); border-top-width: 1px; border-top-style: solid;">
		<div style="padding: 7px; float: left;">
			<img width="48" onerror="this.src='/img_v6/img_pfnull.gif'" src="/img_v6/img_pfnull.gif" border="0">
		</div>
		<div id="item_1000000000115211999" style="width: 510px; float: left;">
			<ul class="unstyled" style="width: 100%; list-style-type: none;">
				<li><h6><a href="/plan/profile.asp?id=jeson90">jeson90</a>  &nbsp;</h6></li>
				<li>
				
				<font class="needTranslate">아래 계획과 둘중에 어느 루트가 더 나아보이나요???<br>파리-스위스-뮌헨-베니스(야간열차)<br>파리-뮌헨-스위스-이탈리아</font>
				
					<span class="label">정보</span>
				
				</li>

		<li>
			<table><tbody><tr>
				<td vAlign="top"><a href="/plan/getadvice.asp?s=127761" target="_blank"><img width="120" height="80" src="http://maps.google.com/staticmap?size=120x80&amp;maptype=mobile&amp;path=rgba:0x333333ff,weight:2|51.5,-0.126|48.861,2.342|46.686,7.856|47.046,8.308|48.14,11.579|45.434,12.339|43.769,11.257|41.895,12.482&amp;markers=51.5,-0.126,reds|41.895,12.482,rede&amp;key=ABQIAAAAriWY6VN2eq0XjjFKUdLrvBSVo5uNAna0IGBr7A5fE2H0gZW6dxSbnR_A-0Zpnh5FLUk69fa9L9hi0A"></a></td>
				<td vAlign="top" style="padding-left: 10px;">
					<ul class="unstyled" >
						<li><a class="btn small" href="/plan/getadvice.asp?s=127761" target="_blank">HelpMe 페이지 <span class="label">Updated</span></a></li>
					
						<li><a href="/plan/getadvice.asp?s=127761" target="_blank"><b>플랜 A</b></a></li>
						<li><a href="/plan/getadvice.asp?s=127761" target="_blank">2015년 7월 출발(26일간)</a></li>
						
					</ul>
				</td>
			</tr></tbody></table>
		</li>

				<li class="itemrow withheight">&nbsp;<a title="이 게시물을 추천합니다!" href="javascript:itshelpful('1000000000115211999')"><span class="ui-icon ui-icon-heart" style="float: left;"></span><span id="btn_helpful_1000000000115211999" style="color: rgb(105, 105, 105);">추천하기</span></a> ·  1시간전</li>

				
				<li class="itemrow withheight hide" id="helpfulbox_container_1000000000115211999">
<span id="helpfulbox_1000000000115211999">
</span>
				</li>


				
				<li class="itemrow">
	
					<div id="cmt_container_1000000000115211999">
					
					<div class="row comment_item" id="item_1000000000115211998">
						<div class="span comment_img">
							<a href="/plan/profile.asp?id=jyoon0411" target="_blank"><img width="36" id="img_pf" onerror="this.src='/img_v6/img_pfnull.gif'" src="/pfimg/5/7/jyoon0411_sq.jpg" border="0"></a>
						</div>
						<div class="span comment_content">
							<ul class="unstyled">
							<li><a href="/plan/profile.asp?id=jyoon0411" target="_blank"><b>jyoon0411</b></a>&nbsp;파리 스위스 뮌헨 베니스가 나아요 :)</li>
							<li><span style="float: left;">1시간전 · 
								
								<a title="이 댓글이 좋아요! " href="javascript:itshelpful('1000000000115211998')"><u><span id="btn_helpful_1000000000115211998" style="color: rgb(105, 105, 105);">Like</span></u></a> · </span><span class="helpfulbox" id="helpfulbox_1000000000115211998"></span></li>
							</ul>
						</div>
					</div>
					
					</div>
					
					<div class="container_commentbox">
						<input name="se" id="se" type="hidden" value="1000000000115211999">
						<input name="p" id="p" type="hidden" value="">
						<input name="r" id="r" type="hidden" value="">

						<input class="span8 commentbox" id="commentbox_1000000000115211999" type="text" value="">
					</div>
	
				</li>

			</ul>
		</div>
		<div class="span item_menu hide" id="menu" style="display: none;">
			
			<ul id="jsddm">
				<li><a href="#"><span class="ui-icon ui-icon-triangle-1-s item_menu_btn"></span></a>
					<ul>
						
						<li><a href="javascript:ReportItem(1000000000115211999);">광고/스팸신고</a></li>
					</ul>
				</li>
			</ul>

		</div>
	</div>
<hr></hr>

<!-- resvSquare -->
</div>
<div class="row" id="row_btnmore">
		<input name="page" id="page" type="hidden" value="1">
		<a class="btn span10" style="text-align: center;" href="javascript:getLogs(1);">더보기</a>
	</div>

<!--  mid 8 -->
</div>



<div class="col-md-4">





	<h5>최근 등록된 글</h5>

				<table width="200" style="padding: 0px; border: 0px currentColor; margin-bottom: 10px;"><tbody><tr>
				<td vAlign="top" style="margin: 0px; padding: 0px; border: 0px currentColor;"><a href="/plan/profile.asp?id=dbswndz"><img width="36" id="img_pf" onerror="this.src='/img_v6/img_pfnull.gif';" src="/pfimg/2/1/dbswndz_sq.jpg" border="0"></a></td>
				<td vAlign="top" style="margin: 0px; border: 0px currentColor; padding-top: 0px; padding-bottom: 0px; padding-left: 7px;">
					<a href="/plan/profile.asp?id=dbswndz "><font class="small" style="color: gray;"><b>dbswndz</b></font></a> <a href="javascript:shownotifydetail('newsfeed','1000000000115212999','')"><font class="small">파리에서 에어비엔비 숙소 같이 쓰실분 구해요!..</font></a> <font class="small">35분전</font>
				</td>
				</tr></tbody></table>

				<table width="200" style="padding: 0px; border: 0px currentColor; margin-bottom: 10px;"><tbody><tr>
				<td vAlign="top" style="margin: 0px; padding: 0px; border: 0px currentColor;"><a href="/plan/profile.asp?id=skyoon06"><img width="36" id="img_pf" onerror="this.src='/img_v6/img_pfnull.gif';" src="/img_v6/img_pfnull.gif" border="0"></a></td>
				<td vAlign="top" style="margin: 0px; border: 0px currentColor; padding-top: 0px; padding-bottom: 0px; padding-left: 7px;">
					<a href="/plan/profile.asp?id=skyoon06 "><font class="small" style="color: gray;"><b>skyoon06</b></font></a> <a href="javascript:shownotifydetail('newsfeed','1000000000115196996','')"><font class="small"> 좋아요</font></a> <font class="small">57분전</font>
				</td>
				</tr></tbody></table>

				<table width="200" style="padding: 0px; border: 0px currentColor; margin-bottom: 10px;"><tbody><tr>
				<td vAlign="top" style="margin: 0px; padding: 0px; border: 0px currentColor;"><a href="/plan/profile.asp?id=jyoon0411"><img width="36" id="img_pf" onerror="this.src='/img_v6/img_pfnull.gif';" src="/pfimg/5/7/jyoon0411_sq.jpg" border="0"></a></td>
				<td vAlign="top" style="margin: 0px; border: 0px currentColor; padding-top: 0px; padding-bottom: 0px; padding-left: 7px;">
					<a href="/plan/profile.asp?id=jyoon0411 "><font class="small" style="color: gray;"><b>jyoon0411</b></font></a> <a href="javascript:shownotifydetail('newsfeed','1000000000115207997','')"><font class="small">파리는 2박하기 너무................</font></a> <font class="small">1시간전</font>
				</td>
				</tr></tbody></table>

				<table width="200" style="padding: 0px; border: 0px currentColor; margin-bottom: 10px;"><tbody><tr>
				<td vAlign="top" style="margin: 0px; padding: 0px; border: 0px currentColor;"><a href="/plan/profile.asp?id=jyoon0411"><img width="36" id="img_pf" onerror="this.src='/img_v6/img_pfnull.gif';" src="/pfimg/5/7/jyoon0411_sq.jpg" border="0"></a></td>
				<td vAlign="top" style="margin: 0px; border: 0px currentColor; padding-top: 0px; padding-bottom: 0px; padding-left: 7px;">
					<a href="/plan/profile.asp?id=jyoon0411 "><font class="small" style="color: gray;"><b>jyoon0411</b></font></a> <a href="javascript:shownotifydetail('newsfeed','1000000000115208998','')"><font class="small">홍콩 드래곤아이 :) 점심에 무제한 딤섬 부페..</font></a> <font class="small">1시간전</font>
				</td>
				</tr></tbody></table>

				<table width="200" style="padding: 0px; border: 0px currentColor; margin-bottom: 10px;"><tbody><tr>
				<td vAlign="top" style="margin: 0px; padding: 0px; border: 0px currentColor;"><a href="/plan/profile.asp?id=lsy6078"><img width="36" id="img_pf" onerror="this.src='/img_v6/img_pfnull.gif';" src="/img_v6/img_pfnull.gif" border="0"></a></td>
				<td vAlign="top" style="margin: 0px; border: 0px currentColor; padding-top: 0px; padding-bottom: 0px; padding-left: 7px;">
					<a href="/plan/profile.asp?id=lsy6078 "><font class="small" style="color: gray;"><b>lsy6078</b></font></a> <a href="javascript:shownotifydetail('newsfeed','1000000000115179988','')"><font class="small">낮은 상관없는데 밤에는 혼자 위험하실거에요ㅠㅠ</font></a> <font class="small">1시간전</font>
				</td>
				</tr></tbody></table>





<h5>최근 추천받는 글</h5>

				<table width="200" style="padding: 0px; border: 0px currentColor; margin-bottom: 10px;"><tbody><tr>
				<td vAlign="top" style="margin: 0px; padding: 0px; border: 0px currentColor;"><a href="/plan/profile.asp?id=jalaea8793"><img width="36" id="img_pf" onerror="this.src='/img_v6/img_pfnull.gif';" src="/pfimg/5/1/jalaea8793_sq.jpg" border="0"></a></td>
				<td vAlign="top" style="margin: 0px; border: 0px currentColor; padding-top: 0px; padding-bottom: 0px; padding-left: 7px;">
					<ul class="unstyled" style="margin-top: 0px; margin-bottom: 0px; list-style-type: none;">
					<li><a href="/plan/profile.asp?id=jalaea8793 "><font class="small"><b>jalaea8793</b></font></a> <a href="javascript:shownotifydetail('newsfeed','1000000000115179997','')"><font class="small">낮에는 괜찮지않을까요?</font></a> <font class="small">12시간전</font></li>
					 <li style="text-align: right;"><span class="label "> 추천 2회</span></li>
					</ul>
				</td>
				</tr></tbody></table>


				<table width="200" style="padding: 0px; border: 0px currentColor; margin-bottom: 10px;"><tbody><tr>
				<td vAlign="top" style="margin: 0px; padding: 0px; border: 0px currentColor;"><a href="/plan/profile.asp?id=thkim0418"><img width="36" id="img_pf" onerror="this.src='/img_v6/img_pfnull.gif';" src="/img_v6/img_pfnull.gif" border="0"></a></td>
				<td vAlign="top" style="margin: 0px; border: 0px currentColor; padding-top: 0px; padding-bottom: 0px; padding-left: 7px;">
					<ul class="unstyled" style="margin-top: 0px; margin-bottom: 0px; list-style-type: none;">
					<li><a href="/plan/profile.asp?id=thkim0418 "><font class="small"><b>thkim0418</b></font></a> <a href="javascript:shownotifydetail('newsfeed','1000000000115044999','')"><font class="small">안녕하세요~ 7월 중 이탈리아 여행하려고 하는..</font></a> <font class="small">2일전</font></li>
					 <li style="text-align: right;"><span class="label "> 추천 2회</span></li>
					</ul>
				</td>
				</tr></tbody></table>


				<table width="200" style="padding: 0px; border: 0px currentColor; margin-bottom: 10px;"><tbody><tr>
				<td vAlign="top" style="margin: 0px; padding: 0px; border: 0px currentColor;"><a href="/plan/profile.asp?id=poopoop52"><img width="36" id="img_pf" onerror="this.src='/img_v6/img_pfnull.gif';" src="/img_v6/img_pfnull.gif" border="0"></a></td>
				<td vAlign="top" style="margin: 0px; border: 0px currentColor; padding-top: 0px; padding-bottom: 0px; padding-left: 7px;">
					<ul class="unstyled" style="margin-top: 0px; margin-bottom: 0px; list-style-type: none;">
					<li><a href="/plan/profile.asp?id=poopoop52 "><font class="small"><b>poopoop52</b></font></a> <a href="javascript:shownotifydetail('newsfeed','1000000000114941999','')"><font class="small">얼른떠나고싶어요 </font></a> <font class="small">3일전</font></li>
					 <li style="text-align: right;"><span class="label "> 추천 3회</span></li>
					</ul>
				</td>
				</tr></tbody></table>


<hr>
<h5>최고의 인기글</h5>

				<table width="200" style="padding: 0px; border: 0px currentColor; margin-bottom: 10px;"><tbody><tr>
				<td vAlign="top" style="margin: 0px; padding: 0px; border: 0px currentColor;"><a href="/plan/profile.asp?id=duwnsl11"><img width="36" id="img_pf" onerror="this.src='/img_v6/img_pfnull.gif';" src="/pfimg/2/3/duwnsl11_sq.jpg" border="0"></a></td>
				<td vAlign="top" style="margin: 0px; border: 0px currentColor; padding-top: 0px; padding-bottom: 0px; padding-left: 7px;">
					<ul class="unstyled" style="margin-top: 0px; margin-bottom: 0px; list-style-type: none;">
					<li><a href="/plan/profile.asp?id=duwnsl11 "><font class="small"><b>duwnsl11</b></font></a> <a href="javascript:shownotifydetail('newsfeed','1000000000113020999','')"><font class="small">유로스타가 부담되는 분들에게 팁~~!!!!

..</font></a> <font class="small">5월 10일</font></li>
					 <li style="text-align: right;"><span class="label success"> 추천 14회</span></li>
					</ul>
				</td>
				</tr></tbody></table>


				<table width="200" style="padding: 0px; border: 0px currentColor; margin-bottom: 10px;"><tbody><tr>
				<td vAlign="top" style="margin: 0px; padding: 0px; border: 0px currentColor;"><a href="/plan/profile.asp?id=dlsugs3"><img width="36" id="img_pf" onerror="this.src='/img_v6/img_pfnull.gif';" src="/pfimg/2/6/dlsugs3_sq.jpg" border="0"></a></td>
				<td vAlign="top" style="margin: 0px; border: 0px currentColor; padding-top: 0px; padding-bottom: 0px; padding-left: 7px;">
					<ul class="unstyled" style="margin-top: 0px; margin-bottom: 0px; list-style-type: none;">
					<li><a href="/plan/profile.asp?id=dlsugs3 "><font class="small"><b>dlsugs3</b></font></a> <a href="javascript:shownotifydetail('newsfeed','1000000000110752999','')"><font class="small">아름답고 멋있었던 유럽여행.
잊지못할 추억들..</font></a> <font class="small">4월 9일</font></li>
					 <li style="text-align: right;"><span class="label success"> 추천 11회</span></li>
					</ul>
				</td>
				</tr></tbody></table>


				<table width="200" style="padding: 0px; border: 0px currentColor; margin-bottom: 10px;"><tbody><tr>
				<td vAlign="top" style="margin: 0px; padding: 0px; border: 0px currentColor;"><a href="/plan/profile.asp?id=sang2269"><img width="36" id="img_pf" onerror="this.src='/img_v6/img_pfnull.gif';" src="/pfimg/1/1/sang2269_sq.jpg" border="0"></a></td>
				<td vAlign="top" style="margin: 0px; border: 0px currentColor; padding-top: 0px; padding-bottom: 0px; padding-left: 7px;">
					<ul class="unstyled" style="margin-top: 0px; margin-bottom: 0px; list-style-type: none;">
					<li><a href="/plan/profile.asp?id=sang2269 "><font class="small"><b>sang2269</b></font></a> <a href="javascript:shownotifydetail('newsfeed','1000000000110644999','')"><font class="small">하나투어에서 오늘,내일 딱 이틀동안 항공권 특..</font></a> <font class="small">4월 7일</font></li>
					 <li style="text-align: right;"><span class="label success"> 추천 8회</span></li>
					</ul>
				</td>
				</tr></tbody></table>


				<table width="200" style="padding: 0px; border: 0px currentColor; margin-bottom: 10px;"><tbody><tr>
				<td vAlign="top" style="margin: 0px; padding: 0px; border: 0px currentColor;"><a href="/plan/profile.asp?id=ychan5170"><img width="36" id="img_pf" onerror="this.src='/img_v6/img_pfnull.gif';" src="/pfimg/7/2/ychan5170_sq.jpg" border="0"></a></td>
				<td vAlign="top" style="margin: 0px; border: 0px currentColor; padding-top: 0px; padding-bottom: 0px; padding-left: 7px;">
					<ul class="unstyled" style="margin-top: 0px; margin-bottom: 0px; list-style-type: none;">
					<li><a href="/plan/profile.asp?id=ychan5170 "><font class="small"><b>ychan5170</b></font></a> <a href="javascript:shownotifydetail('newsfeed','1000000000107480999','')"><font class="small">여행 일정 짜실 때 참고해보세요!
여행가기전엔..</font></a> <font class="small">2월 20일</font></li>
					 <li style="text-align: right;"><span class="label success"> 추천 27회</span></li>
					</ul>
				</td>
				</tr></tbody></table>


				<table width="200" style="padding: 0px; border: 0px currentColor; margin-bottom: 10px;"><tbody><tr>
				<td vAlign="top" style="margin: 0px; padding: 0px; border: 0px currentColor;"><a href="/plan/profile.asp?id=kachia3s"><img width="36" id="img_pf" onerror="this.src='/img_v6/img_pfnull.gif';" src="/pfimg/6/1/kachia3s_sq.jpg" border="0"></a></td>
				<td vAlign="top" style="margin: 0px; border: 0px currentColor; padding-top: 0px; padding-bottom: 0px; padding-left: 7px;">
					<ul class="unstyled" style="margin-top: 0px; margin-bottom: 0px; list-style-type: none;">
					<li><a href="/plan/profile.asp?id=kachia3s "><font class="small"><b>kachia3s</b></font></a> <a href="javascript:shownotifydetail('newsfeed','1000000000096968999','')"><font class="small">아래에서 현지에서 스마트폰 사용에 관한 질문이..</font></a> <font class="small">2014년 9월 2일</font></li>
					 <li style="text-align: right;"><span class="label success"> 추천 36회</span></li>
					</ul>
				</td>
				</tr></tbody></table>


<!--right end--->

</div>
<!-- col-md-4 -->
</div>

<!--  row -->





</div>

<!-- stubby_content -->


</div>
</div>
</div>
</div>




</body>
</html>