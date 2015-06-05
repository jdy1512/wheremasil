<%@ page contentType="text/html; charset=UTF-8"%>

<!--
	solr response를 json형식으로 받는 것 
	jsonp 형식 - callback 가능(json과 차이점)
	http://yoursolrserver.com/solr/select/?q=yoursearchgoeshere&wt=json&json.wrf=callback
 -->
<script type="text/javascript" src="/wheremasil/script/jquery.js"></script>
<script type="text/javascript" src="/wheremasil/script/jquery.cookie.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	
		if($.cookie('word')){
			search();
		}
		$("#searchBtn").on("click",search);
		$("#search_form").on("submit",function(){
			search();
			return false;
		});
		//alert($.cookie('word'));
	});
	
	// search function
	function search(){
		$.cookie('word',$("#search_word").val());
		//alert($("#search_word").val());
		$.ajax({
			url:"http://192.168.7.212:8983/solr/select"
			, type:"GET"
			, data:"wt=json&q=search:"+$.cookie('word')
			, dataType:"jsonp"
			, jsonp:'json.wrf'
			, success:function(data){
				
				if(data.response.numFound==0){
					$("#result_thead").empty();
					$("#result_tbody").empty().append($("<tr>"))
													.append($("<td>").text($.cookie('word')+"에 대한 검색결과가 없습니다."));	
					return;
				}
				$("#result_thead").empty().append($("<tr>")
												.append($("<td>").html("<h1>게시판</h1>")));
				$("#result_tbody").empty();
				for(var i=data.response.start; i<data.response.numFound; i++){
					$("#result_tbody").append($("<tr>")
													.append($("<td>").html("<a href=http://localhost:8082/masil_jph/board/postingVal.do?posting_id="
																		+data.response.docs[i].p_id+">"+data.response.docs[i].p_title+"</a>")));
													
					$("#result_tbody").append($("<tr>")
													.append($("<td>").text(data.response.docs[i].member_id
																		+"\t조회수 : "+data.response.docs[i].p_hits
																		+"\t추천수 : "+data.response.docs[i].p_like)));
													
					$("#result_tbody").append($("<tr>")
							.append($("<td>").text(data.response.docs[i].p_content_summary)));
				}
				//alert($("#search_word").val());
				//$.cookie('word',$("#search_word").val());
			}
			, error:function(){
				alert(error);
			}
		});
	}
</script>

<form id="search_form">
	검색어 : <input type="text" name="search_word" id="search_word">
	<input type="button" value="검색" id="searchBtn">
	<input type="button" value="상세검색" id="detail_search_Btn">
	<div id="result_layer">
		<table>
			<thead id="result_thead"></thead>
			<tbody id="result_tbody"></tbody>
		</table>
	</div>
</form>			

