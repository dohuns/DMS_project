<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#myWrite").attr("style", "color:black;");
		$("#myReply").attr("style", "color:black;");
		$("#myReplyWrite").attr("style", "color:#5bc0de;");
	});
</script>
</head>
<body>

	<c:choose>
		<c:when test="${param.artiNum == null}">
			<c:set var="artiNum" value="0" />
			<c:set var="next" value="0" />
		</c:when>
		<c:otherwise>
			<c:set var="artiNum" value="${param.artiNum}" />
			<c:set var="next" value="${param.next}" />
		</c:otherwise>
	</c:choose>

	<table style='width: 760px;'>
		<colgroup>
			<col>
			<col style='width: 120px'>
			<col style='width: 100px'>
			<col style='width: 80px'>
		</colgroup>
		<thead>
			<tr style='height: 40px;'>
				<th style='text-align: center;'>제목</th>
				<th style='text-align: center;'>작성자</th>
				<th style='text-align: center;'>작성일</th>
				<th style='text-align: center;'>조회</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${myComBoardList != '[]'}">
					<c:forEach var="list" items="${myComBoardList}">
						<tr>
							<td colspan="1" align="left"><div
									style="display: flex; font-size: 15px; height: 35px; align-items: center;">
									<div style="width: 70px;">${list.b_num }</div>
									<div>
										<a href="/movie/board/show?b_num=${list.b_num }">${list.b_title }
											<span style="color: red;">[${list.b_comCount}]</span>
										</a>
									</div>
								</div></td>
							<td align="center">${list.b_nick }</td>
							<td align="center">${list.b_date }</td>
							<td align="center">${list.b_hit }</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="4">
							<div style="display: flex; margin-top: 10px;">
								<div style="width: 100%;" align="right">
									<a href="#" class="btn btn-info btn-sm" style="color: white;">글
										쓰기</a>
								</div>
							</div>

						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4" height="100" align="center">댓글을 남기신 게시글이
							없습니다.</td>
					</tr>
					<tr>
						<td colspan="4" align="right"
							style="border-bottom: 1px solid #fff; padding-top: 10px;"><a
							href="#" class="btn btn-info btn-sm" style="color: white;">글
								쓰기</a></td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>

	<div class="text-center">
		<ul class="pagination">
			<%-- 이전 버튼 --%>
			<li><c:if test="${artiNum>9}">
					<a class="b"
						href="myList?id=${param.id }&page=3&next=${next-1}&artiNum=${(next-1)*10+9}">«</a>
				</c:if></li>
			<%--게시판 15개 나눈 모음(?) 번호 --%>
			<c:choose>
				<c:when test="${count > next*10+10 }">
					<c:forEach begin="${next*10+1}" end="${next*10+10}" step="1"
						var="cnt">
						<li
							class='<c:out value="${artiNum == cnt-1 ? 'active' : ''}"></c:out>'><a class="b"
							href="myList?id=${param.id }&page=3&next=${next}&artiNum=${cnt-1}">${cnt}</a></li>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach begin="${next*10+1}" end="${count}" step="1" var="cnt">
						<li
							class='<c:out value="${artiNum == cnt-1 ? 'active' : ''}"></c:out>'><a class="b"
							href="myList?id=${param.id }&page=3&next=${next}&artiNum=${cnt-1}">${cnt}</a></li>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<%-- 다음 버튼 --%>
			<li><c:if test="${count > next*10+10 }">
					<a class="b"
						href="myList?id=${param.id }&page=3&next=${next+1}&artiNum=${(next+1)*10}">»</a>
				</c:if></li>
		</ul>
	</div>
</body>
</html>