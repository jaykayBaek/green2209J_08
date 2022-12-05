<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-applesdgothicneo@1.0.3/css/all.min.css">
  <style>
    body {
      background-color: #eeef20;
      font-family: 'Helvetica', 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
    }
    label {
      display: inline-block;
      margin-bottom: 0px; 
    }

    .btn-primary {
      border: 0px;
      background-color: #80b918;
      color: #fff;
      font-weight: bold;
    }
    .btn-secondary{
      border: 0px;
      background-color: #31572c;
      color: #fff;
      font-weight: bold;
    }
      
    .btn-primary:hover,
    .btn-primary:active {
      border: 0px;
      background-color: #2b9348;
      color: #fff;
    }

    .btn-secondary:hover,
    .btn-secondary:active {
      border: 0px;
      background-color: #143601;
      color: #fff;
    }

    .login_input{
      background-color: #fff;
      border-radius: 0px;
      height: 50px;
    }

    .login_input>input::placeholder, .login_input>input:focus {
      color: #c0c0c0;
    }

    .login_group_checkbox, .login_group_top{
      background-color: #fff;
    }
    .form-group {
    margin-bottom: 0px;
    }

    .id_form{
      border: 1px solid #ced4da;
    }

    input{
      accent-color: #80b918;
    }
  </style>
</head>

<body>
  <div class="container d-flex flex-column justify-content-center align-items-center mt-1" style="height: 100vh;">
    <nav class="" stlye="width:100vh">
      <picture>
        <img src="images/READING.png" alt="리딩" class="img-fluid" height="10vh">
        <img src="images/BOOKS.png" alt="북스" class="img-fluid" height="10vh">
      </picture>
    </nav>
    <div class="sign_in d-flex flex-column justify-content-center align-items-center mt-5" stlye="width:100%;" >
      <form action="#" method="post">
        <div class="d-flex flex-column flex-wrap align-items-start">
          <div class="form-group login_group_top" style="width:50vh; height:100%">
            <input type="email" class="form-control login_input" placeholder="이메일을 입력하세요" id="email">
            <input type="password" class="form-control login_input" placeholder="비밀번호" id="password">
          </div>
          <div class="form-group login_group_checkbox d-flex justify-content-between align-items-center id_form" style="width:50vh">
            <div class="m-2 p-2">
              <input type="checkbox" name="login_remember_me" id="login_remember_me"/>
              <label for="login_remember_me">로그인 상태 유지</label>
            </div>
            <div class="m-2 p-2">
              <a href="#">아이디 찾기</a>
              <a href="#">비밀번호 찾기</a>
            </div>
          </div>
          <button class="btn btn-primary btn-lg pl-5 pr-5 mb-2" style="width:100%">
            로그인
          </button>
          <button class="btn btn-secondary btn-lg pl-5 pr-5 mb-2" type="button" onclick="location.href='${ctp}/signBefore.member'" style="width:100%">
            회원가입
          </button>
        </div>
      </form>
    </div>
  </div>
</body>
</html>