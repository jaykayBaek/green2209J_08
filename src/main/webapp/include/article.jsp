<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
<script>
 	$(function(){
		$.ajax({
    		type   : "post",
    		url    : "${ctp}/getHotBooks.view",
    		success:function(data) {
    			let dataParsed = JSON.parse(data);
	    		let hotBooks="";
    			for(let i in dataParsed.hotBooksView){
   					let bookIdx = dataParsed.hotBooksView[i].bookIdx;
   					let productIdx = dataParsed.hotBooksView[i].productIdx;
   					let title = dataParsed.hotBooksView[i].title;
   					let publisher = dataParsed.hotBooksView[i].publisher;
   					let isbn = dataParsed.hotBooksView[i].isbn;
   					let imgSaved = dataParsed.hotBooksView[i].imgSaved;
   					hotBooks += '<div class="swiper-slide d-flex flex-column text-left"><a href="${ctp}/booksearch.bi?isbn='+isbn+'"><div><img src="${ctp}/data/books/'+imgSaved+'"alt="'+title+'의 표지" style="width:250px"></div><div><span>'+title+'</span></div></a></div>';
    			}
				$('.swiper-hotbook').html(hotBooks);
    		}
		});
		$.ajax({
	   		type   : "post",
	   		url    : "${ctp}/getNewBooks.view",
	   		success:function(data) {
    			let dataParsed = JSON.parse(data);
	    		let newBooks="";
    			for(let i in dataParsed.newBooksView){
   					let bookIdx = dataParsed.newBooksView[i].bookIdx;
   					let productIdx = dataParsed.newBooksView[i].productIdx;
   					let title = dataParsed.newBooksView[i].title;
   					let publisher = dataParsed.newBooksView[i].publisher;
   					let isbn = dataParsed.newBooksView[i].isbn;
   					let imgSaved = dataParsed.newBooksView[i].imgSaved;
   					newBooks += '<div class="swiper-slide d-flex flex-column text-left"><a href="${ctp}/booksearch.bi?isbn='+isbn+'"><div><img src="${ctp}/data/books/'+imgSaved+'"alt="'+title+'의 표지" style="width:250px"></div><div><span>'+title+'</span></div></a></div>';
    			}
	    			
   				$('.swiper-newbook').append(newBooks);
	   		},
	   		error:function(){
	   			console.log('errorNewbooks');
	   		}
		});
	});
</script>
<style>
	body{
		background:#fff;
	}
	.input-group-text {
		background-color: transparent;
		border: 0px;
	}
	section {
		text-decoration: none !important;
	}
	.swiper-wrapper{
    	height: 60%;
	}
    .swiper-slide {
		text-align: center;
		background: #fff;
		/* Center slide text vertically */
		display: -webkit-box;
		display: -ms-flexbox;
		display: -webkit-flex;
		display: flex;
		-webkit-box-pack: center;
		-ms-flex-pack: center;
		-webkit-justify-content: center;
		justify-content: center;
		-webkit-box-align: center;
		-ms-flex-align: center;
		-webkit-align-items: center;
		align-items: center;
	}
	.swiper-slide img {
		display: block;
		width: 100%;
		height: 100%;
		object-fit: cover;
	}
	
	.swiper-button-next::after,
	.swiper-button-prev::after {
		display: none;
	}
	.swiper-button{
		color:#fff;
		width: 36px;
		height: 36px;
		background-color: #000;
		border-radius: 50%;
	}
</style>
</head>

  <section>
    <article class="hotbooks">
		<div class="container-fluid">
		  <h2 class="h3 font-weight-bold">지금 핫한 도서 🔥</h2>
		  <div class="swiper hotSwiper">
		  
		      <div class="swiper-wrapper swiper-hotbook">
		      	<span class="hotbook_res"></span>
		      </div>
		      
		    <div class="swiper-button-next swiper-button shadow-lg">
		      <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-arrow-right-circle-fill" viewBox="0 0 16 16">
		        <path d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
		      </svg>
		    </div>
		    <div class="swiper-button-prev swiper-button shadow-lg">
		      <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-arrow-left-circle-fill" viewBox="0 0 16 16">
		        <path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zm3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
		      </svg>
		    </div>
		</div>
	</div>
    <script>
      var swiper = new Swiper(".hotSwiper", {
        slidesPerView: 5.5,
        spaceBetween: 15,
        slidesPerGroup: 6,
        loop: true,
        loopFillGroupWithBlank: true,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
        observer: true,
        observeParents: true,	
      });
    </script>
    </article>
    
    <article class="newbooks">
		<div class="container-fluid">
		  <h2 class="h3 font-weight-bold">뜨끈뜨끈한 신작 🐱‍🏍‍</h2>
		  <div class="swiper newSwiper">
		  
		      <div class="swiper-wrapper swiper-newbook">
		      	<span class="newbooks_res"></span>
		      </div>
		      
		    <div class="swiper-button-next swiper-button shadow-lg">
		      <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-arrow-right-circle-fill" viewBox="0 0 16 16">
		        <path d="M8 0a8 8 0 1 1 0 16A8 8 0 0 1 8 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
		      </svg>
		    </div>
		    <div class="swiper-button-prev swiper-button shadow-lg">
		      <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-arrow-left-circle-fill" viewBox="0 0 16 16">
		        <path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zm3.5 7.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
		      </svg>
		    </div>
		</div>
	</div>
    <script>
      var swiper = new Swiper(".newSwiper", {
        slidesPerView: 5.5,
        spaceBetween: 15,
        slidesPerGroup: 6,
        loop: true,
        loopFillGroupWithBlank: true,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
        observer: true,
        observeParents: true,	
      });
    </script>
    </article>
