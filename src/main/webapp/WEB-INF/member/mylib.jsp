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
        .bage_thumbnail{
            position: absolute;
            bottom:40%;
            padding: 1em;
            opacity: 0.9;
        }
        .book_thumbnail{
            position: relative;
        }
        .bage_thumbnail_text{
            padding:0.2rem;
            border:1px solid #fff;
            border-radius: 0.2rem;
        }
        .book_wrap{
        }
        a:hover{
            text-decoration: none;
        }
	</style>
</head>
<body>
	<jsp:include page="/include/nav.jsp"/>
	<div class = "container mylib-wrap">
	   	<span class="h4 font-weight-bold">
	        내가 구매한 도서
        </span>
        <div class="row d-flex justify-content-around flex-wrap">
        	<c:if test="${vos == '[]'}">
        		<div class="row">
	        		<div class="display-4" style="margin:0 auto; height:50vh">
		        		구입한 도서가 없습니다
	        		</div>
        		</div>
        	</c:if>
	        <c:forEach var="vo" items="${vos}">
	            <div class="col d-flex flex-row">
	                <div class="book_wrap mt-3">
	                    <a href="${ctp}/showBookContent.member?isbn=${vo.isbnBook}">
	                        <div class="d-flex flex-column align-items-center book_thumbnail" style="width:150px">
	                            <img src="${ctp}/data/books/${vo.imgSaved}" alt="시리즈 ${vo.titleBook}의 표지" style="width:150px"/>
	                        </div>
	                    </a>
	                </div>
	            </div>
	        </c:forEach>
        </div>
	</div>
  	<jsp:include page="/include/footer.jsp"/>
</body>
</html>