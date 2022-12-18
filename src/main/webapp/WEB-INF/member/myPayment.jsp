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
</head>
<body>
	<jsp:include page="/include/nav.jsp"/>
	<div class = "container">
	<div class="row">
            <nav class="col-2">
           		<jsp:include page="homeNav.jsp"/>
            </nav>
	        <div class="col-10 d-flex justify-content-around">
	            <div class="container">
	                <div class="row">
	                    <div class="table-responsive">
	                    	<span class="h4 font-weight-bold">결제 내역</span>
	                        <table class="table table-bordered table-hover">
	                            <thead class="table-secondary">
	                                <tr>
	                                    <th>구매일</th>
	                                    <th class="text-left">결제 내역(주문번호)</th>
	                                    <th>주문금액</th>
	                                    <th>결제 수단</th>
	                                </tr>
	                            </thead>
	                            <tbody id="my-payment-details">
	                            	<c:forEach var="vo" items="${vos}">
		                                <tr>
		                                    <td>${fn:substring(vo.datePurchased, 0, 16)}</td>
		                                    <td>
			                                    <a href="${ctp}/paymentDetail.member?orderNo=${vo.orderNo}">
				                                    <span class="font-weight-bold">${vo.orderNo}</span>
			                                    </a>
		                                    </td>
		                                    <td>
		                                    	<fmt:formatNumber value="${vo.pricePayment}" type="number"/> 원
		                                    </td>
		                                    <td class="d-flex justify-content-between">
		                                    	<div class="">
		                                    		${vo.optionChoosed}
		                                    	</div>
		                                    	<div class="text-right">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#ced4da" class="bi bi-caret-right-fill" viewBox="0 0 16 16">
														<path d="m12.14 8.753-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z"/>
													</svg>
		                                    	</div>
		                                    </td>
		                                </tr>
	                                </c:forEach>
	                            </tbody>
	                        </table>
	                    </div>
					</div>
					<div class="row	 d-flex justify-content-center">
						<nav aria-label="Page navigation">
							<ul class="pagination justify-content-center">
								<li class="page-item disabled">
									<a class="page-link">Previous</a>
								</li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item">
									<a class="page-link" href="#">Next</a>
								</li>
							</ul>
						</nav>	                    
					</div>
				</div>
			</div>
		</div>
	</div>
  	<jsp:include page="/include/footer.jsp"/>
</body>
</html>