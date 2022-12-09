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
    let val = "${val}";
    
    /* --- 회원가입 메시지 --- */
    if(msg == "memJoinNo") msg = "회원가입에 실패했습니다. 양식을 다시 확인해주세요.";
    else if(msg == "memEmailNo") msg = "이미 회원가입된 이메일이거나, 사용할 수 없는 이메일입니다. 다시 확인해주세요.";
    else if(msg == "memDateNo") msg = "회원 탈퇴 이후 30일 동안은 다시 회원가입할 수 없습니다.";
    
    alert(msg);
    if(url != "") location.href = url;
    
  </script>
</head>
<body>
	<div class = "container">
		
	</div>
</body>
</html>