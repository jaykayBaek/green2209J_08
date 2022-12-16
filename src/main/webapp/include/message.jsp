<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>message.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
    'use strict';
    let msg = "${msg}";
    let url = "${url}";
	    
    /* --- 회원가입 메시지 --- */
    if(msg == "failJoin") msg = "회원가입에 실패했습니다. 양식을 다시 확인해주세요.";
    else if(msg == "failSameEmail") msg = "이미 회원가입 중인 이메일입니다. 이메일을 다시 확인해주세요.";
    else if(msg == "failPassPenaltyDate") msg = "회원 탈퇴 이후 30일 동안은 다시 회원가입할 수 없습니다.";
    else if(msg == "successJoin") msg = "회원 가입 되었습니다.";
    
    /* --- 로그인 메시지 ---*/
    else if(msg == "failLogin") msg = "이메일이 잘못 되었거나, 비밀번호가 틀렸습니다.";
    else if(msg == "successLogin") msg = "로그인되었습니다.";
    else if(msg == "successLogout") msg = "로그아웃되었습니다.";
    
    /*--- 이메일, 비밀번호 찾기 ---*/
    else if(msg == "failFindEmail") msg = "이메일을 찾을 수 없습니다. 입력하신 정보를 다시 확인해주세요.";
    
    /*--- 어드민 ---*/
    else if(msg == "failEnrollBook") msg = "도서를 등록하지 못했습니다. 서버의 상태나, 양식을 다시 확인해주세요.";
    else if(msg == "successEnrollBook") msg = "도서 등록을 성공했습니다. 판매를 원한다면 상품등록을 해주세요.";
    else if(msg == "failEnrollProduct") msg = "상품 등록하지 못했습니다. 서버의 상태나, 양식을 다시 확인해주세요.";
    else if(msg == "successEnrollProduct") msg = "상품 등록을 성공했습니다.";
    else if(msg == "successEnrollSeries") msg = "시리즈 등록을 성공했습니다.";
    else if(msg == "failEnrollSeries") msg = "시리즈 등록에 실패했습니다. 서버의 상태나, 양식을 다시 확인해주세요.";
    
    /*--- 장바구니 ---*/
    else if(msg == "failAddWishlist") msg = "서버 상태가 좋지 못해 장바구니에 담는 것을 실패했습니다.";
    else if(msg == "successAddWishlist") msg = "해당 상품을 장바구니에 담았습니다.";
    else if(msg == "successDeleteWishlist") msg = "해당 상품을 장바구니에서 지웠습니다.";
    else if(msg == "failDeleteWishlist") msg = "서버 상태가 좋지 못해 장바구니에 지우는 것을 실패했습니다.";
    
    alert(msg);
    if(url != "") location.href = url;
    
  </script>
</head>
<body>
</body>
</html>