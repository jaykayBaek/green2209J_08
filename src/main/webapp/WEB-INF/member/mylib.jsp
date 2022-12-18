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
        .mylib-wrap{
            background-color: #e0e0e0;
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
        footer{
            height: 25vh;
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
	<div class = "container-fluid mylib-wrap">
	
        <div class="row d-flex justify-content-around">
            <div class="col">
                <div class="book_wrap mt-3" style="width:20%; height: 25vh;">
                    <a href="#">
                        <div class="d-flex flex-column align-items-center book_thumbnail" style="width:100%; height:100%">
                            <div class="badge badge-dark bage_thumbnail mb-1 mt-1">
                                <span class="bage_thumbnail_text">총 보유 권수 2권</span>
                            </div>
                            <img src="../images/dummy.jpg" alt="책 표지" height="80%" />
                        </div>
                    </a>
                </div>
            </div>
        </div>
	</div>
  	<jsp:include page="/include/footer.jsp"/>
</body>
</html>