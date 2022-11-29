<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
 	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Roboto&display=swap" rel="stylesheet">
  	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  	<script src="${ctp}/js/woo.js"></script>
	
  <style>
    body {
      font-family: 'Roboto', 'Noto Sans KR', serif !important;
      background-color: #eeef20;
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
      border: 0px;
      border-radius: 0px;
    }

    .form-item>input {
      background-color: #fff;
      border: 0px;
      border-radius: 0px;
    }

    .input-group>input{
      background-color: #fff;
      border: 0px;
      border-radius: 0px;
    }

    select {
      background-color: #fff;
      border: 0px;
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
    <nav class="" stlye="width:100vh">
      <picture>
        <img src="images/READING.png" alt="리딩" class="img-fluid" height="15vh">
        <img src="images/BOOKS.png" alt="북스" class="img-fluid" height="15vh">
      </picture>
    </nav>
    <div class="signup-before d-flex flex-column justify-content-center align-items-center mt-5" stlye="width:100%">
      <form action="#" method="post">
        <div class="d-flex flex-column flex-wrap align-items-start">
          <div class="form-group" style="width:50vh">
            <label for="email" class="font-weight-bold">이메일 주소</label>
            <input type="email" class="form-control" placeholder="이메일을 입력하세요" id="email">
          </div>
          <div class="form-group" style="width:50vh">
            <label for="password" class="font-weight-bold">비밀번호</label>
            <input type="password" class="form-control" placeholder="비밀번호" id="password">
            <input type="password" class="form-control" placeholder="비밀번호 확인" id="passwordconfirm">
          </div>
          <div class="form-group" style="width:50vh">
            <label for="name" class="font-weight-bold">이름</label>
            <input type="text" class="form-control" placeholder="이름" id="name">
          </div>
          <div class="form-group form-row" style="width:100%">
            <div class="form-item col-6">
              <label for="birthyear" class="font-weight-bold">출생년도</label>
              <input type="text" class="form-control" placeholder="출생년도 (예:2022)" id="birthyear" maxlength="4">
            </div>
            <div class="col-6">
              <label for="gender" class="font-weight-bold">성별</label><br />
              <select name="gender" id="gender">
                <option value="">성별을 선택해주세요</option>
                <option value="men">남성</option>
                <option value="women">여성</option>
              </select>
            </div>
          </div>
          <div class="form-group mb-1" style="width:100%">
            <label for="address"><span class="font-weight-bold">주소</span></label>
            <input type="hidden" name="address" id="address">
            <div class="input-group mb-1">
              <input type="text" name="postcode" id="sample6_postcode" value="우편번호" class="form-control" readonly>
              <div class="input-group-append">
                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary" readonly>
              </div>
            </div>
            <input type="text" name="roadAddress" id="sample6_address" size="50" placeholder="주소" class="form-control mb-1" readonly>
            <div class="input-group mb-1">
              <input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소" class="form-control"> &nbsp;&nbsp;
              <div class="input-group-append">
                <input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목" class="form-control" readonly>
              </div>
            </div>
          </div>
          <div class="form-group mb-1" style="width:100%">
            <label for="name"><span class="font-weight-bold">직업</span></label>
            <select class="form-control" id="job" name="job">
              <option>직업을 선택해주세요</option>
              <option>학생</option>
              <option>회사원</option>
              <option>전업주부</option>
              <option>공무원</option>
              <option>군인</option>
              <option>의사</option>
              <option>법조인</option>
              <option>세무인</option>
              <option>자영업</option>
              <option>기타</option>
            </select>
          </div>
          <button class="btn btn-primary btn-lg pl-5 pr-5 mb-2" style="width:100%">
            회원가입
          </button>
        </div>
      </form>
    </div>
  </div>
</body>
</html>