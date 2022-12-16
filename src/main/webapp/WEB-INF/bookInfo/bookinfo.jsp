<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
	<script>
		let getAuthorDetailView = (idxAuthor) => {
			let idx = idxAuthor;
	    	$.ajax({
	    		type   : "post",
	    		url    : "${ctp}/getAuthorAndBookInfo.bi",
	    		data : {idx:idx},
	    		success:function(data) {
 	    			let dataParsed = JSON.parse(data);
 	    			
 	    			let infoAuthor = "";
    				for(let i in dataParsed.author) {
						let nameAuthor = dataParsed.author[i].nameAuthor;
						let nationality = dataParsed.author[i].nationality;
						let birthday = dataParsed.author[i].birthday;
						let education = dataParsed.author[i].education;
						let awards = dataParsed.author[i].awards;
						
						infoAuthor = '<li><h3 class="p-1 font-weight-bold">'+nameAuthor+'</h3></li><li><span class="p-1">국적</span><span class="p-1">'+nationality+'</span></li>';
						
						if(birthday != '없음'){
							infoAuthor += '<li><span class="p-1">출생</span><span class="p-1">'+birthday+'</span></li>';
						}
						
						education=education.substring(0, education.lastIndexOf("/"));
						let educationSplited = education.split('/');
						infoAuthor+='<li><span class="p-1">학력</span><span class="p-1">';
						
						for(let j=0; j<educationSplited.length; j++){
							infoAuthor +=educationSplited[j]+'<br/>';
						}
						infoAuthor += '</span></li>';
						
						if(awards != '없음'){
							awards=awards.substring(0, awards.lastIndexOf("/"));
							let awardsSplited = awards.split('/');
							infoAuthor += '<li><span class="p-1">수상</span><span class="p-1">';
							for(let j=0; j<awardsSplited.length; j++){
								infoAuthor+=awardsSplited[j]+'<br/>';
							}
								
							infoAuthor += '</span></li>';
						}
    				
    				}
    				
					$(".author-info-detail").html(infoAuthor);
					
	    		},
	    		error : function() {
	    			alert("전송 오류!");
	    		}
	    		
	    	});
		}
		
	</script>
    <style>
    body,h1,h2,h3,h4,h5,h6,span,div,strong, a {
        font-family: 'Helvetica', 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
        text-decoration: none !important;
    }
    ul, li {
        list-style-type: none;
        padding:0px;
        margin:0px;
    }

    .btn-success{
        background-color: #aacc00;
        border: 0px;
        width: 100%;
        height: 100%;
    }
    .btn-success:hover{
        background-color: #80b918;
    }

    .btn-success:active{
        background-color: #80b918;
    }
    .info-button-wrap .list button{
        border: 1px solid #ced4da;
        border-radius: 6px;
        padding: 0.4rem;
    }
    .list .btn:hover{
        background-color: #eaeaea;
    }
    .info-table tr th {
        background-color: #eaeaea;
    }
    .book-info-box{
        border: 5px solid #ced4da;
        width: 100%;
        padding: 1rem;
    }
    .title-info{
        margin-top: 5rem;
        border-bottom: 3px solid #6c757d;
        width: 100%;
    }
    .star-rating {
        display:flex;
        flex-direction: row-reverse;
        font-size:1.5em;
        justify-content:center;
        padding:0 .2em;
        text-align:center;
    }

    .star-rating input {
        display:none;
    }

    .star-rating label {
        color:#ccc;
        cursor:pointer;
        font-size: 5rem;
    }

    .star-rating :checked ~ label {
        color:#f90;
    }

    .star-rating label:hover,
    .star-rating label:hover ~ label {
        color:#fc0;
    }
    .book-info{
        width: 100%;
    }
    textarea {
        background: rgba(192, 192, 192, 0.4);
        border: 0px;
    }
    textarea::placeholder {
        font-size: 1.5rem;
    }
    .review-comment{
        border-top: 1px solid #6c757d;
    }
    .review{
        border-bottom: 1px solid #6c757d;

    }
    .img-wrap{
    	position:relative;
    	width:100%;
    	height:100%;
    }
    .series_text{
    	width:100%;
    	padding: 1rem;
    	bottom: 25%;
    	display:block;
    	position:absolute;
    }
    .series_text{
    	color:#fff;
    	font-size:1rem;
    	background-color:#007f5f;
    }
    .author-category-wrap{
    	font-size:1rem;
    	border-bottom: 1px solid #ced4da;
    	padding:0.5rem;
    }
    .author-profile-box{
    	border-right: 1px solid #ced4da;
    }
    .author-info-detail li{
    	display:table;
    }
    .author-info-detail li span{
    	display:table-cell;
    }
    </style>
</head>
<body>
	<jsp:include page="../../include/nav.jsp"/>
    <div class="container">
        <div class="info-wrap">
            <div class="row">
                <div class="col-3">
                	<img src="${ctp}/data/books/${bookInfoVo.imgSavedBook}" alt="도서 ${bookInfoVo.titleBook}의 표지" class="img-thumbnail"/>
                </div>
                <div class="col">
                	<!-- 카테고리 -->
                    <div>
                    	 ${bookInfoVo.categoryMain} > 
                    	 <c:if test="${bookInfoVo.categoryMain eq '소설'}">
                    	 	${bookInfoVo.categoryNation} >
                    	 </c:if>
                    	 ${bookInfoVo.categorySub}
                    </div>
                    <div class="h3 font-weight-bold">${bookInfoVo.titleBook}</div>
                    <div>
                        <p>
                            ⭐4.5점 (862명)
                        </p>
                        <p>
                        	<c:forEach var="vo" items="${authorVos}">
                        		<c:if test="${vo.role == '작가'}">
		                            <span><b>${vo.nameAuthor}</b> 저</span>
                        		</c:if>
                        		<c:if test="${vo.role == '번역가'}">
		                            <span><b>${vo.nameAuthor}</b> 역</span>
                        		</c:if>
                        	</c:forEach>
	                        <div>${bookInfoVo.publisher} 출판</div>
                        </p>
                    </div>
                    <table width="100%" class="info-table border-top">
                        <tr>
                            <th rowspan="3" class="background text-center pt-4 pb-4 pl-3 pr-3">소장</th>
                            <c:if test="${bookInfoVo.pricePaper!='없음'}">
	                            <td>종이책 정가</td>
	                            <td><fmt:formatNumber value=" fmt:${bookInfoVo.pricePaper}" pattern="#,###"/>원</td>
                            </c:if>
                        </tr>
                        <tr>
                            <td>전자책 정가</td>
                            <td><fmt:formatNumber value="${bookInfoVo.priceEbook}" pattern="#,###"/>원</td>
                        </tr>
                        <tr class="border-bottom">
                            <td>전자책 판매가</td>
                            <td>
                            	<fmt:formatNumber value="${bookInfoVo.priceCalculated}" pattern="#,###"/>원
                            	<span class="badge badge-danger"><b>${bookInfoVo.rateDiscount}% 할인!</b></span>
                            </td>
                        </tr>
                        <tr>
                        	<td colspan="3">
				                <ul class="d-flex float-right info-button-wrap mt-2">
			                    	<li class="mr-2 list">
				                    	<c:if test="${bookInfoVo.hasWishlist eq 1}">
					                        <a href="${ctp}/removeWishlist.member?idxProduct=${bookInfoVo.idxProduct}&isbn=${bookInfoVo.isbn}&hasWishlist=${bookInfoVo.hasWishlist}" class="btn">
					                            <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="#d00000" class="bi bi-cart-fill" viewBox="0 0 16 16">
					                                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
					                            </svg>
					                        </a>
				                    	</c:if>
				                    	<c:if test="${bookInfoVo.hasWishlist eq 0}">
					                        <a href="${ctp}/addWishlist.member?idxProduct=${bookInfoVo.idxProduct}&isbn=${bookInfoVo.isbn}&hasWishlist=${bookInfoVo.hasWishlist}" class="btn">
					                            <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="#212529" class="bi bi-cart-fill" viewBox="0 0 16 16">
					                                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
					                            </svg>
					                        </a>
				                    	</c:if>
				                        </li>
				                    <li class="mr-2">
				                        <button class="btn btn-success">단품 소장하기</button>
				                    </li>
				                    <c:if test="${bookInfoVo.idxProductSeries!=1}">
				                    <li>
				                        <button class="btn btn-success">시리즈로 소장하기</button>
				                    </li>
				                    </c:if>
				                </ul>
                        		
                        	</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row d-flex justify-content-start">
            </div>
			<div class="book-info-box d-flex align-items-center mt-3">
				<ul class="d-flex flex-column">
					<li>
						<b>출간 정보</b>
						<span>${bookInfoVo.datePublishing}</span>
					</li>
					<li>
						<b>ISBN</b>
						<span>${bookInfoVo.isbn}</span>
					</li>
					<li>
						<b>듣기 가능 여부</b> 
						<span>
							<i class="fa-sharp fa-solid fa-headphones-simple"></i>
							<c:if test="${bookInfoVo.canReader == 0}">
								<span class="font-weight-bold text-warning">듣기 불가</span>
							</c:if>
							<c:if test="${bookInfoVo.canReader == 1}">
								<span class="font-weight-bold text-info">듣기 가능</span>
							</c:if>
						</span>
					</li>
				</ul>
			</div>
            <c:if test="${bookInfoVo.idxProductSeries!=1}">
				<div class="row mt-3">
	                <div class="title-info">
	                    <h4 class="h4 font-weight-bold">이 책의 시리즈</h4>
	                </div>
		                <div class="book-info float-left">
		                	<div class="img-series" style="width:150px">
		                		<div class="img-wrap">
				                	<img src="${ctp}/data/books/${bookInfoVo.imgSavedSeries}" alt="시리즈 ${bookInfoVo.titleSeries}의 표지" class="img-thumbnail"/>
		                			<span class="series_text badge">시리즈 상품</span>
		                		</div>
		                		<div>${bookInfoVo.titleSeries}</div>
		                		<div>
		                			소장
		                			<span class="text-primary">
		                				<b><fmt:formatNumber value="${bookInfoVo.priceSeries}" pattern="#,###"/>원</b>
		               				</span>
		           				</div>
		                	</div>
		                </div>
	            	</div>
	            <div class="row mt-3">
	                <div class="title-info">
	                    <h4 class="h4 font-weight-bold">시리즈에 포함된 상품</h4>
	                </div>
	                <div class="book-info-series d-flex flex-row">
	                	<c:forEach var="vo" items="${seriesVos}" varStatus="st">
		                	<div class="img-series" style="width:150px">
		                		<a href="${ctp}/booksearch.bi?isbn=${vo.isbn}">
			                		<div class="img-wrap-series">
					                	<img src="${ctp}/data/books/${vo.imgSavedBook}" alt="시리즈 ${vo.titleBook}의 표지" class="img-thumbnail"/>
			                		</div>
		                		</a>
		                		<div>${vo.titleBook}</div>
		                	</div>
	                	</c:forEach>
	                </div>
	            </div>
            </c:if>
            
            <div class="row mt-3">
                <div class="title-info">
                    <h4 class="h4 font-weight-bold">작품 소개</h4>
                </div>
                <div class="book-info">
                	${bookInfoVo.textIntroduce}
                </div>
            </div>
            <div class="row">
                <div class="title-info">
                    <h4 class="h4 font-weight-bold">저자 프로필&nbsp</h4>
                </div>
                <div class="book-info">
                	<div>
	                    <ul class="d-flex author-category-wrap p-2">
		                   	<li class="author-profile-box">
		                   		<ul class="d-flex align-items-center">
		                    	<c:forEach var="vo" items="${authorVos}" varStatus="st">
		                    		<c:if test="${vo.role == '작가'}">
				                    	<span class="font-weight-bold mr-1">저자&nbsp</span>
			    	               			<li>
			    	               				<a href='javascript:void(0);' onclick="getAuthorDetailView(${vo.idx})">
					    	                		<span>${vo.nameAuthor}&nbsp</span>
					    	                		<input type="hidden" value="${vo.idx}" id="a${st.count}"/>
			    	               				</a>
			        	           			</li>
			                    		</c:if>
			                    	</c:forEach>
		                   		</ul>
		                   	</li>
		                   	<li>
		                   		<ul class="d-flex align-items-center">
			                    	<c:forEach var="vo" items="${authorVos}">
			                    		<c:if test="${vo.role == '번역가'}">
					                    	<span class="font-weight-bold ml-1">번역가&nbsp</span>
			    	               			<li>
			    	               				<a href='javascript:void(0);' onclick="getAuthorDetailView(${vo.idx})">
				    	                			<span>${vo.nameAuthor}&nbsp</span>
				    	                			<input type="hidden" value="${vo.idx}"/>
			    	                			</a>
			        	           			</li>
			                    		</c:if>
			                    	</c:forEach>
		                   		</ul>
	                  		</li>
	                    </ul>
	                  		
               			<ul class="author-info-detail">
               			<c:forEach var="vo" items="${authorVos}">
               				<c:if test="${vo.authorOrdinal == 0}">
               					<li>
               						<h3 class="p-1 font-weight-bold">${vo.nameAuthor }</h3>
               					</li>
               					<li>
               						<span class="p-1">국적</span>
               						<span class="p-1">${vo.nationality}</span>
               					</li>
               					<li>
               						<span class="p-1">출생</span>
               						<span class="p-1">${vo.birthday}</span>
               					</li>
               					<li>
               						<span class="p-1">학력</span>
               						<span class="p-1">
	               						<c:set var="educations" value="${fn:split(vo.education,'/')}"/>
	               						<c:forEach var="education" items="${educations}">
	               							${education}<br/>
	               						</c:forEach>
               						</span>
               					</li>
               					<li>
               						<span class="p-1">수상</span>
               						<span class="p-1">
	               						<c:set var="awards" value="${fn:split(vo.awards,'/')}"/>
	               						<c:forEach var="award" items="${awards}">
	               							${award}<br/>
	               						</c:forEach>
               						</span>
               					</li>
               				</c:if>
               			</c:forEach>
               			</ul>
	                  		
					</div>
                </div>
            </div>
            <div class="row">
                <div class="title-info">
                    <h4 class="h4 font-weight-bold">저자 소개</h4>
                </div>
				<div>
					<c:forEach var="vo" items="${authorVos}">
						<p>
							<h5 class="h5 font-weight-bold">${vo.nameAuthor}</h5>
							${vo.introduceText}
						</p>
					</c:forEach>
				</div>
			</div>

            <div class="row">
                <div class="title-info">
                    <span class="h4 font-weight-bold">리뷰</span>
                </div>
                <div class="col">
                    <div class="book-info">
                        <div class="rating-res h4 text-center">
                            <span class="badge badge-warning star-comment">이 책을 평가해주세요!</span>
                        </div>
                        <div class="star-rating">
                            <input type="radio" id="5-stars" name="rating" value="5" />
                            <label for="5-stars" class="star">&#9733;</label>
                            <input type="radio" id="4-stars" name="rating" value="4" />
                            <label for="4-stars" class="star">&#9733;</label>
                            <input type="radio" id="3-stars" name="rating" value="3" />
                            <label for="3-stars" class="star">&#9733;</label>
                            <input type="radio" id="2-stars" name="rating" value="2" />
                            <label for="2-stars" class="star">&#9733;</label>
                            <input type="radio" id="1-star" name="rating" value="1" />
                            <label for="1-star" class="star">&#9733;</label>
                        </div>
                    </div>
                </div>
                <div class="col mt-2">
                    <div class="row">
                        <textarea row="5" style="width:100%; height: 15vh;" placeholder="리뷰작성 시 광고, 욕설, 타인을 비방하는 문구를 작성하면 비공개될 수 있습니다."></textarea>
                        <div class="d-flex justify-content-end align-items-center" style="width:100%">
                            <input type="checkbox" name="spoilerCheck" id=""> 스포일러가 있어요
                            <button class="btn btn-dark p-2 ml-3">리뷰 남기기</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row d-flex justify-content-between mt-3 title-info">
                <ul class="d-flex h5 font-weight-bold">
                    <li>구매자 &nbsp</li>
                    <li>전체</li>
                </ul>
                <ul class="d-flex h6 font-weight-bold">
                    <li>최신순 &nbsp</li>
                    <li>공감순 &nbsp</li>
                    <li>별점 높은순 &nbsp</li>
                    <li>별점 낮은순 &nbsp</li>
                </ul>
            </div>
            <div class="row review">
                <div class="col-2">
                    <div>⭐⭐⭐⭐⭐</div>
                    <div>
                        <span>jay********</span>
                        <span class="badge badge-danger">구매자</span>
                    </div>
                    <div>2022.12.15</div>
                    <div><span class="badge badge-warning">신고하기</span></div>
                </div>
                <div class="col">
                    영화만 보다 전자책 개정판 전편 세일로 구매했어요. 원서는 1편이 있는데, 전자책 다 읽고 비교하며 또 보려고요. 번역 자체가 얼마나 큰 작업인지 알기에, 그저 감사할 뿐입니다. 역시 문장을 곱씹으며 상상할 수 있는 독해가 재미있습니다. 말이 10대 초반의 꼬맹이들이지 하는 행동과 지능은 고딩 이상이어서 혼자 막 웃으면서 귀엽다를 연발합니다. 원작자의 세상을 보는 넓은 혜안과 탐구력에 입이 다물어지지 않습니다.
                    <div class="d-flex justify-content-end">
                        <button class="btn btn-outline-dark mr-2">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-fill" viewBox="0 0 16 16">
                                <path d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9.06 9.06 0 0 0 8 15z"/>
                            </svg>
                            댓글
                        </button>
                        <button class="btn btn-outline-dark">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
                                <path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"/>
                            </svg>
                            좋아요
                            <span>0</span>
                        </button>
                    </div>
                    <div class="row review-comment">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Impedit sit nesciunt voluptatum voluptatibus at nobis facere, facilis, et sapiente laborum officia obcaecati repellendus ad labore deleniti provident velit delectus non.
                        Vitae qui minima optio recusandae deserunt! Ut autem tenetur consequuntur animi velit cumque dolores quas ratione praesentium molestias, doloremque ea laboriosam dolore possimus, quidem ab omnis mollitia rerum laborum. Minus!
                        Consequuntur nisi nesciunt maxime illum earum magni id, a accusamus voluptates quos eius ea sapiente facere corrupti, quod nobis perferendis error. Hic impedit quo magnam error sequi harum architecto illum?
                        Repellat magnam, consequatur repudiandae fugiat recusandae rerum delectus vero, ut fuga praesentium architecto soluta eum eaque commodi ex culpa officiis, deserunt quae voluptas. Odit fugit officiis laborum minus voluptas labore.
                        Corrupti, atque molestias corporis nostrum a, at dolore quibusdam ab omnis iure adipisci cum fuga minus. Quas, eveniet? Quos veritatis nulla inventore distinctio, esse modi ipsam quas ipsum dolorem ullam!
                    </div>
                </div>
            </div>
        </div>

    </div>
    
   	<jsp:include page="../../include/footer.jsp"/>
</body>
</html>