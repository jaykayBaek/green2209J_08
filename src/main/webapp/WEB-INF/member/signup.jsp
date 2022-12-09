<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>title</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${ctp}/js/woo.js"></script>
	<script>
		'use strict';
		/* 유효성 검사가 모두 true가 될 시 DB 테이블에 값이 저장되도록 설계 */
		let isValidEmail = false;
		let isValidPwd = false;
		let isValidName = false;
		let isValidBirthday = false;
		let isValidSex = false;
		let isValidPhoneNo = false;

		$(function () {
			$(".alert_email").hide();
			$(".alert_pwd").hide();
			$(".alert_name").hide();
			$(".alert_birthyear").hide();
			$(".alert_gender").hide();
			$(".alert_phone").hide();
	
			/* 이메일 체크 */
			$("#email").blur(function () {
				const regEmail = /^[\w-\.]{1,25}@([\w-]+\.)+[\w-]{2,4}$/i;
				let emailVal = $('#email').val();
				if (emailVal.trim() == '') {
					$(".alert_email").show(200);
					$('#demo_email').html('이메일을 입력해주세요.');
					isValidEmail = false;
					return;
				}
				else if (!emailVal.match(regEmail)) {
					$(".alert_email").show(200);
					$('#demo_email').html('이메일 양식을 다시 한번 확인해주세요.');
					isValidEmail = false;
					return;
				}
	
				$(".alert_email").hide(200);
				isValidEmail = true;
			});

	
			/* 비밀번호 체크 */
			let pwdFirst = "";
			let pwdSecond = "";
			const regPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
			$("#pwd_first").blur(function () {
				pwdFirst = $('#pwd_first').val();
				pwdSecond = $('#pwd_second').val();
				if (pwdFirst.trim() == '') {
					$(".alert_pwd").show(200);
					$('#demo_pwd').html('비밀번호를 입력해주세요.');
					isValidPwd = false;
					return;
				}
				else if (!pwdFirst.match(regPwd)) {
					$(".alert_pwd").show(200);
					$('#demo_pwd').html('비밀번호는 8자 이상, 하나 이상의 문자/숫자/특수문자로 이루어져야 합니다.');
					return;
				}
				else if (pwdFirst != pwdSecond){
					$(".alert_pwd").show(200);
					$('#demo_pwd').html('비밀번호가 일치하지 않습니다.');
					isValidPwd = false;
					return;
				}
				isValidPwd = true;
				$(".alert_pwd").hide(200);
			});
			$("#pwd_second").blur(function () {
				pwdSecond = $('#pwd_second').val();
				if (pwdSecond.trim() == '' || pwdFirst.trim() == '') {
					$(".alert_pwd").show(200);
					$('#demo_pwd').html('비밀번호를 입력해주세요.');
					isValidPwd = false;
					return;
				}
				else if (!pwdSecond.match(regPwd)) {
					$(".alert_pwd").show(200);
					$('#demo_pwd').html('비밀번호는 8자 이상, 하나 이상의 문자/숫자/특수문자로 이루어져야 합니다.');
					isValidPwd = false;
					return;
				}
				else if(pwdFirst!=pwdSecond){
					$(".alert_pwd").show(200);
					$('#demo_pwd').html('비밀번호가 일치하지 않습니다.');
					isValidPwd = false;
					return;
				}
				$(".alert_pwd").hide(200);
				isValidPwd = true;
			});
	
			// 이름 체크
			$('#name').blur(function(){
				const regName = /^[가-힣a-zA-Z]{2,30}$/i;
				let name = $('#name').val();
				if(!name.match(regName)){
					$(".alert_name").show(200);
					$('#demo_name').html('이름은 2~30글자 사이의 한글 또는 영문으로 입력해주세요.');
					isValidName = false;
					return;
				}
				$('.alert_name').hide(200);
				isValidName = true;
			});
	
			// 생년월일 체크
			$('#birthyear').blur(function(){
				const regBirth = /^(19|20)\d{2}$/
				let birthyear = $('#birthyear').val();
				if(birthyear.trim()==""){
					$(".alert_birthyear").show(200);
					$('#demo_birthyear').html('생년월일을 입력해주세요.');
					isValidBirthday = false;
					return;
				}
				else if (!birthyear.match(regBirth)){
					$(".alert_birthyear").show(200);
					$('#demo_birthyear').html('정확히 입력해주세요.');
					isValidBirthday = false;
					return;
				}
				$('.alert_birthyear').hide(200);
				isValidBirthday = true;
			});
			
			/* 핸드폰 번호 유효성 검사*/
			$('#phone_no').blur(function(){
				let phoneNo=$('#phone_no').val().replace(/-/g, '');
				$('#phone_no').val(phoneNo);
				const regPhoneNo = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/
				if(!phoneNo.match(regPhoneNo)){
					$(".alert_phone").show(200);
					$('#demo_phone').html('정확히 입력해주세요.');
					isValidPhoneNo = false;
					return;
				}
				$(".alert_phone").hide(200);
				isValidPhoneNo = true;
			});
		});
		
		let join_check = () => {
			let gender = $('#gender').val();
			if(gender=='none'){
				$(".alert_gender").hide(200);
				$(".alert_gender").show(200);
				$('#demo_gender').html('성별을 선택해주세요.');
				isValidSex = false;
				return;
			}
			isValidSex = true;
			$(".alert_gender").hide(200);
	
			if(isValidEmail && isValidPwd && isValidName && isValidBirthday && isValidSex && isValidPhoneNo){
				joinform.submit();
			}
			else {
				alert("회원가입 양식을 다시 확인해주세요.");
			}
		}
	</script>
	<style>
		body,h1,h2,span,div,strong {
			font-family: 'Helvetica', 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
		}
	
		body {
			background-color: #eeef20;
		}
	
		input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
	  		-webkit-appearance: none;
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
	
		.form-group>input {
			background-color: #fff;
			border: 1px solid #e9ecef;
			border-radius: 0px;
		}
	
		.form-item>input {
			background-color: #fff;
			border: 1px solid #e9ecef;
			border-radius: 0px;
		}
		#birthyear {
			background-color: #fff;
			border: 1px solid #e9ecef;
			border-radius: 0px;
		}
	
		.input-group>input {
			background-color: #fff;
			border: 1px solid #e9ecef;
			border-radius: 0px;
		}
	
		select {
			background-color: #fff;
			border: 1px solid #e9ecef;
			width: 100%;
			height: 35.75px;
		}
	
		.form-group>input::placeholder {
			color: #c0c0c0;
		}
	
		.form-item>input::placeholder {
			color: #c0c0c0;
		}
	
		.form-group>input:focus {
			background-color: #fff;
		}
	</style>
</head>
<body>
	<div class="container d-flex flex-column justify-content-center align-items-center mt-1" style="height: 100vh;">
		<div class="row">
			<picture>
				<img src="images/READING.png" alt="리딩" class="img-fluid" height="15vh">
				<img src="images/BOOKS.png" alt="북스" class="img-fluid" height="15vh">
			</picture>
		</div>	
		<div class="signup-before d-flex flex-column justify-content-center align-items-center mt-5">
		
			<form name="joinform" method="post" action="${ctp}/joinValidChk.member">
			
				<div class="d-flex flex-column flex-wrap align-items-start">
					<div class="form-group" style="width:100%">
						<input type="email" class="form-control" placeholder="이메일을 입력하세요" id="email" name="email">
						<div class="alert alert-warning mt-2 alert_email">
							<svg xmlns="http://www.w3.org/2000/svg" width="0.8em" height="0.8em" fill="currentColor"
								class="bi bi-info-circle-fill" viewBox="0 0 16 16">
								<path
									d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
							</svg>
							<span id="demo_email" style="font-size:0.8em"></span>
						</div>
					</div>
					<div class="form-group" style="width:100%">
						<input type="password" class="form-control" id="pwd_first" placeholder="비밀번호" name="pwd_first">
						<input type="password" class="form-control" id="pwd_second" placeholder="비밀번호 확인" name="pwd_last">
						<div class="alert alert-warning mt-2 alert_pwd">
							<svg xmlns="http://www.w3.org/2000/svg" width="0.8em" height="0.8em" fill="currentColor"
								class="bi bi-info-circle-fill" viewBox="0 0 16 16">
								<path
									d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
							</svg>
							<span id="demo_pwd" style="font-size:0.8em"></span>
						</div>
					</div>
					<div class="form-group" style="width:100%">
						<input type="text" class="form-control" placeholder="이름" id="name" name="name">
						<div class="alert alert-warning mt-2 alert_name">
							<svg xmlns="http://www.w3.org/2000/svg" width="0.8em" height="0.8em" fill="currentColor"
								class="bi bi-info-circle-fill" viewBox="0 0 16 16">
								<path
									d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
							</svg>
							<span id="demo_name" style="font-size:0.8em"></span>
						</div>
					</div>
					<div class="form-group d-flex d-nowrap" style="width:100%">
						<div class="" style="width:100%">
							<input type="number" class="form-control" placeholder="출생년도 (예:2022)" id="birthyear" name="birthyear" maxlength="4" style="width:100%">
							<div class="alert alert-warning mt-2 alert_birthyear">
								<svg xmlns="http://www.w3.org/2000/svg" width="0.8em" height="0.8em" fill="currentColor"
									class="bi bi-info-circle-fill" viewBox="0 0 16 16">
									<path
										d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
									</svg>
									<span id="demo_birthyear" style="font-size:0.8em"></span>
							</div>
						</div>
						<div class="" style="width:100%">
							<select name="gender" id="gender" style="width:100%">
								<option value="none">성별을 선택해주세요.</option>
								<option value="men">남성</option>
								<option value="women">여성</option>
							</select>
							<div class="alert alert-warning mt-2 alert_gender">
								<svg xmlns="http://www.w3.org/2000/svg" width="0.8em" height="0.8em" fill="currentColor"
									class="bi bi-info-circle-fill" viewBox="0 0 16 16">
									<path
										d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
								</svg>
								<span id="demo_gender" style="font-size:0.8em"></span>
							</div>
						</div>
					</div>
					<div class="form-group mb-1" style="width:100%">
						<input type="text" class="form-control" placeholder="휴대전화 번호 입력" id="phone_no" name="phone_no" />
						<div class="alert alert-warning mt-2 alert_phone">
							<svg xmlns="http://www.w3.org/2000/svg" width="0.8em" height="0.8em" fill="currentColor"
								class="bi bi-info-circle-fill" viewBox="0 0 16 16">
								<path
									d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
							</svg>
							<span id="demo_phone" style="font-size:0.8em"></span>
						</div>
					</div>
					<div class="form-group mb-1" style="width:100%">
						<input type="hidden" name="address" id="address">
						<span style="color:#94A2B8; font-size:0.8em">선택 입력</span>
						<div class="input-group mb-1">
							<input type="text" name="postcode" id="sample6_postcode" value="우편번호" class="form-control" readonly>
							<div class="input-group-append">
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary"
									readonly>
							</div>
						</div>
						<input type="text" name="roadAddress" id="sample6_address" size="50" placeholder="주소"
							class="form-control mb-1" readonly>
						<div class="input-group mb-1">
							<input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소"
								class="form-control" maxlength="20"> &nbsp;&nbsp;
							<div class="input-group-append">
								<input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목"
									class="form-control" readonly>
							</div>
						</div>
					</div>
					<div class="form-group mb-1" style="width:100%">
						<select class="form-control" id="job" name="job">
							<option value="none">직업이나 종사하시는 분야를 선택해주세요</option>
							<option value="학생">학생</option>
							<option value="회사원">회사원</option>
							<option value="전업주부">전업주부</option>
							<option value="공무원">공무원</option>
							<option value="의사">의사</option>
							<option value="금융업">금융업</option>
							<option value="it">it</option>
							<option value="군인">군인</option>
							<option value="법조인">법조인</option>
							<option value="세무인">세무인</option>
							<option value="자영업">자영업</option>
							<option value="기타">기타</option>
						</select>
					</div>
					<button type="button" class="btn btn-primary btn-lg pl-5 pr-5 mt-2" style="width:100%" onclick="join_check()">
						회원가입
					</button>
				</div>
			</form>
		</div>
	</div>
</body>

</html>