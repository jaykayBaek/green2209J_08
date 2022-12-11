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
  <title>이메일 찾기</title>
  <script>
	'use strict';
    let isValidName = false;
	let isValidPhoneNo = false;
	let name = "";
	let phoneNo = "";
	$(function () {
	    $('.input_phone').hide();
	    $('.alert_name').hide();
	    $('.alert_phone').hide();
	    
	    $('#name').blur(function () {
	      const regName = /^[가-힣a-zA-Z]{2,30}$/i;
	      name = $('#name').val();
	      if (!name.match(regName)) {
	        $(".alert_name").show(200);
	        $('#demo_name').html('이름은 2~30글자 사이의 한글 또는 영문으로 입력해주세요.');
	        $('.input_phone').hide(200);
	        return;
	      }
	      $('.alert_name').hide(200);
	      $('.input_phone').show(200);
	      isValidName = true;
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
	});
	let getFindEmailRes = () => {
		if (!(isValidName && isValidPhoneNo)) {
			return;
		}
	    let query = {
	      phoneNo : phoneNo,
	      name : name
	    };
		$.ajax({
			url   : "${ctp}/findInputEmail.member",
			type: "post",
			data: query,
			success: function(res) {
				let jsonRes = JSON.parse(res);
				let resJson = jsonRes.res;
				let emailJson = jsonRes.email;
 				if (resJson=='false') {
					$(".alert_phone").show(200);
					$('#demo_phone').html('검색된 결과를 찾을 수 없습니다. 회원가입하신 것이 아니라면 회원가입을 해주세요.');
				}
				else {
					$(".find_res").html(`
							<div class="sign_in d-flex flex-column justify-content-center align-items-center mt-5" stlye="width:100%;" >
						      <h3 class="h4 font-weight-bold">회원님의 이메일은 다음과 같습니다.</h3>
						      <p>
						        <span class="h5 font-weight-bold email_result" style="color:#2b9348">
						        </span>
						      </p>
						      <p class="text-info">
						        개인 정보 보호를 위해, 앞 세 글자만 보여드립니다.
						        <br/>
						      </p>
						      <a href="${ctp}/loginBefore.member" class="btn btn-primary btn-lg pl-5 pr-5 mb-2" style="width:100%">
						        로그인
						      </a>
						      <a href="${ctp}/findPwd.member" class="forget_pwd m-0 p-0">
						        <p class="text-info m-0 pl-5 pr-5 pt-3 pb-3">
						          비밀번호를 잃어버리셨나요?
						          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#2b9348" class="bi bi-info-circle-fill" viewBox="0 0 16 16">
						            <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
						          </svg>
						          <strong style="color:#2b9348">비밀번호 재설정</strong>
						        </p>
						      </a>
						    </div>`);
					$(".email_result").html(emailJson);
				}
			},
			error: function() {
				alert("전송 실패");
			}
	    });
	}
  </script>
  <style>
    body, h1, h2, h3, h4 {
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
  </style>
</head>
<body>
  <div class="container d-flex flex-column justify-content-center align-items-center">
    <nav class="mt-3" stlye="width:100vh">
      <picture>
        <img src="images/READING.png" alt="리딩" class="img-fluid" height="10vh">
        <img src="images/BOOKS.png" alt="북스" class="img-fluid" height="10vh">
      </picture>
    </nav>
    <div class="d-flex flex-column justify-content-center align-items-center mt-5" stlye="width:100%;" >
      <div class="find_res">
      
	      <form name="findEmail" method="post" action="${ctp}/findInputEmail.member">
	        <div class="d-flex flex-column flex-wrap align-items-center">
	          <span class="h4 font-weight-bold" style="color:#2b9348">이메일 찾기</span>
	          <div class="form-group input_name" style="width:50vh; height:100%">
	            <input type="text" class="form-control" placeholder="성명을 입력해주세요." id="name" name="name">
	            <div class="alert alert-warning mt-2 alert_name">
	              <svg xmlns="http://www.w3.org/2000/svg" width="0.8em" height="0.8em" fill="currentColor"
	                class="bi bi-info-circle-fill" viewBox="0 0 16 16">
	                <path
	                  d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
	              </svg>
	              <span id="demo_name" style="font-size:0.8em"></span>
	            </div>
	          </div>
	          <div class="form-group input_phone" style="width:50vh; height:100%">
	            <input type="text" class="form-control" placeholder="핸드폰 번호를 입력해주세요." id="input_phone" name="phoneNo">
	            <div class="alert alert-warning mt-2 alert_phone">
	              <svg xmlns="http://www.w3.org/2000/svg" width="0.8em" height="0.8em" fill="currentColor"
	                class="bi bi-info-circle-fill" viewBox="0 0 16 16">
	                <path
	                  d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
	              </svg>
	              <span id="demo_phone" style="font-size:0.8em"></span>
	            </div>
	          </div>
	          <button class="confirm_btn btn btn-primary btn-lg pl-5 pr-5 mb-2" type="button" style="width:100%" onclick="getFindEmailRes()">
	            찾기
	          </button>
	        </div>
	      </form>
	      
	    </div>
	    
      </div>
  </div>
</body>
</html>