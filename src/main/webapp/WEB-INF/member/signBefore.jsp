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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-applesdgothicneo@1.0.3/css/all.min.css">
	<style>
	  body, h1, h2, span, div, strong  {
	    font-family: 'Helvetica', 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
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
	</style>
</head>
<body>
  <div class="container d-flex flex-column justify-content-around align-items-center mt-1" style="height: 100vh;">
    <picture>
      <img src="images/READING.png" alt="리딩" class="img-fluid" height="45vh">
      <img src="images/BOOKS.png" alt="북스" class="img-fluid" height="45vh">
    </picture>
    <div class="signup-before d-flex flex-column justify-content-center align-items-center" stlye="width:100%">
      <img src="images/decobooks.png" alt="책과 사람들" class="img-fluid">
      <button class="btn btn-primary pl-5 pr-5 mb-2" onclick="location.href='${ctp}/signup.member'">
        회원가입
      </button>
    </div>
    <div class="question">
      <a href="${ctp}/login.member">
        <span class="font-weight-bold">혹시 이미 회원이신가요?</span>
      </a>
    </div>
  </div>
</body>
</html>