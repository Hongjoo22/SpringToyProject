<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>singUp</title>
</head>
<body>
<h1>
	THIS IS SignUp Page
</h1>
<div>
<form action="${root}/user/signUp" method="post" >
<table>
<tr>
<th>아이디</th><td><input id="_userid" type="text" name="userid"/></td>
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
</html>