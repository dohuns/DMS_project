<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DOMISU 관리자 페이지</title>
	<style>
		html, body, div {
			height: 95%;
		}
		body #mainContent {
			height: 95%;
		}
		.mainContent {
			display: flex;
			height: 100%;
		}
		.mainBoard {
			width: 100%;
			min-width: 800px;
			margin: 50px 0 50px 250px;
		}
		.mainBoard .table-st {
			width: 95%;
			margin: 28px 20px;
			border: 1px solid #DDD;
			border-radius: 10px;
			border-collapse: inherit;
		}
		.mainBoard .table-st tr>th,
		.mainBoard .table-st tr>td {
			padding: 8px;
			text-indent: 20px;
		}
		.mainBoard .table-st tr>th {
			font-size: 14px;
			background-color: #DDD;
 			border-radius: 10px 10px 0 0;
		}
		.mainBoard .table-st tr>th>a,
		.mainBoard .table-st tr>th>a:hover,
		.mainBoard .table-st tr>th>a:focus,
		.mainBoard .table-st tr>th>a:active {
			color: black;
			float: right;
			margin-right: 10px;
			text-decoration: none;
		}
		.mainBoard .table-st tr>td {
			border-top: 1px solid #DDD;
		}
	</style>
</head>
<body>
	<div>
		<c:import url="../default/adminHeader.jsp" />
		<div id="mainContent">
			<div class="mainContent">
				<c:import url="../default/adminSidebar.jsp" />
				<div class="mainBoard">
					<div style="width: 940px; padding: 40px;">
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
							style="color: black;">작성글</a><span style="color: #eee;"> |
						</span><a href="myList?id=${param.id }&page=2" id="myReply"
							style="color: black;">작성 댓글</a><span style="color: #eee;">
							| </span><a href="myList?id=${param.id }&page=3" id="myReplyWrite"
							style="color: black;">댓글단 글</a>
					</div>
				</c:when>
				<c:otherwise>
					<div style="font-size: 15px; color: black;">
						<a href="myList?id=${param.id }&page=1" id="myWrite"
							style="color: black;">작성글</a><span style="color: #eee;"> |
						</span><a href="myList?id=${param.id }&page=3" id="myReplyWrite"
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
	</div>
</body>
</html>