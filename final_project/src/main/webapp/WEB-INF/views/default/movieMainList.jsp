<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainList</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
tr{
border-bottom: #eee solid 1px;
}
td, th{
padding: 5px;
}

</style>
</head>
<body>
	<div style="width: 810px; margin-top: 30px;">
		<div style="border-bottom: solid 2px black; display: flex;">
			<div style="width: 740px; padding-left: 10px;">
				<h3 style="font-size: 18px;"><b>게시글</b></h3>
			</div>
			<div style="width: 70px; padding-top: 20px;" align="right">
				<a href="/movie/board/list?b_category=&b_article=전체"
					style="font-size: 12px;">더보기 ></a>
			</div>
		</div>

		<table class="table-none">
			<colgroup>
				<col style='width: 140px;'>
				<col style='width: 310px;'>
				<col style='width: 140px;'>
				<col style='width: 120px;'>
				<col style='width: 100px;'>
			</colgroup>
			<tr style="background-color:#f0f0f0;">
				<th align="center">게시판</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="dto" items="${listMainAll}" end="4">
				<tr>
					<td><a
						href="board/list?b_category=${dto.b_category}&b_article=${dto.b_article}">
							${dto.b_article} </a></td>
					<td><c:choose>
							<c:when test="${dto.b_reNum == 0 }">
								<div>
									<a href="board/show?b_num=${dto.b_num}"> ${dto.b_title} </a> <label style="color: red;">[${dto.b_comCount}]</label>
								</div>
							</c:when>
							<c:otherwise>
								<div style="margin-left:${dto.b_reNum*10}px;">
									└<a href="board/show?b_num=${dto.b_num}"> ${dto.b_title} </a> <label style="color: red;">[${dto.b_comCount}]</label>
								</div>
							</c:otherwise>
						</c:choose></td>
					<td><a href="/movie/myList?id=${dto.b_id}&page=1">${dto.b_nick}</a></td>
					<td>${dto.b_date}</td>
					<td>${dto.b_hit}</td>
				</tr>
			</c:forEach>
		</table>

	</div>
</body>
</html>