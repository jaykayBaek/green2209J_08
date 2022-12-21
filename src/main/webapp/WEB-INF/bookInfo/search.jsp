<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
  <style>
  body {
	font-family: 'Helvetica', 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
	background-color: #fff !important;
  }
  .bg-soft-base {
    background-color: #e1f5f7;
  }
  .bg-soft-warning {
      background-color: #fff4e1;
  }
  .bg-soft-success {
      background-color: #d1f6f2;
  }
  .bg-soft-danger {
      background-color: #fedce0;
  }
  .bg-soft-info {
      background-color: #d7efff;
  }

  .search-body {
    margin-bottom: 1.5rem;
  }

  .card-margin {
      margin-bottom: 1.875rem;
  }

  @media (min-width: 992px){
  .col-lg-2 {
      flex: 0 0 16.66667%;
      max-width: 16.66667%;
  }
  }

  .card-margin {
      margin-bottom: 1.875rem;
  }
  .card {
      border: 0;
      box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
      -webkit-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
      -moz-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
      -ms-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
  }
  .card {
      position: relative;
      display: flex;
      flex-direction: column;
      min-width: 0;
      word-wrap: break-word;
      background-color: #ffffff;
      background-clip: border-box;
      border: 1px solid #e6e4e9;
      border-radius: 8px;
  }
  </style>
</head>
<body>
  <jsp:include page="../../include/nav.jsp" />
  <div class="container">
  <div class="row">
    <div class="col-12">
      <div class="card card-margin">
        <div class="card-body">
          <div class="row search-body">
            <div class="col-lg-12">
              <div class="search-result">
                <div class="result-body">
                 <div class="table-responsive">
                    <span class="font-weight-bold h4">'${search}' 검색 결과</span>
                    <table class="table widget-26">
                      <tbody>
                      	<c:forEach var="vo" items="${searchVos}">
	                        <tr>
	                          <td>
	                            <div class="book-img">
		                           	<a href="${ctp}/booksearch.bi?isbn=${vo.isbn}">
		                              <img src="${ctp}/data/books/${vo.imgSavedBook}" alt="도서 ${vo.title} 표지" style="width:100px"/>
		                            </a>
	                            </div>
	                          </td>
	                          <td>
	                            <div class="author-title">
	                              <a href="${ctp}/booksearch.bi?isbn=${vo.isbn}">${vo.title}</a>
	                              <p class="m-0"><a href="#" class="author-name">${vo.nameAuthor}</a></p>
	                              <p>⭐${vo.starRating}&nbsp;(<fmt:formatNumber value="${vo.reviewCnt}" pattern="#,###" />명)</p>
	                              <p>
	                              	${fn:substring(vo.textIntroduce, 0, 150)}...
	                              </p>
	                              <p>
	                                소장 <span class="text-primary font-weight-bold"><fmt:formatNumber value="${vo.priceEbook}" pattern="#,###" />원</span> 
	                              </p>
	                            </div>
	                          </td>
	                        </tr>
                      	</c:forEach>
                        
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
	<nav class="d-flex justify-content-center mt-2" id="review-page">
		<ul class="pagination">
			<c:if test="${page > 1}">
				<li class="page-item">
					<a class="page-link" href="${ctp}/search.bi?search=${search}&page=1">처음으로</a>
				</li>
			</c:if>
			<c:if test="${page <= 1}">
				<li class="page-item disabled">
					<a class="page-link">처음으로</a>
				</li>
			</c:if>
			
			<c:if test="${page > 1}">
				<li class="page-item ">
					<a class="page-link" href="${ctp}/search.bi?search=${search}&page=${(blockNow-1)*blockSize + 1}">이전 리뷰</a>
				</li>
			</c:if>
			<c:if test="${page <= 1}">
				<li class="page-item disabled">
					<a class="page-link">이전 리뷰</a>
				</li>
			</c:if>
			
			<c:forEach var="i" begin="${(blockNow)*blockSize + 1}" end="${(blockNow)*blockSize+blockSize}" varStatus="st">
				
				<c:if test="${i <= totPage && i==page}">
					<li class="page-item active" >
						<a class="page-link" href="${ctp}/search.bi?search=${search}&page=${i}">${i}</a>
					</li>
				</c:if>
				<c:if test="${i <= totPage && i!=page}">
					<li class="page-item" >
						<a class="page-link" href="${ctp}/search.bi?search=${search}&page=${i}">${i}</a>
					</li>
				</c:if>
				
			</c:forEach>
			
			
			<c:if test="${blockNow < blockLast}">
				<li class="page-item">
					<a class="page-link" href="${ctp}/search.bi?search=${search}&page=${(blockNow+1)*blockSize + 1}">다음 리뷰</a>
				</li>
			</c:if>
			<c:if test="${blockNow >= blockLast}">
				<li class="page-item disabled">
					<a class="page-link">다음 리뷰</a>
				</li>
			</c:if>
			
			<c:if test="${page < totPage}">
				<li class="page-item">
					<a class="page-link" href="${ctp}/search.bi?search=${search}&page=${totPage}">끝으로</a>
				</li>
			</c:if>
			<c:if test="${page >= totPage}">
				<li class="page-item disabled">
					<a class="page-link">끝으로</a>
				</li>
			</c:if>
		</ul>
	</nav>
  
</div>
  <jsp:include page="../../include/footer.jsp" />
</html>