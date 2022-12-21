<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
	<script>
		'use script'
		let updateHidden = (idx) => {
			$.ajax({
				url   : "${ctp}/adUpdateHidden.ad",
				type: "post",
				data: {
					idx:idx
					},
				success: function(res) {
					if(res == 'success'){
						alert('숨김 해제되었습니다.');
					}
					else{
						alert('서버의 상태가 좋지 않아 숨김 해제를 실패했습니다');
					}
					location.reload();
				},
				error: function(){
					
				}
			});
		}
	</script>
</head>
<body>
    <div class="container-fluid d-flex flex-row mt-4">
        <jsp:include page="/include/adNav.jsp" />
        <!-- 관리자 메인뷰 -->
        <div class="col-10 d-flex flex-column mt-2">
            <!-- 관리자 메인뷰의 메뉴판(검색창, 메시지, 알림) -->
            <nav class="d-flex justify-content-center align-items-center" style="width:100%; height: 10ch;">
                <div class="col">
                    <ul class="d-flex justify-content-end">
                        <li class="pr-3">
                            <a href="#">
                                <span class="badge badge-danger badge-counter">9+</span>
                                <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="#d1d3e2"
                                    class="bi bi-bell-fill" viewBox="0 0 16 16">
                                    <path
                                        d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z" />
                                </svg>
                            </a>
                        </li>
                        <li class="pr-3" style="border-right:1px solid grey">
                            <a href="#">
                                <span class="badge badge-danger badge-counter">9+</span>
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
            <!-- 관리자 메인뷰의 컨텐츠 -->
            <div class="h2 font-weight-bold">리뷰 관리</div>
            <div class="alert alert-warning mt-1" role="alert">
                숨김 처리 관리
            </div>
			
			<c:forEach var="vo" items="${vos}">
	            <div class="row">
	                <div class="col">
	                    <div class="card mt-1">
	                        <div class="card-header">
	                            <a href="${ctp}/booksearch.bi?isbn=${vo.isbn}">${vo.titleBook} &nbsp;</a>
	                        	<span>${vo.email} 작성</span>
	                        </div>
	                        <div class="card-section">
	                            <input type="hidden" name="idxProduct" id="product${vo.idxProduct}"
	                                value="${vo.idxProduct}" />
	                        </div>
	                        <div class="card-body">
	                            <div id="content${vo.idx}">${vo.contentReview}</div>
	                            <div class="d-flex justify-content-end">
	                                <button class="btn btn-outline-secondary mr-1" onclick="updateHidden(${vo.idx})">숨김
	                                    해제</button>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
			</c:forEach>            
            
        </div>
    </div>
    <jsp:include page="/include/footer.jsp" />
</body>
</body>
</html>