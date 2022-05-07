<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Toy</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
	  <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script> -->
<style type="text/css">
	#_table{
		margin: auto;
		border: 1px solid black;
		text-align: center;
	}		
	.detail{
		text-align: center;
	}
	.container{
		padding-top: 10px;
	}
</style>
</head>
<body>
<div class="container">
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand -->
  <a class="navbar-brand" href="#">Logo</a>

  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="${root}/">HOME</a>
    </li>
     <c:if test="${empty login}">
     <li class="nav-item">
      <a class="nav-link" href="#" data-toggle="modal" data-target="#modalLogin">로그인</a>
     </li>
     </c:if>
    <c:if test="${not empty login}">
    <li class="nav-item">
      <a class="nav-link" href="${root}/board/boardlist">게시판 목록</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${root}/board/mvboardwrite">글 작성</a>
    </li>
	<li class="nav-item">
      <a class="nav-link" href="${root}/user/logout">로그아웃</a>
    </li>
    </c:if>
    <!-- Dropdown -->
    <!-- <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Dropdown link
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">Link 1</a>
        <a class="dropdown-item" href="#">Link 2</a>
        <a class="dropdown-item" href="#">Link 3</a>
      </div>
    </li> -->
  </ul>
</nav>
</div>
<!-- The Modal -->
  <div class="modal fade" id="modalLogin">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">로그인</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
         <form action="${root}/user/login" method="get" class="was-validated">
        <div class="modal-body">
		 <div class="form-group">
		      <label for="id">아이디:</label>
		      <input type="text" name="userid"  size="30" class="form-control"  required>
		   </div>
		   <div class="form-group">
		     <label for="pwd">비밀번호:</label>
		     <input type="password" name="userpwd"  size="30" class="form-control" required>
		   </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
		<input type="submit" value="로그인" class="btn btn-primary" >
		<a href="${root}/user/mvsignUp" class="btn btn-primary">회원가입</a>
		</form>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  