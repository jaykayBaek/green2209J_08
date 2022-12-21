<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
	<script>
	$(function(){
		$(".pwd-check-btn").on("click", function(){
			const pwdInput = $("#pwd-input").val();
			
			if(pwdInput.trim() == ""){
				alert("비밀번호를 입력해주세요.");
				return;
			}
			
			$.ajax({
				type:"post",
				url :"${ctp}/checkPassword.member",
				data:{password:pwdInput},
				success:function(res){
					if(res == 'fail'){
						alert('비밀번호가 일치하지 않습니다!');
						return;
					}
					else {
						location.href="${ctp}/changeInfo.member";
					}
				},
				error:function() {
					alert("서버의 오류");
				}
			});
			
		});
	})
	</script>
</head>
<body>
	<jsp:include page="/include/nav.jsp"/>
    <div class="container">
        <div class="row">
            <nav class="col-2">
           		<jsp:include page="homeNav.jsp"/>
            </nav>
            <div class="col-10 modify">
				<p>
					보안을 위해 패스워드를 한번 더 입력해주세요.
				</p>
				<input type="password" name="password" id="pwd-input"/>
				<button class="btn btn-success pwd-check-btn">확인</button>
        	</div>
   		</div>
	</div>
	<jsp:include page="/include/footer.jsp"/>
	
</body>
</html>