<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<c:set var="ctp" value="${pageContext.request.contextPath}" />
		<!DOCTYPE html>
		<html lang="ko">

		<head>
			<title>리딩북스</title>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<jsp:include page="include/bs4.jsp" />
			<link rel="preconnect" href="https://fonts.googleapis.com">
			<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  			<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Roboto&display=swap" rel="stylesheet">
			<style>
			    body {
     		 		font-family: 'Roboto', 'Noto Sans KR', serif;
  		 		    text-decoration: none !important;
    			}
    			a:hover, a:active{
    				text-decoration: none;
    				color:inherit;
    			}
			</style>
		</head>

		<body>
			<jsp:include page="include/nav.jsp" />
			<jsp:include page="include/slide.jsp" />
			<jsp:include page="include/article.jsp" />
			<jsp:include page="include/footer.jsp" />
		</body>

		</html>