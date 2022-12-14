<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<style>
    body, h1, h2, a {
      text-decoration: none !important;
    }

    .ad-1 {
      background: linear-gradient(to right, #ce0d0d 50%, #0ca90c 50%);
      height: 100vh;
    }

    .ad-2 {
      background-color: #ffd100;
    }

    .ad-3 {
      background-color: #001d3d;
      color: #c1121f;
    }

    .carousel-item {
      height: 25vh;
    }

    .btn:active,
    .btn:focus {
      outline: none !important;
      box-shadow: none !important;
    }

    .carousel-indicators {
      position: static !important;
      margin: 0px !important;
    }

    .carousel-indicators>.badge {
      border: 2px solid #000;
      color: #000;
    }

    .carousel-indicators>.active {
      border: 2px solid #80b918;
      color: #80b918;
    }

    .font-gradient {
      background: linear-gradient(to right top, #ff3c38, #e89005);
      color: transparent;
      -webkit-background-clip: text;
    }

    .slide-badges {
      background-color: #000;
    }
</style>
<div class="container">
   <div id="carouselMain" class="carousel slide p-0" data-ride="carousel">
     <div class="carousel-inner">
       <div class="carousel-item ad-1 active" data-interval="5000">
         <a href="#">
           <div class="container d-flex justify-content-center align-items-center" style="height: 100%;">
             <div>
               <span class="badge badge-pill badge-warning">
                 최대 30% 할인
               </span>
               <h2 class="text-white">
                 <span class="h1 font-weight-bold">올해 연말, 리딩북스에서는<br /> 매일매일이 연말행사🎄</span>
               </h2>
               <strong>리딩북스의 특별한 연말 선물을 지금 확인하세요</strong>
             </div>
             <picture>
               <a href="https://www.animatedimages.org/cat-presents-and-gifts-505.htm"><img
                   src="https://www.animatedimages.org/data/media/505/animated-present-and-gift-image-0048.gif"
                   border="0" alt="animated-present-and-gift-image-0048" /></a>
             </picture>
           </div>
         </a>
       </div>
       <div class="carousel-item ad-2" data-interval="5000">
         <a href="#">
           <div class="container d-flex justify-content-center align-items-center" style="height: 100%;">
             <div>
               <span class="badge badge-pill badge-info">
                 신규 도서
               </span>
               <h2 class="text-white h1">
                 <span class="h1 font-weight-bold">따끈따끈한 신작</span><br />
                 <span class="font-gradient h1 font-weight-bold">리딩에 다모였다!</span>
               </h2>
               <strong>이번 달의 신작을 리딩북스에서 확인하세요</strong>
             </div>
             <picture>
               <img src="images/idea.gif" alt="깜빡이는 전구" height="100vh">
             </picture>
           </div>
         </a>
       </div>
       <div class="carousel-item ad-3" data-interval="5000">
         <a href="#">
           <div class="container d-flex justify-content-center align-items-center" style="height: 100%;">
             <div class="mr-5">
               <span class="badge badge-pill badge-success">
                 첫 구매 10% 할인!
               </span>
               <h2 class="text-white h1">
                 <span class="h1 font-weight-bold">책 읽기가 처음인</span><br />
                 <span class="h1 font-weight-bold">당신에게 추천합니다</span>
               </h2>
               <strong>지금 핫한 베스트셀러 확인하기</strong>
             </div>
             <picture>
               <img src="images/emoji-1556.gif" alt="놀란 표정" style="height:20vh">
             </picture>
           </div>
         </a>
       </div>
     </div>
     <div class=" slide-bottom d-flex align-items-center justify-content-center flex-wrap mt-1">
       <div class="badge badge-pill slide-badges mr-2">
         <span class="badge badge-pill">
           <a class="btn" href="#carouselMain" data-slide="prev">
             <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white"
               class="bi bi-arrow-left-circle-fill" viewBox="0 0 16 16">
               <path
                 d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zm3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z" />
             </svg>
           </a>
           <a class="btn" href="#carouselMain" data-slide="pause">
             <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-pause-fill"
               viewBox="0 0 16 16">
               <path
                 d="M5.5 3.5A1.5 1.5 0 0 1 7 5v6a1.5 1.5 0 0 1-3 0V5a1.5 1.5 0 0 1 1.5-1.5zm5 0A1.5 1.5 0 0 1 12 5v6a1.5 1.5 0 0 1-3 0V5a1.5 1.5 0 0 1 1.5-1.5z" />
             </svg>
           </a>
           <a class="btn" href="#carouselMain" data-slide="cycle">
             <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-play-fill"
               viewBox="0 0 16 16">
               <path
                 d="m11.596 8.697-6.363 3.692c-.54.313-1.233-.066-1.233-.697V4.308c0-.63.692-1.01 1.233-.696l6.363 3.692a.802.802 0 0 1 0 1.393z" />
             </svg>
           </a>
           <a class="btn" href="#carouselMain" data-slide="next">
             <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white"
               class="bi bi-arrow-right-circle-fill" viewBox="0 0 16 16">
               <path
                 d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z" />
             </svg>
           </a>
         </span>
       </div>
       <div class="carousel-indicators">
         <div class="badge badge-pill active" data-target="#carouselMain" data-slide-to="0">
           <span class="font-weight-bold h6">크리스마스 행사🎄</span>
         </div>
         <div class="badge badge-pill" data-target="#carouselMain" data-slide-to="1">
           <span class="font-weight-bold h6">신간 도서 바로가기📚</span>
         </div>
         <div class="badge badge-pill" data-target="#carouselMain" data-slide-to="2">
           <span class="font-weight-bold h6">베스트셀러 바로가기</span>
         </div>
       </div>
     </div>
   </div>
 </div>