<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 목록</title>
	<style>
		.main-body-content-dms {
			display: inline-block;
			padding: 15px;
			background-color: #EEF4FB;
			height: 100vh;
			padding-left: 110px;
			transition: ease 0.5s;
		}

		ul li {
			list-style-type: none;
			float: right;
			margin-left: 20px;
		}
		
		li a {
			font-size: 15px;
			color: #000;
			font-weight: bold;
			padding: 10px;
		}
	</style>
</head>
<body>
	<c:import url="../default/adminHeader.jsp"></c:import>
	<!-- 회원 목록 페이지 -->
	<div class="main-body-content-dms w-100 ets-pt bg-light">
		<div class="table-responsive">
			<h3><b>회원 목록</b></h3>
			<table class="table">
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>생년월일</th>
					<th>이메일</th>
					<th>등급</th>
				</tr>
				<c:forEach var="list" items="${memberList}">
					<tr>
						<td>${list.m_rn}</td>
						<td>${list.m_id}</td>
						<td>${list.m_pw}</td>
						<td>${list.m_name}</td>
						<td>${list.m_nick}</td>
						<td>${list.m_birth}</td>
						<td>${list.m_email}</td>
						<td>
							<c:choose>
								<c:when test="${list.m_rank == 1}">
									관리자
								</c:when>
								<c:when test="${list.m_rank == 2}">
									스탭
								</c:when>
								<c:when test="${list.m_rank == 3}">
									일반 회원
								</c:when>
								<c:otherwise>
									대기 회원
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>