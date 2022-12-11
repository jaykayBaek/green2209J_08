<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%
  int grade = session.getAttribute("sGrade")==null? 99 : (int) session.getAttribute("sGrade");
  pageContext.setAttribute("grade", grade);
%>
<style>
    nav {
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

    .navbar-collapse {
      flex-grow: 0 !important;
    }
    
    .sign_text:hover{
	  color: #80B918;
	  transition: color 0.3s;
    }
    .nav-item:hover{
	  color: #80B918;
	  transition: color 0.3s;
    }
	.form-inline{
		margin:0px;
	}
    @media (max-width: 991px) {
      #navbarNav {
        margin-top: 1em;
        color: #fff;
        border-radius: 1em;
        background-color: #80B918;
      }
    }
    
</style>
<header>
	 <div class="container d-flex justify-content-end align-items-center">
	 <c:if test="${grade == 99}">
		<a href="${ctp}/loginBefore.member" class="text-decoration-none">
			<div class="mr-2 mt-2 font-weight-bold sign_text">
			  로그인
			</div>
		</a>
		<a href="${ctp}/signBefore.member" class="text-decoration-none">
			<div class="mr-2 mt-2 font-weight-bold sign_text">
			  회원가입
			</div>
		</a>
	 </c:if>
 	 <c:if test="${grade == 0}">
		<a href="${ctp}/adMain.ad" class="text-decoration-none">
			<div class="mt-2 font-weight-bold sign_text">
			  관리자모드
			</div>
		</a>
	 </c:if>
 	 <c:if test="${grade <= 1 || grade<5}">
		<div class="mt-2 sign_text">
		  안녕하세요, ${fn:substring(sEmail,0,fn:indexOf(sEmail,"@"))}님?
		</div>
	 </c:if>
	</div>
</header>

<nav class="navbar navbar-expand-lg sticky-top shadow-sm">
  <div class="container justify-content-center">
    <!-- 로고 -->
    <div class="nav-brand mr-auto p-2">
      <a class="navbar-brand" href="${ctp}/index.jsp">
        <img src="images/READING.png" alt="리딩" style="height:1.5em;">
        <img src="images/BOOKS.png" alt="북스" style="height:1.5em;">
      </a>
    </div>
    <!-- 인풋 --> 
	<div class="d-flex flex-row justify-content-center align-items-center">
	    <form class="form-inline myform ml-10">
	      <div class=" input-group badge-pill bage-search">
	        <span class="input-group-text">
	          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search"
	            viewBox="0 0 16 16"> 
	            <path
	              d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
	          </svg>
	        </span>
	        <input type="text" id="search" class="form-control" onkeypress="if( event.keyCode == 13 ){myform.submit();}"
	          placeholder="원하는 도서를 검색해보세요" />
	      </div>
	    </form>
	    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
	      aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon">
	        <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-hdd-stack"
	          viewBox="0 0 16 16">
	          <path
	            d="M14 10a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1v-1a1 1 0 0 1 1-1h12zM2 9a2 2 0 0 0-2 2v1a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-1a2 2 0 0 0-2-2H2z" />
	          <path
	            d="M5 11.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm-2 0a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM14 3a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h12zM2 2a2 2 0 0 0-2 2v1a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2z" />
	          <path d="M5 4.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm-2 0a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z" />
	        </svg>
	      </span>
	    </button>
	    <ul class="navbar-nav collapse navbar-collapse" id="navbarNav">
	    <!-- 장바구니 -->
	      <li class="nav-item">
	        <a class="nav-link" href="${ctp}/wishlist.member">
	          <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-cart"
	            viewBox="0 0 16 16">
	            <path
	              d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
	          </svg>
	        </a>
	      </li>
	      <!-- 마이홈 -->
	      <li class="nav-item">
	        <a class="nav-link" href="${ctp}/myhome.member">
	          <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-person"
	            viewBox="0 0 16 16">
	            <path
	              d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z" />
	          </svg>
	        </a>
	      </li>
	      <!-- 책보기 -->
	      <li class="nav-item">
	        <a class="nav-link" href="#">
				<svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-book" viewBox="0 0 16 16">
				  <path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811V2.828zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z"/>
				</svg>
	        </a>
	      </li>
	    </ul>
   	</div>
  </div>
</nav>