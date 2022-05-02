<%@page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<html>
<head>
	<title>boardDetail</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
	<style type="text/css">
		#_table{
			margin: auto;
			border: 1px solid black;
			text-align: center;
		}
	</style>
</head>
<body>
<h1>
	THIS IS boardDetail
</h1>
<script type="text/javascript">
$(document).ready(function(){
	$("#_boardmodify").hide();
	$("#_btn").click(function(){
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
	})
	$("#_btnmodify").click(function(){
		$("#_boardshow").hide();
		$("#_btnmodify").hide();
		$("#_boardmodify").show();
	})
	$("#_modifycancel").click(function(){
		$("#_boardmodify").hide();
		$("#_boardshow").show();
		$("#_btnmodify").show();
	})
	$("#_modify").click(function(){
		$("#_modi").attr("action","boardmodify").submit();
		alert()
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
		str += "<a href='boarddetail?articleno="+item.articleno+"'>"+item.title+"</a>";
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

<div id="_boardshow">
<table>
<c:if test="${not empty board}">
<tr>
<th>글번호</th><td>${board.articleno}</td>
</tr>
<tr>
<th>작성자</th><td>${board.userid}</td>
</tr>
<tr>
<th>제목</th><td>${board.title}</td>
</tr>
<tr>
<th>내용</th><td><textarea cols="100" rows="30" readonly="readonly" style=" resize: none;">${board.content}</textarea></td>
</tr>
</c:if>
</table>
</div>
<div id="_boardmodify">
<form action="" id="_modi" method="post">
<table>
<c:if test="${not empty board}">
<tr>
<th>글번호</th><td>${board.articleno}</td>
</tr>
<tr>
<th>작성자</th><td>${board.userid}</td>
</tr>
<tr>
<th>제목</th><td><input value="${board.title}"></td>
</tr>
<tr>
<th>내용</th><td><textarea cols="100" rows="30" style=" resize: none;">${board.content}</textarea></td>
</tr>
<tr>
<td><button id="_modifycancel">수정 취소</button></td>
<td><button id="_modify">글 수정</button></td>
<input type="hidden" name="title" value="${board.title}" />
<input type="hidden" name="userid" value="${board.userid}" />
</tr>
</c:if>
</table>
</form>
</div>
<div>
	<button id="_btn">게시판 목록보기</button>
	<button id="_btnhidden">게시판 목록숨기기</button>
	<button id="_btnmodify">글 수정</button>
</div>
<div id="_showtable"></div>
<a href="../">HOME</a>
</body>
</html>
