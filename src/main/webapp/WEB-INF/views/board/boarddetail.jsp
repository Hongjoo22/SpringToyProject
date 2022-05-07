<%@page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<body>
<h1>
	THIS IS boardDetail
</h1>
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
<th>제목</th><td><input   name="title" value="${board.title}"></td>
</tr>
<tr>
<th>내용</th><td><textarea cols="100" rows="30" name="content"  style=" resize: none;">${board.content}</textarea></td>
</tr>
<tr>
<td><button type="button" id="_modifycancel">수정 취소</button></td>
<td><button id="_modify">글 수정</button></td>
</tr>
</c:if>
</table>
<input type="hidden" name="userid" value="${board.userid}" />
<input type="hidden" name="articleno" value="${board.articleno}" />
</form>
</div>
<div>
	<button id="_btn">게시판 목록보기</button>
	<button id="_btnhidden">게시판 목록숨기기</button>
	<c:if test="${login.userid eq board.userid}">
	<button id="_btnmodify">글 수정</button>
	<form action="${root}/board/boarddelete" method="get" style="display: inline-block;" >
	<button type="submit" id="_btndelete">글 삭제</button>
	<input type="hidden" name="articleno" value="${board.articleno}"/>
	</form>
	</c:if>
</div>
<div id="_showtable"></div>
<a href="../">HOME</a>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$('#_btn').show();
	$('#_btnhidden').hide();
	$("#_boardmodify").hide();
	$("#_btn").click(function(){
		$('#_btn').hide();
		$('#_btnhidden').show();
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
	$("#_btnmodify").click(function(){
		$("#_boardshow").hide();
		$("#_btnmodify").hide();
		$("#_boardmodify").show();
	})
	$("#_modifycancel").click(function(){
		$("#_boardmodify").trigger("reset");
		$("#_boardmodify").hide();
		$("#_boardshow").show();
		$("#_btnmodify").show();
	})
	$("#_modify").click(function(){
		alert("수정이 완료되었습니다.");
		$("#_modi").attr("action","${root}/board/boardmodify").submit();
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
</html>
