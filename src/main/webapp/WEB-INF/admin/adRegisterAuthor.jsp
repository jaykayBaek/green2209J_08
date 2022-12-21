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
		let addAward = () => {
			let awardDemoVal = $(".award_demo").html();
			$(".award_demo").html(awardDemoVal+`<div class="row"><div class="col"><input type="number"name="awardYear"class="award_year"placeholder="수상년도(예:2007)"/></div><div class="col"><input type="text"name="award"class="award"placeholder="상 이름(예:안데르센 문학상)"/></div><div class="col"><button class="btn btn-warning"type="button"onclick="addAward()"style="width:100%"><svg xmlns="http://www.w3.org/2000/svg"width="16"height="16"fill="currentColor"class="bi bi-plus-circle-fill"viewBox="0 0 16 16"><path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/></svg>수상이력추가하기</button></div>`);
		}
		let addEducation = () => {
			let educationDemoVal = $(".education_demo").html();
			$(".education_demo").html(educationDemoVal+`<div class="row"><div class="col"><input type="text"name="education"class="education"placeholder="워싱턴 대학교 or 하버드 대학교 명예박사"/></div><div class="col"><button class="btn btn-warning"type="button"onclick="addEducation()"style="width:100%"><svg xmlns="http://www.w3.org/2000/svg"width="16"height="16"fill="currentColor"class="bi bi-plus-circle-fill"viewBox="0 0 16 16"><path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/></svg>학력추가</button></div></div>`)
		}
		let registerAuthor = () => {
			let authorForm = $("form[name=authorForm]").serialize()
			$.ajax({
				type : "post",
				url : "${ctp}/inputAuthorInfo.ad",
				data : authorForm,
				success : function (res){
					if(res == '0'){
						alert('등록을 실패했습니다.');
					}
					else{
						alert('등록을 성공했습니다.')
					}
				},
				error: function () {
					alert('연결 실패');
				}
			});
		}
	</script>
	<style>
        <style>
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
	<div class = "container-fluid d-flex flex-row">
		
		<jsp:include page="/include/adNav.jsp"></jsp:include>
		
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
			              <div class="h2 font-weight-bold">작가/번역가/삽화가 등록</div>
			              <div class="row d-flex flex-column">
			                  <div class="col">
			                  	  <form name="authorForm">
				                      <div class="card shadow">
				                          <div class="card-body">
				                              <div class="book_input row mb-2">
				                                  <div class="col-3 input_label">이름</div>
				                                  <div class="col"><input type="text" name="nameAuthor" id="name_author" /></div>
				                              </div>
				                              <div class="book_input row mb-2">
				                                  <div class="col-3 input_label">역할</div>
				                                  <div class="col">
				                                      <select name="role">
				                                          <option value="작가">작가</option>
				                                          <option value="번역가">번역가</option>
				                                          <option value="삽화가">삽화가</option>
				                                          <option value="etc">기타</option>
				                                      </select>
				                                  </div>
				                              </div>
				                              <div class="book_input row mb-2">
				                                  <div class="col-3 input_label">국적</div>
				                                  <div class="col"><input type="text" name="nationality" id="nationality" /></div>
				                              </div>
				                              <div class="book_input row mb-2">
				                                  <div class="col-3 input_label">생년월일</div>
				                                  <div class="col"><input type="text" name="birthday" id="birthday" placeholder="예시 : 1999년 7월 31일 &lt-무조건 해당 양식으로 입력해주세요."/></div>
				                              </div>
				                              <div class="book_input row mb-2">
				                                  <div class="col-3 input_label">수상 이력</div>
				                                  <div class="col">
				                                  	<div class="row">
				                                  		<div class="col">
						                                  	<input type="number" name="awardYear" class="award_year" placeholder="수상년도(예:2007)"/>
				                                  		</div>
				                                  		<div class="col">
						                                  	<input type="text" name="award" class="award" placeholder="상 이름(예:안데르센 문학상)"/>
				                                  		</div>
				                                  		<div class="col">
						                                  	<button class="btn btn-warning" type="button" onclick="addAward()" style="width:100%">
						                                  		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle-fill" viewBox="0 0 16 16">
																  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
																</svg>
																수상 이력 추가하기
						                                  	</button>
				                                  		</div>
				                                  	</div>
				                                  	
					                                <div class="award_demo"></div>
				                                  </div>
				                              </div>
				                              <div class="book_input row mb-2">
				                                  <div class="col-3 input_label">학력</div>
				                                  <div class="col">
				                                  	<div class="row">
				                                  		<div class="col">
						                                  	<input type="text" name="education" class="education" placeholder="워싱턴 대학교 or 하버드 대학교 명예박사"/>
				                                  		</div>
				                                  		<div class="col">
	                            						    <button class="btn btn-warning" type="button" onclick="addEducation()" style="width:100%">
						                                  		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle-fill" viewBox="0 0 16 16">
																  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
																</svg>
																학력 추가
						                                  	</button>
				                                  		</div>
				                                  	</div>
				                                  	<div class="education_demo"></div>
			                                  	  </div>
				                              </div>
				                              <div class="book_input row mb-2">
				                                  <div class="col-3 input_label">소개글</div>
				                                  <div class="col"><textarea name="introduceTxt" rows="5" style="width:100%"></textarea></div>
				                              </div>
				                          </div>
				                          <div class="book_input row mb-2">
				                              <div class="col-3"></div>
				                              <div class="col">
				                              </div>
				                          </div>
				                          <div class="col btn-group">
				                              <button type="button" onclick="registerAuthor()" class="btn btn-success btn-lg">등록하기</button>
				                              <button type="reset" class="btn btn-warning btn-lg">리셋하기</button>
				                          </div>
				                      </div>
			                  	  </form>
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
                                  <div class="h4 font-weight-bold text-danger">
                                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                          fill="currentColor" class="bi bi-exclamation-diamond-fill"
                                          viewBox="0 0 16 16">
                                          <path
                                              d="M9.05.435c-.58-.58-1.52-.58-2.1 0L.436 6.95c-.58.58-.58 1.519 0 2.098l6.516 6.516c.58.58 1.519.58 2.098 0l6.516-6.516c.58-.58.58-1.519 0-2.098L9.05.435zM8 4c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995A.905.905 0 0 1 8 4zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                                      </svg>
                                      작가 검색 결과
                                  </div>
                                  <div class="author_search_res"></div>
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