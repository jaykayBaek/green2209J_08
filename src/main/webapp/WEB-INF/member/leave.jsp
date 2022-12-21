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
		function isValidPassword (pwd) {
			$.ajax({
				type:"post",
				url :"${ctp}/checkPassword.member",
				data:{password:pwd},
				success:function(res){
					if(res == 'fail'){
						alert('비밀번호가 일치하지 않습니다.');
						return false;
					}
					else if(res == 'success'){
						return true;
					}
				},
				error:function() {
					alert("서버의 오류");
				}
			});
			return false;
		}
		let leave = () => {
			const pwd = $('#pwd').val();
			console.log('1.'+pwd);
			if(pwd.trim() == ""){
				alert('비밀번호를 입력해주세요!');
				return;
			}
			const res = confirm('정말 회원탈퇴하시겠습니까?');
			let result = isValidPassword(pwd)
			console.log('2.'+result);
			if(result == true){
				leaveForm.submit();
			}
			else{
				alert('비밀번호가 틀렸습니다.');
				return;
			}
		}
	</script>
	<style>
    body, h1, h2, h3, h4 span, div, strong  {
			font-family: 'Helvetica', 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
      text-decoration: none !important;
    }
    ul, li{
        list-style: none;
        padding:0px;
        margin:0px;
    }
	</style>
</head>
<body>
<body>
  <jsp:include page="/include/nav.jsp"/>
  <div class="container">
    <div class="row">
      <nav class="col-2">
        <jsp:include page="homeNav.jsp" />
      </nav>
      <div class="col-10">
        <span class="h4 font-weight-bold">회원 탈퇴</span><br />
        <p class="text-info font-weight-bold">"다음 사항을 꼭 확인해 주세요."</p>
        <div class="row">
          <span>
            회원 탈퇴 관련하여 자주 묻는 질문 (FAQ)<br />
            Q: 아직 사용하지 않은 포인트는 어떻게 되나요?<br />
            A: 즉시 소멸되며 환불 받을 수 없습니다.<br />
            <b>현재 나의 잔여 포인트: ${point}원</b><br />
            Q: 탈퇴한 계정의 아이디나 이메일로 다시 가입할 수 있나요?<br />
            A: 탈퇴가 완료되면 이메일을 암호화하여 보관합니다. 탈퇴 이후 30일 동안 동일한 이메일로 가입할 수 없습니다.<br />
          </span>
        </div>
        <form name="leaveForm" method="post" action="{ctp}/leaveOk.member">
        <div class="row">
          <ul>
            <li>
              탈퇴하려는 이유는 무엇인가요?
              <ul>
                <li><input type="radio" name="reason" checked value="원하는 책이 부족해서">원하는 책이 부족해서</li>
                <li><input type="radio" name="reason" value="회원 혜택이 부족해서">회원 혜택이 부족해서</li>
                <li><input type="radio" name="reason" value="시스템 오류가 잦아서">시스템 오류가 잦아서</li>
                <li><input type="radio" name="reason" value="고객응대가 늦어서">고객응대가 늦어서</li>
                <li><input type="radio" name="reason" value="자주 사용하지 않아서">자주 사용하지 않아서</li>
                <li><input type="radio" name="reason" value="보안상의 이유로">보안상의 이유로</li>
                <li><input type="radio" name="reason" value="기타">기타</li>
              </ul>
            </li>
          </ul>
        </div>
        <div class="row">
          <ul>
            <li>
              <p class="text-info font-weight-bold">"본인 확인을 위해 비밀번호를 다시 입력해주세요"</p>
              <input type="password" name="password" id="pwd" placeholder="비밀번호 입력">
            </li>
          </ul>
        </div>
        <div class="row d-flex flex-column">
          <div class="alert alert-warning mt-2" role="alert">
            탈퇴 완료된 계정은 복구할 수 없습니다.
          </div>
          <button class="btn btn-warning" onclick="leave()">회원 탈퇴</button>
          <button class="btn btn-info" onclick="javascript:location.href='${ctp}/'">취소</button>
        </div>
        </form>
      </div>
    </div>
  </div>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>