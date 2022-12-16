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
	<script>
		$(document).ready(function(){
			$.ajax({
				
			});
			$("#checkDeleteAll").click(function(){
				if($("#checkDeleteAll").is(":checked")){
					$("input[name=checkDelete]").prop("checked", true);
				}
				else{
					$("input[name=checkDelete]").prop("checked", false);
				}
			});
			 $('input:checkbox[name="checkDelete"]').each(function() {
			     if(this.checked == false){
			            this.checked = true; 
			            $('input:checkbox[name="checkDeleteAll"]').checked=true;
			      }
			 });
		});
		$('input:checkbox[name="checkDelete"]').click(function(){
			let checkLength = $('input:checkbox[name="checkDelete"]').length;
			let checkedCount = $('input:checkbox[name="checkDelete"]:checked').length;
			console.log(checkLength);
			console.log(checkedCount);
		});
		
	</script>
    <style>
       body,
       h1,
       h2,
       h3,
       h4,
       span,
       div,
       strong {
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
        <div class="h4 font-weight-bold">카트</div>
        <div class="row">
            <div class="col-8">
                <div class="cart_tab">
                    <div class="container mt-2 mb-2">
                        <div class="cart_nav d-flex align-content-center justify-content-between sticky-top pt-3 pb-3">
                            <div class="d-flex align-content-center justify-content-center">
                                <input type="checkbox" name="checkDeleteAll" id="checkDeleteAll" checked/>
                                <label for ="checkDeleteAll">
	                                <span class="">&nbsp; 전체 선택</span>
                                </label>
                            </div>
                            <button class="btn btn-outline-success btn-sm">선택 삭제</button>
                        </div>
                        <c:forEach var="vo" items="${vos}">
	                        <div class="cart_content d-flex">
	                            <div class="d-flex mb-3">
	                            	<div class="col-1 d-flex align-items-center">
	                                    <input type="checkbox" name="checkDelete" id="${vo.isbn}" />
	                            	</div>
	                                <div class="col-2 d-flex mr-3 p-0">
	                                    <img src="${ctp}/data/books/${vo.imgSaved}" alt="도서 ${vo.title}의 표지" width="100%" height="100%" class="img-thumbnail"/>
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
	                                        <button class="btn btn-success pl-5 pr-5 btn-sm">삭제</button>
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
                                <div class=" d-inline-block text-right ">10,000원</div>
                            </div>
                            <div class="d-flex justify-content-between pl-2 pr-2 pt-2 pb-4" style="width: 100%;">
                                <div class="">할인 금액</div>
                                <div class=" d-inline-block text-right">5,000원</div>
                            </div>
                            <div class="d-flex justify-content-between total_amount pl-2 pr-2 pt-3 pb-3"
                                style="width: 100%;">
                                <div class="">합계</div>
                                <div class="d-inline-block text-right h5 font-weight-bold">155,000원</div>
                            </div>
                        </div>
                    </div>
                    <div class="mt-2" style="width:100%">
                        <button class="btn btn-lg btn-success p-4 font-weight-bold" style="width:100%">구매하여 소장하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>