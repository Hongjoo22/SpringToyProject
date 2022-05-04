<%@page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<html>
<head>
	<title>boardlist</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
	<style type="text/css">
		#_table{
			margin: auto;
			border: 1px solid black;
			text-align: center;
		}
	</style>
<script type="text/javascript">
$(document).ready(function(){
	$('#_btn').show();
	$('#_btnhidden').hide();
	$("#_btn").click(function(){
		$('#_btn').hide();
		$('#_btnhidden').show();
		//alert("왔나?");
		 $.ajax({
			url: "${root}/board/showboardlist",
			type: "GET",
			success: function(result){
				boardlist(result);
			}
		}); 
	});
	
	
	$("#_btnhidden").click(function(){
		$("#_showtable").empty();
		$('#_btn').show();
		$('#_btnhidden').hide();
	})
	
});

function boardlist(result){
	$("#_showtable").empty();
	var str="<table id='_table'>";
	str += "<col width='10%'>";
	str += "<col width='40%'>";
	str += "<col width='20%'>";
	str += "<col width='30%'>";
	str += "<tr>";
	str += "<th>번호</th>";
	str += "<th>제목</th>";
	str += "<th>작성자</th>";
	str += "<th>작성일</th>";
	str += "</tr>";
	
	$(result).each(function(index,item){
		str += "<tr>";
		str += "<td>";
		str += (index+1);
		str += "</td>";
		str += "<td>";
		str += "<a href='boarddetail?articleno="+item.articleno+"' >"+item.title+"</a>";
		str += "</td>";
		str += "<td>";
		str += item.userid;
		str += "</td>";
		str += "<td>";
		str += item.regtime;
		str += "</td>";
		str += "</tr>";
	});
	str+="</table>";
	$("#_showtable").html(str);
}
</script>
</head>
<body>
<h1>
	THIS IS boardlist
</h1>
<div>
	<button id="_btn">게시판 목록보기</button>
	<button id="_btnhidden">게시판 목록숨기기</button>
</div>
<div id="_showtable"></div>
<a href="../">HOME</a>
<a href="mvboardwrite">글작성</a>
</body>
</html>