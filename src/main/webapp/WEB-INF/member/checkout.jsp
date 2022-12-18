<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
	<script>
		$(document).ready(function(){
			$("#point-amount-input").blur(function(){
				const regPoint = /[^0-9]/g;
				let point = $('#point-amount-input').val();
				let pointChanged = point.replaceAll(regPoint, '');
					
				if(pointChanged>${point}){
					$('#point-amount-input').val(${point});
					
					let priceCaltTot = ${priceCalcTot};
					priceCaltTot = ${priceCalcTot} - ${point};
					priceCaltTot=priceCaltTot.toLocaleString();
					$('#price-tot-demo').html(priceCaltTot);
					return;
				}
				let priceCaltTot = ${priceCalcTot};
				priceCaltTot = ${priceCalcTot} - pointChanged;
				priceCaltTot=priceCaltTot.toLocaleString();
				$('#point-amount-input').val(pointChanged);
				$('#price-tot-demo').html(priceCaltTot);
			});
			
			$('.payment-btn').click(function() {
				/* 약관 동의 했는지 체크 */
				const isChecked = $("#agree-terms").is(":checked");
				if(isChecked == false){
					alert("약관에 동의해야 구매할 수 있습니다.");
					return false;
				}
				
				let point = $("#point-amount-input").val();
				
				if(point == ""){
					point = 0;
				}
				
				let check = $('.methodChoice').is(':checked');
				
				if(check==false){
					alert('비정상적인 접근입니다!');
					location.reload();
					return false;
				}
				
				let method = $('input[name=paymentMethod]:checked').val();
				
				/* 동적 폼 생성 */
				let orderForm = $('<form></form>');
				orderForm.attr("name", "orderForm");
				orderForm.attr("method", "post");
				orderForm.attr("action", "${ctp}/orderBook.member");
				
				/* 히든 태그에 사용한 포인트와, 도서 상품 idx를 넘긴다 */
				orderForm.append($("<input/>", {type: 'hidden', name:'priceTot', value:${priceEbookTot}}));
				orderForm.append($("<input/>", {type: 'hidden', name:'priceSalesTot', value:${priceSalesTot}}));
				orderForm.append($("<input/>", {type: 'hidden', name:'point', value:point}));
				orderForm.append($("<input/>", {type: 'hidden', name:'paymentMethod', value:method}));
				
				$("input[name=idxProduct]").each(function(){
					let idxProduct = $(this).val();
					orderForm.append($("<input/>", {type: 'hidden', name:'idxProduct', value:idxProduct}));
				})
				
				/* 바디에 폼태그를 넣는다 */
				orderForm.appendTo('body');
				orderForm.submit();
			});
		});
	</script>
	<style>
		body,h1,h2,h3,h4,span,div,strong {
		    font-family: 'Helvetica', 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
		    text-decoration: none !important;
		}
		
		.order_nav {
		    border-bottom: 1px solid #adb5bd;
		}
		
		.order_content {
		    border-bottom: 1px solid #adb5bd;
		
		}
		ul, li{
		  list-style:none;
		  padding:0px;
		  margin:0px;
		}
		.order-info-box{
		  border: 1px solid #007f5f;
		  width: 100%;
		}
		.order-cont{
		  border-bottom: 1px solid #adb5bd;
		  padding-top: 1rem;
		  padding-bottom: 1rem;
		}
		.total-price{
		  background-color: #80b918;
		  color: #fff;
		  padding: 1rem;
		}
		.payment-cont{
		  padding-top: 0.3rem;
		  padding-left: 0.5rem;
		}
		.methodChoice{
		  width: 1rem;
		  height: 1rem;
		}
		.pay-agreement li{
		  font-size: 0.9rem;
		  list-style: square;
		}
		.point-input{
		  border: 1px solid #adb5bd;
		  padding: 0.5rem;
		  border-radius: 5px;
		}
		.point-input input{
		  text-align: right;
		  border: 0px;
		}
		.point-input input:focus{
		  text-align: right;
		  outline: 0px;
		}
		.checkoutlist{
			border-bottom: 1px solid #adb5bd; ;
			padding:5px;
		}
	</style>				
</head>
<body>
  <jsp:include page="/include/nav.jsp"/>
  <div class="container order-wrap mt-3">
    <div class="row">
      <div class="col">
        <nav class="order_nav d-flex">
          <h5 class="font-weight-bold">주문 목록</h5>
          <span class="font-weight-bolder pl-1">${cnt}</span>
        </nav>

          <c:forEach var="vo" items="${vos}">
			<ul class="d-flex checkoutlist mb-3" style="width:100%">
	          <li class="col-1 d-flex mr-3 p-0">
	            <a href="/green2209J_08/booksearch.bi?isbn=${vo.isbn}">
	              <img src="${ctp}/data/books/${vo.imgSaved}" alt="${vo.titleBook}의 표지" width="70px" height="70px"
	                class="img-thumbnail">
	            </a>

	          </li>
	          <li class="col d-flex align-items-center">
	            <div class="row" style="width:100%">
	              <div class="col">
	                <div class="row d-flex flex-column flex-nowrap">
	                  <div class="col">
	                    <h3 class="h5 font-weight-bold">${vo.titleBook}</h3>
	                    <p>${vo.nameAuthor}</p>
	                  </div>
	                </div>
	              </div>
	              <div class="col-2 d-flex flex-column flex-nowrap text-right align-items-center">
	                <ul>
	                  <li>
	                    <div class="col" style="color:#cccccc">
	                      <del>${vo.priceEbook}</del>
	                    </div>
	                  </li>
	                  <li class="d-flex">
	                    <div class="col d-flex rate-wrap">
	                      <span class="text-danger">${vo.rateDiscount}%&#8595;</span>
	                      <span class="h5 font-weight-bold" style="color:#28a745">
	                        ${vo.priceCalculated}
	                        <input type="hidden" name="idxProduct" value="${vo.idxProduct}"/>
	                        <input type="hidden" name="idxBook" value="${vo.idxBook}"/>
	                      </span>
	                    </div>
	                  </li>
	                </ul>
	              </div>
	            </div>
	          </li>
	       </ul>
		</c:forEach>
      </div>
      <div class="col-4">
        <div class="summary_box">
          <div class="summary_content">
            <div class="d-flex flex-row flex-wrap">
              <ul class="order-info-box">
                <li class="order-cont d-flex">
                  <div class="col">
                    총 주문금액
                  </div>
                  <div class="col text-right">
                  	<b><fmt:formatNumber value="${priceEbookTot}" pattern="#,###" /> 원</b>
                  </div>
                </li>
                <li class="order-cont d-flex">
                  <div class="col">
                    할인 금액
                  </div>
                  <div class="col text-right">
                  	<b><fmt:formatNumber value="${priceSalesTot}" pattern="#,###" /> 원</b>
                  </div>
                </li>
                <li class="order-cont">
                  <div class="d-flex align-items-center">
                    <div class="col">
                      포인트 사용
                    </div>
                    <div class="col text-right">
                      <div class="point-input d-flex">
                        <input type="text" name="pointAmount" id="point-amount-input"/>
						원
                      </div>
                    </div>
                  </div>
                  <div class="text-center mt-2">
                    현재 보유 중인 포인트는?
                    <strong>
                    	<fmt:formatNumber value="${point}" pattern="#,###"/>
	                    원
                    </strong>
                  </div>
                </li>
                <li class="order-cont d-flex">
                  <div class="col">
                    포인트 적립 예상 금액
                  </div>
                  <div class="col text-right">
                  	<b><fmt:formatNumber value="${pointExpected}" pattern="#,###" /></b> 원
                  </div>
                </li>
                <li class="order-cont text-center total-price">
                  <span class="h5 font-weight-bold ">총 결제금액</span>
                  <span class="h4 font-weight-bold ">
                  	<b>
                  		<span id="price-tot-demo">
		                  	<fmt:formatNumber value="${priceCalcTot}" pattern="#,###" />
                  		</span>
                  	</b> 원
                  </span>
                </li>
              </ul>
              <ul class="order-info-box payment-method">
                <li class="payment-method">
                  <div class="payment-cont">
                    결제 수단
                  </div>
                </li>
                <li>
                  <div class="payment-cont d-flex align-items-center">
                    <input type="radio" name="paymentMethod" id="paymentCard" class="methodChoice mr-1" value="card"checked />
                    <label for="paymentCard">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-credit-card-2-back-fill" viewBox="0 0 16 16">
                        <path
                          d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v5H0V4zm11.5 1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h2a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-2zM0 11v1a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-1H0z" />
                      </svg>
                      <span>
                        카드 결제
                      </span>
                    </label>
                  </div>
                </li>
                <li>
                  <div class="payment-cont d-flex align-items-center">
                    <input type="radio" name="paymentMethod" id="paymentCash" class="methodChoice mr-1" value="cash">
                    <label for="paymentCash">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-cash-stack" viewBox="0 0 16 16">
                        <path d="M1 3a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1H1zm7 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4z" />
                        <path
                          d="M0 5a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V5zm3 0a2 2 0 0 1-2 2v4a2 2 0 0 1 2 2h10a2 2 0 0 1 2-2V7a2 2 0 0 1-2-2H3z" />
                      </svg>
                      무통장 입금
                    </label>
                  </div>
                </li>
              </ul>
              <ul class="mt-4">
                <li>
                  <h4>구매동의</h4>
                  <div class="agree d-flex align-items-center">
                    <div class="col-1">
                      <input type="checkbox" name="agreeTerms" id="agree-terms">
                    </div>
                    <div class="col">
	              	  <label for="agree-terms">
                        <strong class="font-weight-normal">
                        상품, 가격, 할인 정보, 유의 사항 등을 확인하였으며 구매에 동의합니다.
                        </strong>
	              	  </label>
                    </div>
                  </div>
                  <button class="btn btn-lg btn-success p-2 font-weight-bold payment-btn" style="width:100%" type="button"
                    >결제 하기</button>
                </li>
              </ul>
              <ul class="pay-agreement">
	                <li>결제 취소는 결제일로부터 7일 이내에만 할 수 있습니다.</li>
	                <li>다운로드하거나 (다운로드 시작 포함) 스트리밍으로 이용한 책은 구매 취소하거나 환불받을 수 없습니다.</li>
	                <li>미성년자의 경우 결제 시 법정대리인의 동의가 필요하며, 이에 따라 법정대리인의 동의를 받았음을 확인합니다.</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  <jsp:include page="/include/footer.jsp"/>
  </div>
</body>
</html>