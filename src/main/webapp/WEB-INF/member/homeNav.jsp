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
    body,h1,h2,h3,h4,span,div,strong {
        font-family: 'Helvetica', 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
        text-decoration: none !important;
    }
    ul, li{
        list-style: none;
    }
    ul{
        padding: 0.5em;
    }
    .list_content{
        border-bottom: 1px solid #212529;
    }
    h4{
        color: #495057;
    }
    a:hover{
        text-decoration: none !important;
        font-weight: bold;
        color:#80B918;
        transition: color 0.2s;
    }
    i{
        color:#495057;
    }
    .title_home{
        color: #80B918;
    }
    .input-group-text {
      background-color: transparent;
      border: 0px;
    }
</style>

</head>
<body>
	<h3 class="font-weight-bolder">마이 리딩페이지</h3>
       <div class="d-flex flex-column flex-nowrap list_content">
           <div class="d-flex align-items-center">
               <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#80B918" class="bi bi-house-fill" viewBox="0 0 16 16">
                   <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"/>
                   <path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z"/>
               </svg>
               <h4 class="h5 font-weight-bold pl-1 title_home">
                   <a href="${ctp}/myhome.member">리딩북스 홈</a>
               </h4>
           </div>
       </div>
       <div class="d-flex flex-column flex-nowrap list_content">
           <div class="d-flex align-items-center">
               <i class="fas fa-book"></i>
               <h4 class="h5 font-weight-bold pl-1">책</h4>
           </div>
           <ul class="home-list">
               <li>
                   <a href="${ctp}/wishlist.member">장바구니</a>
               </li>
               <li>
                   <a href="">최근 조회한 작품</a>
               </li>
           </ul>
       </div >
       <div class="d-flex flex-column flex-nowrap list_content">
           <div class="d-flex align-items-center">
               <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#595959" class="bi bi-credit-card-fill" viewBox="0 0 16 16">
                   <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v1H0V4zm0 3v5a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7H0zm3 2h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1a1 1 0 0 1 1-1z"/>
               </svg>
               <h4 class="h5 font-weight-bold pl-1">결제 내역</h4>
           </div>
           <ul class="home-list">
               <li>
	               <a href="${ctp}/myPayment.member">
						결제 내역
	               </a>
               </li>
               <li><a href="">잔여 포인트</a></li>
               <li><a href="">사용 가능 쿠폰</a></li>
           </ul>
       </div>
       <div class="d-flex flex-column flex-nowrap list_content">
           <div class="d-flex align-items-center">
               <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#595959" class="bi bi-file-person-fill" viewBox="0 0 16 16">
                   <path d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm-1 7a3 3 0 1 1-6 0 3 3 0 0 1 6 0zm-3 4c2.623 0 4.146.826 5 1.755V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1v-1.245C3.854 11.825 5.377 11 8 11z"/>
               </svg>
               <h4 class="h5 font-weight-bold pl-1">계정</h4>
           </div>
           <ul class="home-list">
               <li><a href="${ctp}/reviewModify.member">내 리뷰 관리</a></li>
               <li><a href="${ctp}/accountModify.member">정보 변경</a></li>
               <li><a href="">1:1 문의</a></li>
           </ul>
       </div>
</body>
</html>