<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
	<style>
        body,h1,h2,h3,h4,span,div,strong {
            font-family: 'Helvetica', 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
            text-decoration: none !important;
        }
        nav{
            background-color: #fff;
        }
        #search {
	        background-color: transparent;
	        border: 0px;
	        color: #000;
        }

        .bage-search {
        	background-color: #f0f0f0;
        }

        .input-group-text {
	        background-color: transparent;
	        border: 0px;
        }
        .mybook-badge{
            position: absolute;
            bottom:40%;
            padding: 1em;
            opacity: 0.9;
            width:100%;
        }
        .img-book{
            position: relative;
        }
        .mybook-badge_text{
            padding:0.2rem;
            border:1px solid #fff;
            border-radius: 0.2rem;
        }
        a:hover{
            text-decoration: none;
        }
	</style>
</head>
<body>
	<jsp:include page="/include/nav.jsp"/>
  <div class="container">
    <div class="row d-flex flex-column justify-content-around flex-wrap">
        <span class="h4 font-weight-bold">
	        시리즈 도서
        </span>
    </div>
    <div class="row d-flex flex-column">
      <div class="d-flex justify-content-around">
	      <div class="row flex-column mt-3">
	        <div class="title-info">
	        </div>
	        <div class="book-info-series d-flex flex-row">
	        <c:forEach var="vo" items="${vos}">
	          <div class="img-book m-1 p-1" style="width:150px">
	            <a href="${ctp}/showBookContent.member?isbn=${vo.isbnBook}">
	              <div class="img-wrap-series">
	                <img src="${ctp}/data/books/${vo.imgSaved}" alt="${vo.titleBook}의 표지"
	                  class="img-thumbnail">
	              </div>
	            </a>
	            <div>${vo.titleBook}</div>
	            <span class="badge badge-danger mybook-badge">보러가기</span>
	          </div>
	        </c:forEach>
	        </div>
	      </div>
	
	    </div>
	  </div>
	</div>
	
	</div>
  	<jsp:include page="/include/footer.jsp"/>
</body>
</html>