<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>리딩북스</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="include/bs4.jsp"/>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-applesdgothicneo@1.0.3/css/all.min.css">
	<style>
	    body, h1, h2, span, div, strong  {
			font-family: 'Helvetica', 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
		 		    text-decoration: none !important;
	 		        font-size: 1em;
 		}
  		a:hover, a:active{
  			text-decoration: none;
  			color:inherit;
  		}
	</style>
</head>

<body>
	<jsp:include page="include/nav.jsp"/>
	<jsp:include page="include/nav_article.jsp"/>
	<jsp:include page="include/slide.jsp"/>
	<jsp:include page="include/article.jsp"/>
	<jsp:include page="include/footer.jsp"/>
</body>

</html>