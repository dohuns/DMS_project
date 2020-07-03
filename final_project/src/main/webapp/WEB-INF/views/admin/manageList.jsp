<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
</head>
<body>
	<c:import url="../default/adminHeader.jsp"></c:import>
	<!-- 회원 관리 페이지 -->
	<div class="main-body-content w-100 ets-pt bg-light">
		<div class="table-responsive">
			<button type="button" class="btn" onclick="location.href='insMember'">회원 추가</button>
			<button type="button" class="btn" onclick="location.href='updMember'">회원 수정</button>
			<button type="button" class="btn" onclick="location.href='delMember'">회원 삭제</button>
		</div>
	</div>
</body>
</html>