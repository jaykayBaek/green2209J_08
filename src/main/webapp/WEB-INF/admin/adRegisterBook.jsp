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
		        /* - - - 초기에는 카테고리 모두 감쳐야 함 - - - */
		        $("#category_country").hide();
		        $("#category_novel").hide();
		        $("#category_economy").hide();
		        $("#category_human").hide();
		        $("#category_improvement").hide();
		        $("#category_essayAndPoem").hide();
		        $("#category_trip").hide();
		        $("#category_religion").hide();
		        $("#category_foreign_lan").hide();
		        $("#category_mathAndSci").hide();
		        $("#category_it").hide();
		        $("#category_wellbeing").hide();
		        $("#category_familly").hide();
		        $("#category_original").hide();
		        
		        let choiceResTmp = "";
		        let choiceRes = "";
		
		        $("#category_main").change(function(){
		            choiceRes = $("#category_main").val();
		
		            if(choiceResTmp != choiceRes){
		                $("#category_country").hide();
		                $("#category_novel").hide();
		                $("#category_economy").hide();
		                $("#category_human").hide();
		                $("#category_improvement").hide();
		                $("#category_essayAndPoem").hide();
		                $("#category_trip").hide();
		                $("#category_religion").hide();
		                $("#category_foreign_lan").hide();
		                $("#category_mathAndSci").hide();
		                $("#category_it").hide();
		                $("#category_wellbeing").hide();
		                $("#category_familly").hide();
		                $("#category_original").hide();
		            }
		
		            if(choiceRes=='소설'){
		                $("#category_country").show(200);
		                $("#category_novel").show(200);
		
		                choiceResTmp = choiceRes;
		            }
		            else if(choiceRes=='경영/경제'){
		                $("#category_economy").show(200);
		                choiceResTmp = choiceRes;
		            }
		            else if(choiceRes=='인문/사회/역사'){
		                $("#category_human").show(200);
		                choiceResTmp = choiceRes;
		            }
		            else if(choiceRes=='자기계발'){
		                $("#category_improvement").show(200);
		                choiceResTmp = choiceRes;
		            }
		            else if(choiceRes=='에세이/시'){
		                $("#category_essayAndPoem").show(200);
		                choiceResTmp = choiceRes;
		            }
		            else if(choiceRes=='여행'){
		                $("#category_trip").show(200);
		                choiceResTmp = choiceRes;
		            }
		            else if(choiceRes=='종교'){
		                $("#category_religion").show(200);
		                choiceResTmp = choiceRes;
		            }
		            else if(choiceRes=='외국어'){
		                $("#category_foreign_lan").show(200);
		                choiceResTmp = choiceRes;
		            }
		            else if(choiceRes=='과학'){
		                $("#category_mathAndSci").show(200);
		                choiceResTmp = choiceRes;
		            }
		            else if(choiceRes=='컴퓨터/IT'){
		                $("#category_it").show(200);
		                choiceResTmp = choiceRes;
		            }
		            else if(choiceRes=='건강/다이어트'){
		                $("#category_wellbeing").show(200);
		                choiceResTmp = choiceRes;
		            }
		            else if(choiceRes=='가정/생활'){
		                $("#category_familly").show(200);
		                choiceResTmp = choiceRes;
		            }
		            else if(choiceRes=='해외원서'){
		                $("#category_original").show(200);
		                choiceResTmp = choiceRes;
		            }
		            console.log(choiceRes);
		            console.log(choiceResTmp);
		        });
		    });
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
	    <jsp:include page="/include/adNav.jsp"/>
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
	                    <div class="h2 font-weight-bold">도서 등록</div>
	                    <div class="row d-flex flex-column">
	                        <div class="col">
	                            <div class="card shadow">
	                                <div class="card-body">
	                                    <div class="book_input row mb-2">
	                                        <div class="col-3 input_label">도서 제목</div>
	                                        <div class="col"><input typle="text" name="bookname" id="bookname" /></div>
	                                    </div>
	                                    <div class="book_input row mb-2">
	                                        <div class="col-3 input_label">출판사</div>
	                                        <div class="col"><input typle="text" name="bookname" id="bookname" /></div>
	                                    </div>
	                                    <div class="book_input row mb-2">
	                                        <div class="col-3 input_label">출간 정보(일자)</div>
	                                        <div class="col"><input typle="text" name="bookname" id="bookname" /></div>
	                                    </div>
	                                    <div class="book_input row mb-2">
	                                        <div class="col-3 input_label">ISBN</div>
	                                        <div class="col"><input typle="text" name="bookname" id="bookname" /></div>
	                                    </div>
	                                    <div class="book_input row mb-2">
	                                        <div class="col-3 input_label">도서 내용 등록</div>
	                                        <div class="col"><textarea rows="15" style="width:100%"></textarea></div>
	                                    </div>
	                                    <div class="book_input row mb-2">
	                                        <div class="col-3 input_label">카테고리</div>
	                                        <div class="col">
	                                            <select name="category_main" id="category_main" class="category">
	                                                <option value="none">선택해주세요</option>
	                                                <option value="소설">소설</option>
	                                                <option value="경영/경제">경영/경제</option>
	                                                <option value="인문/사회/역사">인문/사회/역사</option>
	                                                <option value="자기계발">자기계발</option>
	                                                <option value="에세이/시">에세이/시</option>
	                                                <option value="여행">여행</option>
	                                                <option value="종교">종교</option>
	                                               <option value="외국어">외국어</option>
	                                               <option value="과학">과학</option>
	                                               <option value="컴퓨터/IT">컴퓨터/IT</option>
	                                               <option value="건강/다이어트">건강/다이어트</option>
	                                               <option value="가정/생활">가정/생활</option>
	                                               <option value="해외원서">해외원서</option>
	                                           </select>
	                                           <select name="category_country" id="category_country" class="category">
	                                               <option value="">한국소설</option>
	                                               <option value="">영미소설</option>
	                                               <option value="">동양소설</option>
	                                               <option value="">유럽소설</option>
	                                               <option value="">기타국가소설</option>
	                                           </select>
	                                           <select name="category_novel" id="category_novel" class="category">
	                                               <option value="">국내 판타지소설</option>
	                                               <option value="">해외 판타지소설</option>
	                                               <option value="">추리/미스터리/스릴러</option>
	                                               <option value="">SF소설</option>
	                                               <option value="">국내 역사소설</option>
	                                               <option value="">해외 역사소설</option>
	                                               <option value="">대체 역사소설</option>
	                                               <option value="">동양 고전문학</option>
	                                               <option value="">서양 고전문학</option>
	                                           </select>
	                                           <select name="category_economy" id="category_economy" class="category">
	                                               <option value="">경영일반</option>
	                                               <option value="">경제일반</option>
	                                               <option value="">마케팅/세일즈</option>
	                                               <option value="">재테크/금융/부동산</option>
	                                               <option value="">CEO/리더십</option>
	                                           </select>
	                                           <select name="category_human" id="category_human" class="category">
	                                               <option value="">인문</option>
	                                               <option value="">정치/사회</option>
	                                               <option value="">예술/문화</option>
	                                               <option value="">역사</option>
	                                           </select>
	                                           <select name="category_improvement" id="category_improvement" class="category">
	                                               <option value="">성공/삶의자세</option>
	                                               <option value="">기획/창의/리더십</option>
	                                               <option value="">기획/창의/리더십</option>
	                                               <option value="">취업/창업</option>
	                                               <option value="">여성</option>
	                                               <option value="">인간관계</option>
	                                           </select>
	                                           <select name="category_essayAndPoem" id="category_essayAndPoem" class="category">
	                                               <option value="">에세이</option>
	                                               <option value="">시</option>
	                                           </select>
	                                           <select name="category_trip" id="category_trip">
	                                               <option value="">국내여행</option>
	                                               <option value="">해외여행</option>
	                                           </select>
	                                           <select name="category_religion" id="category_religion" class="category">
	                                               <option value="">종교일반</option>
	                                               <option value="">가톨릭</option>
	                                               <option value="">기독교(개신교)</option>
	                                               <option value="">불교</option>
	                                               <option value="">기타</option>
	                                           </select>
	                                           <select name="category_foreign_lan" id="category_foreign_lan" class="category">
	                                               <option value="">비즈니스영어</option>
	                                               <option value="">일반영어</option>
	                                               <option value="">제2외국어</option>
	                                               <option value="">어학시험</option>
	                                           </select>
	                                           <select name="category_mathAndSci" id="category_mathAndSci" class="category">
	                                               <option value="">과학일반</option>
	                                               <option value="">수학</option>
	                                               <option value="">자연과학</option>
	                                               <option value="">응용과학</option>
	                                           </select>
	                                           <select name="category_it" id="category_it" class="category">
	                                               <option value="">IT 비즈니스</option>
	                                               <option value="">개발/프로그래밍</option>
	                                               <option value="">컴퓨터/앱 활용</option>
	                                               <option value="">IT자격증</option>
	                                               <option value="">IT 해외원서</option>
	                                           </select>
	                                           <select name="category_wellbeing" id="category_wellbeing" class="category">
	                                               <option value="">다이어트/운동/스포츠</option>
	                                               <option value="">스타일/뷰티</option>
	                                               <option value="">건강</option>
	                                           </select>
	                                           <select name="category_familly" id="category_familly" class="category">
	                                               <option value="">결혼/임신/출산</option>
	                                               <option value="">육아/자녀교육</option>
	                                               <option value="">취미/요리/기타</option>
	                                               <option value="">어린이/청소년</option>
	                                           </select>
	                                           <select name="category_original" id="category_original" class="category">
	                                               <option value="">해외원서</option>
	                                           </select>
	                                       </div>
	                                   </div>
	                                   <div class="book_input row mb-2">
	                                       <div class="col-3 input_label">작가 입력</div>
	                                       <div class="col mb-1">
	                                           <span class="h4 font-weight-bold">
	                                               작가/번역가/삽화가 등 검색
	                                           </span>
	                                           <div class="input-group">
	                                               <input typle="text" class="form-control" name="bookname"
	                                                   id="bookname" />
	                                               <div class="input-group-append">
	                                                   <button class="btn btn-success" type="button"
	                                                       id="search_btn">검색하기</button>
	                                               </div>
	                                           </div>
	                                       </div>
	                                   </div>
	                                   <div class="book_input row mb-2">
	                                       <div class="col-3 input_label">도서 표지 등록</div>
	                                       <div class="col mb-1">
	                                           <input type="file" name=""bookImg id="book_img"/>
	                                       </div>
	                                   </div>
	                               </div>
	                               <div class="book_input row mb-2">
	                                   <div class="col-3"></div>
	                                   <div class="col">
	                                   </div>
	                               </div>
	                               <div class="col btn-group">
	                                   <button class="btn btn-success btn-lg">등록하기</button>
	                                   <button class="btn btn-warning btn-lg">리셋하기</button>
	                               </div>
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
    </body>

</html>