<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-applesdgothicneo@1.0.3/css/all.min.css">
  <jsp:include page="bs4.jsp"></jsp:include>
  <script>
  	'use strict';
  	let close_popup = () => {
  		const isChecked = $('#chk_popup').is(':checked');
  		if(isChecked){
  			let date = new Date();
			date.setHours(24);
  			document.cookie = "popUpChk=true; expires="+date.toGMTString();
  		}
  		else{
  			alert(document.cookie);
  		}
  	}
  </script>
  <style>
    body{
      font-family: 'Helvetica', 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif !important;
      margin:0px;
      padding:0px;
      background-color: #8D9CA8;
      color:#fff;
    }
    a{
      text-decoration: none;
      color:#fff;
    }
    .top{
      display: flex;
      align-items : center;
      justify-content: center;
    }
    .bottom{
      display: flex;
      flex-flow: row wrap;
      justify-content: space-between;
      padding: 0.5em;
      height: 5vh;
    }
  </style>
</head>
<body>
  <div class="top">
    <img src="../images/popup.png" alt="크리스마스 이벤트 홍보지" width="400px"/>
  </div>
  <div class="bottom">
  	<div>
	    <label>
	      오늘은 그만볼래요
	      <input type="checkbox" name="chk_popup" id="chk_popup" value="HTML">
	    </label>
  	</div>
  	<div>
	    <a href="javascript: close_popup()">
	      <span>
	        닫기
	      </span>
	    </a>
  	</div>
  </div>
</body>
</html>