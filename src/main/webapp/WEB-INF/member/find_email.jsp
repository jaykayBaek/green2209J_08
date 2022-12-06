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
    
    $(function(){
      $('.input_phone').hide();
      $('.alert_name').hide();
      $('.alert_phone').hide();

      $('#name').blur(function(){
        const regName = /^[가-힣a-zA-Z]{2,30}$/i;
        const name = $('#name').val();
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

      $('#input_phone').blur(function(){
        let phoneNo=$('#input_phone').val().replace(/-/g, '');
        $('#input_phone').val(phoneNo);
        const regPhoneNo = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/
        if(!phoneNo.match(regPhoneNo)){
          $(".alert_phone").show(200);
          $('#demo_phone').html('정확히 입력해주세요.');
				return;
        }
        $(".alert_phone").hide(200);
        isValidPhoneNo = true;
      });

    });
  </script>
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
    <div class="sign_in d-flex flex-column justify-content-center align-items-center mt-5" stlye="width:100%;" >
      <form action="#" method="post">
        <div class="d-flex flex-column flex-wrap align-items-center">
          <span class="h4 font-weight-bold" style="color:#2b9348">이메일 찾기</span>
          <div class="form-group input_name" style="width:50vh; height:100%">
            <input type="text" class="form-control" placeholder="성명을 입력해주세요." id="name">
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
            <input type="text" class="form-control" placeholder="핸드폰 번호를 입력해주세요." id="input_phone" name="phone_no">
            <div class="alert alert-warning mt-2 alert_phone">
              <svg xmlns="http://www.w3.org/2000/svg" width="0.8em" height="0.8em" fill="currentColor"
                class="bi bi-info-circle-fill" viewBox="0 0 16 16">
                <path
                  d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
              </svg>
              <span id="demo_phone" style="font-size:0.8em"></span>
            </div>
          </div>
          <button class="btn btn-primary btn-lg pl-5 pr-5 mb-2" style="width:100%">
            찾기
          </button>
        </div>
      </form>
    </div>

  </div>
</body>
</html>