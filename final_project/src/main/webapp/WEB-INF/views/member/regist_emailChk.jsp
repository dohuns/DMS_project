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
	<c:if test="${sessionScope.m_id != null}">
		<script type="text/javascript">
			alert("정상적인 경로를 이용해주세요")
			location.href = "/movie"
		</script>
	</c:if>
	<c:import url="/header" />
	<div align="center" style="margin-top: 80px;">
	<div class="container" style="width: 500px;">
		<div style="margin-bottom: 50px;">
			<h1>인증번호 입력 페이지</h1>
		</div>
		<div align="left">
			${dice}
			<form action="chk_certification/${dice}" method="POST" style="width:500px;">
				<input type="text" name="certificationNum" placeholder="인증번호를 입력하세요" class="form-control"><br>
				<button type="submit" class="btn btn-info">인증하기</button>
			</form>
		</div>
	</div>

	</div>
</body>
</html>