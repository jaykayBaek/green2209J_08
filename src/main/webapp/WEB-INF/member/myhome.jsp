<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>title</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
	<script>
		$(function(){
			$.ajax({
	    		type   : "post",
	    		url    : "${ctp}/getWishCount.member",
	    		success:function(res) {
	    			console.log(res);
	    			$(".wishlist-cnt").html(res);
   				}
			});
			$.ajax({
	    		type   : "post",
	    		url    : "${ctp}/getMybookCount.member",
	    		success:function(res) {
	    			console.log(res);
	    			$(".mybook-cnt").html(res);
   				}
			});
		});
	</script>
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
        .home-list li{
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
        	margin-top: 1rem;
            border: 2px solid #495057;
            height: 50vh;
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
        .user_info_tab{
        	margin: 0px;
        	padding: 0px;
       	    width: 100%;
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
		                <div class="d-flex flex-column flex-wrap">
		                    <h2 class="h5 font-weight-bold">
		                    	${vo.nameUser} 님
		                    </h2>
		                    <div class="email text-secondary" style="font-size:0.5em">
		                    	${vo.email}
		                    </div>
		                </div>
						<button type="button" onclick="location.href='${ctp}/logout.member'" class="btn btn-success" class="text-decoration-none">
							<div class="font-weight-bold sign_text">
							  로그아웃
							</div>
						</button>
		            </div>
		            <div class="col-10 myinfo_content_right d-flex">
		                <div class="container d-flex align-items-center">
		                    <div class="user_info_tab ">
		                    	<div class="row text-center">
		                    		<div class="col">
		                                <i class="fas fa-coins"></i>
		                                <span class="h5 font-weight-bold">리딩 포인트</span>
		                                <p class="h2 amount_item">
		                                	<fmt:formatNumber type="number" maxFractionDigits="3" value="${vo.point}"/>
		                                	원
		                                </p>
		                                <p class="h6">
		                                    <a href="">
		                                        잔여 포인트
		                                        <i class="fas fa-hand-point-right"></i>
		                                    </a>
		                                </p>
		                    		</div>
		                    		<div class="col">
   				                    	<i class="fas fa-book"></i>
		                                <span class="h5 font-weight-bold">보유 도서</span>
		                                <p class="h2 amount_item">
		                                	<span class="mybook-cnt"></span>권
		                                </p>
		                                <p class="h6">
		                                    <a href="${ctp}/mylib.member">
		                                        내 서고로
		                                        <i class="fas fa-hand-point-right"></i>
		                                    </a>
		                                </p>
		                    		</div>
		                    		<div class="col">
                				    	<i class="fas fa-shopping-cart"></i>
		                                <span class="h5 font-weight-bold">장바구니</span>
		                                <p class="h2 amount_item">
		                                	<span class="wishlist-cnt"></span>건
		                                </p>
		                                <p class="h6">
		                                    <a href="${ctp}/wishlist.member">
		                                        장바구니로
		                                        <i class="fas fa-hand-point-right"></i>
		                                    </a>
		                                </p>
		                    		</div>
		                    	</div>
		                        <hr/>
		                        <div class="row text-center">
		                        	<div class="col">
		                            	<i class="fas fa-question-circle"></i>
		                                <span class="h5 font-weight-bold">내 문의</span>
		                        	</div>
		                        	<div class="col">
		                                <i class="fas fa-trophy"></i>
		                                <span class="h5 font-weight-bold">내 등급</span>
		                        	</div>
		                        	<div class="col">
		                                <i class="fas fa-heart"></i>
		                                <span class="h5 font-weight-bold">내 리뷰</span>
		                        	</div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
        </div>
    </div>		
</body>
</html>