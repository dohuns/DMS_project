<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
a {
	cursor: pointer;
}

a:link, a:visited, a:active {
	text-decoration: none;
	color: black;
}
/* #5bc0de */
a:hover {
	text-decoration: underline;
	color: black;
}

th, td {
	border-top: 1px solid black;
	border-bottom: 1px solid #eee;
}
</style>
</head>
<body>


	<!-- 로그인 확인 -->
	<c:if test="${sessionScope.m_id == null}">
		<script type="text/javascript">
			alert("로그인을 해주세요");
			location.href = "login";
		</script>
	</c:if>
	<c:if test="${userInfo.m_rankNum == 5}">
		<script type="text/javascript">
			alert("탈퇴한 회원입니다.");
			history.go(-1);
		</script>
	</c:if>

	<div class="container">
		<c:import url="../default/header.jsp" />
		<div style="display: flex;">
			<!-- 사이드바 -->
			<div>
				<c:import url="/sidebar" />
			</div>
			<div>
				<!-- 내가 쓴 글 페이지 -->
				<div style="width: 810px; padding: 20px;">
					<div style="display: flex;">
						<div>
							<c:choose>
								<c:when test="${userInfo.m_picture != null}">
									<img src="/img/memberImage/${userInfo.m_picture}" width="80"
										height="80" alt="프로필사진" style="border-radius: 100%">
								</c:when>
								<c:otherwise>
									<img
										src="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_70.png"
										width="80" height="80" alt="프로필사진">
								</c:otherwise>
							</c:choose>
						</div>

						<div style="margin-left: 20px;">
							<span style="font-size: 30px;"><b>${userInfo.m_nick }</b></span>
							<div>
								<span style="font-size: 15px;"> ${userInfo.m_rank} </span>
								<div>
									<span>총 게시글 <em style="color: red;">${boardcount}</em>개
									</span><span style="color: #eee;"> | </span><span>총 댓글 <em
										style="color: red;">${replycount}</em>개
									</span>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<c:choose>
						<c:when test="${sessionScope.m_id eq param.id }">
							<div style="font-size: 15px; color: black;">
								<a href="myList?id=${param.id }&page=1" id="myWrite"
									style="color: black;">작성글</a><span style="color: #eee;">
									| </span><a href="myList?id=${param.id }&page=2" id="myReply"
									style="color: black;">작성 댓글</a><span style="color: #eee;">
									| </span><a href="myList?id=${param.id }&page=3" id="myReplyWrite"
									style="color: black;">댓글단 글</a>
							</div>
						</c:when>
						<c:otherwise>
							<div style="font-size: 15px; color: black;">
								<a href="myList?id=${param.id }&page=1" id="myWrite"
									style="color: black;">작성글</a><span style="color: #eee;">
									| </span><a href="myList?id=${param.id }&page=3" id="myReplyWrite"
									style="color: black;">댓글단 글</a>
							</div>
						</c:otherwise>
					</c:choose>

					<div class="list" style="padding-top: 10px;">
						<c:choose>
							<c:when test="${param.page == 1 }">
								<c:import url="/myWrite" />
							</c:when>
							<c:when test="${param.page == 2 }">
								<c:import url="/myReply" />
							</c:when>
							<c:otherwise>
								<c:import url="/myReplyWrite" />
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>