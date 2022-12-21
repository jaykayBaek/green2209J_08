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
	<script>

	$(function(){
		let nowPwdCheck = false;
		let newPwdCheck = false;
		let rePwdCheck = false;
		
		
			$('#pwd_now').on("blur", function(){
				let pwdNow = $("#pwd_now").val();
				if(pwdNow.trim() == ""){
					alert("비밀번호를 입력해주세요.");
					nowPwdCheck = false;
					return;
				}
				$.ajax({
					type:"post",
					url :"${ctp}/checkPassword.member",
					data:{password:pwdNow},
					success:function(res){
						if(res == 'fail'){
							alert('기존의 비밀번호가 일치하지 않습니다!');
							nowPwdCheck = false;
							return false;
						}
						else{
							nowPwdCheck = true;
						}
					},
					error:function() {
						alert("서버의 오류");
					}
				});
			});
			$('.change-pwd-btn').on("click", function(){
				let pwdNew = $("#pwd_new").val();
				let pwdRe = $("#pwd_re").val();
				const regPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
				if(!pwdRe.match(regPwd)){
					alert('비밀번호 양식을 다시 확인해주세요.');
					return;
				}
				else if (pwdRe!=pwdNew){
					alert('새 비밀번호가 동일하지 않습니다! 다시 확인해주세요.');
					return;
				}
				$.ajax({
					type:"post",
					url :"${ctp}/changePassword.member",
					data:{pwdRe:pwdRe},
					success:function(res){
						if(res == 'fail'){
							alert('비밀번호 변경을 실패했습니다.');
							return;
						}
						
						alert('비밀번호가 변경되었습니다.');
						location.reload();

					},
					error:function() {
						alert("서버의 오류");
					}
				});
			});
			
			$('.change-job-btn').on("click", function(){
				let job = $("#job").val();
				if(job == 'none'){
					alert('직업을 선택하세요');
					return false;
				}
				$.ajax({
					type:"post",
					url :"${ctp}/changeJob.member",
					data:{job:job},
					success:function(res){
						if(res == 'fail'){
							alert('직업 변경을 실패했습니다.');
							return;
						}
						
						alert('직업이 변경되었습니다.');
						location.reload();
					},
					error:function() {
						alert("서버의 오류");
					}
				});
				
			});
			
		});
	</script>
</head>
<body>
	<jsp:include page="/include/nav.jsp"/>
    <div class="container">
        <div class="row">
            <nav class="col-2">
           		<jsp:include page="homeNav.jsp"/>
            </nav>
            <div class="col-10 modify">
		        <table class="table table-bordered mt-3">
		            <tbody>
		                <tr>
		                    <th>이름</th>
		                    <td class="d-flex justify-content-between">
		                    	<div>${vo.nameUser}</div>
		                    	<div><a href="${ctp}/leave.member">회원 탈퇴</a></div>
		                    </td>
		                </tr>
		                <tr>
		                    <th>이메일</th>
		                    <td>${vo.email}</td>
		                </tr>
		                <tr>
		                    <th>비밀번호 변경</th>
		                    <td>
                			    <div class="row mb-2">
                			    	<div class="col">
			                            <input type="password" class="form-control" id="pwd_now" name="pwdNow" placeholder="현재 비밀번호"/>
                			    	</div>
		                        </div>
		                        <div class="row mb-2">
		                        	<div class="col">
		                        	
			                            <input type="password" class="form-control" id="pwd_new" name="pwdNew" placeholder="새 비밀번호"/>
		                        	</div>
		                        </div>
		                        <div class="row mb-2">
		                        	<div class="col">
			                            <input type="password" class="form-control" id="pwd_re" name="pwdRe" placeholder="새 비밀번호 확인"/>
		                        	</div>
		                        </div>
		                        <div class="row mb-2">
		                        	<div class="col">
		                        		<span>
			                        		<p>
												<strong>비밀번호 변경 시 유의사항</strong>
											</p>	
											8자 이상, 하나 이상의 문자/숫자/특수문자로 입력해주세요.
		                        		</span>
		                        	</div>
		                        </div>
	                            <button type="button" class="btn btn-success form-control change-pwd-btn">비밀번호 변경</button>
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
	                            <button type="button" class="btn btn-success form-control mt-2 change-job-btn">직업 변경</button>
		                    </td>
		                </tr>
		            </tbody>
		        </table>
			        
        	</div>
   		</div>
	</div>
	<jsp:include page="/include/footer.jsp"/>
</body>
</html>