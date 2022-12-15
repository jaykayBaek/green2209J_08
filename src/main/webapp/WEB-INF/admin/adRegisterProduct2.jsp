<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
	<script>
		$(function(){
			$(".search_isbn").hide();
			$(".search_idx").hide();
			$("#input_serach_isbn").blur(function(){
				let isbn = $("#input_serach_isbn").val();
				if(isbn.trim()==""){
					return;
				}
				$.ajax({
		    		type   : "post",
		    		url    : "${ctp}/getBookInfoByIsbn.ad",
		    		data : {isbn:isbn},
		    		
		    		success:function(data) {
			    			let dataParsed = JSON.parse(data);
			    			if(dataParsed.book.length==0){
			    				return;
			    			}
	    					let idx = dataParsed.book.idx;
	    					let isbn = dataParsed.book.isbn;
	    					let title = dataParsed.book.title;
	    					let publisher = dataParsed.book.publisher;
	    					let datePublishing = dataParsed.book.datePublishing;
	    					let imgSaved = dataParsed.book.imgSaved;
	    					
	    					let htmlInputedGetData = '<div class="row border-bottom border-success author_idx"><div class="col">'+idx+'</div><div class="col">'+isbn+'</div><div class="col">'+title+'</div><div class="col">'+publisher+'</div><div class="col">'+datePublishing+'</div></div><div class="row text-center" style="width:200px"><img src="${ctp}/data/books/'+imgSaved+'" class="img-fluid img-thumbnail" alt="도서표지"></div>';
		     				$('.search_isbn').show(200);
		     				$('.book_search_res').html('<div class="row border-bottom border-success"><div class="col">고유번호</div><div class="col">ISBN</div><div class="col">도서제목</div><div class="col">출판사</div><div class="col">출간일</div></div>'+htmlInputedGetData);
		    		},
                    error : function() {
                       alert("전송 오류!");
		    		}
				});
			});
			
			$("#input_idx_book").blur(function(){
				let idxBook = $("#input_idx_book").val();
				
				if(idxBook.trim()==""){
					return;
				}
				$.ajax({
		    		type   : "post",
		    		url    : "${ctp}/getBookInfoByIdx.ad",
		    		data : {idxBook:idxBook},
		    		
		    		success:function(data) {
			    			let dataParsed = JSON.parse(data);
			    			
			    			if(dataParsed.book.length==0){
			    				return;
			    			}
	    					let idx = dataParsed.book.idx;
	    					let isbn = dataParsed.book.isbn;
	    					let title = dataParsed.book.title;
	    					let publisher = dataParsed.book.publisher;
	    					let datePublishing = dataParsed.book.datePublishing;
	    					let imgSaved = dataParsed.book.imgSaved;
	    					
	    					let htmlInputedGetData = '<div class="row border-bottom border-success author_idx"><div class="col">'+idx+'</div><div class="col">'+isbn+'</div><div class="col">'+title+'</div><div class="col">'+publisher+'</div><div class="col">'+datePublishing+'</div></div><div class="row text-center" style="width:200px"><img src="${ctp}/data/books/'+imgSaved+'" class="img-fluid img-thumbnail" alt="도서표지"><input type="hidden" value="'+idx+' name="idxBookHiden""/><input type="hidden" value="'+isbn+' name="isbn"/></div>';
							$(".search_idx").show(200);
		     				$('.product_input_res').html('<div class="row border-bottom border-success"><div class="col">고유번호</div><div class="col">ISBN</div><div class="col">도서제목</div><div class="col">출판사</div><div class="col">출간일</div></div>'+htmlInputedGetData);
		    		},
                    error : function() {
                       alert("전송 오류!");
		    		}
				});
			});
			
		});
		let enrollProduct = () => {
			enrollProductForm.submit();
		}
		let series_input = () => {
			$(".input_series").html(`
				<div class="alert alert-success series_input_wrap" role="alert" style="">
					<h4 class="alert-heading">등록을 원하는 시리즈의 제목을 입력하세요.</h4>
					<hr>
					<div><input type="text" id="input_series"/><button type="button" onclick="returnIdxBySeriesTitle()">검색하기</button></div>
					<div class="series_search_res"></div>
					<div>
						<h4 class="alert-heading">등록을 원하는 시리즈의 고유번호를 입력하세요.</h4>
						<input type="text" name="idxSeries" id="idx_series"/>
						<hr>
					</div>
				</div>
			`);
		}
		let returnIdxBySeriesTitle = () =>{
			let seriesTitle = $("#input_series").val();
			$.ajax({
	    		type   : "post",
	    		url    : "${ctp}/getSeriesIdxByTitle.ad",
	    		data : {seriesTitle:seriesTitle},
	    		success:function(data) {
		    			let dataParsed = JSON.parse(data);
			    		console.log(dataParsed);
			    		
	  	    			if(dataParsed.series==0){
	  	    				alert("입력한 자료가 없습니다!");
	 	    			}
						let divRes="";
		    			for(let i in dataParsed.series){
	    					let idx = dataParsed.series[i].idx;
	    					let title = dataParsed.series[i].titleSeries;
	    					let price = dataParsed.series[i].priceSeries;
	    					let rateDiscount = dataParsed.series[i].rateDiscount;
	    					let isbn = dataParsed.series[i].isbnSeries;
	    					let imgSaved = dataParsed.series[i].imgSaved;
	    					divRes += '<div class="row border-bottom border-success"><div class="col-2">'+idx+'</div><div class="col-2">'+title+'</div><div class="col-2">'+price+'</div><div classcol-2">'+rateDiscount+'</div><div classcol-2">'+isbn+'</div></div><div class="row text-center" style="width:200px"><img src="${ctp}/data/books/'+imgSaved+'" class="img-fluid img-thumbnail" alt="도서표지"><input type="hidden" value="'+idx+' name="idxBookHiden""/><input type="hidden" value="'+isbn+' name="isbn"/></div>';
		    			}
    					
	     				$('.series_search_res').html('<div class="row border-bottom border-success"><div class="col-2">고유번호</div><div class="col-2">ISBN</div><div class="col-2">시리즈제목</div><div class="col-2">시리즈가격</div><div class="col-2">시리즈할인%</div><div class="col-2">isbn</div></div>'+divRes);
	    		},
			});
		}
	</script>
    <style>
        body,h1,h2,h3,h4,h5,h6,span,div,strong {
            font-family: 'Helvetica', 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
            text-decoration: none !important;
        }
        ul,li {
            list-style: none;
            padding: 0px;
        }

        a:hover {
            text-decoration: none;
            color: #afafaf;
            transition: color, 0.3s;
        }

        ul {
            color: #fff;
        }

        li {
            padding: 0.5em;
        }

        .admin_nav {
            height: 100vh;
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

        .badge_alarm {
            position: absolute;
            transform: scale(0.8) translate(70%, -10%);
            transform-origin: top right;
            padding: 0.25em 0.4em;
            font-size: 75%;
            font-weight: 700;
            white-space: nowrap;
            border-radius: 0.35rem;
        }

        .nav_title {
            font-weight: 500;
            font-size: 1em;
            border-bottom: 1px solid #fff;
        }

        .nav_main_title {
            font-size: 2em;
            font-weight: bold;
            border-bottom: 1px solid #fff;
        }

        .nav_cont {
            color: #000;
            margin-left: 1em;
        }

        .nav_setting {
            color: #000;
        }

        .amount-text {
            color: #495057 !important;
            font-weight: 500 !important;
        }

        .border-weight {
            border-left: 0.5rem solid transparent;
        }

        .input_label {
            border-bottom: 5px solid #007f5f;
            border-radius: 3px;
            font-size: 1.2rem;
        }

        .col input {
            width: 100%;
            height: 2rem;
            border: 0px;
            background: rgba(192, 192, 192, 0.4);
        }
        .col input[type=radio]{
        	width: 2rem;
        	accent-color: #007f5f;
        }

        textarea {
            background: rgba(192, 192, 192, 0.4);
            border: 0px;
        }

    </style>

</head>
<body>
    <div class="container-fluid d-flex">
        <jsp:include page="/include/adNav.jsp" />
        <!-- 관리자 메인뷰 -->
        <div class="col-10 d-flex flex-column mt-2">
            <!-- 관리자 메인뷰의 메뉴판(검색창, 메시지, 알림) -->
            <nav class="d-flex justify-content-center align-items-center" style="width:100%; height: 10ch;">
                <div class="col-6">
                    <div class="input-group">
                        <input type="text" class="form-control bg-light border-0 small" placeholder="검색해보세요"
                            aria-label="Search" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button">
                                <i class="fas fa-search fa-sm"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <ul class="d-flex justify-content-end">
                        <li class="pr-3">
                            <a href="#">
                                <span class="badge badge-danger badge-counter badge_alarm">9+</span>
                                <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="#d1d3e2"
                                    class="bi bi-bell-fill" viewBox="0 0 16 16">
                                    <path
                                        d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z" />
                                </svg>
                            </a>
                        </li>
                        <li class="pr-3" style="border-right:1px solid grey">
                            <a href="#">
                                <span class="badge badge-danger badge-counter badge_alarm">9+</span>
                                <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="#d1d3e2"
                                    class="bi bi-envelope-fill" viewBox="0 0 16 16">
                                    <path
                                        d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z" />
                                </svg>
                            </a>
                        </li>
                        <li class="pr-3 nav_setting">
                            <span>안녕하세요, 관리자님</span>
                            <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="#d1d3e2"
                                class="bi bi-gear-fill" viewBox="0 0 16 16">
                                <path
                                    d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872l-.1-.34zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z" />
                            </svg>
                        </li>
                    </ul>
                </div>
            </nav>

            <div class="d-flex flex-column flex-wrap">
                <div class="row">
                    <div class="col-8">
                        <!-- 도서 등록 -->
                        <div class="h2 font-weight-bold">상품 등록</div>
                        <div class="row d-flex flex-column">
                            <div class="col">
                                <div class="card shadow">
                                    <form name="enrollProductForm" method="post" action="${ctp}/setProductInfo.ad" enctype="multipart/form-data">
                                        <div class="card-body">
                                            <div class="product_input row mb-2">
                                                <div class="col-3 input_label">상품 등록할 도서 검색(ISBN)</div>
                                                <div class="col">
                                                    <input type="text" name="isbn" id="input_serach_isbn"
                                                        placeholder="도서의 isbn으로 검색해주세요" />
                                                    <div class="mt-2 search_isbn">
                                                        <div class="alert alert-success product_search_wrap"
                                                            role="alert">
                                                            <h4 class="alert-heading">도서검색 결과</h4>
                                                            <hr />
                                                            <div class="book_search_res">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="isbn_input row mb-2">
                                                <div class="col-3 input_label">상품 등록할 도서 고유번호로 입력</div>
                                                <div class="col">
                                                    <input type="text" name="idxBook" id="input_idx_book"
                                                        placeholder="도서의 고유번호로 입력해주세요" />
                                                    <div class="mt-2 search_idx">
                                                        <div class="alert alert-success product_search_wrap"
                                                            role="alert">
                                                            <h4 class="alert-heading">도서입력 결과</h4>
                                                            <hr />
                                                            <div class="product_input_res">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="price_paper_input row mb-2">
                                                <div class="col-3 input_label">판매할 도서의 종이책 정가</div>
                                                <div class="col"><input type="number" name="pricePaper" id="price_paper"
                                                        placeholder="선택 입력사항" /></div>
                                            </div>
                                            <div class="price_ebook_input row mb-2">
                                                <div class="col-3 input_label">판매할 도서의 전자책 가격</div>
                                                <div class="col"><input type="number" name="priceEbook" id="price_ebook"
                                                        placeholder="필수 입력사항" /></div>
                                            </div>
                                            <div class="rate_discount_input row mb-2">
                                                <div class="col-3 input_label">할인율</div>
                                                <div class="col"><input type="number" name="rateDiscount"
                                                        id="rate_discount" placeholder="5 입력 시 할인율 5% 적용" /></div>
                                            </div>
                                            <div class="input_series row mb-2">
                                                <div class="col-3 input_label">시리즈 등록</div>
                                                <div class="col">
                                                    <button type="button" class="form-control"
                                                        onclick="series_input()">시리즈 등록하기</button>
                                                    <div class="input_series mt-3"></div>
                                                </div>
                                            </div>
                                            <div class="book_input row mb-2">
                                                <div class="col-3 input_label">듣기 가능 여부</div>
                                                <div class="col mb-1 d-flex align-items-center">
                                                    <i class="fa-solid fa-headphones h3 mr-2"></i>
                                                    <span class="mr-2">가능</span>
                                                    <input type="radio" name="canReader" id="canReaderY"
                                                        class="reader mr-2" value="1">
                                                    <i class="fa-solid fa-headphones h3 mr-2"></i>
                                                    <span class="mr-2">불가능</span>
                                                    <input type="radio" name="canReader" id="canReaderN" class="reader"
                                                        value="0">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col btn-group">
                                            <button type="button" onclick="enrollProduct()"
                                                class="btn btn-success btn-lg">등록하기</button>
                                            <button type="reset" class="btn btn-warning btn-lg">다시입력</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-4">
                        <!-- 유의사항 -->
                        <div class="row">
                            <div class="h2 font-weight-bold text-danger">
                                유의 사항
                            </div>
                        </div>
                        <div class="row d-flex">
                            <div class="card shadow">
                                <div class="card-body">
                                    <div class="h4 font-weight-bold">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                            fill="currentColor" class="bi bi-exclamation-diamond-fill"
                                            viewBox="0 0 16 16">
                                            <path
                                                d="M9.05.435c-.58-.58-1.52-.58-2.1 0L.436 6.95c-.58.58-.58 1.519 0 2.098l6.516 6.516c.58.58 1.519.58 2.098 0l6.516-6.516c.58-.58.58-1.519 0-2.098L9.05.435zM8 4c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995A.905.905 0 0 1 8 4zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                                        </svg>
                                        작가등록은 하셨나요?
                                    </div>
                                    <p>
                                        도서를 등록하시기 전, 해당 도서를 집필하신 <strong>작가님의 프로필이 등록되어 있는지 확인</strong>하셔야 합니다.
                                        만약 등록되어 있지 않다면, 먼저 등록을 해주신 다음 도서를 등록해주세요.
                                    </p>
                                    <p>
                                        또 외국 서적이라 번역가도 있다면, 작가 등록란에 번역가님도 등록하실 수 있습니다.
                                        그외에, 일러스트레이터(삽화가) 등등 정보도 있으시다면 도서를 등록하시기 전에 작가 등록란에서 도서를 등록해주시고 등록해주세요.
                                        여러 명의 작가, 번역가, 삽화가를 등록할 수 있습니다.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="row d-flex mt-2">
                            <div class="card shadow">
                                <div class="card-body">
                                    <div class="h4 font-weight-bold">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                            fill="currentColor" class="bi bi-exclamation-diamond-fill"
                                            viewBox="0 0 16 16">
                                            <path
                                                d="M9.05.435c-.58-.58-1.52-.58-2.1 0L.436 6.95c-.58.58-.58 1.519 0 2.098l6.516 6.516c.58.58 1.519.58 2.098 0l6.516-6.516c.58-.58.58-1.519 0-2.098L9.05.435zM8 4c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995A.905.905 0 0 1 8 4zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                                        </svg>
                                        도서 등록은 상품 등록이 아닙니다!
                                    </div>
                                    <p>
                                        도서 등록은 도서의 정보를 기입한 것일 뿐입니다! 도서 등록 이후에 해당 도서를 판매하고 싶으시다면, 상품 등록에서 처리해주세요.
                                    </p>
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