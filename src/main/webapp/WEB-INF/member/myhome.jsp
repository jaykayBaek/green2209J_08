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
	<style>
    	body, h1, h2, h3, h4 span, div, strong  {
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
        li{
            color:#6c757d;
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
                .myinfo{
            border: 2px solid #495057;
        }
        ul, li{
            list-style: none;
            margin: 0px;
            padding:0px;
        }
        a:hover{
            text-decoration: none !important;
            color:#55a630;
            /* color:#80B918; */
            transition: color 0.2s;
        }
        .amount_item{
            color:#80B918;
        }
        .myinfo_content_left{
        	width:100%;
            background-color: #ffff3f;
        }
    </style>
</head>
<body>
	<jsp:include page="../../include/nav.jsp"/>
    <div class="container">
        <div class="row">
            <nav class="col-2">
           		<jsp:include page="homeNav.jsp"/>
            </nav>
            <div class="col-10">
		        <div class="row myinfo d-flex flex-row flex-nowrap">
		            <div class="col-2 myinfo_content_left d-flex flex-column justify-content-around">
		                <div class="d-flex flex-column flex-wrap" style="width:100%">
		                    <h2 class="font-weight-bold">백정광 님</h2>
		                    <div class="email" style="width:100%;">
		                    	jaykaybaek
		                    </div>
		                </div>
		                <div>
		                    <button class="btn btn-success">로그아웃</button>
		                </div>
		            </div>
		            <div class="col-10 myinfo_content_right">
		                <div class="container">
		                    <div class="d-flex flex-column">
		                        <ul class="d-flex justify-content-around align-content-center mt-2">
		                            <li class="h1 d-flex flex-column align-items-center">
		                                <i class="fas fa-coins"></i>
		                                <span class="h5 font-weight-bold">리딩 포인트</span>
		                                <p class="h2 amount_item">0원</p>
		                                <p class="h6">
		                                    <a href="">
		                                        잔여 포인트
		                                        <i class="fas fa-hand-point-right"></i>
		                                    </a>
		                                </p>
		                            </li>
		                            <li class="h1 d-flex flex-column align-items-center">
		                                <i class="fas fa-book"></i>
		                                <span class="h5 font-weight-bold">내 서고</span>
		                                <p class="h2 amount_item">255권</p>
		                                <p class="h6">
		                                    <a href="">
		                                        내 서고로
		                                        <i class="fas fa-hand-point-right"></i>
		                                    </a>
		                                </p>
		                            </li>
		                            <li class="h1 d-flex flex-column align-items-center">
		                                <i class="fas fa-shopping-cart"></i>
		                                <span class="h5 font-weight-bold">장바구니</span>
		                                <p class="h2 amount_item">7건</p>
		                                <p class="h6">
		                                    <a href="${ctp}/wishlist.member">
		                                        장바구니로
		                                        <i class="fas fa-hand-point-right"></i>
		                                    </a>
		                                </p>
		                            </li>
		                        </ul>
		                        <hr/>
		                        <ul class="d-flex justify-content-around align-content-center mt-2">
		                            <li class="h1 d-flex flex-column align-items-center">
		                                <i class="fas fa-question-circle"></i>
		                                <span class="h5 font-weight-bold">내 문의</span>
		                            </li>
		                            <li class="h1 d-flex flex-column align-items-center">
		                                <i class="fas fa-trophy"></i>
		                                <span class="h5 font-weight-bold">내 등급</span>
		                            </li>
		                            <li class="h1 d-flex flex-column align-items-center">
		                                <i class="fas fa-heart"></i>
		                                <span class="h5 font-weight-bold">내 리뷰</span>
		                            </li>
		                        </ul>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
        </div>
    </div>		
</body>
</html>