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
		let enrollSeries = () => {
			enrollSeriesForm.submit();
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
	<div class = "container-fluid d-flex">
	    <jsp:include page="/include/adNav.jsp"/>
        <!-- 관리자 메인뷰 -->
        <div class="col-10 d-flex flex-column mt-2">
            <!-- 관리자 메인뷰의 메뉴판(검색창, 메시지, 알림) -->
            <nav class="d-flex justify-content-center align-items-center" style="width:100%; height: 10ch;">
                <div class="col">
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
                        <div class="h2 font-weight-bold">시리즈 등록</div>
                        <div class="row d-flex flex-column">
                            <div class="col">
                                <div class="card shadow">
	                                <form name="enrollSeriesForm" method="post" action="${ctp}/setSeriesInfo.ad" enctype="multipart/form-data">
	                                    <div class="card-body">
	                                        <div class="book_input row mb-2">
	                                            <div class="col-3 input_label">시리즈 이름</div>
	                                            <div class="col"><input type="text" name="title" id="title_series" placeholder="예) 민음사 동양문학집"/></div>
	                                        </div>
	                                        <div class="book_input row mb-2">
	                                            <div class="col-3 input_label">시리즈 가격</div>
	                                            <div class="col"><input type="number" name="price" id="price_seires" placeholder="20000"/></div>
	                                        </div>
	                                        <div class="book_input row mb-2">
	                                            <div class="col-3 input_label">시리즈 구매 시 할인가</div>
	                                            <div class="col"><input type="number" name="rateDiscount" id="rate_discount_series" placeholder="20 입력 시 20% 할인율 적용"/></div>
	                                        </div>
	                                        <div class="book_input row mb-2">
	                                            <div class="col-3 input_label">등록할 시리즈 isbn</div>
	                                            <div class="col"><input type="text" name="isbnSeries" id="isbn_series"/></div>
	                                        </div>
	                                        <div class="book_input row mb-2">
	                                            <div class="col-3 input_label">세트 표지</div>
												<div class="col mb-1">
													<input type="file" name="bookImg" id="book_img" />
												</div>
											</div>
	                                    </div>
	                                    <div class="col btn-group">
	                                        <button type="button" onclick="enrollSeries()" class="btn btn-success btn-lg">등록하기</button>
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
</body>
</html>