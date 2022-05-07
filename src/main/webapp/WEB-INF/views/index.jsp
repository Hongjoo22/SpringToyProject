<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!-- <h1>
	THIS IS HOME.  
</h1> -->
<c:if test="${empty login}">
<div class="container">

</div>
</c:if>
</body>
</html>
