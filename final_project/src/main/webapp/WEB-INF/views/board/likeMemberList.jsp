<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css?after">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	
	<c:forEach var="list" items="${likeMemberList}">
		<c:choose>
			<c:when test="${list.l_divLike == 'L'}">
				=======추천 유저=======	 <br>
				${list.l_id} <br>
			</c:when>
			<c:otherwise>
				=======비추천 유저======= <br>
				${list.l_id} <br>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	

</body>
</html>