<%@page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!-- <h1>
	THIS IS boardDetail
</h1> -->
<div id="_boardshow" class="container">
<div  style="padding: 5px;">
<c:if test="${login.userid eq board.userid}">
	<div class="btn-group" style="float: right;">
	<button id="_btnmodify"  class="btn btn-light"><i class='far fa-edit'></i></button>
	<form action="${root}/board/boarddelete" method="get" style="display: inline-block;" >
	<button type="submit" id="_btndelete" class="btn btn-danger"><i class='far fa-trash-alt'></i></button>
	<input type="hidden" name="articleno" value="${board.articleno}"/>
	</form>
	</div>
</c:if>
</div>
<table class="table table-borderless">
<c:if test="${not empty board}">
<tr>
<th>글번호</th><td class="detail">${board.articleno}</td>
</tr>
<tr>
<th>작성자</th><td class="detail">${board.userid}</td>
</tr>
<tr>
<th>제목</th><td class="detail">${board.title}</td>
</tr>
<tr>
<th>내용</th><td class="detail"><textarea cols="100" rows="30" readonly="readonly" style=" resize: none;">${board.content}</textarea></td>
</tr>
</c:if>
</table>
</div>
<div id="_boardmodify" class="container">
<div class="btn-group" style="float: right; padding: 5px;">
<button id="_modify"  class="btn btn-light" ><i class='fas fa-edit' style='color:red'></i></button>
<button type="button" id="_modifycancel"  class="btn btn-light"><i class='fas fa-undo'></i></button>
</div>
<form action="" id="_modi" method="post">
<table class="table table-borderless">
<c:if test="${not empty board}">
<tr>
<th>글번호</th><td class="detail">${board.articleno}</td>
</tr>
<tr>
<th>작성자</th><td class="detail">${board.userid}</td>
</tr>
<tr>
<th>제목</th><td class="detail"><input   name="title" value="${board.title}"></td>
</tr>
<tr>
<th>내용</th><td class="detail"><textarea cols="100" rows="30" name="content"  style=" resize: none;">${board.content}</textarea></td>
</tr>
<tr>
</tr>
</c:if>
</table>
<input type="hidden" name="userid" value="${board.userid}" />
<input type="hidden" name="articleno" value="${board.articleno}" />
</form>
</div>
<div class="container">
	
	<button id="_btn" class="btn btn-outline-primary btn-block">게시판 목록보기</button>
	<button id="_btnhidden" class="btn btn-outline-primary btn-block">게시판 목록숨기기</button>
</div>
<div id="_showtable" class="container"></div>
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
	var str="<table id='_table' class='table table-hover'>";
	str += "<col width='10%'>";
	str += "<col width='40%'>";
	str += "<col width='20%'>";
	str += "<col width='30%'>";
	str += "<thead> <tr>";
	str += "<th>번호</th>";
	str += "<th>제목</th>";
	str += "<th>작성자</th>";
	str += "<th>작성일</th>";
	str += "</tr> </thead>";
	str += "<tbody>";
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
	str+="</tbody> </table>";
	$("#_showtable").html(str);
}
</script>
</html>
