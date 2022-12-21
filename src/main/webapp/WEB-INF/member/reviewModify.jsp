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
</head>
<script>
	let deleteReview = (idx) => {
		let idxProduct = $('product'+idx).val()
		$.ajax({
			url : "${ctp}/deleteReview.member",
			type: "post",
			data: {
				idx:idx,
				idxProduct:idxProduct
				},
			success: function(res) {
				if(res == 'true'){
					alert('리뷰가 제거되었습니다');
				}
				else if(res == 'false'){
					alert('서버의 오류이거나 비정상적인 접근으로 리뷰 제거가 실패했습니다');
					
				}
				else {
					alert('이미 댓글이 있어 삭제할 수 없습니다.');
				}
			},
			error: function(){
				alert('서버에러');
			}
		});
	}

	let updateReview = (idx) => {
		const content = $("#content"+idx).val();
		const isChecked = $("#spoiler"+idx).is(':checked');
		let spoilerCheck = 0;
		if(isChecked == true){
			spoilerCheck = 1;
		}
		else {
			spoilerCheck = 0;
		}
		
		$.ajax({
			url   : "${ctp}/updateReview.member",
			type: "post",
			data: {
				content:content,
				idx:idx,
				spoilerCheck:spoilerCheck
				},
			success: function(res) {
				if(res == 'success'){
					alert('리뷰 수정이 완료되었습니다');
				}
				else{
					alert('서버의 상태가 좋지 않아 리뷰 수정에 실패했습니다');
				}
				location.reload();
			},
			error: function(){
				
			}
		});
	}
	
</script>
<style>
	.date-text{
		font-size: 0.8rem;
		color:#adb5bd;
	}
</style>
<body>
    <jsp:include page="/include/nav.jsp"/>
	<div class = "container mt-3">
		<div class="row">
			<nav class="col-2">
		        <jsp:include page="homeNav.jsp"/>
			</nav>
			<div class="col-10">
				<div class="title">
					<span class="text-dark h4 font-weight-bold">내 리뷰 관리</span>
				</div>
				<div class="alert alert-warning mt-1" role="alert">
					리뷰에 댓글이 달렸다면 삭제할 수 없습니다!
				</div>
				<c:forEach var="vo" items="${vos}">
				
					<div class="card mt-1">
						<div class="card-header">
							<a href="${ctp}/booksearch.bi?isbn=${vo.isbn}">${vo.titleBook}</a>
						</div>
						<div class="card-section">
							<c:forEach begin="1" end="${vo.starRating}">
								⭐
							</c:forEach>
							<span class="date-text">${fn:substring(vo.dateCreated, 0, 10)}</span>
							<input type="hidden" name="idxProduct" id="product${vo.idxProduct}" value="${vo.idxProduct}"/>
						</div>
						<div class="card-body">
							<textarea rows="5" class="form-control mb-1" id="content${vo.idx}">${vo.contentReview}</textarea>
							<c:if test="${vo.spoilerCheck == 1}">
								<input type="checkbox" name="spoilerCheck" id="spoiler${vo.idx}" checked>
							</c:if>
							<c:if test="${vo.spoilerCheck == 0}">
								<input type="checkbox" name="spoilerCheck" id="spoiler${vo.idx}">
							</c:if>
								<label for="spoiler${vo.idx}">스포일러가 있어요</label>
							<div class="d-flex justify-content-end">
								<button class="btn btn-outline-secondary mr-1" onclick="updateReview(${vo.idx})">수정하기</button>
								<button class="btn btn-outline-secondary" onclick="deleteReview(${vo.idx})">삭제하기</button>
							</div>
						</div>
					</div>
					
				</c:forEach>
			</div>
		</div>
	</div>
    <jsp:include page="/include/footer.jsp"/>
</body>
</html>