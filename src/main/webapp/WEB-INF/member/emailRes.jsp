<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
</head>
<style>
  body {
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
    <nav class="mt-3" stlye="width:100%">
      <picture>
        <img src="../images/READING.png" alt="리딩" class="img-fluid" height="10vh">
        <img src="../images/BOOKS.png" alt="북스" class="img-fluid" height="10vh">
      </picture>
    </nav>
    <div class="sign_in d-flex flex-column justify-content-center align-items-center mt-5" stlye="width:100%;" >
      <h3 class="h4 font-weight-bold">회원님의 이메일은 다음과 같습니다.</h3>
      <p>
        <span class="h5 font-weight-bold" style="color:#2b9348">
          ja********@gmail.com
        </span>
      </p>
      <p class="text-info">
        개인 정보 보호를 위해, 앞 두 글자만 보여드립니다.
        <br/>
        전체 이메일 주소는 핸드폰 번호로 안내해드립니다.
      </p>
      <button class="btn btn-primary btn-lg pl-5 pr-5 mb-2" style="width:100%">
        로그인
      </button>
      <a href="#" class="forget_pwd m-0 p-0">
        <p class="text-info m-0 pl-5 pr-5 pt-3 pb-3">
          비밀번호를 잃어버리셨나요?
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#2b9348" class="bi bi-info-circle-fill" viewBox="0 0 16 16">
            <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
          </svg>
          <strong style="color:#2b9348">비밀번호 재설정</strong>
        </p>
      </a>
    </div>
  </div>
</body>
</html>