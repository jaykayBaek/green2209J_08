<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<script>

</script>
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

    @media (max-width: 991px) {
      ul {
        margin-top: 1em;
        color: #fff;
        border-radius: 1em;
        background-color: #80B918;
      }
    }
    
</style>
<header>

  <div class="container d-flex justify-content-end align-items-center">
  <div class="toast" role="alert" aria-live="assertive" aria-atomic="true">
  	<div class="toast-header">
	    <img src="..." class="rounded mr-2" alt="...">
	    <strong class="mr-auto">Bootstrap</strong>
	    <small>11 mins ago</small>
	    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
	      <span aria-hidden="true">&times;</span>
	    </button>
	  </div>
	  <div class="toast-body">
	    Hello, world! This is a toast message.
	  </div>
	</div>
    <a href="${ctp}/login.member" class="text-decoration-none">
      <div class="mr-2 mt-2 font-weight-bold sign_text">
        로그인
      </div>
    </a>
    <a href="${ctp}/signBefore.member" class="text-decoration-none">
      <div class="mt-2 font-weight-bold sign_text">
        회원가입
      </div>
    </a>
  </div>
</header>

<nav class="navbar navbar-expand-lg sticky-top shadow-sm">
  <div class="container justify-content-center">
    <!-- 로고 -->
    <div class="nav-brand mr-auto p-2">
      <a class="navbar-brand" href="#">
        <img src="images/READING.png" alt="리딩" style="height:1.5em;">
        <img src="images/BOOKS.png" alt="북스" style="height:1.5em;">
      </a>
    </div>
    <!-- 인풋 --> 
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
          placeholder="도서를 검색해보세요" />
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
      <li class="nav-item">
        <a class="nav-link" href="#">
          <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-cart"
            viewBox="0 0 16 16">
            <path
              d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
          </svg>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">
          <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-person"
            viewBox="0 0 16 16">
            <path
              d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z" />
          </svg>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">
          <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-journals"
            viewBox="0 0 16 16">
            <path
              d="M5 0h8a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2 2 2 0 0 1-2 2H3a2 2 0 0 1-2-2h1a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1H1a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v9a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H5a1 1 0 0 0-1 1H3a2 2 0 0 1 2-2z" />
            <path
              d="M1 6v-.5a.5.5 0 0 1 1 0V6h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V9h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 2.5v.5H.5a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1H2v-.5a.5.5 0 0 0-1 0z" />
          </svg>
        </a>
      </li>
    </ul>
  </div>
</nav>