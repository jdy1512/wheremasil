<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>




<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="http://www.google-analytics.com/ga.js"
	type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/wheremasil/script/jquery.blockUI.js"></script>




<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#tag").on("click", function() {

		});

	});
</script>








<script type="text/javascript">


function delay(gap){ /* gap is in millisecs */ 
  var then,now; 
  then=new Date().getTime(); 
  now=then; 	
  while((now-then)<gap){ 
    now=new Date().getTime();  // 현재시간을 읽어 함수를 불러들인 시간과의 차를 이용하여 처리 
  } 
} 


	function detailveiw(posting_id) {
		var txt = "posting_id" + "=" + posting_id;

		$
				.ajax({
					url : '/wheremasil/board/getMemberInfo.do',
					type : "post",
					data : txt,
					dataType : "json",
					success : function(result) {
						var r;
						var c;
					

						
						r = returnTy(result.boardtype_id);
						c = getdata(result.p_datetime);

						//alert("카테고리리스트받아옴");
						$
								.blockUI({
									message : "<p align='middle'><div class='modal-content'><div class='modal-header'><button class='close' aria-hidden='true' type='button' data-dismiss='modal' onclick='removeModal();'>×</button><h4 class='modal-title' id='notifydetail_title'>NEWS FEED</h4></div><div class='modal-body' style='width: 580px; height: 430px;'>"
											+ "<table width='200' style='padding: 0px; border: 0px currentColor; margin-bottom: 10px;'><tbody><tr><td vAlign='top' style='margin: 0px; padding: 0px; border: 0px currentColor;'><a href='#'><img width='36' id='img_pf' class='img"+result.member_id+"'  src='' border='0'></a></td><td vAlign='top' style='margin: 0px; border: 0px currentColor; padding-top: 0px; padding-bottom: 0px; padding-left: 0px;'><a href='#?id=dbswndz '><font class='small' style='color: gray;'><b>"
											+ result.member_id
											+ "</b></font></a> <a href='javascript:detailveiw("
											+ result.posting_id
											+ ")'><font class='small'>"
											+ result.p_content
											+ "</font></a> <font class='small'>"
											+ c
											+ "</font></td></tr></tbody></table>"
											+ "<iframe width='560' height='400' id='if_notifydetail' frameBorder='0' scrolling='no'></iframe></div></div></p>"
								});
						getMemberImg(result.member_id);

					},
					error : function(result) {
						alert("카테고리 리스트 받아오기 실패");
					}
				});

	}

	$(function() {
		var posting_id = 437;

		$("#openmodal")
				.click(
						function() {

							var txt = "posting_id" + "=" + posting_id;

							$
									.ajax({
										url : '/wheremasil/board/getMemberInfo.do',
										type : "post",
										data : txt,
										dataType : "json",
										success : function(result) {
											var r;
											var c;
											
											r = returnTy(result.boardtype_id);
											c = getdata(result.p_datetime)

											//alert("카테고리리스트받아옴");
											$
													.blockUI({
														message : "<p align='middle'><div class='modal-content'><div class='modal-header'><button class='close' aria-hidden='true' type='button' data-dismiss='modal' onclick='removeModal();'>×</button><h4 class='modal-title' id='notifydetail_title'>NEWS FEED</h4></div><div class='modal-body' style='width: 580px; height: 430px;'>"
																+ "<table width='200' style='padding: 0px; border: 0px currentColor; margin-bottom: 10px;'><tbody><tr><td vAlign='top' style='margin: 0px; padding: 0px; border: 0px currentColor;'><a href='#'><img width='36' id='img_pf'  src='' border='0'></a></td><td vAlign='top' style='margin: 0px; border: 0px currentColor; padding-top: 0px; padding-bottom: 0px; padding-left: 7px;'><a href='#?id=dbswndz '><font class='small' style='color: gray;'><b>"
																+ result.member_id
																+ "</b></font></a> <a href='javascript:detailveiw("
																+ result[i].posting_id
																+ ")'><font class='small'>"
																+ result.p_content
																+ "</font></a> <font class='small'>"
																+ c
																+ "</font></td></tr></tbody></table>"
																+ "<iframe width='560' height='400' id='if_notifydetail' frameBorder='0' scrolling='no'></iframe></div></div></p>"
													});
											getMemberImg(result.member_id);
										},
										error : function(result) {
											alert("카테고리 리스트 받아오기 실패");
										}
									});

						});
	})
	function removeModal() {
		$.unblockUI();
	}

	function categoriReturn(categori,cnt) {
		//alert("categori 펑션 접근");
		var txt = "categori" + "=" + categori;
		$
				.ajax({
					url : '/wheremasil/board/returnCategoriList.do',
					type : "post",
					data : txt,
					dataType : "json",
					success : function(result) {
						//alert("카테고리리스트받아옴");
						/* alert("받아온리스트");
						alert(result); */
						document.getElementById("resvSquare").innerHTML = "";
						$("resvSquare").html("");
						var r;
						var c;
					
						cnt = parseInt(cnt);
						for ( var i = 0; i < cnt; i++) {
							f = getMemberImg(result[i].member_id);
							r = returnTy(result[i].boardtype_id);
							c = getdata(result[i].p_datetime);

							  

							$("#resvSquare")
									.append(
											"<div class='row item' style='margin-left: 0px; border-top-color: rgb(239, 239, 239); border-top-width: 7px; border-top-style: solid;'><div style='padding: 7px; float: left;'><a href='' target='_parent'><img width='48' class='img"+result[i].member_id+"' src='' border='0'></a></div><ul class='unstyled' style=' list-style-type: none; width: 100%;' padding-left:7px;><li><h6><a href='' target='_parent'>"
													+ result[i].member_id
													+ "  </a> &nbsp;</h6></li><li> "
													+ result[i].p_content
													+ " <span class='label'> "
													+ r
													+ "  </span></li><li class='itemrow withheight'>&nbsp;<a style='color: rgb(105, 105, 105);' href='javascript:insertLike("
													+ result[i].posting_id
													+ ");' ><span class='ui-icon ui-icon-heart' style='float: left;'></span> <span id='btn_helpful_1000000000115309999'> 추천하기	</span> </a>  "
													+ c
													+ "  </li><li class='itemrow withheight hide' id='helpfulbox_container_1000000000115309999'></li></ul><form><input type='hidden' id='posting_id' value="+result[i].posting_id+">  </form></div>");

						}
						getMemberImg(result.member_id);

					},
					error : function(result) {
						alert("카테고리 리스트 받아오기 실패");
					}
				});

	}

	function hlight(o) {

		//highlight the current nav

		$(".active").attr('class', "");

		if (o == 1) {
			$("#tag1").attr('class', 'active');
			location.reload(true);
		} else if (o == 3) {
			$("#tag3").attr('class', 'active');
			categoriReturn("sr",4);
			$('#cnt').attr('value',4);
		} else if (o == 4) {
			$("#tag4").attr('class', 'active');
			categoriReturn("sq",4);
			$('#cnt').attr('value',4);
		} else if (o == 5) {
			$("#tag5").attr('class', 'active');
			categoriReturn("sd",4);
			$('#cnt').attr('value',4);
		} else if (o == 6) {
			$("#tag6").attr('class', 'active');
			categoriReturn("si",4);
			$('#cnt').attr('value',4);
		} else if (o == 7) {
			$("#tag7").attr('class', 'active');
			categoriReturn("sl",4);
			$('#cnt').attr('value',4);
		} else if (o == 8) {
			$("#tag8").attr('class', 'active');
			categoriReturn("sf",4);
			$('#cnt').attr('value',4);
		}
	}

	function reload_slike() {
		//alert("추천리스트받아오기실행");

		$
				.ajax({
					url : '/wheremasil/board/selectSlike.do',
					type : "post",
					dataType : "json",
					success : function(result) {
						//alert("추천리스트받아옴");
						/* alert("받아온리스트");
						alert(result); */
						document.getElementById("recent_view22").innerHTML = "";
						$("recent_view22").html("");
						var r;
						var c;
						
						cnt = parseInt(cnt);
						for ( var i = 0; i < 6; i++) {
						
							r = returnTy(result[i].boardtype_id);
							c = getdata(result[i].p_datetime);

							 //alert("넣기전이미지값 이미지값 = "+f); 

							$("#recent_view22")
									.append(
											"<table width='200' style='padding: 0px; border: 0px currentColor; margin-bottom: 10px;'><tbody><tr><td vAlign='top' style='margin: 0px; padding: 0px; border: 0px currentColor;'><a href='#'><img width='36' class='img"+result[i].member_id+"'  id='img_pf'  src='' border='0'></a></td><td vAlign='top' style='margin: 0px; border: 0px currentColor; padding-top: 0px; padding-bottom: 0px; padding-left: 7px;'><a href='#?id=dbswndz '><font class='small' style='color: gray;'><b>"
											+ result[i].member_id
											+ "</b></font></a> <a href='javascript:detailveiw("
											+ result[i].posting_id
											+ ")'><font class='small'>"
											+ result[i].p_content
											+ "</font></a> <font class='small'>"
											+ c
												
													+ "</font></li><li style='text-align: right;list-style-type: none; '  ><span class='label success'>추천  "
													+ result[i].p_like
													+ "회</span></li></ul></td></tr></tbody></table>");

							getMemberImg(result[i].member_id);
						}

						//alert("붙여넣기작업끝");	
						
					},
					error : function(result) {
						alert("추천리스트 받아오기 실패");
					}
				});

	}

	function reload_view() {

		$
				.ajax({
					url : '/wheremasil/board/Sblist.do',

					processData : false,
					type : "post",

					dataType : "json",

					success : function(result) {
						/* alert("받아온리스트");
						alert(result); */
						document.getElementById("recent_view").innerHTML = "";
						$("recent_view").html("");
						var r;
						var c;
						
						cnt = parseInt(cnt);
						for ( var i = 0; i < 6; i++) {
							
							r = returnTy(result[i].boardtype_id);
							c = getdata(result[i].p_datetime);

							 //alert("넣기전이미지값 이미지값 = "+f); 

							$("#recent_view")
									.append(
											"<table width='200' style='padding: 0px; border: 0px currentColor; margin-bottom: 10px;'><tbody><tr><td vAlign='top' style='margin: 0px; padding: 0px; border: 0px currentColor;'><a href='#'><img width='36' class='img"+result[i].member_id+"'  id='img_pf'  src='' border='0'></a></td><td vAlign='top' style='margin: 0px; border: 0px currentColor; padding-top: 0px; padding-bottom: 0px; padding-left: 7px;'><a href='#?id=dbswndz '><font class='small' style='color: gray;'><b>"
													+ result[i].member_id
													+ "</b></font></a> <a href='javascript:detailveiw("
													+ result[i].posting_id
													+ ")'><font class='small'>"
													+ result[i].p_content
													+ "</font></a> <font class='small'>"
													+ c
													+ "</font></td></tr></tbody></table>");

						
							getMemberImg(result[i].member_id);
						}
					

					},
					error : function(result) {
						alert(" 최근 글 리스트 받아오기 실패");
					}
				});

	}
	

	function getMemberImg(member_id) {
		var result1;
		var txt = "member_id" + "=" + member_id;
		$.ajax({
			url : '/wheremasil/board/getMemberImg.do',

			processData : false,
			type : "post",
			data : txt,
			dataType : "text",

			success : function(result) {
				 //alert("사용자 이미지가 성공적으로 넘어옴 = 	"+result);
					result1=result;
					
				 $(".img"+member_id).attr('src',result);
			},
			error : function(result) {

				alert("사용자 이미지주소 가저오기 실패");
			}
		});
		//alert("보내기전 이미지값 ="+result1);
		return result1;
	}

	function insertLike(r) {

		var txt = "posting_id" + "=" + r;

		$.ajax({
			url : '/wheremasil/board/insertLike.do',
			type : "post",
			processData : false,

			data : txt,
			dataType : "JSON",

			success : function(result) {
				//alert("성공");
				//alert(result);

			},
			error : function(result) {
				alert(result);
				alert("라이크 업데이트 실패");
			}
		});

	}

	function pad2(n) {
		return n < 10 ? '0' + n : n
	}

	function getdata(r) {

		var date = new Date();

		cnt = parseInt(date.getFullYear().toString()
				+ pad2(date.getMonth() + 1) + pad2(date.getDate())
				+ pad2(date.getHours()) + pad2(date.getMinutes())
				+ pad2(date.getSeconds()));

		/* alert("시스템상 현재시간"+cnt);
		alert("DB 받아온 시간==="+r); 
		 */
		var l = cnt - r;
		/* alert("차이값 = " + l);  */
		var totalSec = l;
		var day = totalSec / (60 * 60 * 24);
		var hour = totalSec / (60 * 60);
		var minute = (totalSec) / 60;
		var second = totalSec;

		if (totalSec < 60) {
			return Math.floor(second) + "초전";
		} else if (totalSec < 3600) {
			return Math.floor(minute) + "분전";
		} else if (totalSec < 86400) {
			return Math.floor(hour) + "시간전";
		} else {
			return Math.floor(day) + "일전";
		}

	}

	function getLogs(cnt) {
		var txt = $(".active").text();
		alert("현재 카테고리정보 = "+txt);
		var c = parseInt(cnt);
		if (c == 4) {
			c = 8;
		}
		
		
		
		
		

		$("#cnt").attr('value', c + 4);

		if(txt=="전체"){
			reloadList(c);
		}else if(txt=="숙소관련"){
			categoriReturn("sr",c);
		}else if(txt=="일반질문"){
			categoriReturn("sq",c);
		}else if(txt=="특가정보"){
			categoriReturn("sd",c);
		}else if(txt=="자유"){
			categoriReturn("sl",c);
		}else if(txt=="동행찾기"){
			categoriReturn("sf",c);
		}else{
			reloadList(c);
		}

	}

	function logincheck() {

		if ($("#login_info").val() == "") {
			alert("로그인부터하세여");

		} else {

		}
	}

	function Wlogin() {
		if ($("#login_info").val() == "") {
			alert("로그인부터하세여");

		} else {
			//alert("카테고리내용"+$("#categori").val());
			//alert("텍스트에리아내용"+$("#msg").val());
			//alert("글쓴사람 아이디 : "+ $("#login_id").val());
			var categori = $("#categori").val();
			var msg = $("#msg").val();
			var login_id = $("#login_id").val();

			var txt = "categori" + "=" + $("#categori").val() + "&" + "msg"
					+ "=" + $("#msg").val() + "&" + "login_id" + "="
					+ $("#login_id").val();

			$.ajax({
				url : '/wheremasil/board/insertSb.do',
				type : "post",
				processData : false,
				data : txt,
				dataType : "text",

				success : function(result) {
					//alert("성공");
					/* alert(result); */

					$("#cnt").attr('value', 4);

					reloadList(parseInt($("#cnt").val()));

				},
				error : function(result) {

					alert("광장 글업데이트 실패");
				}
			});

		}

	}

	function reloadList(cnt) {
		/* alert("리로드리스트실행");
		alert("받아온 cnt"+cnt); */
		$
				.ajax({
					url : '/wheremasil/board/Sblist.do',

					processData : false,
					type : "post",

					dataType : "json",

					success : function(result) {
						/* 	alert("받아온리스트"); */
						//alert(result);
						document.getElementById("resvSquare").innerHTML = "";
						$("resvSquare").html("");
						var r;
						var c;
						
						cnt = parseInt(cnt);
						for ( var i = 0; i < cnt; i++) {
							
							r = returnTy(result[i].boardtype_id);
							c = getdata(result[i].p_datetime);

							  

							$("#resvSquare")
									.append(
											"<div class='row item' style='margin-left: 0px; border-top-color: rgb(239, 239, 239); border-top-width: 7px; border-top-style: solid;'><div style='padding: 7px; float: left;'><a href='' target='_parent'><img width='48' class='img"+result[i].member_id+"' src='' border='0'></a></div><ul class='unstyled' style=' list-style-type: none; width: 100%;'><li><h6><a href='' target='_parent'>"
													+ result[i].member_id
													+ "  </a> &nbsp;</h6></li><li> "
													+ result[i].p_content
													+ " <span class='label'> "
													+ r
													+ "  </span></li><li class='itemrow withheight'>&nbsp;<a style='color: rgb(105, 105, 105);' href='javascript:insertLike("
													+ result[i].posting_id
													+ ");' ><span class='ui-icon ui-icon-heart' style='float: left;'></span> <span id='btn_helpful_1000000000115309999'> 추천하기	</span> </a>  "
													+ c
													+ "  </li><li class='itemrow withheight hide' id='helpfulbox_container_1000000000115309999'></li></ul><form><input type='hidden' id='posting_id' value="+result[i].posting_id+">  </form></div>");

							getMemberImg(result[i].member_id);
						}

					},
					error : function(result) {
						alert("초기 글 리스트 받아오기 실패");
					}
				});

	}

	function returnTy(type) {
		var r = "초기값";
		if (type == "sf") {
			r = "동행찾기";
		} else if (type == "sq") {
			r = "질문";
		} else if (type == "si") {
			r = "정보";
		} else if (type == "sr") {
			r = "숙소리뷰";
		} else if (type == "sd") {
			r = "할인정보";
		} else if (type == "sl") {
			r = "자유";
		}
		return r;
	}

	function newsTypeChanged() {
		//alert($("#newsType option:selected").text());
		//alert("기존 내용"+$("#categori").val());
		if ($("#newsType option:selected").text() == "동행찾기") {
			$("#categori").attr('value', "sf");

		} else if ($("#newsType option:selected").text() == "정보") {
			$("#categori").attr('value', "si");

		} else if ($("#newsType option:selected").text() == "숙소리뷰") {
			$("#categori").attr('value', "sr");

		} else if ($("#newsType option:selected").text() == "할인정보") {
			$("#categori").attr('value', "sd");

		} else if ($("#newsType option:selected").text() == "자유") {
			$("#categori").attr('value', "sl");

		}

		//alert("바뀐 내용"+$("#categori").val());

	}
</script>








<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">




<title>Insert title here</title>
</head>

<style type="text/css">
.footer1 {
	position: absolute;
	margin-top: -100%;
	z-index: 10;
	float:
}

.commentbox {
	height: 30px;
	border: 7px solid #c0c0c0;
	width: 100%;
	color: #c0c0c0;
}

html,body {
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
	height: 7px;
}

.Row.Expand {
	height: auto;
}

li {
	line-height: 20px;
}

.slick-slider {
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

.slick-initialized .slick-slide {
	display: block;
}

.slick-slider .slick-list {
	-webkit-transform: translate3d(0, 0, 0);
	-moz-transform: translate3d(0, 0, 0);
	-ms-transform: translate3d(0, 0, 0);
	-o-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0);
}

.slick-slider {
	margin-bottom: 30px;
}

.span10 {
	width: 90%;
	margin-left: 20px;
}

.btn {
	border-color: rgb(204, 204, 204);
	color: rgb(51, 51, 51);
	background-color: rgb(255, 255, 255);
}

.span {
	margin-left: 10px;
	float: left !important;
}

.label {
	background-color: rgb(153, 153, 153);
}

.stubby_container {
	text-align: center;
	top-padding: -30%;
	position: relative;
	display: inline-block;
	width: 50%;
	padding: 1em;
	color: black;
}

.stubby_content {
	text-align: left;
	width: 1014px;
	padding-top: 70px;
	display: inline-block;
	background: #fff;
	padding-left: 0;
	margin-left: -150px;
	-webkit-border-radius: 0 0 6px 6px;
	-moz-border-radius: 0 0 6px 6px;
	border-radius: 0 0 6px 6px;
	-webkit-box-shadow: 0 7px 2px rgba(0, 0, 0, .15);
	-moz-box-shadow: 0 7px 2px rgba(0, 0, 0, .15);
	box-shadow: 0 7px 2px rgba(0, 0, 0, .15);
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

.pace-done {
	background: rgba(237, 237, 237, 1);
}
</style>


<body>
	<!-- <input type="button" id="openmodal" value="모달띄우기"/>
<br/>
<div id="blocklayer">여기만<br/>모달창으로 감쌉니다</div>
<form> -->

	<input type="hidden" id="cnt" value=4;>

	<input id="login_info" type="hidden" value="${sessionScope.login_info}" />
	<input id="login_id" type="hidden"
		value="${sessionScope.login_info.member_id}" />
	<input id="categori" type="hidden" value="sq" />
	</form>

	<div class="container" style="margin-top: -8%;">
		<div class="outer">
			<div class="inner">
				<div class="stubby_container"
					style="height: 100px; text-align: center;">
					<div class="stubby_content">
						<ul id="catagori" class="nav nav-tabs" role="tablist"
							style="margin-top: 0px; margin-left: 0px; list-style-type: none;">
							<li class="active" id="tag1" name="tag" value="전체"><a href="#"
								onclick="hlight('1');"><h5>전체</h5></a></li>

							<li id="tag3"><a href="#" onclick="hlight('3');" value="숙소관련"><h5>숙소관련</h5></a></li>
							<li id="tag4"><a href="#" onclick="hlight('4');" value="일반질문"><h5>일반질문</h5></a></li>
							<li id="tag5"><a href="#" onclick="hlight('5');" value="특가정보"><h5>특가정보</h5></a></li>

							<li id="tag7"><a href="#" onclick="hlight('7');" value="자유"><h5>자유</h5></a></li>
							<li id="tag8"><a href="#" onclick="hlight('8');" value="동행찾기"><h5>동행찾기</h5></a></li>

							<li><table>
									<tbody>
										<tr>
											<td style="width: 10px;">&nbsp;</td>
										</tr>
									</tbody>
								</table></li>
						</ul>


						<div class="row">

							<div class="col-md-8"
								style="border-right-color: rgb(239, 239, 239); border-right-width: 7px; border-right-style: solid;">

								<div class="alert alert-warning alert-dismissible" role="alert"
									style="margin-top: 10px;">

									<button class="close" type="button" data-dismiss="alert">
										<span aria-hidden="true">×</span><span class="sr-only">Close</span>
									</button>
									<strong> 광장은 여행의 정보와 이야기를 자유롭게 공유하는 공간이에요. <br>
										여행자들을 도와주시는 멘토분들 덕분에 광장이 활발하게 운영될 수 있답니다.<br> 광장에 질문을
										올리시는 분들은 아래 두 가지만 지켜주세요!<br> 1. 조금만 시간을 투자하면 찾을 수 있는 정보는
										먼저 스스로 찾아주세요.<br> 반복되는 기초적인 질문은 지쳐요:( <br> 2. 답변을 얻은
										후엔 감사를 표시해주세요.<br> 주고받는 인사속에 훈훈한 광장 :)

									</strong>
								</div>



								<div class="row" style="margin-top: 5px; margin-left: 0px;">
									<div class="span"
										style="width: 70px; height: 100px; overflow: hidden; position: relative;">
										<img width="70" id="img_pf"
											style="border: 4px solid rgb(255, 255, 255);"
											src="http://192.168.7.122:8082/wheremasil/uploads/images/default/no-photo.png	"
											border="0">
									</div>
									<div class="span" style="width: 570px;">
										<input name="optGuidebook" id="att_guidebook" type="hidden"
											value=""> <input name="optMap" id="att_map"
											type="hidden" value=""> <input name="optRoute"
											id="att_route" type="hidden" value=""> <input
											name="optPlan" id="att_plan" type="hidden" value="">
										<input name="optLink" id="att_link" type="hidden" value="">

										<textarea name="msg" id="msg" style="width: 100%;"
											onclick="logincheck();" rows="4"></textarea>
										<div style="clear: both;"></div>
										<div class="row" style="margin-top: 7px;">
											<div class="span8">
												<span style="float: right;"> <select name="newsType"
													id="newsType" style="width: 110px;"
													onchange="newsTypeChanged()">
														<option value="QNA">질문</option>

														<option value="FND">동행찾기</option>
														<option value="INF">정보</option>
														<option value="MSP">숙소리뷰</option>
														<option value="HOT">할인정보</option>
														<option value="FRE">자유</option>
												</select> &nbsp;&nbsp;<a class="btn btn-success btn-lg"
													style="width: 150px; margin-right: 20px;"
													href="javascript:Wlogin();">글쓰기</a>
												</span>

											</div>
										</div>
										<div class="row" style="margin-top: 7px; margin-bottom: 5px;">
											<div class="span8">
												<p id="label_for_write_mentors"
													style="text-align: right; color: rgb(105, 105, 105); font-size: 8pt;">

													나의 멘토들(0명)에게 중요한 질문으로 표시되며 메일로 질문이 전송됩니다.</p>
												<p class="hide" id="label_for_write_mentees"
													style="text-align: right; color: rgb(105, 105, 105); font-size: 8pt; display: none;">
													나의 멘티들(0명)에게 이 정보가 중요한 정보로 표시됩니다.</p>
											</div>
										</div>
										<div style="margin-top: 7px; margin-bottom: 15px;">
											<div id="att_map_div"></div>
										</div>
									</div>
								</div>

								<div class="resvSquare" id="resvSquare">


									<script type="text/javascript">
										reloadList($("#cnt").val());
									</script>



								</div>

								<div class="row" id="row_btnmore">
									<input name="page" id="page" type="hidden" value="1"> <a
										class="btn span10" style="text-align: center;"
										href="javascript:getLogs(  $('#cnt').val()  );">더보기</a>
								</div>

								<!--  mid 8 -->
							</div>



							<div class="col-md-4">





								<h5>최근 등록된 글</h5>
								<div id="recent_view">
									<script type="text/javascript">
										setTimeout("reload_view()", 500);
									</script>
								</div>








								<hr>
								<h5>최고의 인기글</h5>

								<div id="recent_view22">
									<script type="text/javascript">
										setTimeout("reload_slike()", 1000);
									</script>
								</div>







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