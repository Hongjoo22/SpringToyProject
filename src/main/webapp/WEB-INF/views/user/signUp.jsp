<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<body>
<h1>
	THIS IS SignUp Page
</h1>
<div>
<form action="${root}/user/signUp" method="post" >
<table>
<tr>
<th>아이디</th><td><input id="_userid" type="text" name="userid"/></td>
<td><button type="button" id="_dbcheck">중복체크</button></td>
</tr>
<tr>
<th>비밀번호</th><td><input id="_userpwd" type="password" name="userpwd"/></td>
</tr>
<tr>
<th>이름</th><td><input id="_username" type="text" name="username"/></td>
</tr>
<tr>
<th>이메일</th><td><input id="_useremail" type="email" name="useremail"/></td>
</tr>
<tr>
<td colspan="2"><input id="_btnregi" type="submit" value="회원가입"></td>
</tr>
<tr>
<td colspan="2"><button type="reset">초기화</button></td>
</tr>
</table>
</form>
</div>
<a href="../">HOME</a>
</body>
<script type="text/javascript">
	$(function(){
		$("#_dbcheck").click(function(){
			 var id = $("#_userid").val();
			 if(id==""){
				alert("아이디를 입력하세요.");
			}else{
				$.ajax({
					url: "${root}/user/idcheck/",
					type: "GET",
					data: "userid="+id,
					async: true,
					success : function(result){
						idcheck(result);
					},
					error: function(msg){
						alert("중복체크 실패");
					}
				}); 
			}	 
		});
	}); 
	function idcheck(response){
		var cnt = parseInt(response);
		if(cnt>0){
			alert("사용할 수 없는 아이디입니다.");
			$("#_userid").val("");
		}else{
			alert("사용할 수 있는 아이디입니다.");
		}
	}
</script>
</html>