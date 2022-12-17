<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>title</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
    <style>
       body,h1,h2,h3,h4,span,div,strong {
           font-family: 'Helvetica', 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
           text-decoration: none !important;
       }

       .summary_content {
           border: 1px solid #80B918;
       }

       .total_amount {
           background-color: #80B918;
           color: #fff;
       }

       .summary_top {
           color: #55a630;
       }

       .cart_tab {
           border: 1px solid #adb5bd;
       }

       .cart_nav {
           border-bottom: 1px solid #adb5bd;
           background-color: #fff;
       }

       .cart_content {
           border-bottom: 1px solid #adb5bd;

       }
      	ul, li{
			list-style:none;
			padding:0px;
			margin:0px;
		}
		.rate-wrap{
			display: table;
		}
		.rate-wrap span{
			display: table-cell;
		}
   </style>
</head>
<body>
    <jsp:include page="/include/nav.jsp"/>
    <div class="container mt-3">
		<form name="wishForm" id="wishForm" method="post" action="${ctp}/checkout.member">
        <div class="h4 font-weight-bold">카트</div>
        <div class="row">
            <div class="col-8">
                <div class="cart_tab">
                    <div class="container mt-2 mb-2">
                        <div class="cart_nav d-flex align-content-center justify-content-between sticky-top pt-3 pb-3">
                            <div class="d-flex align-content-center justify-content-center">
                                <input type="checkbox" name="checkBookAll" id="checkBookAll" checked/>
                                <label for ="checkBookAll">
	                                <span class="">&nbsp; 전체 선택</span>
                                </label>
                            </div>
                            <button class="btn btn-outline-success btn-sm" type="button" onclick="deleteChoiceBook()">선택 삭제</button>
                        </div>
                       	<c:if test="${vos == '[]'}">
                       		<div class="text-center p-5">
								<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" fill="adb5bd" class="bi bi-cart-x" viewBox="0 0 16 16">
								  <path d="M7.354 5.646a.5.5 0 1 0-.708.708L7.793 7.5 6.646 8.646a.5.5 0 1 0 .708.708L8.5 8.207l1.146 1.147a.5.5 0 0 0 .708-.708L9.207 7.5l1.147-1.146a.5.5 0 0 0-.708-.708L8.5 6.793 7.354 5.646z"/>
								  <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
								</svg>
                       			<p class="mt-2">장바구니에 담긴 상품이 없습니다.</p>
                       		</div>
                       	</c:if>
                        <c:forEach var="vo" items="${vos}">
	                        <div class="cart_content d-flex">
		                            <div class="d-flex mb-3">
		                            	<div class="col-1 d-flex align-items-center">
		                                    <input type="checkbox" name="checkBook" id="${vo.idxProduct}" value="${vo.idxProduct}"/>
		                            		<input type="hidden" value="${vo.idxProduct}" name="idxProduct" class="idxProduct"/>
		                            		<input type="hidden" value="${vo.priceEbook}" name="priceEbook" class="priceEbook"/>
		                            		<input type="hidden" value="${vo.rateDiscount}" name="rateDiscount" class="rateDiscount"/>
		                            	</div>
		                                <div class="col-2 d-flex mr-3 p-0">
		                                	<a href="${ctp}/booksearch.bi?isbn=${vo.isbn}">
			                                    <img src="${ctp}/data/books/${vo.imgSaved}" alt="도서 ${vo.title}의 표지" width="100%" height="100%" class="img-thumbnail"/>
		                                	</a>
		                                </div>
		                                <div class="col">
		                                    <div class="row">
		                                        <div class="col">
		                                            <div class="row d-flex flex-column flex-nowrap">
		                                                <div class="col">
		                                                    <h3 class="h5 font-weight-bold">${vo.title}</h3>
		                                                    <p>${vo.nameAuthor}</p>
		                                                </div>
		                                            </div>
		                                        </div>
		                                        <div class="col-2 d-flex flex-column flex-nowrap text-right align-items-center">
		                                        	<ul>
		                                        		<li>
				                                            <div class="col" style="color:#cccccc">
				                                            	 <del><fmt:formatNumber value="${vo.priceEbook}"/></del>
				                                            </div>
		                                        		</li>
		                                        		<li class="d-flex">
				                                            <div class="col d-flex rate-wrap">
				                                            	 <span class="text-danger">${vo.rateDiscount}%&#129059;</span>
				                                            	 <span class="h5 font-weight-bold" style="color:#28a745">
				                                            	 	<fmt:formatNumber value="${vo.priceCalculated}"/>
				                                            	 </span>
				                                            </div>
		                                        		</li>
		                                        	</ul>
		                                        </div>
		                                    </div>
		                                    <div class="row">
		                                        <button class="btn btn-success pl-5 pr-5 btn-sm delete-btn" type="button" onclick="deletebook(this.value)" value="${vo.idxProduct}">삭제</button>
		                                    </div>
		                                </div>
		                            </div>
                        		</div>
                       	</c:forEach>
                    </div>
                </div>
            </div>
	            <div class="col-4">
	                <div class="summary_box sticky-top">
	                     <div class="summary_content">
	                        <div class="summary_top pl-2 pr-2 pt-2">
	                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#55a630"
	                                class="bi bi-info-circle-fill" viewBox="0 0 16 16">
	                                <path
	                                    d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
	                            </svg>
	                            <strong>0개</strong>를 선택하셨습니다.
	                        </div>
	                        <div class="d-flex flex-row flex-wrap">
	                            <div class="d-flex justify-content-between pl-2 pr-2 pt-2" style="width: 100%;">
	                                <div class="">총 주문 금액</div>
	                                <div class=" d-inline-block text-right ">
	                                	<span class="total-order-price"><b></b></span>
	                                </div>
	                            </div>
	                            <div class="d-flex justify-content-between pl-2 pr-2 pt-2 pb-4" style="width: 100%;">
	                                <div class="">할인 금액</div>
	                                <div class=" d-inline-block text-right">
	                                	<b class="sales-price"></b>
	                                </div>
	                            </div>
	                            <div class="d-flex justify-content-between total_amount pl-2 pr-2 pt-3 pb-3"
	                                style="width: 100%;">
	                                <div class="">합계</div>
	                                <div class="d-inline-block text-right h5 font-weight-bold">155,000원</div>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="mt-2" style="width:100%">
	                        <button class="btn btn-lg btn-success p-4 font-weight-bold" style="width:100%" type="button" onclick="orderBook()">구매하여 소장하기</button>
	                    </div>
	                </div>
	            </div>
			</div>
    	</form>
    </div>
    <jsp:include page="/include/footer.jsp"/>
</body>
</html>