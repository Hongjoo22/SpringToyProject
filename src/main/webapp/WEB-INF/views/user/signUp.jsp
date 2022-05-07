<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<div  class="container">
<form action="" method="post" class="was-validated" id="_regiform">
<div class="form-group">
      <label for="userid">아이디:</label>
      <button type="button" id="_dbcheck" class="btn btn-outline-primary btn-sm">중복체크</button>
      <input id="_userid" type="text" name="userid" class="form-control" required/>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="pwd">비밀번호:</label>
      <input id="_userpwd" type="password" name="userpwd" class="form-control" required/>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
     <div class="form-group">
      <label for="pwd">비밀번호 재입력:</label>
      <input id="_pwdcheck" type="password" name="pwdcheck" class="form-control" required/>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="pwd">이름:</label>
      <input id="_username" type="text" name="username" class="form-control" required/>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group">
      <label for="pwd">이메일:</label>
      <input id="_useremail" type="email" name="useremail" class="form-control" required/>
      <div class="valid-feedback">Valid.</div>
      <div class="invalid-feedback">Please fill out this field.</div>
    </div>
    <div class="form-group form-check">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember" required> 개인정보 수집 및 이용에 동의합니다.
      </label>
   </div>
   <div>
   <input id="_btnregi" type="button" value="회원가입" class="btn btn-outline-success">
   <button type="reset" class="btn btn-outline-secondary">초기화</button>
   </div>
</form>
</div>
</body>
<script type="text/javascript">
	$(function(){
		var check = false;
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
						var cnt = parseInt(result);
						if(cnt>0){
							alert("사용할 수 없는 아이디입니다.");
							$("#_userid").val("");
						}else{
							check = true;
							alert("사용할 수 있는 아이디입니다.");
						}
					},
					error: function(msg){
						alert("중복체크 실패");
					}
				}); 
			}	 
		});
		 $("#_btnregi").click(function(){
			if($("#_userpwd").val() != $("#_pwdcheck").val()){
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}else if(!check){
				alert("아이디 중복 확인이 필요합니다.");
				return;
			}else{
				alert(check);
				$("#_regiform").attr("action","${root}/user/signUp").submit();
			}
		}); 
	}); 
</script>
</html>