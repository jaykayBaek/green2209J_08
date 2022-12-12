<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
	<style>
		th{
            background-color: #ffff3f;
            font-size:1rem;
		}
	</style>
</head>
<body>
	<jsp:include page="/include/nav.jsp"/>
    <div class="container">
        <div class="row">
            <nav class="col-2">
           		<jsp:include page="homeNav.jsp"/>
            </nav>
            <div class="col-10">
		        <table class="table table-bordered mt-3">
		            <tbody>
		                <tr>
		                    <th>이름</th>
		                    <td>백정광</td>
		                </tr>
		                <tr>
		                    <th>이메일</th>
		                    <td>jaykaybaek@gmail.com</td>
		                </tr>
		                <tr>
		                    <th>비밀번호 변경</th>
		                    <td>
		                    	<form>
	                			    <div class="row mb-2">
	                			    	<div class="col">
	                			    		<p>현재 비밀번호</p>
				                            <input type="password" class="form-control" id="pwd_now" name="pwdNow"/>
	                			    	</div>
			                            <div class="col pwd_now_demo"></div>
			                        </div>
			                        <div class="row mb-2">
			                        	<div class="col">
			                        	
				                            <input type="password" class="form-control" id="pwd_new" name="pwdNow"/>
			                        	</div>
			                        	<div class="col pwd_new_demo"></div>
			                        </div>
			                        <div class="row mb-2">
			                        	<div class="col">
				                            <input type="password" class="form-control" id="pwd_re" name="pwdNow"/>
			                        	</div>
			                        	<div class="col pwd_re_demo"></div>
			                        </div>
		                            <button typle="button" class="btn btn-success form-control">비밀번호 변경</button>
		                    	</form>
		                    </td>
		                </tr>
		                <tr>
		                    <th>직업/종사분야 변경</th>
		                    <td>
		                        <select class="form-control" id="job" name="job">
		                            <option value="none">직업이나 종사하시는 분야를 선택해주세요</option>
		                            <option value="학생">학생</option>
		                            <option value="회사원">회사원</option>
		                            <option value="전업주부">전업주부</option>
		                            <option value="공무원">공무원</option>
		                            <option value="의사">의사</option>
		                            <option value="금융업">금융업</option>
		                            <option value="it">it</option>
		                            <option value="군인">군인</option>
		                            <option value="법조인">법조인</option>
		                            <option value="세무인">세무인</option>
		                            <option value="자영업">자영업</option>
		                            <option value="기타">기타</option>
		                        </select>
		                    </td>
		                </tr>
		            </tbody>
		        </table>
        	</div>
   		</div>
	</div>
</body>
</html>