<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<body>
<h1>
	THIS IS HOME.  
</h1>
<c:if test="${empty login}">
<form action="${root}/user/login" method="get">
<table>
<tr>
<th>아이디</th>
<td>
<input type="text" name="userid"  size="30">
</td>
</tr>
<tr>
<th>비밀번호</th>
<td>
<input type="password" name="userpwd"  size="30">
</td>
</tr>
<tr>
<td colspan="2" style="text-align: center;">
<input type="submit" value="로그인" >
<a href="${root}/user/mvsignUp">회원가입</a>
</td>
</tr>
</table>
</form>
</c:if>
<c:if test="${not empty login}">
<a href="${root}/board/boardlist">게시판 목록</a>
<a href="${root}/user/logout">로그아웃</a>
</c:if>
</body>
</html>
