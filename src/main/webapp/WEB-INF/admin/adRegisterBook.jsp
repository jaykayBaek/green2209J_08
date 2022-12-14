<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script>
	    $(function(){
	        $(".author_res_wrap").hide();
	        $(".author_input_wrap").hide();
	        $(".category_main").hide();
	        $(".category_nation").hide();
	        $(".category_sub").hide();
	        
		    $("#category_main").focus(function(){
		    	$(".category_main").show(200);
		    })
		    $("#category_nation").focus(function(){
		    	$(".category_nation").show(200);
		    })
		    $("#category_sub").focus(function(){
		    	$(".category_sub").show(200);
		    })
	    });
	    let searchAuthorName = () => {
    		let author = $("#search_author").val();
    		if(author.trim()==""){
    			$('.author_search_res').load(location.href+' .author_search_res');
    		}
 	    	$.ajax({
	    		type   : "post",
	    		url    : "${ctp}/getAuthorInfoByName.ad",
	    		data : {author:author},
	    		success:function(data) {
 	    			let dataParsed = JSON.parse(data);
 	    			
  	    			if(dataParsed.author.length==0){
	     				$('.author_search_res').load(location.href+' .author_search_res');
 	    			}
 	    			else{
						let divRes="";
						
	    				for(let i in dataParsed.author) {
	    					let idx = dataParsed.author[i].idx;
	    					let nameAuthor = dataParsed.author[i].nameAuthor;
	    					let role = dataParsed.author[i].role;
	    					let nationality = dataParsed.author[i].nationality;
	    					let birthday = dataParsed.author[i].birthday;
	    					divRes += '<div class="row border-bottom border-success"><div class="col">'+idx+'</div><div class="col">'+nameAuthor+'</div><div class="col">'+role+'</div><div class="col">'+nationality+'</div><div class="col">'+birthday+'</div></div>';
		    			 }
	    				$(".author_res_wrap").show(200);
	    				$(".author_search_res").html(`<div class="row border-bottom border-success"><div class="col">????????????</div><div class="col">??????</div><div class="col">??????</div><div class="col">??????</div><div class="col">????????????</div></div>`+divRes);
 	    			}
	    		},
	    		error : function() {
	    			alert("?????? ??????!");
	    		}
	    	});
	    }
    	let enrollBook = () => {
    		enrollBookForm.submit();
    	}
	    let author_idx_demo = "";
	    let enrollAuthorInBook = () => {
    		let authorInputed = $("#input_author").val();
    		if(authorInputed.trim()==""){
    			$('.author_input_wrap').load(location.href+' .author_search_res');
    			return;
    		}
 	    	$.ajax({
	    		type   : "post",
	    		url    : "${ctp}/getAuthorInfoByIdx.ad",
	    		data : {idx:authorInputed},
	    		success:function(data) {
 	    			let dataParsed = JSON.parse(data);
 	    			
  	    			if(dataParsed.author.length==0){
	     				$('.author_input_wrap').load(location.href+' .author_input_wrap');
	     				return;
 	    			}
 	    			else{
	    				for(let i in dataParsed.author) {
	    					let idx = dataParsed.author[i].idx;
	    					let nameAuthor = dataParsed.author[i].nameAuthor;
	    					let role = dataParsed.author[i].role;
	    					let nationality = dataParsed.author[i].nationality;
	    					let birthday = dataParsed.author[i].birthday;
	    					author_idx_demo += '<div class="row border-bottom border-success author_idx"><div class="col">'+idx+'</div><div class="col">'+nameAuthor+'</div><div class="col">'+role+'</div><div class="col">'+nationality+'</div><div class="col">'+birthday+'</div><input type="hidden" name="idxAuthor" value="'+idx+'"></div>';
		    			 }
	    				$(".author_input_wrap").show(200);
	    				$(".author_input_res").html(`<div class="row border-bottom border-success"><div class="col">????????????</div><div class="col">??????</div><div class="col">??????</div><div class="col">??????</div><div class="col">????????????</div></div>`+author_idx_demo);
 	    				
 	    			}
	    		},
	    		error : function() {
	    			alert("?????? ??????!");
	    		}
	    	});
	    }

	</script>
	<style>
           body,h1,h2,h3,h4,h5,h6,span,div,strong {
               font-family: 'Helvetica', 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
               text-decoration: none !important;
           }

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

<div class="container-fluid d-flex">
	<jsp:include page="/include/adNav.jsp" />
	<!-- ????????? ????????? -->
	<div class="col-10 d-flex flex-column mt-2">
		<!-- ????????? ???????????? ?????????(?????????, ?????????, ??????) -->
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
						<span>???????????????, ????????????</span>
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
					<!-- ?????? ?????? -->
					<div class="h2 font-weight-bold">?????? ??????</div>
					<div class="row d-flex flex-column">
						<div class="col">
							<div class="card shadow">
								<form name="enrollBookForm" method="post" action="${ctp}/setBookInfo.ad" enctype="multipart/form-data">
									<div class="card-body">
										<div class="book_input row mb-2">
											<div class="col-3 input_label">?????? ??????</div>
											<div class="col"><input type="text" name="title" id="title" /></div>
										</div>
										<div class="book_input row mb-2">
											<div class="col-3 input_label">?????????</div>
											<div class="col"><input type="text" name="publisher" id="publisher" /></div>
										</div>
										<div class="book_input row mb-2">
											<div class="col-3 input_label">?????? ??????(??????)</div>
											<div class="col"><input type="text" name="datePublishing" id="date_publishing" /></div>
										</div>
										<div class="book_input row mb-2">
											<div class="col-3 input_label">ISBN</div>
											<div class="col"><input type="text" name="isbn" id="isbn"/></div>
										</div>
										<div class="book_input row mb-2">
											<div class="col-3 input_label">?????? ?????? ??????</div>
											<div class="col"><textarea rows="15" style="width:100%" name="textContent"></textarea></div>
										</div>
										<div class="book_input row mb-2">
											<div class="col-3 input_label">????????????</div>
											<div class="col">
												<div class="row">
													<div class="col">
														<input type="text" class="" id="category_main" name="main" placeholder="?????? ???????????? ??????" />
													</div>
													<div class="col">
														<input type="text" class="" id="category_nation" name="nation" placeholder="????????? ?????? ?????? ??????" />
													</div>
													<div class="col">
														<input type="text" class="" id="category_sub" name="sub" placeholder="?????? ???????????? ??????" />
													</div>
												</div>
												<div class="row mt-2">
													<div class="col">
										    			<div class="alert alert-success category_main" role="alert">
									    					<div class="row">
									    						?????? | ??????/?????? | ??????/??????/?????? | ???????????? | ?????????/??? | ?????????/IT | ??????/?????? | ?????? ??????
									    					</div>
										    			</div>
													</div>
												</div>
												<div class="row mt-2">
													<div class="col">
										    			<div class="alert alert-success category_nation" role="alert">
									    					<div class="row">
									    						???????????? | ???????????? | ???????????? | ???????????? | ??????????????????
									    					</div>
										    			</div>
													</div>
												</div>
												<div class="row mt-2">
													<div class="col">
										    			<div class="alert alert-success category_sub" role="alert">
									    					<div class="row">
									    						?????? | ?????? ???????????????, ?????? ???????????????, ??????/????????????/?????????, SF??????, ?????? ????????????, ?????? ????????????, ?????? ????????????, ?????? ????????????, ?????? ????????????
									    						<br/><hr/>
									    						??????/?????? | ????????????, ????????????, ?????????/?????????, ?????????/??????/?????????, CEO/?????????
									    						<br/><hr/>
									    						??????/??????/?????? | ??????, ??????/??????, ??????/??????, ??????, ?????????/??????/?????????, CEO/?????????
									    						<br/><hr/>
									    						???????????? | ??????/????????????, ??????/??????/?????????, ??????/??????, ??????, ????????????
									    						<br/><hr/>
									    						?????????/??? | ?????????, ???
									    						<br/><hr/>
									    						?????????/IT | IT ????????????, ??????/???????????????, ?????????/??? ??????, IT?????????, IT ????????????
									    						<br/><hr/>
									    						??????/?????? | ??????/??????/??????, ??????/????????????, ??????/??????/??????, ?????????/?????????	
									    						<br/><hr/>
									    						???????????? | ????????????
									    					</div>
										    			</div>
													</div>
												</div>
											</div>
										</div>
										<div class="book_input row mb-2">
											<div class="col-3 input_label">?????? ??????</div>
											<div class="col mb-1">
												<div class="row">
													<div class="font-weight-bold ml-3 mr-3">
														??????/?????????/????????? ??? ??????
													</div>
													<div class="input-group">
														<input type="text" class="form-control"
															id="search_author" placeholder="????????? ?????? ?????? ?????????" />
														<div class="input-group-append">
															<button class="btn btn-success" type="button" id="search_btn"
																onclick="searchAuthorName()">????????????</button>
														</div>
													</div>
												</div>
												<div class="row mt-2">
													<div class="col">
														<div class="alert alert-success author_res_wrap" role="alert">
															<h4 class="alert-heading">?????? ?????? ??????</h4>
															<hr/>
															<div class="author_search_res"></div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="font-weight-bold ml-3 mr-3">
														??????/?????????/????????? ??? ??????
													</div>
													<form name="inputAuthorIdx">
														<div class="input-group">
															<input type="number" class="form-control"
																id="input_author" placeholder="?????? ???????????? ?????????" />
															<div class="input-group-append">
																<button class="btn btn-success" type="button" id="search_btn" onclick="enrollAuthorInBook()">????????????</button>
															</div>
														</div>
													</form>
												</div>
												<div class="row mt-2 author_input">
													<div class="col">
														<div class="alert alert-success author_input_wrap" role="alert">
															<h4 class="alert-heading">?????? ?????? ??????</h4>
															<hr/>
															<div class="author_input_res"></div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="book_input row mb-2">
											<div class="col-3 input_label">?????? ?????? ??????</div>
											<div class="col mb-1">
												<input type="file" name="bookImg" id="book_img" />
											</div>
										</div>
									</div>
									<div class="book_input row mb-2">
										<div class="col-3"></div>
										<div class="col">
										</div>
									</div>
									<div class="col btn-group">
										<button class="btn btn-success btn-lg" type="button" onclick="enrollBook()">????????????</button>
										<button class="btn btn-warning btn-lg" type="reset">????????????</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="col-4">
					<!-- ???????????? -->
					<div class="row">
						<div class="h2 font-weight-bold text-danger">
							?????? ??????
						</div>
					</div>
					<div class="row d-flex mt-2">
						<div class="card shadow">
							<div class="card-body">
								<div class="h4 font-weight-bold">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
										class="bi bi-exclamation-diamond-fill" viewBox="0 0 16 16">
										<path
											d="M9.05.435c-.58-.58-1.52-.58-2.1 0L.436 6.95c-.58.58-.58 1.519 0 2.098l6.516 6.516c.58.58 1.519.58 2.098 0l6.516-6.516c.58-.58.58-1.519 0-2.098L9.05.435zM8 4c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995A.905.905 0 0 1 8 4zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
									</svg>
									???????????? ?????? ??????
								</div>
								<p>
									??????/?????????/????????? ??? ????????? ??????????????? ?????? ???????????? ???????????? ????????? ??????????????????. ???????????? ????????? ????????? ???????????? ????????? ?????????, ???
									???????????? ????????? ???????????????
									??????????????????.
								</p>
								<table class="table-bordered">
									<tr class="bg-danger text-white">
										<th>????????????</th>
										<th>??????</th>
										<th>??????</th>
										<th>??????</th>
										<th>????????????</th>
									</tr>
									<tr>
										<td>4</td>
										<td>?????????</td>
										<td>??????</td>
										<td>????????????</td>
										<td>1999??? 1??? 15???</td>
									</tr>
								</table>
								<strong>(???????????? ???????????? ?????? ?????? 4??? ??????)</strong>
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