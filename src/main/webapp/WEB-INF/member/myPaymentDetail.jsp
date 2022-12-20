<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<style>
	.payment-detail tr th{
		background-color:#454d5;
	}
</style>
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
	                        <table class="table">
	                        	<colgroup><col style="width:20%;"><col style="width:auto;"></colgroup>
	                        	<tbody class="payment-detail">
	                                <tr>
	                                	<th bgcolor="ced4da">주문번호</th>
	                                	<td>${orderVO.orderNo}</td>
	                                </tr>
	                                <tr>
	                                	<th bgcolor="ced4da">구분</th>
	                                	<td>
	                                		<c:forEach var="vo" items="${bookVOS}">
	                                			<a href="${ctp}/booksearch.bi?isbn=${vo.isbn}">${vo.title}</a> <br/>
	                                		</c:forEach>
	                                	</td>
	                                </tr>
	                                <tr>
	                                	<th bgcolor="ced4da">주문금액</th>
	                                	<td>
	                                		<fmt:formatNumber value="${orderVO.priceOrder}" type="number"/> 원
	                                	</td>
	                                </tr>
	                                <tr>
	                                	<th bgcolor="ced4da">할인금액</th>
	                                	<td>
	                                		<fmt:formatNumber value="${orderVO.priceSales}" type="number"/> 원
	                                	</td>
	                                </tr>
	                                <tr>
	                                	<th bgcolor="ced4da">포인트 사용금액</th>
	                                	<td>
	                                		<fmt:formatNumber value="${orderVO.pricePointUsed}" type="number"/> 원
	                                	</td>
	                                </tr>
	                                <tr>
	                                	<th bgcolor="ced4da">결제금액</th>
	                                	<td>
	                                		<fmt:formatNumber value="${orderVO.pricePayment}" type="number"/> 원
	                                	</td>
	                                </tr>
	                                <tr>
	                                	<th bgcolor="ced4da">결제수단</th>
	                                	<td>${orderVO.optionChoosed}</td>
	                                </tr>
	                                <tr>
	                                	<th bgcolor="ced4da">적립 포인트</th>
	                                	<td>
	                                		<fmt:formatNumber value="${orderVO.pointEarned}" type="number"/> 원
	                                	</td>
	                                </tr>
	                                <tr>
	                                	<th bgcolor="ced4da">구매일자</th>
	                                	<td>${fn:substring(orderVO.datePurchased, 0, 16)} 분</td>
	                                </tr>
	                        	</tbody>
	                        </table>
	                    </div>
					</div>
				</div>
			</div>
		</div>
	</div>
  	<jsp:include page="/include/footer.jsp"/>
</body>
</html>