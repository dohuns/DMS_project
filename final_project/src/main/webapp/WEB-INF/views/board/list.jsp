<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div align="center">
			<strong>${param.b_article}게시판</strong>
			<div>
				<table>
					<tr>
						<th>글 번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<c:forEach var="dto" items="${list}">
						<!-- null인 애들은 카테고리나 게시판임 -->
						<c:if test="${dto.b_title != null}"> 
						<tr>
							<td>${dto.b_num}</td>
							<td>${dto.b_title}</td>
							<td>${dto.b_nick}</td>
							<td>${dto.b_date}</td>
							<td>${dto.b_hit}</td>
						</tr>
						</c:if>
					</c:forEach>					
					<tr>
						<td colspan="5" align="right">
							<a href="write?b_category=${param.b_category}&b_article=${param.b_article}" class="btn btn-info btn-sm">글 쓰기</a>
						</td>
					</tr>
				</table>		
			</div>	
		</div>
	</div>
	
</body>
</html>