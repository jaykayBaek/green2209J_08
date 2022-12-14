<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<style>
	.badge-recomend{
		background-color:#80B918;
		color: #fff;
	}
</style>
<div class="container">
	<div class="row border-bottom">
		<div class="col-2 p-3">
			<span class=" h2 font-weight-bolder title">도서</span>
		</div>
		<div class="col-10 d-flex justify-content-end align-items-center">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hdd-stack-fill" viewBox="0 0 16 16">
			  <path d="M2 9a2 2 0 0 0-2 2v1a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-1a2 2 0 0 0-2-2H2zm.5 3a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm2 0a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zM2 2a2 2 0 0 0-2 2v1a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2H2zm.5 3a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1zm2 0a.5.5 0 1 1 0-1 .5.5 0 0 1 0 1z"/>
			</svg>
			<div class="ml-1"> 전체 카테고리</div>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col h4 font-weight-bolder title p-3">
			<span class="badge badge-pill badge-recomend pt-2 pb-2">추천</span>
		</div>
	</div>
</div>