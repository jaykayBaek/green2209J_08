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
        <div class="row d-flex flex-column justify-content-around flex-wrap">
		   	<span class="h4 font-weight-bold">
		        내가 구매한 도서
	        </span>
        
	        <c:forEach var="vo" items="${vos}">
	        	<c:if test="${vos == '[]'}">
	        		<div>구입한 도서가 없습니다</div>
	        	</c:if>
	            <div class="col">
	                <div class="book_wrap mt-3" style="width:40%; height: 35vh;">
	                    <a href="${ctp}/mylibDetail.member?isbn=${vo.isbnSeries}&idx=${vo.idxSeries}">
	                        <div class="d-flex flex-column align-items-center book_thumbnail" style="width:100%; height:100%">
	                            <div class="badge badge-dark bage_thumbnail mb-1 mt-1">
	                                <span class="bage_thumbnail_text">총 보유 권수 ${vo.bookCntInSeries}권</span>
	                            </div>
	                            <img src="${ctp}/data/books/${vo.imgSavedSeires}" alt="시리즈 ${vo.titleSeries}의 표지" height="80%" />
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