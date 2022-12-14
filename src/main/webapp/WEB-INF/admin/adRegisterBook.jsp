<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script>
	    $(function(){
	        $(".author_res_wrap").hide();
	        $(".author_input_wrap").hide();
	        $(".category_main").hide();
	        $(".category_nation").hide();
	        $(".category_sub").hide();
	        
		    $("#category_main").focus(function(){
		    	$(".category_main").show(200);
		    })
		    $("#category_nation").focus(function(){
		    	$(".category_nation").show(200);
		    })
		    $("#category_sub").focus(function(){
		    	$(".category_sub").show(200);
		    })
	    });
	    let searchAuthorName = () => {
    		let author = $("#search_author").val();
    		if(author.trim()==""){
    			$('.author_search_res').load(location.href+' .author_search_res');
    		}
 	    	$.ajax({
	    		type   : "post",
	    		url    : "${ctp}/getAuthorInfoByName.ad",
	    		data : {author:author,
	    		},
	    		success:function(data) {
 	    			let dataParsed = JSON.parse(data);
 	    			
  	    			if(dataParsed.author.length==0){
	     				$('.author_search_res').load(location.href+' .author_search_res');
 	    			}
 	    			else{
						let divRes="";
						
	    				for(let i in dataParsed.author) {
	    					let idx = dataParsed.author[i].idx;
	    					let nameAuthor = dataParsed.author[i].nameAuthor;
	    					let role = dataParsed.author[i].role;
	    					let nationality = dataParsed.author[i].nationality;
	    					let birthday = dataParsed.author[i].birthday;
	    					divRes += '<div class="row border-bottom border-success"><div class="col">'+idx+'</div><div class="col">'+nameAuthor+'</div><div class="col">'+role+'</div><div class="col">'+nationality+'</div><div class="col">'+birthday+'</div></div>';
		    			 }
	    				$(".author_res_wrap").show(200);
	    				$(".author_search_res").html(`<div class="row border-bottom border-success"><div class="col">고유번호</div><div class="col">이름</div><div class="col">분류</div><div class="col">국적</div><div class="col">생년월일</div></div>`+divRes);
 	    			}
	    		},
	    		error : function() {
	    			alert("전송 오류!");
	    		}
	    	});
	    }
    	let enrollBook = () => {
    		enrollBookForm.submit();
    	}
	    let author_idx_demo = "";
	    let enrollAuthorInBook = () => {
    		let authorInputed = $("#input_author").val();
    		if(authorInputed.trim()==""){
    			$('.author_input_wrap').load(location.href+' .author_search_res');
    			return;
    		}
 	    	$.ajax({
	    		type   : "post",
	    		url    : "${ctp}/getAuthorInfoByIdx.ad",
	    		data : {idx:authorInputed},
	    		success:function(data) {
 	    			let dataParsed = JSON.parse(data);
 	    			
  	    			if(dataParsed.author.length==0){
	     				$('.author_input_wrap').load(location.href+' .author_input_wrap');
	     				return;
 	    			}
 	    			else{
	    				for(let i in dataParsed.author) {
	    					let idx = dataParsed.author[i].idx;
	    					let nameAuthor = dataParsed.author[i].nameAuthor;
	    					let role = dataParsed.author[i].role;
	    					let nationality = dataParsed.author[i].nationality;
	    					let birthday = dataParsed.author[i].birthday;
	    					author_idx_demo += '<div class="row border-bottom border-success author_idx"><div class="col">'+idx+'</div><div class="col">'+nameAuthor+'</div><div class="col">'+role+'</div><div class="col">'+nationality+'</div><div class="col">'+birthday+'</div><input type="hidden" name="idxAuthor" value="'+idx+'"></div>';
		    			 }
	    				$(".author_input_wrap").show(200);
	    				$(".author_input_res").html(`<div class="row border-bottom border-success"><div class="col">고유번호</div><div class="col">이름</div><div class="col">분류</div><div class="col">국적</div><div class="col">생년월일</div></div>`+author_idx_demo);
 	    				
 	    			}
	    		},
	    		error : function() {
	    			alert("전송 오류!");
	    		}
	    	});
	    }

	</script>
	<style>
           body,h1,h2,h3,h4,h5,h6,span,div,strong {
               font-family: 'Helvetica', 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
               text-decoration: none !important;
           }

           body,h1,h2,h3,h4,h5,h6,span,div,strong {
               font-family: 'Helvetica', 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
               text-decoration: none !important;
           }

           ul,
           li {
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

           .book_input {}

           .input_label {
               border-bottom: 5px solid #007f5f;
               border-radius: 3px;
               font-size: 1.2rem;
           }

           input {
               width: 100%;
               height: 2rem;
               border: 0px;
               background: rgba(192, 192, 192, 0.4);
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
					<input type="text" class="form-control bg-light border-0 small" placeholder="검색해보세요" aria-label="Search"
						aria-describedby="basic-addon2">
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
					<div class="h2 font-weight-bold">도서 등록</div>
					<div class="row d-flex flex-column">
						<div class="col">
							<div class="card shadow">
								<form name="enrollBookForm" method="post" action="${ctp}/setBookInfo.ad" enctype="multipart/form-data">
									<div class="card-body">
										<div class="book_input row mb-2">
											<div class="col-3 input_label">도서 제목</div>
											<div class="col"><input type="text" name="title" id="title" /></div>
										</div>
										<div class="book_input row mb-2">
											<div class="col-3 input_label">출판사</div>
											<div class="col"><input type="text" name="publisher" id="publisher" /></div>
										</div>
										<div class="book_input row mb-2">
											<div class="col-3 input_label">출간 정보(일자)</div>
											<div class="col"><input type="text" name="datePublishing" id="date_publishing" /></div>
										</div>
										<div class="book_input row mb-2">
											<div class="col-3 input_label">ISBN</div>
											<div class="col"><input type="text" name="isbn" id="isbn"/></div>
										</div>
										<div class="book_input row mb-2">
											<div class="col-3 input_label">도서 내용 등록</div>
											<div class="col"><textarea rows="15" style="width:100%" name="textContent"></textarea></div>
										</div>
										<div class="book_input row mb-2">
											<div class="col-3 input_label">카테고리</div>
											<div class="col">
												<div class="row">
													<div class="col">
														<input type="text" class="" id="category_main" name="main" placeholder="메인 카테고리 입력" />
													</div>
													<div class="col">
														<input type="text" class="" id="category_nation" name="nation" placeholder="소설인 경우 국가 입력" />
													</div>
													<div class="col">
														<input type="text" class="" id="category_sub" name="sub" placeholder="서브 카테고리 입력" />
													</div>
												</div>
												<div class="row mt-2">
													<div class="col">
										    			<div class="alert alert-success category_main" role="alert">
									    					<div class="row">
									    						소설 | 경영/경제 | 인문/사회/역사 | 자기계발 | 에세이/시 | 컴퓨터/IT | 가정/생활 | 해외 원서
									    					</div>
										    			</div>
													</div>
												</div>
												<div class="row mt-2">
													<div class="col">
										    			<div class="alert alert-success category_nation" role="alert">
									    					<div class="row">
									    						한국소설 | 영미소설 | 동양소설 | 유럽소설 | 기타국가소설
									    					</div>
										    			</div>
													</div>
												</div>
												<div class="row mt-2">
													<div class="col">
										    			<div class="alert alert-success category_sub" role="alert">
									    					<div class="row">
									    						소설 | 국내 판타지소설, 해외 판타지소설, 추리/미스터리/스릴러, SF소설, 국내 역사소설, 국내 역사소설, 대체 역사소설, 동양 고전문학, 서양 고전문학
									    						<br/><hr/>
									    						경영/경제 | 경영일반, 경제일반, 마케팅/세일즈, 재테크/금융/부동산, CEO/리더십
									    						<br/><hr/>
									    						인문/사회/역사 | 인문, 정치/사회, 예술/문화, 역사, 재테크/금융/부동산, CEO/리더십
									    						<br/><hr/>
									    						자기계발 | 성공/삶의자세, 기획/창의/리더십, 취업/창업, 여성, 인간관계
									    						<br/><hr/>
									    						에세이/시 | 에세이, 시
									    						<br/><hr/>
									    						컴퓨터/IT | IT 비즈니스, 개발/프로그래밍, 컴퓨터/앱 활용, IT자격증, IT 해외원서
									    						<br/><hr/>
									    						가정/생활 | 결혼/임신/출산, 육아/자녀교육, 취미/요리/기타, 어린이/청소년	
									    						<br/><hr/>
									    						해외원서 | 해외원서
									    					</div>
										    			</div>
													</div>
												</div>
											</div>
										</div>
										<div class="book_input row mb-2">
											<div class="col-3 input_label">작가 입력</div>
											<div class="col mb-1">
												<div class="row">
													<div class="font-weight-bold ml-3 mr-3">
														작가/번역가/삽화가 등 검색
													</div>
													<div class="input-group">
														<input type="text" class="form-control"
															id="search_author" placeholder="검색할 작가 이름 입력창" />
														<div class="input-group-append">
															<button class="btn btn-success" type="button" id="search_btn"
																onclick="searchAuthorName()">검색하기</button>
														</div>
													</div>
												</div>
												<div class="row mt-2">
													<div class="col">
														<div class="alert alert-success author_res_wrap" role="alert">
															<h4 class="alert-heading">작가 검색 결과</h4>
															<hr/>
															<div class="author_search_res"></div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="font-weight-bold ml-3 mr-3">
														작가/번역가/삽화가 등 입력
													</div>
													<form name="inputAuthorIdx">
														<div class="input-group">
															<input type="number" class="form-control"
																id="input_author" placeholder="작가 고유번호 입력창" />
															<div class="input-group-append">
																<button class="btn btn-success" type="button" id="search_btn" onclick="enrollAuthorInBook()">등록하기</button>
															</div>
														</div>
													</form>
												</div>
												<div class="row mt-2 author_input">
													<div class="col">
														<div class="alert alert-success author_input_wrap" role="alert">
															<h4 class="alert-heading">작가 입력 결과</h4>
															<hr/>
															<div class="author_input_res"></div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="book_input row mb-2">
											<div class="col-3 input_label">도서 표지 등록</div>
											<div class="col mb-1">
												<input type="file" name="bookImg" id="book_img" />
											</div>
										</div>
									</div>
									<div class="book_input row mb-2">
										<div class="col-3"></div>
										<div class="col">
										</div>
									</div>
									<div class="col btn-group">
										<button class="btn btn-success btn-lg" type="button" onclick="enrollBook()">등록하기</button>
										<button class="btn btn-warning btn-lg" type="reset">리셋하기</button>
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
					<div class="row d-flex mt-2">
						<div class="card shadow">
							<div class="card-body">
								<div class="h4 font-weight-bold">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
										class="bi bi-exclamation-diamond-fill" viewBox="0 0 16 16">
										<path
											d="M9.05.435c-.58-.58-1.52-.58-2.1 0L.436 6.95c-.58.58-.58 1.519 0 2.098l6.516 6.516c.58.58 1.519.58 2.098 0l6.516-6.516c.58-.58.58-1.519 0-2.098L9.05.435zM8 4c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995A.905.905 0 0 1 8 4zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
									</svg>
									작가등록 하는 방법
								</div>
								<p>
									작가/번역가/삽화가 등 입력을 원하신다면 작가 검색란에 해당하는 인물을 검색해주세요. 그렇다면 아래의 테이블 형식으로 나오게 되는데, 꼭
									해당하는 작가의 고유번호로
									입력해주세요.
								</p>
								<table class="table-bordered">
									<tr class="bg-danger text-white">
										<th>고유번호</th>
										<th>이름</th>
										<th>역할</th>
										<th>국적</th>
										<th>생년월일</th>
									</tr>
									<tr>
										<td>4</td>
										<td>홍길동</td>
										<td>작가</td>
										<td>대한민국</td>
										<td>1999년 1월 15일</td>
									</tr>
								</table>
								<strong>(홍길동을 입력하는 것이 아닌 4를 입력)</strong>
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