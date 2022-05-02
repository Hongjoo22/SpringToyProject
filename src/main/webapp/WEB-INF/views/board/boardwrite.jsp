<%@page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<html>
<head>
	<title>boardWrite</title>
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
	$("#_btn").click(function(){
		if(!$("#_title").val()){
			alert("제목을 입력하세요."); 
			return;
		}else if(!$("#_content").val()){
			alert("내용을 입력하세요.");
			return;
		}else{
			$("#_boardwrite").attr("action","boardwrite").submit(); // 비동기 방식			
		}
	});
});

</script>
</head>
<body>
<h1>
	THIS IS boardWrite
</h1>
<div>
<!-- <form action="boardwrite" method="post" > 동기로 -->
<form id="_boardwrite" action="" method="post" > <!-- 비동기 방식-->
<table>
<tr>
<th>작성자</th><td><input id="_userid" type="text" name="userid"/></td>
</tr>
<tr>
<th>제목</th><td><input id="_title" type="text" placeholder="제목을 입력하세요." name="title"/></td>
</tr>
<tr>
<th>내용</th><td><textarea id="_content" cols="100" rows="30" placeholder="내용을 입력하세요." name="content" style=" resize: none;"></textarea></td>
</tr>
<tr>
<td colspan="2"><button id="_btn" type="button">글작성</button></td>
<!-- <td colspan="2"><input id="_btn" type="submit" value="글작성"></td> -->
</tr>
<tr>
<td colspan="2"><button type="reset">초기화</button></td>
</tr>
</table>
</form>
<!-- </form> -->
</div>
<a href="../">HOME</a>
<a href="boardlist">글목록보러가기</a>
</body>
</html>