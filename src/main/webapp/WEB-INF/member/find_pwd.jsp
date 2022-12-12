<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>title</title>
<jsp:include page="../../include/bs4.jsp"></jsp:include>
<script>
	'use strict';
	let isValidEmail = false;
	let isValidPhoneNo = false;
	let email = "";
	let phoneNo = "";
	$(function () {
		$('.input_phone').hide();
		$('.alert_email').hide();
		$('.alert_phone').hide();

		$('#email').blur(function () {
			const regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			email = $('#email').val();
			if (email.trim() == '') {
				$(".alert_email").show(200);
				$('#demo_email').html('이메일을 입력해주세요.');
				$('.input_phone').show(200);
				return;
			}
			if (!email.match(regEmail)) {
				$(".alert_email").show(200);
				$('#demo_email').html('이름은 2~30글자 사이의 한글 또는 영문으로 입력해주세요.');
				$('.input_phone').hide(200);
				return;
			}
			$('.alert_email').hide(200);
			$('.input_phone').show(200);
			isValidEmail = true;
		});

		$('#input_phone').blur(function () {
			phoneNo = $('#input_phone').val().replace(/-/g, '');
			$('#input_phone').val(phoneNo);
			const regPhoneNo = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/
			if (!phoneNo.match(regPhoneNo)) {
				$(".alert_phone").show(200);
				$('#demo_phone').html('정확히 입력해주세요.');
				return;
			}
			$(".alert_phone").hide(200);
			isValidPhoneNo = true;
		});
	})
	
	let getFindPwdRes = () => {
		if (!(isValidEmail && isValidPhoneNo)) {
			return;
		}
		
		let query = {
			email: email,
			phoneNo: phoneNo
		};
		$.ajax({
			url: "${ctp}/findInputPwd.member",
			type: "post",
			data: query,
			success: function (res) {
				let jsonRes = JSON.parse(res);
				let resJson = jsonRes.res;
				let tmpPwdJson = jsonRes.tmpPwd;
				console.log(resJson);
				console.log(tmpPwdJson);
				if (resJson == 'false') {
				console.log('실패');
					$(".alert_phone").show(200);
					$('#demo_phone').html('검색된 결과를 찾을 수 없습니다. 이메일과 전화번호를 확인해주세요.');
				}
				else{
				console.log('성공');
					$(".find_res").html(`
							<div class="sign_in d-flex flex-column justify-content-center align-items-center mt-5" stlye="width:100%;" >
						      <h3 class="h4 font-weight-bold">회원님의 임시 비밀번호는 다음과 같습니다.</h3>
						      <div class="container d-flex align-items-center justify-content-center p-5 demo_tmp_pwd mt-5 mb-3">
						        <span class="display-4 font-weight-bold pwd_result"></span>
						      </div>
						      <a href="${ctp}/loginBefore.member" class="btn btn-primary btn-lg pl-5 pr-5 mb-2" style="width:100%">
						        로그인
						      </a>
						      <p class="text-info m-0 pl-5 pr-5 pt-3 pb-3">
						        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#2b9348" class="bi bi-info-circle-fill" viewBox="0 0 16 16">
						          <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
						        </svg>
						        발급 받으신 비밀번호를 빠른 시일 내로 변경해주세요.
						      </p>
						    </div>`);
					$(".pwd_result").html(tmpPwdJson);
				}
			},
			error: function () {
				alert("전송 실패");
			}
		});
	}
</script>
<style>
	body,h1,h2,h3,h4 {
	  background-color: #eeef20;
	  font-family: 'Helvetica', 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
	}
	.btn-primary {
	  border: 0px;
	  background-color: #80b918;
	  color: #fff;
	  font-weight: bold;
	}
	.btn-primary:hover,
	.btn-primary:active {
	  border: 0px;
	  background-color: #2b9348;
	  color: #fff;
	}
	.text-info{
	  color:#6c757d !important;
	  font-size: 0.9em;
	}
	.forget_pwd:hover{
	  margin:0px;
	  padding:0px;
	  text-decoration: none;
	  text-align: center;
	  background-color: rgba(43, 147, 72, 0.2);
	  transition: background-color 0.3s ease 0s;
	}
	.demo_tmp_pwd{
	  background-color: #007f5f;
	  color: #fff;
	  border-radius: 1em;
	}
</style>
</head>
<body>
  <div class="container d-flex flex-column justify-content-center align-items-center">
    <nav class="mt-3" style="width:100vh">
      <picture>
        <img src="images/READING.png" alt="리딩" class="img-fluid" height="10vh">
        <img src="images/BOOKS.png" alt="북스" class="img-fluid" height="10vh">
      </picture>
    </nav>
    <div class="d-flex flex-column justify-content-center align-items-center mt-5" stlye="width:100%;" >
    
      <div class="find_res">
	      <form action="#" method="post">
	        <div class="d-flex flex-column flex-wrap align-items-center">
	          <span class="h4 font-weight-bold" style="color:#2b9348">비밀번호 찾기</span>
	          <div class="form-group input_name" style="width:50vh; height:100%">
	            <input type="text" class="form-control" placeholder="이메일을 입력해주세요." id="email">
	            <div class="alert alert-warning mt-2 alert_email">
	              <svg xmlns="http://www.w3.org/2000/svg" width="0.8em" height="0.8em" fill="currentColor"
	                class="bi bi-info-circle-fill" viewBox="0 0 16 16">
	                <path
	                  d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
	              </svg>
	              <span id="demo_email" style="font-size:0.8em"></span>
	            </div>
	          </div>
	          <div class="form-group input_phone" style="width:50vh; height:100%">
	            <input type="text" class="form-control" placeholder="핸드폰 번호를 입력해주세요." id="input_phone">
	            <div class="alert alert-warning mt-2 alert_phone">
	              <svg xmlns="http://www.w3.org/2000/svg" width="0.8em" height="0.8em" fill="currentColor"
	                class="bi bi-info-circle-fill" viewBox="0 0 16 16">
	                <path
	                  d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
	              </svg>
	              <span id="demo_phone" style="font-size:0.8em"></span>
	            </div>
	          </div>
	          <button class="btn btn-primary btn-lg pl-5 pr-5 mb-2" type = "button" style="width:100%" onclick="getFindPwdRes()">
	            찾기
	          </button>
	        </div>
	      </form>
      </div>
      
    </div>
  </div>
</body>
</html>