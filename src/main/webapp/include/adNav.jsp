<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="bs4.jsp"></jsp:include>
<style>
    body,h1,h2,h3,h4,h5,h6,span,div,strong {
        font-family: 'Helvetica', 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
        text-decoration: none !important;
    }
    ul, li{
        list-style: none;
        padding:0px;
    }
    a:hover{
        text-decoration: none;
        color:#afafaf;
        transition: color, 0.3s;
    }
    ul{
        color: #fff;
    }
    li{
        padding: 0.5em;
    }
    .admin_nav{
        height: 100%;
        background-color: #007f5f;
    }
    .btn-primary {
        border: 0px;
        background-color: #80b918;
        color: #fff;
        font-weight: bold;
    }
    .btn-primary:hover,
    .btn-primary:active {
        border: 0px;
        background-color: #2b9348;
        color: #fff;
    }
    .badge{
        position: absolute;
        transform: scale(0.8) translate(70%, -10%);
        transform-origin: top right;
        padding: 0.25em 0.4em;
        font-size: 75%;
        font-weight: 700;
        white-space: nowrap;
        border-radius: 0.35rem;
    }
    .nav_title{
        font-weight: 500;
        font-size: 1em;
        border-bottom: 1px solid #fff;
    }
    .nav_main_title{
        font-size: 2em;
        font-weight: bold;
        border-bottom: 1px solid #fff;
    }
    .nav_cont{
        color:#000;
        margin-left:1em;
    }
    .nav_setting{
        color:#000;
    }
    .amount-text{
        color: #495057 !important;
        font-weight: 500 !important;
    }
    .border-weight{
        border-left: 0.5rem solid transparent;
    }
</style>
<nav class="col-2 admin_nav">
    <ul class="d-flex flex-column flex-wrap align-content-start justify-content-lg-around">
        <li class="nav_title nav_main_title">관리자 메뉴</li>
        <li class="nav_title">회원관리</li>
        <li class="nav_title">내정보관리</li>
        <li class="nav_title">리뷰관리</li>
        <li class="nav_title d-flex flex-column align-content-center">
            <div class="font-weight-bold">고객관리</div>
            <a href="#collapse_sales" data-toggle="collapse" aria-expanded="false"
                aria-controls="collapse_sales">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="rgba(255,255,255,.3)"
                    class="bi bi-clipboard2-data-fill" viewBox="0 0 16 16">
                    <path
                        d="M10 .5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5.5.5 0 0 1-.5.5.5.5 0 0 0-.5.5V2a.5.5 0 0 0 .5.5h5A.5.5 0 0 0 11 2v-.5a.5.5 0 0 0-.5-.5.5.5 0 0 1-.5-.5Z" />
                    <path
                        d="M4.085 1H3.5A1.5 1.5 0 0 0 2 2.5v12A1.5 1.5 0 0 0 3.5 16h9a1.5 1.5 0 0 0 1.5-1.5v-12A1.5 1.5 0 0 0 12.5 1h-.585c.055.156.085.325.085.5V2a1.5 1.5 0 0 1-1.5 1.5h-5A1.5 1.5 0 0 1 4 2v-.5c0-.175.03-.344.085-.5ZM10 7a1 1 0 1 1 2 0v5a1 1 0 1 1-2 0V7Zm-6 4a1 1 0 1 1 2 0v1a1 1 0 1 1-2 0v-1Zm4-3a1 1 0 0 1 1 1v3a1 1 0 1 1-2 0V9a1 1 0 0 1 1-1Z" />
                </svg>
                통계관리
            </a>
            <div class="collapse_sales_wrap bg-white rounded">
                <ul class="collapse collapse_sales" id="collapse_sales">
                    <li class="nav_cont">매출분석</li>
                    <li class="nav_cont">상품분석</li>
                    <li class="nav_cont">인기도서</li>
                </ul>
            </div>
        </li>
        <li class="nav_title">문의관리</li>
        <li class="nav_title">
            <div class="font-weight-bold">상품관리</div>
            <a href="#collapse_book" data-toggle="collapse" aria-expanded="false" aria-controls="collapse_book">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="rgba(255,255,255,.3)"
                    class="bi bi-book-fill" viewBox="0 0 16 16">
                    <path
                        d="M8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z" />
                </svg>
                도서관리
            </a>
            <div class="collapse_sales_wrap bg-white rounded">
                <ul class="collapse collapse_book" id="collapse_book">
                    <li class="nav_cont">
                    	<a href="${ctp}/adRegisterAuthor.ad">작가등록</a>
                    </li>
                    <li class="nav_cont">
                    	<a href="${ctp}/adRegisterBook.ad">도서등록</a>
                    </li>
                    <li class="nav_cont">
                    	<a href="${ctp}/adRegisterProduct.ad">상품등록</a>
                    </li>
                    <li class="nav_cont">
                    	<a href="${ctp}/adRegisterSeries.ad">시리즈 등록</a>
                    </li>
                    <li class="nav_cont">도서수정/삭제</li>
                    <li class="nav_cont">상품수정/삭제</li>
                    <li class="nav_cont">작가수정/삭제</li>
                </ul>
            </div>
        </li>
    </ul>
</nav>